<?php 
    header('Access-Control-Allow-Origin: *');
	//define('UPLOAD_DIR', 'TaskImages/');
	//$img = $_POST["image-data"];
	//$img = str_replace('data:image/png;base64,', '', $img);
	//$img = str_replace(' ', '+', $img);
	//$data = base64_decode($img);
	//$file = UPLOAD_DIR . uniqid() . '.png';
	//$success = file_put_contents($file, $data);
	//echo $_POST["image-data"];
    // baseFromJavascript will be the javascript base64 string retrieved of some way (async or post submited)
	$baseFromJavascript =  $_POST['base64']; //your data in base64 'data:image/png....';
	// We need to remove the "data:image/png;base64,"
	$base_to_php = explode(',', $baseFromJavascript);
	// the 2nd item in the base_to_php array contains the content of the image
	$data = base64_decode($base_to_php[1]);
	// here you can detect if type is png or jpg if you want
$UD=uniqid();
	$filepath = "../TaskImages/" . $UD . ".png"; // or image.jpg

	// Save the image in a defined path
	file_put_contents($filepath,$data);
  echo $UD . ".png";

?>