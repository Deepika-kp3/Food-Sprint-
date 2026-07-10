package com.tap.Dao;

import com.tap.Model.Cart;
import com.tap.Model.CartItem;

public interface CartDao {

    void addItem(Cart cart, CartItem item);

    void updateItem(Cart cart, int menuId, int quantity);

    void removeItem(Cart cart, int menuId);

    Cart getCart(Cart cart);

    void clearCart(Cart cart);

}