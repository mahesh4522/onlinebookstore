<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>Forget Password</title>
<script type="text/javascript">
function val(){
	if(document.form.userid.value.length != 10)
		{
		alert("Please Enter 10 digit Contact number only.");
		form.userid.focus();
		return false;
		
		}
	else if(isNaN(form.contact.value))
	{
		alert("Please Enter Valid Contact number");
		form.userid.focus();
		return false;
	
	}else if (document.form.pincode.value.length != 6) {
		alert("Please Enter 6 digit Pincode.");
		form.pincode.focus();
		return false;
	}
	
	
	
	else if(isNaN(form.pincode.value))
		{
		alert("Please Enter Valid Pincode");
		form.pincode.focus();
		return false;
		}
}

</script>

</head>
<body>
<div class="navbar bg-dark form-group">
<p style="font-size:30px ;color: white;">Welcome To Online Book Store System</p>
</div>
<div class="container" style="max-width: 500px;">
<div class="card">
<div align="center" class="card-header">
Please Enter Below Details Correctly to Change Password
</div>
<div class="card-body">
<form action="updatepass">
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<label>User Id</label>
</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<input type="number" class="form-control" name="userid" placeholder="Contact_Number" maxlength="10" required="required" title="Must Contain excat 10 digit Contact Number" /><br>
</div>
</div>
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
<label>E-mail</label>	
</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<input type="email" name="email" class="form-control" id="email" placeholder="Email Id" title="Please Enter Correct E-mail Address" required="required" /><br>
</div>
</div>
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<label>Pincode</label>
</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<input type="number" name="pincode" class="form-control" placeholder="Pincode" required><br>
</div>
</div>
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<label>New Password</label>
</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<input type="password" name="newpassword" class="form-control" placeholder="New Password" required><br>
</div>
</div>
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<label>Confirm Password</label>
</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<input type="password" name="cnewpassword" class="form-control" placeholder="Confirm New Password" required><br>
</div>
</div>
<div class="row">
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	<input type="submit" class="btn btn-success btn-block" Value="Update Password" >
</div>
<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	<input type="button" class="btn btn-danger btn-block" value="Cancle" name="cancle" id="cancle" onclick="location.href='Welcome.jsp'">
</div>
</div>
</form>

</div>
</div>

</div>

</body>
</html>