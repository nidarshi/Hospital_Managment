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
        <h1>Sending Email</h1>
        <%!
        public static class SMTPAuthenticator extends Authenticator{
        
            public PasswordAuthentication getPasswordAuthentication (){
            return new PasswordAuthentication("Nemo Dory", "computerlab");
}


}
        
        %>
        <%
        int result=0;
        if(request.getParameter("send") != null){
            
            String d_uname="nemodorylab2018@gmail.com";
            String d_password="computerlab";
            String d_host="smtp.gmail.com";
            int d_port=465;
            
            String m_to=new String();
            String m_from="nemodorylab2018@gmail.com";
            String m_subject= new String();
            String m_text= new String();
            
            //my new added
            
            String cmsg=request.getParameter("message");
            String cname=request.getParameter("name");
            String cemail=request.getParameter("email");
            String cmobile=request.getParameter("mobile");
            String message="Customer Name : "+cname+"<br>"+"Email Address : "+cemail+"<br>"+"Mobile Number : "+cmobile+"<br>"+"Feedback : "+"\n"+cmsg;
            out.print(message);
            if(request.getParameter("to") !=null){
            m_to=request.getParameter("to");
            }
            
            if(request.getParameter("subject") !=null){
            m_subject=request.getParameter("subject");
            }
             
             if(cmsg!=null){
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
             }catch(Exception e){
             
                 out.println(e);
             }
        }
        %>
<p>Customer Feedbacks..</p>
        <form action="sendemail.jsp" method="POST" name="feedback">
            <input type="hidden" name="to" value="jrhpushpakumara2017@gmail.com">
            <input type="hidden" name="subject" value="Customer feedbacks">

            <label for="name">Your Name</label><br>
            <input type="text" id="name" name="name"><br>

            <label for="Email">Your Email Address</label><br>
            <input type="email" id="email" name="email"><br>

            <label for="mobile">Mobile Number</label><br>
            <input type="text" id="mobile" name="mobile"><br>

            <label for="Message">Message</label><br>
            <textarea id="message" name="message" placeholder="Your feedback..." style="height:100px"></textarea><br>


            <input type="submit" name="send" value="Send" style="text-align: right;">
            <input type="reset" name="reset" value="Clear" style="text-align: right;">
        </form>
            
            <script language="JavaScript">
                
                function displayResult(){
                 if(document.feedback.hidden.value ==="1"{){
                         alert("Mail was sent");
                         
                 }   
                    
                }
                
            </script>
    </body>
</html>
