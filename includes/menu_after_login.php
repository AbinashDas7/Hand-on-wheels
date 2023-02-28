

	<header class="header">

			

		<!-- Top Bar -->

		

		<div class="container">

					<div class="row">

						<div class="col text-center">

					<a href="index.php"><?php

$images = scandir("logo/", 1);

if(isset($images[0]) && !empty($images[0])){?>

<img src="logo/<?php echo $images[0];?>" style="max-width:200px;">
<?php } ?>
</a>	

						</div>

					</div>

					

					</div>

					

		

		

		

		<div class="top_bar2">

			<div class="top_bar_container">

				<div class="container">

					<div class="row">

						<div class="col">

						

							<div class="text-center top_bar_content  flex-row align-items-center justify-content-start">

								<ul class="top_bar_contact_list">

 									<li>

										<i class="fa fa-user" aria-hidden="true"></i>



										<div><a href="profiledetails.php">Profile</a></div>

									</li>

									<li>

										<i class="fa fa-graduation-cap" aria-hidden="true"></i>

										<div><a href="my_seminars.php">My Seminars</a></div>

									</li>

									<!--<li>

										<i class="fa fa-graduation-cap" aria-hidden="true"></i>

										<div><a href="user-dashboard.php">Read Seminar</a></div>

									</li>-->

									<li>

										<i class="fa fa-graduation-cap" aria-hidden="true"></i>

										<div><a href="bookaseminar.php">Book a new Seminar</a></div>

									</li>

										<li>

										<i class="fa fa-key" aria-hidden="true"></i>



										<div><a href="change_password.php">Change Password</a></div>

									</li>

									<li>

										<i  class="fa fa-sign-out" aria-hidden="true"></i>



										<div><a href="logout.php">Logout</a></div>

									</li>

				 

								</ul>

								 

							</div>

						</div>

					</div>

				</div>

			</div>				

		</div>

 



	 		

	</header>