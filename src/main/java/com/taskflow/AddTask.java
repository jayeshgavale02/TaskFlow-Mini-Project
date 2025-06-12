package com.taskflow;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addtask")
public class AddTask extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("user_id") == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		String title = req.getParameter("title");
		String des = req.getParameter("description");
		String date = req.getParameter("due_date");
		int userId = Integer.parseInt(session.getAttribute("user_id").toString());

		if (title == null || title.trim().isEmpty() || date == null || date.trim().isEmpty()) {
			req.setAttribute("errorMessage", "Title and Due Date are required.");
			req.getRequestDispatcher("addTask.jsp").forward(req, resp);
			return;
		}

		try (Connection conn = DB.getConnection()) {
			String sql = "INSERT INTO tasks (title, description, due_date, user_id) VALUES (?, ?, ?, ?)";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, des);
			stmt.setString(3, date);
			stmt.setInt(4, userId);

			int result = stmt.executeUpdate();

			if (result > 0) {
				req.setAttribute("successMessage", "Task added successfully.");
			} else {
				req.setAttribute("errorMessage", "Failed to add task.");
			}

			req.getRequestDispatcher("addTask.jsp").forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "Internal error occurred. Please try again.");
			req.getRequestDispatcher("addTask.jsp").forward(req, resp);
		}
	}
}
