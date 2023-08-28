<html>
  <head> 
    <title>Show Users</title>
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
                    <div class="tab-content">                                       
			          <div class="col">
			            <div class="card mb-4">
			              <h5 class="card-header">User Details</h5>
			                <div class="card-body">          
			                  <div class="form-floating">		                        
              <div class="card">               
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead class="table-light">
                      <tr>
                        <th>No</th>                     
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Mobile No</th>
                        <th>Status</th>
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
					PreparedStatement st = cn.prepareStatement("select * from user");
					ResultSet rs = st.executeQuery();
					int x=1;
					 while(rs.next())
				     { 
				%>
                      	<tr>
                      	<td><%=x%></td>
                        <td><%=rs.getString("firstname")%></td>
                        <td><%=rs.getString("lastname")%></td>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("mobileno")%></td>
                        <%String s=rs.getString("status"); if(s.equals("Active")){%>
                        <td><span class="badge badge-pill badge-success"><%=s%></span></td>
                        <%}else{ %>
                        <td><span class="badge badge-pill badge-danger"><%=s%></span></td><%} %>
 		
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
    
  </body>
</html>
