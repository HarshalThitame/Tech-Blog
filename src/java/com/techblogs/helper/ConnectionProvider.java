/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblogs.helper;

import java.sql.*;

/**
 *
 * @author harshal
 */
public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() 
    {
        try 
        {
            //driver class load

            if (con == null) 
            {
                Class.forName("com.mysql.jdbc.Driver");

                //create connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "admin", "Harshal@123");

            }

        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return con;
    }
}
