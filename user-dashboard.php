<?php
include('config/config.php');
?>
<?php
include('config/auth.php');
?>
<?php


function CheckHowmanyCourseCompleted(){
	global $conn;
	if($stmt = $conn->prepare("SELECT count(*) as tot FROM tbl_seminar_certificate_details WHERE DATE(`certicated_created_on`) = CURDATE() AND `userid`=?")){		
		$stmt -> bind_param('i',$_SESSION['loginid']);
		if($stmt -> execute()){
		$stmt -> store_result();
        $totalrows=$stmt->num_rows;	
		$stmt -> bind_result($tot);         
		$stmt -> fetch();
		if($totalrows>0){			
			return $tot;
		}else{
			
			return 0;
		}	
		
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}
	
}



if(isset($_SESSION['autoupdate_on'])){
//print_r($_SESSION['autoupdate_on']);
}

$readingsemid=0;
if(isset($_GET['semn'])){
$readingsemid = safe_decode($_GET['semn']);
}
if(!is_numeric($readingsemid)){
header('location:my_seminars.php');	
}

if(empty($readingsemid)){
header('location:my_seminars.php');
}

$readingleftid ='';
if(isset($_GET['leftid'])){
$readingleftid =  safe_decode($_GET['leftid']);
}
if(!is_numeric($readingleftid) && isset($readingleftid) && !empty($readingleftid)){
header('location:my_seminars.php');	
}



/*$val1 = '2020-10-17 05:21:35';
$val2 = '2020-10-17 05:21:44';

$datetime1 = new DateTime();
$datetime2 = new DateTime('2010-10-17 05:21:35');
$interval = $datetime1->diff($datetime2);
$elapsed = $interval->format('%y years %m months %a days %h hours %i minutes %s seconds');
*/
//echo $elapsed;

//echo '<br/>';
/*$start = strtotime('17-10-2020 05:21:35');
$end = strtotime('17-10-2020 06:21:36');
$second = (int)(($end - $start));*/


?>
<?php 
                $booked_seminid =''; 
				$sql_fetch_booked_course_for_study = "SELECT course_ids FROM `payments` WHERE userid=".$_SESSION['loginid'];

				if($stmt = $conn->prepare($sql_fetch_booked_course_for_study)){	

				// Attempt to execute the prepared statement
				if($stmt->execute()){
				// Records fetched successfully.   
				$stmt -> store_result();
				$totalrows_semin22=$stmt->num_rows;
				if($totalrows_semin22 > 0){
				$stmt -> bind_result($course_ids);
                					
				while($stmt -> fetch()) {
				$booked_seminid.=$course_ids.','; 	
				}
                $booked_seminid = rtrim($booked_seminid,',');				
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



$seminarnames_array=array();
$seminarids_array=array();	
 
if (strpos($booked_seminid, $readingsemid) !== false) {
//ok
}else{
header('location:my_seminars.php');
exit;
}

 


if(!empty($booked_seminid)){

$sql_fetch_seminarnames = "SELECT id,planname FROM `tbl_plans` WHERE categoryname=1 AND deleted_status=0 AND id IN($readingsemid) ORDER BY display_order ASC";
if($stmt = $conn->prepare($sql_fetch_seminarnames)){	

// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.   
$stmt -> store_result();
$totalrows_semin=$stmt->num_rows;
if($totalrows_semin > 0){
	$stmt -> bind_result($seminarid,$seminarname);	
	while($stmt -> fetch()) {	
	array_push($seminarnames_array,$seminarname);
	array_push($seminarids_array,$seminarid);
	
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
	
}
 
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
<?php 		 if(CheckHowmanyCourseCompleted()>0){ ?>
	
	<div class="row feature_row text-danger">
	<div class="col-md-12 text-center">You can only do 1 seminar per day</div>
	</div>
	
	
<?php }else{

?>
			<div class="row feature_row">

				<!-- Feature Content -->
				<div class="col-lg-4">
				<div class="borderallsection">
				<div class="sidebar_section_title">Course Details</div>
                   <p id="hiddenmsg" style="padding:10px;background-color:#28a745;color:#ffffff;display:none"><i class="fa fa-bell-o" aria-hidden="true"></i>
 You have to spend at least <span class="dynamictime"></span> minute on last topic</p>
				 <ul id="tree1">
                  
				  
			 
			 
			 <?php 
			 
			 if(count($seminarnames_array)>0){?>
			 <?php for($z=0;$z<count($seminarnames_array);$z++){?>
			   <li><a href="#"><?php echo $seminarnames_array[$z]; ?></a>

                    <ul>
					 
<?php 
$sql_topics = "SELECT id,seminar_title_name FROM `tbl_seminar_content` WHERE seminartypename=? AND deleted_status=0 ORDER BY display_order ASC";
if($stmt = $conn->prepare($sql_topics)){	

// Bind variables to the prepared statement as parameters
$stmt->bind_param("i",$seminarids_array[$z]);
 
// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.   
$stmt -> store_result();
$totalrows_semintop=$stmt->num_rows;
if($totalrows_semintop > 0){
	$stmt -> bind_result($topicid,$seminar_title_name);	
	$countstart=1;
	while($stmt -> fetch()) { ?>
	 <li id="onlyforcolortopic_<?php echo $countstart.$seminarids_array[$z];?>" class="removeseletedcolor autoclickset_<?php echo $topicid;?><?php echo $seminarids_array[$z];?> removeseminarlicolor seminarlicount<?php echo $seminarids_array[$z];?>" onclick="return FetchSeminarData(<?php echo $countstart;?>,<?php echo $seminarids_array[$z];?>,<?php echo $topicid;?>)"><?php echo $seminar_title_name;?><input type="hidden" value="<?php echo $topicid;?>" id="dynamictopic_<?php echo $countstart.$seminarids_array[$z];?>"/></li>
	 <input type="hidden" value="<?php echo trim(getTimeofTopic($seminarids_array[$z],$topicid));?>" id="topic_time_chk_<?php echo $countstart.$seminarids_array[$z];?>" class="update_time_automatically_<?php echo $seminarids_array[$z].$topicid;?>"/>

	 <input type="hidden" value="<?php echo trim($topicid);?>" id="topic_id_chk_dynamic<?php echo $countstart.$seminarids_array[$z];?>"/>
	 
	<?php $countstart++; }	
	 
}else{
	//Zero rows	
	?>
	 <li>No Topics available</li>
	<?php 
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
                       
      <li onclick="return getCertificate(<?php echo ($countstart-1);?>,<?php echo $readingsemid;?>)" style="color:#262261;cursor:pointer">Certificate<span id="certificatelad"></span>
	  <p style="color:red;font-weight:bold">( Must print in color to be valid )</p>
	  </li>           
                    </ul>
                </li>
			 <?php }?>
			 <?php }else{
				 
				 echo '<p class="mt-5 ml-4">You have not Booked any Seminar yeat</p>';
			 }?>
			 
              
				
				
				
            </ul>
			
		 
    
				</div>
                 </div>
				<!-- Feature Video -->
				<div class="col-lg-8">
				<div class="content-seminar-section">
				
				
				
				
				<div class="ajax_response_area">
				
				<div class="messagetouser">
				<p><i class="fa fa-file-pdf-o" aria-hidden="true" style="font-size:40px;color:red"></i></p>
<i class="fa fa-hand-o-left" aria-hidden="true" style="color:red"></i>
 Online Course Content will be available here, please click on seminar available on left section </div>
				 
				
				</div>
				
    			
					  
             	</div>	
	
				</div>
			</div>
			
<?php } ?>
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
<script src="js/treeview.js"></script>
<script>
function FetchSeminarData(countno,seminarid,topicid){
			var activestatus=0;
	if(countno==0 || seminarid==0 || topicid==0){
	alert("Something went wrong");
	return false;	
	}else if(countno!=0 && seminarid!=0 && topicid!=0){
	if(countno>1 && seminarid!=0){
	
    var topic_id_chk_dynamic_fetch = $("#topic_id_chk_dynamic"+(countno-1)+seminarid).val();	
    skiptimevar=0;
	$.post('getSkiptime_ajax.php',{fetchid:topic_id_chk_dynamic_fetch},function(data){
	//alert(data);
	var skiptimevar = parseInt(data);
    var compval = parseInt($("#topic_time_chk_"+(countno-1)+seminarid).val());
	//Start
	var min_skiptimevar = Math.floor(skiptimevar / 60);

	if(compval<skiptimevar){
	$(".dynamictime").html(min_skiptimevar);
	$("#hiddenmsg").slideDown( "slow" );
	
	//alert('in wrong ');	 
	return false;	
	}else{
		//alert('IN');
	$("#hiddenmsg").hide();	
	 
	 
	 //STAT		
	
$('.loaderimgrem').remove();
	$('#dynamictopic_'+countno+seminarid).after('<img src="images/ajax-loader.gif" class="loaderimgrem">');
    $(".ajax_response_area").html('<div class="text-center" style="font-size: 20px;padding-top: 150px;"><i class="fa fa-spinner"></i> Please wait...</div>'); 
	
	var countsemtotaltopic = $('.seminarlicount'+seminarid).length;
	$(".removeseminarlicolor").css("color",'inherit');
    $("#onlyforcolortopic_"+countno+seminarid).css('color','red');	
	 
	$.post('getseminartopicdata_ajax.php',{countno:countno,seminarid:seminarid,fetchid:topicid,countsemtotaltopic:countsemtotaltopic},function(response){
 	var jsondataprint = $.parseJSON(response);	
	var succorerr = jsondataprint[0];
	 
	if(succorerr==1){
	var allcontent = jsondataprint[1];
	$(".ajax_response_area").html(allcontent); 	
	$('.loaderimgrem').remove();	
		
	}else{
	alert("Data not available");
$('.loaderimgrem').remove();	
	} 
	});	
			//END
	 
	 
	}
	//END
	
	})	
 		
	return false;	
			
	}else{
		
			//STAT		
	
$('.loaderimgrem').remove();
	$('#dynamictopic_'+countno+seminarid).after('<img src="images/ajax-loader.gif" class="loaderimgrem">');
    $(".ajax_response_area").html('<div class="text-center" style="font-size: 20px;padding-top: 150px;"><i class="fa fa-spinner"></i> Please wait...</div>'); 
	
	var countsemtotaltopic = $('.seminarlicount'+seminarid).length;
	$(".removeseminarlicolor").css("color",'inherit');
    $("#onlyforcolortopic_"+countno+seminarid).css('color','red');	
	 
	$.post('getseminartopicdata_ajax.php',{countno:countno,seminarid:seminarid,fetchid:topicid,countsemtotaltopic:countsemtotaltopic},function(response){
 	var jsondataprint = $.parseJSON(response);	
	var succorerr = jsondataprint[0];
	 
	if(succorerr==1){
	var allcontent = jsondataprint[1];
	$(".ajax_response_area").html(allcontent); 	
	$('.loaderimgrem').remove();	
		
	}else{
	alert("Data not available");
$('.loaderimgrem').remove();	
	} 
	});	
			//END
		
	}	

	 
		
	}
	
}

function Forwardata(slc,seminno){
if(slc!=0 && seminno!=0){
var topicidget = $("#dynamictopic_"+slc+seminno).val();
//alert(topicidget);	
FetchSeminarData(slc,seminno,topicidget)	
}	
}
function Backwardata(slc,seminno){
if(slc!=0 && seminno!=0){
var topicidget = $("#dynamictopic_"+slc+seminno).val();
//alert(topicidget);	
FetchSeminarData(slc,seminno,topicidget)	
}	
}

</script>
<script>
/*function UpdateReadingTimeOfuser(){
 $.ajax({
  url: 'updatereadingstatus_ajax.php',
  type: 'post',
  success: function(response){
   // Perform operation on the return value
   console.log(response);
  }
 });
}

$(document).ready(function(){
 setInterval(UpdateReadingTimeOfuser,5000);
});
*/
function getCertificate(val1,val2){




var topic_id_chk_dynamic_fetch = $("#topic_id_chk_dynamic"+(val1)+val2).val();	
    skiptimevar=0;
	$.post('getSkiptime_ajax.php',{fetchid:topic_id_chk_dynamic_fetch},function(data){
	//alert(data);
	var skiptimevar = parseInt(data);
    var compval = parseInt($("#topic_time_chk_"+(val1)+val2).val());
	//Start
	var min_skiptimevar = Math.floor(skiptimevar / 60);

	if(compval<skiptimevar){
	$(".dynamictime").html(min_skiptimevar);
	$("#hiddenmsg").slideDown( "slow" );
	}else{
		$("#hiddenmsg").slideUp( "slow" );
		//===========================
		
		
    $(".removeseletedcolor").css('color','inherit');
    $('.loaderimgrem').remove();


	
	$('#certificatelad').after('<img src="images/ajax-loader.gif" class="loaderimgrem">');
    $(".ajax_response_area").html('<div class="text-center" style="font-size: 20px;padding-top: 150px;"><i class="fa fa-spinner"></i> Please wait...</div>'); 
	 
		
$.post('get_certificate_details.php',{semid:<?php echo $readingsemid;?>},function(data){

if(data==1){
 
$.post('TCPDF-main/examples/custom_certificate.php',{semid:<?php echo $readingsemid;?>},function(data2){
 
if(data2==2){
$(".ajax_response_area").html('<div class="messagetouser"><p><i class="fa fa-file-pdf-o" aria-hidden="true" style="font-size:40px;color:red"></i></p>Unable to create Certificate now please try again later.</div>');	
 $('.loaderimgrem').remove();
}else{	
$(".ajax_response_area").html(data2);
 $('.loaderimgrem').remove();
}		
})
 
	
}else{

$(".ajax_response_area").html(data);
 $('.loaderimgrem').remove();	
}
})

		
		//================================
		
		
		
	}
	
	});

 


}
</script>
<script>
function SendCertificateByEmail(semid){
    $("#cert_msg").hide();
	$("#certifuicatelink").hide();
	$("#certificateprocess").show();
	 
	$.post('sendallemail_ajax.php',{'forwhatemail':'forcertificateemail',semid:semid},function(data){
	
	console.log(data);
		 
	returndata= $.parseJSON(data);
	

	if(returndata[2]==1){
	$("#certifuicatelink").show();
	$("#certificateprocess").hide();	 	
	$("#cert_msg").css('color','red');
	$("#cert_msg").html(returndata[1]);		
	}else if(returndata[2]==2){
	$("#certifuicatelink").show();
	$("#certificateprocess").hide();	
	$("#cert_msg").show();
	$("#cert_msg").css('font-size','15px');
	$("#cert_msg").css('color','green');
	$("#cert_msg").html(returndata[1]);


	}	
	
    return false;			
	});
		
	
}
 
 </script>
<script>
 
 function Fetch_Reading_Time_Of_user_on_textbox(){
 $.ajax({
  url: 'fetchreadingstatus_ajax.php?semid='+<?php echo $readingsemid;?>,
  type: 'post',
  success: function(response){
   // Perform operation on the return value
   //console.log(response);
   
   var res = response.split("*");
 
$.each( res, function( index, value ){



readingtdata=value.split(",");

$(".update_time_automatically_"+readingtdata[0]).val(readingtdata[1]);

//alert(readingtdata[1]);

});
 
   
   //alert(response);
  }
 });
}

$(document).ready(function(){
 setInterval(Fetch_Reading_Time_Of_user_on_textbox,5000);
});



function UpdateReading_TimeOfuserAutomatically(){
 $.ajax({
  url: 'update_readingstatus_automatically_ajax.php',
  type: 'post',
  success: function(response){
   // Perform operation on the return value
   console.log(response);
  }
 });
}

$(document).ready(function(){
 setInterval(UpdateReading_TimeOfuserAutomatically,5000);
});

</script>

 <script>
 <?php if(!empty($readingleftid)){?>
$(document).ready(function(){
		 $('.autoclickset_'+<?php echo $readingleftid;?>).trigger('click'); 
		 <?php if($readingleftid!=0){?>
		 $(".branch").trigger('click'); 
		 <?php }?>
});
 <?php }?>
</script>
</body>
</html>