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


	<div class="main-banner">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="row">
					
					
					<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button> -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
      test
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
					
					
					</div>
					</div>
				</div>
			</div>
		</div>

	<%@ include file="footer.jsp"%>
	
	<script type="text/javascript">
	$(window).on('load',function(){
        $('#exampleModal').modal('show');
    });
	</script>

	<!-- jQuery -->
	<script src="../assets/js/jquery-2.1.0.min.js"></script>
	
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/jquery.smartWizard.min.js"></script>

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


</body>
</html>