package com.mahesh.servlets;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mahesh.dao.registrationDao;
import com.mahesh.dto.registrationDto;

public class Registration extends HttpServlet {
	registrationDto register = new registrationDto();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {
		Connection connection = null;
		String context=req.getContextPath();
		register.setFname(req.getParameter("fname"));
		register.setLname(req.getParameter("lname"));
		register.setAddress(req.getParameter("address"));
		register.setContact(req.getParameter("contact"));
		register.setPassword(req.getParameter("password"));
		register.setEmailid(req.getParameter("email"));
		register.setCity(req.getParameter("city"));
		register.setPincode(Integer.parseInt(req.getParameter("pincode")));
		boolean isRegistered = registrationDao.isRegistered(register);
		if(isRegistered == true){
			resp.sendRedirect(context+"/jsp/Login.jsp");
		}else{
			resp.sendRedirect(context+"/jsp/Registration.html");
		}
	}
}
