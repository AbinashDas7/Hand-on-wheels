<?php 
require 'PHPMailer-5.2-stable/PHPMailerAutoload.php';
require 'PHPMailer-5.2-stable/emailfun.php';


	
$toemail = 'sankarbhaba@gmail.com';
$toemail_name='Bhabasankar';
$subject='Test email, Registration successfully completed ';
$emailbody='Dear '.$toemail_name.', Registration successfully completed.';

echo $checkemailsts =  emailSent($toemail,$toemail_name,$subject,$emailbody);	


?>