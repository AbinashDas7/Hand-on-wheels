<?php

if(basename($_SERVER['PHP_SELF'])!='updatereadingstatus_ajax.php' && basename($_SERVER['PHP_SELF'])!='getseminartopicdata_ajax.php'){

if(isset($_SESSION['seminartopicread_time']) && $_SESSION['seminartopicread_time']!=''){
unset($_SESSION['seminartopicread_time']);
}
}

if(basename(($_SERVER['PHP_SELF'])!='update_readingstatus_automatically_ajax.php') && (basename($_SERVER['PHP_SELF'])!='function.php') &&  (basename($_SERVER['PHP_SELF'])!='user-dashboard.php')){

if(isset($_SESSION['autoupdate_on']) && $_SESSION['autoupdate_on']!=''){
//unset($_SESSION['autoupdate_on']);
 }
}





//CSRF START===========================
function CSRFTokenValidate(){
$csrflength = 32;
// 1 hour = 60 seconds * 60 minutes = 3600
$_SESSION['csrftoken-expire'] = time() + 1800;
return $_SESSION['csrftoken'] = substr(base_convert(sha1(uniqid(mt_rand())), 16, 36), 0, $csrflength); 
}

function CheckCSRisActive(){
// THEN CHECK FOR THE EXPIRY ON REQUEST
if ($_SESSION['csrftoken']==$_POST['csrftoken']){
if (time() >= $_SESSION['csrftoken-expire']) {
 
//session_destroy();
header('location:tokenmissmatch.php');
exit;	
//return 2;  // EXPIRED - ASK USER TO RELOAD PAGE
} else {
	 
//return 1;  // DO PROCESSING AS USUAL
}
}else{
	
	//session_destroy();
	header('location:tokenmissmatch.php');
	exit;
//return 2; //ERROR 
}
}
//CSRF END==================================
	


	
	
function InputValidate($data) {


$data = trim($data);


$data = stripslashes($data);


$data = htmlentities($data);


return $data;


}

