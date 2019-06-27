<?php
/**
 * Created by PhpStorm.
 * User: ann
 * Date: 2017/9/27
 * Time: 21:25
 */

/**
 * 发送post请求
 * @param string $url 请求地址
 * @param array $post_data post键值对数据
 * @return string
 */
function Send_json_post($url, $post_data) {
    $jsonEncodedParams = json_encode($post_data);

    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_HTTPHEADER, array("Content-Type: application/json"));
    curl_setopt($curl, CURLOPT_POST, 1);

    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $jsonEncodedParams);
    curl_setopt($curl, CURLOPT_HEADER, true);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_HEADER, false);
    curl_setopt($curl, CURLOPT_NOSIGNAL,1);    //注意，毫秒超时一定要设置这个
    curl_setopt($curl, CURLOPT_TIMEOUT_MS,10000);  //超时毫秒，cURL 7.16.2中被加入。从PHP 5.2.3起可使用

    //var_dump($post_data);
    $response = curl_exec($curl);
    return $response;

}
?>