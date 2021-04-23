<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>GFB: Admin User Page</title>
        <meta charset="utf-8"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminUser_style.css">
    	<link rel="stylesheet" href ="<%= request.getContextPath() %>/css/navbar.css"/>
        <link rel="stylesheet" href ="<%= request.getContextPath() %>/css/general.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/modal.css">
    	 
    </head>
<body>

	<div class = navbox>
	<nav>
	<ul class = "navlinks">
                <li>
                    <a href="../index.html">To main page</a>
                </li>
                <li>
                    <a href="adminPage.jsp">See all Users</a>
                </li>
                   
                <li>
                    <a href="LogoutServlet">Disconnect</a>
                </li>
            </ul>
            <div class = "burger">
                <div class = "line1"></div>
                <div class = "line2"></div>
                <div class = "line3"></div>
            </div>
		<div class = "logoDiv"><img class="logo" src = "/GFB/images/logo.jpg"/></div>
		<h1 class = "title">Group F Bank</h1>
		<div id = "profil"><a>Welcome Admin</a></div>	
	</nav>
	</div>
	<div class = "content">
					<!-- replace Mark with the name of the person -->
		<form class = "buttons">
		<input type = "button" class = "delete" value = "Delete User" onclick = "writeForm('delete')">
		<input type = "button" class = "deposit" value = "Simulate Deposit" onclick = "writeForm('deposit')" >
		<input type = "button" class = "withdraw" value = "Simulate Withdraw" onclick = "writeForm('withdraw')">
		<input type = "button" class = "overdraft" value = "Set Overdraft" onclick = "writeForm('overdraft')">
		<input type = "button" class = "limits" value = "Set Withdraw limit" onclick = "writeForm('limits')">
		<!-- <input type = "button" class = "user" value = "Back to Users" onclick="document.location='./admin_pages/adminPage.jsp'"> -->
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
    		document.getElementById("outputmodal").innerHTML = `<form name = "deleteForm" method="post" onsubmit="return checks()" action = "deleteConfirm">
    			<label>Are you sure you want to delete this user ?</label>
    	        </br>
    	        	<input class = "inputbox" type="text" name = "ID" id = "ID" placeholder="User ID"/>
    	        	<br>
    	            <input type="submit" value ="Yes"/>
    	            <input type="button" value = "No"/>
    	        </br>
    		</form>`;
    		break;
    	case "deposit":
    		document.getElementById("modal-title").innerHTML = `Deposit Simulation`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "depositForm" method="post" onsubmit="return checks1()"action = "simulateDeposit">
    			<label for="amount">Enter the amount to deposit: </label>
    	        </br>
    	        <input class = "inputbox" type="text" name = "ID"  id = "ID1" placeholder="User ID"/>
    	        	<br>
    	            <input class = "inputbox" type="text" name = "amount" id = "amount1" placeholder="Amount"/>
    	            	<br>
    	            	<input class = "note" type="text" name = "note"  id = "note1" placeholder="Add a note (Optionnal)"/>
            	        	<br>
    	            <input type="submit" value ="Deposit"/>
    	        </br>
    		</form>`;
    		break;
    	case "withdraw":
    		document.getElementById("modal-title").innerHTML = `Withdraw Simulation`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "withdrawForm" method="post" onsubmit="return checks2()" action = "simulateWithdraw">
    			<label for="amount">Enter the amount to withdraw: </label>
    	        </br>
    	        <input class = "inputbox" type="text" name = "ID"  id = "ID2" placeholder="User ID"/>
    	        	<br>
    	            <input class = "inputbox" type="text" name = "amount" id = "amount2" placeholder="Amount"/>
    	            	<br>
    	            	<input class = "note" type="text" name = "note" id = "note2" placeholder="Add a note (Optionnal)"/>
            	        	<br>
    	            <input type="submit" value ="Withdraw"/>
    	        </br>
    		</form>`;
    		break;
    	case "overdraft":
    		document.getElementById("modal-title").innerHTML = `Setting Overdraft`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "overdraftForm" method="post" onsubmit="return checks3()"action = "setOverdraft">
			<label>Enter the new max Overdraft: </label>
	        </br>
	        <input class = "inputbox" type="text" name = "ID"  id = "ID3" placeholder="User ID"/>
	        	<br>
	            <input class = "inputbox" type="text" name = "amount" id = "amount3" placeholder="Overdraft"/>
	            <br>
	            <input type="submit" value ="Set"/>
	        </br>
		</form>`;
    		break;
    	case "limits":
    		document.getElementById("modal-title").innerHTML = `Setting Limits`;
    		document.getElementById("outputmodal").innerHTML = `<form name = "limitsForm" method="post" onsubmit="return checks4()"action = "setLimits">
			<label>Enter the new monthly payement limit: </label>
	        </br>
	        <input class = "inputbox" type="text" name = "ID"  id = "ID4" placeholder="User ID"/>
	        	<br>
	            <input class = "inputbox" type="text" name = "amount"  id = "amount4" placeholder="Withdraw Limit"/>
	            	<br>
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
	<script src = "./app.js"></script>
	<script src = "../app.js"></script>
	<script>
	function checks()
	{
		var ID = document.getElementById("ID").value;
		var digits =  /^\d+$/;
		if(ID == " " || ID == ""|| digits.test(ID) == false)
		{
			alert('ID must be a specified number with NO letters.');
			return false;
		}
		return true;
	}
	</script>
	<script>
	function checks1()
	{
		var ID = document.getElementById("ID1").value;
		var amount = document.getElementById("amount1").value;
		var note = document.getElementById("note1").value;
		var digits =  /^\d+$/;
		
		if(ID == " " || ID == ""|| digits.test(ID) == false)
		{
			alert('ID must be a specified number with NO letters.');
			return false;
		}
		if(amount == " " || amount == ""|| digits.test(amount) == false)
		{
			alert('Amount must be a specified number with NO letters.');
			return false;
		}
		if(note == " " || note == "")
		{
			alert('Note must be filled out. Type N/A if no note is attached.');
			return false;
		}
		return true;
	}
	</script>
	<script>
	function checks2()
	{
		var ID = document.getElementById("ID2").value;
		var amount = document.getElementById("amount2").value;
		var note = document.getElementById("note2").value;
		var digits =  /^\d+$/;
		
		if(ID == " " || ID == ""|| digits.test(ID) == false)
		{
			alert('ID must be a specified number with NO letters.');
			return false;
		}
		if(amount == " " || amount == ""|| digits.test(amount) == false)
		{
			alert('Amount must be a specified number with NO letters.');
			return false;
		}
		if(note == " " || note == "")
		{
			alert('Note must be filled out. Type N/A if no note is attached.');
			return false;
		}
		return true;
	}
	</script>
	<script>
	function checks3()
	{
		var ID = document.getElementById("ID3").value;
		var amount = document.getElementById("amount3").value;
		var digits =  /^\d+$/;
		
		if(ID == " " || ID == ""|| digits.test(ID) == false)
		{
			alert('ID must be a specified number with NO letters.');
			return false;
		}
		if(amount == " " || amount == ""|| digits.test(amount) == false)
		{
			alert('Overdraft must be a specified number with NO letters.');
			return false;
		}
		return true;
	}
	</script>
	<script>
	function checks4()
	{
		var ID = document.getElementById("ID4").value;
		var amount = document.getElementById("amount4").value;
		var digits =  /^\d+$/;
		
		if(ID == " " || ID == ""|| digits.test(ID) == false)
		{
			alert('ID must be a specified number with NO letters.');
			return false;
		}
		if(amount == " " || amount == ""|| digits.test(amount) == false)
		{
			alert('Withdraw limit must be a specified number with NO letters.');
			return false;
		}
		return true;
	}
	</script>
	
</body>
</html>