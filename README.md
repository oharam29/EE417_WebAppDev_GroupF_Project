# EE417_WebAppDev_GroupF_Project
EE417 Web Application Dev - Group F project

Selenium Testing:
To run the selenium test project a path to the project on the machine you wihs to run the tests must be defined.
This is to allow the project to find the locaiton of the webdriver.exe to drive the tests. 
Once this has been defined to run the tests the main from each test class can be run and the automated UI test will begin.

SQL: 
An SQL file is stored in the top level of the repo which is used for database creation. 
Opening the SQL in mySQL work bench and running the query will create a local instance of the database used by the web applicaion
Files such as:
UserStatements.jsp & AdminPage.jsp and the servlets need to have the mySQL credentials adjusted to link to the locally created database tables.

Web Application:
To run the application the WAR file that can be found needs to be deploayed on a Tomcat server and then a user simply needs to navigate to the web page.
