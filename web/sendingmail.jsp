<%-- 
    Document   : sendemail
    Created on : Nov 30, 2018, 11:34:35 PM
    Author     : Hansana Pushpakumara
--%>

<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sending in Email</title>
    </head>
    <body onLoad="displayResult()">

        <%!
        public static class SMTPAuthenticator extends Authenticator{
        
            public PasswordAuthentication getPasswordAuthentication (){
            return new PasswordAuthentication("Nemo Dory", "computerlab");
}


}
        
        %>
        <%
        int result=0;
        if(request.getParameter("sendmail") != null){
            
            String d_uname="nemodorylab2018@gmail.com";
            String d_password="computerlab";
            String d_host="smtp.gmail.com";
            int d_port=465;
            
            String m_to=new String();
            String m_from="nemodorylab2018@gmail.com";
            String m_subject= new String();
            String m_text= new String();
            
            //my new added
            
            String name=request.getParameter("name");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            
           
            String message="Dear, "+name+"<br><br>Your Login Username : "+username+"<br>Your Login Password : "+password+"<br><br> Thank You for Join with us";
            //out.print(message);
            if(request.getParameter("to") !=null){
            m_to=request.getParameter("to");
            }
            
            if(request.getParameter("subject") !=null){
            m_subject=request.getParameter("subject");
            }
             
             if(message!=null){
                 //m_text="<h1>Welcome to the web app and design</h1><br/>";
                 m_text=m_text.concat(message);
                // m_text=m_text.concat("<br/><h2>Hope u Enjoy the course</h2>");
                 
                 
            }
             //create a properties object
             Properties props= new Properties();
             
             //create an SMTPAuthenticator object
             SMTPAuthenticator auth= new SMTPAuthenticator();
             
             //create a mail session object
             Session ses = Session.getInstance(props, auth);
             
             //Create a MIME style email message object
             MimeMessage msg= new MimeMessage(ses);
             msg.setContent(m_text,"text/html");
             msg.setSubject(m_subject);
             msg.setFrom(new InternetAddress( m_from));
             msg.addRecipient(Message.RecipientType.TO, new InternetAddress( m_to));
             
             try{
                 Transport transport=ses.getTransport("smtps");
                 transport.connect(d_host, d_port, d_uname,d_password);
                 
                 transport.sendMessage(msg,msg.getAllRecipients());
                 
                 transport.close();
                 result=1;
                 
                 out.print("Message Was Sent Successfully");
                 out.print( "<a href='registration.html'>Back</a>" );
                 out.println("<script>window.alert('Message Was Sent Successfully');</script> ");
        
                 
             }catch(Exception e){
                 
                 //out.println("Coudnt send");
                 out.println("<script>window.alert('Coudnt send');</script> ");
                 //out.print( "<a href='registration.jsp'>Back</a>" );
                 //response.sendRedirect("registration.html");
                 out.println("Message Coudn't send");
             }
        }
        %>

 
                
            </script>
            
      
        
    </body>
</html>
