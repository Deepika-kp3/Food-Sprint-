package com.tap.DaoImpl;

import com.tap.Dao.CartDao;
import com.tap.Model.Cart;
import com.tap.Model.CartItem;

public class CartDaoImpl implements CartDao {

    @Override
    public void addItem(Cart cart, CartItem item) {

        if (cart != null && item != null) {
            cart.addItem(item);
        }

    }

    @Override
    public void updateItem(Cart cart, int menuId, int quantity) {

        if (cart != null) {
            cart.updateItem(menuId, quantity);
        }

    }

    @Override
    public void removeItem(Cart cart, int menuId) {

        if (cart != null) {
            cart.removeItem(menuId);
        }

    }

    @Override
    public Cart getCart(Cart cart) {

        return cart;

    }

    @Override
    public void clearCart(Cart cart) {

        if (cart != null) {
            cart.getItems().clear();
        }

    }

}