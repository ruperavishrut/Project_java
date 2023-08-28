<!DOCTYPE html>
<html>
<head>

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
		
			<%@include file="sidebar.jsp"%>
			
			<!-- Layout container -->
			<div class="layout-page">
			
				<%@include file="navbar.jsp"%>
				
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="row">

							<div class="col">
								<div class="row mt-4">



									<div class="col">
									
										<div class="card">
											<div class="card-body">
												<span class="fw-semibold d-block mb-1">Total Category</span>
												<h3 class="card-title mb-2 text-success fw-semibold ">
													<%@page import="com.util.DBUtil"%>
													<%@page import="java.sql.Connection"%>
													<%@page import="java.sql.ResultSet"%>
													<%@page import="java.sql.PreparedStatement"%>
													<%
													try {

														Connection cn = new DBUtil().getDatabaseConnection();
														PreparedStatement st = cn.prepareStatement("select count(*) from category ");

														ResultSet rs = st.executeQuery();
														String Countrow = "";
														while (rs.next()) {
															Countrow = rs.getString(1);
															out.println(Countrow);
														}
													} catch (Exception e) {
														e.printStackTrace();
													}
													%>
												</h3>
											</div>
										</div>
									</div>

									<div class="col">
										<div class="card">
											<div class="card-body">
												<span class="fw-semibold d-block mb-1">Total Product</span>
												<h3 class="card-title mb-2 text-success fw-semibold ">

													<%@page import="com.util.DBUtil"%>
													<%@page import="java.sql.Connection"%>
													<%@page import="java.sql.ResultSet"%>
													<%@page import="java.sql.PreparedStatement"%>
													<%
													try {

														Connection cn = new DBUtil().getDatabaseConnection();
														PreparedStatement st = cn.prepareStatement("select count(*) from product ");

														ResultSet rs = st.executeQuery();
														String Countrow = "";
														while (rs.next()) {
															Countrow = rs.getString(1);
															out.println(Countrow);
														}
													} catch (Exception e) {
														e.printStackTrace();
													}
													%>
												</h3>
											</div>
										</div>
									</div>
									
									<div class="col">
										<div class="card">
											<div class="card-body">
												<span class="fw-semibold d-block mb-1">Total User</span>
												<h3 class="card-title mb-2 text-success fw-semibold ">

													<%@page import="com.util.DBUtil"%>
													<%@page import="java.sql.Connection"%>
													<%@page import="java.sql.ResultSet"%>
													<%@page import="java.sql.PreparedStatement"%>
													<%
													try {

														Connection cn = new DBUtil().getDatabaseConnection();
														PreparedStatement st = cn.prepareStatement("select count(*) from user ");

														ResultSet rs = st.executeQuery();
														String Countrow = "";
														while (rs.next()) {
															Countrow = rs.getString(1);
															out.println(Countrow);
														}
													} catch (Exception e) {
														e.printStackTrace();
													}
													%>
												</h3>
											</div>
										</div>
									</div>
									
									
									<div class="col">
										<div class="card">
											<div class="card-body">
												<span class="fw-semibold d-block mb-1">Total Orders</span>
												<h3 class="card-title mb-2 text-success fw-semibold">

													<%@page import="com.util.DBUtil"%>
													<%@page import="java.sql.Connection"%>
													<%@page import="java.sql.ResultSet"%>
													<%@page import="java.sql.PreparedStatement"%>
													<%
													try {

														Connection cn = new DBUtil().getDatabaseConnection();
														PreparedStatement st = cn.prepareStatement("select count(*) from orderdb ");

														ResultSet rs = st.executeQuery();
														String Countrow = "";
														while (rs.next()) {
															Countrow = rs.getString(1);
															out.println(Countrow);
														}
													} catch (Exception e) {
														e.printStackTrace();
													}
													%>
												</h3>
											</div>
										</div>
									</div>
									
									 <div class="row mt-4"> <!-- second row -->
									
									
										<div class="col">
									
										<div class="card">
											<div class="card-body">
												<span class="fw-semibold d-block mb-1">Delivered Order</span>
												<h3 class="card-title mb-2 text-success fw-semibold ">
													<%@page import="com.util.DBUtil"%>
													<%@page import="java.sql.Connection"%>
													<%@page import="java.sql.ResultSet"%>
													<%@page import="java.sql.PreparedStatement"%>
													<%
													try {

														Connection cn = new DBUtil().getDatabaseConnection();
														PreparedStatement st = cn.prepareStatement("SELECT COUNT(*) FROM orderdb WHERE `order_status`='Delivered'");

														ResultSet rs = st.executeQuery();
														String Countrow = "";
														while (rs.next()) {
															Countrow = rs.getString(1);
															out.println(Countrow);
														}
													} catch (Exception e) {
														e.printStackTrace();
													}
													%>
												</h3>
											</div>
										</div>
									</div>

									<div class="col">
										<div class="card">
											<div class="card-body">
												<span class="fw-semibold d-block mb-1">Pending Orders</span>
												<h3 class="card-title mb-2 text-success fw-semibold ">

													<%@page import="com.util.DBUtil"%>
													<%@page import="java.sql.Connection"%>
													<%@page import="java.sql.ResultSet"%>
													<%@page import="java.sql.PreparedStatement"%>
													<%
													try {

														Connection cn = new DBUtil().getDatabaseConnection();
														PreparedStatement st = cn.prepareStatement("SELECT COUNT(*) FROM orderdb WHERE `order_status`='Pending'");

														ResultSet rs = st.executeQuery();
														String Countrow = "";
														while (rs.next()) {
															Countrow = rs.getString(1);
															out.println(Countrow);
														}
													} catch (Exception e) {
														e.printStackTrace();
													}
													%>
												</h3>
											</div>
										</div>
									</div>
									
									<div class="col">
										<div class="card">
											<div class="card-body">
												<span class="fw-semibold d-block mb-1">On The Way Orders</span>
												<h3 class="card-title mb-2 text-success fw-semibold ">

													<%@page import="com.util.DBUtil"%>
													<%@page import="java.sql.Connection"%>
													<%@page import="java.sql.ResultSet"%>
													<%@page import="java.sql.PreparedStatement"%>
													<%
													try {

														Connection cn = new DBUtil().getDatabaseConnection();
														PreparedStatement st = cn.prepareStatement("SELECT COUNT(*) FROM orderdb WHERE `order_status`='On The Way'");

														ResultSet rs = st.executeQuery();
														String Countrow = "";
														while (rs.next()) {
															Countrow = rs.getString(1);
															out.println(Countrow);
														}
													} catch (Exception e) {
														e.printStackTrace();
													}
													%>
												</h3>
											</div>
										</div>
									</div>
									
									
									<div class="col">
										<div class="card">
											<div class="card-body">
												<span class="fw-semibold d-block mb-1">Cancel Orders</span>
												<h3 class="card-title mb-2 text-success fw-semibold">

													<%@page import="com.util.DBUtil"%>
													<%@page import="java.sql.Connection"%>
													<%@page import="java.sql.ResultSet"%>
													<%@page import="java.sql.PreparedStatement"%>
													<%
													try {

														Connection cn = new DBUtil().getDatabaseConnection();
														PreparedStatement st = cn.prepareStatement("SELECT COUNT(*) FROM orderdb WHERE `order_status`='Cancel'");

														ResultSet rs = st.executeQuery();
														String Countrow = "";
														while (rs.next()) {
															Countrow = rs.getString(1);
															out.println(Countrow);
														}
													} catch (Exception e) {
														e.printStackTrace();
													}
													%>
												</h3>
											</div>
										</div>
									</div>
									
									
									
									</div> <!-- END second row  -->
									
									<div class="row mt-4"> <!-- Third Row -->
									
									
									
<div class="card text-center"> 
  <div class="card-body">
    <h5 class="card-title fw-semibold">Total Revenue</h5>
    <p class="card-text text-success fw-semibold">
    	    <%@page import="com.util.DBUtil"%>
			<%@page import="java.sql.Connection"%>
			<%@page import="java.sql.ResultSet"%>
			<%@page import="java.sql.PreparedStatement"%>
			<%
				try {

					Connection cn = new DBUtil().getDatabaseConnection();
					PreparedStatement st = cn.prepareStatement("SELECT SUM(amount) FROM payments WHERE `status`='PAID'");

					ResultSet rs = st.executeQuery();
					String Countrow = "";
					while (rs.next()) {
						Countrow = rs.getString(1);
						out.println(Countrow);
						}
						} catch (Exception e) {
							e.printStackTrace();
						}
			%>
    </p> 
</div>									
</div>
									
									
						
 

								</div> <!-- END third row -->
								
							</div>
						</div>
						
					</div>
					<!-- / Content -->

				</div>
				<!-- Content wrapper -->
				<%@ include file="footer.jsp"%>
			</div>
			<!-- / Layout page -->
		</div>
		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->

	
</body>
</html>
