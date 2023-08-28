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
	href="assets/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css" />

<link rel="stylesheet" href="assets/css/templatemo-hexashop.css" />

<link rel="stylesheet" href="assets/css/owl-carousel.css" />

<link rel="stylesheet" href="assets/css/lightbox.css" />




</head>
<body>


	<%@ include file="header.jsp"%>

	<!-- ***** Main Banner Area Start ***** -->
	<div class="page-heading about-page-heading" id="top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="inner-content">
						<h2>About Our Company</h2>
						<span>Awesome, clean &amp; creative HTML5 Template</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->

	<!-- ***** About Area Starts ***** -->
	<div class="about-us">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="left-image">
						<img src="assets/images/about-left-image.jpg" alt="">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="right-content">
						<h4>About Us</h4>
						<span>Welcome to HexaShop, your one-stop destination for
							trendy and stylish designer t-shirts! At HexaShop, we believe
							that fashion is a form of self-expression, and our mission is to
							provide you with unique and high-quality t-shirts that allow you
							to showcase your individuality and make a bold statement.</span>
						<div class="quote">
							<i class="fa fa-quote-left"></i>
							<p>At HexaShop, we believe that fashion is an art form, and
								our designer t-shirts are the canvas for your individuality.</p>
						</div>
						<p>HexaShop is more than just a t-shirt company; we are a
							community. We believe in fostering a sense of belonging among our
							customers, creating a space where everyone feels inspired and
							empowered to express themselves freely. We value your feedback
							and suggestions, as they help us constantly evolve and improve
							our offerings.</p>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** About Area Ends ***** -->




	<!-- ***** Services Area Starts ***** -->
	<section class="our-services">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>Our Services</h2>

					</div>
				</div>
				<div class="col-lg-4">
					<div class="service-item">
						<h4>Extensive Designer Collection</h4>
						<p>HexaShop offers a diverse range of designer t-shirts that
							cater to various styles, interests, and aesthetics. Explore our
							vast collection and find the perfect t-shirt that reflects your
							unique personality.</p>
						<img src="assets/images/service1.png" alt="">
					</div>
				</div>
				<div class="col-lg-4">
					<div class="service-item">
						<h4>High-Quality Materials</h4>
						<p>We believe that comfort is just as crucial as style. All
							our t-shirts are crafted using premium quality materials,
							ensuring exceptional comfort, durability, and a luxurious
							feel.perfect blend of fashion and comfort with HexaShop.</p>
						<img src="assets/images/service2.png" alt="">
					</div>
				</div>
				<div class="col-lg-4">
					<div class="service-item">
						<h4>Excellent Customer Support</h4>
						<p>We prioritize your satisfaction and strive to provide
							excellent customer support. Our dedicated team is always
							available to assist you with any inquiries, concerns, or
							assistance you may need during your shopping experience with
							HexaShop.</p>
						<img src="assets/images/service3.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ***** Services Area Ends ***** -->
	<%@ include file="footer.jsp"%>







	<!-- jQuery -->
	<script src="assets/js/jquery-2.1.0.min.js"></script>

	<!-- Bootstrap -->
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- Plugins -->
	<script src="assets/js/owl-carousel.js"></script>
	<script src="assets/js/accordions.js"></script>
	<script src="assets/js/datepicker.js"></script>
	<script src="assets/js/scrollreveal.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/imgfix.min.js"></script>
	<script src="assets/js/slick.js"></script>
	<script src="assets/js/lightbox.js"></script>
	<script src="assets/js/isotope.js"></script>

	<!-- Global Init -->
	<script src="assets/js/custom.js"></script>

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