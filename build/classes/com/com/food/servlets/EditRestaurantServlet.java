package com.food.servlets;

import java.io.IOException;

import com.tap.DaoImpl.RestaurantDaoImpl;
import com.tap.Model.Restaurant;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/editRestaurant")
public class EditRestaurantServlet extends HttpServlet{

    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        int id =
        Integer.parseInt(req.getParameter("id"));

        RestaurantDaoImpl dao =
        new RestaurantDaoImpl();

        Restaurant restaurant =
        dao.getRestaurant(id);

        req.setAttribute("restaurant", restaurant);

        req.getRequestDispatcher("editRestaurant.jsp")
        .forward(req, resp);
    }
}