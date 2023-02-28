<?php
include('config/config.php');
require 'PHPMailer-5.2-stable/PHPMailerAutoload.php';
require 'PHPMailer-5.2-stable/emailfun.php';
 
if(isset($_POST['startreg'])){
//print_r($_POST);exit;
$_SESSION['fname'] = $fname=InputValidate($_POST['fname']);
$_SESSION['lname'] =$lname=InputValidate($_POST['lname']);
$_SESSION['email'] =$email=InputValidate($_POST['email']);
$_SESSION['phone'] =$phone=InputValidate($_POST['phone']);
$address1=InputValidate($_POST['address1']);
$city=InputValidate($_POST['city']);
$state=InputValidate($_POST['state']);
$zip=InputValidate($_POST['zip']);
$school_name=InputValidate($_POST['school_name']);
$driver_license=InputValidate($_POST['driver_license']);
$school_operator=InputValidate($_POST['school_operator']);
$instructor_license=InputValidate($_POST['instructor_license']);
$operator_license=InputValidate($_POST['operator_license']);
$show_certificate=InputValidate($_POST['show_certificate']);
$ole_date=InputValidate($_POST['ole_date']);
$ile_date=InputValidate($_POST['ile_date']);
$frm_gender=InputValidate($_POST['frm_gender']);
$verificationcode = InputValidate($_POST['verificationcode']);
$hear='';

$dob_date=($_POST['dob_date']);
$course_id=InputValidate($_POST['course_id']);

$_SESSION['course_id_selected_reg']=$course_id; 
$new_password=InputValidate($_POST['new_password']); 
$c_password=InputValidate($_POST['c_password']);

$uppercase = preg_match('@[A-Z]@', $new_password);
$lowercase = preg_match('@[a-z]@', $new_password);
$number    = preg_match('@[0-9]@', $new_password);
 

$errorarray = array();
if(empty($fname)){
	$err_msg=array('fname',"This field can not be empty",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;
}else if(strlen($fname)>100){
	$err_msg=array('fname',"This field must be within 100 character ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($lname)){
	$err_msg=array('lname',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(strlen($lname)>100){
	$err_msg=array('lname',"This field must be within 100 character ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($phone)){
	$err_msg=array('phone',"This field can not be empty",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(strlen($phone)!=10){
	$err_msg=array('phone',"This field must be 10 character length",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($frm_gender)){
	$err_msg=array('frm_gender',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($dob_date)){
	$err_msg=array('dob_date',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($email)){
	$err_msg=array('email',"This field can not be empty",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
	$err_msg=array('email',"This field contains invalid email format",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($verificationcode)){
	$err_msg=array('verificationcode',"This field can not be empty",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(!empty($verificationcode) && !empty($_SESSION['vcode']) && isset($_SESSION['vcode']) && strpos($_SESSION['vcode'],$verificationcode)===false){
    
	$err_msg=array('verificationcode',"Entered verification code not correct",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
 
}else if(!empty($verificationcode) && !empty($_SESSION['vcode']) && isset($_SESSION['vcode']) && strpos($_SESSION['vcode'],$email)===false){
    
	$err_msg=array('verificationcode',"Entered verification code not match with your email",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
 
}else if(!empty($verificationcode) && (empty($_SESSION['vcode']) || !isset($_SESSION['vcode']))){
 
	$err_msg=array('verificationcode',"Please regenerate verification code and use it",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit; 
	
}else if(empty($new_password)){
	$err_msg=array('new_password',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(!empty($new_password) && (!$uppercase || !$lowercase || !$number || (strlen($new_password) < 6 || strlen($new_password) > 15))){
	 
	$err_msg=array('new_password',"Password must contain at least one uppercase,one lowercase,one number and password range between 6 to 15 characters allowed",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($c_password)){
	$err_msg=array('c_password',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if($new_password!=$c_password){
	$err_msg=array('c_password',"Confirm Password must be same as  Password ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($address1)){
	$err_msg=array('address1',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($city)){
	$err_msg=array('city',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($state)){
	$err_msg=array('state',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($zip)){
	$err_msg=array('zip',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($school_name)){                                                                           
	$err_msg=array('school_name',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($driver_license)){
	$err_msg=array('driver_license',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(empty($course_id)){
	$err_msg=array('course_id',"This field can not be empty ",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else{ 
	    $sql_dublecheck_registration = "SELECT id FROM `tbl_registration` WHERE email=?";

		if($stmt = $conn->prepare($sql_dublecheck_registration)){
		$stmt->bind_param("s",$email);
		
		if($stmt->execute()){	

		$stmt -> store_result();
		$isemailused_count=$stmt->num_rows;
		if($isemailused_count>0){
		$err_msg=array('email',"This email address already in use,you can not use again",1);
		echo json_encode($err_msg);
		exit; 	
		}		
		}else{
		$err_msg=array('failed_messages','Execute Error:'.$stmt->error,3);
		echo json_encode($err_msg);
		exit; 
		}

		}else{

		$err_msg=array('failed_messages','Prepare Error:'.$conn->error,3);
		echo json_encode($err_msg);
		exit;			
		}	
		
		$stmt->close();	
	     
	   
	   
	   $ile_date = date('Y-m-d',strtotime($ile_date));
	   $dob_date = date('Y-m-d',strtotime($dob_date));
	   $ole_date = date('Y-m-d',strtotime($ole_date));
	   
        $password=password_hash($new_password, PASSWORD_DEFAULT);
		$sql_insert_registration = "INSERT INTO `tbl_registration` (`faname`, `lname`, `email`, `phone`, `address`, `city`, `state`, `zip`, `school_name`, `driver_license`, `school_operator`, `instructor_license`, `operator_license`, `show_certificate`, `ole_date`, `ile_date`, `frm_gender`, `hear`, `dob_date`, `course_id`,`password`,account_created) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?, ?, ?, ?, ?,?,?, ?, ?, ?)";

		if($stmt = $conn->prepare($sql_insert_registration)){			
			
			$stmt->bind_param("sssississsssssssiissss",$fname,$lname,$email,$phone,$address1,$city,$state,$zip,$school_name,$driver_license,$school_operator, $instructor_license, $operator_license,$show_certificate,$ole_date,$ile_date,$frm_gender, $hear, $dob_date, $course_id,$password,$todaysdate);			
			if($stmt->execute()){
				$_SESSION["loginid"] = $stmt->insert_id;
           $_SESSION['acc_created'] = $todaysdate;				
				$err_msg=array('success_insert',"Registration Success ",2);
				echo json_encode($err_msg);
			



//get dynamic email data start
$get_subject_cont=getEmailtemplateData(3);

if(!empty($get_subject_cont)){
	$subdata ='';
	$contdata ='';
	$reldata = explode('(**)',$get_subject_cont);
	$subdata = $reldata[0];
	$contdata = $reldata[1];
}
//get dynamic email data End


			$emailbody='';	
			$toemail_name=$fname;
			$subject=$subdata;
            $emailbody=str_replace('{USERNAME}',$toemail_name,$contdata);

			//$subject='Registration Success, please follow next step and pay for course';
			//$emailbody.='Dear '.$toemail_name.', registration successfully completed, please pay for course now.';
			//$emailbody.='Your student account with http://www.topnotchdrivingschool.com';
			$cc='';
			$bcc=FROM_EMAIL;

         


			emailSent($email,$toemail_name,$subject,$emailbody,$cc,$bcc);	
           exit;
  
			}else{
				
				 
				$err_msg=array('failed_messages','Execute Error:'.$stmt->error,3);
				echo json_encode($err_msg);
				exit; 
			}

		}else{
		 
               $err_msg=array('failed_messages','Prepare Error:'.$conn->error,3);
				echo json_encode($err_msg);
				exit;			
		}	
		
		$stmt->close();	
		
		$conn->close();

}
	
 
}
exit;


?>