<div class="header_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="header_content d-flex flex-row align-items-center justify-content-start">
							<div class="logo_container">
								<a href="index.php">
									 
                                    
                                    <?php

$images = scandir("logo/", 1);

if(isset($images[0]) && !empty($images[0])){?>

<img src="logo/<?php echo $images[0];?>" style="width:156px;padding-top:10px;padding-bottom:10px;">
<?php } ?>


								</a>
							</div>
							<nav class="main_nav_contaner ml-auto">
								<ul class="main_nav">
									<li><a href="index.php">Home</a></li>
									<li><a href="#seminars">Seminars</a></li>
									<li><a href="#Features">Features</a></li>
									
									<li><a href="#whyus">Why Choose Us</a></li>
									
									<li><a href="#Testimonial">Testimonial</a></li>
 									<li><a href="#contactus">Contact</a></li>
								</ul>
								

								<!-- Hamburger -->

								
								<div class="hamburger menu_mm">
									<i class="fa fa-bars menu_mm" aria-hidden="true"></i>
								</div>
							</nav>

						</div>
					</div>
				</div>
			</div>
		</div>