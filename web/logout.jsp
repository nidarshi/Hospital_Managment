<%-- 
    Document   : logout
    Created on : Nov 27, 2018, 11:44:26 AM
    Author     : cst16014
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
        session.invalidate();
        response.sendRedirect("login.html");
       %>
    </body>
</html>
 