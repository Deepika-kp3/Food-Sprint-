package com.tap.DaoImpl;

import com.tap.Dao.CartItemDao;
import com.tap.Model.Cart;
import com.tap.Model.CartItem;

public class CartItemDaoImpl implements CartItemDao {

    @Override
    public void addCartItem(Cart cart, CartItem item) {

        if (cart != null && item != null) {
            cart.addItem(item);
        }

    }

    @Override
    public void updateCartItem(Cart cart, int menuId, int quantity) {

        if (cart != null) {
            cart.updateItem(menuId, quantity);
        }

    }

    @Override
    public void removeCartItem(Cart cart, int menuId) {

        if (cart != null) {
            cart.removeItem(menuId);
        }

    }

    @Override
    public CartItem getCartItem(Cart cart, int menuId) {

        if (cart != null && cart.getItems().containsKey(menuId)) {
            return cart.getItems().get(menuId);
        }

        return null;
    }
}