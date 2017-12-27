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

<title>Login</title>
<!-- <style>
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

#login {
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
width: 20%;
}
#login:hover{
background: linear-gradient(#36caf0 5%, #22abe9 100%);
}

</style> -->
<script type="text/javascript">
function validate()
{
	if(document.form.userid != 10 )
		{
		alert("user id is your contact number which is entered during registration")
		form.userid.focus();
		
		}else if(isNaN(form.contact.value))
		{
			alert("Please Enter Valid Contact number");
			form.contact.focus();
			return false;
		
		}	
}
</script>


</head>
<body>
<div class="navbar navbar-expand-lg navbar-dark bg-dark form-group" style="font-size:30px ;color: white;">
Welcome To Online Book Store
</div>

<div class="container" style="max-width: 500px">
<div class="card">
<div class="card-header">
Login
</div>
<div class="card-body">
<form action="<%=request.getContextPath()%>/loginPage" method="post" name="form">
		<label> User Id </label> 
		<input class="form-control form-group" type="text" name="userid" placeholder="Contact_Number" maxlength="10" pattern="\d{10}"  required title="Please enter exactly 10 digits Contact Number"  />
		<label> Password </label> 
		<input class="form-control form-group" type="password" name="password" placeholder="Password" required />
		<input type="submit" class="btn btn-success btn-block form-group" Value="Login" name="login" id="login" >
</form>	
</div>
<div class="card-footer">
<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<a href="ForgetPass.jsp">Forget Password</a>
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
<a style="float: right" href="<%= request.getContextPath() %>/jsp/Registration.jsp">Not Register? Register Here</a>
</div>
</div>
</div>
</div>
</div>
</body>
</html>