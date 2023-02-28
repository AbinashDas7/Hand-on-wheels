<?php
include('config/config.php');
?>
<?php 
if(isset($_SESSION["loginid"])){
header('Location:afterlogin.php'); //
exit;
}
?>
<?php 
if(isset($_POST['loginbutton'])){
 

$username='';
$password='';
$errormsg1=$errormsg2=$errormsg3=''; 
	 
//CSRF CHECK START	 
CheckCSRisActive();
//CSRF CHECK END	
	if(empty(InputValidate($_POST["username"]))){
	$errormsg1 = "Error: Please enter username.";
	}else if(empty($_POST["password"])){
	$errormsg2 = "Error: Please enter your password.";
	}else if(empty($_POST["captchacodeverify"])){	
	$errormsg3 = "Error: Please enter security code";
	}else if($_POST["captchacodeverify"]!=$_SESSION["captcha_code"]){ 
	$errormsg3 = "Error: Please enter correct security code";
	}
	
	 
// Validate credentials
if(empty($errormsg1) && empty($errormsg2) && empty($errormsg3)){

$username = InputValidate($_POST["username"]);
$password = trim($_POST["password"]);
		
$stmt = $conn->prepare("SELECT id,email,password,account_status,faname,lname,phone,account_created FROM tbl_registration WHERE email = ?");

if($stmt){
	
   // Bind variables to the prepared statement as parameters
   $stmt->bind_param("s", $username);
   

	if($stmt->execute()){
		
	$stmt->bind_result($ids,$user_email,$hashed_password,$account_status,$fname,$lname,$phone,$acc_created);
	$stmt->store_result();	
	$no=$stmt->num_rows;
	$stmt->fetch();
	$stmt->close();	
		
	}else{
	 
	die("Ececute failed: ".$stmt->error);
		
		}
	 

if($no == 1 && $account_status==0){                   

	if(password_verify($password, $hashed_password)){
		 	
		$_SESSION["loggedin"] = true;
		$_SESSION["loginid"] = $ids;
		$_SESSION['fname']= $fname;
		$_SESSION['lname']= $lname;
		$_SESSION['email']= $user_email;
		$_SESSION['phone']= $phone;
		$_SESSION['acc_created'] = date('m-d-Y H:i:s',strtotime($acc_created));
		  
	header("location:afterlogin.php");
	exit;
	}else{		 
	$errormsg2 = "Error: The password you entered was not valid.";	
	}
	}else if($no == 1 && $account_status==1){ 
	$errormsg = "Your account inactivated , Please contact to admin.";
	}else if($no > 1){ 
	$errormsg = "Error: This username contains more than one account, so you can not login";
	}else{
	$errormsg1 = 'Error: No account found with this username.';	 
    }
}else{
	 
	die("Prepare failed: ".$conn->error); 
	}

}
	
}

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
						<h2 class="section_title">Candidate Login</h2>
						 
					</div>
				</div>
			</div>
			<div class="row feature_row">

				<!-- Feature Content -->
				<div class="col-lg-6 feature_col">
					<div class="feature_content">
						<!-- Accordions -->
						<div class="accordions">
							
							<div class="elements_accordions">

								<div class="accordion_container" style="height:450px;">
								<div class="text-center">
								<i style="font-size:150px;color:#0973ba" class="fa fa-lock" aria-hidden="true"></i>
</div>
									<h3 class="text-center">Login Instruction </h3>
									 <p></p>
									 <ul class="login_instruction">
										<li>Use your email address as username.</li>
										<li>Use your password, what you provided in time of registration.</li>
										<li>Use Forgot password Link, if you have lost your current password.</li>
										<li>Enter Captcha / Security code correctly to process login</li> 
										<li>If you don't have Username and password, just create an account with us.</li> 
										 </ul>
									 
								</div>

							 

							 

							 



							</div>

						</div>
						<!-- Accordions End -->
					</div>
				</div>

				<!-- Feature Video -->
				<div class="col-lg-6 feature_col">
					  
					  
					<section class="login-block accordion_container">
    <div class="container">
	<div class="row">
		<div class="col-md-12 login-sec">
		         <?php 
	 //CSRF CALL
	$datacsrf = CSRFTokenValidate();
		 ?>    
		    <form class="login-form" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
			
			
			
			<?php if(isset($errormsg)){?>
			<div class="form-group">
    <label for="exampleInputEmail1" class="text-uppercase"><?php echo $errormsg;?></label>
  
	
  </div>
			<?php }?>  
			
  <div class="form-group">
    <label for="exampleInputEmail1" class="text-uppercase">Email ID / Username</label>
    
	 <input type="text" autocomplete="off" class="form-control" value="<?php if(isset($_POST['username'])){echo $_POST['username'];}?>"   name="username" id="username"   />
	 
	<?php if(!empty($errormsg1)){ ?> 
<p><span class="help-block name_user errorspan"><?php echo $errormsg1;?></span></p>
	<?php } ?> 
    
	
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1" class="text-uppercase">Password</label>
    <input type="password" class="form-control"  name="password" id="password" autocomplete="off" />
	
		<?php if(!empty($errormsg2)){ ?> 
<p><span class="help-block name_user errorspan"><?php echo $errormsg2;?></span></p>
	<?php } ?> 
	
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1" class="text-uppercase">Captcha / Security code</label>
    <input type="text" class="form-control"   maxlength="4"  onkeypress="javascript:return isNumber(event)" name="captchacodeverify" id="captchacodeverify" autocomplete="off">
	
		<?php if(!empty($errormsg3)){ ?> 
<p><span class="help-block name_user errorspan"><?php echo $errormsg3;?></span></p>
	<?php } ?> 
	
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputPassword1" class="text-uppercase"></label>
    <img id="captcha_code" src="captcha_php_custom/captcha_code.php" />
	<i class="fa fa-refresh fa-1x" style="cursor:pointer;padding-left:10px;font-size:20px;" aria-hidden="true" onClick="refreshCaptcha();"></i>
	<p class="text-danger">Enter above 4 digit code in "Security code" Box.</p>
  </div>
  
    <div class="form-group">
	<button type="submit" name="loginbutton" id="loginbutton" class="btn btn-danger"><i class="fa fa-key" aria-hidden="true"></i> Login</button>
	<button type="button" style="display:none" name="loginbuttonhidden" id="loginbuttonhidden" class="btn btn-danger"><i class="fa fa-spinner" aria-hidden="true"></i> Processing</button>
	</div>
   
  <div class="form-group">
   <div> <a href="forgot_password.php">Forgot Password?</a></div>
	 <a href="register.php">Don't have account ?, Create an account now.</a>
   
  </div>
   
  
   <input type="hidden" name="csrftoken" value="<?php echo $datacsrf;?>"/>
</form>  
</div>
</div>
</div>
</section>
					  
					  
					  
					  
					  
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
		
	$("#loginbutton").click(function(){
	$("#loginbutton").hide();		
	$("#loginbuttonhidden").show();	
	});	
   </script>
</body>
</html>