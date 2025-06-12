package com.taskflow;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteTask")
public class DeleteTask extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String idStr = request.getParameter("id");

		if (idStr != null && !idStr.isEmpty()) {
			try {
				int taskId = Integer.parseInt(idStr);

				try (Connection conn = DB.getConnection()) {
					String sql = "DELETE FROM tasks WHERE id = ?";
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, taskId);
					int rowsAffected = stmt.executeUpdate();

					if (rowsAffected > 0) {
						session.setAttribute("successMessage", "Task deleted successfully.");
					} else {
						session.setAttribute("errorMessage", "Task not found or couldn't be deleted.");
					}
				} catch (Exception e) {
					e.printStackTrace();
					session.setAttribute("errorMessage", "Database error occurred.");
				}
			} catch (NumberFormatException e) {
				session.setAttribute("errorMessage", "Invalid task ID.");
			}
		} else {
			session.setAttribute("errorMessage", "Task ID is missing.");
		}

		response.sendRedirect("addTask.jsp");
	}
}
