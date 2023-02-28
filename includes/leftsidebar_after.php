				<div class="borderallsection">
				<div class="sidebar_section_title">Welcome</div>
				<ul class="leftprf">
				<li><?php if(isset($_SESSION['fname'])){echo '<b><i class="fa fa-user" aria-hidden="true"></i> Name:</b><br/>'.$_SESSION['fname'].' '.$_SESSION['lname'];} ?></li>
				<li><?php if(isset($_SESSION['email'])){echo'<b><i class="fa fa-at" aria-hidden="true"></i>Username/Email:</b><br/>'.$_SESSION['email'];} ?></li>
				<li><?php if(isset($_SESSION['phone'])){echo '<b><i class="fa fa-phone" aria-hidden="true"></i> Phone:</b><br/>'.$_SESSION['phone'];} ?></li>
				<li><?php if(isset($_SESSION['acc_created'])){
				echo '<b><i class="fa fa-key"></i>Account created date:</b><br/>'.$_SESSION['acc_created'];} ?></li>
				</ul>
                
                
                
                <div class="adssection">
               
                 <?php echo getAdscall(2); ?>
                
                </div>
                
				</div>
                
                
