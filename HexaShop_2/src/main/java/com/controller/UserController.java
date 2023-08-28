package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Base64;

import javax.persistence.metamodel.SetAttribute;

import com.dao.AdminDao;
import com.dao.CartDao;
import com.dao.UserDao;
import com.model.Admin;
import com.model.Cart;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/UserController")

@MultipartConfig(maxFileSize = 16177216) // 1.5MB

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("user_logout")) 
		{
			int id =Integer.parseInt(request.getParameter("id"));
			int x=new UserDao().user_logout(id);
			if(x>0)
			{
				request.getSession(false).invalidate();												
				
				response.sendRedirect("index.jsp");
				System.out.println("User Session Logout successfully ");
			}
			
		}
		if (action.equalsIgnoreCase("product_remove")) 
		{
			Cart cmodel=new Cart();
			
			cmodel.setUid(Integer.parseInt(request.getParameter("uid")));
			cmodel.setPid(Integer.parseInt(request.getParameter("pid")));
			
			int x=new CartDao().Product_Remove(cmodel);
			if(x>0)
			{																			
				response.sendRedirect("user/viewcart.jsp?uid="+cmodel.getUid()+"");				
			}
			
		}
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("user-register")) {
			User rmodel = new User();
			rmodel.setFirstname(request.getParameter("firstname"));
			rmodel.setLastname(request.getParameter("lastname"));
			rmodel.setGender(request.getParameter("gender"));
			rmodel.setState(request.getParameter("state"));
			rmodel.setCity(request.getParameter("city"));
			rmodel.setAddress(request.getParameter("address"));
			rmodel.setPincode(Integer.parseInt(request.getParameter("pincode")));
			rmodel.setMobileno(request.getParameter("mobileno"));
			rmodel.setEmail(request.getParameter("email"));
			rmodel.setPassword(request.getParameter("password"));
			
			

			Part part = request.getPart("image");
			if (part != null) {
				InputStream is = part.getInputStream();
				rmodel.setImage(is);
			}

			int x = new UserDao().user_register(rmodel);

			if (x > 0) {
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}
		}

		if(action.equalsIgnoreCase("user_login")) 
		{

			User amodel = new User();
			amodel.setEmail(request.getParameter("email"));
			amodel.setPassword(request.getParameter("password"));

			User model = new UserDao().user_login(amodel);

			if (model != null) {
				// request.getSession(false).invalidate();
				HttpSession session = request.getSession(true);
				session.setAttribute("firstname", model.getFirstname());
				session.setAttribute("lastname", model.getLastname());
				session.setAttribute("emsil", model.getEmail());
				session.setAttribute("password", model.getPassword());
				session.setAttribute("id", model.getId());				
				System.out.println("User Session Login successfully ");
				
				session.setAttribute("login", "true");
				
				
				response.sendRedirect("user/user-dash.jsp");
				
			} else {
				response.sendRedirect("error.jsp");
			}
		}
		
		if(action.equalsIgnoreCase("user_update")) 
		{

			User rmodel = new User();
			
			rmodel.setId(Integer.parseInt(request.getParameter("id")));
			System.out.println(rmodel.getId());
			rmodel.setFirstname(request.getParameter("firstname"));
			rmodel.setLastname(request.getParameter("lastname"));
			rmodel.setGender(request.getParameter("gender"));
			rmodel.setState(request.getParameter("state"));
			rmodel.setCity(request.getParameter("city"));
			rmodel.setAddress(request.getParameter("address"));
			rmodel.setPincode(Integer.parseInt(request.getParameter("pincode")));
			rmodel.setMobileno(request.getParameter("mobileno"));
			rmodel.setEmail(request.getParameter("email"));
			rmodel.setPassword(request.getParameter("password"));

			Part part = request.getPart("image");
			if (part != null) {
				InputStream is = part.getInputStream();
				rmodel.setImage(is);
			}

			int x = new UserDao().user_update(rmodel);

			if (x > 0) 
			{
				HttpSession session = request.getSession(true);
				session.setAttribute("firstname", rmodel.getFirstname());
				session.setAttribute("lastname", rmodel.getLastname());
				session.setAttribute("emsil", rmodel.getEmail());
				session.setAttribute("password", rmodel.getPassword());
				session.setAttribute("id", rmodel.getId());
				System.out.println("user profile updated successfully...");
				response.sendRedirect("user/user-dash.jsp");
			} else {
				response.sendRedirect("/user/error.jsp");
			}
		}
		
		if (action.equalsIgnoreCase("addcart")) 
		{
			Cart cmodel=new Cart();
			cmodel.setPid(Integer.parseInt(request.getParameter("pid")));
			cmodel.setUid(Integer.parseInt(request.getParameter("uid")));
			cmodel.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			cmodel.setSize(request.getParameter("size"));			
			cmodel.setPrice(Float.parseFloat(request.getParameter("price")));
						
			System.out.println("add to cart success...");
			
			int x=new CartDao().addcart(cmodel);
			
			if(x==0)
			{				
				response.sendRedirect("/user/error.jsp");			
			}			
			else if(x==2)
			{				
				response.sendRedirect("user/products.jsp");
			}
			else if(x==1)
			{
				response.sendRedirect("user/viewcart.jsp?uid="+cmodel.getUid());
			}
		
		
		}
		
		if (action.equalsIgnoreCase("+")) 
		{	
			
			
			Cart cmodel=new Cart();
			
			cmodel.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			cmodel.setPid(Integer.parseInt(request.getParameter("pid")));
			cmodel.setUid(Integer.parseInt(request.getParameter("uid")));
			cmodel.setPrice(Float.parseFloat(request.getParameter("price")));
			
			int x = new CartDao().pd_increase(cmodel);

			if (x > 0) 
			{				
				System.out.println("product quantity Increase successfully...");
				
				/*
				 * String str=String.valueOf(); byte[]
				 * encrypt=Base64.getEncoder().encode(str.getBytes()); System.out.println(new
				 * String(encrypt));
				 */
				response.sendRedirect("user/viewcart.jsp?uid="+cmodel.getUid()+"");
				
			} else {
				response.sendRedirect("/user/error.jsp");
			}
		
		}
		if (action.equalsIgnoreCase("-")) 
		{					
			Cart cmodel=new Cart();
			
			cmodel.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			cmodel.setPid(Integer.parseInt(request.getParameter("pid")));
			cmodel.setUid(Integer.parseInt(request.getParameter("uid")));
			cmodel.setPrice(Float.parseFloat(request.getParameter("price")));
			int x = new CartDao().pd_decrease(cmodel);

			if (x > 0) 
			{				
				System.out.println("product quantity Decrease successfully...");
				response.sendRedirect("user/viewcart.jsp?uid="+cmodel.getUid()+"");
			} else {
				response.sendRedirect("/user/error.jsp");
			}
		}
		
	
	}

}
