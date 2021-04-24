//////////////////////////////////////////////////////////////////////////////////////////////////////
// Description : Delete User Servlet.
// Filename    : DeleteUserServlet.java
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

@WebServlet("/DeleteUserServlet")

public class DeleteUserServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        String contextPath = request.getContextPath();

        System.out.println("DeleteUserServlet doPost served, path=" + contextPath);

        // Setup the database parameters
        String sURL = "jdbc:mysql://localhost:3306/gfb_database";
        String sUsername = "root";
        String sPassword = "Stan231065$";

        // Retrieve the form data
        String id = request.getParameter("id");

        // Connect to the database
        DatabaseConnection databaseConnection = null;
        try
        {
            databaseConnection = new DatabaseConnection(sURL, sUsername, sPassword); 
        } catch (Exception e) { e.printStackTrace(); }

        // SQL statement to delete the user from the customer table
        String sqlStatement1 = "DELETE FROM customer WHERE id = \"" + id +"\"";
        System.out.println("sqlStatement1 : " + sqlStatement1);
        // Execute
        try
        {
            databaseConnection.statement.executeUpdate(sqlStatement1);
        } catch (SQLException e) { e.printStackTrace(); }
        // SQL statement to delete the user from the transaction table
        String sqlStatement2 = "DELETE FROM transaction WHERE id = \"" + id +"\"";
        System.out.println("sqlStatement2 : " + sqlStatement2);
        // Execute
        try
        {
            databaseConnection.statement.executeUpdate(sqlStatement2);
        } catch (SQLException e) { e.printStackTrace(); }
        response.sendRedirect("admin_pages/adminUser.jsp");
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }
}
