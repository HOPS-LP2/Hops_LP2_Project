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

@WebServlet(name = "contactUs", value = "/contactUs")
public class ContactUsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/pages/contactUs.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("message");

        ContactForm contactForm = new ContactForm(name, email, message);
        Set<ConstraintViolation<SignupForm>> violations = ValidatorUtil.validateObject(contactForm);

        if (!violations.isEmpty()) {

            ConstraintViolation<ContactForm> firstViolation = violations.iterator().next();
            String errorMessage = firstViolation.getMessage();

            req.setAttribute("formError", errorMessage);
            req.getRequestDispatcher("WEB-INF/pages/contactUs.jsp").forward(req, resp);
            return;
        } else {
            supportMessage.cadastrar(name, email, message);
            req.setAttribute("messageSent", "contact.message_sent");
            req.getRequestDispatcher("WEB-INF/pages/contactUs.jsp").forward(req, resp);
            return;
        }

    }
}