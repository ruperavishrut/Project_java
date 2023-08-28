<!DOCTYPE html>

<html lang="en">

<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>


<body>


	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="user-dash.jsp" class="logo"> <img
							src="../assets/images/logo.png" />
						</a>
						<!-- ***** Logo End ***** -->
						
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							
							<li><a href="user-dash.jsp">Home</a></li>
							<li><a href="products.jsp">Product</a></li>
							<li><a href="about.jsp">About Us</a></li>
							<li><a href="contact.jsp">Contact Us</a></li>
							<li class="submenu"><a href="#">Account</a>
								<ul>
									<li><a href="user_profile.jsp?uid=<%=session.getAttribute("id")%>">Profile</a></li>
									<li><a href="viewcart.jsp?uid=<%=session.getAttribute("id") %>">View Cart</a></li>
									<li><a href="orderhistory.jsp">Order History</a></li>
									<li><a href="../UserController?action=user_logout&id=<%=session.getAttribute("id")%>">Logout</a></li>
								</ul>
							</li>
							
							<li><a>Welcome <%=session.getAttribute("firstname") %></a></li>
							
						</ul>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ***** Header Area End ***** -->





</body>
</html>
