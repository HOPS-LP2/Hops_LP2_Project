package com.example.javawebapp;

import java.io.IOException;
import java.util.List;

import com.example.javawebapp.agency.Agency;
import com.example.javawebapp.agency.AgencyDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "agencies", value = "/agencies")
public class AgenciesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Agency> agencies = AgencyDAO.getAllAgencies();
        req.setAttribute("list_agency", agencies);
        req.getRequestDispatcher("WEB-INF/pages/agencies.jsp").forward(req, res);
    }

}