<%-- 
    Document   : display
    Created on : Feb 13, 2018, 3:11:43 AM
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
    <!-- Meta tag Keywords -->  
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Meta tag Keywords -->
    <!-- css files -->
    <link href="style.css" rel="stylesheet" type="text/css" media="all">
    <!-- css files -->  
    <style>
        .column1{
    float: left;
    width: 25%;
   margin-left: 25px;
    padding: 5px; 
}
             .footer {
            color: cornsilk;
    background-color: #333;
    padding: 10px;
    text-align: center;
}
    </style>
    </head>
    <body>
        <center class="header">
            <h1>AutoGen Form</h1>
            <%
            // Set refresh, autoload time as 5 seconds
            response.setIntHeader("Refresh", 5000);
            
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
            out.println("<h3>"+ CT +"<h3>");
            %>
            <hr>
            <h1>Table Description</h1>
            
        </center> 
        
        <table border="2">
   <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Type</th>
        <th>Default</th>
        <th>Key</th>
   </tr>

<%
     int i=1,cnum,exit=0,flag = 0;
    String vname[]=new String[100];
    String[] varray = (String[])session.getAttribute("var");
    for(i=1;i<varray.length;i++){
        if(varray[i]==null){
            exit=i;
            //out.println("<p>exit:"+exit+"</p>");
        break;
        }
    //out.println("<p>"+varray[i]+"</p>");
    vname[i]=request.getParameter(varray[i]);
    //out.println("<p>"+vname[i]+"</p>");
    }
    
    int[] char_count = new int[100];
    int[] vchar_count = new int[100];
    int[] int_count = new int[100];
    int[] date_count = new int[100];
    int[] id = new int[100];
    int[] cpk = new int[100];

    String var[] = new String[100];
    String dtype[] = new String[100];
    String[] cname = new String[100];
    String[] ctype = new String[100];
    String[] dvalue = new String[100];
    String sql = "pragma table_info(details)";
    Class.forName("org.sqlite.JDBC");
    Connection conn = DriverManager.getConnection("jdbc:sqlite:/home/rakshith/Desktop/AutoGen-master/AutoGen/rtscm.db");
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(sql);
        while(rs.next()) {
            flag++;
            id[flag] = rs.getInt("cid");
            cname[flag] = rs.getString("name");
            ctype[flag] = rs.getString("type");
            dvalue[flag] = rs.getString("dflt_value");
            cpk[flag] = rs.getInt("pk");
            
            //Table Description
           
            out.println("<tr><td>"+ id[flag] +"</td>");
            out.println("<td>"+ cname[flag] +"</td>");
            out.println("<td>"+ ctype[flag] +"</td>");
            out.println("<td>"+ dvalue[flag] +"</td>");
            out.println("<td>"+ cpk[flag] +"</td></tr>"); 
           
            //out.println("<p> field type = "+ctype[flag]+"</p>");
            //counter
            if(ctype[flag].matches("(varchar|int|date).*")) {
                //out.println("<p> flag = "+flag+"</p>");
                vchar_count[i]=flag;
                //out.println("<p> vchar_pos: "+vchar_count[i]+"</p>");
                dtype[i]="text";
                i++;
            }
            
            else if(ctype[flag].equals("char")) {
                //out.println("<p> flag = "+flag+"</p>");
                char_count[i]=flag;
                //out.println("<p> char_pos: "+char_count[i]+"</p>");
                dtype[i]="radio";
                i++;
                
            }
            else {
                dtype[i]="textarea";
            }
            
           }
        //values
            session.setAttribute("var",cname);
            session.setAttribute("flag",flag);
            //out.println("<p> Cnames : "+flag+"</p>");
            out.println("</table>");
            out.println("<div class=\"header-w3l\">");
            out.println("<h1>AutoGen Form</h1>");
            out.print("</div>");
