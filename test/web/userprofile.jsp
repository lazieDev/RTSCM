<%-- 
    Document   : generate
    Created on : Feb 12, 2018, 4:14:37 PM
    Author     : Sakir
--%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
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
    <script type="text/javascript">
tday  =new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
tmonth=new Array("January","February","March","April","May","June","July","August","September","October","November","December");

function GetClock(){
d = new Date();
nday   = d.getDay();
nmonth = d.getMonth();
ndate  = d.getDate();
nyear = d.getYear();
nhour  = d.getHours();
nmin   = d.getMinutes();
nsec   = d.getSeconds();

if(nyear<1000) nyear=nyear+1900;

     if(nhour ==  0) {ap = " AM";nhour = 12;} 
else if(nhour <= 11) {ap = " AM";} 
else if(nhour == 12) {ap = " PM";} 
else if(nhour >= 13) {ap = " PM";nhour -= 12;}

if(nmin <= 9) {nmin = "0" +nmin;}
if(nsec <= 9) {nsec = "0" +nsec;}


document.getElementById('clockbox').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+ap+"";
setTimeout("GetClock()", 1000);
}
window.onload=GetClock;
</script>
<style>
    body{
        background-color: lightskyblue;
    }
    
    nav{
        float: left;
        max-width: 260px;
        margin: 0;
        padding: 1em;
    }
    article{
        margin-left: 470px;
        padding: 1em;
        padding-left: 10em;
        overflow: hidden;
    }
.header {
    background-color: #333;
    color: cornsilk;
    text-align: center;
    width: 100%;
}

table{
    padding: 5px;
    border: 1px solid black;
    margin: 5px;
    
}
table tr td{
    color:black;
    padding: 15px;
}
.log-form{
    width: 20%;
    min-width: 320px;
    max-width: 475px;
   padding: 50px;
   padding-bottom: 100px;
   margin-bottom: 100px;
    position: absolute;
    background-color: lightgrey;
    -webkit-transform: translate(0%,-0%);
    -moz-transform: translate(0,0);
    -o-transform: translate(0,0);
    -ms-transform: translate(0,0);
    transform: translate(0,0);
    box-shadow: 0px 2px 5px rgba(0.25,0.25,0.25,0.25);
}
 .footer {
            color: cornsilk;
    background-color: #333;
    padding: 0px;
    left: 0;
    height: 50px;
    bottom: 0;
    width: 100%;
    text-align: center;
    position: fixed;
}

</style>

    </head>
    <body>
        
        <div class="header">
        <center class="header">
            <h1>AutoGen Form</h1>
            <h1>Table Description</h1>
            <div id="clockbox"></div>
            </center> 
        </div>
    <nav>
        <table border="2">
   <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Type</th>
        <th>Default</th>
        <th>Key</th>
   </tr>

<%
    int flag = 0,i = 1;
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
            %>
            
            <div class="log-form">
            
                <%
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
            out.println("<input type=\"submit\" value=\"delete\" onclick =\"this.form.action='delete.jsp';\"/><br>");
            out.println("</form>");
            out.println("</div>");
            %>
        </nav>
    <article>
            <%
            
            out.println("<div class=\"clear\"></div>");
            out.println("</div>");
            out.println("<table border=\"2\">");
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
    rs.close();
    conn.close();
           
%>
    </article>
            
            <div class="footer">
                <div class="container-fluid">
	<p>&copy; 2018 AutoGen Form . All rights reserved | Design by <a href="www.github/lazieDev">LazieDev</a></p>
        </div>
            </div>
    </body>
</html>

