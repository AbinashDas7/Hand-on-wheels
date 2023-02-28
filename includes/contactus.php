
	 
	 
	 	<div class="Testimonial" id="contactus">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<h2 class="section_title">Contact Us</h2>
					
 					</div>
				</div>
			</div>
			 <div class="container">
				<div class="row">

					<!-- Contact Form -->
					<div class="col-lg-12">
						<div class="contact_form">
 							<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" onSubmit="return SaveContactForm()" class="comment_form" name="contact_form_user" id="contact_form_user" autocomplete="off">
								<div>
									<div class="form_title">Name</div>
									<input type="text" name="name_user" class="comment_input" >
									<span class="help-block name_user errorspan"></span>
								</div>
								<div>
									<div class="form_title">Email</div>
									<input type="text" name="email_user" class="comment_input">
									<span class="help-block email_user errorspan"></span>
								</div>
								<div>
									<div class="form_title">Message</div>
									<textarea name="message_user" class="comment_input comment_textarea"></textarea>
									<span class="help-block message_user errorspan"></span>
								</div>
								
							 
								
								<div class="form-group">
								
    <div for="exampleInputPassword1" class="form_title">Captcha / Security code</div>
	
    <input type="text" class="form-control" maxlength="4" onkeypress="javascript:return isNumber(event)" name="captchacodeverify" id="captchacodeverify" autocomplete="off">
	<span class="help-block captchacodeverify errorspan"></span>
	
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputPassword1" class="text-uppercase"></label>
    <img id="captcha_code" src="captcha_php_custom/captcha_code_contcat.php">
	<i class="fa fa-refresh fa-1x" style="cursor:pointer;padding-left:10px;font-size:20px;" aria-hidden="true" onclick="refreshCaptchaContact();"></i>
	<p class="text-danger">Enter above 4 digit code in "Security code" Box.</p>
  </div>
  
  
								
								<div>
									<button type="submit" class="btn btn-danger contformbtn">Send Message</button>
									<div class="form-group loadingnow_cont"></div>
								</div>
							</form>
						</div>
					</div>

					 
				</div>
			</div>
			 
		</div>
	</div>
	<script>
	function refreshCaptchaContact() {
		$("#captcha_code").attr('src','captcha_php_custom/captcha_code_contcat.php');
		}
	    refreshCaptchaContact();
 

 
	</script>