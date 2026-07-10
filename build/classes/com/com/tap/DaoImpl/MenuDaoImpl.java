package com.tap.DaoImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.Dao.MenuDao;
import com.tap.Model.Menu;

public class MenuDaoImpl implements MenuDao {

    String url = "jdbc:mysql://localhost:3306/instant_food";
    String username = "root";
    String password = "root";

    @Override
    public void addMenu(Menu menu) {

        String query = "INSERT INTO menu VALUES(?,?,?,?,?,?,?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, username, password);
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setInt(1, menu.getMenuId());
            pstmt.setInt(2, menu.getRestaurantId());
            pstmt.setString(3, menu.getItemName());
            pstmt.setString(4, menu.getDescription());
            pstmt.setDouble(5, menu.getPrice());
            pstmt.setBoolean(6, menu.isAvailable());
            pstmt.setString(7, menu.getImagePath());

            pstmt.executeUpdate();

            pstmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateMenu(Menu menu) {
        // TODO
    }

    @Override
    public void deleteMenu(int menuId) {
        // TODO
    }

    @Override
    public Menu getMenu(int menuId) {

        Menu menu = null;

        String query = "SELECT * FROM menu WHERE menuId=?";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, username, password);

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setInt(1, menuId);

            ResultSet res = pstmt.executeQuery();

            if (res.next()) {

                menu = new Menu(
                        res.getInt("menuId"),
                        res.getInt("restaurantId"),
                        res.getString("itemName"),
                        res.getString("description"),
                        res.getDouble("price"),
                        res.getBoolean("isAvailable"),
                        res.getString("imagePath"));

            }

            res.close();
            pstmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menu;
    
    }

    @Override
    public List<Menu> getAllMenus() {
        return null;
    }

    @Override
    public List<Menu> getAllMenusByRestaurant(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        String query = "SELECT * FROM menu WHERE restaurantId=?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, username, password);

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, restaurantId);

            ResultSet res = pstmt.executeQuery();

            while (res.next()) {

                Menu menu = new Menu(
                        res.getInt("menuId"),
                        res.getInt("restaurantId"),
                        res.getString("itemName"),
                        res.getString("description"),
                        res.getDouble("price"),
                        res.getBoolean("isAvailable"),
                        res.getString("imagePath")
                );

                menuList.add(menu);
            }

            res.close();
            pstmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }
}