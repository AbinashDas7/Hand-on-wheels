
<div class="container text-center">
	<div class="row">

							<div class="col-lg-12 footer_col">
					
								<!-- Footer About -->
								<div class="footer_section footer_about">
									<div class="footer_logo_container">
									 
											<div class="footer_logo_text"><?php

$images = scandir("logo/", 1);

if(isset($images[0]) && !empty($images[0])){?>

<img src="logo/<?php echo $images[0];?>" style="max-width:300px;">
<?php } ?>
</div>
										 
									</div>
								 
									
								</div>
								
							</div>
  
						</div>
						<div class="row">
 
 
							<div class="col-lg-12 footer_col">
					
								<!-- Footer links -->
								<div class="footer_section footer_links">
 									<div class=" ">
									<div class="footer_social">
										<ul>
											<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
										</ul>
									</div>	 
									</div>
								</div>
								
							</div>

					 

						</div>
					
</div>

	<footer class="footer">
		 
		<div class="container">
		 

			<div class="row copyright_row">
				<div class="col">
					<div class="copyright d-flex flex-lg-row flex-column align-items-center justify-content-start">
						<div class="cr_text"> 
&copy;<script>document.write(new Date().getFullYear());</script> <a target="_blank"  href="http://www.tndss.com/"><?php echo getEmailandPhone('compinfo');?></a>, All rights reserved </a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
						<div class="ml-lg-auto cr_links">
							<ul class="cr_list">
								 
								<li><a href="#">Terms of Use</a></li>
								<li><a href="#">Privacy Policy</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	
	