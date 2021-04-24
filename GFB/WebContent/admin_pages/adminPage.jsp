<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
    <head>
        <title>GFB: Admin Page</title>
        <meta charset="utf-8"/>
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin_style.css">
    	<link rel="stylesheet" href ="<%= request.getContextPath() %>/css/navbar.css"/>
        <link rel="stylesheet" href ="<%= request.getContextPath() %>/css/general.css"/>
          <link rel="stylesheet" href="<%= request.getContextPath() %>/css/modal.css"> 
          
          <style>
          table {border: 3px double black; padding: 12px; border-radius:6px; margin-left: auto;  margin-right: auto; width: 100%;}
			th {border: 3px solid black; padding: 12px; background-color: #ffffff; color: black;}
 			td {border: 3px solid black; padding: 12px;  background-color: #99ff99;}
          </style>     
    </head>
<body>

	<div class = navbox>
	<nav>
	<ul class = "navlinks">
                <li>
                    <a href="../index.html">To main page</a>
                </li>  
                
                <li>
                    <a href="adminUser.jsp">Admin Actions</a>
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
		<h1 class = "title">Group F Bank</h1><p id='txt'>Welcome Admin</p>
		<div id = "profil"><form method="post" action="LogoutServlet">Logout</form></div>	<!--  replace Mr. Mark by ${name} -->
	</nav>
	</div>
	<br><br><br><br><br>
	<div class = "container">
		<div class="row">
            <table>
                <thead>
                    <tr>
						<th>ID</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>DOB</th>
						<th>Phone Number</th>
						<th>Address</th>
						<th>Addition Info</th>
						<th>Nationality</th>
						<th>City Of Birth</th>
						<th>Country Of Birth</th>
						<th>Gender</th>
						<th >Employment</th>
						<th>Password</th>
						<th>Balance</th>
						<th>Account Level</th>
						<th>Overdraft Limit</th>
						<th>Withdrawal Limit</th>
                    </tr>
                </thead>
                <tbody>
					<%
        			String dbURL = "jdbc:mysql://localhost/gfb_database";
        			String dbUsername = "root";
        			String dbPassword = "Stan231065$";
    				Connection connection; 
    				Statement statement; 
    				ResultSet query_res;
    	
        			try
        			{
    					Class.forName("com.mysql.cj.jdbc.Driver");                               // Load up the driver
    					connection = DriverManager.getConnection(dbURL, dbUsername, dbPassword); // Connect
    					statement  = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
    					String query = "SELECT * FROM customer";
    					query_res = statement.executeQuery(query);
						while(query_res.next()){
					%>	
						<tr>
							<td><%=query_res.getString("id") %></td>
							<td><%=query_res.getString("lname") %></td>
							<td><%=query_res.getString("mail") %></td>
							<td><%=query_res.getString("dateBirth") %></td>
							<td><%=query_res.getString("phone") %></td>
							<td><%=query_res.getString("address") %></td>
							<td><%=query_res.getString("addInfo") %></td>
							<td><%=query_res.getString("nationality") %></td>
							<td><%=query_res.getString("cityBirth") %></td>
							<td><%=query_res.getString("countryBirth") %></td>
							<td><%=query_res.getString("gender") %></td>
							<td><%=query_res.getString("employmentStatus") %></td>
							<td><%=query_res.getString("password") %></td>
							<td><%=query_res.getString("balance") %></td>
							<td><%=query_res.getString("status") %></td>
							<td><%=query_res.getString("overdraftLimit") %></td>
							<td><%=query_res.getString("withdrawalLimit") %></td>
						</tr>
					<%
						}
						connection.close();
					} 
        			catch (Exception e) 
        			{
					e.printStackTrace();
					}
					%>

                </tbody>
            </table>
        </div>
	
	
	</div>
	<script src = "../app.js"></script>
	
</body>
</html>