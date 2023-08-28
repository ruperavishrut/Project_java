<!DOCTYPE html>
<html>
  <head>  
  </head>
  <body>
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
                  <h6 class="text-muted">Products Services</h6>
                  <div class="nav-align-top mb-4">
                    <ul class="nav nav-pills mb-3 nav-fill" role="tablist">
                      <li class="nav-item">
                        <button
                          type="button"
                          class="nav-link active"
                          role="tab"
                          data-bs-toggle="tab"
                          data-bs-target="#addcategory"
                          aria-controls="navs-pills-justified-home"
                          aria-selected="true"
                        >
                          <i class="tf-icons bx bx-home"></i> Category
                          
                        </button>
                      </li>
                     
                      <li class="nav-item">
                        <button
                          type="button"
                          class="nav-link"
                          role="tab"
                          data-bs-toggle="tab"
                          data-bs-target="#addproduct"
                          aria-controls="navs-pills-justified-messages"
                          aria-selected="false"
                        >
                          <i class="tf-icons bx bx-message-square"></i> Product
                        </button>
                      </li>
                    </ul>
                    
                    <div class="tab-content">
                      <div class="tab-pane fade show active" id="addcategory" role="tabpanel">                    
			                 <div class="col">
			                  <div class="card mb-4">
			                    <h5 class="card-header">Add Category</h5>
			                    <div class="card-body">
			                    <form method="post" action="../AdminController">
			                      <div class="form-floating">
			                      
			                        <input
			                          type="text"
			                          class="form-control"
			                          id="floatingInput"
			                          placeholder="Name"
			                          aria-describedby="floatingInputHelp"
			                          name="catname" required 
			                        />
			                        
			                        <label for="floatingInput">Category Name</label>
			                        
			                      </div> 			                      
			                      
			                      <br>                     
			                      <div class="row">
								    
								    <div class="col align-self-center">
								    <button type="submit" name="action" value="addcategory" class="btn btn-primary">Add Category</button>
								    </div>
								    
								  </div>
			                      </form>
			                    </div>
			                  </div>
			                </div>                      
			              </div>
			              
                     
                      <div class="tab-pane fade" id="addproduct" role="tabpanel">
                        
                       <div class="col">
			                  <div class="card mb-4">
			                    <h5 class="card-header">Add Product</h5>
			                    <div class="card-body">
			                    
			                    
			                    <form method="post" action="../AdminController" enctype="multipart/form-data" >
			                    <select id="defaultSelect" class="form-select" name="catid" >
                        
                        
                <%@page import="com.util.DBUtil"%>
				<%@page import="java.sql.Connection"%>
				<%@page import="java.sql.ResultSet"%>
				<%@page import="java.sql.PreparedStatement"%>                    
				<%
				try{
				
					Connection cn = new DBUtil().getDatabaseConnection();
					PreparedStatement st = cn.prepareStatement("select * from category");
					ResultSet rs = st.executeQuery();
					
					 while(rs.next())
				     { 
				%>
                        
                          
                          <option value="<%=rs.getString("catid")%>" ><%=rs.getString("catname")%></option>
                <% 
					}
				
					}
						catch (Exception e) 
					{
						e.printStackTrace();
					}
				%>       
                          
                        </select>
                        
                        <br>                    
			                      <div class="form-floating">                      
			                        <input
			                          type="text"
			                          class="form-control"
			                          id="floatingInput"
			                          placeholder="Name"
			                          aria-describedby="floatingInputHelp"
			                          name="pdname"
			                          required
			                        />                       
			                        <label for="floatingInput">Product Name</label>                                                                      
			                      </div>
			                      
			                      
			             <br>                    
			                      <div class="form-floating">                      
			                        <input
			                          type="text"
			                          class="form-control"
			                          id="floatingInput"
			                          placeholder="Details"
			                          aria-describedby="floatingInputHelp"
			                          name="pddetail" required
			                        />                       
			                        <label for="floatingInput">Product Details</label>                                                                      
			                      </div>
			              
			              <br>                    
			                      <div class="form-floating">                      
			                        <input
			                          type="text"
			                          class="form-control"
			                          id="floatingInput"
			                          placeholder="Size"
			                          aria-describedby="floatingInputHelp"
			                          name="pdsize" required
			                        />                       
			                        <label for="floatingInput">Product Size</label>                                                                      
			                      </div>   
			                      
			             <br>                    
			                      <div class="form-floating">                      
			                        <input
			                          type="number"
			                          class="form-control"
			                          id="floatingInput"
			                          placeholder="Price"
			                          aria-describedby="floatingInputHelp"
			                          name="pdprice" required
			                        />                       
			                        <label for="floatingInput">Product Price</label>                                                                      
			                      </div>   
			                      
			              <br>                    
			                      <div class="form-floating">                      
			                        <input
			                          type="number"
			                          class="form-control"
			                          id="floatingInput"
			                          placeholder="Discount Price"
			                          aria-describedby="floatingInputHelp"
			                          name="pddiscountprice" required
			                        />                       
			                        <label for="floatingInput">Product Discount Price</label>                                                                      
			                      </div>
			                      
			             <br>                    
			                      <!-- <div class="form-floating">                      
			                        <input
			                          type="number"
			                          class="form-control"
			                          id="floatingInput"
			                          placeholder="Quantity"
			                          aria-describedby="floatingInputHelp"
			                          name="pdquantity" required
			                        />                        
			                        <label for="floatingInput">Product Quantity</label>                                                                      
			                      </div>  -->
			                      
			             <br>                    
			                      <div class="form-floating">                      
			                        <input
			                          type="file"
			                          class="form-control"
			                          
			                          name="pdimage" 
			                        />                       
			                                                                                             
			                      </div>                            
			             <br>
			                                            
			                      <div class="row">								    
								    <div class="col align-self-center">
								    <button type="submit" name="action" value="addproduct" class="btn btn-primary">Add Product</button>
								    </div>								    
								  </div>
								  
			                      </form>
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
