<%-- 
    Document   : login
    Created on : Dec 2, 2018, 7:16:38 PM
    Author     : Nidarshi
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
        <title>Login Page</title>
    </head>
    <body>
        
        <%
        try{
        String username = request.getParameter("input1");
        String pwd = request.getParameter("input2");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaldb", "root", "");
        Statement st = con.createStatement();
        //ResultSet rs;
        String query="select * from login where username='"+username+"' and password='"+pwd+"'";
        ResultSet rs = st.executeQuery(query);
        
        if(rs.next()){
            session.setAttribute("uname",rs.getString("username"));
            
            if(rs.getString("usercategory").equals("admin")){
                response.sendRedirect("registration.html");
                //out.println("abcd");
                
            }
            else if(rs.getString("usercategory").equals("doctor")){
                response.sendRedirect("header_1.jsp?");
            }
             else if(rs.getString("usercategory").equals("receptionist")){
                response.sendRedirect("receptionist.jsp");
            }
            else if(rs.getString("usercategory").equals("labAssi")){
                response.sendRedirect("lab.jsp");
            }
            
        }
        else{
            //response.sendRedirect("login.html");
            out.println("<p>Enter correct username and password</p>");
        }
        
        
    }catch(Exception e){
        out.println(e.getMessage());
    }
%>
    </body>
</html>
