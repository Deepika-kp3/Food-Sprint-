package com.food.servlets;

import java.io.IOException;

import com.tap.DaoImpl.UserDaoImpl;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("id"));

        UserDaoImpl dao = new UserDaoImpl();

        User user = dao.getUser(userId);

        req.setAttribute("user", user);

        req.getRequestDispatcher("editUser.jsp")
           .forward(req, resp);

    }
}