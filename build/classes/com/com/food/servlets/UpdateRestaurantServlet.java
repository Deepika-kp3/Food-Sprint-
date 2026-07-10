package com.food.servlets;

import java.io.IOException;

import com.tap.DaoImpl.RestaurantDaoImpl;
import com.tap.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateRestaurant")
public class UpdateRestaurantServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));

        String name = req.getParameter("name");
        String cuisine = req.getParameter("cuisine");
        int deliveryTime = Integer.parseInt(req.getParameter("deliveryTime"));
        String address = req.getParameter("address");
        double rating = Double.parseDouble(req.getParameter("rating"));
        boolean active = Boolean.parseBoolean(req.getParameter("status"));
        String image = req.getParameter("image");

        Restaurant restaurant = new Restaurant();

        restaurant.setRestaurantId(restaurantId);
        restaurant.setName(name);
        restaurant.setCuisineType(cuisine);
        restaurant.setDeliveryTime(deliveryTime);
        restaurant.setAddress(address);
        restaurant.setRating(rating);
        restaurant.setActive(active);
        restaurant.setImagePath(image);

        RestaurantDaoImpl dao = new RestaurantDaoImpl();

        int result = dao.updateRestaurant(restaurant);

        if (result > 0) {

            resp.sendRedirect("restaurantList");

        } else {

            resp.sendRedirect("editRestaurant?id=" + restaurantId);

        }

    }
}