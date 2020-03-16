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

type Config struct {
	Serial_number       string `json:"serial_number,omitempty"`       //对应JSON的serial_number,如果为空置则忽略字段
	Log_maxSize         uint64 `json:"log_maxSize,omitempty"`         //对应JSON的 log_maxSize,如果为空置则忽略字段
	Service_name        string `json:"service_name,omitempty"`        //对应JSON的 service_name,如果为空置则忽略字段
	Service_displayname string `json:"service_displayname,omitempty"` //对应JSON的 service_displayname,如果为空置则忽略字段
	Sercice_desc        string `json:"sercice_desc,omitempty"`        //对应JSON的 sercice_desc,如果为空置则忽略字段
	Http_Port           string `json:"http_port,omitempty"`           //对应JSON的 http_port,如果为空置则忽略字段
	Https_port          string `json:"https_port,omitempty"`          //对应JSON的 https_port,如果为空置则忽略字段
	Db_url              string `json:"db_url,omitempty"`              //对应JSON的 db_url,如果为空置则忽略字段
	Leveldb_dir         string `json:"leveldb_dir,omitempty"`         //对应JSON的 leveldb_dir,如果为空置则忽略字段 cache数据库
	//Time int64  `json:"-"`              // 直接忽略字段
	IsDev       bool   `json:"is_dev,omitempty"` //是否是开发版本
	Es_addr_url string `json:"es_addr_url"`
}

var Static_host = [2]string{"./test", "/temple"}

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

func GetEsAddrUrl() string {
	return _map.Es_addr_url
}

func InitFile(filename string) error {
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

func GetServiceConfig() (name, displayName, desc string) {
	name = _map.Service_name
	displayName = _map.Service_displayname
	desc = _map.Sercice_desc
	return
}

//刷新
//func Flush() {
//	glog.Flush()
//}
