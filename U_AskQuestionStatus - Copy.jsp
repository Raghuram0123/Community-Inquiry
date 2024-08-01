<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Ask Question</title>
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
.style6 {color: #FF0000}
.style7 {color: #00FF00}
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
	  <h2>Answer Status</h2>
	   <%
	  try{	    
		
      		String category=request.getParameter("category");
			String q1=request.getParameter("t2").toLowerCase();
			String q2=request.getParameter("t3").toLowerCase();
			String ask1=request.getParameter("ask");
			
			String q3=(q1+" "+q2);
			String an1="",answer="",answerby="";
			
			String q21 = new String(Base64.encode(q2.getBytes()));
			String q31 = new String(Base64.encode(q3.getBytes()));
			
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
			Date now = new Date();
		
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
			
      		String uname=(String)application.getAttribute("uname");
							
				
			String query1="select * from user where username='"+uname+"' "; 
        	Statement st1=connection.createStatement();
       		ResultSet rs1=st1.executeQuery(query1);
				if ( rs1.next() )
	   				{	
					int ui=rs1.getInt(1);
		
		
		String query="select * from questions where question LIKE '%"+q21+"' and qusername='"+uname+"' "; 
        Statement st=connection.createStatement();
        ResultSet rs=st.executeQuery(query);
			if ( rs.next()==true )
	   			{//main open
	
				String query2="select * from document where dname LIKE '"+q2+"%' "; 
        		Statement st2=connection.createStatement();
       			ResultSet rs2=st2.executeQuery(query2);
					if ( rs2.next()==true )//1 open
	   					{	
							int i1=rs2.getInt(1);
							String daname=rs2.getString(2);
							String ansname=rs2.getString("uname");
							String Con=rs2.getString(7);
							
							String sql8="select * from req_res where ((requestfrom='"+uname+"'&&requestto='"+ansname+"') || (requestfrom='"+ansname+"'&&requestto='"+uname+"')) && status='Accepted'";
								Statement st8=connection.createStatement();
								ResultSet rs8=st8.executeQuery(sql8);
					   			if( rs8.next() )
								{
										String keyWord = "5765586965748666502846";
										keyWord = keyWord.substring(0, 16);
										byte[] keyValue = keyWord.getBytes();
										Key key = new SecretKeySpec(keyValue, "AES");
										Cipher c2 = Cipher.getInstance("AES");
										c2.init(Cipher.ENCRYPT_MODE, key);
									
									   String decryptedDes= new String(Base64.decode(Con.getBytes()));
									   
									    an1="yes";
									   
							String query32 ="update questions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"' ";
								 		Statement st32=connection.createStatement();
								 		st32.executeUpdate (query32);
									
							String query320 ="update samequestions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"'";
								 		Statement st320=connection.createStatement();
								 		st32.executeUpdate (query320);	
									
									if(ask1.equalsIgnoreCase("ask")){
									  
									  		String query123="select rank from document where dname LIKE '"+q2+"%' "; 
        									Statement st123=connection.createStatement();
       										ResultSet rs123=st123.executeQuery(query123);
											if ( rs123.next()==true )
	   										{	
									  			int rank12=rs123.getInt(1);
												int rank123=rank12+1;
												
									  	String query321 ="update document set rank='"+rank123+"' where dname LIKE '"+q2+"%' ";
								 		Statement st321=connection.createStatement();
								 		st321.executeUpdate (query321);       
										}}
									
									 an1="yes";	
PreparedStatement ps1=connection.prepareStatement("insert into samequestions(qusername,quid,qcategory,question,date,answered) values (?,?,?,?,?,?)"); 
				
						ps1.setString(1,uname);
						ps1.setInt(2,ui);
						ps1.setString(3,category);
						ps1.setString(4,q31);
						ps1.setString(5,dt);
						ps1.setString(6,an1);
						
						ps1.executeUpdate();
						
PreparedStatement ps=connection.prepareStatement("insert into autoanswers(qusername,question,ausername,dname,answer,adate,did) values (?,?,?,?,?,?,?)"); 
				
						ps.setString(1,uname);
						ps.setString(2,q31);
						ps.setString(3,ansname);
						ps.setString(4,daname);
						ps.setString(5,Con);
						ps.setString(6,dt);
						ps.setInt(7,i1);
						
						ps.executeUpdate();
								
									   
								%>
								
								 <img align="middle" height="100" width="120" src="images.jsp?value=<%="image"%>&id=<%=i1%>"/>
								<h3><span class="style6">Answer By=</span> <%=ansname%> </h3>
								<h3><span class="style6">Answer For Your Question Is=</span> <%=decryptedDes%> </h3>
	   <%
					}
					else{
					
				String query3="select * from answers where question LIKE '%"+q21+"' "; 
    		    Statement st3=connection.createStatement();
       			ResultSet rs3=st3.executeQuery(query3);
					if ( rs3.next()==true )
	  					{
						    int i2=rs3.getInt(1);
							answer=rs3.getString(10);
							answerby=rs3.getString(7);
							
							String sql81="select * from req_res where ((requestfrom='"+uname+"'&&requestto='"+answerby+"') || (requestfrom='"+answerby+"'&&requestto='"+uname+"')) && status='Accepted'";
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
							String decryptedDes= new String(Base64.decode(answer.getBytes()));
							   an1="yes";
									   
							String query32 ="update questions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"' ";
								 		Statement st32=connection.createStatement();
								 		st32.executeUpdate (query32);
							
							String query320 ="update samequestions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"'";
								 		Statement st320=connection.createStatement();
								 		st32.executeUpdate (query320);
									
									
											 an1="yes";	
PreparedStatement ps1=connection.prepareStatement("insert into samequestions(qusername,quid,qcategory,question,date,answered) values (?,?,?,?,?,?)"); 
				
						ps1.setString(1,uname);
						ps1.setInt(2,ui);
						ps1.setString(3,category);
						ps1.setString(4,q31);
						ps1.setString(5,dt);
						ps1.setString(6,an1);
						
						ps1.executeUpdate();
								
									   
									   
								%>
								<img align="middle" height="100" width="120" src="images.jsp?value=<%="answer"%>&id=<%=i2%>"/>
								<h3><span class="style6">Answered By=</span> <%=answerby%> </h3>
								<h3><span class="style6">Answer For Your Question Is=</span> <%=decryptedDes%> </h3>
	   <%
				}else{out.print("Question Uploaded Successfully");}
				}else{out.print("Question Uploaded Successfully");}
				}
				}
				else
				{//1 open

				String query3="select * from answers where question LIKE '%"+q21+"' "; 
    		    Statement st3=connection.createStatement();
       			ResultSet rs3=st3.executeQuery(query3);
					if ( rs3.next()==true )
	  					{
						    int i2=rs3.getInt(1);
							answer=rs3.getString(10);
							answerby=rs3.getString(7);
							
							String sql81="select * from req_res where ((requestfrom='"+uname+"'&&requestto='"+answerby+"') || (requestfrom='"+answerby+"'&&requestto='"+uname+"')) && status='Accepted'";
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
							String decryptedDes= new String(Base64.decode(answer.getBytes()));
							   an1="yes";
									   
							String query32 ="update questions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"' ";
								 		Statement st32=connection.createStatement();
								 		st32.executeUpdate (query32);
									
							String query320 ="update samequestions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"'";
								 		Statement st320=connection.createStatement();
								 		st32.executeUpdate (query320);	
								
									
											 an1="yes";	
PreparedStatement ps1=connection.prepareStatement("insert into samequestions(qusername,quid,qcategory,question,date,answered) values (?,?,?,?,?,?)"); 
				
						ps1.setString(1,uname);
						ps1.setInt(2,ui);
						ps1.setString(3,category);
						ps1.setString(4,q31);
						ps1.setString(5,dt);
						ps1.setString(6,an1);
						
						ps1.executeUpdate();
								
									   
									   
								%>
								<img align="middle" height="100" width="120" src="images.jsp?value=<%="answer"%>&id=<%=i2%>"/>
								<h3><span class="style6">Answered By=</span> <%=answerby%> </h3>
								<h3><span class="style6">Answer For Your Question Is=</span> <%=decryptedDes%> </h3>
	   <%
				}else{out.print("Question Uploaded SuccessFully");}}
				else{
				
					String query4="select * from questions where question='"+q31+"' "; 
    		    	Statement st4=connection.createStatement();
       				ResultSet rs4=st4.executeQuery(query4);
						if ( rs4.next()==true )
	  						{
							 an1="no";	
PreparedStatement ps1=connection.prepareStatement("insert into samequestions(qusername,quid,qcategory,question,date,answered) values (?,?,?,?,?,?)"); 
				
						ps1.setString(1,uname);
						ps1.setInt(2,ui);
						ps1.setString(3,category);
						ps1.setString(4,q31);
						ps1.setString(5,dt);
						ps1.setString(6,an1);
						
						ps1.executeUpdate();
							
				
						}
						else{
			 an1="no";
		
	    PreparedStatement ps=connection.prepareStatement("insert into questions(qusername,quid,qcategory,question,date,answered) values (?,?,?,?,?,?)"); 
				
						ps.setString(1,uname);
						ps.setInt(2,ui);
						ps.setString(3,category);
						ps.setString(4,q31);
						ps.setString(5,dt);
						ps.setString(6,an1);	
						
						ps.executeUpdate();	
						
						PreparedStatement ps1=connection.prepareStatement("insert into samequestions(qusername,quid,qcategory,question,date,answered) values (?,?,?,?,?,?)"); 
				
						ps1.setString(1,uname);
						ps1.setInt(2,ui);
						ps1.setString(3,category);
						ps1.setString(4,q31);
						ps1.setString(5,dt);
						ps1.setString(6,an1);
						
						ps1.executeUpdate();
						
						
					}
				
		%>
</p>
                  <h3 >&nbsp;</h3>
                  <h3 class="style7" >Question Uploaded Sucessfully !</h3>
                  <p class="style30">&nbsp;</p>
                  </p>
                  <%
				
				}
				
				} //1 close
							
							
							
				
		}//main close
		else{
			
			String query4="select * from questions where question='"+q31+"' and qusername='"+uname+"' "; 
    		    	Statement st4=connection.createStatement();
       				ResultSet rs4=st4.executeQuery(query4);
						if ( rs4.next()==true )
	  						{
							 an1="no";	
PreparedStatement ps1=connection.prepareStatement("insert into samequestions(qusername,quid,qcategory,question,date,answered) values (?,?,?,?,?,?)"); 
				
						ps1.setString(1,uname);
						ps1.setInt(2,ui);
						ps1.setString(3,category);
						ps1.setString(4,q31);
						ps1.setString(5,dt);
						ps1.setString(6,an1);
						
						ps1.executeUpdate();
							
				
						}
						else{
			
		
			 an1="no";
		
	    PreparedStatement ps=connection.prepareStatement("insert into questions(qusername,quid,qcategory,question,date,answered) values (?,?,?,?,?,?)"); 
				
						ps.setString(1,uname);
						ps.setInt(2,ui);
						ps.setString(3,category);
						ps.setString(4,q31);
						ps.setString(5,dt);
						ps.setString(6,an1);	
						
						ps.executeUpdate();	
						
					PreparedStatement ps1=connection.prepareStatement("insert into samequestions(qusername,quid,qcategory,question,date,answered) values (?,?,?,?,?,?)"); 
				
						ps1.setString(1,uname);
						ps1.setInt(2,ui);
						ps1.setString(3,category);
						ps1.setString(4,q31);
						ps1.setString(5,dt);
						ps1.setString(6,an1);
						
						ps1.executeUpdate();	
						
				}		
					String query2="select * from document where dname LIKE '"+q2+"%' "; 
        		Statement st2=connection.createStatement();
       			ResultSet rs2=st2.executeQuery(query2);
					if ( rs2.next()==true )//1
	   					{	
							int i1=rs2.getInt(1);
							String daname=rs2.getString(2);
							String ansname=rs2.getString("uname");
							String Con=rs2.getString(7);
		
								String sql8="select * from req_res where ((requestfrom='"+uname+"'&&requestto='"+ansname+"') || (requestfrom='"+ansname+"'&&requestto='"+uname+"')) && status='Accepted'";
								Statement st8=connection.createStatement();
								ResultSet rs8=st8.executeQuery(sql8);
					   			if( rs8.next() )
								{
								
										String keyWord = "5765586965748666502846";
										keyWord = keyWord.substring(0, 16);
										byte[] keyValue = keyWord.getBytes();
										Key key = new SecretKeySpec(keyValue, "AES");
										Cipher c2 = Cipher.getInstance("AES");
										c2.init(Cipher.ENCRYPT_MODE, key);
									
									   String decryptedDes= new String(Base64.decode(Con.getBytes()));
									   
									    an1="yes";
									   
							String query32 ="update questions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"' ";
								 		Statement st32=connection.createStatement();
								 		st32.executeUpdate (query32);
									  
							String query320 ="update samequestions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"'";
								 		Statement st320=connection.createStatement();
								 		st32.executeUpdate (query320);			  
									   
									  if(ask1.equalsIgnoreCase("ask")){
									  
									  		String query123="select rank from document where dname LIKE '"+q2+"%' "; 
        									Statement st123=connection.createStatement();
       										ResultSet rs123=st123.executeQuery(query123);
											if ( rs123.next()==true )
	   										{	
									  			int rank12=rs123.getInt(1);
												int rank123=rank12+1;
												
									  	String query321 ="update document set rank='"+rank123+"' where dname LIKE '"+q2+"%' ";
								 		Statement st321=connection.createStatement();
								 		st321.executeUpdate (query321);       
										}}
										
 PreparedStatement ps=connection.prepareStatement("insert into autoanswers(qusername,question,ausername,dname,answer,adate,did) values (?,?,?,?,?,?,?)"); 
				
						ps.setString(1,uname);
						ps.setString(2,q31);
						ps.setString(3,ansname);
						ps.setString(4,daname);
						ps.setString(5,Con);
						ps.setString(6,dt);
						ps.setInt(7,i1);
						
						ps.executeUpdate();
								
								
									   
								%>
								<img align="middle" height="100" width="120" src="images.jsp?value=<%="image"%>&id=<%=i1%>"/>
								<h3><span class="style6">Answered By=</span> <%=ansname%> </h3>
								<h3><span class="style6">Answer For Your Question Is=</span> <%=decryptedDes%> </h3>
	   <%
						}else{
						String query3="select * from answers where question LIKE '%"+q21+"' "; 
    		    Statement st3=connection.createStatement();
       			ResultSet rs3=st3.executeQuery(query3);
					if ( rs3.next()==true )
	  					{
							int i2=rs3.getInt(1);
							answer=rs3.getString(10);
							answerby=rs3.getString(7);
										
									String sql81="select * from req_res where ((requestfrom='"+uname+"'&&requestto='"+answerby+"') || (requestfrom='"+answerby+"'&&requestto='"+uname+"')) && status='Accepted'";
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
							String decryptedDes= new String(Base64.decode(answer.getBytes()));
							   an1="yes";
									   
							String query32 ="update questions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"'";
								 		Statement st32=connection.createStatement();
								 		st32.executeUpdate (query32);
								
							String query320 ="update samequestions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"'";
								 		Statement st320=connection.createStatement();
								 		st32.executeUpdate (query320);	
									   
									   
									   		 an1="yes";	
PreparedStatement ps1=connection.prepareStatement("insert into samequestions(qusername,quid,qcategory,question,date,answered) values (?,?,?,?,?,?)"); 
				
						ps1.setString(1,uname);
						ps1.setInt(2,ui);
						ps1.setString(3,category);
						ps1.setString(4,q31);
						ps1.setString(5,dt);
						ps1.setString(6,an1);
						
						ps1.executeUpdate();
								
								   
									   
								%>
								<img align="middle" height="100" width="120" src="images.jsp?value=<%="answer"%>&id=<%=i2%>"/>
								<h3><span class="style6">Answered By=</span> <%=answerby%> </h3>
								<h3><span class="style6">Answer For Your Question Is=</span> <%=decryptedDes%> </h3>
	   <%
				}else{out.print("Question Uploaded Successfully");}
				
				}else{out.print("Question Uploaded Successfully");}
				}}
						else{//2 open

				String query3="select * from answers where question LIKE '%"+q21+"' "; 
    		    Statement st3=connection.createStatement();
       			ResultSet rs3=st3.executeQuery(query3);
					if ( rs3.next()==true )
	  					{
							int i2=rs3.getInt(1);
							answer=rs3.getString(10);
							answerby=rs3.getString(7);
										
									String sql81="select * from req_res where ((requestfrom='"+uname+"'&&requestto='"+answerby+"') || (requestfrom='"+answerby+"'&&requestto='"+uname+"')) && status='Accepted'";
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
							String decryptedDes= new String(Base64.decode(answer.getBytes()));
							   an1="yes";
									   
							String query32 ="update questions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"'";
								 		Statement st32=connection.createStatement();
								 		st32.executeUpdate (query32);
									   
							String query320 ="update samequestions set answered='"+an1+"' where question LIKE '%"+q21+"' and qusername='"+uname+"'";
								 		Statement st320=connection.createStatement();
								 		st32.executeUpdate (query320);		   
									   
									   
									   		 an1="yes";	
PreparedStatement ps1=connection.prepareStatement("insert into samequestions(qusername,quid,qcategory,question,date,answered) values (?,?,?,?,?,?)"); 
				
						ps1.setString(1,uname);
						ps1.setInt(2,ui);
						ps1.setString(3,category);
						ps1.setString(4,q31);
						ps1.setString(5,dt);
						ps1.setString(6,an1);
						
						ps1.executeUpdate();
								
								   
									   
								%>
								<img align="middle" height="100" width="120" src="images.jsp?value=<%="answer"%>&id=<%=i2%>"/>
								<h3><span class="style6">Answered By=</span> <%=answerby%> </h3>
								<h3><span class="style6">Answer For Your Question Is=</span> <%=decryptedDes%> </h3>
	   <%
				}else{out.print("Question Uploaded SuccessFully");}}
				else
				{
				
		%>
</p>
                  <h3 >&nbsp;</h3>
                  <h3 class="style7" >Question Uploaded Sucessfully !</h3>
                  <p class="style30">&nbsp;</p>
                  </p>
                  <%
		}}}}//2close
		
		String sql80="select * from req_res where (requestfrom='"+uname+"' || requestto='"+uname+"') && status='Accepted' ";
								Statement st80=connection.createStatement();
								ResultSet rs80=st80.executeQuery(sql80);
					   			if( rs80.next() )
								{}
				else{out.print(" You Have No Friends");
				}
		
						%><p align="right"><a href="U_AskQuestion.jsp">Back</a></p>
<%

		connection.close();
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
