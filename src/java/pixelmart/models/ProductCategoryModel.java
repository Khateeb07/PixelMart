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
public class ProductCategoryModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try (PrintWriter out = res.getWriter()) {

            String driver = "com.mysql.cj.jdbc.Driver";
            MyDAO dao = new MyDAO();
            dao.toConnect(driver);
            String query = "SELECT product_category_id, product_category_name FROM category_table";
            PreparedStatement pstm = dao.con.prepareStatement(query);
            ResultSet rs = dao.toFetch(pstm);
            JSONArray arr = new JSONArray();
            while (rs.next()) {
                JSONObject jsonobj = new JSONObject();
                jsonobj.put("id", rs.getInt("product_category_id"));
                jsonobj.put("name", rs.getString("product_category_name"));
                arr.add(jsonobj);
            }
            dao.toClose();
            out.println(arr.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
