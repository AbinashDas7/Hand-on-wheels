<?php
include('config/config.php');
 

if(isset($_SESSION['autoupdate_on'])){	
$allpart = explode('_',$_SESSION['autoupdate_on']);

$sem_part1_courseid = $allpart[0]; //course id
$sem_part2_topicid = $allpart[1]; //Topic id
}
 
if(!empty($sem_part1_courseid) && !empty($sem_part2_topicid)){
	
$whatreturn = '';
$whatreturn = checkIsAlreadyRead($_SESSION["loginid"],$sem_part1_courseid,$sem_part2_topicid);

if($whatreturn==1){ //already
 
 
$insertreadingstatus = "UPDATE tbl_reading_status SET reading_starttime=?,insert_date=?,total_time_spend=total_time_spend+5,reading_endtime=?,ipaddress=? WHERE userid=? AND courseid=? AND topicid=?";
 
 	
}else if($whatreturn==2){ //not read yet
$insertreadingstatus = "INSERT INTO tbl_reading_status SET userid=?,courseid=?,topicid=?,when_read=?,reading_starttime=?,ipaddress=?,insert_date=?,reading_endtime=?,total_time_spend=5";	
}

if($stmt = $conn->prepare($insertreadingstatus)){
	
if($whatreturn==1){ //already, OLD


$stmt -> bind_param('ssssiii',$todaysdate,$todaysdate,$todaysdate,$ipaddressofuser,$_SESSION["loginid"],$sem_part1_courseid,$sem_part2_topicid);

}else if($whatreturn==2){ //not read yet, NEW

$stmt -> bind_param('iiisssss',$_SESSION["loginid"],$sem_part1_courseid,$sem_part2_topicid,$todaysdate,$todaysdate,$ipaddressofuser,$todaysdate,$todaysdate);
 	
}
$ipaddressofuser = get_client_ip();
 
if($stmt -> execute()){	
echo 'Done';
$stmt -> close();	

$_SESSION['sem_part3_update'] = $todaysdate;

}else{
die("Ececute failed: ".$stmt->error);//TEST
}
}else{
die("Prepare failed: ".$conn->error); 
}
	
}


 
//INSERT reading_status END




 
//}




