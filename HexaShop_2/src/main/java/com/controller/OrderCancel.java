package com.controller;

import java.io.IOException;

import com.dao.OrderDao;
import com.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/OrderCancel")
public class OrderCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public OrderCancel() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("cancel_order"))
		{
			String oid=request.getParameter("orderid");
			String uid=request.getParameter("uid");
			
			Order omodel=new Order();
			omodel.setUid(Integer.parseInt(uid));
			omodel.setOrder_id(oid);
			
			int x=new OrderDao().Cancel_Order(omodel);
			if(x>0)
			{
				jakarta.servlet.http.HttpSession session = request.getSession(true);
				session.setAttribute("cancelorder","done");
				response.sendRedirect("user/orderhistory.jsp");
			}
			else
			{
				response.sendRedirect("/user/error.jsp");
			}
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

}
