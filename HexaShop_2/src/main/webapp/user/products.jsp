<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<title>Product</title>


<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="../assets/css/font-awesome.css">

<link rel="stylesheet" href="../assets/css/templatemo-hexashop.css">

<link rel="stylesheet" href="../assets/css/owl-carousel.css">

<link rel="stylesheet" href="../assets/css/lightbox.css">

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
	
	


	<!-- ***** Main Banner Area Start ***** -->
	<div class="page-heading" id="top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="inner-content">
						<h2>Check Our Products</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->


	<!-- ***** Products Area Starts ***** -->
	<section class="section" id="products">



		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>Our Latest Products</h2>
						<span>Check out all of our products.</span>
					</div>
				</div>
			</div>
		</div>



		<div class="container">
			<div class="row">

				<%@page import="com.util.DBUtil"%>
				<%@page import="java.sql.Connection"%>
				<%@page import="java.sql.ResultSet"%>
				<%@page import="java.sql.PreparedStatement"%>
				<%
				try{
				
					Connection cn = new DBUtil().getDatabaseConnection();
					PreparedStatement st = cn.prepareStatement("select * from product ");
					ResultSet rs = st.executeQuery();
					
					 while(rs.next())
		    { 
%>

				<div class="col-lg-4">
					<div class="item">
						<div class="thumb">
							<div class="hover-content">
								<ul>
									<li><a href="single-product.jsp?id=<%=rs.getInt("pid")%>"><i class="fa-regular fa-eye"></i></a></li>
									<li><a href="#"><i class="fa-regular fa-heart"></i></a></li>
									

								</ul>
							</div>
							<a href="single-product.jsp?id=<%=rs.getInt("pid")%>">
							 <img src="showpdimage.jsp?id=<%=rs.getInt("pid")%>"></a>
						</div>
						<div class="down-content">
							<h3><%=rs.getString("product_name")%></h3>
							<span><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs.getString("discount_price")%>
								&nbsp;<s><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs.getString("product_price")%></s>
							</span>

						</div>
					</div>
				</div>




				<%   
			}
				
				}
				catch (Exception e) 
				{
				 e.printStackTrace();
				}
%>
			</div>
		</div>
	</section>
	<!-- ***** Products Area Ends ***** -->

	<%@ include file="footer.jsp"%>


	<script src="https://kit.fontawesome.com/050cf20804.js"
		crossorigin="anonymous">
		
	</script>
	<!-- jQuery -->
	<script src="../assets/js/jquery-2.1.0.min.js"></script>

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

	<!-- Global Init -->
	<script src="../assets/js/custom.js"></script>
	<script>
		$(function() {
			var selectedClass = "";
			$("p").click(function() {
				selectedClass = $(this).attr("data-rel");
				$("#portfolio").fadeTo(50, 0.1);
				$("#portfolio div").not("." + selectedClass).fadeOut();
				setTimeout(function() {
					$("." + selectedClass).fadeIn();
					$("#portfolio").fadeTo(50, 1);
				}, 500);
			});
		});
	</script>

</body>
</html>