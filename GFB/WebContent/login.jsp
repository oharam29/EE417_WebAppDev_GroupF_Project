<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to GFB</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href ="css/login_style.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

    <h1>General Finance Bank</h1>
    <p class = "para1"> With GFB, your savings are your income.</p>

    <form name = "loginForm" method="post" action = "loginAction">
        <p class = "para2">
            
            <input class="inputbox" type="text" name = "uname" id="uname" placeholder="Username" autofocus required/>
            
            <input class="inputbox" type="password" name = "password" id ="password" placeholder="Password" required/>
        
        
        </p>
    	<ul>
            <li><input type="submit" value="Connect"></li>
        
            <li class ="button2"><a href="register_pages/registerPage.jsp ">Sign-up</a></li>
        </ul>
            <!-- <li class ="button1"><a href="main_page.jsp">Connect</a></li> -->
        	<a href="passwordForget.jsp">Forgot password ?</a>
    </form>
    
</body>
</html>
