<?php
include('config/config.php');
?>
<?php
include('config/auth.php');
?>
 <?php 
 
$sql_fetch_seminarnames = "SELECT id,planname,price FROM `tbl_plans` WHERE categoryname=1 AND deleted_status=0 AND id IN(?) ORDER BY display_order ASC";
if($stmt = $conn->prepare($sql_fetch_seminarnames)){	
$stmt->bind_param('i',$_SESSION['course_id_selected_reg']);
// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.   
$stmt -> store_result();
$totalrows_semin=$stmt->num_rows;
if($totalrows_semin > 0){
	$stmt -> bind_result($seminarid,$seminarname,$cprice);	
	$stmt -> fetch();
 
 
	 
}else{
	//Zero rows	
	}
	$stmt->close();
}else{
die('Execute Error:'.$stmt->error);	
}
}else{
die('Prepare Error:'.$conn->error);		
	}	
// Close statement




 
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
				<div class="borderallsection">
				<div class="sidebar_section_title">Welcome</div>
			 <ul class="leftprf">
			<li><?php if(isset($_SESSION['fname'])){echo '<b><i class="fa fa-user" aria-hidden="true"></i> Name:</b><br/>'.$_SESSION['fname'].' '.$_SESSION['lname'];} ?></li>
			<li><?php if(isset($_SESSION['email'])){echo'<b><i class="fa fa-at" aria-hidden="true"></i>Username/Email:</b><br/>'.$_SESSION['email'];} ?></li>
			<li><?php if(isset($_SESSION['phone'])){echo '<b><i class="fa fa-phone" aria-hidden="true"></i> Phone:</b><br/>'.$_SESSION['phone'];} ?></li>
			<li><?php if(isset($_SESSION['acc_created'])){
				echo '<b><i class="fa fa-key"></i>Account created date:</b><br/>'.$_SESSION['acc_created'];} ?></li>
 			 </ul>
				</div>
                 </div>
				<!-- Feature Video -->
				<div class="col-lg-8">
				<div class="content-seminar-section">
				
				
				<div class="afterlogin_welcome"> Payment Details</div>
                 
				<div class="paymentdiv">
				<p>Going to pay for Courss: <br/><?php echo $seminarname;?></p>
				<p>Course Fee: <br/><?php echo '$'.$cprice;?></p>
				<p><a href="#"><img src="images/paypalbtn.jpg" style="width:220px;"></a></p>
    			</div>
				
				<div class="text-center mb-5">
				<p><img src="images/unnamed.png"></p>
				
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
</script>
<script src="js/jquery-3.2.1.min.js"></script>
 <script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="js/custom.js"></script>

 
</body>
</html>