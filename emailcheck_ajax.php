<?php
include('config/config.php');

if(isset($_POST['what_doing']) && $_POST['what_doing']=='emailexistance'){
//print_r($_POST);exit;
$emailid=InputValidate($_POST['emailid']);
 
$errorarray = array();
if(empty($emailid)){
	$err_msg=array('emailvalidatestatus',"This field can not be empty",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else if(!filter_var($emailid, FILTER_VALIDATE_EMAIL)){
	$err_msg=array('emailvalidatestatus',"This field contains invalid email format",1);
	echo json_encode($err_msg);
	$errorarray=array(1);
	exit;	
}else{
	    $sql_insert_registration = "SELECT id FROM `tbl_registration` WHERE email=?";

		if($stmt = $conn->prepare($sql_insert_registration)){
		$stmt->bind_param("s",$emailid);
		
		if($stmt->execute()){	

		$stmt -> store_result();
		$isemailused_count=$stmt->num_rows;
		if($isemailused_count>0){
		$err_msg=array('emailvalidatestatus',"This email address already in use,so just go for login.if you wish to create new account please use another email",4);
		echo json_encode($err_msg);
		exit; 	
		}else if($isemailused_count==0){
		$err_msg=array('emailvalidatestatus',"Available, you can create an account with this email. To continue please click below to receive your verification code.",5);
		$_SESSION['useremailvry']=$emailid;
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
		
		$conn->close();

}
	
 
}
exit;


?>