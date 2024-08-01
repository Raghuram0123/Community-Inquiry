<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Give answer to Question</title>
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
	    <H2>ANSWERED STATUS</H2>
		<%
	try 
		{	
		/* String qname=request.getParameter("qname");
		 String qcat=request.getParameter("qcat");
		 String qdate=request.getParameter("qdate");
		 String question=request.getParameter("question");
		 int quid=Integer.parseInt(request.getParameter("quid"));
		 int qid=Integer.parseInt(request.getParameter("qid"));
		 String answer=request.getParameter("com");
	  
		String type=request.getParameter("type");
	  		*/
		String qname=(String)application.getAttribute("qname");
		String qcat=(String)application.getAttribute("qcat");
		String qdate=(String)application.getAttribute("qdate");
		String question=(String)application.getAttribute("question");
		String quid1=(String)application.getAttribute("quid");
		String qid1=(String)application.getAttribute("qid");
		String type=(String)application.getAttribute("type");	
			
	  	  ArrayList list = new ArrayList();
					
					ServletContext context = getServletContext();
					
					String dirName =context.getRealPath("Gallery/");
					
					String paramname=null,file="",category="",dname="",descr="",mac="",image=null,cloud=null,bin = "";
				
					String answer=null,s1=null,s2=null;
					
					String uname=(String)application.getAttribute("uname");
					
					int j=0;
					
					FileInputStream fs=null;
					
					File file1 = null;	
					
					
						MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024);	
						
						Enumeration params = multi.getParameterNames();
						
						while (params.hasMoreElements()) 
						{
							paramname = (String) params.nextElement();
							
							if(paramname.equalsIgnoreCase("com"))
							{
								answer=multi.getParameter(paramname);
							}
							
						}
							
							
						int f = 0;
						Enumeration files = multi.getFileNames();	
						while (files.hasMoreElements()) 
						{
							paramname = (String) files.nextElement();
							
							if(paramname != null)
							{
								f = 1;
								image = multi.getFilesystemName(paramname);
								String fPath = context.getRealPath("Gallery\\"+image);
								file1 = new File(fPath);
								fs = new FileInputStream(file1);
								list.add(fs);
							
								String ss=fPath;
								FileInputStream fis = new FileInputStream(ss);
								StringBuffer sb1=new StringBuffer();
								int i = 0;
								while ((i = fis.read()) != -1) 
								{
									if (i != -1)
									 {
										//System.out.println(i);
										String hex = Integer.toHexString(i);
										// session.put("hex",hex);
										sb1.append(hex);
										
									
										String binFragment = "";
										int iHex;
			 
										for(int i1= 0; i1 < hex.length(); i1++)
										{
											iHex = Integer.parseInt(""+hex.charAt(i1),16);
											binFragment = Integer.toBinaryString(iHex);
			
											while(binFragment.length() < 4)
											{
												binFragment = "0" + binFragment;
											}
											bin += binFragment;
							
						                }
									}	
									
								}
								
							}		
						}
						
						
		int quid=Integer.parseInt(quid1);
		int qid=Integer.parseInt(qid1);
						FileInputStream fs1 = null;
						
						    SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
							SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
							Date now = new Date();
		
							String strDate = sdfDate.format(now);
							String strTime = sdfTime.format(now);
							String dt = strDate + "   " + strTime;
						
						   	String query="select * from user where username='"+uname+"'"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		if ( rs.next() )
					   		{
								j=rs.getInt(1);
								s1=rs.getString(4);
								s2=rs.getString(5);
								
								
								String keys = "ef50a0ef2c3e3a5f";
								byte[] keyValue = keys.getBytes();
								Key key = new SecretKeySpec(keyValue, "AES");
								Cipher c = Cipher.getInstance("AES");
								c.init(Cipher.ENCRYPT_MODE, key);
								

								String descr2 = new String(Base64.encode(answer.getBytes()));
								
							String query1="select * from answers where question='"+question+"' and ausername='"+uname+"' and qusername='"+qname+"' "; 
						   	Statement st1=connection.createStatement();
						   	ResultSet rs1=st1.executeQuery(query1);
					   		if ( rs1.next() )
					   		{
								%><h2>Answer For This Question Already Exist</h2><%
								}
								else{
   PreparedStatement ps=connection.prepareStatement("insert into answers(qusername,quid,qcategory,question,qdate,ausername,auid,acategory,answer,adate,image) values (?,?,?,?,?,?,?,?,?,?,?)"); 
				
						ps.setString(1,qname);
						ps.setInt(2,quid);
						ps.setString(3,qcat);
						ps.setString(4,question);
						ps.setString(5,qdate);
						ps.setString(6,uname);
						ps.setInt(7,j);
						ps.setString(8,qcat);
						ps.setString(9,descr2);
						ps.setString(10,dt);	
						ps.setBinaryStream(11, (InputStream)fs, (int)(file1.length()));
						
						
						if(f == 0)
							ps.setObject(9,null);
						else if(f == 16)
						{
							fs1 = (FileInputStream)list.get(0);
							ps.setBinaryStream(9,fs1,fs1.available());
						}	
						
						ps.executeUpdate();
						
						%>ANSWER UPDATED SUCCESSFULLY<%
	  				
					}
					
	  }
						String an1="yes";//samequestions
									   
								String query32 ="update questions set answered='"+an1+"' where question='"+question+"' and qusername='"+qname+"' ";
								 		Statement st32=connection.createStatement();
								 		st32.executeUpdate (query32);
										
								String query1 ="update samequestions set answered='"+an1+"' where question='"+question+"' and qusername='"+qname+"' ";
								 		Statement st1=connection.createStatement();
								 		st1.executeUpdate (query1);
	  
	  						
							%><P align="right"><A href="U_GiveAnswer.jsp?qname=<%=qname%>&quid=<%=quid%>&qcat=<%=qcat%>&qdate=<%=qdate%>&question=<%=question%>&qid=<%=qid%>&type=<%=type%>"> Back </a></P><%
						}	
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
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
