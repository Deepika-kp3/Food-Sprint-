package com.food.servlets;

import java.io.IOException;

import com.tap.DaoImpl.UserDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        int userId =
        Integer.parseInt(req.getParameter("id"));

        UserDaoImpl dao =
        new UserDaoImpl();

        dao.deleteUser(userId);

        resp.sendRedirect("viewUsers");

    }

}