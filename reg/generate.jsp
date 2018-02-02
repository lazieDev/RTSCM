<%-- 
    Document   : generate
    Created on : Feb 2, 2018, 8:56:50 PM
    Author     : Sakir
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%-- 
    Document   : sample
    Created on : Jan 30, 2018, 6:01:36 PM
    Author     : Sakir
--%>
<%@page import="java.lang.String"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>AutoGen</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Flat Sign Up Form Responsive Widget Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Meta tag Keywords -->
    <!-- css files -->
    <link href="css/reg-style.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/reg-font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- //css files -->
    <!-- online-fonts -->
    <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'><link href='//fonts.googleapis.com/css?family=Raleway+Dots' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <center>
            <h1>AutoGen GUI</h1>
            <hr />
            <%
            // Set refresh, autoload time as 5 seconds
            response.setIntHeader("Refresh", 5);
            
            // Get current time
            Calendar calendar = new GregorianCalendar();
            String am_pm;
            
            int hour = calendar.get(Calendar.HOUR);
            int minute = calendar.get(Calendar.MINUTE);
            int second = calendar.get(Calendar.SECOND);
            
            if(calendar.get(Calendar.AM_PM) == 0)
               am_pm = "AM";
            else
               am_pm = "PM";
            String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
            out.println("Crrent Time: " + CT + "\n");
            %>
        </center>
<%
    int flag = 0;
    int[] id = new int[100];
    int[] cpk = new int[100];
    String[] cname=new String[100];
    String[] ctype=new String[100];
    String[] dvalue=new String[100];
    String sql = "pragma table_info(login)";
    Class.forName("org.sqlite.JDBC");
    Connection conn = DriverManager.getConnection("jdbc:sqlite:d:\\sms.db");
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(sql);
        while(rs.next()) {
            flag++;
            id[flag] = rs.getInt("cid");
            cname[flag] = rs.getString("name");
            ctype[flag] = rs.getString("type");
            dvalue[flag] = rs.getString("dflt_value");
            cpk[flag] = rs.getInt("pk");
           }
            out.println("<div class=\"header-w3l\">");
            out.println("<h1>AutoGen Form</h1>");
            out.print("</div>");
//            <!--//header-->
//            <!--main-->
            out.println("<div class=\"main-agileits\">");
            out.println("<h2 class=\"sub-head\">Sign Up</h2>");
            out.println("<div class=\"sub-main\">");	
            out.println("<form action=\"register.jsp\" method=\"post\">");
            for(int i=1;i<=flag;i++) {
            out.println("<input placeholder=" +cname[i]); 
            out.println("name=\"fname\" class=\"name\" type=\"text\" required=\"\">");
            out.println("<span class=\"icon"+i);
            out.println("\"><i class=\"fa fa-user\" aria-hidden=\"true\"></i></span><br>");
            }
            out.println("<input type=\"submit\" value=\"sign up\">");
            out.println("</form>");
            out.println("</div>");
            out.println("<div class=\"clear\"></div>");
            out.println("</div>");
//          <!--//main-->
//        out.println("<form>");
//            for(int i=1;i<=flag;i++) {
//                out.println("<p>" + cname[i]);
//                out.println("<input type=\"text\" name=\"ctype[i]\" /></p>");
//            }
//            out.println("<br><hr>");
            
    rs.close();
    conn.close();
           
%>
            </tbody>
        </table>
        <div class="footer-w3">
	<p>&copy; 2018 AutoGen Form . All rights reserved | Design by <a href="www.github/lazieDev">LazieDev</a></p>
        </div>
    </body>
</html>
