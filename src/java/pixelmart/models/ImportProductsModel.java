/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javax.net.ssl.*;
import java.security.cert.X509Certificate;

/**
 *
 * @author zed
 */
public class ImportProductsModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        disableSSL();
        try {
            // Connecting to the API
            URL url = new URL("https://dummyjson.com/products?limit=200");

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setInstanceFollowRedirects(true);
            conn.setRequestMethod("GET");

            MyDAO dao = new MyDAO();
            String driver = "com.mysql.cj.jdbc.Driver";
            dao.toConnect(driver);

            int responseCode = conn.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuilder response = new StringBuilder();
            while ((line = br.readLine()) != null) {
                response.append(line);
            }
            br.close();

            // JSON Parsing
            JSONParser parser = new JSONParser();
            JSONObject root = (JSONObject) parser.parse(response.toString());
            JSONArray products = (JSONArray) root.get("products");

            String insertQuery = "INSERT INTO product_table ("
                    + "product_id, "
                    + "product_name, "
                    + "product_subcategory_id, "
                    + "product_price, "
                    + "product_image_path, "
                    + "product_description, "
                    + "product_brand, "
                    + "product_warranty, "
                    + "product_quantity, "
                    + "product_discount, "
                    + "product_selling_price, "
                    + "product_dimensions, "
                    + "product_weight"
                    + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = dao.con.prepareStatement(insertQuery);

            HashMap<String, Integer> catMap = new HashMap<>();

            // Electronics
            catMap.put("smartphones", 101);
            catMap.put("laptops", 102);
            catMap.put("tablets", 103);
            catMap.put("mobile-accessories", 108);

            // Fashion
            catMap.put("mens-shirts", 201);
            catMap.put("mens-shoes", 204);
            catMap.put("mens-watches", 205);

            catMap.put("womens-dresses", 202);
            catMap.put("womens-shoes", 204);
            catMap.put("womens-watches", 205);
            catMap.put("womens-bags", 205);
            catMap.put("tops", 202);
            catMap.put("sunglasses", 205);

            // Beauty & Personal Care
            catMap.put("beauty", 501);
            catMap.put("fragrances", 504);
            catMap.put("skin-care", 502);

            // Home & Kitchen
            catMap.put("furniture", 1002);
            catMap.put("home-decoration", 303);
            catMap.put("kitchen-accessories", 301);

            // Grocery
            catMap.put("groceries", 703);

            // Sports
            catMap.put("sports-accessories", 603);

            // Automotive
            catMap.put("motorcycle", 802);
            catMap.put("vehicle", 801);

            String pidQuery = "SELECT product_id FROM product_table ORDER BY product_id DESC LIMIT 1";
            PreparedStatement pstm = dao.con.prepareStatement(pidQuery);
            ResultSet rs = dao.toFetch(pstm);
            int pid = rs.next() ? rs.getInt("product_id") + 1 : 1;

            for (Object obj : products) {
                JSONObject product = (JSONObject) obj;

                String title = product.get("title") != null // Title
                        ? product.get("title").toString() : "Unnamed Product";

                String checkProductQuery = "SELECT product_id FROM product_table WHERE (product_name=?)";
                pstm = dao.con.prepareStatement(checkProductQuery);
                pstm.setString(1, title);
                rs = dao.toFetch(pstm);
                if (rs.next()) {
                    continue;
                }

                String description = product.get("description") != null // Description
                        ? product.get("description").toString() : "No Description";

                String category = product.get("category").toString();   // Category Name

                Integer subcategoryId = catMap.get(category);           // Subcategory Id
                if (subcategoryId == null) {
                    System.out.println("Skipping Unknown Category: " + category);
                    continue;
                }

                // Fetching Category Id
                String catIdQuery = "SELECT product_category_id FROM subcategory_table WHERE (product_subcategory_id=?);";
                pstm = dao.con.prepareStatement(catIdQuery);
                pstm.setInt(1, subcategoryId);
                rs = dao.toFetch(pstm);
                String categoryId = rs.next() ? rs.getString("product_category_id") : "";

                // Path where the image will be stored
                final String path = "/home/zed/myDir/pixelmartdb" + File.separator + categoryId + File.separator + subcategoryId.toString();
                File f = new File(path);
                if (!f.exists()) {
                    f.mkdirs();
                }

                String brand = product.get("brand") != null ? product.get("brand").toString() : "Unknown";  // Brand Name

                // Fetching image url
                JSONArray images = (JSONArray) product.get("images");
                String imageUrl = "";
                if (images != null && !images.isEmpty()) {
                    imageUrl = images.get(0).toString();
                }

                String imageName = title.replaceAll("[^a-zA-Z0-9]", "_") + ".jpg";  // Creating a safe image name

                String imgpath = path + File.separator + imageName;     // Absolute image path

                if (!imageDownloader(imageUrl, imgpath)) {
                    continue;     // Moves forward only if image gets downloaded
                }
                Long stock = (Long) product.get("stock");       // Stock

                Number price = (Number) product.get("price");   // Price
                double actualPrice = price.doubleValue();

                Number discount = (Number) product.get("discountPercentage");   // Discount
                double discountValue = discount.doubleValue();

                double sellingPrice = actualPrice - ((discountValue / 100) * actualPrice);  // Selling Price

                Number weight = (Number) product.get("weight");     // Weight
                double productWeight = weight != null ? weight.doubleValue() : 1.0;

                String warranty = product.get("warrantyInformation") != null // Warranty
                        ? product.get("warrantyInformation").toString() : "No Warranty";

                JSONObject dimensionsObj = (JSONObject) product.get("dimensions");  // Dimensions
                String dimensions = "Standard";
                if (dimensionsObj != null) {
                    dimensions = dimensionsObj.get("width") + " x "
                            + dimensionsObj.get("height") + " x "
                            + dimensionsObj.get("depth");
                }

                ps.setInt(1, pid);
                ps.setString(2, title);
                ps.setInt(3, subcategoryId);
                ps.setDouble(4, actualPrice);
                ps.setString(5, imgpath);
                ps.setString(6, description);
                ps.setString(7, brand);
                ps.setString(8, warranty);
                ps.setLong(9, stock);
                ps.setDouble(10, discountValue);
                ps.setDouble(11, sellingPrice);
                ps.setString(12, dimensions);
                ps.setDouble(13, productWeight);
                dao.toFetch2(ps);
                System.out.println("Inserted Product id: " + pid + " into DB: " + title);
                pid++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Downloads image at the desired image path
    public static final boolean imageDownloader(String thumbnail, String imgpath) {
        try {
            URL imgurl = new URL(thumbnail);
            try (InputStream in = imgurl.openStream(); OutputStream out = new FileOutputStream(imgpath)) {
                byte[] buffer = new byte[1024];
                int read = 0;
                while ((read = in.read(buffer)) != -1) {
                    out.write(buffer, 0, read);
                }
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Disables SSL validation
    public static void disableSSL() {

        try {

            TrustManager[] trustAllCerts
                    = new TrustManager[]{
                        new X509TrustManager() {

                    public X509Certificate[]
                            getAcceptedIssuers() {
                        return null;
                    }

                    public void checkClientTrusted(
                            X509Certificate[] certs,
                            String authType) {
                    }

                    public void checkServerTrusted(
                            X509Certificate[] certs,
                            String authType) {
                    }
                }
                    };

            SSLContext sc
                    = SSLContext.getInstance("SSL");

            sc.init(
                    null,
                    trustAllCerts,
                    new java.security.SecureRandom()
            );

            HttpsURLConnection.setDefaultSSLSocketFactory(
                    sc.getSocketFactory()
            );

            HttpsURLConnection.setDefaultHostnameVerifier(
                    (hostname, session) -> true
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
