////////////////////////////////////////////////////////////////////////////////////
// Login Servlet for Group F Assignment
// Filename : LoginServlet.java
// Version 1.0 : 26March21 : Initial version
////////////////////////////////////////////////////////////////////////////////////
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Servlet class : LoginServlet
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    
    // Set up a static array of names,passwords, and credentials for testing login system
    private String [][] credentialArray = 
        {
            {"Guest", "password1", "1"}, // Guest, credentials=1
            {"Admin", "password2", "2"}, // Admin, credentials=2
            {"g",     "g"        , "1"}, // Guest, credentials=1
            {"a",     "a"        , "2"}, // Admin, credentials=2
            {"UserY", "test2"    , "2"}  // Admin, credentials=2
        };

    // Default constructor
    public LoginServlet()
    {
        super(); // Call the parent constructor
        System.out.println("LoginServlet constructor called");
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // checkCredentials : Compare a name/password pair to the stored list of authorised names and passwords
    // Returns the credentials : 0=>NotFound , 1=>Guest , 2=>Admin
    ////////////////////////////////////////////////////////////////////////////////////
    protected int checkCredentials(String name, String password)
    {
        if (name != null)
            for (int i = 0; i < credentialArray.length; i++)
                if (name.equals(credentialArray[i][0]) && password.equals(credentialArray[i][1]))
                {
                    if (name.equals(""))
                        return 0;
                    else if (credentialArray[i][2].equals("2"))
                        return 2;
                    else
                        return 1;
                }
        return 0;
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // doPost method
    ////////////////////////////////////////////////////////////////////////////////////
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        String      contextPath = request.getContextPath();
        PrintWriter out         = response.getWriter();

        System.out.println("LoginServlet : doPost served, path=" + contextPath);

        // Get the name and password from the request
        String name     = request.getParameter("name");
        String password = request.getParameter("password");
        
        // Check is there a valid name and password. Return of 0 means user not found, 1 means guest access, 2 means admin access 
        int credential_flag = checkCredentials(name, password);
        if (credential_flag > 0)
        {
            String userString = (credential_flag == 2) ? "Admin" : "Guest";
            HttpSession session = request.getSession();
            session.setAttribute("name", name);       // Write the name, password and admin flag fields to the session for use later
            session.setAttribute("password", password);
            session.setAttribute("credentials", credential_flag);
            System.out.println("Credentials ok : Name=" + name + ", Password=" + password + ", UserType=" + userString);
            request.getRequestDispatcher("landing.jsp").include(request, response);
        }
        else // Invalid username/password - back to the main page
        {
        	System.out.println("Invalid username/password");
            request.getRequestDispatcher("index.html").include(request, response);
        }

        out.close();
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // doGet method - unused
    ////////////////////////////////////////////////////////////////////////////////////
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }
}