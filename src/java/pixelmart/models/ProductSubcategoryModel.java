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
import java.util.ArrayList;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author khateeb
 */
public class ProductSubcategoryModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try (PrintWriter out = res.getWriter()) {
            String cid = req.getParameter("catid");
            String type = req.getParameter("type");
            MyDAO dao = new MyDAO();
            dao.toConnect();
            String query = "SELECT * FROM subcategory_table WHERE(product_category_id=?)";
            PreparedStatement pstm = dao.con.prepareStatement(query);
            pstm.setString(1, cid);
            ResultSet rs = dao.toFetch(pstm);
            JSONArray arr = new JSONArray();
            switch (type) {
                case "json": { 
                    // For Subcategory Dropdown in Product Upload Modal
                    // For Subcat Id and Name in Subcategory Cards
                    while (rs.next()) {
                        JSONObject jsonobj = new JSONObject();
                        jsonobj.put("id", rs.getInt("product_subcategory_id"));
                        jsonobj.put("name", rs.getString("product_subcategory_name"));
                        arr.add(jsonobj);
                    }
                    dao.toClose();
                    out.println(arr.toJSONString());
                    break;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
