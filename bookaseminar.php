<?php

include('config/config.php');

?>

<?php

include('config/auth.php');

?>

<?php 

$seminarnames_array_booknow=array();

$seminarids_array_booknow=array();

$seminarprice_array_booknow=array();



$sql_fetch_seminarnames_booknow = "SELECT id,planname,price FROM `tbl_plans` WHERE categoryname=1 AND deleted_status=0 AND id IN(1,2,3) ORDER BY display_order ASC";

if($stmt = $conn->prepare($sql_fetch_seminarnames_booknow)){	



// Attempt to execute the prepared statement

if($stmt->execute()){

// Records fetched successfully.   

$stmt -> store_result();

$totalrows_semin=$stmt->num_rows;

if($totalrows_semin > 0){

$stmt -> bind_result($seminarid,$seminarname,$price);	

while($stmt -> fetch()) {



array_push($seminarnames_array_booknow,$seminarname.'- $'.$price);

array_push($seminarids_array_booknow,$seminarid);

array_push($seminarprice_array_booknow,$price);



}



$newp = array_sum($seminarprice_array_booknow)-(int)15; 

array_push($seminarnames_array_booknow,'All 3 Seminars (Save $15) Price - $'.$newp);

array_push($seminarids_array_booknow,implode(',',$seminarids_array_booknow));

	

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

				<?php

				include('includes/leftsidebar_after.php');

				?>

 

                 </div>

				<!-- Feature Video -->

				<div class="col-lg-8">

	 

	

				<form method="post" onsubmit="return Paynow()" action="<?php echo BASEURL;?>paypal-rest-api-master/src/request.php">

				

				<div class="content-seminar-section">

				<div class="content_section_title_after_login">Book a new seminar</div>

				 <div class="row mt-2">

				<div class="col-md-6">

				<div class="form-group course_id_section">               		  

				<label>All available Course(Seminars) <span class="star">*</span></label>

				<select name="course_id" id="course_id" class="form-control" required="required">				

				<option value="0">Please Select Course</option>

				<?php 

				if(count($seminarnames_array_booknow)>0){?>

				<?php for($z=0;$z<count($seminarnames_array_booknow);$z++){?>

				<option <?php if(isset($_SESSION['course_id_selected_reg']) && $_SESSION['course_id_selected_reg']==$seminarids_array_booknow[$z]){?> selected <?php }?> value="<?php echo $seminarids_array_booknow[$z];?>"><?php echo $seminarnames_array_booknow[$z];?></option>

				<?php 

				} 

				}

				?>



				</select>

				<p><font class="error_message"></font></p>

				</div>

				</div>

				<div class="col-md-4">

				<div class="form-group course_id_section">               		  

				<label></label>

				<p>

				 <input type="hidden" name="item_number" id="item_number" value="123456" / >

				<button type="submit" name="paynow_nookacourse" class="rmvbrd" id="paynow_nookacourse" value="." style="border:none;outline:none;cursor:pointer">

				<img src="images/paypalbtn.jpg" style="width:220px;border:none;outline:none">

				</button>

				<a href="javascript:void(0)" class=" btn btn-success" id="pplbtn" style="background-color:#0973BA;border:1px solid #0973BA;display:none"><i class="fa fa-circle-o-notch fa-spin fa-1x fa-fw"></i> Please wait, redirecting to paypal...</a>

				

				

				

				</p>

				</div>

				

				

				</div>

				</div>

						<div class="row mt-2">
				<div class="col-md-6">
				<div class="form-group course_id_section">               		  
				<label>Do you have Coupon Code ?</label>
			    <input type="text" name="CouponCode" value="" class="form-control" id="CouponCode" autocomplete="off">
				<div class="message_cpn_user mt-2"></div>
				<p><br/><input type="button" name="applycouponcode" onclick="return CheckCouponCode()" id="applycouponcode" class="btn btn-success" value="Get New Price"></p>
				<p><font class="error_message_cpn"></font></p>
				</div>
				</div>
				<div class="col-md-4">
				
				</div>
				</div>



 <div class="row mt-2">

				<div class="col-md-6">

				<div class="form-group course_id_section">

				<p><img src="images/unnamed.png"></p>

				</div>

				</div>

				<div class="col-md-6">

				<div class="form-group course_id_section">

				<p><img class="img-responsive" src="images/paywithcard.png"></p>

				</div>

				</div>

				</div>



				

             	</div>	

	        </form>

	

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

<script>
function CheckCouponCode(){
var CouponCode = $("#CouponCode").val();
var course_id = $("#course_id").val();
if(CouponCode==0){
$("#CouponCode").focus();
$(".error_message_cpn").html("Enter Coupon Code");	
$(".error_message_cpn").css('color','red');	
$(".error_message").html("");
}else if(course_id==0){
$("#course_id").focus();
$(".error_message").html("Please select Seminar");	
$(".error_message").css('color','red');	
$(".error_message_cpn").html("");
}else{
$(".error_message_cpn").html("");
$(".error_message").html("");
$(".error_message_cpn").html("Please wait...");
$(".error_message_cpn").css('color','green');	
$("#applycouponcode").hide();
$.post('coupon_ajax_calculation.php',{'what_doing':'couponchk','course_id':course_id,'CouponCode':CouponCode},function(data){
	//alert(data);
	$("#applycouponcode").show();
	$(".error_message_cpn").html("");
	$(".message_cpn_user").html('');	
	          jasondata= $.parseJSON(data);
			  $.each(jasondata, function(key, value){
				  
				if(jasondata[2]==1){
					
				$(".error_message_cpn").html(jasondata[1]);	
				$(".error_message_cpn").css('color','green');	
				$(".message_cpn_user").html(jasondata[3]);	
				$(".message_cpn_user").css('color','green');	
				
				}else if(jasondata[2]==3){
				$(".error_message_cpn").html(jasondata[1]);	
				$(".error_message_cpn").css('color','red');		
					
				}  
				  
			  })
})

}	
	
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