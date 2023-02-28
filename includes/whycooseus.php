<?php 
$sql_fetch_pagecont_id4 = "SELECT section_page_title,banner_name,banner_alt FROM tbl_page_content WHERE deleted_status=? AND banner_status=? AND id=4";

if($stmt = $conn->prepare($sql_fetch_pagecont_id4)){
	
// Bind variables to the prepared statement as parameters
$stmt->bind_param("ii",$delete_status,$banner_status);
$delete_status=0;
$banner_status=1;

// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.  
 
$stmt -> store_result();
$totalrows_pagecont_id4=$stmt->num_rows;
if($totalrows_pagecont_id4 > 0){
	
$stmt -> bind_result($section_page_title_id4,$banner_name_id4,$banner_alt_id4);	
 $stmt -> fetch();	
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

 
 
  ?>
  <?php if($totalrows_pagecont_id4>0){?>  
<div class="feature" id="whyus">
		<div class="feature_background" style="background-image:url(images/courses_background.jpg)"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<h2 class="section_title"><?php echo $section_page_title_id4;?></h2>
						 
					</div>
				</div>
			</div>
			<div class="row feature_row news_row">

				<!-- Feature Content -->
				<div class="col-lg-6 feature_col">
				
				<?php echo $banner_alt_id4;?>	
				
					 
				</div>

				<!-- Feature Video -->
				<div class="col-lg-6 feature_col">
				 
					 <img src="<?php echo 'topnotchadmin/uploads/'.$banner_name_id4;?>" class="img-thumbnail">
				</div>
			</div>
		</div>
	</div>

	
<?php }?>		
	