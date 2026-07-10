package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DaoImpl.RestaurantDaoImpl;
import com.tap.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("===== HomeServlet Called =====");

        RestaurantDaoImpl dao = new RestaurantDaoImpl();

        List<Restaurant> list = dao.getAllRestaurants();

        System.out.println("Restaurant Count = " + list.size());

        req.setAttribute("allRestaurants", list);

        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }
}

