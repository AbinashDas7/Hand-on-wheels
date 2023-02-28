<?php
include('config/config.php');
$fetchid = '';
$fetchid = $_POST['fetchid'];
 

//print_r($_POST);
$returndata=array();
if($fetchid!=0 && is_numeric($fetchid) && strlen($fetchid)<3){ 



$sql_fetch_booked_course = "SELECT skiptime FROM `tbl_seminar_content` where id=".$fetchid;

if($stmt = $conn->prepare($sql_fetch_booked_course)){	

// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.   
$stmt -> store_result();
$totalrows_semin=$stmt->num_rows;
$skiptime=0;
if($totalrows_semin > 0){
$stmt -> bind_result($skiptime);	
$returnvar='';
$stmt -> fetch();

$skiptime = ($skiptime * 60); 
$skiptime=(int)$skiptime;
echo trim($skiptime);exit;
}else{
echo  60;exit;
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