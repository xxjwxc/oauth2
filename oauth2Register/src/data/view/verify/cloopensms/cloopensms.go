package cloopensms

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

	//"../mybase64"
)

type RequestBody struct {
	AppId      string   `json:"appId"`      //应用Id
	To         string   `json:"to"`         //短信接收端手机号码集合，用英文逗号分开，每批发送的手机号数量不得超过100个
	TemplateId string   `json:"templateId"` //模板Id
	Datas      []string `json:"datas"`      //内容数据外层节点，模板如果没有变量，此参数可不传

}

type TemplateSMSBody struct {
	DateCreated   string `json:"dateCreated"`
	SmsMessageSid string `json:"smsMessageSid"`
}

type ResponseBody struct {
	StatusCode  string          `json:"statusCode"`
	TemplateSMS TemplateSMSBody `json:"templateSMS"`
}

const baseURL string = "https://app.cloopen.com:8883/2013-12-26/Accounts/%s/SMS/TemplateSMS?sig=%s"

//const account_sid string = "8a216da856ff04b2015703417663037b"
//const auth_token string = "8c043a5ffc4a4a3d878ab61bb8ae88b0"
//const appid string = "8a216da856ff04b20157034176e4037f" //应用id
//配置信息

var account_sid string // loginfo.GetParam("account_sid")
var auth_token string  // loginfo.GetParam("auth_token")
var smsappid string    //loginfo.GetParam("smsappid")
var tempid string

func init() {
	var smsConfigInfo config.SmsInfo = config.GetSmsInfo()
	account_sid = smsConfigInfo.Account_sid // loginfo.GetParam("account_sid")
	auth_token = smsConfigInfo.Auth_token   // loginfo.GetParam("auth_token")
	smsappid = smsConfigInfo.SmsAppid       //loginfo.GetParam("smsappid")
	tempid = smsConfigInfo.SmsTempid
}

//loginfo.GetParam("smstempid")

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

func SendToSMS(phone, verify string) bool {
	url, authorization := GetUrl()

	requestbody := RequestBody{smsappid, phone, tempid, []string{verify, "5"}}
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
	result := string(body)

	fmt.Println(result)

	stb := &ResponseBody{}
	err = json.Unmarshal(body, &stb)

	fmt.Println(stb)

	return stb.StatusCode == "000000"
}
