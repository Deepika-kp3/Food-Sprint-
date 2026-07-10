package com.tap.Dao;

import java.util.List;
import com.tap.Model.Order;

public interface OrderDao {

    int addOrder(Order o);

    void updateOrder(Order o);

    void deleteOrder(int orderId);

    Order getOrder(int orderId);

    List<Order> getAllOrders();

    List<Order> getOrdersByUserId(int userId);
}