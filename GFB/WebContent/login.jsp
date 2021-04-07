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

    <h1>Group F Bank</h1>
    <p class = "para1"> GFB: Fluent in Finance.</p>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>

    <form name = "loginForm" method="post" action = "LoginServlet">
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
    
    
        <script>
    var wrap_text = document.querySelector('.para1');
    wrap_text.innerHTML = wrap_text.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

    anime.timeline({loop: true})
    .add({
      targets: '.para1 .letter',
      easing: "easeInOutQuad",
      duration: 5000,
      opacity: [0,1],
      delay: (el, n) => 125 * (n+1)
    }).add({
      targets: '.para1',
      easing: "easeOutExpo",
      duration: 2000,
      opacity: 0,
      delay: 1000
    });
    </script>
</body>
</html>
