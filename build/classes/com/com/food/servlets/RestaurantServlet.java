package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DaoImpl.RestaurantDaoImpl;
import com.tap.Model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("RestaurantServlet Called");

        RestaurantDaoImpl dao = new RestaurantDaoImpl();

        List<Restaurant> restaurants = dao.getAllRestaurants();

        System.out.println("Restaurant Count = " + restaurants.size());

        request.setAttribute("allRestaurants", restaurants);

        System.out.println("Attribute Added");

        RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
        rd.forward(request, response);
    }
}
