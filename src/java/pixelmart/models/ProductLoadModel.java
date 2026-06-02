/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import pixelmart.beans.Product;
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
 * @author khateeb
 */
public class ProductLoadModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        MyDAO dao = new MyDAO();
        String type = req.getParameter("type");
        String query;
        PreparedStatement pstm = null;
        try (PrintWriter out = res.getWriter()) {
            dao.toConnect();
            switch (type) {
                case "trends": {
                    query = "SELECT p.* "
                            + "FROM product_table p "
                            + "INNER JOIN subcategory_table s "
                            + "ON p.product_subcategory_id = s.product_subcategory_id "
                            + "WHERE s.product_category_id IN (?,?,?,?,?,?) "
                            + "ORDER BY RAND() "
                            + "LIMIT 12";
                    pstm = dao.con.prepareStatement(query);
                    pstm.setInt(1, 1);
                    pstm.setInt(2, 2);
                    pstm.setInt(3, 3);
                    pstm.setInt(4, 5);
                    pstm.setInt(5, 6);
                    pstm.setInt(6, 8);
                    break;
                }
                case "deals": {
                    query = "SELECT * FROM product_table ORDER BY product_discount DESC LIMIT 12";
                    pstm = dao.con.prepareStatement(query);
                    break;
                }
                case "new": {
                    query = "SELECT product_id "
                            + "FROM ("
                            + "   SELECT p.product_id, "
                            + "          s.product_category_id, "
                            + "          ROW_NUMBER() OVER ("
                            + "              PARTITION BY s.product_category_id "
                            + "              ORDER BY p.product_id DESC"
                            + "          ) AS rn "
                            + "   FROM product_table p "
                            + "   INNER JOIN subcategory_table s "
                            + "   ON p.product_subcategory_id = s.product_subcategory_id "
                            + "   WHERE s.product_category_id IN (1,2,3,5,6,8)"
                            + ") t "
                            + "WHERE rn <= 2 "
                            + "ORDER BY product_id DESC";
                    pstm = dao.con.prepareStatement(query);
                }
            } //Switch Ends
            
            ResultSet rs = dao.toFetch(pstm);
            JSONArray jsonarr = new JSONArray();
            while (rs.next()) {
                Product product = dao.getProductById(rs.getInt("product_id"));
                JSONObject jsonobj = new JSONObject();
                jsonobj.put("product_name", product.getProductName());
                jsonobj.put("product_brand", product.getProductBrand());
                jsonobj.put("product_selling_price", product.getProductSellingPrice());
                jsonobj.put("product_discount", product.getProductDiscount());
                jsonobj.put("product_image_data", dao.encodeImageToBase64(product.getProductImagePath()));
                jsonobj.put("product_id", product.getProductId());
                jsonarr.add(jsonobj);
            }
            dao.toClose();
            out.println(jsonarr.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
