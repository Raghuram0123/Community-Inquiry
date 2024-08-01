<%@ include file="connect.jsp" %><%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%            
try{
	Blob b=null;
	byte[] imgdata=null;
 // int i=Integer.parseInt(request.getParameter("id")); 
				Statement st=connection.createStatement();
				String strQuery = "select image from document where id='5' " ;
				ResultSet rs = st.executeQuery(strQuery);
				String imgLen="";
				if(rs.next())
				{
					b=rs.getBlob(1);
					imgdata=b.getBytes(1,(int)b.length());	
				}  
				
				response.setContentyType("image/gif");
				OutputStream o=response.getOutputStream();
				o.write(imgdata);
				o.flush();
				o.close();
				}catch(Exception e){}
				%> <img align="middle" height="100" width="120" src="image.jsp"/>