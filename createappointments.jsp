<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register Here</title>
</head>
<body>  
        <%
            // Get the form data
            String username = request.getParameter("uname");
            String visitorname = request.getParameter("vname");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String dept = request.getParameter("dept");

            // Set up the database connection
            String dbUrl = "jdbc:oracle:thin:@localhost:1521:XE";
            String dbUser = "Saswat";
            String dbPassword = "Lipun2020";
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                // Create the SQL query
                String sql = "INSERT INTO appointments (username, visitorname, p_date, time, dept) VALUES (?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, username);
                stmt.setString(2, visitorname);
                stmt.setString(3, date);
                stmt.setString(4, time);
                stmt.setString(5, dept);

                // Execute the query
                int rows = stmt.executeUpdate();
                if (rows > 0) {
                    // Display a success message
                    out.println("<p>Appointment created successfully.</p>");
                } else {
                    // Display an error message
                    out.println("<p>Error creating an Appointment.</p>");
                }
            } catch (SQLException e) {
                // Handle any SQL errors
                e.printStackTrace();
                out.println("<p>SQL error inserting user: " + e.getMessage() + "</p>");
            } catch (Exception e) {
                // Handle any other errors
                e.printStackTrace();
                out.println("<p>Error inserting user: " + e.getMessage() + "</p>");
            } finally {
                // Close the database connection and statement
                try {
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
</body>
</html>


