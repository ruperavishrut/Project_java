package com.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.model.Admin;
import com.model.Category;
import com.model.User;
import com.util.DBUtil;

public class UserDao {
	Connection con = null;
	int x = 0;

	public int user_register(User rmodel)
	{
		con = new DBUtil().getDatabaseConnection();
		String qry = "INSERT INTO user (`firstname`," + "             `lastname`," + "             `gender`,"
				+ "             `state`," + "             `city`," + "             `address`,"
				+ "             `pincode`," + "             `mobileno`," + "             `email`,"
				+ "             `password`,"
				+ "             `image`,status,create_at)  VALUES (?,?,?,?,?,?,?,?,?,?,?,?,NOW())";
		try {
			java.sql.PreparedStatement st = con.prepareStatement(qry);

			InputStream is = rmodel.getImage();

			st.setString(1, rmodel.getFirstname());
			st.setString(2, rmodel.getLastname());
			st.setString(3, rmodel.getGender());
			st.setString(4, rmodel.getState());
			st.setString(5, rmodel.getCity());
			st.setString(6, rmodel.getAddress());
			st.setInt(7, rmodel.getPincode());
			st.setString(8, rmodel.getMobileno());
			st.setString(9, rmodel.getEmail());
			st.setString(10, rmodel.getPassword());
			st.setBlob(11, is);
			st.setString(12, "Deactive");

			x = st.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return x;
	}

	public User user_login(User amodel) 
	{
		User model = null;

		con = new DBUtil().getDatabaseConnection();
		String qry = "select * from user where email=? and password=?";
		try {
			java.sql.PreparedStatement st = con.prepareStatement(qry);
			st.setString(1, amodel.getEmail());
			st.setString(2, amodel.getPassword());

			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				model = new User();
				model.setId(rs.getInt(1));
				model.setFirstname(rs.getString("firstname"));
				model.setLastname(rs.getString("lastname"));
				model.setEmail(rs.getString("email"));
				model.setPassword(rs.getString("password"));
				
			}
			String q1 = "update user set status='Active' where email=? and password=?";
			st = con.prepareStatement(q1);
			st.setString(1, amodel.getEmail());
			st.setString(2, amodel.getPassword());
			st.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	public int user_logout(int id) 
	{
		con = new DBUtil().getDatabaseConnection();
		String q1 = "update user set status='Deactive' where uid=?";
		
		try 
		{
			java.sql.PreparedStatement st = con.prepareStatement(q1);
			st.setInt(1, id);
			x=st.executeUpdate();
			
		} catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return x;
	}

	public int user_update(User rmodel) 
	{
		
		con = new DBUtil().getDatabaseConnection();
		String qry = "update user set firstname=?,lastname=?,gender=?,state=?,city=?,address=?,pincode=?,mobileno=?,email=?,password=?,image=? where uid=? ";
		try 
		{
			
			java.sql.PreparedStatement st = con.prepareStatement(qry);

			InputStream is = rmodel.getImage();

			st.setString(1, rmodel.getFirstname());
			st.setString(2, rmodel.getLastname());
			st.setString(3, rmodel.getGender());
			st.setString(4, rmodel.getState());
			st.setString(5, rmodel.getCity());
			st.setString(6, rmodel.getAddress());
			st.setInt(7, rmodel.getPincode());
			st.setString(8, rmodel.getMobileno());
			st.setString(9, rmodel.getEmail());
			st.setString(10, rmodel.getPassword());
			st.setBlob(11, is);
			st.setInt(12, rmodel.getId());
			

			x = st.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return x;
		
	}
}
