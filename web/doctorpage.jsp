<%-- 
    Document   : doctorpage
    Created on : Nov 22, 2018, 8:26:34 PM
    Author     : Sinthuja
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="UTF-8">
       <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/Footer.css">
        <script type="text/javascript" src="css/script.js"></script>
         <script type="text/javascript">
             <script src="css/script.js"></script>
        <title>JSP Page</title>
        
        
        
    </head>
    <body>
 <div class="headercont">
  <!--header-->
  <div class="logod">
    <img src="images/logo.jpg" class="logo" height="70px">
    <p class="logdis" >Come and Get well soon<p>
  </div>
  <!--navigation bars-->
  <div class="header">
    <div class="header-right">
      <a class="active" href="#home">Home</a>
      <a href="#contact">Contact</a>
      <a href="#about">About</a>
    </div>
    <button class="btn1">Login</button>
  </div>
  </div> 
  
         <div >
            <div class= "col-md-7"> 
               
              <h1 style="padding-left: 200px">Patient Details</h1>
                    
              <form action="doctor.jsp"   method = "POST" style="padding-left: 200px">         
                               
                                <div class="form-group">
                                    <label  >Patient Name </label>
                                    <input type="text" style="border: 2px #007bff  solid; border-radius: 2px"  name="patientsname" maxlength="100"  class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label >Gender </label>
                                    <input type="radio" name="gender" value="Male" checked="checked" />Male
                                    <input type="radio" name="gender" value="Female" />Female
                                </div>
                                <div class="form-group">
                                        <label > Nic</label>											   
                                        <input type="text" style="border: 2px #007bff  solid; border-radius: 2px" name="nic" maxlength="10" class="form-control" />											   
                                </div>
                                
                                <div class="form-group">
                                        <label> Email</label>												
                                        <input type="email" style="border: 2px #007bff  solid; border-radius: 2px" name="email" maxlength="100"  class="form-control" placeholder="example@example.com"/>												
                                </div>

                                <div class="form-group">
                                        <label >Telephone Number </label>											   
                                        <input type="text" style="border: 2px #007bff  solid; border-radius: 2px" name="telephone" maxlength="10" class="form-control" placeholder="077xxxxxxx"/>											   
                                </div>
                                 <div class="row">
                                    <div class=" col-sm-2">
                                        <td style="text-align: right"><input type="submit" style="border-radius:4px; padding: 10px 15px; background-color:#007bff; color: white" value="Search" name="btnRegister" />
                                    </div >
                                     <div class=" col-sm-2">
                                       <input type="reset" style="border-radius:4px; padding: 10px 15px; background-color:#007bff; color: white" value="Clear" name="btnClear" />
                                    </div>
                                </div>
                  
                                           
                         </form>
                   </div>  
                         
                      
 
            
             </div>    
 
</body>
</html>

