package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DaoImpl.OrderDaoImpl;
import com.tap.Model.Order;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myOrders")
public class MyOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null) {
            resp.sendRedirect("login.html");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("login.html");
            return;
        }

        // Debugging
        System.out.println("========== MY ORDERS ==========");
        System.out.println("User ID : " + user.getUserId());
        System.out.println("User Name : " + user.getName());

        OrderDaoImpl orderDao = new OrderDaoImpl();

        List<Order> orders = orderDao.getOrdersByUserId(user.getUserId());

        System.out.println("Orders Found : " + orders.size());

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("myOrders.jsp").forward(req, resp);
    }
}