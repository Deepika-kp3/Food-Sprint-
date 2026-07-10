package com.food.servlets;

import java.io.IOException;

import com.tap.DaoImpl.UserDaoImpl;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        int userId =
        Integer.parseInt(req.getParameter("userId"));

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String role = req.getParameter("role");

        User user = new User();

        user.setUserId(userId);
        user.setName(name);
        user.setEmail(email);
        user.setAddress(address);
        user.setRole(role);

        UserDaoImpl dao = new UserDaoImpl();

        int result = dao.updateUser(user);

        if(result > 0){

            resp.sendRedirect("viewUsers");

        }else{

            resp.sendRedirect("editUser?id="+userId);

        }

    }

}