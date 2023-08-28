<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta charset="utf-8" />
    <meta name="viewport"content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>Layout</title>


    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.ico" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="assets/vendor/js/helpers.js"> </script>
    <script src="assets/js/config.js"> </script>
</head>
<body>
	<!-- Menu -->
<script src="https://kit.fontawesome.com/050cf20804.js"></script>
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="dashboard.jsp" class="app-brand-link">
             
              <span class="app-brand-text demo menu-text fw-bolder ms-2"
                >Admin Services</span
              >
            </a>

            <a
              href="javascript:void(0);"
              class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none"
            >
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
          
            <!-- Dashboard -->
            <li class="menu-item active">
              <a href="dashboard.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div>Dashboard</div>
              </a>
            </li>
			
			<!-- Products Menu -->
			 <li class="menu-item">
              <a href="" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-layout"></i>
                Products
              </a>
              
             
              
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="addproduct.jsp" class="menu-link">
                    Add Product
                  </a>
                </li>              
              </ul>
              
               <ul class="menu-sub">
                <li class="menu-item">
                  <a href="viewproduct.jsp" class="menu-link">
                    View Product
                  </a>
                </li>              
              </ul>                       
            </li>
            
            <li class="menu-item">
              <a href="show_user.jsp" class="menu-link">
               <i class="menu-icon fa-regular fa-user"></i>
                <div>Show Users</div>
              </a>
            </li>
				
			<li class="menu-item">
              <a href="order_history.jsp" class="menu-link">
                <i class="menu-icon fa-solid fa-box-open"></i>
                <div>Order History</div>
              </a>
            </li>
				
	  
               <!--  <li class="menu-item">
                  <a href="layouts-container.jsp" class="menu-link">
                    <div data-i18n="Container">Container</div>
                  </a>
                </li> -->
                

            
            
           
          

          
            
           
          
            
          </ul>
        </aside>
        <!-- / Menu -->
	  <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="assets/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/vendor/js/bootstrap.js"></script>
    <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>