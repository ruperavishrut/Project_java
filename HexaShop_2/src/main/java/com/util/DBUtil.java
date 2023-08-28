package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil 
{
	Connection con=null;
	public Connection getDatabaseConnection()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hexashop", "root", "");
			//System.out.println("Connection Established...");
		}
		catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		
		
		
		return con;
	}
}
