/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author khateeb
 */
public class SignInModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String eml = req.getParameter("emailin");
            String pass = req.getParameter("passin");

            MyDAO dao = new MyDAO();
            dao.toConnect();
            String query = "SELECT password, status, uid FROM ecomm_login WHERE(email=?)";
            PreparedStatement pstm = dao.con.prepareStatement(query);
            pstm.setString(1, eml);
            ResultSet rs = dao.toFetch(pstm);
            if (rs.next()) {
                String ps = rs.getString("password");
                if (pass.equals(ps)) {
                    int st = rs.getInt("status");
                    if (st == 1) {
                        String nameQuery = "SELECT b.buyer_name FROM buyer_table b INNER JOIN ecomm_login a ON (a.uid=b.buyer_uid) WHERE (a.uid=?);";
                        pstm = dao.con.prepareStatement(nameQuery);
                        pstm.setInt(1, rs.getInt("uid"));
                        rs = dao.toFetch(pstm);
                        rs.next();
                        HttpSession sess = req.getSession(true);
                        sess.setAttribute("name", rs.getString("buyer_name"));
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
