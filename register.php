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
 $seminarnames_array=array();
 $seminarids_array=array();
 $seminarprice_array=array();
$sql_fetch_seminarnames = "SELECT id,planname,price FROM `tbl_plans` WHERE categoryname=1 AND deleted_status=0 AND id IN(1,2,3) ORDER BY display_order ASC";
if($stmt = $conn->prepare($sql_fetch_seminarnames)){	

// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.   
$stmt -> store_result();
$totalrows_semin=$stmt->num_rows;
if($totalrows_semin > 0){
	$stmt -> bind_result($seminarid,$seminarname,$price);	
	while($stmt -> fetch()) {
	
	array_push($seminarnames_array,$seminarname.'- $'.$price);
	array_push($seminarids_array,$seminarid);
	array_push($seminarprice_array,$price);
	}	
	$newpr = array_sum($seminarprice_array)-(int)15; 
array_push($seminarnames_array,'All 3 Seminars (Save $15) Price - $'.$newpr);
array_push($seminarids_array,implode(',',$seminarids_array)); 
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
  
  <?php 
 $statenames_array=array();
 $stateids_array=array();
 
$sql_fetch_statedetails = "SELECT id,state_name FROM `tbl_state` ORDER BY state_name ASC";
if($stmt = $conn->prepare($sql_fetch_statedetails)){	

// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.   
$stmt -> store_result();
$totalrows_state=$stmt->num_rows;
if($totalrows_state > 0){
	$stmt -> bind_result($stateid,$statename);	
	while($stmt -> fetch()) {
 
	array_push($stateids_array,$stateid);
	array_push($statenames_array,$statename);
	}	
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
		<div class="feature_background"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<h2 class="section_title">Register Online</h2>
						 
					</div>
				</div>
			</div>
			<div class="row">

				<!-- Feature Content -->
				<div class="col-lg-12 feature_col">
					<div class="feature_content">
						<!-- Accordions -->
						<div class="accordions">
							
							<div class="elements_accordions">

								<div class="boxed_container">
									 
									 <div class="customheading">Information</div>
										<p>Each Seminar Course is equivalent to 6 Hours of Continued Education. You must complete all three course to satisfy the DMV's 18 Hour Requirement for your license renewal. Make sure you do not register for the same Seminar twice. You are only allowed to take one course per day. You may take the classes in any order just as long as you take all three. Upon completion of each Seminar, you will be able to email and/or print your completion certificate. You will need to turn in all 3 Completion Certificates to the DMV with your renewal documents to satisfy this requirement.</p><p>

"Per the California Vehicle Code Section 11105, Paragraph 2 of Subdivision B state that an Instructor or Operator must Satisfactory completion of an examination as provided in Section 11102.5 at least once during each succeeding three-year period after the initial issuance of a license certificate. In lieu of any examination for renewal of the license, the department may accept submission by the licensee of evidence of continuing professional education (18 Hours). Professional education, as used in this subdivision, means satisfactory completion of courses related to traffic safety, teaching techniques, or the teaching of driver instruction acceptable to the department or participation in professional seminars approved by the department."</p>
									 
								</div>
 

							</div>

						</div>
						<!-- Accordions End -->
					</div>
				</div>

			</div>
			
		<div class="row">
		 
<div class="regform mt-5" style="margin: 0 auto;">
 

           <form method="post" name="frm1" id="form_sample_1" autocomplete="off" onSubmit="return insert_data()" >   
		 <div class="col-md-12 col-lg-12">
<span id="success_insert"></span> 
			  <div class="boxed_container">
			   <div class="customheading"><i class="fa fa-user" aria-hidden="true"></i> Provide Personal Details</div>
			
			    <div class="row">
			  
			     <div class="col-md-4">

               <div class="form-group fname_section">
               	 
                  <label>First Name <span class="star">*</span></label>
                  <input type="text" name="fname" id="fname" value="" class="form-control">
				   <p><font class="error_message"></font></p>

               </div>
               </div>
			   
			    <div class="col-md-4">
               <div class="form-group lname_section">
              	   
                  <label>Last Name <span class="star">*</span></label>
                  <input type="text" name="lname" id="lname" value="" class="form-control">
				  <p><font class="error_message"></font> </p>
               </div>
               </div>
			   
			      <div class="col-md-4">
                 <div class="form-group phone_section">
                  
                  <label>Phone <span class="star">*</span></label>
                  <input placeholder="Enter 10 digit number" name="phone" id="phone" type="text" maxlength="10" value="" onkeypress="return isNmb(event)" class="form-control">
                 
           <p><font class="error_message"></font></p>
               </div>
              
               </div>
			   
			    <div class="col-md-4">
               <div class="form-group">
               	
                  <label>Gender <span class="star">*</span></label>
                  <div class="field_group gender frm_gender_section">
                     <label class="radio">
                     <input type="radio" name="frm_gender" id="frm_gender" value="Male" checked="checked" > <span>Male</span>
                     </label>
                     <label class="radio">
                     <input type="radio" name="frm_gender" id="frm_gender2" value="Female"> <span>Female</span>
                     </label>
                  </div>
				 	<p><font class="error_message"></font></p>   
               </div>
               </div>
				
				<div class="col-md-4">
				<div class="form-group">

				<label>Date of Birth <span class="star">*</span></label>
				
				<div class="form_group dob_date_section">
				<input type="text" name="dob_date" id="dob_date" readonly class="form-control datepickerinput">

				</div>

				<p><font class="error_message"></font></p>

				</div>
				</div>
			   
			   
			   
			   
			   </div>
			   
			  
			  
			  <!--Box End-->
			  </div>
			  
			  
			  <div class="boxed_container mt-5">
			  <div class="customheading"><i class="fa fa-lock" aria-hidden="true"></i> Provide Login Authentication</div>
			       <div class="row">
               <div class="col-md-4">
               <div class="form-group email_section">
               	   
                  <label>User Name/Email Address <span class="star">*</span></label>
                  <input type="text" name="email" id="email" value="" onblur="return Checkavailablity(this.value)" class="form-control">
				  <p><font class="error_message emailloadingmessage"></font></p>
               </div>
               </div>
			        <div class="col-md-8">
 <label></label>
 <div class="text-info"><i class="fa fa-at" aria-hidden="true"></i> We will not accept spamer so please enter the correct email address, we will send you verification code</div>
 <p class="emailvalidatestatus"></p>
               </div>
			   </div>
			   <div class="row verificationblockrow" style="display:none">
			    <div class="col-md-4">

               <div class="form-group verificationcode_section">
               	 
                  <label>Email verification code <span class="star">*</span></label>
                  <input type="text" name="verificationcode" id="verificationcode" value="" maxlength="4" class="form-control">
				   <p><font class="error_message"></font></p>

               </div>
				
               </div>
			     <div class="col-md-8">
 
 <div>
 <a style="font-size:20px;" href="javascript:void(0)" onclick="return SendCode()" id="sendvcode">Click here to get verification code in email</a>
 <p id="emailshowmsg" style="display:none"></p>
 </div>

 <p class="text-success">
 <i class="fa fa-hand-o-left" aria-hidden="true"></i>
 Please enter the verification code on "Email verification code" box.</p>
               </div>
			   </div>
				<div class="row">
                
                 <div class="col-md-4">
               <div class="form-group new_password_section">
                 
                  <label>Password <span class="star">*</span></label>
                   <input name="new_password" id="new_password" type="password" maxlength="15" value="" class="form-control">
				   <p>   <font class="error_message"></font></p>
               </div>
               </div>
			   
					<div class="col-md-4">
					<div class="form-group c_password_section">

					<label>Confirm Password <span class="star">*</span></label>
					<input name="c_password" id="c_password" type="password" maxlength="15" value="" class="form-control"> 
					<p><font class="error_message"></font></p>
					</div>
					</div>
					
               </div>
			  </div>
			  
			  
			  
			  <div class="boxed_container mt-5">
			  <div class="customheading"><i class="fa fa-address-card" aria-hidden="true"></i> Provide Comunuication Details</div>
			   <div class="row">
			   <div class="col-md-12">

				<div class="form-group address1_section">

				<label>Your Mailing Address <span class="star">*</span></label>
				<textarea name="address1" id="address1" cols="" rows="" class="form-control"></textarea>
				<p><font class="error_message"></font></p>
				</div>
				</div>
              <div class="col-md-4">
               <div class="form-group city_section">
                  
                  <label>City <span class="star">*</span></label>
                  <input type="text" name="city" id="city" value=""  class="form-control">
				  <p><font class="error_message"></font></p>
               </div>
               </div>
                 <div class="col-md-4">
               <div class="form-group state_section">
                  
                    <label>State <span class="star">*</span></label>
					
					
					<select name="state" id="state" class="form-control">
				
				<option value="0">--Select State--</option>
				<?php 
				if(count($statenames_array)>0){?>
				<?php for($i=0;$i<count($statenames_array);$i++){?>
           <option value="<?php echo $stateids_array[$i];?>"><?php echo $statenames_array[$i];?></option>
				<?php 
				} 
				}
				?>
			 
				</select>
					
					
					<p><font class="error_message"></font></p>
               </div>
               </div>
                 <div class="col-md-4">
               <div class="form-group zip_section">
               	  
                  <label>Zip <span class="star">*</span></label>
                  <input type="text" name="zip" id="zip" maxlength="10" value=""  class="form-control" onkeypress="return isNmb(event)">
				  <p><font class="error_message"></font></p>
               </div>
               </div>
			   	
				
				
				
               </div>
               
			   
			   <!--End-->
			   </div>
			  
			   <div class="boxed_container mt-5">
			   <div class="customheading"><i class="fa fa-info-circle" aria-hidden="true"></i> Provide Other Details</div>
			   
			      <div class="row">
  <div class="col-md-4">
               <div class="form-group school_name_section">
                  
                  <label>School Name: <span class="star">*</span></label>
                  <input type="text" name="school_name" id="school_name" value="" class="form-control">
          <p><font class="error_message"></font></p>
               </div>
               </div>
                 <div class="col-md-4">
               <div class="form-group driver_license_section">
                  
                    <label>Driver License# <span class="star">*</span></label>
                   
                       <input type="text" name="driver_license" id="driver_license" value="" class="form-control">
          <p><font class="error_message"></font></p>
          
               </div>
               </div>
                 
              <div class="col-md-4">
               <div class="form-group school_operator_section">
                  
                  <label> School License#:</label>
                  <input type="text" name="school_operator" id="school_operator" value="" class="form-control">
          <p><font class="error_message"></font></p>
               </div>
               </div>
               </div>
              
			       <div class="row">
 
                 <div class="col-md-4">
               <div class="form-group instructor_license_section">
                  
                    <label>Instructor License# </label>
                   
                       <input type="text" name="instructor_license" id="instructor_license" value="" class="form-control">
         
           <p><font class="error_message"></font></p>
               </div>
               </div>

 

             <div class="col-md-4">
               <div class="form-group operator_license_section">
                  
                    <label>Operator License# </label>
                   
                       <input type="text" name="operator_license" id="operator_license" value="" class="form-control">
          
           <p><font class="error_message"></font></p>
               </div>
               </div>
 
                 <div class="col-md-4">
               <div class="form-group show_certificate_section">
                  
                  <label>Show In Certificate :</label>
                  <select name="show_certificate" id="show_certificate" class="form-control">
                        <option value="0">--Select--</option>
                        
                       
 <option value="Instructor">School Instructor</option>
                        <option value="Operator">School Operator</option>
                        <option value="Both">Both</option>

                        
                       
                    </select>
           <p><font class="error_message"></font></p>
               </div>
               </div>
               </div>
             
			        <div class="row">
                 <div class="col-md-4">
               <div class="form-group ole_date_section">
                    
                    <label>Operators License Expiration Date </label>
                   
                    <div class="form_group">
					<input type="text" name="ole_date" id="ole_date" readonly class="form-control datepickerinput">                
                   
                    </div>
					 <p><font class="error_message"></font></p>
</div>
</div>
<div class="col-md-4">
               <div class="form-group ile_date_section">
                    
                    <label>Instructors License Expiration Date </label>
                  
					<div class="form_group">
					<input type="text" name="ile_date" id="ile_date" readonly class="form-control datepickerinput">
					
                    
                    </div>
					 <p><font class="error_message"></font></p>
</div>
</div>


       <div class="col-md-4">

          <div class="form-group course_id_section">
               
			  
                <label>Course <span class="star">*</span></label>
                <select name="course_id" id="course_id" class="form-control" >
				
				<option value="0"> Please Select Course</option>
				<?php 
				if(count($seminarnames_array)>0){?>
				<?php for($z=0;$z<count($seminarnames_array);$z++){?>
           <option value="<?php echo $seminarids_array[$z];?>"><?php echo $seminarnames_array[$z];?></option>
				<?php 
				} 
				}
				?>
			 
				</select>
				 <p><font class="error_message"></font></p>
               </div>
               </div>

</div>
<div class="form-group">
<input type="hidden" value="process" name="startreg">
<input class="action_btn btn btn-danger" type="submit" name="submit_data" id="submit_data" value="Create Account and Pay on next Step" >
<button style="display:none" class="action_btn btn btn-danger" type="button" name="processingreq" id="processingreq"><i class="fa fa-spinner fa-spin fa-1x fa-fw"></i>
<span class="sr-only">Loading...</span>Processing request...</button>
</div>
</div>
  
			   <!--End-->
			   </div>
			   
			   
			       </form>
			   </div>
 
		   
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




<link rel="stylesheet" href="allp_jqdatepicker/jquery-ui.css">
<!--<script src="allp_jqdatepicker/jquery-1.10.2.js"></script>-->
<script src="allp_jqdatepicker/jquery-ui.js"></script>   

<script>
  $(function() {
    $( ".datepickerinput" ).datepicker({
      changeMonth: true,
      changeYear: true,
	  dateFormat: 'mm-dd-yy',
	  yearRange: "-100:+0"
    });
	 
	 
  });
   
  
  </script>

<script>
function insert_data(){
	 var datastring=$("#form_sample_1").serialize();
	 //alert(datastring);
	 
	 $("#processingreq").show();
	 $("#submit_data").hide();
	 
    $.ajax({    
      type: "POST",
        url: "registration_ajax.php",
        data: datastring,
        success:function(data) {
			//alert(data);
			console.log(data);
			//$("#success_insert").html(data);
			  jasondata= $.parseJSON(data);
			  $.each(jasondata, function(key, value){					  
					//alert(jasondata[0])	
	            //alert(value)						
				
				$("#processingreq").hide();
	             $("#submit_data").show();
				
				$(".form-group .error_message").html('');
				$(".form-group .error_message").hide();
				
				if(jasondata[2]==1){
				
				$(".form-group .error_message").show();
				$("."+jasondata[0]+"_section .error_message").css("color",'red');
				$("."+jasondata[0]+"_section .error_message").html(jasondata[1]);
				$("."+jasondata[0]+"_section #"+jasondata[0]).focus();
				return false;
				}else if(jasondata[2]==2){	
				$(".form-group .error_message").hide();
				//$("."+jasondata[0]+"_section .error_message").css("color",'green');
				$("."+jasondata[0]+"_section .error_message").html(jasondata[1]);	
				//$("#success_insert").html(jasondata[1]);
				window.location = 'bookaseminar.php';
				return false;
				}else {
				alert("Something goes wrong, please try later");	
				 	
				return false;
				}
				
				
			});
								 
          	  
			  //alert(data);
			  
        }
    });
	return false;
}

	function Checkavailablity(val){
	if(val!=0){
	$("#email").prop( "readonly", true );
	$(".emailloadingmessage").html('<i class="fa fa-circle-o-notch fa-spin fa-1x fa-fw"></i> Please wait, checking availablity...');	
    $(".emailloadingmessage").show();	
	$.post('emailcheck_ajax.php',{emailid:val,'what_doing':'emailexistance'},function(data){
	$("#email").prop( "readonly", false );			
	console.log(data);
	    $(".emailloadingmessage").hide();
	    $(".emailloadingmessage").html('');
	emailvalidatedata= $.parseJSON(data);
	$(".emailvalidatestatus").html('');
	if(emailvalidatedata[2]==1){
	$(".emailvalidatestatus").css("color",'red');
	$(".emailvalidatestatus").html(emailvalidatedata[1]);
	$("#email").focus();
	}else if(emailvalidatedata[2]==4){
	$(".emailvalidatestatus").css("color",'red');
	$(".emailvalidatestatus").html('<i class="fa fa-times" aria-hidden="true"></i> '+emailvalidatedata[1]);
	$(".verificationblockrow").hide();
	}else if(emailvalidatedata[2]==5){
	$(".emailvalidatestatus").css("color",'green');
	$(".emailvalidatestatus").html('<i class="fa fa-check" aria-hidden="true"></i> '+emailvalidatedata[1]);	
	$(".verificationblockrow").show();
	}else{
	alert('Unable to verify email address');
	return false;	
	}

	})	
	}
	}
	
	function SendCode(){
	$("#sendvcode").hide();
	$("#emailshowmsg").show();
	$("#emailshowmsg").html('<i class="fa fa-circle-o-notch fa-spin fa-1x fa-fw"></i> Sending email, please wait...');
	$("#emailshowmsg").css('color','red');
	$.post('sendallemail_ajax.php',{'forwhatemail':'forverificatiocode'},function(data){
	
	console.log(data);
		 
	returndata= $.parseJSON(data);
	
	$("#"+returndata[0]).show();
	
	if(returndata[2]==1){
	$("#sendvcode").show();
	$("#"+returndata[0]).show();	
	$("#"+returndata[0]).css('color','red');
	$("#"+returndata[0]).html(returndata[1]);	
	
	}else if(returndata[2]==2){
	$("#sendvcode").show();
	$("#"+returndata[0]).show();
	$("#"+returndata[0]).css('font-size','18px');
	$("#"+returndata[0]).css('color','green');
	$("#"+returndata[0]).html(returndata[1]);
    $("#verificationcode").focus();	
	}	
	
    return false;			
	});
		
	}
	
	function isNmb(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode
    return !(charCode > 31 && (charCode < 48 || charCode > 57));
}
</script>

</body>
</html>