// Function to get the client IP address
function get_client_ip() {
    $ipaddress = '';
    if (isset($_SERVER['HTTP_CLIENT_IP']))
        $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
    else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_X_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
    else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_FORWARDED'];
    else if(isset($_SERVER['REMOTE_ADDR']))
        $ipaddress = $_SERVER['REMOTE_ADDR'];
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

function getcoursename($course_id){
	global $conn;
	if($stmt = $conn->prepare("SELECT planname FROM `tbl_plans` WHERE id IN (".$course_id.")")){
		if($stmt -> execute()){
		$stmt -> bind_result($planname);	
        $crall='';
		while($stmt -> fetch()){
		$crall.=$planname.', ';			
		}
		return rtrim($crall,', ');
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}
	
}


function checkIsAlreadyRead($userid,$course_id,$topicid){
	global $conn;
	if($stmt = $conn->prepare("SELECT id FROM `tbl_reading_status` WHERE userid=? AND courseid=? AND topicid=?")){
		
		$stmt -> bind_param('iii',$userid,$course_id,$topicid);

		if($stmt -> execute()){
		$stmt -> store_result();
        $totalrows=$stmt->num_rows;	
		//$stmt -> bind_result($id);         
		//$stmt -> fetch();
		if($totalrows>0){			
			return 1;
		}else{
			
			return 2;
		}	
		
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}
	
}

function getLastReadingid($course_id){
	global $conn;
	if($stmt = $conn->prepare("SELECT topicid,courseid FROM `tbl_reading_status` WHERE userid=? AND courseid=? ORDER BY insert_date DESC LIMIT 0,1")){
		
		$stmt -> bind_param('ii',$_SESSION['loginid'],$course_id);

		if($stmt -> execute()){
		$stmt -> store_result();
        $totalrows=$stmt->num_rows;	
		$stmt -> bind_result($topicid,$gtcourseid);         
		$stmt -> fetch();
		if($totalrows>0){			
			return $topicid.$gtcourseid;
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


function getTotalTime($userid,$course_id,$topicid){
	
	if($userid!=0 && $course_id!=0 && $topicid!=0){
		
	global $conn;
	if($stmt = $conn->prepare("SELECT total_time_spend FROM `tbl_reading_status` WHERE userid=? AND courseid=? AND topicid=?")){
		
		$stmt -> bind_param('iii',$userid,$course_id,$topicid);

		if($stmt -> execute()){
		$stmt -> store_result();
        $totalrows=$stmt->num_rows;	
		$stmt -> bind_result($total_time_spend);         
		$stmt -> fetch();
		if($totalrows>0){			
		
			return (int)$total_time_spend;
		}else{
			
			return 2;
		}	
		
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}	
	}
	
	
}

function getStatename($stid){
	
	global $conn;
	if($stmt = $conn->prepare("SELECT state_name FROM `tbl_state` WHERE id IN (".$stid.")")){
		if($stmt -> execute()){
		$stmt -> bind_result($state_name);	
        $crall='';
		$stmt -> fetch();
				
		
		return $state_name;
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}	
	
}

 //Only Number start===============================
function numbersonly($str)
{
    return (bool)!preg_match('/^([0-9]*)$/', $str)? FALSE : TRUE;
}
//Only Number end==================================
//Length Check Start================================
function length($str)
{
$str = trim($str);    
if($str!=''){
return strlen($str);
}else{
return 0;
}
}
//Length Check End =======================================
//show data after filter start=====================
function RetriveValidate($var)
{
$var = trim($var) ;
$var = htmlentities($var) ;
return $var;
}
//show data after filter end=====================

/*
* function to encode string
* accepts a string
* returns encoded string
*/
function safe_encode($string) {
    return strtr(base64_encode($string), '+/=', '-_-');
}
/*
* function to decode the encoded string
* accepts encoded string
* returns the original string
*/
function safe_decode($string) {
    return base64_decode(strtr($string, '-_-', '+/='));
}



function getuserName($userid,$what){
	global $conn;
	
		$sql_fetch_userdetails = "SELECT faname,lname,email FROM `tbl_registration` WHERE id=?";
				
	if($stmt = $conn->prepare($sql_fetch_userdetails)){
		
		$stmt -> bind_param('i',$userid);

		if($stmt -> execute()){
		$stmt -> store_result();
        $totalrows=$stmt->num_rows;	
		$stmt -> bind_result($faname,$lname,$email);	
        
		$stmt -> fetch();
		if($totalrows>0){

		if($what=='name'){
        return $faname." ".$lname;

		}else if($what=='email'){
      return $email;

		}			
			 
		}else{
			
			return 2;
		}	
		
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}
	
}

function certificateupdate($userid,$semid,$certificatename){
	
	global $conn;
	
		$sql_fetch_userdetails = "UPDATE tbl_seminar_certificate_details SET is_emailed=1 WHERE userid=? AND seminarid=? AND certificatename=?";
				
	if($stmt = $conn->prepare($sql_fetch_userdetails)){
		
		$stmt -> bind_param('iis',$userid,$semid,$certificatename);

		if($stmt -> execute()){
	  	
		
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}
	
	
}
function getTimeofTopic($courseid,$topicid){
	
	global $conn;
	$userid = $_SESSION['loginid'];
	if($stmt = $conn->prepare("SELECT total_time_spend FROM `tbl_reading_status` WHERE userid=? AND courseid=? AND topicid=?")){
		
		$stmt -> bind_param('iii',$userid,$courseid,$topicid);

		if($stmt -> execute()){
		$stmt -> store_result();
        $totalrows=$stmt->num_rows;	
		$stmt -> bind_result($total_time_spend);         
		$stmt -> fetch();
		
		if($total_time_spend>0){			
			return $total_time_spend;
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


function getEmailtemplateData($fixtableid){
	
	global $conn;
	 
	if($stmt = $conn->prepare("SELECT section_page_title,banner_alt FROM `tbl_email_template_content` WHERE id=?")){
		
		$stmt -> bind_param('i',$fixtableid);

		if($stmt -> execute()){
		$stmt -> store_result();
        $totalrows=$stmt->num_rows;	
		$stmt -> bind_result($section_page_title,$banner_alt);         
		$stmt -> fetch();
		
		if($totalrows>0){			
		return $section_page_title.'(**)'.$banner_alt;
		}else{
		return '';
		}	
		
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}
	
}

function getEmailandPhone($what){
	global $conn;
	
		$sql_fetch_userdetails = "SELECT cont_email,disply_phone,username,company_name,password,port_no,smtp_encryption,hostname FROM `tbl_email_smtp_conf` WHERE id=1";
				
	if($stmt = $conn->prepare($sql_fetch_userdetails)){
		
		//$stmt -> bind_param('i',$id);

		if($stmt -> execute()){
		$stmt -> store_result();
        $totalrows=$stmt->num_rows;	
		$stmt -> bind_result($cont_email,$disply_phone,$username,$company_name,$password,$port_no,$smtp_encryption,$hostname);	
        
		$stmt -> fetch();
		if($totalrows>0){

		if($what=='phone'){
		return $disply_phone;
		
		}else if($what=='email'){
		return $cont_email;
		
		}else if($what=='fromemail'){
		return $username;
		
		}else if($what=='compinfo'){
		return $company_name;
		
		}else if($what=='smtpusername'){
		return $username;
		
		}else if($what=='smtppassword'){
		return base64_decode($password);
		
		}else if($what=='smtpport'){
		return $port_no;
		
		}else if($what=='smtpsecure'){
		return $smtp_encryption;
		
		}else if($what=='smthostname'){
		return $hostname;
		
		}			
			 
		}else{
			
			return 2;
		}	
		
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}
	
}


function getMaintenanceMode($msg=''){
	global $conn;
	
		$sql_fetch_userdetails = "SELECT is_active,ips_allowed,message FROM `tbl_maintenace_mode` WHERE id=1";
				
	if($stmt = $conn->prepare($sql_fetch_userdetails)){
		
		//$stmt -> bind_param('i',$id);

		if($stmt -> execute()){
		$stmt -> store_result();
        $totalrows=$stmt->num_rows;	
		$stmt -> bind_result($is_active,$ips_allowed,$message);	
        
		$stmt -> fetch();
		if($totalrows>0){ 
		if(empty($msg)){
				if($is_active==0){
		return 2; //Ok
		}else if($is_active==1 && !empty($ips_allowed)){
		return $ips_allowed;
		}else if($is_active==1){
		return 1; //Ok
		} 
		
			}else if($msg=='msg'){
			return $message;
			}
		
		}else{
			
			return 2; // maintenece mode not active
		}	
		
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}
	
}


function getAdscall($what=2){
	global $conn;
	
		$sql_fetch_userdetails = "SELECT typeofad,banner_name,banner_link,ads_script FROM `tbl_ads_manager` WHERE banner_status=1 AND deleted_status=0 AND typeofad=".$what." ORDER BY RAND() LIMIT 1";
				
	if($stmt = $conn->prepare($sql_fetch_userdetails)){
		
		//$stmt -> bind_param('i',$id);

		if($stmt -> execute()){
		$stmt -> store_result();
        $totalrows=$stmt->num_rows;	
		$stmt -> bind_result($typeofad,$banner_name,$banner_link,$ads_script);	
        
		$stmt -> fetch();
		if($totalrows>0){

	    
		if($typeofad==1){	
		return html_entity_decode($ads_script);
		}else if($typeofad==2){	
		
		if(empty($banner_link)){
			$banner_link='javascript:void(0)';
			$trg = '';
			}else{
			$banner_link=$banner_link;
			
			$trg = 'target="_blank"';
			}
		return '<a href="'.$banner_link.'" '.$trg.' ><img src="topnotchadmin/uploads/'.$banner_name.'" class="img-thumbnail" /></a>';
			}else{return  $typeofad;}
		  			
			 
		}else{
			
			//return 2;
		}	
		
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}
	
}




?>