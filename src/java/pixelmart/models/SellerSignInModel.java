/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 *
 * @author zed
 */
public class SellerSignInModel implements Model {
    
    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String em=req.getParameter("emailin");
            String pass=req.getParameter("passin");
            String driver="com.mysql.cj.jdbc.Driver";
            MyDAO dao=new MyDAO();
            dao.toConnect(driver);
            String query="SELECT seller_password FROM seller_table WHERE(seller_email=?)";
            PreparedStatement pstm=dao.con.prepareStatement(query);
            pstm.setString(1, em);
            ResultSet rs=dao.toFetch(pstm);
            if(rs.next()) {
                String ps=rs.getString("seller_password");
                if(pass.equals(ps)) {
                    req.getSession(true);
                    req.getRequestDispatcher("seller").forward(req, res);
                } else {
                    req.setAttribute("vldt", 3);
                    req.getRequestDispatcher("invalidpage").forward(req, res);
                }
            } else {
                req.setAttribute("ureg", 2);
                req.getRequestDispatcher("unreguser").forward(req, res);
            }
            dao.toClose();
        } catch(ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
