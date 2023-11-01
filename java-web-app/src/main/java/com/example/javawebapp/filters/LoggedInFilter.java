package com.example.javawebapp.filters;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(value = { "/login", "/signup", "/resetPassword", "/recoverPassword" })
public class LoggedInFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();
        Object loggedInObj = session.getAttribute("loggedIn");

        if (loggedInObj != null) {
            Boolean loggedIn = (Boolean) loggedInObj;
            if (loggedIn) {
                res.sendRedirect(req.getContextPath() + "/");
                return;
            }
        }
        chain.doFilter(request, response);
    }

}
