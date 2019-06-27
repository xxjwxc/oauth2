package cloopenaudio

/*
 容联云通讯 restful 短信平台
*/
import (
	"bytes"
	"crypto/md5"
	"data/config"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"public/tools"
	"strings"
	"time"
)

type RequestBody struct {
	AppId      string `json:"appId"`      //应用Id
	VerifyCode string `json:"verifyCode"` //验证码内容，为数字和英文字母，不区分大小写，长度4-8位
	To         string `json:"to"`         //接收号码，被叫为座机时需要添加区号
	DisplayNum string `json:"displayNum"` //显示主叫号码，显示权限由服务侧控制 400-660-6500
	PlayTimes  string `json:"playTimes"`  //循环播放次数，1－3次，默认播放1次。
	//RespUrl //语音验证码状态通知回调地址（必须符合URL规范），云通讯平台将向该Url地址发送呼叫结果通知。
	//Lang          string `json:"lang"` //播放的语言类型（暂不支持设置en，默认zh）。取值en（英文）、zh（中文），默认值zh。
	//WelcomePrompt string `json:"welcomePrompt"` //wav格式的文件名，欢迎提示音，在播放验证码语音前播放此内容，配合verifyCode使用，默认值空。语音文件通过官网上传审核后才可使用，放音文件的格式样本如下：位速 128kbps，音频采样大小16位，频道 1(单声道)， 音频采样级别 8 kHz，音频格式PCM，这样能保证放音的清晰度。
	MaxCallTime string `json:"maxCallTime"` //该通通话最大通话时长，到时间自动挂机
}

type VoiceVerifyBody struct {
	CallSid     string `json:"callSid"`
	DateCreated string `json:"dateCreated"`
	OrderId     string `json:"orderId"`
}

type ResponseBody struct {
	StatusCode  string          `json:"statusCode"`
	VoiceVerify VoiceVerifyBody `json:"VoiceVerify"`
}

const baseURL string = "https://app.cloopen.com:8883/2013-12-26/Accounts/%s/Calls/VoiceVerify?sig=%s"

var account_sid string //loginfo.GetParam("account_sid")
var auth_token string  //loginfo.GetParam("auth_token")
var appid string       //loginfo.GetParam("audioappid")
func init() {
	var smsConfigInfo config.SmsInfo = config.GetSmsInfo()
	account_sid = smsConfigInfo.AudioAppid //loginfo.GetParam("account_sid")
	auth_token = smsConfigInfo.Auth_token  //loginfo.GetParam("auth_token")
	appid = smsConfigInfo.AudioAppid       //loginfo.GetParam("audioappid")
}

func GetUrl() (url, authorization string) {
	var now string = time.Now().Format("20060102150405")

	h := md5.New()
	h.Write([]byte(account_sid + auth_token + now)) // 需要加密的字符串
	cipherStr := h.Sum(nil)
	sig := strings.ToUpper(hex.EncodeToString(cipherStr)) // 输出加密结果

	url = fmt.Sprintf(baseURL, account_sid, sig)

	authorization = tools.Base64Encode([]byte(account_sid + ":" + now))
	return
}

func SendAudioSMS(phone, verify string) bool {
	url, authorization := GetUrl()

	requestbody := RequestBody{appid, verify, phone, "15221896687", "2", "60"}
	postData, err := json.Marshal(requestbody)
	if err != nil {
		//        panic(err)
	}

	client := &http.Client{}
	req, _ := http.NewRequest("POST", url, bytes.NewReader(postData))
	req.Header.Add("Accept", "application/json")
	req.Header.Add("Content-Type", "application/json;charset=utf-8")
	req.Header.Add("Authorization", authorization)
	resp, _ := client.Do(req)
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return false
	}
	//result := string(body)

	stb := &ResponseBody{}
	err = json.Unmarshal(body, &stb)

	return stb.StatusCode == "000000"
}
