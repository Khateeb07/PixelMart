/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author zed
 */
public class SignInModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String eml = req.getParameter("emailin");
            String pass = req.getParameter("passin");
            String driver = "com.mysql.cj.jdbc.Driver";

            MyDAO dao = new MyDAO();
            dao.toConnect(driver);
            String query = "SELECT password, status, uid FROM ecomm_login WHERE(email=?)";
            PreparedStatement pstm = dao.con.prepareStatement(query);
            pstm.setString(1, eml);
            ResultSet rs = dao.toFetch(pstm);
            if (rs.next()) {
                String ps = rs.getString("password");
                if (pass.equals(ps)) {
                    int st = rs.getInt("status");
                    if (st == 1) {
                        req.getSession(true);
                        req.getRequestDispatcher("buyer").forward(req, res);
                    } else {
                        int id = rs.getInt("uid");
                        query = "SELECT firstname FROM ecomm_user WHERE(uid=?)";
                        pstm = dao.con.prepareStatement(query);
                        pstm.setInt(1, id);
                        rs = dao.toFetch(pstm);
                        rs.next();
                        String fn = rs.getString("firstname");
                        req.setAttribute("name", fn);
                        req.getRequestDispatcher("unverifiedusers").forward(req, res);
                    }
                } else {
                    req.setAttribute("vldt", 2);
                    req.getRequestDispatcher("invalidpage").forward(req, res);
                }
            } else {
                req.setAttribute("ureg", 1);
                req.getRequestDispatcher("unreguser").forward(req, res);
            }
            dao.toClose();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
