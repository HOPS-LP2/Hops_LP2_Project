package com.example.javawebapp;

import java.io.IOException;
import java.util.List;

import com.example.javawebapp.car.Car;
import com.example.javawebapp.car.CarDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
// Query database for cars in that agency
// return list of car objects
// loop through list and render each car card with a rent button
// Chose car, get if they want delivry or theyre going to pick it up
// Same thing for return
// also need date and time
// Validate this form
// Confirmation page with payment and finally add rental to db

@WebServlet(name = "showCars", value = "/showCars")
public class ShowCarsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String agency_id = (String) session.getAttribute("selectedAgencyId");
        System.out.println(agency_id);
        List<Car> carsList = CarDAO.getByAgencyId(agency_id);
        req.setAttribute("carsList", carsList);

        req.getRequestDispatcher("WEB-INF/pages/showCars.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String action = req.getParameter("action");

        if (action.equals("showCars")) {
            String agency_id = req.getParameter("agencyId");
            session.setAttribute("selectedAgencyId", agency_id);
            resp.sendRedirect(req.getContextPath() + "/showCars");

            return;
        } else if (action.equals("selectedCar")) {
            String carId = req.getParameter("carId");
            session.setAttribute("selectedCarId", carId);
            resp.sendRedirect(req.getContextPath() + "/selectAddress");
            return;
        }
    }
}
