package com.example.javawebapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.example.javawebapp.forms.LoginForm;
import com.example.javawebapp.validators.ValidatorUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.ConstraintViolation;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("passwordReset", null);

        HttpSession session = req.getSession();

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        LoginForm loginForm = new LoginForm(email, password);
        Set<ConstraintViolation<LoginForm>> violations = ValidatorUtil.validateObject(loginForm);

        if (!violations.isEmpty()) {
            req.setAttribute("errorLogin", violations.iterator().next());
            req.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(req, resp);
            return;
        }

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
                    // All credentials are correct, user has logged in. Set his first name to a
                    // session atribute
                    req.getSession().setAttribute("loggedIn", true);
                    String userName = resultSet.getString("primeiro_nome");
                    session.setAttribute("userName", userName);
                    resp.sendRedirect(req.getContextPath() + "/");
                } else {
                    req.setAttribute("errorLogin", "login.invalid");
                    req.getRequestDispatcher("/pages/login.jsp").forward(req, resp);
                }
                return;
            }

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
