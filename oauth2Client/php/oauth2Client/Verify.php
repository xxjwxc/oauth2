<?php
/**
 * Created by ann.
 * User: ann
 * Date: 2017/9/26
 * Time: 13:39
 */
include_once(dirname(__FILE__) . '/Config.php');
include_once(dirname(__FILE__) . '/Tools.php');
class Verify{

    //获取验证码
    public static function GetVerify($requestObj){
        //$requestObj转换成数组
        $paramArray = json_decode(json_encode($requestObj),true);
        $returnArray=array();
        //参数检测
        if(array_key_exists('lg',$paramArray)==0||array_key_exists('username',$paramArray)==0||array_key_exists('flag',$paramArray)==0||array_key_exists('smsflag',$paramArray)==0){
            $returnArray['state']=false;
            $returnArray['code']=1001;
            $returnArray['error']="参数无效";
            return $returnArray;
        }
        $lg=$paramArray['lg'];    //语言cn en
        $userName=$paramArray['username'];    //用户名
        $flag=$paramArray['flag'];    //1:注册 2：修改密码
        $msgFlag=$paramArray['smsflag'];  //1：短信 2：语音

        if(empty($lg)||empty($userName)||empty($flag)||empty($msgFlag)){
            $returnArray['state']=false;
            $returnArray['code']=1001;
            $returnArray['error']="参数无效";
            return $returnArray;
        }
        //配置信息
        $url=Get_oauth2_verify_url();
        $appId=Get_app_id();
        $appSecret=Get_app_secret();

        $signature=strtoupper(md5($lg.$userName.strval($flag).strval($msgFlag).$appId.$appSecret));

        //发送POST请求
        $data=array(
            'lg' => $lg,
            'username' => $userName,
            'flag' => $flag,
            'appid' => $appId,
            'smsflag' => $msgFlag,
            'signature' => $signature
        );
        $result=Send_json_post($url,$data);
        return json_decode($result, true);

    }
}




?>