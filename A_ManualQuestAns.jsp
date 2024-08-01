<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Admin All USers Manual answer and Question</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/droid_sans_400-droid_sans_700.font.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style2 {font-size: 24}
.style3 {padding:0; margin:0; width:100%; line-height:0; clear: both;}
.style4 {
	color: #33CCFF;
	font-size: 36;
}
.style5 {
	font-size: 36px;
	color: #FF00FF;
}
.style8 {color: #FF00FF}
.style9 {color: #F0F0F0}
.style11 {color: #000000; }
.style12 {font-size: 18px}
.style13 {color: #0000FF}
-->
</style>
</head>
<%@ include file="connect.jsp" %>
 <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<body>
<div class="main style2">
  <div class="header">
    <div class="header_resize">
		<div class="logo">
        <h2 class="style4 style5">COMMUNITY INQUIRY: AN INTERNET-BASED SOCIAL CONNECTION PLATFORM FOR QUERY AND RESPONSE</h2>
      </div>
      <div class="searchform"></div>
      <div class="style3"></div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html">Home Page</a></li>
          <li class="active"><a href="A_Login.jsp">Admin</a></li>
          <li><a href="U_Login.jsp">User</a></li>
        </ul>
      </div>
      <div class="style3"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /></a> </div>
        <div class="style3"></div>
      </div>
      <div class="style3"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
	   
	  <h2><span class="style13">All Manual Question And Answers...</span></h2>
         <%    
		 int id=0,count=0;
			%>
	       <table width="572" border="1">
				  <tr>
				    <td width="174" bgcolor="#FFFFFF" ><div align="left" class="style5 style9 style12">
						<div align="center" class="style8">Sl. no. </div>
					</div></td>
					<td width="174" bgcolor="#FFFFFF" ><div align="left" class="style5 style8 style12">
						<div align="center">Questioned User</div>
					</div></td>
					<td width="174" bgcolor="#FFFFFF" ><div align="left" class="style5 style8 style12">
						<div align="center"> Question</div>
					</div></td>
					<td width="174" bgcolor="#FFFFFF" ><div align="left" class="style5 style8 style12">
						<div align="center"> Answered User</div>
					</div></td>
					<td width="174" bgcolor="#FFFFFF" ><div align="left" class="style5 style8 style12">
						<div align="center"> Answer</div>
					</div></td>
					<td width="174" bgcolor="#FFFFFF" ><div align="left" class="style5 style8 style12">
						<div align="center"> Image</div>
					</div></td>
				  </tr>
				 
				  <%
				  id=0;
			 String sql3="select * from answers ";
			 Statement st3=connection.createStatement();
			 ResultSet rs3=st3.executeQuery(sql3);
			while ( rs3.next() )
			   {
			   int i2=rs3.getInt(1);
				String s2=rs3.getString(2);
				String s3=rs3.getString(5);
				String s4=rs3.getString(7);
				String s5=rs3.getString(10);
				
				String decryptedDes= new String(Base64.decode(s3.getBytes()));
				String decryptedDesAns= new String(Base64.decode(s5.getBytes()));
				
							id++;	count++;     
									 %>
							  <tr>
							<td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><%=id%></div></td>
								<td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><a href="A_UserProfile.jsp?user=<%=s2%>&type=<%="admin4"%>"><%=s2%></a></div></td>
							<td width="138" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><%=decryptedDes%>?</div></td>
						   <td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><a href="A_UserProfile.jsp?user=<%=s4%>&type=<%="admin4"%>"><%=s4%></a></div></td>
						   <td width="178" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><textarea rows="10" cols="30"><%=decryptedDesAns%></textarea></div></td>
						   <td width="178" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><img align="middle" height="100" width="120" src="images.jsp?value=<%="answer"%>&id=<%=i2%>"/></div></td>
							  </tr>
							
							  <%
					 }
					 
					 if(count==0){out.print("No Manual Answers found");}
					 
					 %></table>
	       <p>&nbsp;</p>
<p align="right"><a href="A_Main.jsp" class="style2">Back</a></p>
	  
	  </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Sidebar Menu</h2>
          <div class="style3"></div>
          <ul class="sb_menu">
            <li><a href="A_Main.jsp">Home</a></li>
            <li><a href="A_Login.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="style3"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>Image Gallery</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="style3"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
