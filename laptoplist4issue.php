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
	$sql = "select c.name, b.reason, b.committedrtndate, b.laptopid,b.requesterid,b.requestdate from master a, details b, users c where a.status = 'APPROVED' and a.laptopid = b.laptopid and b.requesterid = c.empid";
    $rtnstr = '<form>';
	$rowid = 0;
    if ($link->real_query($sql) === TRUE) {
        $result = $link->use_result();
        
        while ($row = $result->fetch_row()) {
            $CHKBOXstuff = '<input type="checkbox" name="IssueLP" value="'; 
            $laptopid = $row[0]."  ".$row[1]."  ".$row[2]."  ".$row[3]."  ".$row[4]."  ".$row[5];
            $rowid++;
            $CHKBOXstuff .= $laptopid;
            $CHKBOXstuff .= '" checked> ';
            $CHKBOXstuff .= $laptopid;
            $rtnstr .= $CHKBOXstuff;
            $rtnstr .= '<br>';
        }
        $rtnstr .= '<input type="hidden" id="empid" value="'.$empid.'">';
        $rtnstr .= '<button type="button" id="IssueLP"  > Issue</button>';
        
        $rtnstr .= '</form>';
    }
    //$rtnstr = '<form><input type="radio" name="gender" value="male" checked> Male<br><input type="radio" name="gender" value="female"> Female<br><input type="radio" name="gender" value="other"> Other</form> ';
    echo $rtnstr;
    //echo $empid;
 ?>