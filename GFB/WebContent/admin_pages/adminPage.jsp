<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>GFB: Admin Page</title>
        <meta charset="utf-8"/>
    	<link rel="stylesheet" href="../css/admin_style.css">
    	<link rel="stylesheet" href ="../css/navbar.css"/>
        <link rel="stylesheet" href ="../css/general.css"/>
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
                    <a href="adminUser.jsp">Admin User</a>
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
		<div class = "logoDiv"><img class="logo" src = "../images/tempLogo.png"/></div>
		<h1 class = "title">Group F Bank</h1>
		<div id = "profil"><a href="signup_page.jsp ">Welcome Admin</a></div>	<!--  replace Mr. Mark by ${name} -->
	</nav>
	</div>
	<div class = "container">
		<div class="row">
            <table class="table-fixed">
                <thead>
                    <tr>
                        <th class="col">Full Name</th>
                        <th class="col">Age</th>
                        <th class="col">Job Title</th>
                        <th class="col">Location</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="col">Varun Thakur</td>
                        <td class="col">30</td>
                        <td class="col">DevOps Engineer</td>
                        <td class="col">India</td>
                    </tr>
                    <tr>
                        <td class="col">Olive Yu</td>
                        <td class="col">29</td>
                        <td class="col">UI Developer</td>
                        <td class="col">United Kingdom</td>
                    </tr>
                    <tr>
                        <td class="col">Sam Buca</td>
                        <td class="col">35</td>
                        <td class="col">SQL Developer</td>
                        <td class="col">United States</td>
                    </tr>
                    <tr>
                        <td class="col">Tom Ollie</td>
                        <td class="col">27</td>
                        <td class="col">IT Programmer</td>
                        <td class="col">Italy</td>
                    </tr>
                    <tr>
                        <td class="col">Ray Cyst</td>
                        <td class="col">37</td>
                        <td class="col">Network Administrator</td>
                        <td class="col">France</td>
                    </tr>
                    <tr>
                        <td class="col">Helen Highwater</td>
                        <td class="col">28</td>
                        <td class="col">Technical Specialist</td>
                        <td class="col">Brasil</td>
                    </tr>
                    <tr>
                        <td class="col">Caire Innet</td>
                        <td class="col">26</td>
                        <td class="col">Security Analyst</td>
                        <td class="col">South Africa</td>
                    </tr>
                    <tr>
                        <td class="col">Val Adictorian</td>
                        <td class="col">24</td>
                        <td class="col">Data Entry</td>
                        <td class="col">Netherlands</td>
                    </tr>
                    <tr>
                        <td class="col">Cooke Edoh</td>
                        <td class="col">33</td>
                        <td class="col">IT Manager</td>
                        <td class="col">Canada</td>
                    </tr>
                    <tr>
                        <td class="col">Rick Shaw</td>
                        <td class="col">25</td>
                        <td class="col">Cloud Architect</td>
                        <td class="col">Norway</td>
                    </tr>
                    <tr>
                        <td class="col">Rick Shaw</td>
                        <td class="col">25</td>
                        <td class="col">Cloud Architect</td>
                        <td class="col">Norway</td>
                    </tr>
                    <tr>
                        <td class="col">Cooke Edoh</td>
                        <td class="col">33</td>
                        <td class="col">IT Manager</td>
                        <td class="col">Canada</td>
                    </tr>

                </tbody>
            </table>
        </div>
	
	
	
	</div>
	<script src = "../app.js"></script>
	
</body>
</html>