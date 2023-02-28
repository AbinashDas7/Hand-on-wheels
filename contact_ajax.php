<?php
include('config/config.php');
require 'PHPMailer-5.2-stable/PHPMailerAutoload.php';
require 'PHPMailer-5.2-stable/emailfun.php';
?>

<?php 

//print_r($_POST);
$ipaddressofuser = get_client_ip();
//if(isset($_POST['contactformbutton'])){
$allarray=array();
// Validate name
$input_name = InputValidate($_POST["name_user"]);
if(empty($input_name)){
$allarray['name_user'] = "Please enter a name.";
} elseif(!filter_var($input_name, FILTER_VALIDATE_REGEXP, array("options"=>array("regexp"=>"/^[a-zA-Z\s]+$/")))){
$allarray['name_user']= "Please enter a valid name.";
} else{
$visitorname = $input_name; //Insert to dbs
}

 
// Validate Email
$email_user = InputValidate($_POST["email_user"]);

if(empty($email_user)){
$allarray['email_user'] = "Enter email address";  
}else if(!empty($email_user)){
if (!filter_var($email_user, FILTER_VALIDATE_EMAIL)) {
$allarray['email_user'] = "Invalid email format"; 
}   
}


// Validate Message
$message_user = InputValidate($_POST["message_user"]);
if(empty($message_user)){
$allarray['message_user'] = "Please enter Message";     
} elseif(strlen($message_user)<10){
$allarray['message_user']= "Please enter minimum 50 characters";
}elseif(strlen($message_user)>250){
$allarray['message_user']= "Maximum 250 characters";
} else{
$message_user = $message_user;
}


// Validate Code
$captchacodeverify = InputValidate($_POST["captchacodeverify"]);
if(empty($captchacodeverify)){
$allarray['captchacodeverify'] = "Please enter Security code";     
} elseif(strlen($captchacodeverify)<4){
$allarray['captchacodeverify']= "Please enter 4 digit code";
}elseif(strlen($captchacodeverify)>4){
$allarray['captchacodeverify']= "Please enter 4 digit code";
} elseif(strlen($captchacodeverify)==4){
	
if($captchacodeverify!=$_SESSION["captcha_code_contcat"]){
	
$allarray['captchacodeverify']= "Please enter valid 4 digit code";	
}else{
	
$captchacodeverify = $captchacodeverify;	
}	
	
	
}else{


}
 




if(count($allarray)==0){ //No error	
	
	
$sql_insert_contact = "INSERT INTO tbl_contact (visitor_name,visitor_email,visitor_message,visitor_ip_address,inserted_date) VALUES (?,?,?,?,?)";

if($stmt = $conn->prepare($sql_insert_contact)){
	
// Bind variables to the prepared statement as parameters
$stmt->bind_param("sssss",$visitorname,$email_user,$message_user,$ipaddressofuser,$todaysdate);


// Attempt to execute the prepared statement
if($stmt->execute()){
// Records inserted successfully.  
$allarray['successmessage']='Thank you for your message , we will contact you as soon as possible';


            $emailbody='';	
			$toemail_name='Admin';
			$subject='Email from Contact us form';
			$emailbody.='<table border="1" celpadding="10" cellspacing="0">
			<tr><td>Name: </td><td>'.$visitorname.'</td></tr>
			<tr><td>Email: </td><td>'.$email_user.'</td></tr>
			<tr><td>Message: </td><td>'.$message_user.'</td></tr>
			<tr><td>Todays Date: </td><td>'.date('Y-m-d H:i:s').'</td></tr>
			
			</table>';
 			$cc='sankarbhaba@gmail.com';
			$bcc='';

			emailSent(TO_EMAIL,$toemail_name,$subject,$emailbody,$cc,$bcc);	
 






 
}else{
die('Execute Error:'.$stmt->error);	
}

}else{
die('Prepare Error:'.$conn->error);	
	
	}
	
// Close statement
$stmt->close();
	
// Close connection
$conn->close();
 
	
	
	}



echo  json_encode($allarray);

	
	//}
	
	





?>