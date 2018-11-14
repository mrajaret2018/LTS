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
	$sql = "select count(*) from master where status='INSTOCK'";

	
    if ($link->real_query($sql) === TRUE) {
        $result = $link->use_result();
        
        while ($row = $result->fetch_row()) {
            $stockonhand = $row[0];
            
        }
    }

	$sql = "select count(*) from master  where status='DISPATCHED' and eta <= curdate()";

	
    if ($link->real_query($sql) === TRUE) {
        $result = $link->use_result();
        
        while ($row = $result->fetch_row()) {
            $stockduetilltoday = $row[0];
    
        }
    }

	$sql = "select count(*) from master  where status='DISPATCHED' and eta > curdate()";

	
    if ($link->real_query($sql) === TRUE) {
        $result = $link->use_result();
        
        while ($row = $result->fetch_row()) {
            $stockduelatter = $row[0];
    
        }
    }    

    $sql = "select isapprover, isstorekeeper from users  where empid=$empid";

    if ($link->real_query($sql) === TRUE) {
        $result = $link->use_result();
        
        while ($row = $result->fetch_row()) {
            $isapprover = $row[0];
            $isstorekeeper = $row[1];
            
        }
    }    

    echo "stockonhand=$stockonhand&stockduetilltoday=$stockduetilltoday&stockduelatter=$stockduelatter&isapprover=$isapprover&isstorekeeper=$isstorekeeper";
    //echo $empid;
 ?>