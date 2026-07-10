package com.tap.Dao;

import java.util.List;

import com.tap.Model.OrderItem;

public interface OrderItemDao {

    void addOrderItem(OrderItem o);

    void updateOrderItem(OrderItem o);

    void deleteOrderItem(int orderItemId);

    OrderItem getOrderItem(int orderItemId);

    List<OrderItem> getAllOrderItems();
}