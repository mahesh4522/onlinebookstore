<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="/BookStore/css/bootstrap.css"> 
<script type="text/javascript" src="/BookStore/js/bootstrap.js"></script>

<title>Welcome</title>
</head>
<body>
<% if(session.getAttribute("contact")==null){
	
	response.sendRedirect(request.getContextPath()+"/jsp/Login.jsp");

	
}else
{ %>



<%! ResultSet rs; %>

<div  class="navbar bg-dark pull-left">
<p style="font-size:30px ;color: white;">Welcome To Online Book Store System</p>
</div>
<div class="row">

<div align="left" class="col" style="margin-right: 20px;">
<p style="font-size:20px ; margin-left:20px; color:black;">Welcome <%=session.getAttribute("firstName")%> <%=session.getAttribute("lastName") %></p>
</div>

<div align="right" class="col" style="margin-right: 20px;">
<a href="<%=request.getContextPath()%>/logout">Log out</a>
</div>
</div>



<div class="container">
<div class="card">
<div class="card-header">
<b>Please Select Book</b>
</div>
<div class="card-body">
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/bookstore","root","toor");
	Statement statement=connection.createStatement();
	rs=statement.executeQuery("select * from books");
}catch(Exception e)
{
	out.print(e);	
}
%>
  <div class="table-responsive"> 
<table class="table table-condensed table-hover">
<thead align="center">
<tr>
	<th>
		#
	</th>
	<th>
		Book Name
	</th>
	<th>
		Author
	</th>
	<th>
		Price (Rs)
	</th>
	<th>
		Select Book
	</th>
</tr>
</thead>
<% while(rs.next())
{
%>
	<tbody align="center">
<tr>
	<td>
		<%=rs.getInt(1)%>
	</td>
	<td>
	<%= rs.getString(3)%>
	</td>
	<td>
		<%= rs.getString(4) %>
	</td>
	<td>
		<%= rs.getInt(5) %>
	</td>
	<td>
	<a href="Cart.jsp?bid=<%=rs.getString(2)%>&bname=<%=URLEncoder.encode(rs.getString(3))%>&author=<%=rs.getString(4)%>&price=<%=rs.getString(5)%>">Select</a>
	</td>
</tr>

<% } %>
</tbody>
</table>
</div>
</div>

<% } %>
</div>
<div align="right" class="card-footer">
<p class="text-info">tip: You can select only one book at a time</p>
</div>
</div>


</body>
</html>