//////////////////////////////////////////////////////////////////////////////////////////////////////
// Description : Login Servlet. Verifies login details and determines id (primary key) and credentials
// Filename    : LoginServlet.java
// Author      : Ciaran McCormac
// StudentId   : 87198584 
// Version     : 1.0  -  30March21  -  Initial version
//               1.1  -  03April21  -  Changed field names to match new SQL setup file
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

            String lName = request.getParameter("name");                                // Retrieve the form data
            String lPass = request.getParameter("password");

            int[] ret_vals = databaseConnection.authenticate(lName, lPass);             // Authenticate. If valid, returns the id and credentials (credentials=0 => User not found)
            lId          = ret_vals[0];
            lCredentials = ret_vals[1];

            if (lCredentials != 0)                                                      // Non-zero credentials means user was found
            {
                System.out.println("Login Success");
                request.getSession().setAttribute("id", lId);                           // Set the http session id          (for table cross-reference / key)
                request.getSession().setAttribute("credentials", lCredentials);         // Set the http session credentials (for conditional menus)
                request.getRequestDispatcher("landing.jsp").include(request, response); // Jump to the landing page
            }
            else
            {
                System.out.println("Login Failure");
                request.getRequestDispatcher("index.html").include(request, response);  // False means failed credential check, reenter details
            }
        } catch (Exception e) { e.printStackTrace(); }
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }
}
