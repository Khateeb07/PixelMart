/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.*;

/**
 *
 * @author zed
 */
public class ProductDataModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String pname = req.getParameter("product_name");
        String bname = req.getParameter("product_brand");
        String psubcat = req.getParameter("product_subcategory");
        String pprice = req.getParameter("product_price");
        String psellprice = req.getParameter("product_selling_price");
        String pqty = req.getParameter("product_quantity");
        String pwarr = req.getParameter("product_warranty");
        String pdimsn = req.getParameter("product_dimensions");
        String pwt = req.getParameter("product_weight");
        String pdesc = req.getParameter("product_description");

        System.out.println(pname);
        System.out.println(bname);
        System.out.println(psubcat);
        System.out.println(pprice);
        System.out.println(psellprice);
        System.out.println(pqty);
        System.out.println(pwarr);
        System.out.println(pdimsn);
        System.out.println(pwt);
        System.out.println(pdesc);

        String driver = "com.mysql.cj.jdbc.Driver";
        try (PrintWriter out = res.getWriter()) {
            MyDAO dao = new MyDAO();
            dao.toConnect(driver);

            // Fetching product id
            String query = "SELECT product_id FROM product_table ORDER BY product_id DESC LIMIT 1";
            PreparedStatement pstm = dao.con.prepareStatement(query);
            ResultSet rs = dao.toFetch(pstm);
            int pid = 1;
            if (rs.next()) {
                pid = rs.getInt("product_id");
                pid++;
            }
            System.out.println(pid);
            query = "SELECT product_category_id FROM subcategory_table WHERE(product_subcategory_id=?);";
            pstm = dao.con.prepareStatement(query);
            pstm.setString(1, psubcat);
            rs = dao.toFetch(pstm);
            String catdir = "";
            if (rs.next()) {
                catdir = rs.getString("product_category_id");
            }
            // Image File storing in file system and fetching image path
            final String path = "/home/zed/myDir/pixelmartdb" + File.separator + catdir + File.separator + psubcat;    // Path where the image will be stored
            File f = new File(path);
            if (!f.isDirectory()) {
                f.mkdir();
            }
            final Part filepart = req.getPart("product_image");
            final String filename = getFileName(filepart);
            String imgpath = path + File.separator + filename;
            OutputStream opstream = new FileOutputStream(new File(imgpath));
            InputStream filecontent = null;
            filecontent = filepart.getInputStream();
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = filecontent.read(bytes)) != -1) {
                opstream.write(bytes, 0, read);
            }

            // Database entry in product table
            query = "INSERT INTO product_table VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            pstm = dao.con.prepareStatement(query);
            pstm.setInt(1, pid);
            pstm.setString(2, pname);
            pstm.setString(3, psubcat);
            pstm.setString(4, pprice);
            pstm.setString(5, imgpath);
            pstm.setString(6, pdesc);
            pstm.setString(7, bname);
            pstm.setString(8, pwarr);
            pstm.setString(9, pqty);
            pstm.setNull(10, java.sql.Types.DECIMAL);
            pstm.setString(11, psellprice);
            pstm.setString(12, pdimsn);
            pstm.setString(13, pwt);
            dao.toFetch2(pstm);
            dao.toClose();

            // Need to maitain session on dispatch
            req.getSession();
            req.getRequestDispatcher("seller").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private String getFileName(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
