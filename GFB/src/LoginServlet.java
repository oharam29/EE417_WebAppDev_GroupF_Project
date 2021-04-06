//////////////////////////////////////////////////////////////////////////////////////////////////////
// Description : Login Servlet. Verifies login details and determines id (primary key) and credentials
// Filename    : LoginServlet.java
// Author      : Ciaran McCormac
// StudentId   : 87198584 
// Version     : 1.0  -  30March21  -  Initial version
//               1.1  -  03April21  -  Changed database field names to match new SQL setup file
//               1.2  -  06April21  -  Changed form field names to match login.jsp. Added conditional user/admin launch
//////////////////////////////////////////////////////////////////////////////////////////////////////

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int lId = 0;
        int lCredentials = 0;

        response.setContentType("text/html");
        String contextPath = request.getContextPath();

        System.out.println("LoginServlet doPost served, path=" + contextPath);
        
        // Setup the database parameters
        String sURL = "jdbc:mysql://localhost:3306/ca4_database";
        String sUsername = "root";
        String sPassword = "3525";

        try
        {
            // Connect to the database
            DatabaseConnection databaseConnection = new DatabaseConnection(sURL, sUsername, sPassword); 

            String lName = request.getParameter("uname");                                   // Retrieve the form data
            String lPass = request.getParameter("password");

            int[] ret_vals = databaseConnection.authenticate(lName, lPass);                 // Authenticate. If valid, returns the id and credentials (credentials=0 => User not found)
            lId          = ret_vals[0];
            lCredentials = ret_vals[1];

            if (lCredentials == 1)                                                          // Standard user
            {
                System.out.println("User Login Success");
                request.getSession().setAttribute("id", lId);                               // Set the http session id
                request.getSession().setAttribute("credentials", 1);                        // Set the http session credentials
                request.getRequestDispatcher("accountPage.jsp").include(request, response); // Jump to the account page
            }
            else if (lCredentials == 2)                                                     // Admin user
            {
                System.out.println("Admin Login Success");
                request.getSession().setAttribute("id", lId);                               // Set the http session id
                request.getSession().setAttribute("credentials", 2);                        // Set the http session credentials
                request.getRequestDispatcher("adminPage.jsp").include(request, response);   // Jump to the admin page
            }
            else
            {
                System.out.println("Login Failure");
                request.getSession().setAttribute("id", 0);                                 // Blank the userId
                request.getSession().setAttribute("credentials", 0);                        // Blank the http session credentials
                request.getRequestDispatcher("login.jsp").include(request, response);       // Back to login page
            }

        } catch (Exception e) { e.printStackTrace(); }
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }
}
