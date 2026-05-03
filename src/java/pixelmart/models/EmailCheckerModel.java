/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.Exception;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

/**
 *
 * @author zed
 */
public class EmailCheckerModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try (PrintWriter out = res.getWriter()) {
            String email = req.getParameter("email");
            MyDAO dao = new MyDAO();
            String driver = "com.mysql.cj.jdbc.Driver";
            dao.toConnect(driver);
            String query = "SELECT email FROM ecomm_login WHERE(email=?);";
            PreparedStatement pstm = dao.con.prepareStatement(query);
            pstm.setString(1, email);
            ResultSet rs = dao.toFetch(pstm);
            JSONObject obj = new JSONObject();
            String s1 = "Email already exists";
            String s2 = "Email is available";
            if (rs.next()) {
//                obj.put("college", "Integral University");
//                obj.put("stream", "Engineering");
//                JSONArray list = new JSONArray();
//                list.add("CSE");
//                list.add("EC");
//                list.add("EE");
//                list.add("ME");
//                obj.put("branches", list);
//                out.println(obj.toJSONString());
                obj.put("message", s1);
                out.println(obj.toJSONString());
            } else if (email.equals("")) {
                obj.put("message", "");
                out.println(obj.toJSONString());
            } else {
                obj.put("message", s2);
                out.println(obj.toJSONString());
            }
            dao.toClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
