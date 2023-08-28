<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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



<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css" />

<link rel="stylesheet" href="assets/css/templatemo-hexashop.css" />

<link rel="stylesheet" href="assets/css/owl-carousel.css" />

<link rel="stylesheet" href="assets/css/lightbox.css" />


<style>
.card {
	margin-top: 30%;
	width: 400px;
	border: none;
	height: 300px;
	box-shadow: 0px 5px 20px 0px #d2dae3;
	z-index: 1;
	display: flex;
	justify-content: center;
	align-items: center
}

.card h6 {
	color: red;
	font-size: 20px
}


.card-2 {
	background-color: #fff;
	padding: 10px;
	width: 350px;
	height: 100px;
	bottom: -50px;
	left: 20px;
	position: absolute;
	border-radius: 5px
}

.card-2 .content {
	margin-top: 50px
}

.card-2 .content a {
	color: red
}

.form-control:focus {
	box-shadow: none;
	border: 2px solid red
}

.validate {
	border-radius: 20px;
	height: 40px;
	background-color: red;
	border: 1px solid red;
	width: 140px
}
</style> 


</head>
<body>
	<%@ include file="header.jsp"%>

	<%
	String email = null;
	if (session.getAttribute("otp") == null) {
		response.sendRedirect("index.jsp");
	} else {
		User f = (User) session.getAttribute("UserData");
		email = f.getEmail();
	}
	%>

<div class="container">
	<div
		class="container  d-flex justify-content-center align-items-center">
		<div class="position-relative">
			<div class="card p-2 text-center">
				<form action="ForgotController" method="post">
					<h6>
						Please enter the OTP <br> to verify your account
					</h6>
					<div>
						<span>A code has been sent to</span> <small><%=email%></small>
					</div>
					<div id="otp"
						class="inputs d-flex flex-row justify-content-center mt-2">
						<input class="m-2 text-center form-control rounded" type="text"
							maxlength="6" name="EnterOTP" placeholder="Enter OTP" />
					</div>
					<div class="mt-4">
						<button type="submit" name="action" value="verify"
							class="btn btn-danger px-4 validate">Verify</button>
						<br>${notmatch}
						</div>
				</form>
			</div>
		</div>
	</div>
</div>
	


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

	
</body>
</html>
