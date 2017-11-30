<?php
header('Content-Type: application/json;charset=UTF-8');
require_once("../init.php");
$yy_id=$_REQUEST['yid'];
$sql="SELECT bid,title,count FROM small_kind_book WHERE yy_id=$yy_id";
$result=sql_execute($sql);
echo json_encode($result);