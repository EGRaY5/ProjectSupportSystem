package com.projectsupport.DbConnectionLib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {     //DB connection configuration
	
	public static Connection getMysqlConnection() throws ClassNotFoundException,SQLException {
		String hostName = "localhost";
		String dbName = "mydb";
		String userName = "root";
		String password = "";
		
		return getMysqlConnection(hostName,dbName,userName,password);
			
	}      
					
	public static Connection getMysqlConnection(String hostname,String dbname,String username,String password) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		String connectionURL = "jdbc:mysql://" + hostname + ":3306/" + dbname+"?useSSL=false";
		Connection conn = 	DriverManager.getConnection(connectionURL,username,password);
		System.out.println("Connection Successfull");
		return conn;
	}	
	
}
