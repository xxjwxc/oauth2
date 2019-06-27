<?php
/**
 * Created by ann.
 * User: ann
 * Date: 2017/9/26
 * Time: 13:39
 */
include_once(dirname(__FILE__) . '/Config.php');
include_once(dirname(__FILE__) . '/Tools.php');
class Login{

    //登录
    public static function Do_login($requestObj)
    {
        //$requestObj转换成数组
        $paramArray = json_decode(json_encode($requestObj), true);
        $returnArray = array();
        //参数检测

        if (array_key_exists('username', $paramArray) == 0 || array_key_exists('password', $paramArray) == 0|| array_key_exists('time', $paramArray) == 0 ) {
            $returnArray['state'] = false;
            $returnArray['code'] = 1001;
            $returnArray['error'] = "参数无效";
            return $returnArray;
        }
        $userName = $paramArray['username'];    //用户
        $passWord = $paramArray['password'];    //密码
        $time = $paramArray['time'];    //时间戳

        if (empty($userName) || empty($passWord) || empty($time) ) {
            $returnArray['state'] = false;
            $returnArray['code'] = 1001;
            $returnArray['error'] = "参数无效";
            return $returnArray;
        }
        //配置信息
        $url = Get_oauth2_login_url();
        //发送POST请求
        $data = array(
            'username' => $userName,
            'password' => $passWord,
            'time' => $time
        );
        $result = Send_json_post($url, $data);
        return json_decode($result, true);

    }
}




?>