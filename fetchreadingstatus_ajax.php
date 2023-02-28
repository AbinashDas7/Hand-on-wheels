<?php
include('config/config.php');
$semid = 0;
$semid = $_GET['semid'];

if(empty($semid)){

exit;
}

$sql_fetch_booked_course = "SELECT concat(`courseid`,`topicid`) as semiddetails,`total_time_spend` FROM `tbl_reading_status` WHERE `userid`=".$_SESSION['loginid']." AND `courseid`=".$semid."  order by tbl_reading_status.topicid ASC";

if($stmt = $conn->prepare($sql_fetch_booked_course)){	

// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.   
$stmt -> store_result();
$totalrows_semin=$stmt->num_rows;

if($totalrows_semin > 0){
$stmt -> bind_result($semiddetails,$total_time_spend);	

$returnvar='';

while($stmt -> fetch()){  
  $returnvar .= $semiddetails.','.$total_time_spend."*";
}	

echo substr_replace($returnvar,'',-1);

}else{
	echo  '0';
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

?>


