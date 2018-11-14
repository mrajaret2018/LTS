<?php
	session_start();
    
	//echo $_SESSION["empid"];
	
    // ensure has a valid login account
    if (array_key_exists('empid', $_SESSION) === FALSE) {
        echo 'NOLOGIN';
        exit;
    }
    $empid = $_SESSION["empid"];
    $link = include 'dbcon.php';
	//$link = unserialize($_SESSION["db"]);
    $sql = "select count(*) from master a, details b where  a.laptopid = b.laptopid and a.status = 'REQUESTED' and b.requesterid = '$empid'";


    $rowid = 0;
    if ($link->real_query($sql) === TRUE) {
        $result = $link->use_result();
        
        while ($row = $result->fetch_row()) {
            
            $countoflaptosalreadyrequested = $row[0];
            $rowid++;
            
        }
        
    }
    
    if ($countoflaptosalreadyrequested > 0) {
        echo "You have already requested. You can't request until your previous request is processed";
        exit;
    }

	$sql = "select laptopid from master where status = 'INSTOCK' or status = 'REJECTED'";
    $rtnstr = '<form>';
	$rowid = 0;
    if ($link->real_query($sql) === TRUE) {
        $result = $link->use_result();
        
        while ($row = $result->fetch_row()) {
            $RBstuff = '<input type="radio" name="requestedLP" value="'; 
            $laptopid = $row[0];
            $rowid++;
            $RBstuff .= $laptopid;
            $RBstuff .= '" checked> ';
            $RBstuff .= $laptopid;
            $rtnstr .= $RBstuff;
            $rtnstr .= '<br>';
        }
        $rtnstr .= '<button type="button" onclick="LPRequested();" > OK</button>';
        $rtnstr .= '</form>';
    }
    //$rtnstr = '<form><input type="radio" name="gender" value="male" checked> Male<br><input type="radio" name="gender" value="female"> Female<br><input type="radio" name="gender" value="other"> Other</form> ';
    echo $rtnstr;
    //echo $empid;
 ?>