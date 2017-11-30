<?php
header("Content-Type:text/plain;charset=UTF-8");
session_start();
@$uid=$_SESSION["uid"];
if($uid){
  require_once("../init.php");
  $sql="select uname from ymx_user where uid=$uid";
  $uname=sql_execute($sql)[0]["uname"];
  echo $uname;
}else
  echo '登录';