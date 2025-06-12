package com.taskflow;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String username = req.getParameter("username");
		String password = req.getParameter("password");

		if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
			req.setAttribute("errorMessage", "Username and password are required.");
			req.getRequestDispatcher("register.jsp").forward(req, resp);
			return;
		}

		try (Connection conn = DB.getConnection()) {
			String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);

			int result = stmt.executeUpdate();

			if (result > 0) {
				resp.sendRedirect("login.jsp");
			} else {
				req.setAttribute("errorMessage", "Registration failed. Please try again.");
				req.getRequestDispatcher("register.jsp").forward(req, resp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			String errorMsg = "Registration failed. ";

			if (e.getMessage().contains("Duplicate")) {
				errorMsg += "Username already exists.";
			} else {
				errorMsg += "Please try again.";
			}

			req.setAttribute("errorMessage", errorMsg);
			req.getRequestDispatcher("register.jsp").forward(req, resp);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
}
