<?php
header('Content-Type: application/json;charset=UTF-8');

require_once("../init.php");
$sql = "SELECT fid,fname,pic,href,title,subtitle FROM ymx_family";
echo json_encode(sql_execute($sql));