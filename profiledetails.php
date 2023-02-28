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
<style>p.form-control{border:none;}</style>
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
				<div class="content_section_title_after_login">Profile Details</div>
			 	 
				<div>
				 
				<?php 
				$sql_fetch_userdetails = "SELECT faname,lname,email,phone,address,city,state,zip,school_name,driver_license,school_operator,instructor_license,operator_license,show_certificate,ole_date,ile_date,frm_gender,dob_date,account_created  FROM `tbl_registration` WHERE id=".$_SESSION['loginid'];

				if($stmt = $conn->prepare($sql_fetch_userdetails)){	

				// Attempt to execute the prepared statement
				if($stmt->execute()){
				// Records fetched successfully.   
				$stmt -> store_result();
				$totalrows_semin=$stmt->num_rows;
				if($totalrows_semin > 0){
				$stmt -> bind_result($faname,$lname,$email,$phone,$address,$city,$state,$zip,$school_name,$driver_license,$school_operator,$instructor_license,$operator_license,$show_certificate,$ole_date,$ile_date,$frm_gender,$dob_date,$account_created);	
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
				 
				
				
				<div class="row">
		 
<div class="regform mt-5" style="margin: 0 auto;">
 
  
		 <div class="col-md-12 col-lg-12">
<span id="success_insert"></span> 
			  <div class="boxed_container">
			   <div class="customheading"><i class="fa fa-user" aria-hidden="true"></i> Personal Details</div>
			
			    <div class="row">
			  
			     <div class="col-md-4">

               <div class="form-group fname_section">
               	 
                  <label>First Name <span class="star">*</span></label>
                  <p class="form-control"> <?php echo $faname;?></p>
				   <p><font class="error_message"></font></p>

               </div>
               </div>
			   
			    <div class="col-md-4">
               <div class="form-group lname_section">
              	   
                  <label>Last Name <span class="star">*</span></label>
                  <p class="form-control"> <?php echo $lname;?></p>
				  <p><font class="error_message"></font> </p>
               </div>
               </div>
			   
			      <div class="col-md-4">
                 <div class="form-group phone_section">
                  
                  <label>Phone <span class="star">*</span></label>
                 <p class="form-control"> <?php echo $phone;?></p>
                 
           <p><font class="error_message"></font></p>
               </div>
              
               </div>
			   
			    <div class="col-md-4">
               <div class="form-group">
               	
                  <label>Gender <span class="star">*</span></label>
                 <p class="form-control"> <?php echo $frm_gender;?></p>
				 	<p><font class="error_message"></font></p>   
               </div>
               </div>
				
				<div class="col-md-4">
				<div class="form-group">

				<label>Date of Birth <span class="star">*</span></label>
				
				<div class="form_group dob_date_section">
				  <p class="form-control"> <?php echo date('m-d-Y',strtotime($dob_date));?></p>

				</div>

				<p><font class="error_message"></font></p>

				</div>
				</div>
			   
			   
			   
			   
			   </div>
			   
			  
			  
			  <!--Box End-->
			  </div>
			  
			  
			  <div class="boxed_container mt-5">
			  <div class="customheading"><i class="fa fa-lock" aria-hidden="true"></i> Login Authentication</div>
			       <div class="row">
               <div class="col-md-6">
               <div class="form-group email_section">
               	   
                  <label>User Name/Email Address <span class="star">*</span></label>
                 <p class="form-control"> <?php echo $email;?></p>
				  <p><font class="error_message emailloadingmessage"></font></p>
               </div>
               </div>
			        
                 <div class="col-md-6">
               <div class="form-group new_password_section">
                 
                  <label>Password <span class="star">*</span></label>
                   <p class="form-control">Your given password</p>
				   <p>   <font class="error_message"></font></p>
               </div>
               </div>
			   </div>
		 
			 
			  </div>
			  
			  
			  
			  <div class="boxed_container mt-5">
			  <div class="customheading"><i class="fa fa-address-card" aria-hidden="true"></i> Comunuication Details</div>
			   <div class="row">
			   <div class="col-md-12">

				<div class="form-group address1_section">

				<label>Your Mailing Address <span class="star">*</span></label>
				    <p class="form-control"> <?php echo $address;?></p>
				<p><font class="error_message"></font></p>
				</div>
				</div>
              <div class="col-md-4">
               <div class="form-group city_section">
                  
                  <label>City <span class="star">*</span></label>
                   <p class="form-control"> <?php echo $city;?></p>
				  <p><font class="error_message"></font></p>
               </div>
               </div>
                 <div class="col-md-4">
               <div class="form-group state_section">
                  
                    <label>State <span class="star">*</span></label>
					<p class="form-control"> <?php echo getStatename($state);?></p>
                
					<p><font class="error_message"></font></p>
               </div>
               </div>
                 <div class="col-md-4">
               <div class="form-group zip_section">
               	  
                  <label>Zip <span class="star">*</span></label>
                	<p class="form-control"> <?php echo $zip;?></p>
				  <p><font class="error_message"></font></p>
               </div>
               </div>
			   	
               </div>
               
			   
			   <!--End-->
			   </div>
			  
			   <div class="boxed_container mt-5" style="margin-bottom:20px;">
			   <div class="customheading"><i class="fa fa-info-circle" aria-hidden="true"></i> Other Details</div>
			   
			      <div class="row">
  <div class="col-md-4">
               <div class="form-group school_name_section">
                  
				<label>School Name: <span class="star">*</span></label>
				<p class="form-control"> <?php echo $school_name;?></p>
				<p><font class="error_message"></font></p>
				</div>
				</div>
                 <div class="col-md-4">
               <div class="form-group driver_license_section">
                  
                    <label>Driver License# <span class="star">*</span></label>
                   
                       <p class="form-control"> <?php echo $driver_license;?></p>
          <p><font class="error_message"></font></p>
          
               </div>
               </div>
                 
              <div class="col-md-4">
               <div class="form-group school_operator_section">
                  
                  <label> School License#:</label>
                 <p class="form-control"> <?php echo $school_operator;?></p>
          <p><font class="error_message"></font></p>
               </div>
               </div>
               </div>
              
			       <div class="row">
 
                 <div class="col-md-4">
               <div class="form-group instructor_license_section">
                  
                    <label>Instructor License# </label>
                   
                   <p class="form-control"> <?php echo $instructor_license;?></p>
         
           <p><font class="error_message"></font></p>
               </div>
               </div>

 

             <div class="col-md-4">
               <div class="form-group operator_license_section">
                  
                    <label>Operator License# </label>
                    <p class="form-control"> <?php echo $operator_license;?></p>
           
           <p><font class="error_message"></font></p>
               </div>
               </div>
 
                 <div class="col-md-4">
               <div class="form-group show_certificate_section">
                  
                  <label>Show In Certificate :</label>
				       <p class="form-control"> <?php echo $show_certificate;?></p>
                  
           <p><font class="error_message"></font></p>
               </div>
               </div>
               </div>
             
			        <div class="row">
                 <div class="col-md-6">
               <div class="form-group ole_date_section">
                    
                    <label>Operators License Expiration Date </label>
                   
                    <div class="form_group">
				      

   <p class="form-control"> <?php echo date('m-d-Y',strtotime($ole_date));?></p>					
                   
                    </div>
					 <p><font class="error_message"></font></p>
</div>
</div>
<div class="col-md-6">
               <div class="form-group ile_date_section">
                    
                    <label>Instructors License Expiration Date </label>
                  
					<div class="form_group">
				 
				 <p class="form-control"> <?php echo date('m-d-Y',strtotime($ile_date));?></p>	
                    
                    </div>
					 <p><font class="error_message"></font></p>
</div>
</div>


       

</div>
 <?php echo getAdscall(1); ?>
</div>
  
			   <!--End-->
			   </div>
			   
			   
			     
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