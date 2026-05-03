/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pixelmart.models;

import java.sql.*;
import java.io.*;

/**
 *
 * @author zed
 */
public class MyDAO {

    Connection con = null;

    public Connection toConnect(String driver) throws ClassNotFoundException, SQLException, IOException {
        String url = "jdbc:mysql://localhost:3306/ecommdb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String username = "skywalker";
        String password = "darthslayer";
        Class.forName(driver);
        con = DriverManager.getConnection(url, username, password);
        return con;
    }

    public void toClose() throws SQLException {
        if (con != null) {
            con.close();
        }
    }

    public void toStore(CallableStatement cstm) throws SQLException {
        cstm.execute();
    }

    public ResultSet toFetch(PreparedStatement pstm) throws SQLException {
        return pstm.executeQuery();
    }

    public void toFetch2(PreparedStatement pstm) throws SQLException {
        pstm.execute();
    }
}
