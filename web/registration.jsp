<%-- 
    Document   : registration
    Created on : Nov 30, 2018, 9:54:03 PM
    Author     : Hansana Pushpakumara
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" href="css/afterreg.css"> 
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <style>
       body{
    background-color:#f2f2f2;
    background:url(./images/adminpage.jpg) no-repeat center fixed; 
    background-size: cover;
}
   </style>
   <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
    </head>
    <body>
        
    <form action="removeusers.jsp">
        <input type="submit" name="remove" value="Remove Users" style="float: right;padding-right:20px;margin-right: 20px;">
    </form>
        
        <script>
            var letters = ['a','b','c','d','e','f','g','h','i','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
    var numbers = [0,1,2,3,4,5,6,7,8,9];
    var randomstring = '';

        for(var i=0;i<5;i++){
            var rlet = Math.floor(Math.random()*letters.length);
            randomstring += letters[rlet];
        }
        for(var i=0;i<3;i++){
            var rnum = Math.floor(Math.random()*numbers.length);
            randomstring += numbers[rnum];
        }
     //alert(randomstring);
     document.write(randomstring);
     
        </script>
        
                
                <%
                    
                    String userType = request.getParameter("userCatagory");
                    String name = request.getParameter("fname");
                    String specialisation = request.getParameter("Specialisation");
                    String details = request.getParameter("details");
                    String mobile = request.getParameter("Mobile");
                    String email = request.getParameter("Email");
                    String gender = request.getParameter("gender");
                    String username = request.getParameter("UserName");
                    String password = "<script>document.write(randomstring);</script>";
                    //String password = request.getParameter("Password");
                    String channelingDay = request.getParameter("channelingDay");
                    String channelingTime = request.getParameter("channelingTime");
                    
//*******************************login table************************


     
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/raddb", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "INSERT INTO login (userName,password,userCatagory) VALUES ('"+username+"', '"+password+"', '"+userType+"')";
                        int n = stmt.executeUpdate(query);
                        if (n!=0){
                            
                            
                        }else{
                            out.println("<h4>Something went wrong in login registration!!!</h4>");
                        }
                        
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                


                    
                    
//***********************Doctors Registration******************************  *    
                if(request.getParameter("docsubmit") != null){    
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/raddb", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "INSERT INTO doctor (userType,name,userName,specialisation,details,mobile,email,gender,channelingDay,channelingTime) VALUES ('"+userType+"', '"+name+"', '"+username+"', '"+specialisation+"', '"+details+"', '"+mobile+"', '"+email+"', '"+gender+"', '"+channelingDay+"','"+channelingTime+"')";
                        int n = stmt.executeUpdate(query);
                        if (n!=0){
                            out.println("<h4>Registration Successfull...</h4>");
                            
                        }else{
                            out.println("<h4>Something went wrong!!!</h4>");
                        }
                        
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                }
                
                
 //***********************Other staff Registration******************************  *                
                
                if(request.getParameter("staffsubmit") != null){ 
                   
                    
                      try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/raddb", "root", "");
                        Statement stmt = con.createStatement();
                        String query =  "INSERT INTO staffmembers (userType,name,userName,mobile,email,gender) VALUES ('"+userType+"', '"+name+"' ,'"+username+"' , '"+mobile+"', '"+email+"', '"+gender+"')";
                        int n = stmt.executeUpdate(query);
                        if (n!=0){
                            out.println("<h3>Registration Successfull...</h3>");
                            
                        }else{
                            out.println("<h4>Something went wrong!!!</h4>");
                        }
                        
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                }
 
                  

                %>
                
                <div class="avt">
                   
                </div>
                
                <p class="userdet"><% out.println(name);%> </p>
                <p class="userdet"><% out.println(specialisation);%> </p>
                <p class="userdet">Email: <% out.println(email);%> </p>
                <p class="userdet">Mobile: <% out.println(mobile);%> </p>
               
            <div class="smail">
                <p class="sendt">Send Registration Details</p>
                <form action="sendingmail.jsp" method="POST">
                    <lable class="send">Send to</lable><br>
                    <input type="text" name="name" value="<% out.println(name);%>" readonly><br>
                    <lable class="send">Email Address</lable><br>
                    <input type="text" name="to" value="<% out.println(email);%>" readonly><br>
                    <input type="hidden" name="username" value="<% out.println(username);%>">
                    <input type="hidden" name="password" value="<% out.println(password);%>">
                    <input type="hidden" name="subject" value="ABC Hosptal Login">
                    <br><input type="submit" value="Send" name="sendmail">
                    
                </form>
                    
                    <br>
                    <form action="registration.html">
                    <input type="submit" value="Add Another User" />
                    </form>
            </div>
            
</body>        

</html>
