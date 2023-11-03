package com.example.javawebapp;

import java.io.IOException;
import java.util.Set;

import com.example.javawebapp.forms.LoginForm;
import com.example.javawebapp.user.User;
import com.example.javawebapp.user.UserDao;
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
        String credential = req.getParameter("credential");
        String password = req.getParameter("password");

        LoginForm loginForm = new LoginForm(credential, password);
        Set<ConstraintViolation<LoginForm>> violations;

        if (credential.length() == 11 && credential.matches("\\d+")) {
            violations = ValidatorUtil.validateObject(loginForm,
                    LoginForm.CPFValidationGroup.class);

        } else {
            violations = ValidatorUtil.validateObject(loginForm,
                    LoginForm.EmailValidationGroup.class);
        }

        if (!violations.isEmpty()) {

            ConstraintViolation<LoginForm> firstViolation = violations.iterator().next();
            String errorMessage = firstViolation.getMessage();

            req.setAttribute("credential", credential);
            req.setAttribute("errorLogin", errorMessage);
            req.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(req, resp);
            return;
        }

        User user = UserDao.login(credential, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("loggedIn", true);
            session.setAttribute("username", user.getFirst_name());
            resp.sendRedirect(req.getContextPath() + "/");
        } else {
            req.setAttribute("errorLogin", "login.invalid");
            req.setAttribute("credential", credential);
            req.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(req, resp);
        }
    }
}
