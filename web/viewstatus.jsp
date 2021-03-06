<%@page import="db.MyConnection"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html> 
<html>

<head>
  <title>PrivacyPreserving</title>
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
</head>

<body>
  <div id="main">		
    <header>
	  <nav>
	    <div id="menubar">
          <ul id="nav">
           <li class="current"><a href="userhome.jsp">Home</a></li>
			<li><a href="viewfiles1.jsp">View Files</a></li>
			<li><a href="reports1.jsp">DownLoad Files</a></li>
			<li><a href="viewstatus.jsp">Download Request Status</a></li>
			<li><a href="editprofile1.jsp">Edit Profile</a></li>
			<li><a href="viewprofile1.jsp">View Profile</a></li>
			<li><a href="logout">Logout</a></li>
			
          </ul>
        </div><!--close menubar-->	
      </nav>
	  <div id="banner">
	    <div id="welcome">
	      
<h3>Secure data mining in cloud using homomorphic encryption  </h3>
	    </div><!--close welcome-->
	    <div id="welcome_slogan">
	      <h3><span><b>in</b></span>&nbsp;&nbsp;&nbsp;Public Clouds</h3>
	    </div><!--close welcome_slogan-->		
	  </div><!--close banner-->
    </header>
    
	<div id="site_content">	

	   <div id="content">
        <div class="content_item">
		  <div class="form_settings">
            <%
			     HttpSession ses=request.getSession();
			     String uname=(String)ses.getAttribute("username");
		    %>
			<h2><center><font color="red" size=5>Welcome to <%=uname%></font></center></h2>

			<table border=1 align="center">
						
				  <tr>
							<th>
								<b>File Name</b>
							</th>
							<th>
								<b>Cloud</b>
							</th>
							<th>
								<b>Date</b>
							</th>
							<th>
								<b>Owner Name</b>
							</th>
							<th>
								<b>Status</b>
							</th>
					</tr>

<%

		Connection con=null;
		Statement st=null;
		ResultSet rs=null;

		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy","root","");
			String name=(String)session.getAttribute("username");

			st=con.createStatement();

			rs=st.executeQuery("select * from request where username='"+uname+"'");

			while(rs.next())
			{
				String fname=rs.getString(2);
				String cloud=rs.getString(3);
				Date date=rs.getDate(4);
				String ownername=rs.getString(6);
				String status=rs.getString(5);

		%>
					</tr>
							<td>
								<%=fname%>
							</td>
							<td>
								<%=cloud%>
							</td>
							<td>
								<%=date%>
							</td>
							<td>
								<%=ownername%>
							</td>
							<%
							if(status.equalsIgnoreCase("waiting"))
							{
							%>
							<td>
								<%=status%>
							</td>
							<%
							}
							else
							{
							%>
							<td>
								<a href="downloadzz.jsp?ip=<%=cloud%>&file=<%=fname%>"><i style="color: green">Check your email for key and Click Here to Download</i></a>
							</td>
							<%
							}
							%>
					</tr>
		<%				
			}
	%>
						</table>
            	
          </div><!--close form_settings-->
		</div><!--close content_item-->
      </div><!--close content--> 
	  

	</div><!--close site_content-->  	
 	

   <footer>

    <a href="userhome.jsp">Home</a>|
	<a href="editprofile1.jsp">Edit Profile</a>|
	<a href="viewprofile1.jsp">View Profile</a>|
	<a href="contactus1.jsp">Contact Us</a>|
	<a href="logout">Logout</a>

	<br/><br/>
	  
website Designed by <a href="http://www.plaethos.in">www.plaethos.in</a>
    </footer>
	
  </div><!--close main-->
  
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
