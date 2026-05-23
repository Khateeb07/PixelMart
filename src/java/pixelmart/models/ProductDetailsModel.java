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

/**
 *
 * @author zed
 */
public class ProductDetailsModel implements Model {

    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int pid = Integer.parseInt(req.getParameter("pid"));
            MyDAO dao = new MyDAO();
            Product product = dao.getProductById(pid);
            req.setAttribute("product", product);
            req.getRequestDispatcher("").forward(req, res);
            
        } catch (Exception e) {
            
        }
    }
}
