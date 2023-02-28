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
		<?php include('includes/desktopmenu_otherpage.php');?>  		
		 
	</header>

	<!-- Menu -->

<?php include('includes/mobilemenu_other.php');?> 
	

<div class="feature" id="whyus">
		<div class="feature_background" style="background-image:url(images/courses_background.jpg)"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<h2 class="section_title">Token Missmatch</h2>
						 
					</div>
				</div>
			</div>
			<div class="row feature_row">

				<!-- Feature Content -->
				<div class="col-lg-12 feature_col">
					<div class="feature_content">
						<!-- Accordions -->
						<div class="accordions">
							
							<div class="elements_accordions">

								<div class="accordion_container" style="height:450px;">
								<div class="text-center">
								 
								<i class="fa fa-exclamation-triangle" style="font-size:150px;color:#dc3545"  aria-hidden="true"></i>

</div>
									<h3 class="text-center">Error page</h3>
									<p></p>
									 <p class="text-center">You are not in right page, check menu section and navigate</p>
									 
									 
								</div>

							 

							 

							 



							</div>

						</div>
						<!-- Accordions End -->
					</div>
				</div>
</div>
		</div>
	</div>

	
		
	</div>

 
		
	<!-- Footer -->
<?php include('includes/footer.php');?> 
 
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
   <script>
   function isNumber(evt) {
			var iKeyCode = (evt.which) ? evt.which : evt.keyCode
			if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
			return false;
			
			return true;
			}   
   	function refreshCaptcha() {
		$("#captcha_code").attr('src','captcha_php_custom/captcha_code.php');
		}
   </script>
</body>
</html>