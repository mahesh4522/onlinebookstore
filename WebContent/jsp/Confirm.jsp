<%@page import="java.math.BigInteger"%>
<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
var contextPath = '<%=request.getContextPath()%>';
</script>

<link rel="stylesheet" type="text/css" href="/BookStore/css/bootstrap.css"> 
<script type="text/javascript" src="/BookStore/js/bootstrap.js"></script>

<title>Confirm Page</title>

<script type="text/javascript">
function cancle() {
	cancle();
}
</script>

</head>
<body>
<% if(session.getAttribute("contact")==null){
	
	response.sendRedirect(request.getContextPath()+"/jsp/Login.jsp");

	
}else
{ %>


<div style="font-size: 30px; color: white" class="navbar bg-dark form-group">
	Welcome To Online Book Store System
</div>
<div class="row">

<div align="left" class="col" style="margin-right: 20px;">
<p style="font-size:20px ; margin-left:20px; color:black;">Welcome <%=session.getAttribute("firstName")%> <%=session.getAttribute("lastName") %></p>
</div>

<div align="right" class="col" style="margin-right: 20px;">
<a href="<%=request.getContextPath()%>/logout">Log out</a>
</div>
</div>

<% 
	String bprice=String.valueOf(session.getAttribute("price"));
	String bqty=request.getParameter("qty");
	int  fprice=Integer.parseInt(bprice)*Integer.parseInt(bqty);
	session.setAttribute("quantity", bqty);
%>
<center>
<div class="cotainer" style="max-width: 850px">

<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<div class="cointainer form-group">
<div class="card">
<div class="card-header">
Customer Details
</div>
<div class="card-body">
<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<label> Customer Name: </label>
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	<b><%= session.getAttribute("firstName")%> <%=session.getAttribute("lastName")%></b>
</div>
</div>
<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	<label> Address:</label> 
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<b> <%=session.getAttribute("address")%></b>
</div>
</div>
<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	<label> Contact:</label> 
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<b> <%=session.getAttribute("contact")%></b>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

<div class="cointainer">
<div class="card">
<div class="card-header">
Book Details
</div>
<div class="card-body">
<form action="<%=request.getContextPath()%>/orderDetails">
		
<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
Book Name:
		
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<b><%=session.getAttribute("bname") %></b>
		
</div>
</div>	
<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
Author:
		
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<b><%=session.getAttribute("author")%></b>
		
</div>
</div>	
<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
Quantity:
		
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<b><%=bqty %></b>
		
</div>
</div>	
<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
Final Price:
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<b><%=fprice %></b>
<%} %>
</div>
</div>	

</div>
</div>
</div>
</div>



</div>

<div class="row">
<div align="center" class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<input type="submit" class="btn btn-success btn-block"  Value="Purchase">

</div>
<div align="center" class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<input type="button" class="btn btn-danger btn-block" Value="Cancle" onclick="location.href='Welcome.jsp'">

</div>
</div>
</form>
</div>
</center>
</body>
</html>