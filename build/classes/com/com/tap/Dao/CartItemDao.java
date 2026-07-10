package com.tap.Dao;

import com.tap.Model.Cart;
import com.tap.Model.CartItem;

public interface CartItemDao {

    void addCartItem(Cart cart, CartItem item);

    void updateCartItem(Cart cart, int menuId, int quantity);

    void removeCartItem(Cart cart, int menuId);

    CartItem getCartItem(Cart cart, int menuId);

}