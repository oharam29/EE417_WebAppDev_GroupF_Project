//////////////////////////////////////////////////////////////////////////////////////////////////////
// Description : Login Servlet. Verifies login details and determines id (primary key) and credentials
// Filename    : LoginServlet.java
// Author      : Ciaran McCormac
// StudentId   : 87198584 
// Version     : 1.0  -  30March21  -  Initial version
//               1.1  -  03April21  -  Changed database field names to match new SQL setup file
//               1.2  -  06April21  -  Changed form field names to match login.jsp. Added conditional user/admin launch
//               1.3  -  09April21  -  Added database read of balance on login
//////////////////////////////////////////////////////////////////////////////////////////////////////

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        String sURL = "jdbc:mysql://localhost:3306/gfb_database";
        String sUsername = "root";
        String sPassword = "3525";

        try
        {
            // Connect to the database
            DatabaseConnection databaseConnection = new DatabaseConnection(sURL, sUsername, sPassword); 

            String lName = request.getParameter("lname");                                   // Retrieve the form data
            String lPass = request.getParameter("password");

            int[] ret_vals = databaseConnection.authenticate(lName, lPass);                 // Authenticate. If valid, returns the id and credentials (credentials=0 => User not found)
            lId          = ret_vals[0];
            lCredentials = ret_vals[1];

            if ((lCredentials != 1) && (lCredentials != 2))                                 // Bad credentials, login failure
            {
                System.out.println("Login Failure");
                request.getSession().setAttribute("id", 0);                                 // Blank the userId
                request.getSession().setAttribute("credentials", 0);                        // Blank the credentials
                request.getRequestDispatcher("login.jsp").include(request, response);       // Back to login page
                return;
            }

            // Read balance for immediate availability for display
            String sqlStatement1 = "SELECT * FROM customer WHERE id = \"" + lId + "\"";
            System.out.println("sqlStatement : " + sqlStatement1);
            double lBalance = 0;
            try
            {
                ResultSet resultSet1 = databaseConnection.statement.executeQuery(sqlStatement1);
                if (resultSet1.next() == true)                      // Any query result means valid
                	lBalance = resultSet1.getDouble("balance");
            } catch (SQLException e) { e.printStackTrace(); }

            if (lCredentials == 1)                                                          // Standard user
            {
                System.out.println("User Login Success");
                request.getSession().setAttribute("id", lId);                               // Set the id
                request.getSession().setAttribute("credentials", 1);                        // Set the credentials
                request.getSession().setAttribute("balance", lBalance);                     // Set the balance
                request.getRequestDispatcher("accountPage.jsp").include(request, response); // Jump to the account page
            }
            else                                                                            // Admin user
            {
                System.out.println("Admin Login Success");
                request.getSession().setAttribute("id", lId);                               // Set the id
                request.getSession().setAttribute("credentials", 2);                        // Set the credentials
                request.getSession().setAttribute("balance", lBalance);                     // Set the balance
                request.getRequestDispatcher("adminPage.jsp").include(request, response);   // Jump to the admin page
            }
        } catch (Exception e) { e.printStackTrace(); }
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }
}
