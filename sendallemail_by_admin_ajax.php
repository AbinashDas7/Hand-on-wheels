<?php
include('config/config.php');
require 'PHPMailer-5.2-stable/PHPMailerAutoload.php';
require 'PHPMailer-5.2-stable/emailfun.php';
 
function certificateupdatebyadmin($userid,$semid,$certificatename){
	
	global $conn;
	
		$sql_fetch_userdetails = "UPDATE tbl_seminar_certificate_details_by_admin SET is_emailed=1 WHERE userid=? AND seminarid=? AND certificatename=?";
				
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


if(isset($_POST['forwhatemail']) && $_POST['forwhatemail']=='forcertificateemailbyadmin'){ 
$semid = $_POST['semid'];
$loginid = $_POST['userid'];


//Check database======================

$sql_fetch_certificatename = "SELECT certificatename FROM `tbl_seminar_certificate_details_by_admin` WHERE seminarid=$semid AND userid=".$loginid;
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
$get_subject_cont=getEmailtemplateData(4);

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
$file_name_with_path=$_SERVER['DOCUMENT_ROOT']."/topnotch/usercertificates/".$certificatename;	
	
}

$checkemailsts =  emailSentWithAttachment($toemail,$toemail_name,$subject,$emailbody,$cc,$bcc,$file_name_with_path);	
if($checkemailsts==1){	
    
	certificateupdatebyadmin($loginid,$semid,$certificatename);

    
 	$err_msg=array('emailshowmsg',"Email sent Successfully",2);
	echo json_encode($err_msg); 
	exit;	
}else{
 	$err_msg=array('emailshowmsg',"Email sent failed, please try again later".$checkemailsts,1);
	echo json_encode($err_msg); 
	exit;	
}
 
}


?>