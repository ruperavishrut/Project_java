<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet" />

<title>🛒 View Cart</title>

<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css"
	href="../assets/css/font-awesome.css" />

<link rel="stylesheet" href="../assets/css/templatemo-hexashop.css" />

<link rel="stylesheet" href="../assets/css/owl-carousel.css" />

<link rel="stylesheet" href="../assets/css/lightbox.css" />

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>



</head>
<body>
	<%@ include file="header.jsp"%>
	<% 
	response.setHeader("Cache-control", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);

	
	if (session.getAttribute("login") == null) {
		response.sendRedirect("../index.jsp");
	}
	
	%>
	
	<%if (session.getAttribute("checkout") == "done") 
	{%>
	<script>
		Swal.fire
		(
		  'Thank You For Your Order',		  
		  'Payment Successfully',
		  'success'		 
		)
	</script>
	
	<%}
	session.removeAttribute("checkout");
	%>
	
	<%if (session.getAttribute("codcheckout") == "done") 
	{%>
	<script>
		Swal.fire
		(
		  'Thank You For Your Order',
		  'Order Confirmed',
		  'success'		 
		)
	</script>
	
	<%}
	session.removeAttribute("codcheckout");
	%>




	<!-- ***** Main Banner Area Start ***** -->
	<div class="main-banner">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col">
							<div class="col">
								<h4 class="fw-bold mb-3">
									<span class="text-muted fw-light">Account / </span>View Cart
								</h4>
							</div>
							<div class="card mb-4">
								
									<h5 class="card-header">Cart Details</h5>

									<!-- Account -->
									<%! public int quantity,pid;
									    public String price;;
									   	
									%>
									<% String id = request.getParameter("uid");
									   session.setAttribute("uuid",id);									
									%>
									<%@page import="com.util.DBUtil"%>
									<%@page import="java.sql.Connection"%>
									<%@page import="java.sql.ResultSet"%>
									<%@page import="java.sql.PreparedStatement"%>
									
									
									<%
									try {

										Connection cn = new DBUtil().getDatabaseConnection();
										PreparedStatement st = cn
										.prepareStatement("SELECT * FROM product WHERE pid IN (SELECT pid FROM cart WHERE uid=" + id + ")");
										ResultSet rs = st.executeQuery();

										while (rs.next()) {
									%>
									<% pid=rs.getInt("pid");%>


									<div class="card mb-4 mt-4"> 
										<div class="card-body p-4">
					<div class="float-right">
					<a href="../UserController?action=product_remove&uid=<%=id%>&pid=<%=pid%>"><i class="fa-solid fa-trash-can"></i></a>
					</div>
											<div class="row align-items-center">
												<div class="col-md-2">

													<img src="showpdimage.jsp?id=<%=rs.getInt("pid")%>"
														class="img-fluid" alt="Generic placeholder image">
												</div>
												<div class="col-md-2 d-flex justify-content-center">
													<div>

														<%
														try {
															int cat_id = rs.getInt("catid");
															Connection ccn = new DBUtil().getDatabaseConnection();
															PreparedStatement pst = ccn.prepareStatement(
															"SELECT catname FROM category WHERE catid IN (SELECT catid FROM cart WHERE catid=" + cat_id + ")");
															ResultSet rrs = pst.executeQuery();

															while (rrs.next()) {
														%>
														<p class="small text-muted mb-4 pb-2"><%=rrs.getString("catname")%>
														</p>
														<%
														}

														} catch (Exception e) {
														e.printStackTrace();
														}
														%>

														<%--  <%=rs.getInt("catid") %> --%>


														<p class="lead fw-normal mb-0"><%=rs.getString("product_name")%></p>
													</div>
												</div>


												<div class="col-md-2 d-flex justify-content-center">
													<div>
														<p class="small text-muted mb-4 pb-2">Price</p>
														<strike><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs.getString("product_price")%></strike>
														<p class="lead fw-normal mb-0">
															<i class="fa-solid fa-indian-rupee-sign"></i>
															<%=rs.getString("discount_price")%>
															<% price=rs.getString("discount_price"); %>
															</p>
													</div>
												</div>

												<div class="col-md-2 d-flex justify-content-center">
													<div>
														<p class="small text-muted mb-4 pb-2">Size</p>
														<p class="lead">
															<%
															try {

																Connection ccn = new DBUtil().getDatabaseConnection();
																PreparedStatement pst = ccn
																.prepareStatement(" SELECT size FROM cart WHERE uid=" + id + " AND pid=" + rs.getInt("pid") + "");
																ResultSet rrs = pst.executeQuery();
																
																while (rrs.next()) {
															%>
																<%=rrs.getString("size") %>
															
														
														
														<%
														}

														} catch (Exception e) {
														e.printStackTrace();
														}
														%>
														</p>

													</div>
												</div>


												<div class="col-md-2 d-flex justify-content-center">
													<div>
														<p class="small text-muted mb-4 pb-2">Quantity</p>

														<p class="lead fw-normal mb-0">


															<%
															try {

																Connection ccn = new DBUtil().getDatabaseConnection();
																PreparedStatement pst = ccn
																.prepareStatement(" SELECT quantity FROM cart WHERE uid=" + id + " AND pid=" + rs.getInt("pid") + "");
																ResultSet rrs = pst.executeQuery();
																
																while (rrs.next()) {
															%>

															<%
															quantity = rrs.getInt("quantity");
															%>
															
														<form method="post"  action="../UserController">
														<div class="right-content">
															<div class="quantity buttons_added">
																<input type="submit" value="-" class="minus" name="action" >
																
																<input
																	type="number" step="1" min="1" max="10" name="quantity" 
																	value="<%=quantity%>" class="input-text qty text" 
																	size="4" readonly>
																<input type="hidden" name="pid" value="<%=pid%>">
																<input type="hidden" name="uid" value="<%=id%>">
																<input type="hidden" name="price" value="<%=price%>">
																<input type="submit" value="+" class="plus" name="action" >
																
															</div>
														</div>
														</form>
														<%
														}

														} catch (Exception e) {
														e.printStackTrace();
														}
														%>


														</p>

													</div>
												</div>
												


												<div class="col-md-2 d-flex justify-content-center">
													<div>
														<p class="small text-muted mb-4 pb-2">Total Price</p>

														<p class="lead fw-normal mb-0" id="price" >

															
<%
															try {

																Connection ccn = new DBUtil().getDatabaseConnection();
																PreparedStatement pst = ccn
																.prepareStatement(" SELECT total FROM cart WHERE uid=" + id + " AND pid=" + rs.getInt("pid") + "");
																ResultSet rrs = pst.executeQuery();
																
																while (rrs.next()) {
															%>
																<%=rrs.getInt("total") %>															
														<%
														}

														} catch (Exception e) {
														e.printStackTrace();
														}
														%>
	
														</p>
													</div>
													
												</div>



											</div>
										
										</div>
										
									</div>
								
								

							<%
							}

							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
							
						</div>
						
						<span class="float-left">Total Amount: </span>
						<span class="float-right">
						<i class="fa-solid fa-indian-rupee-sign">
						
						 <% try {

							Connection ccn = new DBUtil().getDatabaseConnection();
							PreparedStatement pst = ccn.prepareStatement("SELECT sum(total) FROM cart WHERE uid="+id+"");
							ResultSet rrs = pst.executeQuery();
							
																
							while (rrs.next()) 
							{								
								int sum=rrs.getInt(1);																								
								//out.println(sum);
								session.setAttribute("total",sum);
								int total=(Integer)session.getAttribute("total");
								out.println(total);
								
							}

							} catch (Exception e) 
						    {
									e.printStackTrace();
							}
							%> 
						</i>
						</span>
						<br><br><br>
						
						<a href="products.jsp">
						<button type="button"
								class="btn btn-outline-info ">
								<i class="fa-solid fa-cart-shopping"></i> Continue Shopping
						</button>
						</a>
												
						<%
						int check=(Integer)session.getAttribute("total");
						if(check > 0)
						 {%>					
						<a href="#">
						<button type="button"
								class="btn btn-outline-success float-right" id="myBtn">
								<i class="fa-solid fa-bag-shopping"></i> Checkout
						</button>
						</a> 
						<%} %>
						
			

	<!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="CheckOut" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Checkout</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">           
      
      <div class="container">
       <div class="row">      
              
    <div class="col">
      <h4 class="mb-3">Shipping Details</h4>
      <form action="getpayment.jsp" method="post">
        <div class="row">
          <div class="col-md-6 mb-3">
            
            <%@page import="com.util.DBUtil"%>
									<%@page import="java.sql.Connection"%>
									<%@page import="java.sql.ResultSet"%>
									<%@page import="java.sql.PreparedStatement"%>
									<%
									try {

										Connection cn = new DBUtil().getDatabaseConnection();
										PreparedStatement st = cn.prepareStatement("select * from user where uid=" + id);
										ResultSet rs = st.executeQuery();

										while (rs.next()) {
									%>
			<label for="firstName">First name</label>
            <input type="text" class="form-control" value="<%=rs.getString("firstname")%>" readonly>
            <!-- <div class="invalid-feedback">
              Valid first name is required.
            </div> -->
          </div>
          <div class="col-md-6 mb-3">
            <label for="lastName">Last name</label>
            <input type="text" class="form-control" value="<%=rs.getString("lastname")%>" readonly>
            <!-- <div class="invalid-feedback">
              Valid last name is required.
            </div> -->
          </div>
        </div>
        
        
		<div class="row">
        <div class="col-md-6 mb-3">
          <label for="username">Mobile No</label>
          <div class="input-group">
            <input type="text" class="form-control" value="<%=rs.getString("mobileno")%>" readonly>
          </div>
        </div>

        <div class="col-md-6 mb-3">
          <label for="email">Email</label>
          <input type="text" class="form-control" value="<%=rs.getString("email")%>" readonly>         
        </div>        
		</div>
		
		
        <div class="mb-3">
          <label for="address">Address</label>
          <input type="text" class="form-control" value="<%=rs.getString("address")%>" readonly>         
        </div>

        

        <div class="row">
        
          <div class="col-md-5 mb-3">
            <label for="country">City</label>
            <input type="text" class="form-control" value="<%=rs.getString("city")%>" readonly>            
          </div>
          
          <div class="col-md-4 mb-3">
            <label for="state">State</label>
             <input type="text" class="form-control" value="<%=rs.getString("state")%>" readonly>           
          </div>
          
          <div class="col-md-3 mb-3">
            <label for="zip">Zip</label>
            <input type="text" class="form-control" value="<%=rs.getString("pincode")%>" readonly>           
          </div>
          
        </div>
       <%
										}

										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
        
        <hr class="mb-4">
        
          
          <label>Change Shipping Details Click<a href="user_profile.jsp?uid=<%=session.getAttribute("id")%>"> Profile</a></label>
        
        
        <hr class="mb-4">

        <hr class="mb-4">
        
       <button class="btn btn-primary btn-lg btn-block" id="checkout_2" >Continue to checkout</button>
       
      </form>
     <!-- OPEN IN NEW TAB <a href="getpayment.jsp" target="_blank"><button class="btn btn-primary btn-lg btn-block" id="checkout_2" >Continue to checkout</button></a> -->
    </div>
    </div>
    
<script>

$(document).ready(function(){
    $("#checkout_2").click(function(){   	
	$('#CheckOut').modal('hide'); //hide modal name	
	
	
  });
});


</script>
                        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancel_checkout">Cancel</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>

      
                             
    </div>
  </div>
</div>					
			</div> <!-- end address modal -->
			
			
							
					</div>
				</div>
			</div>
		</div>
	</div>
	

		
	<%@ include file="footer.jsp"%>
<script type="text/javascript">
var btn = document.getElementById("myBtn");

	btn.onclick = function()
	{
		$('#CheckOut').modal('show');
	}
	
	
	</script>
	
	<script src="https://kit.fontawesome.com/050cf20804.js">
	<!-- jQuery -->
		//<script src="../assets/js/jquery-2.1.0.min.js">
	</script>
	
		

	<!-- Bootstrap -->
	<script src="../assets/js/popper.js"></script>
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
	<script src="../assets/js/quantity.js"></script>

	<!-- Global Init -->
	<script src="assets/js/custom.js"></script>


</body>
</html>