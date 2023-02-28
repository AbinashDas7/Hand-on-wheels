 <?php 
 $catname_array=array();
 $catid_array=array();
$sql_fetch_category = "SELECT id,categoryname FROM tbl_category WHERE deleted_status=? AND cat_status=? ORDER BY display_order ASC";
if($stmt = $conn->prepare($sql_fetch_category)){	
// Bind variables to the prepared statement as parameters
$stmt->bind_param("ii",$delete_status,$cat_status);
$delete_status=0;
$cat_status=1;
// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.   
$stmt -> store_result();
$totalrows_categ=$stmt->num_rows;
if($totalrows_categ > 0){
		$stmt -> bind_result($id_cat,$categoryname_cat);	
	while($stmt -> fetch()) {
	
	array_push($catname_array,$categoryname_cat);
	array_push($catid_array,$id_cat);
	
	}	
	
	
	
}else{
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
  
  <?php   
$sql_fetch_plandetails = "SELECT id,price,duration,planname,plandetails FROM tbl_plans WHERE deleted_status=? AND cat_status=? AND categoryname=? ORDER BY display_order ASC";
if($stmt = $conn->prepare($sql_fetch_plandetails)){	
// Bind variables to the prepared statement as parameters
$stmt->bind_param("iii",$delete_status2,$cat_status2,$catid_array_data);
$delete_status2=0;
$cat_status2=1;
$catid_array_data=1;
// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.   
$stmt -> store_result();
$totalrows_plan=$stmt->num_rows;
if($totalrows_plan > 0){
 $stmt -> bind_result($id_course,$price,$duration,$planname,$plandetails);
	 
}else{
	//Zero rows	
	}
	
}else{
die('Execute Error:'.$stmt->error);	
}
}else{
die('Prepare Error:'.$conn->error);		
	}	
 
?>
   <?php if($totalrows_plan > 0){?>             

<div id="seminars">

	<div class="courses">
		<div class="section_background parallax-window" data-parallax="scroll" data-image-src="images/courses_background.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
					
					  <?php 	
           foreach($catname_array as $catname_array_data) { 
		   
		   
		   ?>
                   
                  <h2 class="section_title"><?php echo $catname_array_data;?></h2>
                      
                      <?php } ?>
					
						
						 
					</div>
				</div>
			</div>
			<div class="row courses_row">
				
				<!-- Course -->
				
				<?php 
			   
			   while($stmt -> fetch()) { 
			   
			    ?>
			   
			   
				<div class="col-lg-4 course_col">
					<div class="course">
						
						<div class="course_body">
							<h3 class="course_title"><i class="fa fa-graduation-cap" aria-hidden="true"></i>  <?php echo $planname;?></h3>
							<div class="course_teacher"><span class="course_price ml-auto">Starting at $ <?php echo $price;?></span></div>
							<?php echo $plandetails;?>
						</div>
						<div class="course_footer">
							<div class="course_footer_content d-flex flex-row align-items-center justify-content-start">
								<div class="course_info">
								<span><a href='register.php?seminar=<?php echo $id_course;?>' class="btn btn-danger">Register Now <i class="fa fa-key" aria-hidden="true"></i>
</a></span>
								</div>
							 
								<div class="course_price ml-auto">$<?php echo $price;?></div>
							</div>
						</div>
					</div>
				</div>
 <?php }?> 
			 
			</div>
		 
		</div>
	</div>


</div>
	  <?php }?> 
