<%-- 
    Document   : report_detail
    Created on : 30-Nov-2018, 21:10:12
    Author     : PCNS
--%>


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/Footer.css">
        <title>Report </title>
    </head>
    <body>
        <div class="headercont">
  <!--header-->
  <div class="logod">
    <img src="images/logo.jpg">
    <p class="logdis" >Come and Get well soon<p>
  </div>
  <!--navigation bars-->
  <div class="header">
    <div class="header-right">
      <a class="active" href="#home">Home</a>
      <a href="#contact">Contact</a>
      <a href="#about">About</a>
    </div>
  </div>
              
        
                
                <%
                    String fname = request.getParameter("fname");
                    String lname = request.getParameter("lname");
                    String bno = request.getParameter("bno");
                    String image = request.getParameter("image");
                    String pid = request.getParameter("pid");
                   
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/report_detail", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "INSERT INTO lab_report(patient_id,firstname,lastname,bill_no,file,path) VALUES ('"+pid+"','"+fname+"', '"+lname+"', '"+bno+"','"+image+"','"+pid+"')";
                    
                                int n = stmt.executeUpdate(query);
                        if (n!=0){
                           out.println("<script type = 'text/javascript'> alert ('If you want upload this report ');</script>");  
                        }else{
                           out.println("<script type = 'text/javascript'> alert ('Error while uploading a image');</script>");
                        }
                        
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                %>
              
        </div>
    </body>
</html>
