/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import pixelmart.beans.Product;
import java.sql.*;
import java.io.*;
import java.nio.file.Files;
import java.util.Base64;
import java.util.Properties;

/**
 *
 * @author khateeb
 */
public class MyDAO {

    Connection con = null;

    public Connection toConnect() throws ClassNotFoundException, SQLException, IOException {
        Properties props = new Properties();
        try {
            props.load(MyDAO.class.getResourceAsStream("db.properties"));
            String url = props.getProperty("db.url");
            String username = props.getProperty("db.username");
            String password = props.getProperty("db.password");
            Class.forName(props.getProperty("db.driver"));
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public void toClose() throws SQLException {
        if (con != null) {
            con.close();
        }
    }

    public void toStore(CallableStatement cstm) throws SQLException {
        cstm.execute();
    }

    public ResultSet toFetch(PreparedStatement pstm) throws SQLException {
        return pstm.executeQuery();
    }

    public void toFetch2(PreparedStatement pstm) throws SQLException {
        pstm.executeUpdate();
    }

    public Product getProductById(int pid) {
        Product prod = null;
        try {
            String selectProductQuery = "SELECT * FROM product_table WHERE (product_id=?)";
            PreparedStatement pstm = con.prepareStatement(selectProductQuery);
            pstm.setInt(1, pid);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                prod = new Product();
                prod.setProductId(pid);
                prod.setProductName(rs.getString("product_name"));
                prod.setProductSubcategoryId(rs.getInt("product_subcategory_id"));
                prod.setProductPrice(rs.getDouble("product_price"));
                prod.setProductImagePath(rs.getString("product_image_path"));
                prod.setProductDescription(rs.getString("product_description"));
                prod.setProductBrand(rs.getString("product_brand"));
                prod.setProductWarranty(rs.getString("product_warranty"));
                prod.setProductQuantity(rs.getLong("product_quantity"));
                prod.setProductDiscount(rs.getDouble("product_discount"));
                prod.setProductSellingPrice(rs.getDouble("product_selling_price"));
                prod.setProductDimensions(rs.getString("product_dimensions"));
                prod.setProductWeight(rs.getDouble("product_weight"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return prod;
    }
    
    public String encodeImageToBase64(String imagePath) throws Exception {
        File file = new File(imagePath);
        byte[] fileContent = Files.readAllBytes(file.toPath());
        return Base64.getEncoder().encodeToString(fileContent);
    }
}
