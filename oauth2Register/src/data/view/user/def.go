package user

import (
	"github.com/xxjwxc/oauth2/def"
	"github.com/xxjwxc/oauth2/def/mysign"
)

type Req_user struct {
	UserName string `json:"username,omitempty"` //用户名
}

type Req_user_info struct {
	mysign.Sing_head
	Account string `json:"account,omitempty"` //用户名
}

type Req_up_info struct {
	mysign.Sing_head
	Account string `json:"account,omitempty"` //用户名
	def.User_info_tbl
}
