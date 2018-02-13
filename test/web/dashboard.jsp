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
            <input type="submit" value="Profile" onclick ="this.form.action='userprofile.jsp';"/>
             <input type="submit" value="Satellite"  onclick="this.form.action='satellite.jsp';"/>
        </form>
    </body>
</html>