<?php 
$sql_fetch_sectioncont = "SELECT sectiondata_data FROM tbl_page_section WHERE deleted_status=? AND section_status=? AND section_name='careersection'";

if($stmt = $conn->prepare($sql_fetch_sectioncont)){
	
// Bind variables to the prepared statement as parameters
$stmt->bind_param("ii",$delete_status_section,$section_status_act);
$delete_status_section=0;
$section_status_act=1;

$sectiondata_data='';
// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.  
 
$stmt -> store_result();
$totalrows_pagecont_sections=$stmt->num_rows;
if($totalrows_pagecont_sections > 0){
	
$stmt -> bind_result($sectiondata_data_forcareer);	
$stmt -> fetch();	
	//echo $sectiondata_data;
	
	
}else{
	//Zero rows
	
	}
 
 
 
}else{
die('Execute Error:'.$stmt->error);	
}
// Close statement
$stmt->close();
}else{
die('Prepare Error:'.$conn->error);	
	
	}

 
 
  ?>  <?php 
  $carearcontentstatsus = 0;
  if($totalrows_pagecont_sections > 0 && !empty($sectiondata_data_forcareer)){
	  $carearcontentstatsus = 1;
	   }?>
  
	<div class="counter" id="Features">
		<div class="counter_background" style="background-image:url(images/bgfeature.jpg)"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="counter_content">
						 <?php echo $sectiondata_data_forcareer;?>
 
					</div>

				</div>
			</div>

			 

		</div>
	</div>

	