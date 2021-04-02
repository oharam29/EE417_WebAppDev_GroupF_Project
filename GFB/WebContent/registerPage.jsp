<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href ="registerPage_style.css"/>
<title>GFB: Register Page</title>
</head>
<body>

	<ul>
		<li>
        	<a href="index.jsp"><img class="logo" src = "images/logo.jpg"/></a>
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
		<h2> Personal Information</h2>
		<p>To get started, tell us about yourself.</p>
		<p>First Name <input type="text"> Last Name <input type="text"></p>
		<p>Email Address <input type="text"></p>
		<p>
			Date of Birth
			<!-- When mouse focus on date, it will disappear, when it leave, it display again  -->
			<input type="text" value="DD/MM/YYYY" 
			onfocus="this.value=''" 
			onblur="if(this.value==''){this.value='DD/MM/YYYY'}">	
		</p>
	</div>
	<input id = "btnBack" type = "button" value = "Back" onclick ="window.location='registerPage.jsp'">
	<input id = "btnContinue" type = "button" value = "Continue" onclick ="window.location='mobilePhoneNumber.jsp'">

</body>
</html>