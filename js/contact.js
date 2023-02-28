 function SaveContactForm(){
	 
	  $(".contformbtn").hide();
	  $(".loadingnow_cont").html('');
	  $(".loadingnow_cont").html('<button type="submit" class="btn btn-danger contformbtn" style=""><i class="fa fa-spinner" aria-hidden="true"></i> Processing</button>');
	   $(".loadingnow_cont").show();
	  $.ajax({
                        type: "POST",
                        url: "contact_ajax.php",
                        data: $('#contact_form_user').serialize(),
                        cache: false,
                        success: function (data) {
							//alert(data);
							 $(".contformbtn").show();
	                         $(".loadingnow_cont").hide();
							 
							//alert(data);
							jasondata= $.parseJSON(data);
							$(".redblock").removeClass('redblockview');
							$(".errorspan").html('');
							 $.each(jasondata, function(key, value){
								  
								 
								 if(key=='successmessage'){
									$(".redblock").removeClass('redblockview');
						        	$(".errorspan").html(''); 
									$("#contact_form_user").trigger("reset");
									Swal.fire("Success!", value, "success"); 
									 }else{ 
								  
								  
								  
								 $("."+key).html(value);
								 $( "input[name='"+key+"']" ).addClass('redblockview');
								  $( "textarea[name='"+key+"']" ).addClass('redblockview');
								  
								  }
								 });
							 
							
                           // swal("Success!", "Your Fees  has been Added.", "success");
                            //td.draw();
                            
                        }
                    });
	  
	  return false;
	  }