<?php 

$sql_fetch_pagecont_id3 = "SELECT section_page_title,banner_name,banner_alt FROM tbl_page_content WHERE deleted_status=? AND banner_status=? AND id=3";

if($stmt = $conn->prepare($sql_fetch_pagecont_id3)){
	
// Bind variables to the prepared statement as parameters
$stmt->bind_param("ii",$delete_status,$banner_status);
$delete_status=0;
$banner_status=1;

// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.  
 
$stmt -> store_result();
$totalrows_pagecont_id3=$stmt->num_rows;
if($totalrows_pagecont_id3 > 0){
	
$stmt -> bind_result($section_page_title_id3,$banner_name_id3,$banner_alt_id3);	
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
  <?php if($totalrows_pagecont_id3>0){?>  
<div class="news" id="newsidc">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<h2 class="section_title"><?php echo $section_page_title_id3;?></h2>
						 
					</div>
				</div>
			</div>
			<div class="row news_row">
				

				<div class="col-lg-5 news_col">
					<div class="news_posts_small">
					
<?php echo $banner_alt_id3;?>	 

					</div>
				</div>
				
				<div class="col-lg-7 news_col">
					
					<!-- News Post Large -->
					<div class="news_post_large_container">
						<div class="news_post_large">
							<div class="news_post_image"><img src="<?php echo 'topnotchadmin/uploads/'.$banner_name_id3;?>" class=""></div>
							 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php }?>