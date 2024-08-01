<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Users Question</title>
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
-->
</style>
</head>
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
	  <h2><span class="style6">All Users With Same Questions</span></h2>
	  <table width="600" border="3"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse; margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
					<tr bgcolor="#993366">
					  <td  width="120" height="31" align="center" valign="baseline" style="color: #2c83b0;"><div align="center"><b>Username</b></div></td>
  						
					  <td  width="100" height="31" align="center" valign="baseline" style="color: #2c83b0;"><div align="center"><b>Questions</b></div></td>
					</tr>
								
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
					<%String uname=(String )application.getAttribute("uname");
						
						int i=0,count=0;
						try 
						{
						   		String sql="select * from samequestions where qusername='"+uname+"' ";
								Statement st=connection.createStatement();
								ResultSet rs=st.executeQuery(sql);
					   		while( rs.next() )
								{
								String s1=rs.getString(5);
								
								String sql1="select * from samequestions where qusername!='"+uname+"' and question Like '%"+s1+"%' ";
								Statement st1=connection.createStatement();
								ResultSet rs1=st1.executeQuery(sql1);
					   			while( rs1.next() )
								{
								String s2=rs1.getString(2);
								String s3=rs1.getString(5);
								
								String sql2="select * from req_res where ((requestfrom='"+uname+"'&& requestto='"+s2+"') || (requestfrom='"+s2+"'&&requestto='"+uname+"')) && status='Accepted'";
								Statement st2=connection.createStatement();
								ResultSet rs2=st2.executeQuery(sql2);
					   			while( rs2.next() )
								{
								
								count++;
								
								String decryptedDes= new String(Base64.decode(s3.getBytes()));
					%>
					<tr bgcolor="#FFFFFF">
						<td  width="120" height="40" align="center" valign="middle" style="color:#000000;"><span class="style7">&nbsp;&nbsp;
				       <a href="U_UserProfile.jsp?user=<%=s2%>&type=<%="user7"%>"> <%out.println(s2);%></a>
					  </span></td>
						<td  width="100" height="40"align="center" valign="middle" style="color:#000000;">
							<%out.print(decryptedDes);%>?</td>
						<%
						
						}}}
						connection.close();
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					
					if(count==0){out.print("No One User Have Asked Same Questions");}
					
					%>
		</table>
	  
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
