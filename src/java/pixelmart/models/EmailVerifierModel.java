/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

/**
 *
 * @author zed
 */
public class EmailVerifierModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String uid = req.getParameter("uid");
            MyDAO dao = new MyDAO();
            String driver = "com.mysql.cj.jdbc.Driver";
            dao.toConnect(driver);
            String query = "UPDATE ecomm_login SET status=1 WHERE (uid=?);";
            PreparedStatement pstm = dao.con.prepareStatement(query);
            pstm.setString(1, uid);
            dao.toFetch2(pstm);
            dao.toClose();
            req.getRequestDispatcher("verified").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
