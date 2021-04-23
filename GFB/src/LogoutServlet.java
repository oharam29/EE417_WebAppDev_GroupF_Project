//////////////////////////////////////////////////////////////////////////////////////////////////////
// Description : Logout Servlet. Invalidates session and credentials
// Filename    : LogoutServlet.java
// Author      : Ciaran McCormac
// StudentId   : 87198584 
//////////////////////////////////////////////////////////////////////////////////////////////////////

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")

public class LogoutServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");

        // Retrieve the session and reset the persistent items
        HttpSession session = request.getSession();
        session.setAttribute("id", 0);
        session.setAttribute("credentials", 0);

        // Logout request - invalidate the session
        session.invalidate();

        // Back to the login section
        response.sendRedirect("../index.html"); // Back to login page

    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }
}
