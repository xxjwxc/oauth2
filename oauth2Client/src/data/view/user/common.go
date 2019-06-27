package user

import (
	"data/config"
	"plug/def"
	"public/message"
	"public/myhttp"
	"public/mylog"
	"public/mysign"
)

type MsgUserInfo struct {
	message.MessageBody
	Data def.User_info `json:"data,omitempty"`
}

//获取用户信息
func OnGetUserInfo(account string) (isfind bool, info def.User_info) {
	var req Req_user_info
	req.Appid = config.GetSignKey()
	req.Account = account
	req.Signature = mysign.OnGetSign(req.Appid, req)
	var r MsgUserInfo
	myhttp.SendPost(req, &r, config.GetRegistUrl("/get_userinfo"))
	mylog.Debug(r)
	if r.State {
		isfind = true
		info = r.Data
	} else {
		isfind = false
	}
	return
}

//更新用户信息
func OnUpdateUserInfo(account string, userinfo def.User_info_tbl) bool {
	var req Req_up_info
	req.Appid = config.GetSignKey()
	req.Account = account
	req.User_info_tbl = userinfo
	req.Signature = mysign.OnGetSign(req.Appid, req)
	var r message.MessageBody
	myhttp.SendPost(req, &r, config.GetRegistUrl("/update_userinfo"))
	mylog.Debug(r)
	return r.State
}
