<!DOCTYPE html>
<html>
<head>
<title>Registration</title>
<!-- <link rel="stylesheet" type="text/css" href="mystyle.css"> -->
<meta charset="ISO-8859-1">
<script type="text/javascript">
var contextPath = '<%=request.getContextPath()%>';
</script>

<link rel="stylesheet" type="text/css" href="/BookStore/css/bootstrap.css"> 
<script type="text/javascript" src="/BookStore/js/bootstrap.js"></script>

<script type="text/javascript">
function val(){
	if(document.form.contact.value.length != 10)
		{
		alert("Please Enter 10 digit Contact number only.");
		form.contact.focus();
		return false;
		}
	else if(isNaN(form.contact.value))
	{ 
		alert("Please Enter Valid Contact number");
		form.contact.focus();
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

<div class="navbar navbar-expand-lg navbar-dark bg-dark form-group" style="font-size:30px ;color: white;">
Welcome To Online Book Store
</div>
<div class="container" style="max-width: 400px;">
<div class="card" >
<div class="card-header" align="center">
		Registration
</div>
<div class="card-body">
<form class="form" name="form" method="post" action="<%=request.getContextPath()%>/registrationPage">
		<input type="text" class="form-control form-group" name="fname" id="fname" placeholder="First Name" required="required">
		<input type="text" class="form-control form-group" name="lname" id="lname" placeholder="Last Name" required="required"> 
		<textarea name=address class="form-control form-group" style="height:50px" placeholder="Address" required="required"></textarea>
		<input type="number" class="form-control form-group"  name="contact" placeholder="Contact Number" maxlength="10" required="required" title="Must Contain excat 10 digit Contact Number" />
		<input type="password" class="form-control form-group" name="password" id="password" placeholder="Password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required="required" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" />
		<input type="email" class="form-control form-group" name="email" id="email" placeholder="Email Id" title="Please Enter Correct E-mail Address" required="required" />
		<input type="text" class="form-control form-group" name="city" placeholder="City" required="required" />
		<input type="number" class="form-control form-group" name="pincode" placeholder="Pincode" maxlength="6" required="required" />
<input type="submit"  name="register" class="btn btn-success btn-block" id="register" value="SUBMIT" onclick="return val();">
</form>
</div>
<div class="card-footer">
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
<a style="float: right" href="<%= request.getContextPath() %>/jsp/Login.jsp">Already Registered? Login Here</a>
</div>
</div>
</div>
</div>
</div>

</body>
</html>