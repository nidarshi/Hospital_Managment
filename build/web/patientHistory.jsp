<%-- 
    Document   : patientHistory
    Created on : Dec 1, 2018, 10:29:53 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
          String nic=request.getParameter("pnicNo");
          //out.println(nic);
          int num=0;
            try {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaldb","root","");
            
            Statement stmt = con.createStatement();
            
             String query="select * from patient where pNIC='"+nic+"'";
             ResultSet rs = stmt.executeQuery(query);
             
             while(rs.next()){
                String pPrescription=rs.getString("prescription");
                String otherData=rs.getString("other");
                String date=rs.getString("dateTime");
                String name=rs.getString("patientName");
                out.println("<b>Date    :</b>"+date);
                out.print("<br>");
                out.println("<b>Patient Name    :</b>"+name);
                out.print("<br>");
                out.print("<br>");
                out.print("<b>Prescriptions:</b>");
                out.print("<br>");
                String array1[]= pPrescription.split(",");
                 for (String temp: array1){
                      out.println(temp);
                      out.print("<br>");
                 }
                 
                 out.print("<br>");
                 out.print("<b>Special Records</b>");
                 out.print("<br>");
                 out.print(otherData);
                 out.print("<br>");
                 out.print("<br>");
                 out.print("**************************************");
                 out.print("<br>");
                num++;
             }
            
                    
            
                if( num==0){
                 out.println("<h1>No any recorded history</h1>");    
                }
            
            }catch(Exception e){

                out.println(e.getMessage());
            }
      %>
    </body>
</html>
