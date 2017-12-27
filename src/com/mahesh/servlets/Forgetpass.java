package com.mahesh.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Forgetpass extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String userid=req.getParameter("userid");
		String email=req.getParameter("email");
		String pin=req.getParameter("pincode");
		String npass=req.getParameter("newpassword");
		String ncpass=req.getParameter("cnewpassword");
		PrintWriter pw=resp.getWriter();
		RequestDispatcher rd;
		try
		{
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:51470;databaseName=BookStore;integratedSecurity=true");
			PreparedStatement p=conn.prepareStatement("select * from Registration where r_contact = ? ");
			p.setString(1, userid);
			ResultSet rs=p.executeQuery();
			
			while(rs.next())
			{
				if(userid.equals(rs.getString(4)))
				{
					if(email.equals(rs.getString(6)))
					{
						if(pin.equals(rs.getString(8)))
						{
							if(npass.equals(ncpass))
							{
							
							PreparedStatement ps=conn.prepareStatement("update Registration set r_password=? where r_contact = ? ");
							ps.setString(1, npass);
							ps.setString(2, userid);
							int x=ps.executeUpdate();
							
							if(x!=0)
							{	
								//req.setAttribute("msg", "Password Changed Successfully");
								rd=req.getRequestDispatcher("/Login.jsp");
								pw.print("Password Changed Successfully");
								rd.include(req, resp);
								
							}else
							{
								rd=req.getRequestDispatcher("/ForgetPass.jsp");
								rd.include(req, resp);
								pw.print("Password Not Change Change Please Try Again!!");
							}
						
							}else
							{
								rd=req.getRequestDispatcher("/ForgetPass.jsp");
								rd.include(req, resp);
								pw.print("New Password And Confirm Password Not Matched");
							}
							
						}else
						{
							rd=req.getRequestDispatcher("/ForgetPass.jsp");
							rd.include(req, resp);
							pw.print("Enter Correct Pincode...Pincode Not Found");
						}
						
					}else
					{
						rd=req.getRequestDispatcher("/ForgetPass.jsp");
						rd.include(req, resp);
						pw.print("Enter Correct E-mail...E-mail Not Found");
					}
					
				}else
				{
					rd=req.getRequestDispatcher("/ForgetPass.jsp");
					rd.include(req, resp);
					pw.print("Enter Correct UserId...UserId Not Found");
				}
				
			}
			
					
		}
			
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	}
	
	
	
}
