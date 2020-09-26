<%-- 
    Document   : select
    Created on : Dec 2, 2018, 11:54:03 AM
    Author     : Sinthuja
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
        
        <style>
            
                body {
    background-image: url("image/doctor.jpg");
    background-size:100%;
    background-repeat: no-repeat;
    
    
}
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}
            
        </style>
        
        
        
    </head>
    <body>
        
        <h1>select your specialization</h1>
      <form action=select.jsp method=post>
     <!-- <input type='text' name="specialization">-->
      
      
<label for="specialization">Specialization</label>
                                             <select class="form-control docsp_sel" style="background-color:#3399ff; color: white; border-radius: 4px; padding: 4px" name="specialization" id ="specialization" >  
                                          
                                          <option value="empty"  selected>Select a specialization</option>
                                          <option value="CARDIOLOGIST">CARDIOLOGIST</option>
                                          <option value="CHEST SPECIALIST">CHEST SPECIALIST</option>
                                          <option value="PSYCHIATRIST">PSYCHIATRIST</option>
                                          <option value="SLIM CLINIC">SLIM CLINIC</option>
                                           <option value="GASTROENTEROLOGIST">GASTROENTEROLOGIST</option>
                                          <option value="DIETICIAN & NUTRICIAN">DIETICIAN & NUTRICIAN</option>
                                          <option value="PLASTIC SURGEON">PLASTIC SURGEON</option>
                                          <option value="UROLOGIST">UROLOGIST</option>
                                          <option value="VASCULAR SURGEON">VASCULAR SURGEON</option>
                                          <option value="DENTAL SURGEON">DENTAL SURGEON</option>
                                          </select>
    
<input type='submit' style="background-color:#3399ff; color: white; border-radius: 4px; padding: 4px" value='Search' name="Search">
      
      </form  >
      <table class="container" border="2" style="width: 100%; font-family:Arial; border-collapse: collapse; border-radius: 4px; padding: 4px"  ">
    
                
  
           <%
      if(request.getParameter("Search")!=null){
          String specialization=request.getParameter("specialization");   
             %>
<%
          
    try {
           
           
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctor", "root", "");
                Statement stmt = con.createStatement();
            String query = "select * from doctor where specialization='"+specialization+"'";
        
             ResultSet rs = stmt.executeQuery(query);
           
              out.println("<tr>"
                            + "<td><b>Doctor Name</b></td><br>"
                            + "<td><b>Doctor Charge </b></td><br>"
                            + "<td><b>Time</b></td>"
                            + "</tr>");
                    
             while (rs.next()) {
                 %>

                 
<%
                   String doctorname=rs.getString("doctorname");
                    //out.println(doctorname); 
                    //out.println("<br>"); 
                    Double doctorcharge=rs.getDouble("doctorcharge");
                   //out.println(doctorcharge); 
                   // out.println("<br>");
                    String time=rs.getString("time");
                   // out.println(time); 
                   // out.println("<br>");
                    
                    
                    out.println("<tr>"
                            + "<td>"+ doctorname + "</td>"
                            + "<td>" + doctorcharge + "</td>"
                            + "<td>" + time + "</td>"
                            + "</tr>");
                    
            } 

             
            
           }catch (Exception e) {
                out.println("<p>Error : "+e.getMessage()+"</p>");
            }
           
}
      
      
       
            %>
            
            </table>
             
                         
                
    </body>
</html>
