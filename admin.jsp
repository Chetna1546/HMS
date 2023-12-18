<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Dashboard</title>
</head>
<body>
	<%
            String username = request.getParameter("uname");
            String password = request.getParameter("pws");
            String type = "Admin";
            
            
            String dbUrl = "jdbc:oracle:thin:@localhost:1521:XE";
            String dbUser = "Saswat";
            String dbPassword = "Lipun2020";

            try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                    String sql = "SELECT * FROM users WHERE username=? AND password=? AND acctype=?";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, username);
                    statement.setString(2, password);
                    statement.setString(3, type);

                    // Execute the query and check if the user exists
                    ResultSet rs = statement.executeQuery();
                    if (rs.next()) {
                            // If the user exists, redirect the user to the dashboard page
                            response.sendRedirect("../Dashboard/dashboard.html");
                    } else {
                            // If the user does not exist, show an error message
                            out.println("<h2>Invalid username or password. Please try again.</h2>");
                    }

                    // Close the database connection and release any resources used
                    statement.close();
                    conn.close();
            } catch (Exception e) {
                    e.printStackTrace();
            }
	%>
</body>
</html>
