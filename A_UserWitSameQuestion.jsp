<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Admin All Users With Same Interest</title>
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
.style7 {font-size: 24px}
.style8 {color: #FF00FF}
.style9 {color: #F0F0F0}
.style10 {color: #FF0000; }
.style11 {color: #000000; }
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
	   
	  <h2>All Users With Same Asked Question and Questions...</h2>
         <%    
		 int id=0,i2=0,count=0,count1=0,count3=0,count4=0;
		 
           	    String query="select distinct question from questions order by question" ; 
			    Statement st=connection.createStatement();
			    ResultSet rs=st.executeQuery(query);
				while( rs.next() )
			   {
					String s1=rs.getString(1);
					
			   String decryptedDes= new String(Base64.decode(s1.getBytes()));
			%>
	       <table width="572" border="1">
				  <tr bgcolor="#FFFFFF">
				    <td colspan="5" bgcolor="#FFFFFF" ><h2 class="style10">Question Is: <span class="style11"><%=decryptedDes%>?</span></h2></td>
			      </tr>
				  <tr>
				    <td width="174" bgcolor="#FFFFFF" ><div align="left" class="style5 style7 style9">
						<div align="center" class="style8">Sl. no. </div>
					</div></td>
					<td width="174" bgcolor="#FFFFFF" ><div align="left" class="style5 style7 style8">
						<div align="center"> User Name</div>
					</div></td>
					<td width="174" bgcolor="#FFFFFF" ><div align="left" class="style5 style7 style8">
						<div align="center"> Answer</div>
					</div></td>
					<td width="174" bgcolor="#FFFFFF" ><div align="left" class="style5 style7 style8">
						<div align="center"> Image</div>
					</div></td>
				  </tr>
				 
				  <%
				  id=0;count1=0;
			 String sql1="select distinct qusername from samequestions where question='"+s1+"' ";
			 Statement st1=connection.createStatement();
			 ResultSet rs1=st1.executeQuery(sql1);
			while ( rs1.next() )
			   {
			   //i2=rs1.getInt(
				String s2=rs1.getString(1);
							id++;	  count=0;  count1=0;   count3++;
									
			String sql2="select * from answers where question='"+s1+"' and qusername='"+s2+"' ";
			 Statement st2=connection.createStatement();
			 ResultSet rs2=st2.executeQuery(sql2);
			if ( rs2.next() )
			   {
			   i2=rs2.getInt(1);
				String s3=rs2.getString(10);
						count++;
						String decryptedDes1= new String(Base64.decode(s3.getBytes()));		
								%>
								<tr>
							    <td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><%=id%></div></td>
								<td width="174" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><a href="A_UserProfile.jsp?user=<%=s2%>&type=<%="admin8"%>"><%=s2%></a></div></td>
								
		<td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><textarea rows="10" cols="30"> <%=decryptedDes1%></textarea></div></td>
		 <td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><img align="middle" height="100" width="120" src="images.jsp?value=<%="answer"%>&id=<%=i2%>"/></div></td>					 
							 
							  </tr>
							
							  <%
			
					 }
				else{
			String sql3="select * from autoanswers where question='"+s1+"'  ";
			 Statement st3=connection.createStatement();
			 ResultSet rs3=st3.executeQuery(sql3);
			if ( rs3.next() )
			   {
			   i2=rs3.getInt(8);
				String s4=rs3.getString(6);
				count1++;
				String decryptedDes1= new String(Base64.decode(s4.getBytes()));
				%>
				<tr>
							    <td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><%=id%></div></td>
								<td width="174" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><a href="A_UserProfile.jsp?user=<%=s2%>&type=<%="admin8"%>"><%=s2%></a></div></td>
				<td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><textarea rows="10" cols="30"> <%=decryptedDes1%></textarea></div></td>
				 <td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><img align="middle" height="100" width="120" src="images.jsp?value=<%="image"%>&id=<%=i2%>"/></div></td>				  
							  
							  </tr>
				<%
					 }
					 else{
					 String sql4="select * from frdsanswers where question Like '%"+s1+"%' and qusername='"+s2+"' ";
			 Statement st4=connection.createStatement();
			 ResultSet rs4=st4.executeQuery(sql4);
			if ( rs4.next() )
			   {count4++;
			    int i3=rs4.getInt(7);
			   String s21=rs4.getString(2);
				String s31=rs4.getString(5);
						count++;
						String decryptedDes11= new String(Base64.decode(s31.getBytes()));		
								%>
								<tr>
							    <td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><%=id%></div></td>
								<td width="174" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><a href="A_UserProfile.jsp?user=<%=s21%>&type=<%="admin8"%>"><%=s21%></a></div></td>
								
		<td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><textarea rows="10" cols="30"> <%=decryptedDes11%></textarea></div></td>
		 <td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><img align="middle" height="100" width="120" src="images.jsp?value=<%="answer"%>&id=<%=i3%>"/></div></td>					 
							 
							  </tr>
							
							  <%
			
					 }
					 
					 }
					if(count==0 && count1==0 && count4==0)
					 {
					 %>
					 <tr>
							    <td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><%=id%></div></td>
								<td width="174" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><a href="A_UserProfile.jsp?user=<%=s2%>&type=<%="admin8"%>"><%=s2%></a></div></td>
					 <td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><%="No Image Found"%></div></td>
				<td width="128" height="0" bgcolor="#FFFFFF"  style="color:#000000;"><div align="center" class="style11"><%="No One Answered"%></div></td>
							  </tr>
				<%
					 
					 }}}
					 %></table> 
	       <p>&nbsp;</p><%
			}
			
			if(count3==0){out.print("No questions Of Same Questioned User Found");}
			
			        %>
					
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
