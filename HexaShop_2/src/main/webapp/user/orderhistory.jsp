<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javassist.expr.Cast"%>
<%@page import="javax.persistence.Convert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@media (max-width: 767.98px) { .border-sm-start-none { border-left: none !important; } }
</style>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link
      href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
      rel="stylesheet"
    />

    <title>📦Order History</title>

    <!-- Additional CSS Files -->
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/css/bootstrap.min.css"
    />

    <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css" />

    <link rel="stylesheet" href="../assets/css/templatemo-hexashop.css" />

    <link rel="stylesheet" href="../assets/css/owl-carousel.css" />

    <link rel="stylesheet" href="../assets/css/lightbox.css" />
    
    <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 
  </head>
<body>
	<%@ include file="header.jsp" %>
	<%	
	response.setHeader("Cache-control", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	
	if (session.getAttribute("login") == null) {
		response.sendRedirect("../index.jsp");
	} 
	%>
	
	<%if (session.getAttribute("cancelorder") == "done") 
	{%>
	<script>
		Swal.fire
		(
		  'Order Cancelled',
		  '',
		  'success'		 
		)
	</script>
	
	<%}
	session.removeAttribute("cancelorder");
	%>
	
		
	<div class="main-banner">
		<div class="container">
							<div class="col">
								<h4 class="fw-bold mb-4">
									<span class="text-muted fw-light">Account / </span>Order History
								</h4>
							</div>
							<div class="card ">								
							<h5 class="card-header">Order History</h5> 
							</div>
				<!-- <image src="https://em-content.zobj.net/source/telegram/358/shopping-cart_1f6d2.webp"></image> -->
									<%@page import="com.util.DBUtil"%>
									<%@page import="java.sql.Connection"%>
									<%@page import="java.sql.ResultSet"%>
									<%@page import="java.sql.PreparedStatement"%>
									<%@page import="java.text.SimpleDateFormat"%>
									
									<% int id =(Integer)session.getAttribute("id");	
									
									//StringBuilder date = new StringBuilder();
									   
								       
								       
								       
									
									try 
									{
										/* get order from userid */
										Connection cn = new DBUtil().getDatabaseConnection();
										PreparedStatement st = cn.prepareStatement("SELECT * FROM orderdb WHERE uid="+ id +"");
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
                 
                  <span class="text-primary"> • </span>
                  <span>Size : <%=rs.getString("size")%></span><br/>
                  <span class="text-primary"> • </span>
                  <span>Quantity : <%=rs.getString("quantity")%></span><br/>
                  <span class="text-primary"> • </span>
                  <span>Price : <%=rs.getString("price")%></span><br/>
                  
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
				<span class="text-primary"> • </span>
                  <span>Category : <%=rs2.getString("catname")%></span>
                </div> 
        <% } 
		}
		catch(Exception e)
		{
		 e.printStackTrace();
		} %>     
                
                            
                
                <br><p class="text">
                  Product Details : <%=rs1.getString("product_details") %>
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
              <% if(t.equals("Cancel")){%>
              <br><div>Order Status : <span class="badge badge-danger"><%=t%></span></div>
              <%} %>    
                                 
              </div>
              
              <!-- price -->
              <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
              
                <div class="d-flex flex-row align-items-center mb-1">
                  <h4 class="mb-1 me-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs.getString("total") %></h4>                  
                </div>
                
                <h6 class="text-success">Free shipping</h6>
                
                <div class="d-flex flex-column mt-4">
                
                <% if(t.equals("Delivered")){%> 
                 <a href="order_Deatails.jsp?action=order_details&orderid=<%=rs.getString("order_id")%>" class="btn btn-outline-primary btn-md mt-2">Order Details</a>
                <%}else if(t.equals("Cancel")){ %>                
                  <button class="btn btn-danger">Cancelled Order</button>
                <%}else{ %>
                  <a href="order_Deatails.jsp?action=order_details&orderid=<%=rs.getString("order_id")%>" class="btn btn-outline-primary btn-md mt-2" >Order Details</a>
                  <a href="../OrderCancel?action=cancel_order&orderid=<%=rs.getString("order_id")%>&uid=<%=id %>" class="btn btn-outline-danger btn-md mt-2"> Cancel Order</a>
                <%} %> 
                   
                </div>
                
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
				
  

				
				
			</div> <!-- container -->
		</div> <!-- main banner -->
		
	
	
	
	
	
	<%@ include file="footer.jsp" %>
	
	<script src="https://kit.fontawesome.com/050cf20804.js"></script>
	<!-- jQuery -->
    <script src="../assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="a../ssets/js/popper.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="../assets/js/owl-carousel.js"></script>
    <script src="../assets/js/accordions.js"></script>
    <script src="../assets/js/datepicker.js"></script>
    <script src="../assets/js/scrollreveal.min.js"></script>
    <script src="../assets/js/waypoints.min.js"></script>
    <script src="../assets/js/jquery.counterup.min.js"></script>
    <script src="../assets/js/imgfix.min.js"></script>
    <script src="../assets/js/slick.js"></script>
    <script src="../assets/js/lightbox.js"></script>
    <script src="../assets/js/isotope.js"></script>

    <!-- Global Init -->
    <script src="../assets/js/custom.js"></script>

    
</body>
</html>