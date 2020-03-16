package config

import (
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
	"path/filepath"
)

type Cfg_Base struct {
	Serial_number       string `json:"serial_number,omitempty"`       //对应JSON的serial_number,如果为空置则忽略字段
	Service_name        string `json:"service_name,omitempty"`        //对应JSON的 service_name,如果为空置则忽略字段
	Service_displayname string `json:"service_displayname,omitempty"` //对应JSON的 service_displayname,如果为空置则忽略字段
	Sercice_desc        string `json:"sercice_desc,omitempty"`        //对应JSON的 sercice_desc,如果为空置则忽略字段
	Http_Port           string `json:"http_port,omitempty"`           //对应JSON的 http_port,如果为空置则忽略字段
	Https_port          string `json:"https_port,omitempty"`          //对应JSON的 https_port,如果为空置则忽略字段
	Db_url              string `json:"db_url,omitempty"`              //对应JSON的 db_url,如果为空置则忽略字段
	Leveldb_dir         string `json:"leveldb_dir,omitempty"`         //对应JSON的 leveldb_dir,如果为空置则忽略字段 cache数据库
	Token_type          string `json:"token_type,omitempty"`
	App_id              string `json:"app_id,omitempty"`
	App_secret          string `json:"app_secret,omitempty"`
	IsDev               bool   `json:"is_dev,omitempty"` //是否是开发版本
	Es_addr_url         string `json:"es_addr_url"`
	Oauth2_url          string `json:"oauth2_url,omitempty"`
	Apiserver_url       string `json:"apiserver_url,omitempty"` //通用分析日志的url地址
	Register_url        string `json:"register_url,omitempty"`  //注册或修改密码URL
}

const (
	Url_host  = "/oauthclient"
	File_host = "/file"
)

var _map = Config{}

func init() {
	onInit()
	flag.Parse()
}

func onInit() {
	file, _ := exec.LookPath(os.Args[0])
	path, _ := filepath.Abs(file)
	path = filepath.Dir(path)

	err := InitFile(path + "/config.json")
	if err != nil {
		fmt.Println("InitFile: ", err.Error())
		return
	}
}

//是否是开发版本
func OnIsDev() bool {
	return _map.IsDev
}

//获取端口号
func GetServerPort() (strPort string) {
	strPort = _map.Http_Port
	return
}

//获取端口号
func GetServerHttpsPort() (strPort string) {
	strPort = _map.Https_port
	return
}

//获取db连接字符串
func GetDbUrl() (strMysqlUrl string) {
	strMysqlUrl = _map.Db_url
	return
}

//获取Leveldb的文件地址
func GetLevelDbDir() (strLeveldb_dir string) {
	strLeveldb_dir = _map.Leveldb_dir
	return
}

func InitFile(filename string) error {
	if IsRunTesting() {
		bytes := []byte(test_file)

		if err := json.Unmarshal(bytes, &_map); err != nil {
			fmt.Println("Unmarshal: ", err.Error())
			return err
		}
		fmt.Println(_map)

		return nil
	} else {
		bytes, err := ioutil.ReadFile(filename)
		if err != nil {
			fmt.Println("ReadFile: ", err.Error())
			return err
		}

		if err := json.Unmarshal(bytes, &_map); err != nil {
			fmt.Println("Unmarshal: ", err.Error())
			return err
		}

		return nil
	}

}

//获取service配置信息
func GetServiceConfig() (name, displayName, desc string) {
	name = _map.Service_name
	displayName = _map.Service_displayname
	desc = _map.Sercice_desc
	return
}

//获取token类型
func GetTokenType() string {
	return _map.Token_type
}

//获取授权信息码
func GetAppInfo() (appid, appsecret string) {
	appid = _map.App_id
	appsecret = _map.App_secret
	return
}

func GetLoginUrl() string {
	return _map.Oauth2_url + "/authorize"
}

func GetCheckTokenUrl() string {
	return _map.Oauth2_url + "/check_token"
}

func GetRefreshTokenUrl() string {
	return _map.Oauth2_url + "/refresh_token"
}

type VerifyInfo struct {
	Url        string
	AppId      string
	App_secret string
}

//获取验证码配置信息
func GetVerifyInfo() (verifyInfo VerifyInfo) {
	verifyInfo.Url = _map.Register_url + "/get_verify"
	verifyInfo.AppId = _map.App_id
	verifyInfo.App_secret = _map.App_secret
	return
}

type DoactionInfo struct {
	Url        string
	AppId      string
	App_secret string
}

//获取注册或修改密码配置信息
func GetDoactionInfo() (doactionInfo DoactionInfo) {
	doactionInfo.Url = _map.Register_url + "/doaction"
	doactionInfo.AppId = _map.App_id
	doactionInfo.App_secret = _map.App_secret
	return
}

func GetApiserverUrl(url string) string {
	return _map.Apiserver_url + url
}

func GetEsAddrUrl() string {
	return _map.Es_addr_url
}

func GetRegistUrl(url string) string {
	return _map.Register_url + url
}
