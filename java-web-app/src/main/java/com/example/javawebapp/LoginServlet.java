package com.example.javawebapp;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {

    User user1 = new User("David", "david@gmail.com", "12345");

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (email.equals(user1.getEmail()) && password.equals(user1.getPassword())) {
            String contextPath = req.getContextPath();

            resp.sendRedirect(contextPath + "/pages/home.html");
        }

    }
}
