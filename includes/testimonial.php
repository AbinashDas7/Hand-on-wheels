<?php 
$sql_fetch_pagecont_id_testi = "SELECT section_page_title,banner_name,banner_alt FROM  tbl_testimonial_content WHERE deleted_status=? AND banner_status=?";

if($stmt = $conn->prepare($sql_fetch_pagecont_id_testi)){
	
// Bind variables to the prepared statement as parameters
$stmt->bind_param("ii",$delete_status,$banner_status);
$delete_status=0;
$banner_status=1;

// Attempt to execute the prepared statement
if($stmt->execute()){
// Records fetched successfully.  
 
$stmt -> store_result();
$totalrows_pagecont_id_testic=$stmt->num_rows;
if($totalrows_pagecont_id_testic > 0){
	
$stmt -> bind_result($section_page_title_id_nameuser,$banner_name_id_nameuser,$banner_alt_id_nameuser);	
 	
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
  
  <?php if($totalrows_pagecont_id_testic>0){?>
  <div class="courses" id="Testimonial">
		<div class="section_background parallax-window" data-parallax="scroll" data-image-src="images/courses_background.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
					<h2 class="section_title">Testimonial</h2>
					 
					</div>
				</div>
			</div>
			<div class="row courses_row">
			    <div id="demo" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
           

<?php 	$testcnt = 0;
            while($stmt -> fetch()) { 
			if($testcnt==0){$aclss= 'active';}else{{$aclss= '';}}
			?>

		   <div class="carousel-item <?php echo $aclss;?>">
                <div class="carousel-caption">
                    <p><?php echo $banner_alt_id_nameuser;?> </p>  
                    <div id="image-caption">-<?php echo $section_page_title_id_nameuser;?></div>
                </div>
            </div>
			
			<?php $testcnt++; }?>
           
        </div> <a class="carousel-control-prev" href="#demo" data-slide="prev"> <i class='fa fa-arrow-left'></i> </a> <a class="carousel-control-next" href="#demo" data-slide="next"> <i class='fa fa-arrow-right'></i> </a>
    </div>


			
			</div>
		 
		</div>
	</div>

  <?php } ?>
  
	