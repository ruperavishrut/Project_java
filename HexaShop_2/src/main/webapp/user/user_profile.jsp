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

<script type="text/javascript">
	var citiesByState = {
		Gujarat : [ "Ahmedabad", "Amreli", "Anand", "Aravalli", "Banaskantha",
				"Bharuch", "Bhavnagar", "Botad", "Chhota Udaipur", "Dahod",
				"Dang", "Devbhoomi Dwarka", "Gandhinagar", "Gir Somnath",
				"Jamnagar", "Junagadh", "Kheda", "Kutch", "Mahisagar",
				"Mehsana", "Morbi", "Narmada", "Navsari", "Panchmahal",
				"Patan", "Porbandar", "Rajkot", "Sabarkantha", "Surat",
				"Surendranagar", "Tapi", "Vadodara", "Valsad" ],
		Maharashtra : [ "Mumbai", "Pune", "Nagpur" ],
	}

	function makeSubmenu(value) {
		if (value.length == 0)
			document.getElementById("citySelect").innerHTML = "<option></option>";
		else {
			var citiesOptions = "";
			for (cityId in citiesByState[value]) {
				citiesOptions += "<option>" + citiesByState[value][cityId]
						+ "</option>";
			}
			document.getElementById("citySelect").innerHTML = citiesOptions;
		}
	}
</script>

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

	<%
	String id = request.getParameter("uid");
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
									<span class="text-muted fw-light">Account Setting / </span>Profile
								</h4>
							</div>
							<div class="card mb-4">
								<form method="post" action="../UserController" enctype="multipart/form-data" >
									<h5 class="card-header">Profile Details</h5>
									<!-- Account -->


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
									<div class="card-body">
										<div
											class="d-flex align-items-start align-items-sm-center gap-4">

											<img src="showimage.jsp?id=<%=rs.getInt("uid")%>"
												height="100" width="100" />

											<div class="button-wrapper ml-5">

												<input type="file" class="account-file-input" name="image"
													accept="image/png, image/jpeg" />

												<p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max
													size of 800K</p>
											</div>
										</div>
									</div>
									<hr class="my-0" />
									<div class="card-body">

										<div class="row">
											<div class="mb-3 col-md-6">
												<label class="form-label">First Name</label> <input
													class="form-control" type="text" name="firstname"
													value="<%=rs.getString("firstname")%>" autofocus />
											</div>
											<div class="mb-3 col-md-6">
												<label class="form-label">Last Name</label> <input
													class="form-control" type="text" name="lastname"
													value="<%=rs.getString("lastname")%>" />
											</div>
											<div class="mb-3 col-md-6">
												<label class="form-label">E-mail</label> <input
													class="form-control" type="text" name="email"
													value="<%=rs.getString("email")%>" />
											</div>

											<div class="mb-3 col-md-6">
												<label class="form-label">Password</label> <input
													type="text" class="form-control" name="password"
													value="<%=rs.getString("password")%>" />
											</div>

											<div class="mb-3 col-md-6">
												<label class="form-label" for="phoneNumber">Mobile
													No</label> <input type="text" name="mobileno" class="form-control"
													value="<%=rs.getString("mobileno")%>" />

											</div>

											<div class="mb-3 col-md-6">
												<label for="gender" class="form-label">Gender </label> <input
													type="radio" value="Male" name="gender" checked>
												Male <input type="radio" value="Female" name="gender">
												Female <input type="text" class="form-control"
													value="<%=rs.getString("gender")%>" readonly />
											</div>

											<div class="mb-3 col-md-6">
												<label class="form-label">Address</label>
												<textarea cols="10" rows="1" name="address"
													class="form-control"><%=rs.getString("address")%> </textarea>
											</div>

											<div class="mb-3 col-md-6">
												<label f class="form-label">Pin Code</label> <input
													type="text" class="form-control" name="pincode"
													value="<%=rs.getString("pincode")%>" maxlength="6" />
											</div>

											<div class="mb-3 col-md-6">
												<select name="state" class="form-control" id="countrySelect"
													size="1" onchange="makeSubmenu(this.value)">
													<option disable>Select State</option>
													<option>Gujarat</option>
													<option>Maharashtra</option>

												</select> <br> <input type="text" class="form-control"
													value="<%=rs.getString("state")%>" readonly />

											</div>
											<div class="mb-3 col-md-6">

												<select name="city" class="form-control " id="citySelect"
													size="1">
													<option>Select City</option>
													<option></option>
												</select> <br> <input type="text" class="form-control"
													value="<%=rs.getString("city")%>" readonly />
											</div>

											<div class="mt-2">
											<input name="id" type="hidden" value="<%=session.getAttribute("id")%>">
												<button type="submit" class="btn btn-primary me-2"
													name="action" value="user_update">Save changes</button>
												<button type="reset" class="btn btn-outline-secondary">Cancel</button>
											</div>

										</div>
										<!-- /Account -->
										<%
										}

										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
									
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->


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