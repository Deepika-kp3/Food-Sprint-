package com.food.servlets;

import java.io.IOException;

import com.tap.DaoImpl.RestaurantDaoImpl;
import com.tap.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addRestaurant")
public class AddRestaurantServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String cuisine = req.getParameter("cuisine");
        String address = req.getParameter("address");

        int deliveryTime =
                Integer.parseInt(req.getParameter("deliveryTime"));

        double rating =
                Double.parseDouble(req.getParameter("rating"));

        String image =
                req.getParameter("image");

        boolean active =
                Boolean.parseBoolean(req.getParameter("status"));

        Restaurant restaurant = new Restaurant();

        restaurant.setName(name);
        restaurant.setCuisineType(cuisine);
        restaurant.setAddress(address);
        restaurant.setDeliveryTime(deliveryTime);
        restaurant.setRating(rating);
        restaurant.setImagePath(image);
        restaurant.setActive(active);

        RestaurantDaoImpl dao = new RestaurantDaoImpl();

        int result = dao.addRestaurant(restaurant);

        if(result > 0){

            resp.sendRedirect("restaurantList");

        }else{

            resp.sendRedirect("addRestaurant.jsp");

        }

    }

}