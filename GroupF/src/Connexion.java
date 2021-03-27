/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Mathieu
 */

public class Connexion {
    
    /**
     * Attributs prives : connexion JDBC, statement, ordre requete et resultat
     * requete
     */
    private final Connection conn;
    private final Statement stmt;
    private ResultSet rset;
    
    /**
     * Connexion links the code to the database
     * 
     * @param nameDatabase
     * @param loginDatabase
     * @param passwordDatabase
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    
    public Connexion(String nameDatabase, String loginDatabase, String passwordDatabase) throws SQLException, ClassNotFoundException
    {
        // loading driver "com.mysql.jdbc.Driver"
        Class.forName("com.mysql.jdbc.Driver");
        String urlDatabase = "jdbc:mysql://localhost:3306/" + nameDatabase;
    
        //creation of a JDBC connexion
        conn = DriverManager.getConnection(urlDatabase, loginDatabase, passwordDatabase);
        // creation of an SQL order (statement)
        stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);   
    }
    
    public boolean authentication(String name, String mdp) throws SQLException
    {
        String sqlStatement = "SELECT * FROM `customer` WHERE `name` = '" + name + "' AND `password` = '" + mdp + "'";
       
        rset = stmt.executeQuery(sqlStatement);
       
        return rset.next();
    }
}