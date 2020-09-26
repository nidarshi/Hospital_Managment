<%-- 
    Document   : report_detail
    Created on : 30-Nov-2018, 21:10:12
    Author     : PCNS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
                <h1>Report Detail</h1>
                
                 <%
                    if(session.getAttribute("pid") != null){
                        String path = request.getParameter("path");
                        out.print("<img src='images/");
                        out.print(path);
                        out.print(".jpg'>");
                    } else {
                        out.println("<h1>Enter correct id and bill no!</h1>");
                    }
                    
                    
                %>
              
        </div>
    </body>
</html>
