package com.food.servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DaoImpl.UserDaoImpl;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String role="SUPER_ADMIN";
		
		String hashpw = BCrypt.hashpw(password, BCrypt.gensalt(12));
		User user = new User(name, hashpw, email, address, role);
		UserDaoImpl userDaoImpl=new UserDaoImpl();
		int res=userDaoImpl.addUser(user);
		
		if(res==1)
		{
			resp.sendRedirect("login.html");
		}
		else
		{
			resp.sendRedirect("register.html");
			
		}
		
		
		
	}
	

}
