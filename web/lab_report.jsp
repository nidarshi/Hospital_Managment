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
                    String pid = request.getParameter("pid");
                    String bno = request.getParameter("bno");
                    
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/report_detail", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "SELECT * FROM lab_report WHERE patient_id='"+pid+"' AND bill_no='"+bno+"'";
                        
                        ResultSet rs = stmt.executeQuery(query);
                        if(rs.next()){
                            String path = rs.getString("path");
                            
                            session.setAttribute("pid", rs.getString("lab_id"));
                            response.sendRedirect("lab_report_1.jsp?path="+rs.getString("path"));
                           
                        }else{
                            out.println("<h4>Enter correct username and password.</h4>");
                        }
                        
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                %>
                
              
        </div>
    </body>
</html>
