package com.tap.DaoImpl;

import java.sql.*;
import java.util.*;

import com.tap.Dao.OrderItemDao;
import com.tap.Model.OrderItem;

public class OrderItemDaoImpl implements OrderItemDao {

    String url = "jdbc:mysql://localhost:3306/instant_food";
    String username = "root";
    String password = "root";

    @Override
    public void addOrderItem(OrderItem orderItem) {

        String query =
        "INSERT INTO orderitem(orderId, menuId, quantity, itemTotal) VALUES(?,?,?,?)";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con =
            DriverManager.getConnection(url, username, password);

            PreparedStatement pstmt =
            con.prepareStatement(query);

            pstmt.setInt(1, orderItem.getOrderId());
            pstmt.setInt(2, orderItem.getMenuId());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getItemTotal());

            pstmt.executeUpdate();

            pstmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {

        String query =
        "UPDATE orderitem SET orderId=?,quantity=?,itemTotal=?,menuId=? WHERE orderItemId=?";

    }

    @Override
    public void deleteOrderItem(int orderItemId) {

        String query =
        "DELETE FROM orderitem WHERE orderItemId=?";

    }

    @Override
    public OrderItem getOrderItem(int orderItemId) {

        return null;
    }

    @Override
    public List<OrderItem> getAllOrderItems() {

        return null;
    }
}