package register

import "time"

type Req_register struct {
	UserName string `json:"username,omitempty"` //用户名
	Password string `json:"password,omitempty"` //密码
	Verify   string `json:"verify,omitempty"`   //验证码
	Flag     int    `json:"flag,omitempty"`     //1:注册，2:修改密码
	Bundleid string `json:"bundleid,omitempty"` //bundleid

}

type RequestBody struct {
	UserName  string `json:"username,omitempty"`  //用户名
	Password  string `json:"password,omitempty"`  //密码
	Verify    string `json:"verify,omitempty"`    //验证码
	Flag      int    `json:"flag,omitempty"`      //1:注册，2:修改密码
	Appid     string `json:"appid,omitempty"`     //appid
	Bundleid  string `json:"bundleid,omitempty"`  //bundleid
	Signature string `json:"signature,omitempty"` //签名
}

type ResponseBody struct {
	State bool        `json:"state"`
	Code  int         `json:"code,omitempty"`
	Error string      `json:"error,omitempty"`
	Data  interface{} `json:"data,omitempty"`
}

type Oauth2_client_tbl struct {
	Id                int       `gorm:"primary_key"`
	App_key           string    `gorm:"column:app_key"`           //key
	App_secret        string    `gorm:"column:app_secret"`        //secret
	Expire_time       time.Time `gorm:"column:expire_time"`       //超时时间
	Strict_verify     int       `gorm:"column:strict_verify"`     //是否强制验证码:1：强制，2：忽略
	Token_expire_time int       `gorm:"column:token_expire_time"` //token超时时间
}
