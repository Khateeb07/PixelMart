/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import pixelmart.beans.CategoryInfo;

/**
 *
 * @author khateeb
 */
public class ProductCategoryModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try (PrintWriter out = res.getWriter()) {
            String type = req.getParameter("type");
            MyDAO dao = new MyDAO();
            dao.toConnect();
            String query;
            PreparedStatement pstm = null;
            ResultSet rs = null;
            if (type != null && "json".equals(type)) {    //Loads Categories for Product Upload Modal and Navbar Dropdown
                query = "SELECT product_category_id, product_category_name FROM category_table";
                pstm = dao.con.prepareStatement(query);
                rs = dao.toFetch(pstm);
                JSONArray arr = new JSONArray();
                while (rs.next()) {
                    JSONObject jsonobj = new JSONObject();
                    jsonobj.put("id", rs.getInt("product_category_id"));
                    jsonobj.put("name", rs.getString("product_category_name"));
                    arr.add(jsonobj);
                }
                dao.toClose();
                out.println(arr.toJSONString());
            } else if (type != null && "data".equals(type)) {   // Fetches DATA from DB and sends to subcategories.jsp
                int subcatid = Integer.parseInt(req.getParameter("subcatid"));
                CategoryInfo cat = dao.getCategoryData(subcatid);
                req.setAttribute("catname", cat.getCatName());
                req.setAttribute("catid", cat.getCatId());
                req.setAttribute("subcatname", cat.getSubcatName());
                req.setAttribute("subcatid", cat.getSubcatId());
                req.getRequestDispatcher("subcategory").forward(req, res);
                return;
            } else if (type == null) { // Fetches Cat NAME using Cat ID & sends to subcategories.jsp
                int catid = Integer.parseInt(req.getParameter("catid"));
                query = "SELECT product_category_name FROM category_table WHERE (product_category_id=?);";
                pstm = dao.con.prepareStatement(query);
                pstm.setInt(1, catid);
                rs = dao.toFetch(pstm);
                if (rs.next()) {
                    req.setAttribute("catname", rs.getString("product_category_name"));
                }
                dao.toClose();
                req.setAttribute("catid", catid);
                req.getRequestDispatcher("category").forward(req, res);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
