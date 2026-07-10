package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DaoImpl.OrderDaoImpl;
import com.tap.Model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/viewOrders")
public class OrderListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        OrderDaoImpl dao = new OrderDaoImpl();

        List<Order> orders = dao.getAllOrders();

        System.out.println("========== ORDER DEBUG ==========");
        System.out.println("Orders Size : " + orders.size());

        for (Order order : orders) {
            System.out.println(
                "Order ID : " + order.getOrderId() +
                " User ID : " + order.getUserId()
            );
        }

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("orders.jsp").forward(req, resp);
    }
}