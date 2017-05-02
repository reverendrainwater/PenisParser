<?php
$inputStr = "";
$outputStr = "";
if (isset($_GET['input'])){
    $inputStr = $_GET['input'];
    $split = preg_split('/\s+/', $inputStr);
    foreach($split as $part) {
        $outputStr .= "penis ";
    }
    unset($part);
    echo $outputStr;
}
else {
    echo "Invalid URL: use /penis.php?input=this is a test my guy"
}
