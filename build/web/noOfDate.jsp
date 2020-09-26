<%-- 
    Document   : noOfDate
    Created on : Dec 1, 2018, 12:00:42 AM
    Author     : Nidarshi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          String date=request.getParameter("myDate");
        // <-- select* from doctor where ;-->
          int noOfDate=0;
            try {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaldb","root","");
            
            Statement stmt = con.createStatement();
            
             String query="select * from channeling where channelingDate='"+date+"'";
             ResultSet rs = stmt.executeQuery(query);
             
             while(rs.next()){
                ++noOfDate;
             }
                //out.println("<h1>"+noOfDate+"</h1>");    
            
                if(noOfDate==0){
                 out.println("<h1>You have no any appoinment "+date+"</h1>");    
                }else{
                out.println("<h1>You have "+noOfDate+" appoinment "+date+"</h1>"); 
                }
            
            }catch(Exception e){

                out.println(e.getMessage());
            }
      %>
      
    </body>
</html>
