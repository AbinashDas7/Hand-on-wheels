<?php
include('config/config.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Top Notch Driving School</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Top Notch Driving School">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="images/favicon.ico" />

<?php include('includes/header_js_css.php');?> 
 </head>
<body>
<div class="super_container">
	<!-- Header -->
	<header class="header">			
		<!-- Top Bar -->
		<?php include('includes/topbar.php');?> 
		<!-- Header Content -->
		<?php include('includes/desktopmenu.php');?>  		
	</header>
	<!-- Menu -->
<?php include('includes/mobilemenu.php');?> 
	<!-- Home -->
<?php include('includes/homeslider.php');?> 

 

<!--Online Seminar Section-->	 
 <?php include('includes/onlineseminars.php');?>  	
		


<!--Welcome Section-->	 
 <?php include('includes/welcomesection.php');?>  	
		

<!--Course highlight-->	 
 <?php include('includes/coursehighlight.php');?>  	
		
		
<!--Seminar topic-->	 
 <?php include('includes/seminartopic.php');?>  	

 <!-- Why us -->
	
 <?php include('includes/whycooseus.php');?>  
	 
	 <!-- Our Features -->
 
	
 <?php include('includes/our_features.php');?> 
		
	
	  <!--Testimonial-->
 <?php include('includes/testimonial.php');?> 
 
  <!--Contactus-->
 <?php include('includes/contactus.php');?> 
	
	<!-- Footer -->
<?php include('includes/footer.php');?> 

</div>
</div>
<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-arrow-up" aria-hidden="true"></i>
</button>

<style>
#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: #EC2028;
  color: white;
  cursor: pointer;
  padding: 15px;
  padding-top:10px;
  padding-bottom:10px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #0973BA;
}
</style>
<script>
//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>
<script src="js/jquery-3.2.1.min.js"></script>
 <script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/custom.js"></script>
 <script src="js/about.js"></script>
 <script src="js/sweetalert2@8.js"></script>
 <script src="js/contact.js"></script>
   
</body>
</html>