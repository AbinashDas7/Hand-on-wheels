<?php
include('config/config.php');
//print_r($_SESSION);
//if(isset($_SESSION['seminartopicread_time']) && $_SESSION['seminartopicread_time']=''){
if(isset($_SESSION['seminartopicread_time'])){	
$allpart = explode('*',$_SESSION['seminartopicread_time']);

$sem_part1_courseid = $allpart[0]; //course id
$sem_part2_topicid = $allpart[1]; //Topic id
}
if(isset($_SESSION['sem_part3_update']) && !empty($_SESSION['sem_part3_update'])){
	
$sem_part3 = $_SESSION['sem_part3_update'];	
}else{
$sem_part3 = $allpart[2]; //start time 
}
if(!empty($sem_part1_courseid) && !empty($sem_part2_topicid) && !empty($sem_part3)){
	
$whatreturn = '';
$whatreturn = checkIsAlreadyRead($_SESSION["loginid"],$sem_part1_courseid,$sem_part2_topicid);

if($whatreturn==1){ //already

$pastreadtime=0;
$pastreadtime = getTotalTime($_SESSION["loginid"],$sem_part1_courseid,$sem_part2_topicid);

$total_time_spend = (int)strtotime(date('d-m-Y H:i:s',strtotime($todaysdate)))-strtotime(date('d-m-Y H:i:s',strtotime($sem_part3)));
$total_time_spend = $pastreadtime+$total_time_spend;
 
$insertreadingstatus = "UPDATE tbl_reading_status SET reading_starttime=?,insert_date=?,total_time_spend=?,reading_endtime=? WHERE userid=? AND courseid=? AND topicid=?";
 
 	
}else if($whatreturn==2){ //not read yet
$insertreadingstatus = "INSERT INTO tbl_reading_status SET userid=?,courseid=?,topicid=?,when_read=?,reading_starttime=?,ipaddress=?,insert_date=?,reading_endtime=?";	
}

if($stmt = $conn->prepare($insertreadingstatus)){
	
if($whatreturn==1){ //already, OLD


$stmt -> bind_param('ssssiii',$sem_part3,$sem_part3,$total_time_spend,$todaysdate,$_SESSION["loginid"],$sem_part1_courseid,$sem_part2_topicid);

}else if($whatreturn==2){ //not read yet, NEW

$stmt -> bind_param('iiisssss',$_SESSION["loginid"],$sem_part1_courseid,$sem_part2_topicid,$sem_part3,$sem_part3,$ipaddressofuser,$todaysdate,$todaysdate);
 	
}
$ipaddressofuser = get_client_ip();
 
if($stmt -> execute()){	
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




