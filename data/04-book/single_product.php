<?php
header('Content-Type: application/json;charset=UTF-8');
require_once("../init.php");
@$middle_id=$_REQUEST["mid"];
@$small_id=$_REQUEST["sid"];
@$title=$_REQUEST["title"];
@$copy=$_REQUEST["copy"];
@$on_sale=$_REQUEST["sale"];
@$price1=$_REQUEST["price1"];
@$price2=$_REQUEST["price2"];
@$writer=$_REQUEST["writer"];
@$time=$_REQUEST["time"];
@$send_way=$_REQUEST["send"];
@$intro=$_REQUEST["intro"];
@$discount1=$_REQUEST["discount1"];
@$discount2=$_REQUEST["discount2"];
@$is_new=$_REQUEST["new"];

$sql2="SELECT aid,title,copy,on_sale,price,writer,time,send_way,
intro,introimg,discount,is_new,(select md_pic FROM book_list WHERE z_id=aid limit 0,1)
as img FROM book_product WHERE large_id=2";
if($middle_id){
$sql2.=" AND middle_id=$middle_id";
}
if($small_id){
$sql2.=" AND small_id=$small_id";
}
if($title){
$sql2.=" AND title=$title";
}
if($copy){
$sql2.=" AND copy=$copy";
}
if($on_sale){
$sql2.=" AND on_sale=$on_sale";
}
if($price1){
$sql2.=" AND price>=$price1";
}
if($price2){
$sql2.=" AND price<=$price2";
}
if($writer){
$sql2.=" AND writer=$writer";
}
if($time){
$sql2.=" AND time>=$time";
}
if($send_way){
$sql2.=" AND send_way=$send_way";
}
if($intro){
$sql2.=" AND intro>=$intro";
}
if($discount1){
$sql2.=" AND discount>=$discount1";
}
if($discount2){
$sql2.=" AND discount<=$discount2";
}
if($is_new){
$sql2.=" AND is_new=$is_new";
}
$output=sql_execute($sql2);
echo json_encode($output);