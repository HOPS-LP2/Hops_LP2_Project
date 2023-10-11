package com.example.javawebapp;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "reset", value = "/reset")
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");

        boolean isPasswordValid = Validation.isPasswordValid(password);
        if (!isPasswordValid) {
            req.getSession().setAttribute("message", "Invalid Password.");
            resp.sendRedirect(req.getContextPath() + "/pages/resetPassword.jsp");

        } else {
            req.getSession().setAttribute("passwordReset", "Password Reset Succesfully.");
            resp.sendRedirect(req.getContextPath() + "/pages/login.jsp");
        }

    }
}