package def

import "github.com/xxjwxc/public/tools"

type Signa struct {
	UserName  string `json:"username,omitempty"`  //用户名
	Appid     string `json:"appid,omitempty"`     //appid
	Signature string `json:"signature,omitempty"` //签名
}

type User_info_tbl struct {
	Id       int    `json:"-"`
	Nickname string `json:"nickname";gorm:"column:nickname"` //别名
	Headurl  string `json:"headurl";gorm:"column:headurl"`   //url地址
}

type User_info struct {
	Account     string        `json:"account"`     //用户名
	AccountType int           `json:"accountType"` //用户类型 1:手机号或账户，2：邮箱,3:其它
	App_key     string        `json:"app_key"`     //注册时的验签key
	UserInfo    User_info_tbl `json:"userInfo"`    //账户信息表 // One-To-One (属于 - 本表的 UserInfoID 作外键)
	RegTime     tools.Time    `json:"regTime"`     //注册时间
	RegIp       string        `json:"regIp"`       //注册ip
	Bundle_id   string        `json:"bundle_id"`   //注册的应用id
}
