<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User viwe answered details</title>
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
.style6 {color: #FF00FF}
.style7 {color: #00FF00}
.style8 {color: #FF0000}
-->
</style>
</head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
	  <%@ page import="java.io.*" %>
            <%@ page import="java.util.*" %>
            <%@ page import="com.oreilly.servlet.*" %>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
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
          <li><a href="A_Login.jsp">Admin</a></li>
          <li class="active"><a href="U_Login.jsp">User</a></li>
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
	  <%
	 			String question=request.getParameter("quest");
				int count=0,count1=0;
				String decryptedDes= new String(Base64.decode(question.getBytes()));
				
				String uname=(String)application.getAttribute("uname");
				
				String query3="select * from answers where question LIKE '%"+question+"%' "; 
    		    Statement st3=connection.createStatement();
       			ResultSet rs3=st3.executeQuery(query3);
					while ( rs3.next()==true )
	  					{
						int i1=rs3.getInt(1);
						String answer=rs3.getString(10);
						String name1=rs3.getString(7);
								String decryptedDesAns= new String(Base64.decode(answer.getBytes()));
								
								if(name1.equals(uname)){
								count1++;
								 %>
							 <img align="middle" height="100" width="120" src="images.jsp?value=<%="answer"%>&id=<%=i1%>"/>
							 <h3><span class="style8">Answer For This Question Given By=</span> <%="you"%> </h3>
							 <h3 class="style7"><span class="style8">Answer For This Question Is=</span> <%=decryptedDesAns%> </h3>
							 <%
							}	
									
							String sql81="select * from req_res where ((requestfrom='"+uname+"'&&requestto='"+name1+"') || (requestfrom='"+name1+"'&&requestto='"+uname+"')) && status='Accepted'";
								Statement st81=connection.createStatement();
								ResultSet rs81=st81.executeQuery(sql81);
					   			if( rs81.next() )
								{
								
										String keyWord = "5765586965748666502846";
										keyWord = keyWord.substring(0, 16);
										byte[] keyValue = keyWord.getBytes();
										Key key = new SecretKeySpec(keyValue, "AES");
										Cipher c2 = Cipher.getInstance("AES");
										c2.init(Cipher.ENCRYPT_MODE, key);
							count++;
							count1++;
							
							 %>
							 <img align="middle" height="100" width="120" src="images.jsp?value=<%="answer"%>&id=<%=i1%>"/>
							 <h3><span class="style8">Answer For This Question Given By=</span> <%=name1%> </h3>
							 <h3 class="style7"><span class="style8">Answer For This Question Is=</span> <%=decryptedDesAns%> </h3>
							 <%
			
						}}
				
	 				if(count==0)
				  {
					
				String query2="select distinct did,qusername,answer,ausername from autoanswers where question LIKE '%"+question+"%'  "; 
        		Statement st2=connection.createStatement();
       			ResultSet rs2=st2.executeQuery(query2);
					if ( rs2.next()==true )//1 open
	   					{	
							int i2=rs2.getInt(1);
							String daname=rs2.getString(2);
							String Con=rs2.getString(3);
							String name1=rs2.getString(4);
										
										
								String decryptedDesAns= new String(Base64.decode(Con.getBytes()));
									
									if(name1.equals(uname)){
								count1++;
								 %>
							 <img align="middle" height="100" width="120" src="images.jsp?value=<%="image"%>&id=<%=i2%>"/>
							 <h3><span class="style8">Answer For This Question Given By=</span> <%="you"%> </h3>
							 <h3 class="style7"><span class="style8">Answer For This Question Is=</span> <%=decryptedDesAns%> </h3>
							 <%
							}
									
										
							String sql81="select * from req_res where ((requestfrom='"+uname+"'&&requestto='"+name1+"') || (requestfrom='"+name1+"'&&requestto='"+uname+"')) && status='Accepted'";
								Statement st81=connection.createStatement();
								ResultSet rs81=st81.executeQuery(sql81);
					   			if( rs81.next() )
								{
								
									   count1++;
									 %>
									 <img align="middle" height="100" width="120" src="images.jsp?value=<%="image"%>&id=<%=i2%>"/>
									 <h3 class="style6"><span class="style8">Answer For This Question Given By=</span> <%=name1%> </h3>
									 <h3 class="style7"><span class="style8">Answer For This Question Is=</span> <%=decryptedDesAns%> </h3>
									 <%
						}		}					 
						
			}			
			
			if(count1==0){out.print("No one Of Your Friends Have Answered This Question");}
			
	  %>
	   <h2>&nbsp;</h2>
			<% String type=request.getParameter("type");
			   String pname=request.getParameter("pname");
			if(type.equalsIgnoreCase("sameQues")){%>
            <h2 align="right"><span class="style10"><a href="U_SameQuestions.jsp" class="style9">Back</a></span></h2>
			<span class="style7">
			<%}
			else if(type.equalsIgnoreCase("sameInt")){%>
            </span>
			<h2 align="right" class="style7"><a href="U_SameInterestQuetion.jsp" class="style9">Back</a></h2>
			<span class="style7">
			<%}
			else if(type.equalsIgnoreCase("AllQues")){%>
            </span>
			<h2 align="right" class="style7"><a href="U_AllQueonCat.jsp" class="style9">Back</a></h2>
			<span class="style7">
			<%}
			

			%>
	  
	  
	  </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Sidebar Menu</h2>
          <div class="style3"></div>
          <ul class="sb_menu">
            <li><a href="U_Main.jsp">Home</a></li>
            <li><a href="U_Login.jsp">Logout</a></li>
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
