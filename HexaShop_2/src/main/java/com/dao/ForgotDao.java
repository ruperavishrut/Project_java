package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.User;
import com.util.DBUtil;

public class ForgotDao {
	
	public User checkEmail(String email)
	{
		User f=new  User();
		try {
		
			Connection conn=new DBUtil().getDatabaseConnection();
			String sql="select * from  user where email=?";
			PreparedStatement stmt=conn.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
				f.setId(rs.getInt(1));
				f.setEmail(rs.getString("email"));
				f.setFirstname(rs.getString(2));
				f.setLastname(rs.getString(3));
			}
			else

			{
				f=null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	public int resetPassword(User f)
	{
		int r=0;
		try {
			Connection conn=new DBUtil().getDatabaseConnection();
			String sql="update  user set password=? where uid=?";
			PreparedStatement stmt=conn.prepareStatement(sql);
			stmt.setString(1, f.getPassword());
			stmt.setInt(2, f.getId());
			r=stmt.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	}

}