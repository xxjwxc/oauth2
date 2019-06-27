package doaction

import "github.com/xxjwxc/public/mysign"

type Req_doaction struct {
	mysign.Sing_head
	UserName string `json:"username"`         //用户名
	Password string `json:"password"`         //密码
	Verify   string `json:"verify,omitempty"` //验证码
	Flag     int    `json:"flag,omitempty"`   //1:注册，2:修改密码
	//Appid     string `json:"appid,omitempty"`     //appid
	Bundleid string `json:"bundleid,omitempty"` //bundleid
	//Signature string `json:"signature,omitempty"` //签名
}
