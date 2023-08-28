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

<title>Hexashop</title>

<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css"
	href="../assets/css/font-awesome.css" />

<link rel="stylesheet" href="../assets/css/templatemo-hexashop.css" />

<link rel="stylesheet" href="../assets/css/owl-carousel.css" />

<link rel="stylesheet" href="../assets/css/lightbox.css" />

</head>
<body>

	<%	
	response.setHeader("Cache-control", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire", 0);
	if (session.getAttribute("login") == null) {
		response.sendRedirect("../index.jsp");
	} 
	%>

	<%@ include file="header.jsp"%>


	<!-- ***** Main Banner Area Start ***** -->
	<div class="main-banner" id="top">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<div class="left-content">
						<div class="thumb">
							<div class="inner-content">
								<h4 style="color: white;">We Are Hexashop</h4>

								<div class="main-border-button">
									<a href="category.jsp">Purchase Now!</a>
								</div>
							</div>
							<img src="../assets/images/main3.png" alt="" />
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="right-content">
						<div class="row">
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Men Superheroes</h4>

										</div>
										<div class="hover-content">
											<div class="inner">
												<p>Men Superheroes Ultimate Collection</p>
												<div class="main-border-button">
													<a href="category.jsp">Discover More</a>
												</div>
											</div>
										</div>
										<img src="../assets/images/b1.png" />
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Oversized T-Shirts</h4>
											<span>Best Clothes For Men</span>
										</div>
										<div class="hover-content">
											<div class="inner">

												<p>Crazy Oversized T-Shirts</p>
												<div class="main-border-button">
													<a href="category.jsp">Discover More</a>
												</div>
											</div>
										</div>
										<img src="../assets/images/b2.png" />
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Full Sleeve T-Shirts</h4>

										</div>
										<div class="hover-content">
											<div class="inner">

												<p>Creative Full Sleeve T-Shirts Collection</p>
												<div class="main-border-button">
													<a href="#">Discover More</a>
												</div>
											</div>
										</div>
										<img src="../assets/images/b3.png" />
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Streetwear Collection Men</h4>

										</div>
										<div class="hover-content">
											<div class="inner">

												<p>Old School Street Wear Collection</p>
												<div class="main-border-button">
													<a href="#">Discover More</a>
												</div>
											</div>
										</div>
										<img src="../assets/images/b4.png" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->


	<!-- ***** Men Area Starts ***** -->
	<section class="section" id="men">
    
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="section-heading">
              <h2> Products </h2>
            
            </div>
          </div>
        </div>
      </div>
      
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="men-item-carousel">
              <div class="owl-men-item owl-carousel">
                 
                <%@page import="com.util.DBUtil"%>
				<%@page import="java.sql.Connection"%>
				<%@page import="java.sql.ResultSet"%>
				<%@page import="java.sql.PreparedStatement"%>                    
				<%
				try{
				
					Connection cn = new DBUtil().getDatabaseConnection();
					PreparedStatement st = cn.prepareStatement("select * from product limit 5");
					ResultSet rs = st.executeQuery();
					
					 while(rs.next())
				     { 
				%>                                                                                          
                <div class="item">
                  <div class="thumb">                   
                    <img src="showpdimage.jsp?id=<%=rs.getInt("pid")%>">                  
                  </div>
                  <div class="down-content">
                    <h3><%=rs.getString("product_name")%></h3>                   
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
          </div>
        </div>
      </div>
      
    </section>
	<!-- ***** Men Area Ends ***** -->

	<!-- ***** Explore Area Starts ***** -->
	<section class="section" id="explore">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="left-content">
						<h2>Explore Our Products</h2>
						<span> Welcome to HexaShop, your ultimate destination for
							designer t-shirts that effortlessly combine style, quality, and
							creativity. We are proud to present our exquisite collection of
							designer t-shirts, where fashion meets artistry. Explore our
							product page and discover the perfect t-shirt to elevate your
							wardrobe to new heights. </span>
						<div class="quote">
							<i class="fa fa-quote-left"></i>
							<p>Fashion is art, and our designer t-shirts are the canvas
								for your unique expression.</p>
						</div>
						<p>Our t-shirts are made using premium quality materials that
							ensure a comfortable fit and long-lasting durability. We believe
							that fashion should be sustainable, which is why we prioritize
							using eco-friendly fabrics and ethical manufacturing practices.
							When you wear a HexaShop designer t-shirt, you can feel confident
							knowing that you're supporting a brand that cares about the
							planet and its people.</p>

						<div class="main-border-button">
							<a href="products.html">Discover More</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="right-content">
						<div class="row">
							<div class="col-lg-6">
								<div class="leather">
									<h4>Designer T-Shirt</h4>
									<span>Latest Collection</span>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="first-image">
									<img src="../assets/images/display1.png" alt="" />
								</div>
							</div>
							<div class="col-lg-6">
								<div class="second-image">
									<img src="../assets/images/display2.png" alt="" />
								</div>
							</div>
							<div class="col-lg-6">
								<div class="types">
									<h4>Premium Quality</h4>
									<span>Over 304 Products</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ***** Explore Area Ends ***** -->



	<%@ include file="footer.jsp"%>









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