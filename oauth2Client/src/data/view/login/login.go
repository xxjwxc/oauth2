package login

import (
	"encoding/json"
	"log"
	"strconv"
	"time"

	"github.com/ant0ine/go-json-rest/rest"
	"github.com/xxjwxc/oauth2/oauth2Client/src/data/config"
	"github.com/xxjwxc/oauth2/oauth2Client/src/data/view"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/mycache"
	"github.com/xxjwxc/public/myhttp"
	"github.com/xxjwxc/public/tools"
)

var M_login Login

type Login struct {
}

/*
	通过token获取用户信息
*/
func GetUserFromToken(token string) (username string, expire_time int, b bool) {
	b = false
	if len(token) == 0 {
		return
	}

	//先从缓存中获取
	cache := mycache.OnGetCache("oauth2")
	var tp interface{}
	tp, b = cache.Value(token)

	if b {
		tmp := tp.(*view.UserCacheBody)
		username = tmp.User_name
		expire_time = tmp.Expire_time
		return
	} else {
		parm := make(map[string]string)
		parm["token"] = token
		bod, _ := json.Marshal(parm)
		r_body := myhttp.OnPostJson(config.GetCheckTokenUrl(), string(bod))
		if len(r_body) == 0 {
			return
		} else {
			var msg view.MapMessageBody
			json.Unmarshal([]byte(r_body), &msg)
			b = msg.State
			if msg.State {
				//成功
				var tmp view.UserCacheBody
				tmp.Access_token = token
				tmp.User_name = msg.Data["username"]
				tmp.Expire_time, _ = strconv.Atoi(msg.Data["expire_time"])

				//保存缓存
				cache := mycache.OnGetCache("oauth2")
				cache.Add(tmp.Access_token, &tmp, time.Duration(tmp.Expire_time)*time.Second)
				//------------------end

				//返回结果
				username = tmp.User_name
				expire_time = tmp.Expire_time
			}
			return
		}
	}
	//------------------end
	return
}

/*
	登录
*/
func (a *Login) OnLogin(w rest.ResponseWriter, r *rest.Request) {

	var req map[string]string
	tools.GetRequestJsonObj(r, &req)

	username := req["username"]
	password := req["password"]
	times := req["time"]

	if len(username) == 0 || len(password) == 0 || len(times) == 0 {
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid))
		return
	}

	token_type := config.GetTokenType()
	appid, appsecret := config.GetAppInfo()
	original := appid + username + password + times + appsecret
	token := tools.Md5Encoder(original)

	parm := make(map[string]string)
	parm["appid"] = appid
	parm["token"] = token
	parm["token_type"] = token_type
	parm["password"] = password
	parm["username"] = username
	parm["time"] = times

	b, _ := json.Marshal(parm)
	r_body := myhttp.OnPostJson(config.GetLoginUrl(), string(b))
	if len(r_body) == 0 {
		w.WriteJson(message.GetErrorMsg(message.UnknownError))
		return
	} else {
		var msg view.MapMessageBody
		json.Unmarshal([]byte(r_body), &msg)
		if msg.State {
			//成功
			var tmp view.UserCacheBody
			tmp.Access_token = msg.Data["access_token"]
			tmp.User_name = username
			tmp.Expire_time, _ = strconv.Atoi(msg.Data["expire_time"])

			//保存缓存
			cache := mycache.OnGetCache("oauth2")
			cache.Add(tmp.Access_token, &tmp, time.Duration(tmp.Expire_time)*time.Second)
			//------------------end

			//返回结果
			w.WriteJson(msg)
		} else {
			w.WriteJson(message.GetErrorMsg(msg.Code))
		}
	}
}

/*
	验证token
*/
func (a *Login) CheckToken(w rest.ResponseWriter, r *rest.Request) {
	var req map[string]string
	tools.GetRequestJsonObj(r, &req)

	token := req["token"]
	username, _, b := GetUserFromToken(token)
	log.Println(username, b)
	if !b {
		w.WriteJson(message.GetErrorMsg(message.TokenFailure))
	} else {
		msg := message.GetSuccessMsg(message.NormalMessageId)
		parm := make(map[string]string)
		parm["username"] = username
		msg.Data = parm
		w.WriteJson(msg)
	}
}

/*
	刷新token管理员
*/
func (a *Login) RefreshToken(w rest.ResponseWriter, r *rest.Request) {

	var req map[string]string
	tools.GetRequestJsonObj(r, &req)
	token := req["refresh_token"]
	if len(token) == 0 { //参数检测
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid))
		return
	}

	parm := make(map[string]string)
	parm["refresh_token"] = token

	b, _ := json.Marshal(parm)
	r_body := myhttp.OnPostJson(config.GetRefreshTokenUrl(), string(b))
	if len(r_body) == 0 {
		w.WriteJson(message.GetErrorMsg(message.UnknownError))
		return
	} else {
		var msg view.MapMessageBody
		json.Unmarshal([]byte(r_body), &msg)
		if msg.State {
			//成功
			var tmp view.UserCacheBody
			tmp.Access_token = msg.Data["access_token"]
			tmp.User_name = msg.Data["username"]
			tmp.Expire_time, _ = strconv.Atoi(msg.Data["expire_time"])

			//保存缓存
			cache := mycache.OnGetCache("oauth2")
			cache.Add(tmp.Access_token, &tmp, time.Duration(tmp.Expire_time)*time.Second)
			//------------------end

			//返回结果
			w.WriteJson(msg)
		} else {
			w.WriteJson(message.GetErrorMsg(msg.Code))
		}
	}
}
