//////////////////////////////////////////////////////////////////////////////////////////////////////
// Description : Set Overdraft Servlet
// Filename    : SetOverdraftServlet.java
// Author      : Ciaran McCormac
// StudentId   : 87198584 
//////////////////////////////////////////////////////////////////////////////////////////////////////

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SetOverdraftServlet")

public class SetOverdraftServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        String contextPath = request.getContextPath();

        System.out.println("SetOverdraftServlet doPost served, path=" + contextPath);

        // Setup the database parameters
        String sURL = "jdbc:mysql://localhost:3306/gfb_database";
        String sUsername = "root";
        String sPassword = "Stan231065$";

        // Retrieve the form data
        String id        = request.getParameter("id");
        String overdraft = request.getParameter("overdraft");

        // Connect to the database
        DatabaseConnection databaseConnection = null;
        try
        {
            databaseConnection = new DatabaseConnection(sURL, sUsername, sPassword);
        } catch (Exception e) { e.printStackTrace(); }

        // SQL statement to set the overdraft field
        String sqlStatement = "UPDATE transaction SET overdraft = " + Integer.parseInt(overdraft) + " WHERE id = \"" + id + "\"";
        System.out.println("sqlStatement : " + sqlStatement);

        // Execute
        try
        {
            databaseConnection.statement.executeUpdate(sqlStatement);
        } catch (SQLException e) { e.printStackTrace(); }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }
}
