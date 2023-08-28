<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Hexashop - Product Detail Page</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css">

    <link rel="stylesheet" href="../assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="../assets/css/owl-carousel.css">

    <link rel="stylesheet" href="../assets/css/lightbox.css">

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
	
    			<%@page import="com.util.DBUtil"%>
				<%@page import="java.sql.Connection"%>
				<%@page import="java.sql.ResultSet"%>
				<%@page import="java.sql.PreparedStatement"%>
				<% int id = Integer.parseInt(request.getParameter("id")); %>
				<%
				try{
				
					Connection cn = new DBUtil().getDatabaseConnection();
					PreparedStatement st = cn.prepareStatement("select * from product where pid="+id);
					ResultSet rs = st.executeQuery();
					
					 while(rs.next())
		    { 
%>
			
			  <!-- ***** Main Banner Area Start ***** -->
    <div class="page-heading">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-content">
                        <h2><%=rs.getString("product_name")%></h2>                      
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->
    <form method="post" action="../UserController">
     <!-- ***** Product Area Starts ***** -->
    <section class="section" id="product">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                <div class="left-images">
                    <img src="showpdimage.jsp?id=<%=rs.getInt("pid")%>">
                    
                </div>
            </div>
            <div class="col-lg-4">
                <div class="right-content">
                    <h4><%=rs.getString("product_name")%></h4>
                    <span class="price"> <i class="fa-solid fa-indian-rupee-sign"></i> <%=rs.getString("discount_price")%>
                    &nbsp; &nbsp;
                    <s><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs.getString("product_price")%></s>
                    </span>
                    
                    
                    <span> <%=rs.getString("product_details")%></span>
                    
                    
<%
       PreparedStatement stm = cn.prepareStatement("select catname from category where catid in (select catid from product where pid="+id+")");
    		   
   		ResultSet catname = stm.executeQuery();
		
		 while(catname.next())
		{  
%>
		
			 <div class="quote">
             <p>Category : <%=catname.getString("catname")%></p>
         	</div>
<% 
		}      		 
%>   				
					<span>
                    <h6>Available Size : &nbsp;
                    <input type="radio" name="size" value="s" required="required"> S &nbsp;
					<input type="radio" name="size" value="m"> M &nbsp;
					<input type="radio" name="size" value="l"> L &nbsp; 
					<input type="radio" name="size" value="xl"> XL &nbsp; 
					<input type="radio" name="size" value="xxl"> XXL &nbsp;
                     <%-- <%=rs.getString("product_size")%> &nbsp; --%>
                    </h6>
                    </span>
                    
                    <div class="right-content">
						<div class="quantity buttons_added">
						<input type="button" value="-" class="minus">
																
							<input type="number" step="1" min="1" max="10" name="quantity"
								value="1" class="input-text qty text" size="4">
																	
						<input type="button" value="+" class="plus">
						</div>
					</div>
                     
                     
                      
                    
                    <div class="total mt-3">
                        <input type="hidden" value="<%=rs.getString("pid")%>" name="pid">
                        <input type="hidden" value="<%=session.getAttribute("id") %>" name="uid">
                        <input type="hidden" value="<%=rs.getString("discount_price")%>" name="price">
                        <Button class="btn btn-primary" type="submit" name="action" value="addcart">Add To Cart</Button>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </section>
    <!-- ***** Product Area Ends ***** -->
     
    
    
     </form>

<%   
			}
				
				}
				catch (Exception e) 
				{
				 e.printStackTrace();
				}
%>


    
    <%@ include file="footer.jsp"%>
    
    
    <script src="https://kit.fontawesome.com/050cf20804.js">
		
    

    <!-- jQuery -->
    <script src="../assets/js/jquery-2.1.0.min.js"> </script>

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
