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
				<div class="content_section_title_after_login">Booked Seminar Details</div>
			 	 
				<div>
				<table border="1" cellpadding="10" cellspacing="0" class="mt-2 myseminartable" width="100%">
				 <tr><td><b>Course Name</b></td><td><b>Booked Date</b></td><td><b>Transaction</b></td></tr>
				<?php 
				$sql_fetch_booked_course = "SELECT course_ids,createdtime,payment_amount,transaction_id,invoice_id FROM `payments` WHERE userid=".$_SESSION["loginid"]." ORDER BY createdtime ASC";

				if($stmt = $conn->prepare($sql_fetch_booked_course)){	

				// Attempt to execute the prepared statement
				if($stmt->execute()){
				// Records fetched successfully.   
				$stmt -> store_result();
				$totalrows_semin=$stmt->num_rows;
				if($totalrows_semin > 0){
				$stmt -> bind_result($course_ids,$createdtime,$payment_amount,$transaction_id,$invoice_id);	
				while($stmt -> fetch()) { ?>
               <tr><td><b><?php echo getcoursename($course_ids)?></b></td><td><?php echo date('m-d-Y',strtotime($createdtime));?></td><td><ul><li>Paid amount: <?php echo $payment_amount;?><li><li>Transaction Id: <?php echo $transaction_id;?><li><li>Invoice Id: <?php echo $invoice_id;?><li></ul></td></tr>
			    <tr><td colspan="3" style="padding:20px">
				<div class="row">
				<div class="col-md-6">
                
                
				<?php 
                
                $course_ids_single = explode(',',$course_ids);
                
                if(count($course_ids_single)>0){
                foreach($course_ids_single as $multp){ ?>
                
                <p><a class="btn btn-success sliderseminar" href="user-dashboard.php?semn=<?php echo safe_encode($multp);?>">Start Reading <?php echo getcoursename($multp)?></a>    </p>  
                
                <?php }   } ?>
                
                
                
                
                </div>
				<div class="col-md-6">
              <?php   
                if(count($course_ids_single)>0){
                foreach($course_ids_single as $multp){ ?> 
                <p><a class="btn btn-success"  href="user-dashboard.php?semn=<?php echo safe_encode($course_ids);?>&leftid=<?php echo safe_encode(getLastReadingid($course_ids));?>">Start Reading <?php echo getcoursename($multp)?> ( where you left )</a></p>  
                
                <?php }}?>
                
                </div>
				</div>
				</td></tr>
				<?php }	
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
				</table>
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