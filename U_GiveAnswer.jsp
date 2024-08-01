<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Aswer the Questions</title>
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
.style7 {color: #00FFFF}
.style8 {color: #000000}
-->
</style>
<script language="javascript" type="text/javascript">
function valid()
{
var na3=document.s.com.value;
if(na3=="")

{
alert("Please Enter Answer");
document.s.com.focus();
return false;
}

}
</script>
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
	  <h2><span class="style7">Give Answer For <%=request.getParameter("qname")%> Question</span></h2>
			 <table width="500" align="center" >
		<%
	try 
		{	
		 String qname=request.getParameter("qname");
		 application.setAttribute("qname",qname);
		 String qcat=request.getParameter("qcat");
		 application.setAttribute("qcat",qcat);
		 String qdate=request.getParameter("qdate");
		 application.setAttribute("qdate",qdate);
		 String question=request.getParameter("question");
		 application.setAttribute("question",question);
		 String quid=request.getParameter("quid");
		 application.setAttribute("quid",quid);
		 String qid=request.getParameter("qid");
		  application.setAttribute("qid",qid);
		 String type=request.getParameter("type");
		 application.setAttribute("type",type);
		 
		 String decryptedDes= new String(Base64.decode(question.getBytes()));
						  						
					%>
					<tr align="center" bgcolor="#FFFFFF">
					<td colspan="3">
					
				<img src="images.jsp?id=<%=quid%>&value=<%="user"%>" width="130" height="100" align="middle" />				</td>
				</tr>
				<tr>
				  <td width="120" height="0" bgcolor="#FFFFFF"> <h4 class="style26 style6" >User id:</h4></td>
				  <td width="498" bgcolor="#FFFFFF" class="style28 style9 style8" > <%=quid%></td>
				</tr>
				<tr>
				  <td height="0" bgcolor="#FFFFFF"> <h4 class="style28 style6" >User Name:</h4></td>
					<td bgcolor="#FFFFFF" class="style28 style9 style8" > <%=qname%></td>
				</tr>
				<tr>
				  <td height="0" bgcolor="#FFFFFF"> <h4 class="style28 style6" >Question:</h4></td>
					<td bgcolor="#FFFFFF" class="style28 style9 style8" > <%=decryptedDes%></td>
				</tr>
				
				<tr>
				  <td height="0" bgcolor="#FFFFFF"> <h4 class="style28 style6" >Updated Date:</h4></td>
					<td bgcolor="#FFFFFF" class="style28 style9 style8" > <%=qdate%></td>
				</tr>
				
	<form name="s" action="U_GiveAnswer1.jsp?qname=<%=qname%>&quid=<%=quid%>&qcat=<%=qcat%>&qdate=<%=qdate%>&question=<%=question%>&qid=<%=qid%>&type=<%=type%>" method="post" enctype="multipart/form-data" onSubmit="return valid()"  ons target="_top">
    
	<table width="1000" border="0" align="center"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse; display:inline; margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
					<tr>
 						<td   width="100" height="45" align="left" valign="middle" bgcolor="#00FFFF" style="color: #2c83b0;"><div align="left" class="style1" style="margin-left:20px;">Answer</div></td>

						<td  width="100" align="left" valign="middle" height="45" style="color: #2c83b0;"><div align="left"><div align="left" style="margin-left:20px;"><textarea name="com" rows="3" cols="50"></textarea></div></td>
					</tr>
					<tr>
 						<td   width="100" height="45" align="left" valign="middle" bgcolor="#00FFFF" style="color: #2c83b0;"><div align="left" class="style1" style="margin-left:20px;">Add Image</div></td>

						<td  width="100" align="left" valign="middle" height="45" style="color: #2c83b0;"><div align="left"><div align="left" style="margin-left:20px;"><input name="pic" type="file" class="text " id="pic" /></div></td>
					</tr>
					
					<div > <tr><td height="45" colspan="2" id="learn_more" align="center"  style="color:#003399;"><input type="submit" value="Add Answer" style="width:100px; height:35px; background-color:#999999; color:#003399;"/>
					<input type="reset" name="Reset" style="width:100px; height:35px; background-color:#999999; color:#003399;"/></td></tr></div>
					
	        </table>
	 </form>
	 
	 <%
	 if(type.equalsIgnoreCase("all")){
	 %>
	  <p align="right"><a href="U_AllQueonCat.jsp">Back</a></p><%
	  }else if(type.equalsIgnoreCase("interest")){%>
		<p align="right"><a href="U_SameInterestQuetion.jsp">Back</a></p><%
      }else if(type.equalsIgnoreCase("questions")){%>
		<p align="right"><a href="U_SameQuestions.jsp">Back</a></p><%
      }       		
						
					
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
	 </table>
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
