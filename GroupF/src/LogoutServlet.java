////////////////////////////////////////////////////////////////////////////////////
// Logout Servlet for Group F Assignment
// Filename : LogoutServlet.java
// Version 1.0 : 26March21 : Initial version
////////////////////////////////////////////////////////////////////////////////////
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Servlet class : LogoutServlet
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    
    // Default constructor
    public LogoutServlet()
    {
        super(); // Call the parent constructor
        System.out.println("LogoutServlet constructor called");
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // doPost method for Logout
    ////////////////////////////////////////////////////////////////////////////////////
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        String contextPath = request.getContextPath();
        
        System.out.println("LogoutServlet : doPost served, path=" + contextPath);

        // Logout request - invalidate the session (and the attributes, to be safe)
        HttpSession session = request.getSession(false); // Call with false parameter so it doesn't create a session if none exists
        if (session != null)
        {
            System.out.println("Final name = " + session.getAttribute("name") + "," + session.getAttribute("password") + "," + session.getAttribute("credentials"));
            session.setAttribute("name", "");
            session.setAttribute("password", "");
            session.setAttribute("credentials", 0);
            session.invalidate();
        }

        request.getRequestDispatcher("index.html").include(request, response);
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // doGet method - unused
    ////////////////////////////////////////////////////////////////////////////////////
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }
}

