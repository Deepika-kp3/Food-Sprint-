package com.food.servlets;

import java.io.IOException;
import java.sql.Timestamp;

import com.tap.DaoImpl.OrderDaoImpl;
import com.tap.DaoImpl.OrderItemDaoImpl;
import com.tap.Model.Cart;
import com.tap.Model.CartItem;
import com.tap.Model.Order;
import com.tap.Model.OrderItem;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        if (user == null) {

            response.sendRedirect("login.html");
            return;
        }

        if (cart == null || cart.getItems().isEmpty()) {

            response.sendRedirect("cart.jsp");
            return;
        }

        Integer restaurantId = (Integer) session.getAttribute("restaurantId");

        double finalAmount = (Double) session.getAttribute("finalAmount");

        String paymentMode = request.getParameter("paymentMode");

        Order order = new Order();

        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurantId);
        order.setOrderDate(new Timestamp(System.currentTimeMillis()));
        order.setPaymentMethod(paymentMode);
        order.setStatus("Pending");
        order.setTotalAmount(finalAmount);

        OrderDaoImpl orderDao = new OrderDaoImpl();

        int orderId = orderDao.addOrder(order);

        OrderItemDaoImpl orderItemDao = new OrderItemDaoImpl();

        for (CartItem item : cart.getItems().values()) {

            OrderItem orderItem = new OrderItem();

            orderItem.setOrderId(orderId);
            orderItem.setMenuId(item.getMenuId());
            orderItem.setQuantity(item.getQuantity());
            orderItem.setItemTotal(item.getTotalPrice());

            orderItemDao.addOrderItem(orderItem);
        }

        session.removeAttribute("cart");
        session.removeAttribute("restaurantId");
        session.removeAttribute("finalAmount");

        response.sendRedirect("orderConfirmation.jsp");
    }
    
   
}