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

import com.example.javawebapp.forms.RecoverPasswordForm;
import com.example.javawebapp.user.UserDao;
import com.example.javawebapp.validators.ValidatorUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.ConstraintViolation;

@WebServlet(name = "recover", value = "/recover")
public class RecoverPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/pages/recoverPassword.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");

        RecoverPasswordForm recoverPasswordForm = new RecoverPasswordForm(email);
        Set<ConstraintViolation<RecoverPasswordForm>> violations = ValidatorUtil.validateObject(recoverPasswordForm);

        if (!violations.isEmpty()) {
            ConstraintViolation<RecoverPasswordForm> firstViolation = violations.iterator().next();
            String errorMessage = firstViolation.getMessage();

            req.setAttribute("errorMessage", errorMessage);
        } else if (UserDao.existsWithEmail(email)) {
            req.setAttribute("successMessageFMT", "recoverPassword.emailFound");
        } else {
            req.setAttribute("errorMessageFMT", "recoverPassword.emailNotFound");
        }

        req.getRequestDispatcher("WEB-INF/pages/recoverPassword.jsp").forward(req, resp);
    }
}
