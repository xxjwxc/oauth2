package view

import (
	"time"

	"github.com/xxjwxc/oauth2/def"
)

type Oauth2_client_tbl struct {
	Id                int       `gorm:"primary_key"`
	App_key           string    `gorm:"column:app_key"`           //key
	App_secret        string    `gorm:"column:app_secret"`        //secret
	Expire_time       time.Time `gorm:"column:expire_time"`       //超时时间
	Strict_verify     int       `gorm:"column:strict_verify"`     //是否强制验证码:1：强制，2：忽略
	Token_expire_time int       `gorm:"column:token_expire_time"` //token超时时间
}

//type User_info_tbl struct {
//	Id       int
//	Nickname string `gorm:"column:nickname"` //别名
//	Headurl  string `gorm:"column:headurl"`  //url地址
//}

type User_account_tbl struct {
	Id          int
	Account     string //用户名
	Password    string //密码
	AccountType int    //用户类型 1:手机号，2：邮箱,3：其它
	App_key     string

	UserInfo   def.User_info_tbl //账户信息表 // One-To-One (属于 - 本表的 UserInfoID 作外键)
	UserInfoID int               `gorm:"column:user_info_id"` //

	RegTime   time.Time //注册时间
	RegIp     string    //注册ip
	Bundle_id string    //注册的应用
}
