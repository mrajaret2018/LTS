<?php
	session_start();

   // require_once("PHPDebug.php");
   // $debug = new PHPDebug();
    
	//echo $_SESSION["empid"];
    $link = include 'dbcon.php';
	//exit;
    // ensure has a valid login account
    if (array_key_exists('empid', $_SESSION) === FALSE) {
        echo 'NOLOGIN';
        exit;
    }
    $empid = $_SESSION['empid'];
    $justification = $_REQUEST['justification'];
    $committedrtndate = $_REQUEST['committedrtndate'];
    $phonext = $_REQUEST['phonext'];
    $lprequested = $_REQUEST['lprequested'];    
    $currentdate = date("Y-m-d");     
    
         

    

    
	//$link = unserialize($_SESSION["db"]);
	$sql = "insert into details (laptopid, requesterid, requestdate, reason, committedrtndate, phoneext) values ('$lprequested', '$empid','$currentdate','$justification','$committedrtndate','$phonext' )";
    //$debug->debug("Variable sql: ", $sql);
     
	$rtnstr = "Just initialised";
    if ($link->real_query($sql) === TRUE) {
        $sql = "update master set eta = '$committedrtndate', status = 'REQUESTED' where laptopid = '$lprequested'";
        if ($link->real_query($sql) === TRUE) {      
            $rtnstr = 'Your request is placed';
        }
    }

    else {

        // Always check for errors
        if($link->connect_errno){
           $rtnstr = $link->connect_error;  
        
    
        }
    }

    //$rtnstr = '<form><input type="radio" name="gender" value="male" checked> Male<br><input type="radio" name="gender" value="female"> Female<br><input type="radio" name="gender" value="other"> Other</form> ';
    echo $rtnstr;
    //echo $empid;
 ?>