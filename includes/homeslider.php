<?php 
$sql_fetch_banner = "SELECT banner_name,banner_alt FROM tbl_banner WHERE deleted_status=? AND banner_status=?";

if($stmt = $conn->prepare($sql_fetch_banner)){
	
// Bind variables to the prepared statement as parameters
$stmt->bind_param("ii",$delete_status,$banner_status);
$delete_status=0;
$banner_status=1;

// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.  
 
$stmt -> store_result();
$totalrows_banner=$stmt->num_rows;
if($totalrows_banner > 0){
	
	$stmt -> bind_result($banner_name,$banner_alt);	
	
	
	
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
 
 <?php if($totalrows_banner > 0){?>
 
 
  <div class="home">
		<div class="home_slider_container">
			
			<!-- Home Slider -->
			<div class="owl-carousel owl-theme home_slider">
				
	 

<?php 	
            while($stmt -> fetch()) { ?>
            
       
			
				<!-- Home Slider Item -->
				<div class="owl-item">
					<div class="home_slider_background" style="background-image:url(topnotchadmin/uploads/<?php echo htmlentities($banner_name);?>)"></div>
					<div class="home_slider_content">
						<div class="container">
							<div class="row">
							<?php echo ($banner_alt);?>	
							</div>
						</div>
					</div>
				</div>

            
            <?php } ?>


			</div>
		</div>

		<!-- Home Slider Nav -->

		<div class="home_slider_nav home_slider_prev"><i class="fa fa-angle-left" aria-hidden="true"></i></div>
		<div class="home_slider_nav home_slider_next"><i class="fa fa-angle-right" aria-hidden="true"></i></div>
	</div>



 
 <?php } ?> 
 
