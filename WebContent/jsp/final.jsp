<!DOCTYPE html>
<html>
<head><meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/BookStore/css/bootstrap.css"> 
<script type="text/javascript" src="/BookStore/js/bootstrap.js"></script><title>Insert title here</title>
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

<center> <pre>
<hr color="Turquoise" size="4">
<h2>Your Order Has Been Confirmed. The Books Shall be Deleverd within 2 days.</h2>
   <h1>Thank You!!</h1>	
<hr color="Turquoise" size="4">
			</pre></center>
<% }%>
</body>
</html>