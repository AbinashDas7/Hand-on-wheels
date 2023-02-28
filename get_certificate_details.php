<?php

include('config/config.php');

$semid = trim($_POST['semid']);

if(!isset($semid)){

	exit;

}

if(!is_numeric($semid)){

	exit;

}

$allreaddata=array();

$allreaddata_all=array();



if(isset($_SESSION['autoupdate_on'])){



unset($_SESSION['autoupdate_on']);	

	

}
//CLOSE BELOW CODE , because of SKIP TIME CONCEPT START
/*

$sql_fetch_seminarnames = "SELECT tbl_reading_status.topicid FROM `tbl_reading_status`,tbl_seminar_content WHERE tbl_reading_status.courseid=".$semid." AND tbl_reading_status.total_time_spend>=60 AND tbl_reading_status.userid=".$_SESSION['loginid']." and tbl_seminar_content.deleted_status=0 AND tbl_seminar_content.seminartypename=tbl_reading_status.courseid and tbl_reading_status.topicid=tbl_seminar_content.id";

if($stmt = $conn->prepare($sql_fetch_seminarnames)){	

// Attempt to execute the prepared statement

if($stmt->execute()){

// Records fetched successfully.   

$stmt -> store_result();

$totalrows_semin=$stmt->num_rows;

if($totalrows_semin > 0){

$stmt -> bind_result($topicid);	

while($stmt -> fetch()) {	

array_push($allreaddata,$topicid);	 

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



$sql_fetch_all_seminarnames = "SELECT id FROM `tbl_seminar_content` WHERE seminartypename=$semid AND deleted_status=0";

if($stmt = $conn->prepare($sql_fetch_all_seminarnames)){	

// Attempt to execute the prepared statement

if($stmt->execute()){

// Records fetched successfully.   

$stmt -> store_result();

$totalrows_semin2=$stmt->num_rows;

if($totalrows_semin2 > 0){

$stmt -> bind_result($topicid_all);	

while($stmt -> fetch()) {	

array_push($allreaddata_all,$topicid_all);	 

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



$generatepdf = 0;



// Sort the array elements 

sort($allreaddata); 

sort($allreaddata_all); 



// Check for equality 

if ($allreaddata == $allreaddata_all){ 

   $generatepdf = 1;

}else{

   $generatepdf = 0;

}
*/

//CLOSE ABOVE CODE , because of SKIP TIME CONCEPT END

//==================================NEW CONCEPT CODE START =========================================================
$generatepdf = 0;
$checkpendingreading = "SELECT tbl_reading_status.topicid,
tbl_reading_status.total_time_spend,
tbl_seminar_content.skiptime,
TIME_TO_SEC(CONCAT('00:',tbl_seminar_content.skiptime)) AS timeinsec 
FROM `tbl_reading_status`,tbl_seminar_content 
WHERE 
tbl_reading_status.courseid=".$semid." 
AND tbl_seminar_content.skiptime>0
AND tbl_reading_status.userid=".$_SESSION['loginid']." 
AND tbl_seminar_content.deleted_status=0 
AND tbl_seminar_content.seminartypename=tbl_reading_status.courseid 
AND tbl_reading_status.topicid=tbl_seminar_content.id
AND tbl_reading_status.total_time_spend>tbl_seminar_content.skiptime
AND tbl_reading_status.total_time_spend<TIME_TO_SEC(CONCAT('00:',tbl_seminar_content.skiptime))";

if($stmt = $conn->prepare($checkpendingreading)){	

// Attempt to execute the prepared statement

if($stmt->execute()){

// Records fetched successfully.   

$stmt -> store_result();

$ispending_reading_based_ontime=$stmt->num_rows;

if($ispending_reading_based_ontime > 0){

$generatepdf = 0;	 

}else{
   $generatepdf = 1; // No Pending reading
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
//==================================NEW CONCEPT CODE end =========================================================

 


//print_r($allreaddata);

//print_r($allreaddata_all);

?>

<?php 



//Check database



$sql_fetch_certificatename = "SELECT certificatename,is_emailed FROM `tbl_seminar_certificate_details` WHERE seminarid=$semid AND userid=".$_SESSION['loginid'];

if($stmt = $conn->prepare($sql_fetch_certificatename)){	

// Attempt to execute the prepared statement

if($stmt->execute()){

// Records fetched successfully.   

$stmt -> store_result();

$totalcertcount=$stmt->num_rows;

if($totalcertcount > 0){

$stmt -> bind_result($certificatename,$is_emailed);	

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



$certificate_already_available = 0;	

if(isset($totalcertcount) && $totalcertcount>0 && !empty($certificatename)){

$certificate_already_available = 1;	

}else{

$certificate_already_available = 0;		

}







if($generatepdf==1 && $certificate_already_available==0){ 

echo 1;

}else if($generatepdf==0 && $certificate_already_available==0){

	

echo '<div class="messagetouser"><p><i class="fa fa-window-close-o" aria-hidden="true" style="font-size:40px;color:red"></i>

</p><i class="fa fa-hand-o-left" aria-hidden="true" style="color:red"></i>Please read all topic then try again for certificate.</div>';	

	

}else if(isset($certificatename) && $certificatename!='' && $certificate_already_available==1){?>

<table  border="0" width="100%">

<tbody>

<tr>

<td>

<embed src="usercertificates/<?php echo $certificatename;?>" width="100%" height="570px">

</td>

</tr>

<tr>

<td>

<div class="row">

<div class="col mt-2 mb-2">

 <a class="btn btn-warning" id="certifuicatelink" onclick="return SendCertificateByEmail(<?php echo $semid;?>)" href="javascript:void(0)">Email me this Certificate</a>

 <a href="javascript:void(0)" id="certificateprocess" class="btn btn-warning" style="font-weight:bold;display:none"><img src="images/ajax-loader-trans.gif"> Sending...</a>

 <p id="cert_msg" style="display:none"></p>

 <?php if($is_emailed==1){?>

  <p class="text-success">Already you have received email before, but you can try our email system again to receive certificate. </p>

 <?php } ?>



</div>

<div class="col mt-2 mb-2">

<a class="btn btn-success" target="_blank" href="usercertificates/<?php echo $certificatename;?>">Full View Certificate/Print Certificate</a>

<p style="color:red;font-weight:bold"><i class="fa fa-bell-o" aria-hidden="true"></i> Must print in color to be valid</p>

</div>

</div>

</td>

</tr>

</tbody></table>

<?php } ?>





