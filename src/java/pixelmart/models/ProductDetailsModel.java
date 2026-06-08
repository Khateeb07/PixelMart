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
import pixelmart.beans.CategoryInfo;
import pixelmart.beans.Product;

/**
 *
 * @author khateeb
 */
public class ProductDetailsModel implements Model {

    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        MyDAO dao = new MyDAO();
        try (PrintWriter out = res.getWriter()) {
            dao.toConnect();
            Product product = dao.getProductById(Integer.parseInt(req.getParameter("pid")));
            CategoryInfo cat = dao.getCategoryData(Integer.parseInt(req.getParameter("sid")));
            req.setAttribute("product", product);
            req.setAttribute("category", cat);
            dao.toClose();
            req.getRequestDispatcher("proddisp").forward(req, res);
            return;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
