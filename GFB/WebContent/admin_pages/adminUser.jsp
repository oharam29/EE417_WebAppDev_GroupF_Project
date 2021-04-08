<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>GFB: Admin User Page</title>
        <meta charset="utf-8"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    	<link rel="stylesheet" href="../css/adminUser_style.css">
    	<link rel="stylesheet" href ="../css/navbar.css"/>
        <link rel="stylesheet" href ="../css/general.css"/>
        <link rel="stylesheet" href="../css/modal.css">
    	
    </head>
<body>

	<div class = navbox>
	<nav>
	<ul class = "navlinks">
                <li>
                    <a href="../admin_pages/adminPage.jsp">Home</a>
                </li>
                <li>
                    <a href="#none">News</a>
                </li>
                    
                <li>
                    <a href="../accountPage.jsp">Leave Admin</a>
                </li>
                <li>
                    <a href="../admin_pages/adminUser.jsp">Admin User</a>
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
		<div class = "logoDiv"><img class="logo" src = "../images/tempLogo.png"/></div>
		<h1 class = "title">Group F Bank</h1>
		<div id = "profil"><a href="signup_page.jsp ">Welcome Admin</a></div>	<!--  replace Mr. Mark by ${name} -->
	</nav>
	</div>
	<div class = "content">
		<h2>Now modifying Mr. Mark</h2>			<!-- replace Mark with the name of the person -->
		<form class = "buttons">
		<input type = "button" class = "delete" value = "Delete User" onclick = "writeForm('delete')">
		<input type = "button" class = "deposit" value = "Simulate Deposit" onclick = "writeForm('deposit')" >
		<input type = "button" class = "withdraw" value = "Simulate Withdraw" onclick = "writeForm('withdraw')">
		<input type = "button" class = "overdraft" value = "Set Overdraft" onclick = "writeForm('overdraft')">
		<input type = "button" class = "limits" value = "Set Withdraw limit" onclick = "writeForm('limits')">
		<input type = "button" class = "user" value = "Back to User" onclick = "writeForm('user')">
		</form>
		</div>
	
	
	<script>
	var modal = document.getElementById("myModal");
	function writeForm(action){
		
    	modal.style.display = "block";
    	switch(action)
    	{
    	case "delete":
    		document.getElementById("modal-title").innerHTML = `Deleting User`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "deleteForm" method="post" action = "deleteConfirm">
    			<label>Are you sure you want to delete this user ?</label>
    	        </br>
    	            <input type="submit" value ="Yes"/>
    	            <input type="button" value = "No"/>
    	        </br>
    		</form>`;
    		break;
    	case "deposit":
    		document.getElementById("modal-title").innerHTML = `Deposit Simulation`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "depositForm" method="post" action = "simulateDeposit">
    			<label for="amount">Enter the amount to deposit: </label>
    	        </br>
    	            <input type="text" name = "amount"  placeholder="Amount"/>
    	            <input type="submit" value ="Deposit"/>
    	        </br>
    		</form>`;
    		break;
    	case "withdraw":
    		document.getElementById("modal-title").innerHTML = `Withdraw Simulation`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "withdrawForm" method="post" action = "simulateWithdraw">
    			<label for="amount">Enter the amount to withdraw: </label>
    	        </br>
    	            <input type="text" name = "amount"  placeholder="Amount"/>
    	            <input type="submit" value ="Withdraw"/>
    	        </br>
    		</form>`;
    		break;
    	case "overdraft":
    		document.getElementById("modal-title").innerHTML = `Setting Overdraft`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "overdraftForm" method="post" action = "setOverdraft">
			<label>Enter the new max Overdraft: </label>
	        </br>
	            <input type="text" name = "amount"  placeholder="Overdraft"/>
	            <input type="submit" value ="Set"/>
	        </br>
		</form>`;
    		break;
    	case "limits":
    		document.getElementById("modal-title").innerHTML = `Setting Limits`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "limitsForm" method="post" action = "setLimits">
			<label>Enter the new monthly payement limit: </label>
	        </br>
	            <input type="text" name = "amount"  placeholder="Amount"/>
	            <input type="submit" value ="Set"/>
	        </br>
		</form>`;
    		break;
    	case "user":
    		document.getElementById("modal-title").innerHTML = `Seing users`;
    		document.getElementById("outputmodal").innerHTML = `you see users`;
    		break;
    		
    	default:
    		document.getElementById("modal-title").innerHTML = `That is the default sir	`;
    		document.getElementById("outputmodal").innerHTML = `hello`;
    		break;
    	}
    	
    };

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
	<script src = "../app.js"></script>
	
</body>
</html>