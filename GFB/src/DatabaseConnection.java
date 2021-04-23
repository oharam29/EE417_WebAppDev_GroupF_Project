//////////////////////////////////////////////////////////////////////////////////////////////////////
// Description : Database access class. Connect, authenticate and add user functionality
// Filename    : DatabaseConnection.java
// Author      : Ciaran McCormac
// StudentId   : 87198584 
//////////////////////////////////////////////////////////////////////////////////////////////////////

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// DatabaseConnection is used to initialise the database connection and retrieve the credentials
public class DatabaseConnection
{
    private Connection connection; // Connection 
    public  Statement  statement;  // Statement - public for simple external use

    ////////////////////////////////////////////////////////////////////////////////
    // DatabaseConnection Constructor
    ////////////////////////////////////////////////////////////////////////////////
    public DatabaseConnection(String dbUrl, String dbUsername, String dbPassword) throws SQLException, ClassNotFoundException
    {
        Class.forName("com.mysql.jdbc.Driver");                               // Load up the driver
        connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword); // Connect
        statement  = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
    }

    ////////////////////////////////////////////////////////////////////////////////
    // authenticate : DatabaseConnection authentication method
    // Returns the id and credential values for a name/password pair
    // Returns int[0] = Id
    // Returns int[1] = 0=Not-found, 1=guest-credentials, 2=admin-credentials
    ////////////////////////////////////////////////////////////////////////////////
    public int[] authenticate(String name, String password) throws SQLException
    {
        int[] return_values = new int[2];

        String sqlStatement = "SELECT * FROM customer WHERE lname = '" + name + "' AND password = '" + password + "'";
        System.out.println("Authenticating : " + sqlStatement);

        int id = 0;          // 0 = Invalid Id
        int credentials = 0; // 0 = Invalid Credentials
        try
        {
            ResultSet resultSet = statement.executeQuery(sqlStatement);
            if (resultSet.next() == true)                      // Any query result means the name/password pair was found
            {
                id          = resultSet.getInt("id");          // Retrieve the id (also used as the primary key)
                credentials = resultSet.getInt("status");      // Retrieve the credentials (1=user, 2=admin)
            }
        } catch (SQLException e) { e.printStackTrace(); }

        return_values[0] = id;
        return_values[1] = credentials;

        System.out.println("authenticate : {" + name + "," + password + "," + id + "," + credentials + "}");

        return return_values;
    }

    ////////////////////////////////////////////////////////////////////////////////
    // DatabaseConnection registration method
    // Returns 0 for failure, otherwise returns the id
    ////////////////////////////////////////////////////////////////////////////////
    public int addUser(int credentials,String username,String password) throws SQLException
    {
        String sqlStatement =
            "INSERT INTO customer (status,lname,password) " +
            "VALUES ("+
                  credentials       + "," +
            "'" + username    + "'" + "," +
            "'" + password    + "'"       + ")";

        System.out.println("DatabaseRegister : " + sqlStatement);
        // Insert the user into the table
        statement.executeUpdate(sqlStatement);
        return 1;
    }
}
