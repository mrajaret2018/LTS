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
    //laptopid,requesterid,requestdate
    $empid = $_SESSION['empid'];
    $laptopid = $_REQUEST['laptopid'];
    $requesterid = $_REQUEST['requesterid'];
    $requestdate = $_REQUEST['requestdate'];
    $currentdate = date("Y-m-d");     
        
	//$link = unserialize($_SESSION["db"]);
	$sql = "update details set rejecterid = '$empid', rejecteddate = '$currentdate' where laptopid ='$laptopid' and requesterid = '$requesterid' and requestdate = '$requestdate' ";
    //$debug->debug("Variable sql: ", $sql);
     
	$rtnstr = "Just initialised";
    if ($link->real_query($sql) === TRUE) {
        $sql = "update master set status = 'INSTOCK' where laptopid = '$laptopid'";
        if ($link->real_query($sql) === TRUE) {      
            $rtnstr = 'Your request is Rejected';
        }
    }

    else {

        // Always check for errors
        //if($link->connect_errno){
           $rtnstr = $link->connect_error;  
           
           //$rtnstr = "Sucks";
           
    
        //}
    }

    //$rtnstr = '<form><input type="radio" name="gender" value="male" checked> Male<br><input type="radio" name="gender" value="female"> Female<br><input type="radio" name="gender" value="other"> Other</form> ';
    //echo $rtnstr.$sql;
    //echo $empid;
    echo $rtnstr;
 ?>