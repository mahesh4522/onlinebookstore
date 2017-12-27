package com.mahesh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.mahesh.connection.DbConnection;
import com.mahesh.dto.loginDto;

public class loginDao {
	public static boolean isLogon(loginDto login){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DbConnection.getConnecttion();
			preparedStatement=connection.prepareStatement("select * from registration where contact=?");
			preparedStatement.setString(1, login.getContact());
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				login.setFirstName(resultSet.getString(1));
				login.setLastName(resultSet.getString(2));
				login.setAddress(resultSet.getString(3));
				
				if(login.getPassword().equals(resultSet.getString(5))){
					return true;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		finally{
				DbConnection.closeResultset(resultSet);
				DbConnection.closePStatement(preparedStatement);
				DbConnection.closeConnection(connection);
		}
		return false;
	}
}
