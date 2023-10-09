package com.example.javawebapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String sqlQueryCheckCredentials = "SELECT * FROM Usuario WHERE email = ?";

        try {
            Context context = new InitialContext();
            DataSource dataSource = (DataSource) context.lookup("java:/comp/env/jdbc/MyDB");

            connection = dataSource.getConnection();

            preparedStatement = connection.prepareStatement(sqlQueryCheckCredentials);
            preparedStatement.setString(1, email);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String passwordDb = resultSet.getString("senha");
                if (password.equals(passwordDb)) {
                    req.getSession().setAttribute("loggedIn", true);
                    String userName = resultSet.getString("primeiro_nome");
                    req.getSession().setAttribute("userName", userName);
                    resp.sendRedirect("/java-web-app-1.0/pages/home.jsp");
                } else {
                    req.getSession().setAttribute("loginFailed", "Incorrect email or password!");
                    resp.sendRedirect("/java-web-app-1.0/pages/login.jsp");
                }
                return;
            } else {
                req.getSession().setAttribute("loginFailed", "Incorrect email or password!");
                resp.sendRedirect("/java-web-app-1.0/pages/login.jsp");
            }

            // Close the result set before reusing the preparedStatement
            resultSet.close();
            preparedStatement.close();

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}
