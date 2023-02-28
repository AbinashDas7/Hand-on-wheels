<?php
include('config/config.php');

if(isset($_POST['what_doing']) && $_POST['what_doing']=='couponchk'){ 

$course_id=trim($_POST['course_id']);
$CouponCode=trim($_POST['CouponCode']);

function getSeminarfeeCpnpg($course_id)
{
    global $conn;
     
	$data = explode(',',$course_id);
	$morethan_one_course_count = 0;
	
	if(is_array($data)) {
	if(count($data)>1){
	$morethan_one_course_count = 15; //discount 
	}
	}
	
    if($course_id!='') {
		
        if($stmt = $conn->prepare("SELECT sum(price) as price  FROM `tbl_plans` WHERE id IN (".$course_id.")")){
		if($stmt -> execute()){
		$stmt -> bind_result($totalprice);	
        $stmt -> fetch();
        $stmt->close();
		}else{
		return ('Execute Error:'.$stmt->error);	
		}
		}else{
		return('Prepare Error:'.$conn->error);		
		}
      
		
		
		if($morethan_one_course_count>0){
		return number_format(($totalprice-$morethan_one_course_count),2);
		}else{
		return number_format($totalprice,2);	 
		}
       
 
    }
 
}
//===============
$messageforuser='';
	    $sql_cpnquery = "SELECT couponcode,coupon_discount_process,percentage_price,startdate,enddate,messageforuser,banner_status,deleted_status FROM `tbl_coupon_content` WHERE banner_status=1 AND deleted_status=0 AND couponcode=? AND NOW() BETWEEN `startdate` AND `enddate`";

		if($stmt = $conn->prepare($sql_cpnquery)){
		$stmt->bind_param("s",$CouponCode);
		
		if($stmt->execute()){	

		$stmt -> store_result();
		$iscpncodeavailable=$stmt->num_rows;
		if($iscpncodeavailable>0){
		
		$stmt -> bind_result($couponcode,$coupon_discount_process,$percentage_price,$startdate,$enddate,$messageforuser,$banner_status,$deleted_status);	
		$stmt -> fetch();

		$course_price = getSeminarfeeCpnpg($course_id);

		if($coupon_discount_process==2){ 
		//flat
		$course_price = $course_price-$percentage_price;
		$_SESSION['customdiscountprice']=$course_price;
		}else if($coupon_discount_process==1){
		//Percentage 
		$perprc = ($percentage_price / 100) * $course_price;
		$course_price = $course_price-$perprc;
		$_SESSION['customdiscountprice']=$course_price;
		}




		
		$err_msg=array('datamsg','<i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Coupon code applied successfully, you have to pay $'.$course_price,1,$messageforuser);
		
		echo json_encode($err_msg);
		exit; 
		
		}else if($iscpncodeavailable==0){
			
		$err_msg=array('failed_messages',"Invalid/Expaired Coupon Code",3);
		
		
		if(isset($_SESSION['customdiscountprice'])){
		unset($_SESSION['customdiscountprice']);
		}
		echo json_encode($err_msg);
		exit; 	
		
			
		}
		$stmt -> close();
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
//============




}
exit;


?>