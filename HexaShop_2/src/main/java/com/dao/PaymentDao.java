package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.model.Order;
import com.model.payments;
import com.util.DBUtil;

public class PaymentDao {
	
	public  int addOrder(payments pmodel)
	{
		int x = 0;
		java.util.Date date = new java.util.Date();
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		System.out.println(ft.format(date));
		String adddate=ft.format(date);
 	  try 
		{
 		  
 		 Connection con = new DBUtil().getDatabaseConnection();
		 String qry1="INSERT INTO payments (\r\n"
						+ "             `order_id`,\r\n"
						+ "             `payment_id`,\r\n"
						+ "             `payment_signature`,\r\n"
						+ "             `status`,\r\n"
						+ "             `uid`,\r\n"
						+ "             `amount`,\r\n"
						+ "             `date`,`payment_mode`)\r\n"
						+ "VALUES (?,?,?,?,?,?,NOW(),?)";
				java.sql.PreparedStatement st1 = con.prepareStatement(qry1);
				st1.setString(1, pmodel.getOrder_id());
				st1.setString(2, pmodel.getPayment_id());
				st1.setString(3, pmodel.getPayment_signature());
				st1.setString(4, pmodel.getStatus());
				st1.setInt(5, pmodel.getUid());
				st1.setInt(6, pmodel.getAmount());
				st1.setString(7, pmodel.getPayment_mode());
				x=st1.executeUpdate();				
				
				String insertcod="INSERT INTO orderdb (uid, pid, size, quantity, price, total)SELECT uid,pid,size,quantity,price,total FROM cart WHERE uid ="+pmodel.getUid()+"";
		        java.sql.PreparedStatement st0 = con.prepareStatement(insertcod);
		        x=st0.executeUpdate();
		        System.out.println("transfer cart to order");
		      
		        String updatecod="UPDATE orderdb SET order_id='"+pmodel.getOrder_id()+"',order_status='Pending' WHERE order_date >='"+adddate+"'AND uid ="+pmodel.getUid()+"";
				java.sql.PreparedStatement st3 = con.prepareStatement(updatecod);
				x=st3.executeUpdate();		
				System.out.println("updated orderID to order");
				
				String deletecart="delete from cart where uid="+pmodel.getUid()+"";
				java.sql.PreparedStatement st4 = con.prepareStatement(deletecart);
				x=st4.executeUpdate();
				System.out.println("delete from cart ");
				
		}
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		return x;
		
		
	}

	public int addCodOrder(Order omodel) throws InterruptedException
	{
		int x=0;
		java.util.Date date = new java.util.Date();
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		System.out.println(ft.format(date));
		String adddate=ft.format(date);
	     Connection con = new DBUtil().getDatabaseConnection();
	     try {
	       
	        String insertcod="INSERT INTO orderdb (uid, pid, size, quantity, price, total)SELECT uid,pid,size,quantity,price,total FROM cart WHERE uid ="+omodel.getUid()+"";
	        java.sql.PreparedStatement st0 = con.prepareStatement(insertcod);
	        x=st0.executeUpdate();
	        System.out.println("transfer cart to order");
	      
	        String updatecod="UPDATE orderdb SET order_id='"+omodel.getOrder_id()+"',order_status='Pending' WHERE order_date >='"+adddate+"'AND uid ="+omodel.getUid()+"";
			java.sql.PreparedStatement st1 = con.prepareStatement(updatecod);
			x=st1.executeUpdate();		
			System.out.println("updated orderID to order");
			
			String addpayment="INSERT INTO payments (order_id,status,uid,amount,payment_mode) VALUES (?,?,?,?,?)";
			java.sql.PreparedStatement st2 = con.prepareStatement(addpayment);
			st2.setString(1, omodel.getOrder_id());				
			st2.setString(2, "UNPAID");
			st2.setInt(3, omodel.getUid());
			st2.setInt(4, omodel.getAmount());
			st2.setString(5, omodel.getPayment_mode());				
			x=st2.executeUpdate();
			System.out.println("insert payment details");
			
			String deletecart="delete from cart where uid="+omodel.getUid()+"";
			java.sql.PreparedStatement st3 = con.prepareStatement(deletecart);
			x=st3.executeUpdate();
			System.out.println("delete from cart ");	
			
			} catch (SQLException e) {
				
				e.printStackTrace();
			}	 
		return x;
	}

	

}
