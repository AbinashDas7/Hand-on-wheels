<?php
include('config/config.php');
require 'PHPMailer-5.2-stable/PHPMailerAutoload.php';
require 'PHPMailer-5.2-stable/emailfun.php';


if(isset($_POST['forwhatemail']) && $_POST['forwhatemail']=='forverificatiocode'){ 
$rand4= rand(1000,9999);
$_SESSION['vcode'] = $_SESSION['useremailvry']."_".$rand4;
$toemail = $_SESSION['useremailvry'];
$toemail_name='User';
$subject='Verification code for registration';
$emailbody='Dear user, your 4 digit verification code is:<b>'.$rand4.'</b>, please enter this code in <b>Email verification code</b> and fillup all required data.';
$cc='';
$bcc='';

$checkemailsts =  emailSent($toemail,$toemail_name,$subject,$emailbody,$cc,$bcc);	
if($checkemailsts==1){	
 	$err_msg=array('emailshowmsg',"Email sent Successfully, please chek your email",2);
	echo json_encode($err_msg); 
	exit;	
}else{
 	$err_msg=array('emailshowmsg',"Email sent failed, please try again later",1);
	echo json_encode($err_msg); 
	exit;	
}
 
}



if(isset($_POST['forwhatemail']) && $_POST['forwhatemail']=='forcertificateemail'){ 
$semid = $_POST['semid'];
$loginid = $_SESSION['loginid'];


//Check database======================

$sql_fetch_certificatename = "SELECT certificatename FROM `tbl_seminar_certificate_details` WHERE seminarid=$semid AND userid=".$loginid;
if($stmt = $conn->prepare($sql_fetch_certificatename)){	
// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.   
$stmt -> store_result();
$totalcertcount=$stmt->num_rows;
if($totalcertcount > 0){
$stmt -> bind_result($certificatename);	
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
// Close statement====================


$toemail = getuserName($loginid,'email');
$toemail_name=getuserName($loginid,'name');

//get dynamic email data start
$get_subject_cont=getEmailtemplateData(1);

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



//$emailbody='Dear '.$toemail_name.', <br/> Please find the attached certificate';

$cc='';
$bcc=FROM_EMAIL;

if($_SERVER['HTTP_HOST']=='localhost'){
$file_name_with_path = $_SERVER['DOCUMENT_ROOT']."/topnotch/usercertificates/".$certificatename;	
}else{
$file_name_with_path=$_SERVER['DOCUMENT_ROOT']."/upw/topnotch/usercertificates/".$certificatename;	
	
}

$checkemailsts =  emailSentWithAttachment($toemail,$toemail_name,$subject,$emailbody,$cc,$bcc,$file_name_with_path);	
if($checkemailsts==1){	
    
	certificateupdate($loginid,$semid,$certificatename);

    
 	$err_msg=array('emailshowmsg',"Email sent Successfully, please chek your email",2);
	echo json_encode($err_msg); 
	exit;	
}else{
 	$err_msg=array('emailshowmsg',"Email sent failed, please try again later".$checkemailsts,1);
	echo json_encode($err_msg); 
	exit;	
}
 
}


?>