<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>GFB: Account Page</title>
        <meta charset="utf-8"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href ="css/accountPage_style.css"/>
        <link rel="stylesheet" href ="css/navbar.css"/>
        <link rel="stylesheet" href ="css/general.css"/>
        <link rel="stylesheet" href="css/modal.css">
        
        <style>
        .AnimationHeader {text-align: center;font-size: 50px;font-weight: 500;font-color: #003300;}
        .AnimationHeader .letter {display: inline-block;line-height: 3px;font-color: #003300;}
        .AnimationHeader .line2 { bottom: 0; }
        .AnimationHeader .wrap-text { position: relative;display: inline-block;padding-top: 2px; padding-bottom: 10px; padding-right: 2px;}
        .AnimationHeader .line {background-color: #99ccff; position: absolute;left: 0; width: 100%; height: 5px;background-color: #99ccff;}
        .AnimationHeader .line1 { top: 2; }
        </style>
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
                    <a href="./admin_pages/adminPage.jsp">Go Admin</a>
                </li>
                    
                <li>
                    <a href="../login.jsp">Disconnect</a>
                </li>
            </ul>
            <div class = "burger">
                <div class = "line1"></div>
                <div class = "line2"></div>
                <div class = "line3"></div>
            </div>
		<div class = "logoDiv"><img class="logo" src = "images/tempLogo.png"/></div>
		<h1 class = "title">Group F Bank</h1>
		<div id = "profil"><a href="signup_page.jsp ">Welcome User </a></div><div id = "getId"></div>	<!--  replace Mr. Mark by ${name} -->
	</nav>
	</div>
	<div class = "content">
	<form method = "get" action = "balanceAction" id = "balance">
	<fieldset>
		<legend>Balance</legend>
			
				<div class="amount"> + 207.64€ </div>			<!-- Replace with ${balance} -->
		
				<input type = "button" class = "transfer" value = "Transfer" onclick = "writeForm('transfer')">
				</br>
				<input type = "button" class = "bills" value = "Bills" onclick = "writeForm('bills')" >
				</br>
				<input type = "button" class = "standingOrders" value = "Standing Orders" onclick = "writeForm('standingOrders')">
				</br>
				<input type = "button" class = "overdraft" value = "Overdraft" onclick = "writeForm('overdraft')">
				</br>
				<input type = "button" class = "loans" value = "Loans" onclick = "writeForm('loans')">
				</br>
				<input type = "button" class = "details.jsp" value = "Details" onclick = "writeForm('details.jsp')">
				</br>
		
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
	
	<script>
	var modal = document.getElementById("myModal");
	function writeForm(action){
		
    	modal.style.display = "block";
    	switch(action)
    	{
    	case "transfer":
    		document.getElementById("modal-title").innerHTML = `Transfer Money to account`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "transferForm" method="post" action = "transfer">
    			<label>Entert the amount you want to transfer and the account number:</label>
    	        </br>
    	        	<input type = "text" placeholder = "Amount">
    	        	<input type = "text" placeholder = "Account Number">
    	        	</br>
    	            <input type="submit" value ="Send"/>
    	        </br>
    		</form>`;
    		break;
    	case "bills":
    		document.getElementById("modal-title").innerHTML = `Manage Bills`;
    		document.getElementById("outputmodal").innerHTML = `Manage your bills here`;
    		break;
    	case "standingOrders":
    		document.getElementById("modal-title").innerHTML = `Standing Orders`;
    		document.getElementById("outputmodal").innerHTML = `Here are the standing orders`;
    		break;
    	case "overdraft":
    		document.getElementById("modal-title").innerHTML = `See Overdraft`;
    		document.getElementById("outputmodal").innerHTML = `your overdraft max is :`;
    		break;
    	case "loans":
    		document.getElementById("modal-title").innerHTML = `Setting Loans`;
    		document.getElementById("outputmodal").innerHTML = `so you want a loan uh ?`;
    		break;
    	case "details":
    		document.getElementById("modal-title").innerHTML = `Seing details`;
    		document.getElementById("outputmodal").innerHTML = `you see details`;
    		break;
    		
    	default:
    		document.getElementById("modal-title").innerHTML = `That is the default sir	`;
    		document.getElementById("outputmodal").innerHTML = `hello`;
    		break;
    	}
	
    };</script>
	
	<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
      <div class="modal-header">
        <span class="close" id = "closecross">&times;</span>
        <h2 id = "modal-title">Your info</h2>
      </div>
      <div class="modal-body">
        <p id = "outputmodal"></p>
      </div>
      <div class="modal-footer">
        <h3>   </h3>
      </div>
    </div>
  
  </div>
	
	
	</div>
	
	<br /><br /><br /><br /><br />
	<h1 class="AnimationHeader">
        <span class="wrap-text">
    		<span class="line line1"></span>
    		 <span class="letters">GFB: Fluent in finance.</span>
    		 <span class="line line2"></span>
 			</span>
      </h1>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
	
	<script src = "app.js"></script>
	
	<script>
		var id = '{id}';
		localStorage.setItem("id", id);
		document.getElementById("getId").innerHTML = id;
	</script>
	
	<script>
	var wrap_text = document.querySelector('.AnimationHeader .letters');
	wrap_text.innerHTML = wrap_text.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
	anime.timeline({loop: true})
	  .add({
	    targets: '.AnimationHeader .letter',
	    scale: [0.5,1],
	    opacity: [0,1],
	    easing: "easeOutExpo",
	    duration: 5000,
	    delay: (el, n) => 125 * (n+1)
	  });
	</script>
</body>
</html>