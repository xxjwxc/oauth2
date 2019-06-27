package user

import (
	"github.com/xxjwxc/public/mysign"
)

type Req_user_info struct {
	mysign.Sing_head
	Account string `json:"account,omitempty"` //用户名
}

type Req_up_info struct {
	mysign.Sing_head
	Account string `json:"account,omitempty"` //用户名
	//def.User_info_tbl
}
