<?php
session_start();
//require("dbconn.php");
$link = include 'dbcon.php';

if ( isset($_REQUEST['name']) ) {
    header("Content-Type: text/plain");
    $name = $_REQUEST['name'];
    $pwdsupplied = $_REQUEST['pwd'];
   
   
    
    $sql = 'select passwd from users where empid="'.$name.'"';
 
    $rowid = 0;
    if ($link->real_query($sql) === TRUE) {
    
        $result = $link->use_result();
        
        while ($row = $result->fetch_row()) {
            $pwdindb = $row[0];
            $rowid++;
        }
    }


    if ($rowid > 1) {
        echo 'Duplicate User Names found in database. Please take support from your system administrator.';
        session_destroy();
        exit;
    }
    if ($rowid < 1) {
        echo 'User Name not found in database. Please take support from your system administrator.';
        session_destroy();
        exit;
    }
    if ($pwdindb == $pwdsupplied) {
        $_SESSION["empid"] = $name;
        echo 'Proceed';
    }
    else {
        session_destroy();
        echo 'Incorrect Password. You are not permitted to proceed.';
    }
}
?>

