<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
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
<title>GFB: Create Account</title>
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
		<h2>Create Account</h2>
		<p>To create your GFB account, please agree to the Terms & Conditions.</p>
		<form name="form" id="form" class="form"   onsubmit="return checks()" method="POST" action="../accountPage.jsp">
    	<label>
    		<input type="checkbox" id = "TC">Terms & Conditions
    	</label><br/>
        <label>
    		<input type="checkbox" id = "PP">Privacy Policy
    	</label><br/>
        <label>
    		<input type="checkbox" id = "CV">Contact Visibility
    	</label><br/>
        <label>
    		<input type="checkbox" id = "PU">Product Updates
    	</label><br/>
        <label>
    		<input type="checkbox" id = "MP">Marketing Partners
    	</label><br/>
    	<input id = "btnContinue" type="submit" value="Submit" onclick ="window.location='displayID.jsp'">
    	</form>
    	
    	<%
		String mailsess =(String) session.getAttribute("mail");
		
		String dbName = "gfb_database";
		  String userName = "root";
		  String password = "19991217Clsl31A";
		  String hostname = "localhost";
		  String port = "3306";
		  String jdbcUrl = "jdbc:mysql://" + hostname + ":" +
		    port + "/" + dbName + "?user=" + userName + "&password=" + password;
		  
		  // Load the JDBC driver
		  try {
		    System.out.println("Loading driver...");
		    Class.forName("com.mysql.jdbc.Driver");
		    System.out.println("Driver loaded!");
		  } catch (ClassNotFoundException e) {
		    throw new RuntimeException("Cannot find the driver in the classpath!", e);
		  }

		  Connection conn = null;
		  Statement setupStatement = null;
		  Statement readStatement = null;
		  ResultSet resultSet = null;
		  String results = "";
		  int numresults = 0;
		  String statement = null;

		  //String q = "SELECT id FROM gfb_database.customer where mail=" + mailsess + ";";
		  //out.println(q);
		  try {
		    conn = DriverManager.getConnection(jdbcUrl);
		    
		    readStatement = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		    resultSet = readStatement.executeQuery("SELECT id FROM gfb_database.customer where mail=\""+ mailsess +"\";");
		    resultSet.first();
		    results = resultSet.getString("id");
		    out.println("Your id is: " + results);
		    resultSet.close();
		    readStatement.close();
		    conn.close();

		  } catch (SQLException ex) {
		    // Handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		  } finally {
		       System.out.println("Closing the connection.");
		      if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
		  }
		%>
    </div>
    
	<input id = "btnBack" type = "button" value = "Back" onclick ="window.location='createPassword.jsp'">
<!--   <input id = "btnContinue" type = "button" value = "Finish" onclick ="window.location='#'">
 -->	
 
 <script>
 function checks()
 {
	 if (document.getElementById('TC').checked == false || document.getElementById('PP').checked == false || document.getElementById('CV').checked == false ||document.getElementById('PU').checked == false || document.getElementById('MP').checked == false) 
	 {
		 alert('Please accept all of the Terms and conditions');
		 return false;
	 }
	 return true;
 }
 
 </script>
</body>
</html>