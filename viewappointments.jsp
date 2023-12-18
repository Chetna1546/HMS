<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>View your Appointment</title> 
</head>
<body>
    <%
            String username = request.getParameter("uname");
            String date = request.getParameter("date");

            String dbUrl = "jdbc:oracle:thin:@localhost:1521:XE";
            String dbUser = "Saswat";
            String dbPassword = "Lipun2020";
            Connection conn = null;
            PreparedStatement stmt = null;

            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            String sql = "SELECT * FROM appointments WHERE username=? AND p_date=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, date);

            ResultSet rs = stmt.executeQuery();
            rs.next();
        %>
    <div class="container">
        <header>Appointment Details</header>
            <div>
                <div>
                    <div>
                        <br>
                        <div>
                            <h5>Username: </h5><label><% out.println(rs.getString("username")); %></label>
                        </div>
                        <br>
                        <div>
                            <h5>Visiting Patient's Name: </h5><label><% out.println(rs.getString("visitorname")); %></label>
                        </div>
                        <br>
                        <div>
                            <h5>Date: </h5><label><% out.println(rs.getString("p_date")); %></label>
                        </div>
                        <br>
                        <div>
                            <h5>Time: </h5><label><% out.println(rs.getString("time")); %></label>
                        </div>
                        <br>
                        <div>
                            <h5>Department: </h5><label><% out.println(rs.getString("dept")); %></label>
                        </div>
                        <br>
                    </div>
                </div>
            </div>

    </div>

    <script src="script.js"></script>
    <%
            rs.close();
            stmt.close();
            conn.close();
    %>
</body>
</html>