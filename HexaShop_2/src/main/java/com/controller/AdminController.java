package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import com.dao.AdminDao;
import com.dao.OrderDao;
import com.model.Admin;
import com.model.Category;
import com.model.Order;
import com.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/AdminController")
@MultipartConfig(maxFileSize = 16177216)// 1.5MB
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public AdminController() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("deletecat"))
		{
				int id=Integer.parseInt(request.getParameter("cat_id"));
				Category cmodel=new Category();
				cmodel.setId(id);
			
				int x=new AdminDao().deletecat(cmodel);
				if(x>0)
				{
					response.sendRedirect("admin/viewproduct.jsp");
				}
				else
				{
					response.sendRedirect("admin/error.jsp");
				}					
		}
		if(action.equalsIgnoreCase("deleteproduct"))
		{
				int id=Integer.parseInt(request.getParameter("pid"));
				Product pmodel=new Product();
				pmodel.setId(id);
			
				int x=new AdminDao().deletproduct(pmodel);
				if(x>0)
				{
					response.sendRedirect("admin/viewproduct.jsp");
				}
				else
				{
					HttpSession session=request.getSession(true);
					session.setAttribute("pd","true");
					response.sendRedirect("admin/viewproduct.jsp");
				}					
		}
		
		if(action.equalsIgnoreCase("logout"))
		{		
			request.getSession(false).invalidate();		
			System.out.println("Admin Session Logout successfully ");				
			response.sendRedirect("admin/");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("admin_login"))
		{
							
			Admin amodel=new Admin();
			amodel.setEmail(request.getParameter("email"));
			amodel.setPassword(request.getParameter("password"));
			
			Admin model=new AdminDao().adminLogin(amodel);
			
			if(model != null)
			{
				request.getSession(false).invalidate();
				HttpSession session=request.getSession(true);
				session.setAttribute("firstname", model.getFirstname());
				session.setAttribute("lastname", model.getLastname());
				session.setAttribute("email", model.getEmail());
				session.setAttribute("password", model.getPassword());
				session.setAttribute("id", model.getId());
				session.setAttribute("admin", "done");
				System.out.println("Admin Session Login successfully ");
				response.sendRedirect("admin/dashboard.jsp");
			}
			else
			{
				response.sendRedirect("admin/error.jsp");
			}			
		}	
		
		if(action.equalsIgnoreCase("update_profile"))
		{
						
			Admin amodel=new Admin();
			
			amodel.setId(Integer.parseInt(request.getParameter("id")));
			amodel.setFirstname(request.getParameter("firstname"));
			amodel.setLastname(request.getParameter("lastname"));
			amodel.setEmail(request.getParameter("email"));
			amodel.setPassword(request.getParameter("password"));
			amodel.setImage(null);
			
			int x=new AdminDao().updateProfile(amodel);
			
			if(x>0)
			{
				HttpSession session=request.getSession(true);
				session.setAttribute("firstname", amodel.getFirstname());
				session.setAttribute("lastname", amodel.getLastname());
				session.setAttribute("email", amodel.getEmail());
				session.setAttribute("password", amodel.getPassword());
				session.setAttribute("id", amodel.getId());
				System.out.println("admin profile updated successfully..");
				response.sendRedirect("admin/admin_profile.jsp");
			}
			else
			{
				response.sendRedirect("admin/error.jsp");
			}			
		}
		
		if(action.equalsIgnoreCase("addcategory"))
		{
			String catname=request.getParameter("catname");
			
			Category cmodel=new Category();
			cmodel.setCatname(catname);
			
			int x=new AdminDao().addcategory(cmodel);
			
			if(x>0)
			{
				response.sendRedirect("admin/viewproduct.jsp");
			}
			else
			{
				response.sendRedirect("admin/error.jsp");
			}				
		}
		if(action.equalsIgnoreCase("addproduct"))
		{
			int catid=Integer.parseInt(request.getParameter("catid"));
			String pdname=request.getParameter("pdname");
			String pddetail=request.getParameter("pddetail");
			String pdsize=request.getParameter("pdsize");
			Float pdprice=Float.parseFloat(request.getParameter("pdprice"));
			Float pddisprice=Float.parseFloat(request.getParameter("pddiscountprice"));
			//int pdquantity=Integer.parseInt(request.getParameter("pdquantity"));			
					
			Product pmodel=new Product();
			
			pmodel.setCatid(catid);
			pmodel.setProduct_name(pdname);
			pmodel.setProduct_details(pddetail);
			pmodel.setProduct_size(pdsize);
			pmodel.setProduct_price(pdprice);
			pmodel.setDiscount_price(pddisprice);
			//pmodel.setQuantity(pdquantity);
			
			Part part=request.getPart("pdimage");
			if(part!=null)
			 {
				 InputStream is=part.getInputStream();
				 pmodel.setImage(is);
			 }
			
						
			
			int x=new AdminDao().addproduct(pmodel);
			
			if(x>0)
			{
				response.sendRedirect("admin/viewproduct.jsp");
			}
			else
			{
				response.sendRedirect("admin/error.jsp");
			}			
		}
		
		
		if(action.equalsIgnoreCase("order_status_change"))
		{
			String oid=request.getParameter("oid");
			int uid=Integer.parseInt(request.getParameter("uid"));
			String status=request.getParameter("update_order_status");
			
			Order omodel=new Order();
			omodel.setOrder_status(status);
			omodel.setUid(uid);
			omodel.setOrder_id(oid);
			
			int x=new OrderDao().editOrderStatus(omodel);
			
			if(x>0)
			{
				response.sendRedirect("admin/order_history.jsp");
			}
			else
			{
				response.sendRedirect("admin/error.jsp");
			}				
		}
		
		
		
	}
}
