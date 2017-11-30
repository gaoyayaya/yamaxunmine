<?php
header('Content-Type: application/json;charset=UTF-8');
require_once("../init.php");
$sql='SELECT zid,title,count FROM big_kind_book';
$result=sql_execute($sql);
echo json_encode($result);