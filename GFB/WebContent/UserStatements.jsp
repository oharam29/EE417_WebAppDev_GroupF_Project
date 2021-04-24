 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%> <!-- imports SQL library -->
<%@ page import = "java.io.IOException" %> 
<%@ page import  = "java.io.PrintWriter" %>
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

<meta charset="ISO-8859-1">
<title>Guest and Users tables </title>

<style>
	table {border: 3px double black; padding: 12px; border-radius:6px; margin-left: auto;  margin-right: auto; width: 100%;}
th {border: 3px solid black; padding: 12px; background-color: #ffffff;}
 td {border: 3px solid black; padding: 12px;  background-color: #99ff99;}
</style>
</head>
<body>

	<div class = navbox>
	<nav>
	<ul class = "navlinks">     
                <li>
                    <a href="./accountPage.jsp">Go back</a>
                </li>
                 <li>
                    <a href="../LogoutServlet">Logout</a>
                </li>
            </ul>
            <div class = "burger">
                <div class = "line1"></div>
                <div class = "line2"></div>
                <div class = "line3"></div>
            </div>
		<div class = "logoDiv"><img class="logo" src = "images/logo.jpg"/></div>
		<h1 class = "title">Group F Bank</h1>
	</nav>
	</div>

<%
        String val = request.getParameter("id");
       String result = val.replaceAll("^\'+|\'+$", ""); // get rid of '' around id
        System.out.println(result);
		Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String JDBCUrl = "jdbc:mysql://localhost:3306/gfb_database";
        String username = "root";
        String password = "Stan231065$";
        PrintWriter sys = response.getWriter();
        try {
            System.out.println("\nConnecting to the SSD Database......");
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(JDBCUrl, username, password); //Connects to the Database
        }
        catch (Exception e) {
            System.out.println("\nAn error has occurred during the connection phase!  This is most likely due to your CLASSPATH being set wrong and the"
                    + "  classes unable to be found.  Otherwise the database itself may be down.  Try telneting to port 3306 and see if it is up!");
            e.printStackTrace();
            System.exit(0);
        } 
        try {
         stmt = con.createStatement();
         System.out.println("ID is " + val); 
   	     rs = stmt.executeQuery("SELECT * FROM gfb_database.transaction WHERE id = " + result);
   	     
   	     response.setContentType("text/html");
   	  sys.println("<br />");
  	sys.println("<br />");
  	sys.println("<br />");
   	  sys.println("\n <html><body><table border='1'>");
   	sys.println("<tr>\n"
   	   		+ "            <th>id</th>\n"
   	   		+ "            <th>transactionID</th>\n"
   	   		+ "            <th>amount</th>\n"
   	   		+ "            <th>date</th>\n"
   	   		+ "            <th>comment</th>\n"
   	   		+ "         </tr>");
   	     while (rs.next())
   	     {   sys.println("\n <tr>");
   	  sys.println("<td>" + rs.getString("id") + "</td>"); //gets column value at each position
   	sys.println("<td>" + rs.getString("transactionID") + "</td>");
   	sys.println("<td>" + rs.getString("amount") + "</td>");
   	sys.println("<td>" + rs.getString("date") + "</td>");
   	sys.println("<td>" + rs.getString("comment") + "</td>");
   	sys.println("</tr>");
   	     }
   	  sys.println("</table></body></html>");
   	     }
        catch (SQLException e) {
   	     System.out.println("\nAn error has occurred during the Statement/ResultSet phase.  Please check the syntax and study the Exception details!");
               while (e != null) {
   	         System.out.println(e.getMessage());
                   e = e.getNextException();
   	     }
         }
        
%> 
<script src = "app.js"></script>
</body>
</html>