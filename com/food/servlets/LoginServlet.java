package com.food.servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DaoImpl.UserDaoImpl;
import com.tap.Model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

    	String name = req.getParameter("name");
    	String password = req.getParameter("password");

    	System.out.println("Entered Username = " + name);
    	System.out.println("Entered Password = " + password);

    	UserDaoImpl userDao = new UserDaoImpl();
    	User user = userDao.getUserByUsername(name);

    	if (user == null) {

    	    System.out.println("USER NOT FOUND");

    	    req.getRequestDispatcher("login.html").forward(req, resp);
    	    return;
    	}

    	System.out.println("Database Username = " + user.getName());
    	System.out.println("Database Password = " + user.getPassword());

    	boolean match = BCrypt.checkpw(password, user.getPassword());

    	System.out.println("Password Match = " + match);

    	if (match) {

    	    System.out.println("LOGIN SUCCESS");

    	    HttpSession session = req.getSession();

    	    session.setAttribute("user", user);
    	    session.setAttribute("name", user.getName());
    	    session.setAttribute("role", user.getRole());

    	    if ("SUPER_ADMIN".equals(user.getRole())) {

    	        resp.sendRedirect("superAdmin.jsp");

    	    } else if ("ADMIN".equals(user.getRole())) {

    	        resp.sendRedirect("adminDashboard.jsp");

    	    } else {

    	        resp.sendRedirect("home");
    	    }
    	} else {

    	    System.out.println("WRONG PASSWORD");

    	    req.getRequestDispatcher("login.html").forward(req, resp);
    	}
    }
}
    