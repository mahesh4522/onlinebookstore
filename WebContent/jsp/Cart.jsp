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

<title>Cart</title>

<style>
h2{
text-align: center;
font-size: 30px;
}
hr{
margin-bottom: 30px;
}

label{
color: #464646;
font-size: 16px;
font-weight: bold;
text-align: center;
}

#purches {
font-size: 18px;
margin-top: 15px;
background: linear-gradient(#22abe9 5%, #36caf0 100%);
border: 1px solid #0F799E;
padding: 7px 35px;
color: white;
text-shadow: 0px 1px 0px #13506D;
font-weight: bold;
border-radius: 2px;
cursor: default;
width: 100%;
}
#purches:hover{
background: linear-gradient(#36caf0 5%, #22abe9 100%);
}
</style>
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
	String bname=request.getParameter("bname");
	String author=request.getParameter("author");
	String price=request.getParameter("price");
	String bid=request.getParameter("bid");
	
	session.setAttribute("bname", bname);
	session.setAttribute("author", author);
	session.setAttribute("price", price);
	session.setAttribute("bid", bid);
	
%>

<div class="container" style="max-width: 400px;">
<div class="card">
<div class="card-header"> 
	Selected Book Details
</div>
<div class="card-body">


<form action="Confirm.jsp" method="post" name="form">

<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-right text-primary">
		Book Name
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-success">
		<%=bname %>
</div>
</div>

<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-right text-primary">
Author 
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-success">
	<%=author %>
</div>
</div>

<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-right text-primary">
Price 
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-success">
	<%=price %>
</div>
</div>

<div class="row form-group">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-right text-primary">
Quantity 
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-success">
<input type="text" class="form-control text-success"  name="qty" placeholder="Quantity" required>
</div>
</div>

<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<input type="submit" class="btn btn-block btn-success" value="Purchase" name="register" id="register">
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<input type="button" class="btn btn-block btn-danger" value="Cancle" name="cancle" id="cancle" onclick="location.href='Welcome.jsp'"> 
</div>
</div>
</form>
</div>
</div>

</div>
<%} %>
</body>
</html>