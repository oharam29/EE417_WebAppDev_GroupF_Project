<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href ="../css/registerPage_style.css"/>
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
		
		<form name="form" id="form" class="form" onsubmit="return checks()" method="POST" action="RegistrationServlet">
			<p>First Name <input type="text" name="fname" id="fname" required> Last Name <input type="text" name="lname" id="lname" required></p>
			<p>Email Address <input type="text" name="mail" id="mail" required></p>
			<p>
				Date of Birth
				<!-- When mouse focus on date, it will disappear, when it leave, it display again  -->
				<input type="text" name="dateBirth" id="dateBirth" value="DD/MM/YYYY" 
				onfocus="this.value=''" 
				onblur="if(this.value==''){this.value='DD/MM/YYYY'}" required>	
			</p>
			<input id = "btnContinue" type="submit" value="Submit">
		</form>
	</div>
	
	<input id = "btnBack" type = "button" value = "Back" onclick ="window.location='registerPage.jsp'">
	<!-- <input id = "btnContinue" type = "button" value = "Continue" onclick ="window.location='mobilePhoneNumber.jsp'"> -->
<script>
function checks()
{
	var fname = document.getElementById("fname").value;
	var lname = document.getElementById("lname").value;
	var email = document.getElementById("mail").value;
	var DoB = document.getElementById("dateBirth").value;
	var digits =  /^\d+$/;
	var DoB_test = /(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$/; <!-- Makes sure the format is DD/MM/YYYY -->
	
	if (fname == "" || fname == " "|| digits.test(fname) == true) <!-- checks that the name contains no digits -->
	{
       alert("First name must be filled out and contain no numbers!");
	   return false;
	}
	if (lname == "" || lname == " "|| digits.test(lname) == true) <!-- checks that the name contains no digits -->
	{
       alert("Last name must be filled out and contain no numbers!");
	   return false;
	}
	if(email == "" || email == " "||/\S+@\S+\.\S+/.test(email)==false) <!-- checks than an email contains an "@" symbol and a "." symbol (for.com,.ie,etc) -> https://ui.dev/validate-email-address-javascript/-->
	{
		alert("please enter a valid email address");
		return false;
	}
	if (DoB == "" || DoB == " "|| DoB_test.test(DoB) == false) <!-- checks that the DoB foolows the correct regex -->
	{
       alert("Date of birth must contain no letters, must not be blank and must be in the form: DD/MM/YYYY");
	   return false;
	}
	document.getElementById('fname').disabled = true;
	document.getElementById('lname').disabled = true;
	document.getElementById('mail').disabled = true;
	document.getElementById('dateBirth').disabled = true;
	return true;
}
</script>

</body>
</html>