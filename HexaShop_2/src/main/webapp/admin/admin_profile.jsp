<!DOCTYPE html>
<html>
  <head>

  </head>
  <body>
   <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
      <%@ include file="sidebar.jsp" %> 
        <!-- Layout container -->
        <div class="layout-page">
      <%@ include file="navbar.jsp" %>
          <!-- Content wrapper -->
          <div class="content-wrapper">        
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
            
            
            
            
             <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Account Settings /</span> Profile</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                  
                    <li class="nav-item">
                      <a class="nav-link active"><i class="bx bx-user me-1"></i> Account</a>
                    </li>                                       
                    
                  </ul>
                  <div class="card mb-4">
                    <h5 class="card-header">Profile Details</h5>
                    <!-- Account -->
                    
                    <div class="card-body">
                      <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img
                          src="assets/img/avatars/1.png"
                          alt="user-avatar"
                          class="d-block rounded"
                          height="100"
                          width="100"
                          id="uploadedAvatar"
                        />
                        <div class="button-wrapper">
                          <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                            <span class="d-none d-sm-block">Upload new photo</span>                           
                            <input
                              type="file"
                              id="upload"
                              class="account-file-input"
                              hidden
                              accept="image/png, image/jpeg"
                              name="image"
                            />
                          </label>                         
                          <p class="text-muted mb-0">Allowed JPG or PNG. Max size of 2 Mb </p>
                        </div>
                      </div>
                    </div>
                    
                
                    
                   
                    <hr class="my-0" />
                    <div class="card-body">
                      <form method="post" action="../AdminController" enctype="multipart/form-data">
                      
                        <div class="row">
                          <div class="mb-3 col-md-6">
                            <label  class="form-label">First Name</label>
                            
                            <input
                              class="form-control"
                              type="text"
                              name="firstname"
                              value="<%=session.getAttribute("firstname") %>"
                              autofocus
                            />
                          </div>
                          
                          <div class="mb-3 col-md-6">
                            <label  class="form-label">Last Name</label>
                            <input class="form-control" type="text" name="lastname" value="<%=session.getAttribute("lastname") %>" />
                          </div>
                          
                          <div class="mb-3 col-md-6">
                            <label for="email" class="form-label">E-mail</label>
                            <input
                              class="form-control"
                              type="email"                            
                              name="email"
                              value="<%=session.getAttribute("email")%>" />
                          </div>
                          
                          <div class="mb-3 col-md-6">
                            <label class="form-label">Password</label>
                            <input
                              type="text"
                              class="form-control"                             
                              name="password"
                              value="<%=session.getAttribute("password")%>"/>                           
                          </div>
                                              
                        </div>
                        <div class="mt-2">
                         <input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
                          <button type="submit" class="btn btn-primary me-2" name="action" value="update_profile">Save changes</button>
                          <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                        </div>
                      </form>
                    </div>
                    <!-- /Account -->
                  </div>
                  
                  
               
                </div> <!-- row -->
              </div> <!-- column -->
            
              
              
              
              
              
              
              
              
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
