package com.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.model.Admin;
import com.model.Category;
import com.model.Product;
import com.mysql.jdbc.PreparedStatement;
import com.util.DBUtil;

public class AdminDao 
{
	Connection con=null;
	int x=0;
	public int deletecat(Category cmodel)
	{
		con=new DBUtil().getDatabaseConnection();
		String qry="DELETE FROM category WHERE catid = ?";
		try 
		{
			java.sql.PreparedStatement st=con.prepareStatement(qry);			
			st.setInt(1, cmodel.getId());			
			x=st.executeUpdate();
			con.close();			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return x;
	}
	
	public int deletproduct(Product pmodel)
	{
		con=new DBUtil().getDatabaseConnection();
		String qry="DELETE FROM product WHERE pid = ?";
		try 
		{
			java.sql.PreparedStatement st=con.prepareStatement(qry);			
			st.setInt(1, pmodel.getId());			
			x=st.executeUpdate();
			con.close();			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return x;
	}
	
	public int addcategory(Category cmodel)
	{
		
		con=new DBUtil().getDatabaseConnection();
		String qry="INSERT INTO category (catname,create_at,update_at) VALUES (?,NOW(),NOW())";
		try 
		{
			java.sql.PreparedStatement st=con.prepareStatement(qry);	
			Date date=new Date();
			st.setString(1, cmodel.getCatname());
			
			x=st.executeUpdate();
			con.close();			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return x;
	}
	public int addproduct(Product pmodel)
	{
		
		con=new DBUtil().getDatabaseConnection();
		String qry="INSERT INTO product (`catid`,"
				+ "`product_name`,"
				+ "`product_details`,"
				+ "`product_size`,"
				+ "`product_price`,"
				+ "`discount_price`,"
				
				+ "`images`,"
				+ "`create_at`,"
				+ "`update_at`) values(?,?,?,?,?,?,?,NOW(),NOW())";
				
		try 
		{
			java.sql.PreparedStatement st=con.prepareStatement(qry);	
			
			InputStream is=pmodel.getImage();
			
			st.setInt(1, pmodel.getCatid());
			st.setString(2, pmodel.getProduct_name());
			st.setString(3, pmodel.getProduct_details());
			st.setString(4, pmodel.getProduct_size());
			st.setFloat(5,pmodel.getProduct_price());
			st.setFloat(6,pmodel.getDiscount_price());
			/* st.setInt(7, pmodel.getQuantity()); */
			st.setBlob(7, pmodel.getImage());			
			
			x=st.executeUpdate();
			con.close();			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return x;
	}
	
	public Admin adminLogin(Admin amodel)
	{
		Admin lmodel=null;
		con=new DBUtil().getDatabaseConnection();
		String qry="select * from admin where email=? and password=?";
		try 
		{
			java.sql.PreparedStatement st=con.prepareStatement(qry);
			st.setString(1, amodel.getEmail());
			st.setString(2, amodel.getPassword());
			
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				lmodel=new Admin();
				lmodel.setId(rs.getInt(1));
				lmodel.setFirstname(rs.getString(2));
				lmodel.setLastname(rs.getString(3));
				lmodel.setEmail(rs.getString(4));
				lmodel.setPassword(rs.getString(5));
				//lmodel.setImage(rs.getString(6));
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return lmodel;
	}

	public int updateProfile(Admin amodel) 
	{
		
		con=new DBUtil().getDatabaseConnection();		
		
		String qry="update admin set firstname=?,lastname=?,email=?,password=?,image=? where id=?";
		try 
		{
			java.sql.PreparedStatement st=con.prepareStatement(qry);
			st.setString(1, amodel.getFirstname());
			st.setString(2, amodel.getLastname());
			st.setString(3, amodel.getEmail());
			st.setString(4, amodel.getPassword());
			st.setString(5, null);
			st.setInt(6, amodel.getId());
			x=st.executeUpdate();
			con.close();			
		}
		catch (SQLException e) 
		{		
			e.printStackTrace();
		}
		
		return x;
	}
	
}
