package user

import (
	"strconv"
	"time"

	"github.com/xxjwxc/oauth2/def"
	"github.com/xxjwxc/oauth2/def/mysign"
	"github.com/xxjwxc/oauth2/oauth2Client/src/data/config"
	"github.com/xxjwxc/oauth2/oauth2Client/src/data/view"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/mycache"
	"github.com/xxjwxc/public/myhttp"
	"github.com/xxjwxc/public/mylog"
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
	//req.User_info_tbl = userinfo
	req.Signature = mysign.OnGetSign(req.Appid, req)
	var r message.MessageBody
	myhttp.SendPost(req, &r, config.GetRegistUrl("/update_userinfo"))
	mylog.Debug(r)
	return r.State
}

//保存缓存
func SaveCacheBody(Access_token, username, Expire_time string) {
	var tmp view.UserCacheBody
	tmp.Access_token = Access_token
	tmp.User_name = username
	tmp.Expire_time, _ = strconv.Atoi(Expire_time)
	//保存缓存
	cache := mycache.OnGetCache("oauth2")
	cache.Add(tmp.Access_token, &tmp, time.Duration(tmp.Expire_time)*time.Second)
	//------------------end
}

//获取缓存
func GetCacheBody(token string) (value *view.UserCacheBody, b bool) {
	cache := mycache.OnGetCache("oauth2")
	var tp interface{}
	tp, b = cache.Value(token)
	if b {
		value = tp.(*view.UserCacheBody)
	}

	return
}
