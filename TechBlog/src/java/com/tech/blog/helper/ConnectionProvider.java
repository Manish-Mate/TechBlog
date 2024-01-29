/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.*;
public class ConnectionProvider {

    private static String con;
    
    public static Connection getConnection() {
        Connection con = null;
        try {
            if(con==null){
                Class.forName("com.mysql.jdbc.Driver");
            String user1 = "root";
            String password1 = "Manish";
            String url1 = "jdbc:mysql://localhost:3306/techblog";
            con = DriverManager.getConnection(url1, user1, password1);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
    
}
