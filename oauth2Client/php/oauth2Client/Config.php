<?php
/**
 * Created by ann.
 * User: ann
 * Date: 2017/9/26
 * Time: 13:39
 */

//获取验证码
function Get_oauth2_verify_url(){
    return "http://192.168.0.152:7021/oauth2/api/v1/get_verify";
}
//注册或修改密码
  function Get_oauth2_doaction_url(){
    return "http://192.168.0.152:7021/oauth2/api/v1/doaction";
}
//登录
    function Get_oauth2_login_url(){
        return "http://127.0.0.1:7011/wwwthings/api/v1/login";
    }
//app_id
  function Get_app_id(){
    return "wwwthings";
}

//app_secret
  function Get_app_secret(){
    return "4EE0A9A43B9B911C067BEE5CC50A9972";
}



?>