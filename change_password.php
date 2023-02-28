<?php
include('config/config.php');
?>
 <?php
include('config/auth.php');
?>
<?php 

//SAVE DATA START
if(isset($_POST['chnagepwd_button_save'])){

//CSRF CHECK START	 
CheckCSRisActive();
//CSRF CHECK END	  
	  
$array_error = array();
$array_success=array();	
$changepwd_current_one = $_POST['changepwd_current_one'];
$chnagepwd_new_first = $_POST['chnagepwd_new_first'];
$chnagepwd_new_one = $_POST['chnagepwd_new_one'];	

if(!empty($changepwd_current_one) && !empty($chnagepwd_new_first) && !empty($chnagepwd_new_one)){  


if(length($changepwd_current_one)<6 || length($changepwd_current_one)>15){	
 array_push($array_error,'Current Password range between 6 to 15 characters allowed');
}

if(count($array_error)==0){
if(length($chnagepwd_new_first)<6 || length($chnagepwd_new_first)>15){	
 array_push($array_error,'New Password range between 6 to 15 characters allowed');
}
}

if(count($array_error)==0){
if(length($chnagepwd_new_one)<6 || length($chnagepwd_new_one)>15){	
 array_push($array_error,'Re Type New Password range between 6 to 15 characters allowed');
}
}


if(count($array_error)==0){
if($chnagepwd_new_first!=$chnagepwd_new_one){	
 array_push($array_error,'New Password & Re Type New Password missmatch');
}
}


if(count($array_error)==0){
if($changepwd_current_one==$chnagepwd_new_one){	
 array_push($array_error,'Current Password & New Password should not be same');
}
}
 

if(count($array_error)==0){	
$stmt = $conn->prepare("SELECT password FROM tbl_registration WHERE id = ?");
$isavailable=0;
if($stmt){
// Bind variables to the prepared statement as parameters
$stmt->bind_param("s", $loginid);
$loginid = $_SESSION["loginid"];
if($stmt->execute()){

$stmt->bind_result($hashed_password);
$stmt->store_result();	
$isavailable=$stmt->num_rows;
$stmt->fetch();
$stmt->close();	

}else{
die("Ececute failed: ".$stmt->error);

}
}

if($isavailable==1){

if(password_verify($changepwd_current_one, $hashed_password)){
 
 // Validate password strength
$error='';
if( !preg_match("#[0-9]+#", $chnagepwd_new_first) ) {
$error .= "Password must include at least one number!";
}

if( !preg_match("#[a-z]+#", $chnagepwd_new_first) ) {
$error .= "Password must include at least one letter!";
}

if( !preg_match("#[A-Z]+#", $chnagepwd_new_first) ) {
$error .= "Password must include at least one CAPS!";
}
 



if($error){
 
array_push($array_error,"Password validation failure(your choise is weak): $error");

}else{


//Ok 


//UPDATE PASSWORD START
$updatepwdquery = "UPDATE tbl_registration SET password=? WHERE id=?";

if($stmt = $conn->prepare($updatepwdquery)){

$stmt -> bind_param('ss',$param_password,$useriddb);

$useriddb = $_SESSION["loginid"];

$param_password = password_hash($chnagepwd_new_first, PASSWORD_DEFAULT); // Creates a password hash

if($stmt -> execute()){	

 array_push($array_success,'Password changed successfully');
 
$stmt -> close();	

}else{
die("Ececute failed: ".$stmt->error);//TEST
			
}

}else{

die("Prepare failed: ".$conn->error); 
}
 
//UPDATE PASSWORD END




}

 
}else{

array_push($array_error,'Current Password is wrong');

}

}

}





}else{
		
 
array_push($array_error,'All fields are mandatory');
 		
		}
	
	 
	}


//SAVE DATA End
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
				 
				<div class="col-lg-8">
	  
				<div class="content-seminar-section">
				<div class="content_section_title_after_login">Change Password</div>
<div class="row">		
		<div class="col-md-6">
 			<div class="widget-content nopadding mt-2">
		<?php 
        //CSRF CALL
        $datacsrf = CSRFTokenValidate();
        ?>   
                            
	 <form class="form-horizontal" method="post" action="" name="chnagepwdform" id="chnagepwdform" onSubmit="return ChnagePwdF()">
     <?php if((isset($array_error) && (count($array_error)>0) || (isset($array_success) && count($array_success))>0)){?>
     <div class="control-group">
     <label class="control-label"></label>
    <div class="controls">
    <?php if(count($array_error)>0){?>
    <span class="warn"><i class="fa fa-exclamation-triangle
    " aria-hidden="true"></i></span>
    <?php } ?>
     <?php if(count($array_success)>0){?>
    <span class="successdata text-success"><i class="fa fa-check-circle" aria-hidden="true"></i>
</span>
    <?php } ?>
     <?php if(count($array_error)>0){echo '<span class="redcolorset text-danger">'.RetriveValidate($array_error[0]).'</span>';}?>
     <?php if(count($array_success)>0){echo '<span class="text-success">'.RetriveValidate($array_success[0]).'</span>';}?>
    </div>     
    </div>
 <?php } ?>
 
 
		 
                
                
                                    
    <div class="control-group form-group">
        <label class="control-label">Current Password:</label>
        <div class="controls">
<input type="password" name="changepwd_current_one" class="form-control" id="changepwd_current_one" autocomplete="off" required maxlength="15">
        </div>
    </div>
                                    <div class="control-group form-group">
                                        <label class="control-label">New Password</label>
                                        <div class="controls">
      <input type="password" name="chnagepwd_new_first" value="" class="form-control"  id="chnagepwd_new_first" autocomplete="off" required maxlength="15">
                                            
                                        </div>
                                    </div>
                                    <div class="control-group form-group">
                  <label class="control-label">Re Type New Password</label>
                                        <div class="controls">
      <input type="password" name="chnagepwd_new_one" class="form-control" value=""  id="chnagepwd_new_one" autocomplete="off" required  maxlength="15">
                                            
                                        </div>
                                    </div>
                                     
                                     
          <div class="form-actions form-group">
                                    
<input type="submit" value="Change Password" name="chnagepwd_button_save" id="chnagepwd_button_save" class="btn btn-success">
 


<button id="chnagepwd_button_save_load" class="btn btn-success  buttonload" style="display:none" >
<i class="fa fa-refresh fa-spin"></i>&nbsp;Processing...
</button>

 
 <p>
 <div class="redcolorset">Note:-</div>
  Password must be within 6 to 15 characters<br/>
 Password must include at least one number!<br/>
 Password must include at least one letter!<br/>
 Password must include at least one CAPS!<br/>
 </p>
 
 
 
   <input type="hidden" name="csrftoken" value="<?php echo $datacsrf;?>"/>
                                    </div>
                                </form>
							</div>
             	</div>
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