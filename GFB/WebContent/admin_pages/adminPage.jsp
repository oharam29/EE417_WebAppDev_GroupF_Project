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
    	<link rel="stylesheet" href="/GFB/css/admin_style.css">
    	<link rel="stylesheet" href ="/GFB/css/navbar.css"/>
        <link rel="stylesheet" href ="/GFB/css/general.css"/>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
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
                    <a href="../accountPage.jsp">Leave admin</a>
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
		<div class = "logoDiv"><img class="logo" src = "/GFB/images/logo.jpg"/></div>
		<h1 class = "title">Group F Bank</h1><p id='txt'>Welcome Admin</p>
		<div id = "profil"><form method="post" action='LogoutServlet'>Logout</form></div>	<!--  replace Mr. Mark by ${name} -->
	</nav>
	</div>
	<div class = "container">
		<div class="row">
            <table class='table-fixed'>
                <thead>
                    <tr>
						<th class="col">ID</th>
						<th class="col">Last Name</th>
						<th class="col">Email</th>
						<th class="col">DOB</th>
						<th class="col">Phone Number</th>
						<th class="col">Address</th>
						<th class="col">Addition Info</th>
						<th class="col">Nationality</th>
						<th class="col">City Of Birth</th>
						<th class="col">Country Of Birth</th>
						<th class="col">Gender</th>
						<th class="col">Employment</th>
						<th class="col">Password</th>
						<th class="col">Balance</th>
						<th class="col">Account Level</th>
                    </tr>
                </thead>
                <tbody>
					<%
        			String dbURL = "jdbc:mysql://localhost/gfb_database";
        			String dbUsername = "root";
        			String dbPassword = "1234";
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
	
	<p>Hello</p>
	
	
	</div>
	<script src = "../app.js"></script>
	
</body>
</html>