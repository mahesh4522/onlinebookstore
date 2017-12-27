package com.mahesh.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mahesh.connection.DbConnection;

public class OrderDetails extends HttpServlet {


	Connection connection = null;
	Timestamp ts=new Timestamp(System.currentTimeMillis());
	
	Random random=new Random();
	int n = random.nextInt(99999)+10000;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session=req.getSession();
		
		String fn=String.valueOf(session.getAttribute("firstName"));
		String ln=String.valueOf(session.getAttribute("lastName"));
		String context = req.getContextPath();
		try {
			connection = DbConnection.getConnecttion();
			PreparedStatement p=connection.prepareStatement("insert into Order_Details values (?,?,?,?,?,?,?)");
			p.setInt(1, n);
			p.setString(2, (String) session.getAttribute("bid"));
			p.setString(3, fn+" "+ln);
			p.setString(4, String.valueOf(session.getAttribute("contact")));
			p.setString(5, String.valueOf(session.getAttribute("address")));
			p.setTimestamp(6, ts);
			p.setInt(7, Integer.parseInt((String) session.getAttribute("quantity")));
		
			int x=p.executeUpdate();
			
			
			if(x!=0)
			{
				resp.sendRedirect(context+"/jsp/final.jsp");
			}
			else{
			}
		} catch (Exception e) {
			
		e.printStackTrace();
		
		}
	
	}
	
	
}
