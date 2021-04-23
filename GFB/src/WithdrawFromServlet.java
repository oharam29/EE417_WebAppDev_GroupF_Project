//////////////////////////////////////////////////////////////////////////////////////////////////////
// Description : WithdrawFrom Servlet. Accesses the database and withdraws an amount from an account
// Filename    : WithdrawFromServlet.java
// Author      : Ciaran McCormac
// StudentId   : 87198584 
//////////////////////////////////////////////////////////////////////////////////////////////////////

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WithdrawFromServlet")

public class WithdrawFromServlet extends HttpServlet
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
        String id      = request.getParameter("id");
        String amount  = request.getParameter("amount");

        // Connect to the database
        DatabaseConnection databaseConnection = null;
        try
        {
            databaseConnection = new DatabaseConnection(sURL, sUsername, sPassword);
        } catch (Exception e) { e.printStackTrace(); }

        // Read balance
        String sqlStatement1 = "SELECT * FROM customer WHERE id = \"" + id + "\"";
        System.out.println("sqlStatement : " + sqlStatement1);
        double balance = 0;
        try
        {
            ResultSet resultSet1 = databaseConnection.statement.executeQuery(sqlStatement1);
            if (resultSet1.next() == true)                      // Any query result means valid
                balance = resultSet1.getDouble("balance");
        } catch (SQLException e) { e.printStackTrace(); }
        
        // Update the balance with the amount and execute
        String sqlStatement2 = "UPDATE customer SET balance = " + (balance - Integer.parseInt(amount)) + " WHERE id = \"" + id + "\"";
        System.out.println("sqlStatement : " + sqlStatement2);
        try
        {
            databaseConnection.statement.executeUpdate(sqlStatement2);
        } catch (SQLException e) { e.printStackTrace(); }
        
        // Add it to the transaction table
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        Date now = new Date();
        String strDate = sdf.format(now);
        String sqlStatement3 = "INSERT INTO transaction (amount, date, comment) VALUES (" + Integer.parseInt(amount) + ", '" + strDate + "', 'Withdrawl')";
        System.out.println("sqlStatement : " + sqlStatement3);
        try
        {
            databaseConnection.statement.executeUpdate(sqlStatement3);
        } catch (SQLException e) { e.printStackTrace(); }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }
}
