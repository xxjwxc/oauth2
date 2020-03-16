package config

import (
	"fmt"
	"os"
	"strings"
)

const (
	test_file = `

{
"serial_number":"1.0",
"leveldb_dir":"./database",
"service_name":"hotelserver", 
"service_displayname":"hotelserver", 
"sercice_desc":"hotelserver",
"is_dev":true,
"http_port":"7011",
"https_port":"7012",
"db_url":"root:qwer@tcp(192.168.0.99:3306)/oauth_db?charset=utf8&parseTime=True&loc=Local",
"login_url":"http://192.168.0.152:7001/api/v1/authorize",
"check_token_url":"http://192.168.0.152:7001/api/v1/check_token",
"refresh_token_url":"http://192.168.0.152:7001/api/v1/refresh_token",
"token_type":"nomal",
"app_id":"wwwthings",
"app_secret":"4EE0A9A43B9B911C067BEE5CC50A9972",
"verify_url":"http://192.168.0.152:7021/oauth2/api/v1/get_verify",  
"doaction_url":"http://192.168.0.152:7021/oauth2/api/v1/doaction",
"file_head_url":"http://127.0.0.1:7011/hotelserver/file/",
"small_appid":"",
"small_secret":"",
"wx_appid":"wxe12fb98bdebdff01",
"wx_appSecret":"2888ca8d524d160620759d436e46de1f",
"wx_token":"3",
"wx_encodingAESKey":"4",
"wx_authorize_url":"http://madmin.paradise4d.com/credit_card/index.do",
"server_user_info_url":"http://192.168.0.152:7031/apiserver/api/v1/auto_menu/get_one_user",
"es_addr_url":"http://192.168.0.152:9200",
"sign_api_key":"wwwthings",
"sign_AnalyLogUrl":"http://api.paradise4d.com:6011/apiserver/api/v1/log/add_auto_analy_log"
}
`
)

//判断是否在测试环境下使用
func IsRunTesting() bool {
	if len(os.Args) > 1 {
		fmt.Println(os.Args[1])
		return strings.HasPrefix(os.Args[1], "-test")
	}
	return false
}
