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

@WebServlet("/Login")
public class Login extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		try (Connection conn = DB.getConnection()) {
		
			PreparedStatement smtp = conn.prepareStatement("select *from users where username=? and password=?");
			smtp.setString(1, username);
			smtp.setString(2, password);
			ResultSet rs = smtp.executeQuery();
			
			if(rs.next()) {
				System.out.println("sss2");
			}else {
				System.out.println("ffff");
			}

		} catch (Exception e) {
		    e.printStackTrace();
		}	
		
	}
	

}
