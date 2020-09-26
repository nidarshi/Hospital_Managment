<%-- 
    Document   : doctor
    Created on : Nov 19, 2018, 12:30:51 PM
    Author     : Sinthuja
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>add channeling</title>
    </head>
    <body>
        <div class="Container" >
            <div class= "col-md-7"> 

                <%
                    
                    
                    String patientsname = request.getParameter("patientsname");
                    String gender = request.getParameter("gender");
                    String nic = request.getParameter("nic");
                  
                    String email = request.getParameter("email");
                    String telephone = request.getParameter("telephone");
                     DateFormat fmt = new SimpleDateFormat("hh:mm:ss aa");
                        String now = fmt.format(new Date());
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/radhospital", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "INSERT INTO channeling_details(patientsname,gender,nic,email,telephone,Cdate) VALUES ( '"+patientsname+"','"+gender+"', '"+nic+"', '"+email+"', '"+telephone+"','"+now+"')";
                        int n = stmt.executeUpdate(query);
                        if (n!=0){
                            out.println("<h4>Added Successfull...</h4>");
                        }else{
                            out.println("<h4>Error while registering the user.</h4>");
                        }
                        
                        } catch (Exception e) {
                            out.println(e.getMessage());
                        }
                    %>
                                 
                </div>                                                
            </div>
    </body>
</html>
