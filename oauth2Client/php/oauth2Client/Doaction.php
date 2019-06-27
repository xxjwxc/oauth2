<?php
/**
 * Created by ann.
 * User: ann
 * Date: 2017/9/26
 * Time: 13:39
 */
include_once(dirname(__FILE__) . '/Config.php');
include_once(dirname(__FILE__) . '/Tools.php');
class Doaction{

    //注册或修改密码
    public static function Do_action($requestObj)
    {
        //$requestObj转换成数组
        $paramArray = json_decode(json_encode($requestObj), true);
        $returnArray = array();
        //参数检测

        if (array_key_exists('username', $paramArray) == 0 || array_key_exists('password', $paramArray) == 0 || array_key_exists('verify', $paramArray) == 0 || array_key_exists('flag', $paramArray) == 0 || array_key_exists('bundleid', $paramArray) == 0) {
            $returnArray['state'] = false;
            $returnArray['code'] = 1001;
            $returnArray['error'] = "参数无效";
            return $returnArray;
        }
        $userName = $paramArray['username'];    //用户
        $passWord = $paramArray['password'];    //密码
        $verify = $paramArray['verify'];    //验证码
        $flag = $paramArray['flag'];  //1：注册 2：修改密码
        $bundleId = $paramArray['bundleid']; //场景ID

        if (empty($userName) || empty($passWord) || empty($verify) || empty($flag) || empty($bundleId)) {
            $returnArray['state'] = false;
            $returnArray['code'] = 1001;
            $returnArray['error'] = "参数无效";
            return $returnArray;
        }
        //配置信息
        $url = Get_oauth2_doaction_url();
        $appId = Get_app_id();
        $appSecret = Get_app_secret();

        $signature = strtoupper(md5($userName . $passWord . $verify . strval($flag) . $bundleId . $appId . $appSecret));

        //发送POST请求
        $data = array(
            'username' => $userName,
            'password' => $passWord,
            'verify' => $verify,
            'flag' => $flag,
            'appid' => $appId,
            'bundleid' => $bundleId,
            'signature' => $signature
        );
        $result = Send_json_post($url, $data);
        return json_decode($result, true);

    }
}




?>