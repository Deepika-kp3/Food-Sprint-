package com.food.servlets;

import java.io.IOException;

import com.tap.DaoImpl.RestaurantDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteRestaurant")
public class DeleteRestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int restaurantId =
                Integer.parseInt(req.getParameter("id"));

        RestaurantDaoImpl dao = new RestaurantDaoImpl();

        int result = dao.deleteRestaurant(restaurantId);

        if(result > 0) {

            resp.sendRedirect("restaurantList");

        } else {

            resp.sendRedirect("restaurantList");

        }
    }
}