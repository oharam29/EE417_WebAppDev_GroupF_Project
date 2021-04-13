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
<!-- create password eye link -->
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<title>GFB: Create Password</title>
</head>
<body>
	<ul>
		<li>
        	<a href="../index.jsp"><img class="logo" src = "images/logo.jpg"/></a>
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
		<h2>Create Password</h2>
		<p>Please enter your password</p>
		
		<form name="form" id="form" class="form"  onsubmit="return checks()" method="POST"  action="/GFB/RegistrationServlet">
 			<input type="password" id="pwd" name="password" onkeydown="keydownFunction()">
            <input id = "btnContinue" type="submit" value="Submit">
        </form>
        
	</div>
	
	<input id = "btnBack" type = "button" value = "Back" onclick ="window.location='additionalInformationStatus.jsp'">
	<!-- <input id = "btnContinue" type = "button" value = "Continue" onclick ="window.location='createAccount.jsp'"> -->
	
	<script>
    	function checks()
    	{
    		var pwd = document.forms["form"]["pwd"].value;
    		var pwd2 = String(pwd);
       	 	var m = pwd.includes("!");
        	var o = pwd.includes("#");
        	var p = pwd.includes("$");
        	var q = pwd.includes("%");
        	var r = pwd.includes("&"); <!-- checks for special characters -->
     		

    	 	 if(m == true|| o == true || p == true || q == true || r == true)
    		{
    			n = true;
    		} else {
    			n = false;
    		
    		}

    	 	if(pwd == null || pwd == "" || n == false || pwd2.length < 6)
        	{
        		alert("Invalid Password. Please makse sure its longer than 6 characters and conatins one of: !, #, $, % or &");
        		return false;
        	}    
    	}
    	return true;
    	</script>
	
	<script>
	function keydownFunction() {
		  document.getElementById("pwd").style.backgroundColor = "red";
		}
	</script>
	
</body>
</html>