package user

import (
	"oauth2Register/data/config"

	"github.com/ant0ine/go-json-rest/rest"
	"github.com/xxjwxc/oauth2/def"
	"github.com/xxjwxc/oauth2/def/mysign"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/mysqldb"
	"github.com/xxjwxc/public/tools"
)

var M_user User

type User struct {
}

/*
	验证用户是否存在
*/
func (u *User) OnUserCheck(w rest.ResponseWriter, r *rest.Request) {
	var req Req_user
	def.GetRequestJsonObj(r, &req)

	//入口参数检测
	if !tools.CheckParam(req.UserName) {
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid))
		return
	}

	//orm
	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm(config.GetDbUrl())

	//-----------------校验用户是否存在
	_, isfind := u.FindAccountByUsername(orm, req.UserName)

	msg := message.GetSuccessMsg(message.NormalMessageId)
	mkv := make(map[string]bool)
	mkv["isfind"] = isfind
	msg.Data = mkv

	w.WriteJson(msg)
}

/*
	获取用户信息
*/
func (u *User) OnGetUserInfo(w rest.ResponseWriter, r *rest.Request) {
	var req Req_user_info
	def.GetRequestJsonObj(r, &req)

	//入口参数检测
	if !tools.CheckParam(req.Account) {
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid))
		return
	}

	//签名校验
	signature := req.Signature
	req.Signature = "" //归零
	if !mysign.OnCheckSign(req.Appid, signature, req) {
		w.WriteJson(message.GetErrorMsg(message.EncryptCheckError))
		return
	}

	//orm
	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm(config.GetDbUrl())

	//-----------------校验用户是否存在
	user, isfind := u.FindAccountByUsername(orm, req.Account)

	if !isfind {
		w.WriteJson(message.GetErrorMsg(message.NotFindError))
	} else {
		var us def.User_info
		us.UserInfo = user.UserInfo
		us.Account = user.Account
		us.AccountType = user.AccountType
		us.App_key = user.App_key
		us.RegTime.Time = user.RegTime
		us.RegIp = user.RegIp
		us.Bundle_id = user.Bundle_id

		msg := message.GetSuccessMsg()
		msg.Data = us
		w.WriteJson(msg)
	}
}

/*
	更新用户信息
*/
func (u *User) OnUpdateUserInfo(w rest.ResponseWriter, r *rest.Request) {
	var req Req_up_info
	def.GetRequestJsonObj(r, &req)

	//入口参数检测
	if !tools.CheckParam(req.Account) {
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid))
		return
	}

	//签名校验
	signature := req.Signature
	req.Signature = "" //归零
	if !mysign.OnCheckSign(req.Appid, signature, req) {
		w.WriteJson(message.GetErrorMsg(message.EncryptCheckError))
		return
	}

	//orm
	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm(config.GetDbUrl())

	//-----------------校验用户是否存在
	user, isfind := u.FindAccountByUsername(orm, req.Account)

	if !isfind {
		w.WriteJson(message.GetErrorMsg(message.NotFindError))
	} else {
		user.UserInfo.Nickname = req.Nickname
		user.UserInfo.Headurl = req.Headurl
		orm.Save(&user)

		w.WriteJson(message.GetSuccessMsg())
	}
}
