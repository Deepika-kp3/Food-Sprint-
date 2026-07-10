package com.food.servlets;

import java.io.IOException;

import com.tap.DaoImpl.MenuDaoImpl;
import com.tap.Model.Cart;
import com.tap.Model.CartItem;
import com.tap.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callCartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        Integer oldRestaurantId = (Integer) session.getAttribute("restaurantId");

        String action = req.getParameter("action");

        String restaurantParam = req.getParameter("restaurantId");

        Integer newRestaurantId = null;

        if (restaurantParam != null && !restaurantParam.isEmpty()) {
            newRestaurantId = Integer.parseInt(restaurantParam);
        }

        // Create cart only while adding items
        if ("add".equals(action)) {

            if (cart == null || oldRestaurantId == null || !oldRestaurantId.equals(newRestaurantId)) {

                cart = new Cart();

                session.setAttribute("cart", cart);

                session.setAttribute("restaurantId", newRestaurantId);
            }
        }

        if ("add".equals(action)) {

            addItemToCart(req, cart);

        } else if ("update".equals(action)) {

            updateCart(req, cart);

        } else if ("delete".equals(action)) {

            removeItemFromCart(req, cart);

        }

        resp.sendRedirect("cart.jsp");
    }

    // ---------------- ADD ITEM ----------------

    private void addItemToCart(HttpServletRequest req, Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        int quantity = Integer.parseInt(req.getParameter("quantity"));

        MenuDaoImpl menuDao = new MenuDaoImpl();

        Menu menu = menuDao.getMenu(menuId);

        if (menu != null) {

            CartItem cartItem = new CartItem(
                    menuId,
                    menu.getRestaurantId(),
                    menu.getItemName(),
                    menu.getPrice(),
                    quantity);

            cart.addItem(cartItem);

        } else {

            System.out.println("Menu Not Found for Menu ID : " + menuId);

        }
    }

    // ---------------- UPDATE ----------------

    private void updateCart(HttpServletRequest req, Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        int quantity = Integer.parseInt(req.getParameter("quantity"));

        cart.updateItem(menuId, quantity);

    }

    // ---------------- DELETE ----------------

    private void removeItemFromCart(HttpServletRequest req, Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        cart.removeItem(menuId);

    }

}