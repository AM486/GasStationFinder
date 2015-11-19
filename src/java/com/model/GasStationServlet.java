/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author RG
 */
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class GasStationServlet extends HttpServlet {

    String message;

    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        // JDBC driver name and database URL
        //αρκεί να αλλάξεις το url της βάσης, το username και το passwword και τρέχει κανονικά
        final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        final String DB_URL = "jdbc:mysql://localhost:3306/gasstation_db";

        //  Database credentials
        final String USER = "root";
        final String PASS = "";

        // Set response content type
        response.setContentType(
                "text/html");
        PrintWriter out = response.getWriter();
        String title = "Database Result";

        try {
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Execute SQL query
            Statement stmt = conn.createStatement();
            String sql;
            sql = "SELECT  id,brand_name,gas,laundry,address,latitube, longitude FROM gas_station\n" +
                    "    GROUP BY brand_name";
            ResultSet rs = stmt.executeQuery(sql);
            request.setAttribute("rs", rs);
            request.setAttribute("returnRes", rs);

            // Extract data from result set
            // Clean-up environment
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }
        RequestDispatcher view = request.getRequestDispatcher("index.jsp");

    }

}
