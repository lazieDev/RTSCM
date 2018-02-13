<%-- 
    Document   : delete
    Created on : Feb 13, 2018, 4:05:45 AM
    Author     : Sakir
--%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    int i,cnum,exit=0;
    String vname[]=new String[100];
    String[] varray = (String[])session.getAttribute("var");
    for(i=1;i<varray.length;i++){
        if(varray[i]==null){
            exit=i;
            out.println("<p>exit:"+exit+"</p>");
        break;
        }
    out.println("<p>"+varray[i]+"</p>");
    vname[i]=request.getParameter(varray[i]);
    out.println("<p>"+vname[i]+"</p>");
    }


try
{
out.println("<p>"+"class.forname"+"</p>");   
Class.forName("org.sqlite.JDBC");
out.println("<p>"+"Connection"+"</p>");  
Connection conn = DriverManager.getConnection("jdbc:sqlite:/home/rakshith/Desktop/AutoGen-master/AutoGen/rtscm.db");
out.println("<p>"+"String sql"+"</p>");
String sql ="delete from details where uid=?";
out.println("<p>"+"prepared stmt"+"</p>");  
PreparedStatement stmt=conn.prepareStatement(sql);
out.println("<p>"+"for loop"+"</p>");  
stmt.setString(1, vname[1]);
stmt.executeUpdate();
out.println("<p>"+"Data is successfully Deleted!"+"</p>");
// New location to be redirected
      String site = new String("http://localhost:8080/test/userprofile.jsp");
      response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%> 

