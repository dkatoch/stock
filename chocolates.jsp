<html>
<head>
<script>


function backButtonOverrideBody()
{

  try {
    history.forward(1);
  } catch (e) {
  }

  setTimeout("backButtonOverrideBody()", 0);
}
</script>
</head>

<body bgcolor="pink" onLoad="backButtonOverrideBody()">
<%!
        String Username;
%>
<%
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires",0L);
response.setHeader("Pragma","No-cache");
%>
<%
System.out.println("session: "+session);
Username =(String)session.getValue("adminusername");
if(Username==null)

{
%>
<jsp:forward page ="LoginPage.jsp"/>

<%
}
%>

<center>
<font face="Times New Roman" size="4"> <b> <u> Online Stock </b> </u> </font>
</center>
<br>
<br><div align="right">
<a href="Logout.jsp" >Logout</a>
</div>
<div align="left">
<a href="AdminMasterPage.jsp" >Home</a>
</div>
<br>
<br>
<br>
<u> <b> Stock of Chocolates: </u> </b>
<br>
<br>
<%@ page import="stock.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%
ResultSet rs=null;
CJdbc obj=new CJdbc( );
String query="select Itemname,  CurrentStock from tblChoclates ";
rs=obj.executeQuery(query);
int i=0;
%>
<table border="1" cellspacing="1" cellpadding="1" bordercolor="blue">
<tr>
<td> <b> ID </b></td>
<td> <b> Name </b></td>
<td> <b> Current Stock </b>  </td>
</tr>
<%
while(rs.next())
{ i++;
%>
<tr>
<td><%=i%> </td>
<td><%=rs.getString("Itemname")%></td>

<td><%=rs.getInt("CurrentStock")%> </td>
<td><a href="DeleteItem.jsp?ItemName=<%=rs.getString("Itemname")%>&ItemType=Chocolates">Delete</a> </td>
</tr>
<%
}
%>
</table>
<br>
<br>
<a href="AddNew.jsp?ItemType=Chocolates">Add New Item</a>
<br><br>
<a href="AdminMasterPage.jsp"> Go Back </a>
</body>
</html>





