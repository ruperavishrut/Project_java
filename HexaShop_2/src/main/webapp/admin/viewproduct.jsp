<!DOCTYPE html>
<html>
<head>
	  <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	<%if (session.getAttribute("pd")=="true") 
	{%>
	<script>
	Swal.fire({
		  icon: 'error',
		  title: 'Oops...',
		  text: 'Product Is Purchased...',
		  footer: ''
		})
	</script>
	
	<%}
	session.removeAttribute("pd");
	%>
   <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
      <%@include file="sidebar.jsp" %> 
        <!-- Layout container -->
        <div class="layout-page">
      <%@include file="navbar.jsp" %>
          <!-- Content wrapper -->
          <div class="content-wrapper">        
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
            
            
            
            <div class="container">
           		<div class="row">
                
                 

                <div class="align-self-center">
                  <h6 class="text-muted">Products Details</h6>
                  <div class="nav-align-top mb-4">
                    <ul class="nav nav-pills mb-3 nav-fill" role="tablist">
                      <li class="nav-item">
                        <button
                          type="button"
                          class="nav-link active"
                          role="tab"
                          data-bs-toggle="tab"
                          data-bs-target="#viewcategory"
                          aria-controls="navs-pills-justified-home"
                          aria-selected="true"
                        >
                          <i class="tf-icons bx bx-home"></i> View Category
                          
                        </button>
                      </li>
                     
                      <li class="nav-item">
                        <button
                          type="button"
                          class="nav-link"
                          role="tab"
                          data-bs-toggle="tab"
                          data-bs-target="#viewproduct"
                          aria-controls="navs-pills-justified-messages"
                          aria-selected="false"
                        >
                          <i class="tf-icons bx bx-message-square"></i> View Product
                        </button>
                      </li>
                    </ul>
                    
                    <div class="tab-content">
                      <div class="tab-pane fade show active" id="viewcategory" role="tabpanel">                    
			                 <div class="col">
			                  <div class="card mb-4">
			                    <h5 class="card-header">View Category</h5>
			                    <div class="card-body">          
			                      <div class="form-floating">
			                      
		                        
			                        
              <div class="card">               
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead class="table-light">
                      <tr>
                        <th>No</th>
                        <th>Id</th>
                        <th>Category Name</th>
                        <th>Create Date</th>
                        <th>Update Date</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      
				<%@page import="com.util.DBUtil"%>
				<%@page import="java.sql.Connection"%>
				<%@page import="java.sql.ResultSet"%>
				<%@page import="java.sql.PreparedStatement"%>                    
				<%
				try{
				
					Connection cn = new DBUtil().getDatabaseConnection();
					PreparedStatement st = cn.prepareStatement("select * from category");
					ResultSet rs = st.executeQuery();
					int x=1;
					 while(rs.next())
				     { 
				%>
                      	<tr>
                      	<td><%=x%></td>
                        <td><%=rs.getInt("catid")%></td>
                        <td><%=rs.getString("catname")%></td>
                        <td><%=rs.getString("create_at")%></td>
                        <td><%=rs.getString("update_at")%></td>
                        
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              
                              <a class="dropdown-item" href="../AdminController?action=deletecat&cat_id=<%=rs.getInt("catid")%>"
                                ><i class="bx bx-trash me-1"></i> Delete</a
                              >
                            </div>
                          </div>
                          
                        </td>	
                        		
			
				<% x=x+1;
					}
				
					}
						catch (Exception e) 
					{
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
			              
                     
                      <div class="tab-pane fade" id="viewproduct" role="tabpanel">
                        
                       <div class="col">
			                  <div class="card mb-4">
			                    <h5 class="card-header">View Product</h5>
			                    <div class="card-body">	
			                     <div class="form-floating">	                    
			                       
	<div class="card">               
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead class="table-light">
                      <tr>
                      	<th>No</th>
                        <th>PId</th>
                        <th>CatId</th>
                        <th>Product Name</th>
                        <th>Details</th>
                        <th>Size</th>
                        <th>Price</th>
                        <th>Discount Price</th>
                        
                        <th>Images</th>
                        <th>Create Date</th>
                        <th>Update Date</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      
				<%@page import="com.util.DBUtil"%>
				<%@page import="java.sql.Connection"%>
				<%@page import="java.sql.ResultSet"%>
				<%@page import="java.sql.PreparedStatement"%>                    
				<%
				try{
				
					Connection cn = new DBUtil().getDatabaseConnection();
					PreparedStatement st = cn.prepareStatement("select * from product");
					ResultSet rs = st.executeQuery();
					int x=1;
					 while(rs.next())
				     { 
				%>
                      	<tr>
                      	<td><%=x%></td>
                        <td><%=rs.getInt("pid")%></td>
                        <td><%=rs.getInt("catid")%></td>
                        <td><%=rs.getString("Product_name")%></td>
                        <td><%=rs.getString("Product_details")%></td>
                        <td><%=rs.getString("Product_size")%></td>
                        <td><%=rs.getFloat("Product_price")%></td>
                        <td><%=rs.getFloat("discount_price")%></td>
                        
                        <td><img src="showimage.jsp?id=<%=rs.getInt("pid")%>"  height=100 width=100></td>
                        <!-- <td><%=rs.getBlob("images")%></td>  -->                      
                        <td><%=rs.getString("create_at")%></td>
                        <td><%=rs.getString("update_at")%></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                             
                              <a class="dropdown-item" href="../AdminController?action=deleteproduct&pid=<%=rs.getInt("pid")%>"
                                ><i class="bx bx-trash me-1"></i> Delete</a
                              >
                            </div>
                          </div>
                          
                        </td>			
			
				<% x=x+1;
					}
				
					}
						catch (Exception e) 
					{
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
                  </div>
                </div>
              </div>
           </div>
           
            
              
              
              
              
              
              
              
              
            </div>
            <!-- / Content -->
       
          </div>
          <!-- Content wrapper -->
          <%@ include file="footer.jsp" %>
        </div>
        <!-- / Layout page -->
      </div>      
      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

  </body>
</html>
