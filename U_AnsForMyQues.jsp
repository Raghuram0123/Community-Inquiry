<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Answers for My questions</title>
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
.style6 {color: #000000}
.style7 {color: #FF00FF}
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
	  <h2><span class="style7">All Users Answered For My Questions</span></h2>
	   <table width="650" height="70" border="3"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse;  margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
					<tr bgcolor="#990033">
					  <td  width="107" height="0" valign="baseline" style="color: #2c83b0;"><div align="center"><strong> Sl No. </strong></div></td>
					  <td  width="105" height="0" valign="baseline" style="color: #2c83b0;"><div align="center"><b>Question Category</b></div></td>
					  <td   width="139" height="0" valign="baseline" style="color: #2c83b0;"><div align="center"><strong>Question</strong></div></td>
					  <td   width="139" height="0" valign="baseline" style="color: #2c83b0;"><div align="center"><strong>Answered By</strong></div></td>
					  <td   width="139" height="0" valign="baseline" style="color: #2c83b0;"><div align="center"><strong>Answer</strong></div></td>
					  <td   width="139" height="0" valign="baseline" style="color: #2c83b0;"><div align="center"><strong>Image</strong></div></td>
					</tr>
	  <%
	  	String uname=(String)application.getAttribute("uname");
		String quser="",qcategory="",question="",qdate="",qqueue="",inte="",answer="",userna="";
		int quid=0,qid=0,id=0,count=0;
		
	
	  	String query="select * from questions where qusername='"+uname+"' "; 
        Statement st=connection.createStatement();
        ResultSet rs=st.executeQuery(query);
			while ( rs.next()==true )
	   			{
					id=rs.getInt(1);
					quser=rs.getString(2);
					quid=rs.getInt(3);
					qcategory=rs.getString(4);
					question=rs.getString(5);
					qdate=rs.getString(6);
					qqueue=rs.getString(7);
						
						//and qcategory='"+inte+"'
					String decryptedDes= new String(Base64.decode(question.getBytes()));	
				
				
				String query3="select * from answers where question LIKE '%"+question+"' "; 
    		    Statement st3=connection.createStatement();
       			ResultSet rs3=st3.executeQuery(query3);
					if ( rs3.next()==true )
	  					{
							int i2=rs3.getInt(1);
							userna=rs3.getString(7);
							answer=rs3.getString(10);
							
							String sql8="select * from req_res where ((requestfrom='"+uname+"'&&requestto='"+userna+"') || (requestfrom='"+userna+"'&&requestto='"+uname+"')) && status='Accepted'";
								Statement st8=connection.createStatement();
								ResultSet rs8=st8.executeQuery(sql8);
					   			if( rs8.next() )
								{
							
							count++;
							
										String keyWord = "5765586965748666502846";
										keyWord = keyWord.substring(0, 16);
										byte[] keyValue = keyWord.getBytes();
										Key key = new SecretKeySpec(keyValue, "AES");
										Cipher c2 = Cipher.getInstance("AES");
										c2.init(Cipher.ENCRYPT_MODE, key);
							String decryptedDesAns= new String(Base64.decode(answer.getBytes()));
						
						qid++;
						
				%>		
				<tr bgcolor="#FFFFFF">
							  <td  width="105" height="60" valign="middle" style="color:#000000;">
							    <div align="center" class="style8 style6">
			      <%=qid%>		          </div></td>	
								
								<td  width="114" valign="middle"><div align="center" class="style8 style6">
                                  <%=qcategory%>
                  </div></td>
								<td  width="114" height="60" valign="middle">
							      <div align="center" class="style8 style6">
		          <%=decryptedDes%>?</div></td>
				  </td>
								<td  width="114" height="60" valign="middle">
							      <div align="center" class="style8 style6">
		          <a href="U_UserProfile.jsp?user=<%=userna%>&type=<%="user1"%>"><%=userna%></a>      </div></td>
				  </td>
								<td  width="114" height="60" valign="middle">
							      <div align="center" class="style8 style6">
		     <textarea rows="10" cols="30">     <%=decryptedDesAns%>		  </textarea>        </div></td>
				  <td  width="114" height="60" valign="middle">
							      <div align="center" class="style8 style6">
		          <img align="middle" height="100" width="120" src="images.jsp?value=<%="answer"%>&id=<%=i2%>"/>	          </div></td>

		  </tr>
				<%}}}
				
				if(count==0){out.print("No One Have Answered Your Question");}
				
				%>
  	    </table>
		<p>&nbsp;</p>
	  <p align="right"><a href="U_Main.jsp">Back</a></p>
	  
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
