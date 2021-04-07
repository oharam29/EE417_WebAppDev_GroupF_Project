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
<title>GFB: Create Account</title>
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
		<h2>Create Account</h2>
		<p>To create your GFB account, please agree to the Terms & Conditions.</p>
		<form name="form" id="form" class="form"   onsubmit="return checks()" method="POST" action="../login.jsp">
    	<label>
    		<input type="checkbox" id = "TC">Terms & Conditions
    	</label><br/>
        <label>
    		<input type="checkbox" id = "PP">Privacy Policy
    	</label><br/>
        <label>
    		<input type="checkbox" id = "CV">Contact Visibility
    	</label><br/>
        <label>
    		<input type="checkbox" id = "PU">Product Updates
    	</label><br/>
        <label>
    		<input type="checkbox" id = "MP">Marketing Partners
    	</label><br/>
    	<input id = "btnContinue" type="submit" value="Submit">
    	</form>
    </div>
    
	<input id = "btnBack" type = "button" value = "Back" onclick ="window.location='createPassword.jsp'">
<!--   <input id = "btnContinue" type = "button" value = "Finish" onclick ="window.location='#'">
 -->	
 
 <script>
 function checks()
 {
	 if (document.getElementById('TC').checked == false || document.getElementById('PP').checked == false || document.getElementById('CV').checked == false ||document.getElementById('PU').checked == false || document.getElementById('MP').checked == false) 
	 {
		 alert('Please accept all of the Terms and conditions');
		 return false;
	 }
	 return true;
 }
 
 </script>
</body>
</html>