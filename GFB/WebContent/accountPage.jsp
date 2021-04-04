<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>GFB: Account Page</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href ="css/accountPage_style.css"/>
        <link rel="stylesheet" href ="css/navbar.css"/>
        <link rel="stylesheet" href ="css/general.css"/>
    </head>
<body>

	<div class = navbox>
	<nav>
	<ul class = "navlinks">
                <li>
                    <a href="#top">Home</a>
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
		<div id = "profil"><a href="signup_page.jsp ">Welcome Mr. Mark</a></div>	<!--  replace Mr. Mark by ${name} -->
	</nav>
	</div>
	<div class = "content">
	<form method = "get" action = "balanceAction" id = "balance">
	<fieldset>
		<legend>Balance</legend>
			
				<div class="amount"> + 207.64€ </div>			<!-- Replace with ${balance} -->
			
			<ul class = "operations">
				<li><a href = "transfers.jsp">Transfers</a></li>
				<li><a href = "bills.jsp">Bills</a></li>
				<li><a href = "standingOrders.jsp">Standing Orders</a></li>
				<li><a href = "loans.jsp">Loans</a></li>
				<li><a href = "details.jsp">Details</a></li>
				<li><a href = "limits.jsp">Limits</a></li>
			</ul>
	</fieldset>
	</form>
	
	
	<form method = "get" action = "historyAction" id = "history">
	<fieldset>
		<legend>History</legend>
			<ul class = "historyValue">
				<li>test -47</li>
				<li>bonjour +35</li>
				<li>pub -140</li>
				<li>market -26</li>
				<li>rent -650</li>
				<li>salary + 850</li>
				<li>VIR +120</li>
			</ul>
	</fieldset>
	</form>
	</div>
	<script src = "app.js"></script>
	
</body>
</html>