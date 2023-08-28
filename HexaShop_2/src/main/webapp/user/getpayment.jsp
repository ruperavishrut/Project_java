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

<title>Payment</title>

<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css"
	href="../assets/css/font-awesome.css" />

<link rel="stylesheet" href="../assets/css/templatemo-hexashop.css" />

<link rel="stylesheet" href="../assets/css/owl-carousel.css" />

<link rel="stylesheet" href="../assets/css/lightbox.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript">

function CodCreate(){
		
	var xhttp=new XMLHttpRequest();
	var RazorpayOrderId;
	
		//alert("Function called when pay button clicked");
		var number=<%=session.getAttribute("total")%>;
		var uid=<%=session.getAttribute("uuid")%>
		xhttp.open("GET","http://localhost:8080/HexaShop_2/OrderCreation?amount="+number+"&uid="+uid,false);
		//alert("get control send to order creation controller");
		xhttp.send();
		RazorpayOrderId=xhttp.responseText;
		
		 alert("Order ID COD Created :- "+RazorpayOrderId)
		
		/* alert(number);  
		OpenCheckOut(number); */
		
	
	
	Swal.fire({
		  title: 'Want to Cash On Delivery?',
		  text:'Total Amount :- <%=session.getAttribute("total")%>',		 
		  showCancelButton: true,
		  confirmButtonText: 'Confirm',
		  
		}).then((result) => {
		  
		  if (result.isConfirmed) {
		    //Swal.fire('Order Confirmed.', '', 'success')
		  <%--  document.location.href = 'viewcart.jsp?uid=<%=session.getAttribute("uuid")%>'; --%> 
		   <%-- document.location.href = '../OrderCreation?uid=<%=session.getAttribute("uuid")%>&amount=<%=session.getAttribute("total")%>&action=CODOrderConfirmed'; --%>
		   document.location.href = '../OrderCreation?uid=<%=session.getAttribute("uuid")%>&action=cod_order&order_id='+RazorpayOrderId+'&amount=<%=session.getAttribute("total")%>'; 
		  } 
		})
	
}

</script>

<script type="text/javascript">
	var xhttp=new XMLHttpRequest();
	var RazorpayOrderId;
	function CreateOrderID()
	{
		//alert("Function called when pay button clicked");
		var number=<%=session.getAttribute("total")%>;
		var uid=<%=session.getAttribute("uuid")%>
		xhttp.open("GET","http://localhost:8080/HexaShop_2/OrderCreation?amount="+number+"&uid="+uid,false);
		//alert("get control send to order creation controller");
		xhttp.send();
		RazorpayOrderId=xhttp.responseText;
		
		 alert("Order ID ONLINE Created :- "+RazorpayOrderId)
		/* alert(number);  
		OpenCheckOut(number); */
		OpenCheckOut();
	}
	


</script>


<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script type="text/javascript">
	function OpenCheckOut()
	{
		//alert("open checkout function called after created oder ID");
		//alert("3");
		var number=document.getElementById("amount").value;
		//alert("Total Amount Capture :- "+number);
		var options={
				"key":"rzp_test_uW7BnP2J8uR74y",
				"amount":number,
				"currency":"INR",
				"name":"Hexashop",
				"description":"",
				"order_id":RazorpayOrderId,
				"callback_url":"http://localhost:8080/HexaShop_2/OrderCreation",
				
				 "prefill":{
					"name":" ",
					"email":" ",
					"contact":" "
				},				
				"theme":{
					"color":"#3399cc"
				}
				
				
		};
		
		var rzp1=new Razorpay(options);
		
		/*  rzp1.on('payment.failed',function (response){	
			  Swal.fire({
				  icon: 'error',
				  title: 'Oops...',
				  text: 'Something went wrong!',
				  text:'Try after some time',				 
				}) 
			alert(response.error.code);
	        alert(response.error.description);
	        alert(response.error.source);
	        alert(response.error.step);
	        alert(response.error.reason);
	        alert(response.error.metadata.order_id);
	        alert(response.error.metadata.payment_id); 	        	     
		});  */
		
		
		rzp1.open();
	    /* e.preventDefault(); */
	}
</script>

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

   		
			
	  <!-- payment Modal -->
<div class="modal fade" id="payment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelP" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabelP">Payment</h5>
        
      </div>
      <div class="modal-body">
      
      
      
<div class="container">
<div class="row mb-4">
		<div class="col">
			<button id="cod" class="btn btn-primary" onclick="CodCreate()" >Cash On Delivery</button>
			<input type="hidden" id="amount" value="<%=session.getAttribute("total") %>">
				<button id="payButton" onclick="CreateOrderID()" class="btn btn-primary float-right">Pay Now Online</button>
		</div>
</div>
<div class="row mb-4">
	<div class="col">
	<center>Total Amount :- <%=session.getAttribute("total")%></center>
	</div>
</div>

	<!-- <div class="row mb-4">                 
	    <div class="col">	      			
		</div>		
	</div> -->
</div>
      
     
      
      </div>
      <div class="modal-footer">
        <a href="viewcart.jsp?uid=<%=session.getAttribute("id") %>"><button type="button" class="btn btn-secondary">Cancel</button></a>
        
      </div>
      
     
      
    </div>
  </div>
</div>					
		
	
	<script type="text/javascript">
    $(window).on('load',function(){
        $('#payment').modal('show');
    });
</script>		 

		
	
	<script src="https://kit.fontawesome.com/050cf20804.js">
	<!-- jQuery -->
		<script src="../assets/js/jquery-2.1.0.min.js">
	</script>
	
		

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
	<script src="../assets/js/quantity.js"></script>

	<!-- Global Init -->
	<script src="assets/js/custom.js"></script>


</body>
</html>