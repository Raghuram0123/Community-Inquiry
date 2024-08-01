
<%
try
{

%><html>
<head>
<title>Video Results</title>
<script type="text/javascript" src="sources/jscharts.js"></script>
</head>
<%@ include file="connect.jsp"%>
<body>
<div id="graph">Loading graph...</div>
<script type="text/javascript">
var myData=new Array();
var colors=[];

<%
	int i=0;
	
	String s1=null;
	int rank=0;
				
				String query="select * from document"; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				  {
					s1=rs.getString(2);
					rank=rs.getInt(10);
						
						%>		
						myData["<%=i%>"]=["<%=s1 %>",<%=rank%>];
						<%
						i++;
					
			}
	%>
	
	var myChart = new JSChart('graph', 'bar');
	myChart.setDataArray(myData);
	myChart.setBarColor('#42aBdB');
	myChart.setBarOpacity(0.8);
	myChart.setBarBorderColor('#D9EDF7');
	myChart.setBarValues(true);
	myChart.setTitleColor('#8C8383');
	myChart.setAxisColor('#777E89');
	myChart.setSize(500,350);
	myChart.setAxisValuesColor('#777E81');
	myChart.draw();
	
</script>

</body>
</html>
<%
}
catch(Exception e)
{
e.printStackTrace();
}
%>

