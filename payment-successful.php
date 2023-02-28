<?php
include('config/config.php');
?>
<?php
include('config/auth.php');
require 'PHPMailer-5.2-stable/PHPMailerAutoload.php';
require 'PHPMailer-5.2-stable/emailfun.php';
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
				<div class="content_section_title_after_login">Payment Success</div>
			 	<div class="text-success" style="padding-top:20px;">
 <i class="fa fa-check" aria-hidden="true"></i>  Your payment Completed Successfully.</div>
 <p><u>Details Below</u></p>
  <div>
 <ul>
 <li>Transaction Id: <?php if(isset($_SESSION['transaction_id']))echo $_SESSION['transaction_id'];?></li>
 <li>Payment Amount: <?php if(isset($_SESSION['payment_amount']))echo $_SESSION['payment_amount'];?></li>
 <li>Payment Status: <?php if(isset($_SESSION['payment_status']))echo $_SESSION['payment_status'];?></li>
 <li>Invoice Id: <?php if(isset($_SESSION['invoice_id']))echo $_SESSION['invoice_id'];?></li>
 <li>Paid for Course: <?php if(isset($_SESSION['course_id_after_payment']))echo getcoursename($_SESSION['course_id_after_payment']);?></li>

 
 </ul>
 <?php if(isset($_SESSION['transaction_id']) && !isset($_SESSION['emailsentaftercourse'])){?>
 <?php
 
	$emailbody='';	
	$toemail_name=$_SESSION['fname'].' '.$_SESSION['lname'];
	//$subject='Payment Successfully Completed';
	//$emailbody.='Dear '.$toemail_name.', payment successfully completed, ';
	//$emailbody.='your student account available with http://www.topnotchdrivingschool.com';
	
	
	

	//get dynamic email data start
	$get_subject_cont=getEmailtemplateData(2);

	if(!empty($get_subject_cont)){
	$subdata ='';
	$contdata ='';
	$reldata = explode('(**)',$get_subject_cont);
	$subdata = $reldata[0];
	$contdata = $reldata[1];
	}
	//get dynamic email data End






	$subject=$subdata;

	$emailbody=str_replace('{USERNAME}',$toemail_name,$contdata);
	
	$emailbody.='<ul><li>Email ID/Username: '.$_SESSION['email'].'</li>
	<li>Password: given by you</li>
	<li>Transaction Id:'.$_SESSION['transaction_id'].'</li>
	<li>Payment Amount:'.$_SESSION['payment_amount'].'</li>
	<li>Payment Status:'.$_SESSION['payment_status'].'</li>
	<li>Invoice Id:'.$_SESSION['invoice_id'].'</li>
	<li>Paid for Course:'.getcoursename($_SESSION['course_id_after_payment']).'</li> 
	</ul>';

	$cc='';
	$bcc=FROM_EMAIL;
   
	$retem = emailSent($_SESSION['email'],$toemail_name,$subject,$emailbody,$cc,$bcc);	
	if($retem==1){
		$_SESSION['emailsentaftercourse']=1;
	}
 
 ?>
 <?php }?>
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