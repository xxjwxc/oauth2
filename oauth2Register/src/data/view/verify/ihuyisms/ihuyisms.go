//接口类型：互亿无线触发短信接口，支持发送验证码短信、订单通知短信等。
// 账户注册：请通过该地址开通账户http://sms.ihuyi.com/register.html
// 注意事项：
//（1）调试期间，请用默认的模板进行测试，默认模板详见接口文档；
//（2）请使用APIID（查看APIID请登录用户中心->验证码短信->产品总览->APIID）及 APIkey来调用接口；
//（3）该代码仅供接入互亿无线短信接口参考使用，客户可根据实际需要自行编写；

package ihuyisms

import (
	"crypto/md5"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"time"

	"github.com/xxjwxc/oauth2/oauth2Register/src/data/config"
)

var _account_sid string //用户名是登录用户中心->验证码短信->产品总览->APIID
var _auth_token string  //查看密码请登录用户中心->验证码短信->产品总览->APIKEY
var _audioappid string  //查看密码请登录用户中心->验证码短信->产品总览->APIKEY

type responseBody struct {
	Code  int    `json:"code"`
	Smsid string `json:"smsid"`
}

func init() {
	var smsConfigInfo config.SmsInfo = config.GetSmsInfo()
	_account_sid = smsConfigInfo.Account_sid //用户名是登录用户中心->验证码短信->产品总览->APIID
	_auth_token = smsConfigInfo.Auth_token   //查看密码请登录用户中心->验证码短信->产品总览->APIKEY
	_audioappid = smsConfigInfo.AudioAppid   //查看密码请登录用户中心->验证码短信->产品总览->APIKEY
}

func getMd5String(s string) string {
	h := md5.New()
	h.Write([]byte(s))
	return hex.EncodeToString(h.Sum(nil))
}

func SendToSMS(phone, verify string) bool {
	v := url.Values{}
	_now := strconv.FormatInt(time.Now().Unix(), 10)
	//fmt.Printf(_now)

	_mobile := phone
	_content := "您的验证码是：" + verify + "。请不要把验证码泄露给其他人。"
	v.Set("account", _account_sid)
	v.Set("password", getMd5String(_account_sid+_auth_token+_mobile+_content+_now))
	v.Set("mobile", _mobile)
	v.Set("content", _content)
	v.Set("time", _now)
	body := ioutil.NopCloser(strings.NewReader(v.Encode())) //把form数据编下码
	client := &http.Client{}
	req, _ := http.NewRequest("POST", "http://106.ihuyi.com/webservice/sms.php?method=Submit&format=json", body)

	req.Header.Set("Content-Type", "application/x-www-form-urlencoded; param=value")
	//fmt.Printf("%+v\n", req) //看下发送的结构

	resp, err := client.Do(req) //发送
	defer resp.Body.Close()     //一定要关闭resp.Body
	data, _ := ioutil.ReadAll(resp.Body)

	mkv := &responseBody{}
	err = json.Unmarshal(data, &mkv)
	fmt.Println(mkv)

	fmt.Println(string(data), err)
	return mkv.Code == 2
}

func SendAudioSMS(phone, verify string) bool {
	v := url.Values{}
	_now := strconv.FormatInt(time.Now().Unix(), 10)
	//fmt.Printf(_now)
	_mobile := phone
	_content := verify
	v.Set("account", _account_sid)
	v.Set("password", getMd5String(_account_sid+_audioappid+_mobile+_content+_now))
	v.Set("mobile", _mobile)
	v.Set("content", _content)
	v.Set("time", _now)
	body := ioutil.NopCloser(strings.NewReader(v.Encode())) //把form数据编下码
	client := &http.Client{}
	req, _ := http.NewRequest("POST", "http://api.voice.ihuyi.com/webservice/voice.php?method=Submit&format=json", body)

	req.Header.Set("Content-Type", "application/x-www-form-urlencoded; param=value")
	//fmt.Printf("%+v\n", req) //看下发送的结构

	resp, err := client.Do(req) //发送
	defer resp.Body.Close()     //一定要关闭resp.Body
	data, _ := ioutil.ReadAll(resp.Body)

	mkv := &responseBody{}
	err = json.Unmarshal(data, &mkv)
	fmt.Println(mkv)

	fmt.Println(string(data), err)

	return mkv.Code == 2
}
