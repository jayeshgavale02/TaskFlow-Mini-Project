package com.taskflow;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateTaskStatus")
public class UpdateTaskStatus extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String status = request.getParameter("status");

		try (Connection conn = DB.getConnection()){
		     PreparedStatement stmt = conn.prepareStatement("UPDATE tasks SET status = ? WHERE id = ?");
			stmt.setString(1, status);
			stmt.setString(2, id);
			int updated = stmt.executeUpdate();
			response.getWriter().write("Updated rows: " + updated);
		} catch (Exception e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
		}
	}
}

