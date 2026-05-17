/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

// For image conversion to JSON
import java.io.File;
import java.nio.file.Files;
import java.util.Base64;

/**
 *
 * @author zed
 */
public class ProductLoadModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String driver = "com.mysql.cj.jdbc.Driver";
        MyDAO dao = new MyDAO();
        try (PrintWriter out = res.getWriter()) {
            dao.toConnect(driver);
            String query = "SELECT product_name, product_brand, product_price, product_description, product_image_path FROM product_table WHERE(product_subcategory_id=?);";
            PreparedStatement pstm = dao.con.prepareStatement(query);
            pstm.setInt(1, 101);
            ResultSet rs = dao.toFetch(pstm);
            JSONArray jsonarr = new JSONArray();
            while (rs.next()) {
                String pname = rs.getString("product_name");
                String pbrnd = rs.getString("product_brand");
                String pslpr = rs.getString("product_price");
                String pdesc = rs.getString("product_description");
                String pimgp = rs.getString("product_image_path");
                System.out.println(pname + "\t" + pbrnd + "\t" + pslpr + "\t" + pdesc + "\t" + pimgp);
                JSONObject jsonobj = new JSONObject();
                jsonobj.put("product_name", pname);
                jsonobj.put("product_brand", pbrnd);
                jsonobj.put("product_price", pslpr);
                jsonobj.put("product_description", pdesc);
                jsonobj.put("product_image_data", encodeImageToBase64(pimgp));
                jsonarr.add(jsonobj);
            }
            dao.toClose();
            out.println(jsonarr.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String encodeImageToBase64(String imagePath) throws Exception {
        File file = new File(imagePath);
        byte[] fileContent = Files.readAllBytes(file.toPath());
        return Base64.getEncoder().encodeToString(fileContent);
    }
}
