<?php



session_start();



ob_start();



date_default_timezone_set('America/Los_Angeles');


define('BASEURL','http://localhost/topnotch/');



//error_reporting('E_ALL');



/* Database credentials. Assuming you are running MySQL



server with default setting (user 'root' with no password) */







	if($_SERVER['HTTP_HOST']=='localhost' || $_SERVER['HTTP_HOST']=='192.168.1.102'){ // local sustem	



	define('DB_SERVER', 'localhost');



	define('DB_USERNAME', 'root');



	define('DB_PASSWORD', '');



	define('DB_NAME', 'topnotch_drivingschool');



	



	}else{  //Server



	define('DB_SERVER', 'localhost');



	define('DB_USERNAME', 'ucldi75uz7vgh');



	define('DB_PASSWORD', 'ld1h8vkttqjg');



	define('DB_NAME', 'dba8sqdvrnddge');



	



	}







/* Attempt to connect to MySQL database */



$conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);



 



// Check connection



if($conn->connect_error){



    die("ERROR: Could not connect. " . $conn->connect_error);



	exit;



}











$todaysdate = date('Y-m-d H:i:s');







require('function.php');



//Email Settings:







define('TO_EMAIL',getEmailandPhone('fromemail'));



define('FROM_EMAIL',getEmailandPhone('fromemail'));



define('FROM_EMAIL_DESCRIPTION',getEmailandPhone('compinfo'));



define('REPLY_EMAIL',getEmailandPhone('fromemail')); 



define('REPLY_EMAIL_DESCRIPTION',getEmailandPhone('compinfo'));


 $checkfilename='';
 $checkfilename =  basename($_SERVER['REQUEST_URI']);
 if($checkfilename!=''){
 $checkfilename = explode('?',$checkfilename);
 $checkfilename = $checkfilename[0];
 }
 if($checkfilename!='basic_with_content.php'){
	//Maintenance mode check start 
$mntchk = getMaintenanceMode();
if($mntchk==2){
//Ok
}else if($mntchk==1){
//Active mnt mode
$usermsg = getMaintenanceMode('msg');
die($usermsg);

}else{
$mntchkips=array();
$mntchkips = explode(',', $mntchk);	
if($_SERVER['HTTP_HOST']=='localhost'){

//Ok, allowed

}else if(count($mntchkips)>0){

if(!in_array(get_client_ip(),$mntchkips)){
$usermsg = getMaintenanceMode('msg');
die($usermsg);
}
}
}
//Maintenance mode check end  
	 }
 













?>