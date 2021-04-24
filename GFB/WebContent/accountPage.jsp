<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>GFB: Account Page</title>
        <meta charset="utf-8"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href ="css/navbar.css"/>
        <link rel="stylesheet" href ="css/general.css"/>
        <link rel="stylesheet" href="css/modal.css">
        <link rel="stylesheet" href ="css/accountPage_style.css"/>
        
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
                    <a href="index.html">To main page</a>
                </li>
                <li>
                    <a href="contact.html">Contact</a>
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
		<div class = "logoDiv"><img class="logo" src = "images/logo.jpg"/></div>
		<h1 class = "title">Group F Bank</h1>
		<div id = "profil">Welcome ID<div id = "getId"></div></div><!--  replace Mr. Mark by ${name} -->
	</nav>
	</div>
	<div class = "content">
	<div class = "optionBox">
	
	<fieldset>
		<legend>Balance</legend>
			
				<div class="amount"> <div id = "getBalance"></div>euro</div>			<!-- Replace with ${balance} -->
		</fieldset>
				<input type = "button" class = "transfer" value = "Transfer" onclick = "writeForm('transfer')">
				</br>
				<input type = "button" class = "bills" value = "Bills" onclick = "writeForm('bills')" >
				</br>
				<input type = "button" class = "details.jsp" value = "Details" onclick = "writeForm('details')">
				</br>
				
	<form name="StamentsForm" action="UserStatements.jsp" id = "statement">
		<input type="submit" value = "Statements">
        <input type="hidden" name="id" value = "'${id}'">
           			
    </form>
	</div>
	<script>
	var modal = document.getElementById("myModal");
	function writeForm(action){
		
    	modal.style.display = "block";
    	switch(action)
    	{
    	case "transfer":
    		document.getElementById("modal-title").innerHTML = `Transfer Money to account`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "transferForm" method="post" onsubmit="return checks()" action = "transfer">
    			<label>Entert the amount you want to transfer and the account number:</label>
    	        </br>
    	        <input class = "inputbox" type = "text" placeholder = "Amount" id = "Amount" >
	        	<input class = "inputbox" type = "text" placeholder = "Account Number" id = "ACN">
    	        	</br>
    	        	<input class = "note" type="text" name = "note"  placeholder="Add a note (Optionnal)"/>
        	        	<br>
    	            <input type="submit" value ="Send"/>
    	        </br>
    		</form>`;
    		break;
    	case "bills":
    		document.getElementById("modal-title").innerHTML = `Manage Bills`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "transferForm" method="post" onsubmit="return checks()" action = "transfer">
    			<label>Entert the amount you want to transfer and the account number:</label>
    	        </br>
    	        <input class = "inputbox" type = "text" placeholder = "Amount" id = "Amount" >
	        	<input class = "inputbox" type = "text" placeholder = "IBAN" id = "ACN">
    	        	</br>
    	        	<input class = "note" type="text" name = "note"  placeholder="Add a note (Optionnal)"/>
        	        	<br>
    	            <input type="submit" value ="Send"/>
    	        </br>
    		</form>`;
    		break;
    	case "overdraft":
    		document.getElementById("modal-title").innerHTML = `See Overdraft`;
    		document.getElementById("outputmodal").innerHTML = `your overdraft max is :`;
    		break;
    	case "details":
   			document.getElementById("modal-title").innerHTML = `Seing details`;
    		document.getElementById("outputmodal").innerHTML =
    			`<p>Overdraft limit: ${overdraftlimit}
    			</br>
    			Withdrawal limit: ${withdrawallimit}`
    		break;
    	default:
    		document.getElementById("modal-title").innerHTML = `Somehow yu are seing this...?`;
    		document.getElementById("outputmodal").innerHTML = `Default: check the action name and its place in the switch`;
    		break;
    	}
	
    };</script>
    
     <script>
    	function checks()
    	{
    		var Amount = document.getElementById("Amount").value;
    		var ACN = document.getElementById("ACN").value;
    		var digits =  /^\d+$/;
    		
    		if(Amount == " " || Amount == ""|| digits.test(Amount) == false)
    		{
    			alert('Amount must be a specified numerical amount with NO letters.');
    			return false;
    		}
    		if( ACN == null || ACN == " " || ACN == ""|| digits.test(ACN) == false)
			{
				alert('Account Number must be a specified Account number with NO letters.');
				return false;
			}
    		return true;
    	}
    </script>
    
	
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
	var id = '${id}';
	var balance1 = '${balance}';
	var ol = '${overdraftlimit}';
	var wl = '${withdrawallimit}';
	localStorage.setItem("id", id);
	localStorage.setItem("balance", balance1);
	localStorage.setItem("OvL", ol);
	localStorage.setItem("WdL", wl);
	document.getElementById("getId").innerHTML = id;
	</script>
	
	<script>
	document.getElementById("getBalance").innerHTML = balance1;
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