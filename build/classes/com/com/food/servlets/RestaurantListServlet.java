package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DaoImpl.RestaurantDaoImpl;
import com.tap.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurantList")
public class RestaurantListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        RestaurantDaoImpl dao = new RestaurantDaoImpl();

        List<Restaurant> list = dao.getAllRestaurants();

        req.setAttribute("restaurants", list);

        req.getRequestDispatcher("restaurantList.jsp")
           .forward(req, resp);
    }
}