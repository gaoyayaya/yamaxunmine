<?php
header("Content-Type:application/json;charset=UTF-8");
require_once("../init.php");
@$uname=$_REQUEST["name"];
@$upwd=$_REQUEST["pwd"];

$sql="SELECT uid FROM ymx_user WHERE uname='$uname' AND upwd='$upwd'";
$result=mysqli_query($conn,$sql);

if($result==false){
  echo "执行失败";
}else{
  $rowList=mysqli_fetch_all($result,1);
  if($rowList==null){
    echo '{"code":1,"msg":"用户名或密码错误"}';
  }else{
    session_start();
    $_SESSION["uid"]=$rowList[0]['uid'];
    echo json_encode($rowList);
  }
}



?>


