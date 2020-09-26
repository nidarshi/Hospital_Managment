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
  <link rel="stylesheet" href="css/bootstrap.min.css">
  
   <style>
              
            * {
                box-sizing: border-box;
                overflow: auto;
               
            }
            input[type="text"]{
                margin:5px; 
            }
            input[type="submit"]{
                margin:5px; 
            }
             input[type="reset"]{
                margin:5px; 
            }
            input[type="date"]{
                margin:5px; 
            }
            textarea{
                margin:5px; 
            }
            .column {
                float: left;
                width: 45%;
                padding-left:  10px;
               margin-left: 25px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }
            
            @media screen and (max-width: 600px) {
                .column {
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
      <a href="Home.jsp">Home</a>
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

     <div class="row">
        <div class="column">
          <h2>Patient's Details</h2>
          
          <form name="form1" action="doctor.jsp" method="POST">
               <table border="0">
                   <tbody>
                       <tr>
                           <td>Patient ID   : </td>
                           <td><input type="text" required="required" name="pID" value="" size="50" class="form-control"/></td>
                       </tr>
                       
                       <tr>
                           <td> Patient Name    :</td>
                           <td>
                               <input type="text" class="form-control" name="abc" 
                                      value="<%
            String pid=request.getParameter("pID"); 
            String dID=request.getParameter("docID"); 
           
            try {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaldb","root","");
            
            Statement stmt = con.createStatement();
            
            String query="select * from patient where patientID='"+pid+"'";
             ResultSet rs = stmt.executeQuery(query);
             
             
              
              if(rs.next()){
                String pName=rs.getString("patientName");
                out.println(pName);
                session.setAttribute("Pid", rs.getString("patientID"));
                
             }else{
                out.print("invalid");
            }
          }catch(Exception e){

                out.println(e.getMessage());
            }
      %>" size="50"/>
                           </td>
                       </tr>
                       
                      
                       
                       <tr>
                           <td>Age  :</td>
                           <td><input type="text" class="form-control" name="abc" 
                                      value="<%
            String pid2=request.getParameter("pID"); 
          
            try {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaldb","root","");
            
            Statement stmt = con.createStatement();
            
             String query="select * from patient where patientID='"+pid2+"'";
             ResultSet rs = stmt.executeQuery(query);
             
              if(rs.next()){
                int age=rs.getInt("age");
                out.println(age);
                
                
             }else{
                out.print("invalid");
            }
                     
            
            
            }catch(Exception e){

                out.println(e.getMessage());
            }
      %>" size="50"/>
                       </td>
                       </tr>
                       
                       <tr>
                           <td style="text-align: right"></td>
                           <td style="text-align: right"><input type="reset" value="Clear" name="btn"  class="btn btn-primary"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"  value="Search" name="btn3"   class="btn btn-primary"/></td>
                       </tr>
                       
                       
                   </tbody>
               </table>

          </form> 
                          
                          
        <form name="form2"  action="newjsp.jsp" method="POST" onsubmit="return confirm('Do you really want to submit the form?');">
               <table border="0">
                   <tbody>                  
                       <tr>
                           <td>Prescription:</td>
                           <td><textarea name="medicine"  rows="5" cols="49" class="form-control" >
                             
                          </textarea></td>
                       </tr>
                       <tr>
                           <td>Descriptions:</td>
                           <td><textarea name="other" rows="5" cols="49"  class="form-control">
                             
                          </textarea></td>
                       </tr>
            
                       <tr>
                           <td style="text-align: right"></td>
                           <td style="text-align: right"><input type="reset" value="Clear" name="btn4" class="btn btn-primary"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Submit" name="btn5" class="btn btn-primary"/></td>
                       </tr>
                   </tbody>
               </table>

          </form> 
        </div>
       
        <div class="column">
        <h2>View Appointments</h2>
        <form name="form3" action="noOfDate.jsp" method="POST">
            <table border="0">
                    <tr>
                        <td>Please select the date</td>
                        <td><input type="date" name="myDate" required="required" class="form-control"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="text-align: left"><button class="btn btn-primary" type="submit" onClick=" return available2();" >View Appointments</button></td>
                        
                    </tr>
            </table>

        </form>
          
        <h2>View Patient History</h2>
          
          <form name="form4" action="patientHistory.jsp" method="POST">
          <table border="0">
            <tbody>
                  <tr>
                      <td>Please enter patient's NIC</td>
                      <td><input type="text"  name="pnicNo" placeholder="000000000v" required="required" class="form-control"></td>
                  </tr>
                  <tr>
                      <td></td>
                      <td style="text-align: left"><input type="reset" value="Clear" name="btn" class="btn btn-primary"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="View History" name="btn3" onClick=" return available2();" class="btn btn-primary"/></td>
                  </tr>
                 <tr>
                      <td></td>
                      <td></td>
                  </tr>
                 
              </tbody>
          </table>
        </form>
        </div>
      </div>
     
        
        <script>            

          function available1(){
          var checkAva2=document.form1.pID.value;
          if(checkAva2==""){
          alert("Please enter the patient ID");
              document.form1.pID.focus();
              return false;
              
          }
          }
          
          function validate(form2) {
            if(!valid) {
                alert('Please correct the errors in the form!');
                return false;
            }
            else {
                return confirm('Do you really want to submit the form?');
            }
        }
    </script>  

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
