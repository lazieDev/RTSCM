<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
 
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Registeration</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
            <%
                String firstname = request.getParameter("fname");
                String lastname = request.getParameter("lname");
                String pnumber = request.getParameter("number");
                String mail = request.getParameter("email");
                Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Sakir\\Documents\\sms.db");
                Statement stat = conn.createStatement();
 
                ResultSet rs = stat.executeQuery("select * from details");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("fname") + "</td>");
                    out.println("<td>" + rs.getString("lname") + "</td>");
                    out.println("<td>" + rs.getString("pnum") + " kr.</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("</tr>");
                }
 
                rs.close();
                conn.close();
            %>
            </tbody>
        </table>
    </body>
</html>