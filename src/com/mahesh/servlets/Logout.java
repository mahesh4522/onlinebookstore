package com.mahesh.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		RequestDispatcher reqDisp;
		PrintWriter out=resp.getWriter();
		
		String context = req.getContextPath();
		resp.sendRedirect(context+"/jsp/Login.jsp");
		session.invalidate();
		out.print("successfully Logged Out");
		
	
	
	}
	
}