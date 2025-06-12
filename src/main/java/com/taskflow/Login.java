package com.taskflow;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		try (Connection conn = DB.getConnection()) {
		
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				
				String userId = rs.getString("id");
				HttpSession session = req.getSession();
				session.setAttribute("user_id", userId);
				
				resp.sendRedirect("addTask.jsp");
				
			} 
			else
			{
				
				req.setAttribute("errorMessage", "Invalid username or password.");
				
				req.getRequestDispatcher("login.jsp").forward(req, resp);
				
			}

		} catch (Exception e) {
			
		    e.printStackTrace();
		    req.setAttribute("errorMessage", "Internal error occurred. Please try again later.");
		    req.getRequestDispatcher("login.jsp").forward(req, resp);
		    
		}	
		
	}
	
}
