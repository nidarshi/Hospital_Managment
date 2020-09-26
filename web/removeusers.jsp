<%-- 
    Document   : removeusers
    Created on : Dec 1, 2018, 8:15:45 PM
    Author     : Hansana Pushpakumara
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>removeusers</title>
<link rel="stylesheet" href="css/removeusers.css"> 
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <style>
       body{
    background-color:#f2f2f2;
    background:url(./images/adminpage_2.jpg) no-repeat center fixed; 
    background-size: cover;
}
   </style>
   <link rel="stylesheet" href="css/bootstrap.min.css"> 
    <body>
        
        

       
        <%
            
            String uname=request.getParameter("uname");
            String usercategory=request.getParameter("usercategory");
            if(request.getParameter("docremove") != null){ 
            //**********************doctor remove***************************
            
            if(request.getParameter("usercategory").equals("Doctor")){
                
                try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/raddb", "root", "");
                        Statement stmt = con.createStatement();
                        String query ="DELETE FROM doctor WHERE userName='"+uname+"'";
                        int n = stmt.executeUpdate(query);
                        if (n!=0){
                            out.println("<h4>Doctor Removing Successfull...</h4>");
                            
                        }else{
                            out.println("<h4>Something went wrong!!! Doctor</h4>");
                        }
                        
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
            
            }
            
          
            //**********************Lab Officer remove***************************
            
            if(request.getParameter("usercategory").equals("Lab Officer")){
                
                try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/raddb", "root", "");
                        Statement stmt = con.createStatement();
                        String query ="DELETE FROM staffmembers WHERE userName='"+uname+"'";
                        int n = stmt.executeUpdate(query);
                        if (n!=0){
                            out.println("<h4>Lab Officer Removing Successfull...</h4>");
                            
                        }else{
                            out.println("<h4>Something went wrong!!!Lab Officer</h4>");
                        }
                        
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
            
            }
            
           //********************************Admin remove********************* 
                        
            if(request.getParameter("usercategory").equals("Admin")){
                
                try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/raddb", "root", "");
                        Statement stmt = con.createStatement();
                        String query ="DELETE FROM staffmembers WHERE userName='"+uname+"'";
                        int n = stmt.executeUpdate(query);
                        if (n!=0){
                            out.println("<h4>Admin Removing Successfull...</h4>");
                            
                        }else{
                            out.println("<h4>Something went wrong!!! Admin</h4>");
                        }
                        
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
            
            }
                    //********************************Receptionist remove********************* 
                        
            if(request.getParameter("usercategory").equals("Receptionist")){
                
                try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/raddb", "root", "");
                        Statement stmt = con.createStatement();
                        String query ="DELETE FROM staffmembers WHERE userName='"+uname+"'";
                        int n = stmt.executeUpdate(query);
                        if (n!=0){
                            out.println("<h4>Receptionist Removing Successfull...</h4>");
                            
                        }else{
                            out.println("<h4>Something went wrong!!! Receptionist</h4>");
                        }
                        
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
            
            }
            
        }
            
            
            //**************************login remove**************************
                if(request.getParameter("docremove") != null){  
                              
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/raddb", "root", "");
                        Statement stmt = con.createStatement();
                        String query ="DELETE FROM login WHERE userName='"+uname+"' AND userCatagory='"+usercategory+"'";
                        int n = stmt.executeUpdate(query);
                        if (n!=0){
                            out.println("<h4>Removing Successfull...</h4>");
                            
                        }else{
                            out.println("<h4>Something went wrong!!! login</h4>");
                        }
                        
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                }
                
            %>
        
    <div class="removeform" style="text-align:center;">
            
        <form action="removeusers.jsp" method="POST">
            
            User Name:<br>
            <input type='text' name='uname' class="form-control"><br>
            User Category:<br>
            <select name="usercategory" class="form-control">
              <option value="Admin">Admin</option>
              <option value="Lab Officer">Lab Officer</option>
              <option value="Receptionist">Receptionist</option>
              <option value="Doctor">Doctor</option>
            </select><br>
            <br><input type="submit" value="Remove" name="docremove" class="btn-block">
            
        </form>
    </div>       
    </body>
</html>
