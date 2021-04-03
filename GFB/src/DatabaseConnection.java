//////////////////////////////////////////////////////////////////////////////////////////////////////
// Description : Database access class. Connect, authenticate and query functionality
// Filename    : DatabaseConnection.java
// Author      : Ciaran McCormac
// StudentId   : 87198584 
// Version     : 1.0  -  30March21  -  Initial version
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
    public  Statement  statement;  // Statement : made public for easy access by the DumpServlet
    
    ////////////////////////////////////////////////////////////////////////////////
    // DatabaseConnection Constructor
    ////////////////////////////////////////////////////////////////////////////////
    public DatabaseConnection(String dbUrl, String dbUsername, String dbPassword) throws SQLException, ClassNotFoundException
    {
        Class.forName("com.mysql.cj.jdbc.Driver");                                  // Load up the driver
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
        
        String sqlStatement = "SELECT * FROM ca4_user_table WHERE username = '" + name + "' AND password = '" + password + "'";
        System.out.println("Authenticating : " + sqlStatement);
        
        int id = 0;          // 0 = Invalid Id
        int credentials = 0; // 0 = Invalid Credentials
        try
        {
            ResultSet resultSet = statement.executeQuery(sqlStatement);
            if (resultSet.next() == true)                      // Any query result means the name/password pair was found
            {
                id          = resultSet.getInt("id");          // Retrieve the id (also used as the primary key)
                credentials = resultSet.getInt("credentials"); // Retrieve the credentials (1=user, 2=admin)
            }
        } catch (SQLException e) { e.printStackTrace(); }

        return_values[0] = id;
        return_values[1] = credentials;

        System.out.println("authenticate : {" + name + "," + password + "," + id + "," + credentials + "}");

        return return_values;
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    // Id allocation and retrieval method
    // Returns the highest unused valid-id available in the ca4_user_table
    ////////////////////////////////////////////////////////////////////////////////
    public int getUnusedId() throws SQLException
    {
        int nextid = 0;
        int retval;
        String sqlStatement = "SELECT MAX(id) FROM ca4_user_table";
        try
        {
            ResultSet resultSet = statement.executeQuery(sqlStatement);
            if (resultSet.next() == true)
                nextid = resultSet.getInt(1); // The max id found in table
        } catch (SQLException e) { e.printStackTrace(); }

        retval = nextid + 1;                  // Add user at one higher than highest existing user 
        
        System.out.println("DatabaseGetNextFreeId returning " + retval);

        return retval;
    }

    ////////////////////////////////////////////////////////////////////////////////
    // DatabaseConnection registration method
    // Returns 0 for failure, otherwise returns the id
    ////////////////////////////////////////////////////////////////////////////////
    public int addUser(int credentials,String username,String password) throws SQLException
    {
        // Add user at next valid id
        int nextFreeId = getUnusedId();
        
        String sqlStatement =
            "INSERT INTO ca4_user_table (id,credentials,username,password) " +
            "VALUES ("+
                  nextFreeId        + "," +
                  credentials       + "," +
            "'" + username    + "'" + "," +
            "'" + password    + "'"       + ")";
    
        System.out.println("DatabaseRegister : " + sqlStatement);
        // Insert the user into the table
        statement.executeUpdate(sqlStatement);
        return nextFreeId;
    }

    ////////////////////////////////////////////////////////////////////////////////
    // DatabaseConnection register method
    // Uses REPLACE INTO instead of INSERT INTO as the entry may already be there 
    // Returns 0 for failure, otherwise successful
    ////////////////////////////////////////////////////////////////////////////////
    public int updateProfile(int id,String gender,String firstname,String lastname,String email,String phone,String prefcolour,String printer,int modifiers,int thickness,int density)
    {
        String sqlStatement =
            "REPLACE INTO ca4_details_table (id,gender,firstname,lastname,email,phone,prefcolour,printer,modifiers,thickness,density) " +
            "VALUES ("+
                  id               + "," +
            "'" + gender     + "'" + "," +
            "'" + firstname  + "'" + "," +
            "'" + lastname   + "'" + "," +
            "'" + email      + "'" + "," +
            "'" + phone      + "'" + "," +
            "'" + prefcolour + "'" + "," +
            "'" + printer    + "'" + "," +
                  modifiers        + "," +
                  thickness        + "," +
                  density          + ")";
    
        System.out.println("DatabaseRegister : " + sqlStatement);
        try
        {
            statement.executeUpdate(sqlStatement);
        } catch (SQLException e) { e.printStackTrace(); }

        return 1;
    }
}