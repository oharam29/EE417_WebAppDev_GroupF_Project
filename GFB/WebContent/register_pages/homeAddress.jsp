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
<title>GFB: Home Address</title>
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
		<h2>Home Address</h2>
		<p>Your GFB card will be shipped to this address. We can only<br/>
	       send cards to residential addresses.</p>
	 
		<!-- use my location -->
		<form name="form" id="form" class="form"  onsubmit="return checks()" method="POST" action="../RegistrationServlet">
			<p>House Number(Type 0 if N/A) <input type="text" name = "houseNum" id = "houseNum" required> Street Name <input type="text" name = "streetName" id = "streetName" required></p>
		
			<p>		
				<!-- When mouse focus on date, it will disappear, when it leave, it display again  -->
				<input name="address1" id = "address1" type="text"  value = "PostCode"
				onfocus="this.value=''" 
				onblur="if(this.value==''){this.value='Postcode'}" required>
				
				<input name="addresse2" id = "address2" type="text" value = "City"
				onfocus="this.value=''" 
				onblur="if(this.value==''){this.value='City'}" required>		
			
				<input name="address3" id = "address3" type="text" value = "Country"
				onfocus="this.value=''" 
				onblur="if(this.value==''){this.value='Country'}" required>	
			</p>
			<p>
				<input name = "addInfo" id = "additionalInformation" type="text" value = "AdditionalInformation"
				onfocus="this.value=''" 
				onblur="if(this.value==''){this.value='Additional Information'}" required>		
			</p>
			<input id = "btnContinue" type="submit" value="Submit">
		</form>
	</div>
	
	<input id = "btnBack" type = "button" value = "Back" onclick ="window.location='mobilePhoneNumber.jsp'">
	<!-- <input id = "btnContinue" type = "button" value = "Continue" onclick ="window.location='additionalInformation.jsp'"> -->
	
	
	<script>
	function checks()
	{
		var HouseNumber = document.getElementById("houseNum").value;
		 var StreetName = document.getElementById("streetName").value;
		 var PostCode = document.getElementById("address1").value;
		 var City = document.getElementById("address2").value;
		 var Country = document.getElementById("address3").value;
		 var AddInfo = document.getElementById("additionalInformation").value;
		var digits =  /^\d+$/; 
		var number = /\d/;
	
		if (HouseNumber == "" || HouseNumber == " " || digits.test(HouseNumber) == false) <!-- checks that the House Number contains no letters -->
		{
       		alert("House Number must be filled out and contain no letters!");
	   		return false;
		}
		 if (StreetName == "" || StreetName == " "|| number.test(StreetName) == true) <!-- checks that the street name contains no digits -->
		{
       		alert("Street Name must be filled out and contain no numbers!");
	   		return false;
		}
	 	if (PostCode == "" || PostCode == " "  || PostCode == "PostCode") 
		{
       		alert("Post Code must be filled out!");
	   		return false;
		}
		if (City == "" || City == " "|| number.test(City) == true || City == "City") <!-- checks that City contains no digits -->
		{
       		alert("City must be filled out and contain no numbers!");
	   		return false;
		}
		if (Country == "" || Country == " "|| number.test(Country) == true || Country == "Country") <!-- checks that Country contains no digits -->
		{
       		alert("Country must be filled out and contain no numbers!");
	   		return false;
		}
		if (AddInfo == "" || AddInfo == " "|| AddInfo == "AdditionalInformation") 
		{
       		alert("AdditionalInformation must be filled out. PLease type N/A or 0 if you have no additional Information to add!");
	   		return false;
		}
		return true;  
	}
	</script>
</body>
</html>