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
 * @author khateeb
 */
public class ProductDetailsModel implements Model {

    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int pid = Integer.parseInt(req.getParameter("id"));
        MyDAO dao = new MyDAO();
        try {
            dao.toConnect();
            Product product = dao.getProductById(pid);
            String img = dao.encodeImageToBase64(product.getProductImagePath());
            req.setAttribute("product", product);
            req.setAttribute("imageData", img);
            req.getRequestDispatcher("proddisp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
