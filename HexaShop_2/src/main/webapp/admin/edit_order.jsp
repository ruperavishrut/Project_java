<html>
  </head>
  <body>
  <%
	response.setHeader("Cache-control", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);

	if (session.getAttribute("admin") == null) {
		response.sendRedirect("../admin/index.jsp");
		session.removeAttribute("admin");
	}
	%>
   <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
      <%@ include file="sidebar.jsp" %> 
        <!-- Layout container -->
        <div class="layout-page">
      <%@ include file="navbar.jsp" %>
          <!-- Content wrapper -->
          <div class="content-wrapper">        
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
            <% String oid = request.getParameter("order_id");
               String action= request.getParameter("edit_order");
               int uid=Integer.parseInt(request.getParameter("uid"));
               if(oid==null && action==null){
            	   response.sendRedirect("../admin/index.jsp");
           		session.removeAttribute("admin");
               }else{
            %>
            
            
                                    <%@page import="com.util.DBUtil"%>
									<%@page import="java.sql.Connection"%>
									<%@page import="java.sql.ResultSet"%>
									<%@page import="java.sql.PreparedStatement"%>
									<%@page import="java.text.SimpleDateFormat"%>
									
									<% try 
									{
										
										/* get order from userid */
										Connection cn = new DBUtil().getDatabaseConnection();
										PreparedStatement st = cn.prepareStatement("SELECT * FROM orderdb WHERE uid="+ uid +" AND order_id='"+oid+"'");
										ResultSet rs = st.executeQuery(); 
										while (rs.next()) 
										{
									%>
										
										
										   
      
      
          <div class="card-body p-5">
       
            <div class="row">
              <div class="col mb-3">
                <p class="small text-muted mb-1">Date</p>
                <p><%=rs.getString("order_date").substring(0, 10)%></p>
              </div>
              <div class="col mb-3">
                <p class="small text-muted mb-1" id="Order_ID">Order ID.</p>
                <p><%=rs.getString("order_id") %></p>
              </div>
            </div>
							
	      <!-- PRODUCT CARD  -->
            <div class="row">
            <!-- Show Product Image -->
              <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">                           														
                  <img src="showpdimage.jsp?id=<%=rs.getInt("pid")%>" class="w-100" />                               
              </div>
              <div class="col-md-6 col-lg-6 col-xl-6">
               <% 
 		try 
		{
 			/* get product name from id */
		
		st = cn.prepareStatement("SELECT `product_name` FROM `product` WHERE pid="+rs.getInt("pid")+"");
		ResultSet rs4 = st.executeQuery(); 
		while (rs4.next()) 
		{
		%>  
				
                <h5><%=rs4.getString("product_name") %></h5> <br>
        <% } 
		}
		catch(Exception e)
		{
		 e.printStackTrace();
		} %>  
              
              
               
                <div class="mt-1 mb-0 text-muted small">
                 
                  
                  <span>Size : <%=rs.getString("size")%></span><br/>
                 
                  <span>Quantity : <%=rs.getString("quantity")%></span><br/>
                  
                  <span>Price : <%=rs.getString("price")%></span><br/>
                   
                  <span>Total Amount : <%=rs.getString("total")%></span><br/>
                  
 		<% 
 		try 
		{
				/* get product detiasl and catid */
		st = cn.prepareStatement("SELECT `product_details`,`catid` FROM `product` WHERE pid="+rs.getInt("pid")+"");
		ResultSet rs1 = st.executeQuery(); 
		while (rs1.next()) 
		{
		%>  
				  
         <% 
 		try 
		{
			/* get category name from catid */
		st = cn.prepareStatement("SELECT `catname` FROM `category` WHERE `catid`="+rs1.getInt("catid")+"");
		ResultSet rs2 = st.executeQuery(); 
		while (rs2.next()) 
		{
		%>  
				
                  <span>Category : <%=rs2.getString("catname")%></span>
                </div> 
        <% } 
		}
		catch(Exception e)
		{
		 e.printStackTrace();
		} %>     
                
                            
                
                <br><p class="text">
                  Product Details : <%=rs1.getString("product_details")%>
                </p>
		<% } 
		}
		catch(Exception e)
		{
		 e.printStackTrace();
		} %>  
		    <%String t=rs.getString("order_status");          
              if(t.equals("Pending")){ %> 
              <br>Order Status : <span class="badge badge-primary"><%=t%></span>
              <%} %>
              <% if(t.equals("On The Way")){ %>
              <br><div>Order Status : <span class="badge badge-warning"><%=t%></span></div>
               <%} %>
              <% if(t.equals("Delivered")){%>
              <br><div>Order Status : <span class="badge badge-success"><%=t%></span></div>
              <%} %> 
		 
             
    <form method="post" action="../AdminController">  
    <br>
    <select name="update_order_status" id="update_order_status" class="form-select">
        <option value="#" disabled selected>Select Order Status</option> 
        <option value="Pending">Pending</option>       
        <option value="On The Way">On The Way</option>
        <option value="Delivered">Delivered</option>
        <option value="Cancel">Cancel</option>
        
    </select> 
    <input type="hidden" name="uid" value="<%=uid%>">
    <input type="hidden" name="oid" value="<%=oid%>">
     <br><button type="submit" class="btn btn-outline-primary" name="action" value="order_status_change">Save Changes</button>
    </form>       
              
               
              
                
                                 
              </div>
              
              
             
                         
            </div>
        <!-- PRODUCT CARD  -->          			        
          </div> <!-- card body -->
         						        																		
									<% } 
									}
									catch(Exception e)
									{
									  e.printStackTrace();
									} %>
			
			  <div class="card-body p-5">   
			  <% try 
					{
										
					/* get payments details from userid and order ID */
			        Connection cn = new DBUtil().getDatabaseConnection();
					PreparedStatement st1 = cn.prepareStatement("SELECT * FROM payments WHERE uid="+ uid +" AND order_id='"+oid+"'");
					ResultSet p = st1.executeQuery(); 
					while (p.next()) 
					{
					%>  									     
		<div class=" payment-summary">
            <p class="fw-bold pt-lg-0 pt-4 pb-2">Payment Summary</p>
            <div class="card px-md-3 px-2 pt-4">              
                <div class="d-flex flex-column b-bottom">
                <%if(p.getString("payment_id")==null){}else{%>
                 <div class="d-flex justify-content-between py-3"> <small class="text-muted">Payment ID</small>
                        <p><%=p.getString("payment_id")%></p>
                 </div>
                <%}%>
                    <div class="d-flex justify-content-between py-3"> <small class="text-muted">Payment Status</small>
                        <p><%=p.getString("status")%></p>
                    </div>
                    <div class="d-flex justify-content-between pb-3"> <small class="text-muted">Payment Mode</small>
                        <p><%=p.getString("payment_mode")%></p>
                    </div>
                    <div class="d-flex justify-content-between"> <small class="text-muted">Total Amount</small>
                        <p><i class="fa-solid fa-indian-rupee-sign"></i> <%=p.getString("amount")%></p>
                    </div>
                </div>              
            </div>
        </div> 														
                 <% } 
				     }
				     catch(Exception e)
				    {
				       e.printStackTrace();
				     } %>  
           
            
              
              
              
              
              
              
              
              
            </div>
            <!-- / Content -->
       
          </div>
          <!-- Content wrapper -->
          <%@include file="footer.jsp" %><%} %>
        </div>
        <!-- / Layout page -->
      </div>      
      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->
  </body>
</html>
