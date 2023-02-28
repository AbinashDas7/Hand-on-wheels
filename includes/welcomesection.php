<?php 

$sql_fetch_pagecont_id1 = "SELECT section_page_title,banner_name,banner_alt FROM tbl_page_content WHERE deleted_status=? AND banner_status=? AND id=1";

if($stmt = $conn->prepare($sql_fetch_pagecont_id1)){
	
// Bind variables to the prepared statement as parameters
$stmt->bind_param("ii",$delete_status,$banner_status);
$delete_status=0;
$banner_status=1;

// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.  
 
$stmt -> store_result();
$totalrows_pagecont_id1=$stmt->num_rows;
if($totalrows_pagecont_id1 > 0){
	
$stmt -> bind_result($section_page_title_id1,$banner_name_id1,$banner_alt_id1);	
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

<?php if($totalrows_pagecont_id1>0){?>  
	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<h2 class="section_title"><?php echo $section_page_title_id1;?></h2>
 					</div>
				</div>
			</div>
			
			
			<div class="row features_row">
			
				<div class="col-lg-8">
				<div class="cerrtficateblock">


<?php echo $banner_alt_id1;?>

</div>	 
				</div>
			<div class="col-lg-4">
				<img src="<?php echo 'topnotchadmin/uploads/'.$banner_name_id1;?>" class="img-thumbnail">	 
				</div>
			</div>
			
			
		</div>
	</div>
<?php } ?>

 
