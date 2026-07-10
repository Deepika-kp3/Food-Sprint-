package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DaoImpl.UserDaoImpl;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/viewUsers")
public class ViewUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        UserDaoImpl dao = new UserDaoImpl();

        List<User> users = dao.getAllUsers();

        req.setAttribute("users", users);

        req.getRequestDispatcher("users.jsp").forward(req, resp);

    }
}