<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>GFB: Admin User Page</title>
        <meta charset="utf-8"/>
    	<link rel="stylesheet" href="adminUser_style.css">
    	<link rel="stylesheet" href ="navbar.css"/>
        <link rel="stylesheet" href ="general.css"/>
    	
    </head>
<body>

	<div class = navbox>
	<nav>
	<ul class = "navlinks">
                <li>
                    <a href="adminPage.jsp">Home</a>
                </li>
                <li>
                    <a href="#none">News</a>
                </li>
                    
                <li>
                    <a href="#none">Messages</a>
                </li>
                <li>
                    <a href="#settings">Settings</a>
                </li>
                    
                <li>
                    <a href="login.jsp">Disconnect</a>
                </li>
            </ul>
            <div class = "burger">
                <div class = "line1"></div>
                <div class = "line2"></div>
                <div class = "line3"></div>
            </div>
		<div class = "logoDiv"><img class="logo" src = "images/tempLogo.png"/></div>
		<h1 class = "title">General Finance Bank</h1>
		<div id = "profil"><a href="signup_page.jsp ">Welcome Admin</a></div>	<!--  replace Mr. Mark by ${name} -->
	</nav>
	</div>
	<div class = "content">
		<h2>Now modifying Mr. Mark</h2>			<!-- replace Mark with the name of the person -->
		<div class = "buttonGroup">
		<button class = "delete">Delete User</button>
		<button class = "deposit">Simulate Deposit</button>
		<button class = "withdraw">Simulate Withdraw</button>
		<button class = "overdtaft">Set Overdraft</button>
		<button class = "limits">Set Withdraw limit</button>
		<button class = "user">Back to User</button>
		</div>
	
	
	
	</div>
	<script src = "app.js"></script>
	
</body>
</html>