package com.example.javawebapp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {

    public ResultSet GetData() {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Obtain the initial context
            Context context = new InitialContext();

            // Look up the data source with the JNDI name defined in your context.xml
            DataSource dataSource = (DataSource) context.lookup("java:/comp/env/jdbc/MyDB");

            // Get a database connection from the data source
            connection = dataSource.getConnection();

            // Create a SQL statement
            statement = connection.createStatement();

            // Execute a SQL query
            String sqlQuery = "SELECT * FROM user";
            resultSet = statement.executeQuery(sqlQuery);

            // Process the query results
            while (resultSet.next()) {
                // Access and process data from the result set
                int id = resultSet.getInt("id");
                String name = resultSet.getString("FirstName");
                // Do something with the data
                System.out.println("ID: " + id + ", Name: " + name);
            }

        } catch (NamingException | SQLException e) {
            // Handle any exceptions that might occur during database connection or query
            // execution
            e.printStackTrace();
        } finally {
            // Close resources in reverse order: result set, statement, and connection
            try {
                if (resultSet != null)
                    resultSet.close();
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultSet;

    }
}
