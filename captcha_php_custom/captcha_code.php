<?php
session_start();
$random_alpha = (rand());
$captcha_code = substr($random_alpha, 0, 4);
$_SESSION["captcha_code"] = $captcha_code;
$target_layer = imagecreatetruecolor(50,30);
$captcha_background = imagecolorallocate($target_layer,9, 115, 186);
imagefill($target_layer,0,0,$captcha_background);
$captcha_text_color = imagecolorallocate($target_layer, 255, 255, 255);
imagestring($target_layer, 5, 5, 5, $captcha_code, $captcha_text_color);
header("Content-type: image/jpeg");
imagejpeg($target_layer);
?>