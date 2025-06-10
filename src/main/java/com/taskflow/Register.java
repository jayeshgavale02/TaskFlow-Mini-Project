package com.taskflow;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		try (Connection conn = DB.getConnection()) {
			String sql = "insert into users (username,password)values(?,?);";
			
			PreparedStatement rs = conn.prepareStatement(sql);
			rs.setString(1, username);
			rs.setString(2, password);
			int result = rs.executeUpdate();
			System.out.println(rs);
			if(result > 0) {
//				System.out.println("sss");
				
			
				resp.sendRedirect("login.jsp");
			}else {
//				System.out.println("ffff");
				resp.sendRedirect("register.jsp");

			}

		} catch (Exception e) {
		    e.printStackTrace();
		}	
		}

}
