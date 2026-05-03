/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.io.IOException;

/**
 *
 * @author zed
 */
public class SignUpModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String email = req.getParameter("emailup");
            String pass = req.getParameter("passup");
            String name = req.getParameter("fname") + " " + req.getParameter("lname");
            String gender = req.getParameter("gender");
            String driver = "com.mysql.cj.jdbc.Driver";
            MyDAO dao = new MyDAO();
            CallableStatement cstm;
            dao.toConnect(driver);
            cstm = dao.con.prepareCall("Call storeData(?, ?, ?, ?, ?, ?, ?)");
            cstm.setString(1, name);
            cstm.setString(2, email);
            cstm.setString(3, pass);
            cstm.setString(4, gender);
            cstm.setInt(5, 0);  // Status: 0 for unverified users
            cstm.setInt(6, 2);  // Category: 1 for seller and 2 for buyer
            cstm.registerOutParameter(7, java.sql.Types.INTEGER);
            dao.toStore(cstm);
            int uid = cstm.getInt(7);
            if (uid != 0) {
                String url = "http://localhost:8080/pixelmart/fc/emailverifier?uid=" + uid;
                dao.toClose();
                MailSender ms = new MailSender();
                ms.sendMail(email, "khateebaamir12a13@gmail.com", url);
                req.getRequestDispatcher("signedup").forward(req, res);
            } else {
                req.setAttribute("vldt", uid);
                req.getRequestDispatcher("invalidpage").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
