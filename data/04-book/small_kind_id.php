<?php
header('Content-Type: application/json;charset=UTF-8');
require_once("../init.php");
$title=$_REQUEST['title'];
$sql="SELECT bid FROM small_kind_book WHERE title='$title'";
$result=sql_execute($sql);
echo json_encode($result);