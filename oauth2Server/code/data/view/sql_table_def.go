package view

import (
	"time"
)

//`beedb:"PK" sql:"UID" tname:"USER_INFO"` //if the table's PrimaryKey is not "Id", use this tag
type User_account_tbl struct {
	Id       int64  `gorm:"primary_key"`
	Account  string `json:"account"`
	Password string `json:"password"`
}

//type Oauth2_client_tbl struct {
//	Id                int       `beedb:"PK"`
//	App_key           string    `sql:"app_key"`           //key
//	App_secret        string    `sql:"app_secret"`        //secret
//	Expire_time       time.Time `sql:"expire_time"`       //超时时间
//	Token_expire_time int       `sql:"token_expire_time"` //token超时时间
//}

type Oauth2_access_token struct {
	Id           int       `gorm:"primary_key"`
	Access_token string    //token
	Token_type   string    //token类型
	App_key      string    //KEY
	Username     string    //用户名
	Expires      time.Time //过期时间
}

type Oauth2_refresh_token struct {
	Id                int       `gorm:"primary_key"`
	Refresh_token     string    //token
	Token_type        string    //token类型
	App_key           string    //KEY
	Username          string    //用户名
	Expires           time.Time //过期时间
	Token_expire_time int       //token超时时间
}
