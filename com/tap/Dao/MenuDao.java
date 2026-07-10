package com.tap.Dao;

import java.util.List;
import com.tap.Model.Menu;

public interface MenuDao {

    void addMenu(Menu m);

    void updateMenu(Menu m);

    void deleteMenu(int menuId);

    Menu getMenu(int menuId);

    List<Menu> getAllMenus();

    List<Menu> getAllMenusByRestaurant(int restaurantId);
}