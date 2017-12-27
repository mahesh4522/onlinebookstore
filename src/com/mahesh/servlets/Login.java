package com.mahesh.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mahesh.dao.loginDao;
import com.mahesh.dto.loginDto;
public class Login extends HttpServlet {

	

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {
		loginDto login = new loginDto();
		String contact=req.getParameter("userid") == null ? "" :  req.getParameter("userid");
		String password=req.getParameter("password")== null ? "" : req.getParameter("password");
		login.setContact(contact);
		login.setPassword(password);
		HttpSession session=req.getSession();
		session.setAttribute("contact", contact);
		PrintWriter printWriter = resp.getWriter();

		String context=req.getContextPath();
		boolean isLogin=loginDao.isLogon(login);
		if(isLogin == true){
			session.setAttribute("firstName", login.getFirstName());
			session.setAttribute("lastName", login.getLastName());
			session.setAttribute("address", login.getAddress());
			resp.sendRedirect(context+"/jsp/Welcome.jsp");
		}else{
			resp.sendRedirect(context+"/jsp/Login.jsp");
			printWriter.write("<script type=\"text/javascript\">");
			printWriter.write("alert('Wrong User Name Or Password');");
			printWriter.write("</script>");
		}
		}
	}

