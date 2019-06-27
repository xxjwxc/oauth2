<?php

/**
 * 数据操作类
 */
require('Verify.php');
require('Doaction.php');
require('Login.php');
class Request
{
    //允许的请求方式
    private static $method_type = array('get', 'post', 'put', 'patch', 'delete');

    public static function getRequest()
    {
        //请求方式
        $method = strtolower($_SERVER['REQUEST_METHOD']);
        if (in_array($method, self::$method_type)) {
            //调用请求方式对应的方法
            $data_name = $method . 'Data';
            if($method=="post"){
                return self::$data_name($_REQUEST,$GLOBALS['HTTP_RAW_POST_DATA']);
            }else{
                return self::$data_name($_REQUEST);
            }
           
        }
        return false;
    }

    //GET
    private static function getData($request_data)
    {

    }

    //POST
    private static function postData($request_data,$request_body)
    {
        $action = (string)$request_data['action'];
        $rBody=json_decode($request_body);
        //获取验证码
        if ($action =="verify") {
            //return self::$test_class[2];
            return Verify::GetVerify($rBody);
        } else if($action == "doaction"){ //注册或修改密码
            return Doaction::Do_action($rBody);
        }else if($action == "login"){ //登录
            return Login::Do_login($rBody);
        }
        else{
            return array();
        }
    }


    //PUT
    private static function putData($request_data)
    {

    }

    //PATCH
    private static function patchData($request_data)
    {

    }

    //DELETE
    private static function deleteData($request_data)
    {

    }
}