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

	${Otpmatch }
	<div class="main-banner">
		<div
			class="container d-flex justify-content-center align-items-center">
			<div class="row">
				<div class="col">

					<%
					if (request.getAttribute("Otpmatch") != null) {
					%>

					<div class="card login-form">
						<div class="card-body">
							<h3 class="card-title text-center">Change password</h3>

							<div class="card-text">
								<form action="ForgotController" method="post">

									<div class="form-group">
										<label for="exampleInputEmail1">Your new password</label> <input
											type="password" class="form-control form-control-sm"
											name="newpassword" required>
									</div>
									
									<button type="submit"
										class="btn btn-primary btn-block submit-btn" name="action"
										value="Confirm">Confirm</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%
	} else {
	response.sendRedirect("SendOTP.jsp");
	}
	%>
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