//            <!--//header-->
//            <!--main-->
            out.println("<div class=\"main-agileits\">");
            out.println("<h2 class=\"sub-head\">Sign Up</h2>");
            out.println("<div class=\"sub-main\">");	
            out.println("<form id=\"autogen\">");
            
            
            //Generatioin of Automated Form Begins Here
            for(i=1;i<=flag;i++) {
                var[i]=cname[i];
                out.println("<p>"+var[i]+"</p>");
                
                
                //out.println("<p> datatype:"+ i + dtype[i]+"</p>");
//                if(dtype[i].equals("text")) {
//                if(cname[i].contains("name")||cname[i].contains("num")||cname[i].contains("pass")||cname[i].contains("DOB")) {
                    out.println("<input placeholder=" +cname[i]); 
                    out.println("name=" +cname[i]);
                    out.println("class=\"about\" type=\"text\" required=\"\">");
////                out.println("<span class=\"icon"+i);
////                out.println("\"><i class=\"fa fa-user\" aria-hidden=\"true\"></i></span><br>");
//                }
//                else {
//                out.println("<textarea rows=\"4\" cols=\"18\" name="+cname[i]);
//                out.println(" form=\"autogen\">"+cname[i]+"</textarea>");
////                out.println("<span class=\"icon"+i);
////                out.println("\"><i class=\"fa fa-user\" aria-hidden=\"true\"></i></span><br>");
//                }
//                }
//                else if(dtype[i].equals("radio"))    {
//                out.println("<input placeholder=" +cname[i]); 
//                out.println("name=\"fname\" class=\"about\" type=\"text\" required=\"\">");
////                out.println("<span class=\"icon"+i);
////                out.println("\"><i class=\"fa fa-user\" aria-hidden=\"true\"></i></span><br>");
//                }
            }
            // Automated form generated
            out.println("<br><br><input type=\"submit\" value=\"insert\" onclick =\"this.form.action='insert.jsp';\"/>");
            out.println("<input type=\"submit\" value=\"update\" onclick =\"this.form.action='update.jsp';\"/>");
            out.println("<br><input type=\"submit\" value=\"delete\" onclick =\"this.form.action=\'delete.jsp\';\"/>");
            out.println("<input type=\"submit\" value=\"display\" onclick =\"this.form.action=\'display.jsp\';\"/><br>");
             out.println("</form>");
            //out.println("<input type=\"submit\" value=\"delete\" onclick =\"this.form.action='delete.jsp';\"/><br>");           out.println("</form>");
            out.println("</div>");
            out.println("<div class=\"clear\"></div>");
            out.println("</div>");
            %>
            
   
   <%
            out.println("<hr><table border=\"2\">");
            out.println("<tr>");
            for(i=1;i<=flag;i++) {
            out.println("<td>"+cname[i]);
            out.println("</td>");
            }
            out.println("</tr><tr>");
            try
            {
            //out.println("<p>"+"class.forname"+"</p>");   
            Class.forName("org.sqlite.JDBC");
            //out.println("<p>"+"Connection"+"</p>");  
            conn = DriverManager.getConnection("jdbc:sqlite:/home/rakshith/Desktop/AutoGen-master/AutoGen/rtscm.db");
            //out.println("<p>"+"String sql"+"</p>");
            String sql1 ="select * from details";
            //out.println("<p>"+"stmt"+"</p>");  
            Statement stmt=conn.createStatement();
            //out.println("<p>"+"resultset"+"</p>");
            rs = stmt.executeQuery(sql1);
            //out.println("<p>"+"display"+"</p>");
//            out.println("<p>"+"for loop"+"</p>");  
//            for(i=1;i<vname.length;i++){
//            out.println("<p>"+"inside loop"+"</p>");
//            if(vname[i]==null) {
//            exit=i-1;
//            break;
//            }
//            stmt.setString(i,vname[i+1]);
//            }
//            stmt.setString(exit, vname[1]);
//            stmt.executeUpdate();
            while(rs.next())
            {
                //out.println("<p>"+"inside while"+"</p>");
                for(i=1;i<=flag;i++) {
                   // out.println("<p>"+i+"th row</p>");
            out.println("<td>"+ rs.getString(cname[i]) +"</td>");
            }
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("<p>"+"Data is Displayed successfully!"+"</p>");
             //New location to be redirected
         //   String site = new String("http://localhost:8080/test/userprofile.jsp");
         //response.setStatus(response.SC_MOVED_TEMPORARILY);
         // response.setHeader("Location", site);   
            
           rs.close();
           conn.close();
           }
            catch(Exception e)
            {
            System.out.print(e);
            e.printStackTrace();
            }
         
%>

<div class="footer-w3">
	<p>&copy; 2018 AutoGen Form . All rights reserved | Design by <a href="www.github/lazieDev">LazieDev</a></p>
        </div>
    </body>
</html>