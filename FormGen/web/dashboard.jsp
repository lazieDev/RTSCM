<%-- 
    Document   : dashboard
    Created on : Feb 12, 2018, 4:19:14 PM
    Author     : Sakir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>User Profile</div>
        <form >
            <input type="button" value="Profile" on ="/userprofile.jsp" method="post" />
             <input type="button" value="Satellite"  onClick="/satellite.jsp" method="post"/>
        </form>
    </body>
</html>