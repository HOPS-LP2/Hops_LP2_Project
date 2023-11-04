package com.example.javawebapp;

import java.io.IOException;
import java.util.Set;

import com.example.javawebapp.forms.SignupForm;
import com.example.javawebapp.user.UserDao;
import com.example.javawebapp.validators.ValidatorUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.ConstraintViolation;

@WebServlet(name = "signup", value = "/signup")
public class SignupServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/pages/signup.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Boolean error = false;

        String firstName = req.getParameter("first-name");
        String lastName = req.getParameter("last-name");
        String email = req.getParameter("email");
        String cpf = req.getParameter("cpf");
        String phoneNumber = req.getParameter("phone-number");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm-password");

        SignupForm signupForm = new SignupForm(firstName, lastName, email, cpf, phoneNumber, password);
        Set<ConstraintViolation<SignupForm>> violations = ValidatorUtil.validateObject(signupForm);

        if (!violations.isEmpty()) {

            ConstraintViolation<SignupForm> firstViolation = violations.iterator().next();
            String errorMessage = firstViolation.getMessage();

            req.setAttribute("errorSignup", errorMessage);
            error = true;
        } else {
            if (UserDao.existsWithEmail(email)) {
                req.setAttribute("errorSignupFMT", "signup.existsWithEmail");
                error = true;
            } else if (UserDao.existsWithCPF(cpf)) {
                req.setAttribute("errorSignupFMT", "signup.existsWithCPF");
                error = true;
            } else if (!password.equals(confirmPassword)) {
                req.setAttribute("errorSignupFMT", "signup.match-password");
                error = true;
            }
        }

        if (error) {
            req.setAttribute("first-name", firstName);
            req.setAttribute("last-name", lastName);
            req.setAttribute("email", email);
            req.setAttribute("cpf", cpf);
            req.setAttribute("phone-number", phoneNumber);

            req.getRequestDispatcher("WEB-INF/pages/signup.jsp").forward(req, resp);
            return;
        } else {
            UserDao.cadastrar(firstName, lastName, email, password, cpf, phoneNumber);
            resp.sendRedirect(req.getContextPath() + "/login?signup=" + true);
            return;
        }

    }
}
