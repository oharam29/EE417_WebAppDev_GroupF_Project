<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
        .content{
			margin-left:43%;
			margin-top:-500px;
        }
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href ="../css/registerPage_style.css"/>
<title>GFB: Additional Information Status</title>
</head>
<body>
	<ul>
		<li>
        	<a href="../index.jsp"><img class="logo" src = "../images/logo.jpg"/></a>
        </li>
    </ul>
    <div class = "navBar">
        <ul>
		<li>
        	<a href="registerPage.jsp">Personal Information</a>
        </li>
        <li>
        	<a href="mobilePhoneNumber.jsp">Mobile Phone Number</a>
        </li>
        <li>
        	<a href="homeAddress.jsp">Home Address</a>
        </li>
        <li>
        	<a href="additionalInformation.jsp">Additional Information</a>
        </li>
        <li>
        	<a href="createPassword.jsp">Create Password</a>
        </li>
        <li>
        	<a href="createAccount.jsp">Create Account</a>
        </li>
        </ul>
        </div>
	
	<div class = "content">
		<h2>Additional Information</h2>
		<p>what is your main employment status?</p>
		<form name="form" id="form" class="form" method="POST" action="/GFB/RegistrationServlet">
	   		<select name="employmentStatus">
				<option value="one" selected>Employed (full-time or part-time) </option>	
				<option value="two" >Self-employed or freelance</option>
				<option value="three" >Student</option>	
				<option value="four" >Retired or homemaker</option>	
				<option value="five" >Unemployed</option>
			</select>
			<br>
			<br>
			<input id = "btnContinue" type="submit" value="Submit">
			<input id = "btnBack" type = "button" value = "Back" onclick ="window.location='additionalInformation.jsp'">
		</form>
	</div>
	

	<!-- <input id = "btnContinue" type = "button" value = "Continue" onclick ="window.location='createPassword.jsp'"> -->
</body>
</html>
