/*******************************************************
 Class to connect to Salesberry DB.
 Used by the Salesberry Queries GUI.
 @author Salil Maharjan
 @since 11/26/2019
  ******************************************************** */
package salesberryapp;

import java.sql.*;
import java.util.Scanner;

public class dbconnect {
    // *********************************************************
    // ***************** Driver Check method *******************
    // *********************************************************
    public static void checkDriver() {
        // Loading Oracle Driver
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Oracle driver loaded");
        } catch (ClassNotFoundException e){
            System.out.println("Oracle Driver not found");
            System.exit(1);
        }
    }
    // *********************************************************
    // ***************** Driver Connect method *****************
    // *********************************************************
    public static Connection connectToDB(){
        // Load Oracle Driver
        checkDriver();

        // Connect to database
        Connection connection = null;
        try{
            connection = DriverManager.getConnection("jdbc:oracle:thin:@itc3260:1521/orcl", "smaharjan", "oracle");
        } catch(SQLException e){
            System.out.println("Cannot connect to the Database" + e.getMessage());
        }
        return connection;
    }

}


