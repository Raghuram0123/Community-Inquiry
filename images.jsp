<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ include file="connect.jsp" %>
    <%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	
  	try{  
		Blob b=null;
	byte[] imgdata=null;
	     			String value=request.getParameter("value"); 
					String name = request.getParameter("name");

			if(value.equals("user"))
			{
				int id = Integer.parseInt(request.getParameter("id"));
				Statement st=connection.createStatement();
				String strQuery = "select image from user where id='"+id+"'|| username='"+name+"' ";
				ResultSet rs = st.executeQuery(strQuery);
				String imgLen="";
				if(rs.next())
				{
					b=rs.getBlob(1);
					imgdata=b.getBytes(1,(int)b.length());	
				}  
				
				response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        o.write(imgdata);
        o.flush();
        o.close();
		
		}
		else if(value.equals("image"))
		{
				int i=Integer.parseInt(request.getParameter("id")); 
				Statement st=connection.createStatement();
				String strQuery = "select image from document where id='"+i+"' " ;
				ResultSet rs = st.executeQuery(strQuery);
				String imgLen="";
				if(rs.next())
				{
					b=rs.getBlob(1);
					imgdata=b.getBytes(1,(int)b.length());	
				}  
				
				response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        o.write(imgdata);
        o.flush();
        o.close();
		
		}
		else if(value.equals("answer"))
		{
				int id = Integer.parseInt(request.getParameter("id"));
				Statement st=connection.createStatement();
				String strQuery = "select image from answers where  aid='"+id+"' " ;
				ResultSet rs = st.executeQuery(strQuery);
				String imgLen="";
				if(rs.next())
				{
				b=rs.getBlob(1);
					imgdata=b.getBytes(1,(int)b.length());	
				}  
				
				response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        o.write(imgdata);
        o.flush();
        o.close();
		
		}
		else if(value.equals("pimage"))
		{
				String pname=request.getParameter("pname");
				String p_id=request.getParameter("p_id");
				Statement st=connection.createStatement();
				String strQuery = "select image from products where  pname='"+pname+"' and id='"+p_id+"'  " ;
				ResultSet rs = st.executeQuery(strQuery);
				String imgLen="";
				if(rs.next())
				{
				b=rs.getBlob(1);
					imgdata=b.getBytes(1,(int)b.length());	
				}  
				
				response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        o.write(imgdata);
        o.flush();
        o.close();
		}
		else
		{}
		
		
			
			
		
		
  	}
  	catch (Exception e){
    	out.print(e);
  	}
%>

</body>
</html>