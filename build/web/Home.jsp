<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

  
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/Footer.css">
  <link rel="stylesheet" href="css/header.css">
  <title>Goshen Health|Home</title>>
  <style>
* {
    box-sizing: border-box;
}
.homeDiv2::after {
    content: "";
    clear: both;
    display: block;
}
[class*="col-"] {
    float: left;
    padding: 15px;
}

/* For desktop: */
.col-1 {width: 8.33%;}
.col-2 {width: 16.66%;}
.col-3 {width: 25%;}
.col-4 {width: 33.33%;}
.col-5 {width: 41.66%;}
.col-6 {width: 50%;}
.col-7 {width: 58.33%;}
.col-8 {width: 66.66%;}
.col-9 {width: 75%;}
.col-10 {width: 83.33%;}
.col-11 {width: 91.66%;}
.col-12 {width: 100%;}

@media only screen and (max-width: 600px) {
    /* For mobile phones: */
    [class*="col-"] {
        width: 100%;
    }
}
</style>
  
</head>
<body>

<div class="headercont">
  <!--header-->
  <div class="logod">
    <img src="images/logo.png" class="logo" height="70px">
    
        
            <%
            if(session.getAttribute("uname")!=null){
                                    
               try{
                Class.forName("com.mysql.jdbc.Driver");        
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaldb","root","");
                Statement stmt = con.createStatement();
                String q="select* from doctor where username='"+session.getAttribute("uname")+"'";
                ResultSet rs = stmt.executeQuery(q);

              if(rs.next()){
                String name=rs.getString("doctorName");
                out.println("<h4 class='logdis'> "+name+"<h4>");
                
             }
          }catch(Exception e){

                out.println(e.getMessage());
            }
        }
           
         else{
              out.println("<h4 class='logdis'>Live Your Healthy<h4>");}
            %>
        
  </div>
  <!--navigation bars-->
  <div class="header">
    <div class="header-right">
      <a class="active" href="Home.jsp" class="selected">Home</a>
      <a href="contact.jsp">Contact us</a>
      <a href="about.html">About us</a>
      <a href="select1.jsp">Find Your Doctor</a>
      <a href="channeling.jsp">eChanneling</a>
    </div>
      <%
         if(session.getAttribute("uname")!=null){
            //out.println("<a href='logout.jsp'> Logout</a>");
            out.println("<form action='logout.jsp'><button class='btn1'>Logout</button></form>");
           }else{
            out.println("<form action='login.html'><button class='btn1'>Login</button></form>");
            }
            %>
      
  </div>

</div>

 <div class="homeDiv2">

<div class="col-4 menu">
  <h4>special services<h4/>
  <ul>
      <li> Oncology Unit</li>
       <li>Urology Unit</li>
        <li>Brain and Spine Center</li>
         <li>Stroke Unit</li>
         <li>Free dental care</li>
  </ul>    
  

</div>

<div class="col-4">
  <h4>OPD opening hours</h4>
  <table >
     <tbody>
          <tr>
              <td>Monday - Friday</td>
              <td>08.00 - 21.00</td>
          </tr>
          <tr>
              <td>Saturday</td>
              <td>09.00 - 21.00</td>
          </tr>
          <tr>
              <td>Sunday</td>
              <td>9.30 - 21.00</td>
          </tr>
      </tbody>
  </table>

  
</div>

<div class="col-4 right">
<h4>critical care expertise</h4>
  <p></p>
</div>

</div>
       
            
            
            

            <footer>
		<div class="Footer col-12">
                                <div class="Footer4 col-3">
                                    <div class="linkss">
					<b><p id="Footerhead">e@Services</p></b>
                                        <a href="#" id="link2">Find Your Doctor</a><br><br>
					<a href="#" id="link2">Find Lab Report</a><br><br>
					<a href="#" id="link2">Inquiry</a><br><br>
                                    </div>
				</div>
				
				<div class="Footer3 col-3">
						<b><p id="Footerhead">Conect with Us</p></b>
						
						<a href="#" id="link1" target="_blank"><img src="images/fb.png" alt="Facebook" width="20%" height="20%" ></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#" id="link1" target="_blank"><img src="images/twitter.png" alt="Twitter" width="20%" height="20%"></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#" id="link1" target="_blank"><img src="images/google.png" alt="Google" width="20%" height="20%"></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
				</div>
				<div class="Footer2 colu-3">
						<b><p id="Footerhead">Find Us</p></b>
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.2283057070813!2d81.07561229554683!3d6.982363167274395!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae4618a1a9fec37%3A0x1dd900702229654b!2sUva+Wellassa+University!5e0!3m2!1sen!2slk!4v1511197231475"  width="90%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
					
				</div>
				
				
                                <div class="Footer1 col-3">
					<b><p id="Footerhead">Contact Us</p></b>
					
						Goshen Health Hospital<br>
						Kadawatha Road,<br>
						Ragama.<br><br>
                                                Phone : +94 11 2255 255<br>
						Emergency : +94 11 2200 200<br>
						Email :goshenhealth@gmail.com<br>
					
					
				</div>
			</div>
		</footer>
    
    
</body>
</html>
