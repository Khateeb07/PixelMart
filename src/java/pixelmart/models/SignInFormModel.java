package pixelmart.models;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author zed
 */
public class SignInFormModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try (PrintWriter out = res.getWriter()) {
            JSONObject outerobj = new JSONObject();
            outerobj.put("component", "form");
            outerobj.put("action", "signin");
            outerobj.put("method", "POST");
            outerobj.put("class", "row justify-content-center");
            JSONObject innerobj1 = new JSONObject();
            innerobj1.put("type", "email");
            innerobj1.put("class", "form-control rounded-0 border-0 border-bottom shadow-none");
            innerobj1.put("placeholder", "Email");
            innerobj1.put("name", "emailin");
            JSONObject innerobj2 = new JSONObject();
            innerobj2.put("type", "password");
            innerobj2.put("class", "form-control rounded-0 border-0 border-bottom shadow-none");
            innerobj2.put("placeholder", "Password");
            innerobj2.put("name", "passin");
            JSONObject innerobj3 = new JSONObject();
            innerobj3.put("type", "submit");
            innerobj3.put("value", "Sign In");
            innerobj3.put("class", "btn btn-primary my-3");
            JSONArray list = new JSONArray();
            list.add(innerobj1);
            list.add(innerobj2);
            list.add(innerobj3);
            outerobj.put("fields", list);
            out.println(outerobj.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
