package com.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Cart;
import com.model.User;
import com.util.DBUtil;

public class CartDao 
{
	Connection con=null;
	int x=0;
	public int addcart(Cart cmodel) 
	{
		con = new DBUtil().getDatabaseConnection();	
		
		try 
		{
			
			String qry2="select uid,pid from cart where uid=? and pid=?";
			java.sql.PreparedStatement st2 = con.prepareStatement(qry2);
			st2.setInt(1, cmodel.getUid());
			st2.setInt(2, cmodel.getPid());
			//st.setString(3, cmodel.getSize());
			//st.setInt(4, cmodel.getQuantity());
			//x = st2.executeQuery();
			ResultSet rs = st2.executeQuery();
			if (rs.next()) 
			{				
				return x=2;
			}			
			else
			{
				String qry1="INSERT INTO cart (\r\n"
						+ "             `uid`,\r\n"
						+ "             `pid`,\r\n"
						+ "             `size`,\r\n"
						+ "             `quantity`,\r\n"
						+ "             `price`,\r\n"
						+ "             `total`,\r\n"
						+ "             `date`)\r\n"
						+ "VALUES (?,?,?,?,?,?,NOW())";
				java.sql.PreparedStatement st1 = con.prepareStatement(qry1);
				st1.setInt(1, cmodel.getUid());
				st1.setInt(2, cmodel.getPid());
				st1.setString(3, cmodel.getSize());
				st1.setInt(4, cmodel.getQuantity());
				st1.setFloat(5, cmodel.getPrice());
				st1.setFloat(6, cmodel.getPrice()*cmodel.getQuantity());
				x = st1.executeUpdate();
				
				return x=1;
			}						
		
		} 
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		return x=0;		
	}
	public int pd_increase(Cart cmodel) {
		con = new DBUtil().getDatabaseConnection();
		String qry = "update cart set quantity=?,total=? where uid=? AND pid=?";
		try 
		{			
			java.sql.PreparedStatement st = con.prepareStatement(qry);			
			st.setInt(1,cmodel.getQuantity());
			st.setInt(2, (int) (cmodel.getPrice()*cmodel.getQuantity()));
			st.setInt(3,cmodel.getUid());
			st.setInt(4,cmodel.getPid());
			x = st.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return x;
		
	}
	public int pd_decrease(Cart cmodel) {
		con = new DBUtil().getDatabaseConnection();
		String qry = "update cart set quantity=?,total=? where uid=? AND pid=?";
		try 
		{			
			java.sql.PreparedStatement st = con.prepareStatement(qry);			
			st.setInt(1,cmodel.getQuantity());
			st.setInt(2, (int) (cmodel.getPrice()*cmodel.getQuantity()));
			st.setInt(3,cmodel.getUid());
			st.setInt(4,cmodel.getPid());
			x = st.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return x;
	}
	
	public int Product_Remove(Cart cmodel) {
		
		con = new DBUtil().getDatabaseConnection();
		String qry = "delete from cart where uid=? AND pid=?";
		try 
		{			
			java.sql.PreparedStatement st = con.prepareStatement(qry);			
			st.setInt(1,cmodel.getUid());
			st.setInt(2,cmodel.getPid());			
			x = st.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return x;
	}

	
	
}
