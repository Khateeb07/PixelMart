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

/**
 *
 * @author zed
 */
public class ProductSubcategoryModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try (PrintWriter out = res.getWriter()) {
            String cid = req.getParameter("catid");
            String driver = "com.mysql.cj.jdbc.Driver";
            MyDAO dao = new MyDAO();
            dao.toConnect(driver);
            String query = "SELECT * FROM subcategory_table WHERE(product_category_id=?)";
            PreparedStatement pstm = dao.con.prepareStatement(query);
            pstm.setString(1, cid);
            ResultSet rs = dao.toFetch(pstm);
            JSONArray arr = new JSONArray();
            while (rs.next()) {
                JSONObject jsonobj = new JSONObject();
                jsonobj.put("id", rs.getInt("product_subcategory_id"));
                jsonobj.put("name", rs.getString("product_subcategory_name"));
                jsonobj.put("gst", rs.getString("product_gst_rate"));
                arr.add(jsonobj);
            }
            dao.toClose();
            out.println(arr.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
