<?php
try {
     $link = new mysqli('localhost', 'root', 'Kanthan_0909', 'LTS') ;
} catch (Exception $e ) {
     echo "Service unavailable";
     echo "message: " . $e->message;   // not in live code obviously...
     session_destroy();
     exit;
}
return $link;
?>