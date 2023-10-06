package com.example.mvc.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		Connection connection = null;
		
		String url = "jdbc:mariadb://localhost:3308/market";
		String user = "root";
		String password = "7061";
		
		Class.forName("org.mariadb.jdbc.Driver");
		connection = DriverManager.getConnection(url, user, password);
		
		return connection;
	}
}
