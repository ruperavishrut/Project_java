package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.Order;
import com.util.DBUtil;

public class OrderDao
{
	Connection con=null;
	int x=0;
	public int Cancel_Order(Order omodel) {
		con = new DBUtil().getDatabaseConnection();			
		try {
			String cancel = "UPDATE orderdb SET `order_status`='Cancel' WHERE uid=? AND `order_id`=?";
			PreparedStatement st;
			st = con.prepareStatement(cancel);			
			st.setInt(1,omodel.getUid());
			st.setString(2,omodel.getOrder_id());			
			x = st.executeUpdate();	
			
			String payments="UPDATE payments SET STATUS='Cancel' WHERE uid=? AND `order_id`=?";
			st = con.prepareStatement(payments);			
			st.setInt(1,omodel.getUid());
			st.setString(2,omodel.getOrder_id());			
			x = st.executeUpdate();	
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}			
		
		
		
		return x;
	}
	public int editOrderStatus(Order omodel) {
		
		con = new DBUtil().getDatabaseConnection();			
		try {
			String cancel = "UPDATE orderdb SET `order_status`=? WHERE uid=? AND `order_id`=?";
			PreparedStatement st;
			st = con.prepareStatement(cancel);
			st.setString(1,omodel.getOrder_status());
			st.setInt(2,omodel.getUid());
			st.setString(3,omodel.getOrder_id());			
			x = st.executeUpdate();
			
		if(omodel.getOrder_status().equals("Cancel")){	
			String payments="UPDATE payments SET status=? WHERE uid=? AND `order_id`=?";
			st = con.prepareStatement(payments);
			st.setString(1,omodel.getOrder_status());
			st.setInt(2,omodel.getUid());
			st.setString(3,omodel.getOrder_id());			
			x = st.executeUpdate();	
		}
		if(omodel.getOrder_status().equals("Delivered")){	
			String payments="UPDATE payments SET status=? WHERE uid=? AND `order_id`=?";
			st = con.prepareStatement(payments);
			st.setString(1,"PAID");
			st.setInt(2,omodel.getUid());
			st.setString(3,omodel.getOrder_id());			
			x = st.executeUpdate();	
		}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}			
		
		return x;
	}
}
