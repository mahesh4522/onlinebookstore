package com.mahesh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.mahesh.connection.DbConnection;
import com.mahesh.dto.registrationDto;

public class registrationDao {
	public static boolean isRegistered(registrationDto register){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = DbConnection.getConnecttion();
			preparedStatement=connection.prepareStatement("insert into registration value (?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1, register.getFname());
			preparedStatement.setString(2, register.getLname());
			preparedStatement.setString(3, register.getAddress());
			preparedStatement.setString(4, register.getContact());
			preparedStatement.setString(5, register.getPassword());
			preparedStatement.setString(6, register.getEmailid());
			preparedStatement.setString(7, register.getCity());
			preparedStatement.setInt(8, register.getPincode());
			
			int isRegister = preparedStatement.executeUpdate();
				
				if(isRegister == 1){
					return true;
				}
		} catch (Exception e) {
			System.out.println(e);
		}
		finally{
				DbConnection.closePStatement(preparedStatement);
				DbConnection.closeConnection(connection);
		}
		return false;
	}
}
