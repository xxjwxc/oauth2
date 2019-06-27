<?php
//数据操作类
require('Request.php');
//输出类
require('Response.php');
//获取数据
$data = Request::getRequest();
//输出结果
Response::sendResponse($data);

?>

