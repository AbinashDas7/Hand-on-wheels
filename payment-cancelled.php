<?php
include('config/config.php');
?>
<?php
include('config/auth.php');
?>
 
<!DOCTYPE html>
<html lang="en">
<?php
include('includes/css_js_afterlogin.php');
?>
<body>

<div class="super_container">

	<!-- Header -->


 <?php
include('includes/menu_after_login.php');
?>
 


<div class="feature minheightset">
		<div class="feature_background" style="background-image:url(images/courses_background.jpg)"></div>
		<div class="container">
		 
			<div class="row feature_row">

				<!-- Feature Content -->
				<div class="col-lg-4">
				<?php
				include('includes/leftsidebar_after.php');
				?>
 
                 </div>
				<!-- Feature Video -->
				<div class="col-lg-8">
	  
				<div class="content-seminar-section">
				<div class="content_section_title_after_login">Payment cancelled</div>
			 	<div class="text-danger" style="padding-top:20px;">
 <i class="fa fa-times" aria-hidden="true"></i> Your payment cancelled, please try again 
</div>

				
             	</div>	
	       
	
				</div>
			</div>
		</div>
	</div>

	
		
	</div>


	  
	 
		
 
<?php
include('includes/footer_after_login.php');
?>
	 
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
function Paynow(){
	
	var course_id = $("#course_id").val();
	var item_number = $("#item_number").val();
	if(course_id!=0 && item_number!=0){
	$("#paynow_nookacourse").hide();		
	$("#pplbtn").show();	
	return true;
	}else{
	$(".error_message").html("Please select Seminar");
    $(".error_message").css("color",'red');	
	$("#course_id").focus();
	$("#pplbtn").hide();
	$("#paynow_nookacourse").show();
	return false;	
	}
	
	return false;
}
</script>
<script src="js/jquery-3.2.1.min.js"></script>
 <script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="js/custom.js"></script>

 
</body>
</html>