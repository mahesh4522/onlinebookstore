package com.mahesh.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConnection {
	static Connection connection;
	static PreparedStatement preparedstatement;
	
	public static Connection getConnecttion(){
		try {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost/bookstore","root","toor");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	public static void closeConnection(Connection connection){
		try{
			if(connection != null)
				connection.close();
		}
		catch (Exception e){
		    e.printStackTrace();
		}
	}
	public static void closePStatement(PreparedStatement preparedStatement){
		try {
			if(preparedStatement != null)
				preparedStatement.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public static void closeResultset(ResultSet resultSet){
		try {
			if (resultSet != null) {
				resultSet.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}



