<?php
include('config/config.php');
$fetchid = '';
$fetchid = $_POST['fetchid'];
$seminarid = $_POST['seminarid'];
$countno = $_POST['countno'];
$countsemtotaltopic = $_POST['countsemtotaltopic'];

//print_r($_POST);
$returndata=array();
if($fetchid!=0 && is_numeric($fetchid) && strlen($fetchid)<3){
	
//INSERT reading_status START

$_SESSION['autoupdate_on']=$seminarid.'_'.$fetchid;



//$_SESSION['just_last_topic'] = '';
//$_SESSION['just_last_topic'] = $_SESSION['seminartopicread_time']; 

if(!empty($_SESSION['seminartopicread_time'])){
	$sem_part1 = '';
	$sem_part2 = '';
	$sem_part3 = '';
	$allpart = explode('*',$_SESSION['seminartopicread_time']);
	
	$sem_part1 = $allpart[0];
	$sem_part2 = $allpart[1];
	$sem_part3 = $allpart[2];
	
}
$_SESSION['seminartopicread_time']=$seminarid.'*'.$fetchid.'*'.$todaysdate;
//INSERT reading_status END

//Fetch Reading Time Start
$timespendwithtopic ='';
	if($stmt = $conn->prepare("SELECT total_time_spend FROM `tbl_reading_status` WHERE userid=? AND courseid=? AND topicid=?")){
		
		$stmt -> bind_param('iii',$_SESSION["loginid"],$seminarid,$fetchid);

		if($stmt -> execute()){
		$stmt -> store_result();
        $totalrows=$stmt->num_rows;	
		$stmt -> bind_result($total_time_spend);         
		$stmt -> fetch();
		if($totalrows>0){			
		
			$timespendwithtopic =  (int)$total_time_spend;
		}else{
			
			$timespendwithtopic ='';
		}	
		
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$db2->error);		
		}
//Fetch Reading Time End


	
	
	
$sql_topics = "SELECT tbl_seminar_content.seminar_title_name,tbl_seminar_content.seminardetailsdata,tbl_plans.planname FROM tbl_seminar_content,tbl_plans WHERE tbl_plans.id=tbl_seminar_content.seminartypename AND tbl_seminar_content.deleted_status=0 AND tbl_seminar_content.id=?";
if($stmt = $conn->prepare($sql_topics)){	

// Bind variables to the prepared statement as parameters
$stmt->bind_param("i",$fetchid);
 
// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.   
$stmt -> store_result();
$totalrows_semintop=$stmt->num_rows;
if($totalrows_semintop > 0){
	$stmt -> bind_result($seminar_title_name,$seminardetailsdata,$seminarname);	
	$stmt -> fetch();   	
	
	$prvar = '';
	$nextar = '';
	$certfbtn='';
	
	if($countsemtotaltopic==1){
	$prvar = '';
	$nextar = '';		
	}else if($countno==1){
	$prvar = '';	
	$nextar = '<i class="fa fa-arrow-circle-right rightmovearrow" aria-hidden="true" onclick="return Forwardata('.($countno+1).','.$seminarid.')"></i>';	
	}else if($countsemtotaltopic==$countno){
	$prvar = '<i class="fa fa-arrow-circle-left leftmovearrow" aria-hidden="true" onclick="return Backwardata('.($countno-1).','.$seminarid.')"></i>';	
	$nextar = '';
	$certfbtn = '<p><a class="btn btn-success" href="javascript:void(0)" onclick="return getCertificate('.$countsemtotaltopic.','.$seminarid.')">View/Print certificate</a></p>';
	}else{
	$prvar = '<i class="fa fa-arrow-circle-left leftmovearrow" aria-hidden="true" onclick="return Backwardata('.($countno-1).','.$seminarid.')"></i>';	
	$nextar = '<i class="fa fa-arrow-circle-right rightmovearrow" aria-hidden="true" onclick="return Forwardata('.($countno+1).','.$seminarid.')"></i>';		
		
	}
	
	
	
	$newret_data = '';
	 $timespendwithtopic_print='';
	if($timespendwithtopic!=0){
    if($timespendwithtopic>60){
		
		$timespendwithtopic = (int)($timespendwithtopic/60).' minute';
		
	}else{
		
		$timespendwithtopic = $timespendwithtopic.' second';
	}		
	$timespendwithtopic_print = 'Total time spend on this topic: '.$timespendwithtopic;	
	}
	
	$newret_data .= '<div class="content_section_sem_name"> You are reading <i class="fa fa-graduation-cap" aria-hidden="true" style="color:red"></i> '.$seminarname.'</div>';
	$newret_data .= '<div class="content_section_title"><div class="row">
	<div class="col-md-10"><p class="content_section_topic">'.$seminar_title_name.'<br/><span style="font-size:15px;color:red;">'.$timespendwithtopic_print.'</span></p></div>
	<div class="col-md-2">
	'.$prvar.$nextar.'    
    </div>
	</div>
	</div>';
	$newret_data .= '<div class="content_section_sem_cont">'.$seminardetailsdata.'</div>';
	$newret_data .= '<div class="content_next_prv_down mt-2"><div class="row"><div class="col-md-6">'.$prvar.'</div><div class="col-md-6 text-right">'.$nextar.$certfbtn.'</div></div></div>';
	
	
	
	
	
	$returndata=array(1,$newret_data);
	echo json_encode($returndata);exit;
	 
}else{
	//Zero rows	
	 
	 $returndata=array(2,'No Content Available with This topic');
	 echo json_encode($returndata);exit;
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