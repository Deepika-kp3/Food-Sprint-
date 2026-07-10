package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DaoImpl.MenuDaoImpl;
import com.tap.DaoImpl.RestaurantDaoImpl;
import com.tap.Model.Menu;
import com.tap.Model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    String id = req.getParameter("restaurantId");
	    System.out.println("restaurantId = " + id);

	    if (id == null) {
	        resp.getWriter().println("restaurantId parameter is missing");
	        return;
	    }

	    int restaurantId = Integer.parseInt(id);
	    

	    MenuDaoImpl menuDao = new MenuDaoImpl();
	    List<Menu> allMenusByRestaurant = menuDao.getAllMenusByRestaurant(restaurantId);

	    RestaurantDaoImpl restaurantDao = new RestaurantDaoImpl();
	    Restaurant restaurant = restaurantDao.getRestaurant(restaurantId);

	    System.out.println("Restaurant Object = " + restaurant);

	    req.setAttribute("restaurant", restaurant);
	    req.setAttribute("allMenusByRestaurant", allMenusByRestaurant);

	    req.getRequestDispatcher("menu.jsp").forward(req, resp);
	}
}
