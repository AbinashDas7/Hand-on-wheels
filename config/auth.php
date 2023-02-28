<?php
if(!isset($_SESSION["loginid"])){
header('Location:login.php?error='.base64_encode('Please login first.')); //
exit;
}
 
?>

