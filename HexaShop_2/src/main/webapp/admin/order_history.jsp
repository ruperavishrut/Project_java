<html>
<head>
<title>Show Users</title>
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
						<div class="tab-content">
							<div class="col">
								<div class="card mb-4">
									<h5 class="card-header">Order History</h5>
									<div class="card-body">
										<div class="form-floating">
											<div class="card">
												<div class="table-responsive text-nowrap">
													<table class="table">
														<thead class="table-light">
															<tr>
																<th>No</th>
																<th>User ID</th>
																<th>Order ID</th>
																<th>Order Status</th>
																<th>Order Date</th>
																<th>Actions</th>
															</tr>
														</thead>
														<tbody class="table-border-bottom-0">

															<%@page import="com.util.DBUtil"%>
															<%@page import="java.sql.Connection"%>
															<%@page import="java.sql.ResultSet"%>
															<%@page import="java.sql.PreparedStatement"%>
															<%
															try {

																Connection cn = new DBUtil().getDatabaseConnection();
																PreparedStatement st = cn.prepareStatement("select * from orderdb");
																ResultSet rs = st.executeQuery();
																int x = 1;
																while (rs.next()) {
															%>
															<tr>
																<td><%=x%></td>
																<td><%=rs.getString("uid")%></td>
																<td><%=rs.getString("order_id")%></td>																															
																<% String s = rs.getString("order_status"); %>
															    <%if(s.equals("Pending")) {
																%><td><span class="badge badge-pill badge-info"><%=s%></span></td>
																<%}if(s.equals("On The Way")) {
																%>
																<td><span class="badge badge-pill badge-warning"><%=s%></span></td>
																<%}if(s.equals("Delivered")) {%><td><span class="badge badge-pill badge-success"><%=s%></span></td>
																<%}if(s.equals("Cancel")) {%><td><span class="badge badge-pill badge-danger"><%=s%></span></td><%} %>
																<td><%=rs.getString("order_date")%></td>
	<td>                        
       <a class="btn btn-outline-primary" href="edit_order.jsp?action=edit_order&uid=<%=rs.getString("uid")%>&order_id=<%=rs.getString("order_id")%>">Edit</a>
                            
   </td>

																<%
																x = x + 1;
																}

																} catch (Exception e) {
																e.printStackTrace();
																}
																%>

															</tr>
														</tbody>
													</table>
												</div>
											</div>



										</div>
									</div>
								</div>
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

</body>
</html>
