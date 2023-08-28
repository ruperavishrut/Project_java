package com.controller;

import java.io.IOException;

import org.json.JSONObject;

import com.dao.PaymentDao;
import com.model.payments;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/OrderCreation")
public class OrderCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public OrderCreation() {
        super();
        
    }
    int uid=0;
   String amount=null;
	


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 RazorpayClient client=null;
		 String orderId=null;
		 
		try {
			client=new RazorpayClient("rzp_test_uW7BnP2J8uR74y","E8xGytCTtPfGV1ndLCntavV0");
			
			amount=request.getParameter("amount");
			uid=Integer.parseInt(request.getParameter("uid"));
		 
			Integer digit=new Integer(Integer.parseInt(amount)*100);
			
			JSONObject options=new JSONObject();
			options.put("amount", digit.toString());
			options.put("currency", "INR");
			options.put("receipt", "zxr456");
			options.put("payment_capture", true);
			Order order=client.Orders.create(options);
			orderId=order.get("id");
			
			System.out.println("order id created..");
			System.out.println(orderId);
			System.out.println(amount+" "+uid);
			
			response.getWriter().append(orderId); 
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("cod_order")) 
		{
			com.model.Order omodel=new com.model.Order();
			omodel.setUid(Integer.parseInt(request.getParameter("uid")));
			omodel.setPayment_mode("CASH ON DELIVERY");
			omodel.setOrder_id(request.getParameter("order_id"));
			omodel.setAmount(Integer.parseInt(request.getParameter("amount")));
			
			System.out.println(omodel.getOrder_id());
			
			try 
			{
				int x=new PaymentDao().addCodOrder(omodel);
				
				if(x>0)
				{					
						
						jakarta.servlet.http.HttpSession session = request.getSession(true);
						session.setAttribute("codcheckout","done");
						response.sendRedirect("user/viewcart.jsp?uid="+uid);										
				}
				else
				{
					response.sendRedirect("/user/error.jsp");
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RazorpayClient client=null; 
		try {
			client=new RazorpayClient("rzp_test_uW7BnP2J8uR74y","E8xGytCTtPfGV1ndLCntavV0");
			JSONObject options=new JSONObject();
			options.put("razorpay_payment_id",request.getParameter("razorpay_payment_id"));
			options.put("razorpay_order_id",request.getParameter("razorpay_order_id"));
			options.put("razorpay_signature",request.getParameter("razorpay_signature"));
			
			String payment_id=request.getParameter("razorpay_payment_id");
			String order_id=request.getParameter("razorpay_order_id");
			String signature=request.getParameter("razorpay_signature");
			
			
			//System.out.println(payment_id);
			System.out.println(order_id);
			//System.out.println(signature);
			System.out.println(options);
					
			//boolean SigRes=Utils.verifyPaymentSignature(options,"Secret");
			
			if(order_id==options.getString("razorpay_order_id"))
			{
				/*
				 * System.out.println("payment succesfully.."); //Thread.sleep(5000);
				 * jakarta.servlet.http.HttpSession session = request.getSession(true);
				 * session.setAttribute("checkout","done");
				 * response.sendRedirect("user/viewcart.jsp?uid="+uid);
				 */
				
				payments pmodel=new payments();
				pmodel.setUid(uid);
				pmodel.setAmount(Integer.parseInt(amount));
				pmodel.setOrder_id(order_id);
				pmodel.setPayment_id(payment_id);
				pmodel.setPayment_signature(signature);
				pmodel.setStatus("PAID");
				pmodel.setPayment_mode("ONLINE");
				
				
				
				
				try 
				{
					int x=new PaymentDao().addOrder(pmodel);
					if(x>0)
					{
						System.out.println("payment succesfully..");
						//Thread.sleep(5000);
						jakarta.servlet.http.HttpSession session = request.getSession(true);
						session.setAttribute("checkout","done");
						response.sendRedirect("user/viewcart.jsp?uid="+uid);
					}
					else
					{
						response.sendRedirect("/user/error.jsp");
					}
					
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				
			}
			else
			{
				response.sendRedirect("/user/error.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
