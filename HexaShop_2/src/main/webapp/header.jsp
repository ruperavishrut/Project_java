

<html lang="en">

<head>

 <script type="text/javascript">


		var citiesByState = 
		{
			Gujarat: ["Ahmedabad","Amreli","Anand","Aravalli","Banaskantha","Bharuch","Bhavnagar","Botad","Chhota Udaipur","Dahod","Dang","Devbhoomi Dwarka","Gandhinagar","Gir Somnath","Jamnagar","Junagadh","Kheda","Kutch","Mahisagar","Mehsana","Morbi","Narmada","Navsari","Panchmahal","Patan","Porbandar","Rajkot","Sabarkantha","Surat","Surendranagar","Tapi","Vadodara","Valsad"],
			Maharashtra: ["Mumbai","Pune","Nagpur"],
		}
		
		function makeSubmenu(value) 
		{
			if(value.length==0) document.getElementById("citySelect").innerHTML = "<option></option>";
			else 
			{
				var citiesOptions = "";
				for(cityId in citiesByState[value]) {
				citiesOptions+="<option>"+citiesByState[value][cityId]+"</option>";
			}
				document.getElementById("citySelect").innerHTML = citiesOptions;
			}
		}		
</script>

<style>  

.rtext
{
  width: 100%;  
  padding: 15px;  
  margin: 5px 0 22px 0;  
  display: inline-block;  
  border: none;  
  background: #f1f1f1; 
}
 
 
.registerbtn {  
  background-color: #4CAF50;  
  color: white;  
  padding: 16px 20px;  
  margin: 8px 0;  
  border: none;  
  cursor: pointer;  
  width: 100%;  
  opacity: 0.9;  
}  
.registerbtn:hover {  
  opacity: 1;  
}  

.modal-header
{
	background-color: #28a745;
}
.text2
{
	text-align: center;
	color: white;
}
</style>   
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>


  <body>
    

    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
      <div class="container">	
        <div class="row">
          <div class="col-12">
            <nav class="main-nav">
              <!-- ***** Logo Start ***** -->
              <a href="index.jsp" class="logo">
                <img src="assets/images/logo.png" />
              </a>
              <!-- ***** Logo End ***** -->
              <!-- ***** Menu Start ***** -->
              <ul class="nav">              
                <li><a href="index.jsp" >Home</a></li>
                     
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
                <li><a href="#" id="myBtn">Login</a></li>  
                <li><a href="#" id="register">Register</a></li> 
              </ul>              
              <!-- ***** Menu End ***** -->
            </nav> 
          </div>
        </div>
      </div>
      
        <%if(request.getAttribute("invalidemail")!=null)
           { %> 
           
           <div class="alert alert-danger alert-dismissible">
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    ${invalidemail }
		  </div>                      
                              
           <% } %>
           
            <%if(request.getAttribute("pass_update")!=null)
           { %> 
           
           <div class="alert alert-danger alert-dismissible">
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    ${pass_update }
		  </div>
                                        
           <% } %>
           
        
      
      
    </header>
    <!-- ***** Header Area End ***** -->



<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" >
       		
       		<h3 class="text2">Login</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
             
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form method="post" action="UserController">
            <div class="form-group">
              <label ><i class="fa fa-envelope" aria-hidden="true"></i> Email</label>
              <input type="email" name="email" class="form-control" placeholder="Enter email" required>
            </div>
            <div class="form-group">
              <label ><i class="fa fa-unlock-alt" aria-hidden="true"></i> Password</label>
              <input type="password" class="form-control" name="password" placeholder="Enter password" required>
            </div>
             <input type="reset" class="form-control" placeholder="Reset"> <br>
              <button type="submit" name="action" value="user_login" class="btn btn-success btn-block">Login</button> <br>
                           
          </form>
          <center><a href="#" id="forgotpassword">Forgot Password</a></center>
        </div>
        
      </div>
      
    </div>
  </div>
  
  <script>
$(document).ready(function(){
  $("#myBtn").click(function(){
    $("#myModal").modal();
  });
});
</script>


<!-- Forgot Modal -->
  <div class="modal fade" id="forgotModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" >
       		
       		<h3 class="text2">Forgot Password</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
             
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form method="post" action="ForgotController">
            <div class="form-group">
              <label ><i class="fa fa-envelope" aria-hidden="true"></i> Email</label>
              <input type="email" name="email" class="form-control" placeholder="Enter email" required>
            </div>            
              <button type="submit" name="action" value="forgot_pass" class="btn btn-success btn-block">Forgot Password</button> <br>            
          </form>
        </div>
        
      </div>
      
    </div>
  </div>
  
  <script>
$(document).ready(function(){
  $("#forgotpassword").click(function(){
	$('#myModal').modal('hide');
    $("#forgotModal").modal();
  });
});
</script>



<!-- Register Modal -->

<!-- Modal -->
  <div class="modal fade" id="registermodal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" >
        
          <h3 class="text2">Register</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
             
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form method="post" action="UserController" enctype="multipart/form-data" >
         
            <div class="form-group">
              	<label> Firstname </label>   
				<input type="text" name="firstname" placeholder= "Firstname" required class="rtext" required/>   
            </div>
            <div class="form-group">
              	<label> Lastname: </label>    
				<input type="text" name="lastname" placeholder="Lastname" required class="rtext" required /> 
            </div>
            <div class="form-group">
              	<label>Gender :</label><br>  
				<input type="radio" value="Male" name="gender" checked > Male   
				<input type="radio" value="Female" name="gender"  > Female 
            </div>
            
             
            <div class="form-group">
              	 <select class="form-control rtext" id="countrySelect" size="1" onchange="makeSubmenu(this.value)" name="state" required>
				       <option value="" disabled selected>Choose State</option>
				        <option>Gujarat</option>
						<option>Maharashtra</option>
				    </select>
            </div>
            <div class="form-group">
               <select class="form-control rtext" id="citySelect" size="1" name="city" required>
				        <option value="" disabled selected>Choose City</option>
						<option></option>
				</select>
             </div>
            <div class="form-group">
            	 Address :  
				<textarea cols="80" rows="2" placeholder="Current Address"  name="address" required class="rtext" >  
				</textarea> 
            </div>
            <div class="form-group">
            	<label> Pincode </label>   
				<input type="text" name="pincode" placeholder= "pincode" required maxlength="6" class="rtext" />   
            </div>
            <div class="form-group">
            	<label>Mobile No :</label>  
				<input type="text" name="mobileno" placeholder="phone no." maxlength="10" required class="rtext"  />   
            </div>
            <div class="form-group">
            	<label>Email</label>  
		 		<input type="text" placeholder="Enter Email" name="email" required class="rtext" required > 
		 	</div>
		 	 <div class="form-group">
		 	    <label>Password</label>  
		  	  	<input type="password" placeholder="Enter Password" name="password"  class="rtext" required >
		 	 </div>
		 	  <div class="form-group">
            	<label>Image :</label>  
				<input type="file" name="image" placeholder="Choose Image"  required class="rtext">   
            </div>
            
            
             <input type="reset" class="form-control" placeholder="Reset" > <br>
              <button type="submit" name="action" value="user-register" class="btn btn-success btn-block"> Register</button>
          </form>
        </div>
        
      </div>
      
    </div>
  </div>
  
  
  <script>
$(document).ready(function(){
  $("#register").click(function(){
    $("#registermodal").modal();
  });
});
</script> 

    
  </body>
</html>
    