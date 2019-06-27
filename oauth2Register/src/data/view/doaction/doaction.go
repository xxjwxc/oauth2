package doaction

import (
	"time"

	"github.com/ant0ine/go-json-rest/rest"
	"github.com/xxjwxc/oauth2/oauth2Register/src/data/config"
	"github.com/xxjwxc/oauth2/oauth2Register/src/data/view"
	"github.com/xxjwxc/oauth2/oauth2Register/src/data/view/user"
	"github.com/xxjwxc/oauth2/oauth2Register/src/data/view/verify"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/mysign"
	"github.com/xxjwxc/public/mysqldb"
	"github.com/xxjwxc/public/tools"
)

var M_doaction Doaction

type Doaction struct {
}

/*
	注册，或者修改密码
*/
func (u *Doaction) OnDoAction(w rest.ResponseWriter, r *rest.Request) {
	var req Req_doaction
	tools.GetRequestJsonObj(r, &req)

	//入口参数检测
	if !tools.CheckParam(req.UserName, req.Password, req.Appid, req.Bundleid, req.Signature) {
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid, req))
		return
	}

	//orm
	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm(config.GetDbUrl())

	//获取授权信息
	//--------------授权校验client
	signature := req.Signature
	req.Signature = "" //归零
	if !mysign.OnCheckSign(req.Appid, signature, req) {
		w.WriteJson(message.GetErrorMsg(message.EncryptCheckError))
		return
	}
	oauth2_client := mysign.GetOne(req.Appid)

	//	original := req.UserName + req.Password + req.Verify + strconv.Itoa(req.Flag) + req.Bundleid + req.Appid
	//	state, errcode, _, oauth2_client := verify.M_verify.VerifyToken(orm, req.Appid, original, req.Signature)
	//	if !state {
	//		w.WriteJson(message.GetErrorMsg(errcode))
	//		return
	//	}
	//-----------------end

	//-----------------校验用户是否存在
	user_account_tbl, isfind := user.M_user.FindAccountByUsername(orm, req.UserName)

	if req.Flag == 1 { //注册
		if isfind { //找到了
			w.WriteJson(message.GetErrorMsg(message.UserExisted))
			return
		} else { //未找到
			if oauth2_client.Strict_verify == 1 { //强制验证码
				isfind, _, cache_verify := verify.M_verify.OnCheckCacheByUserName(req.UserName)
				if !(isfind && cache_verify.Flag == req.Flag && cache_verify.Verify == req.Verify) {
					w.WriteJson(message.GetErrorMsg(message.VerifyError))
					return
				}
			}

			var account view.User_account_tbl
			account.Account = req.UserName
			account.Password = req.Password
			if tools.IsMail(req.UserName) {
				account.AccountType = 2
			} else if tools.IsPhone(req.UserName) {
				account.AccountType = 1
			} else {
				account.AccountType = 3
			}
			account.App_key = req.Appid
			account.UserInfo.Nickname = req.UserName
			account.RegTime = time.Now()
			account.RegIp = tools.GetClientIp(r.Request)
			account.Bundle_id = req.Bundleid
			orm.Save(&account)

			w.WriteJson(message.GetSuccessMsg(message.NormalMessageId))
			return
		}
	} else if req.Flag == 2 { //修改密码
		if !isfind { //未找到
			w.WriteJson(message.GetErrorMsg(message.UserNotExisted))
			return
		} else { //找到了
			if oauth2_client.Strict_verify == 1 { //强制验证码
				isfind, _, cache_verify := verify.M_verify.OnCheckCacheByUserName(req.UserName)
				if !(isfind && cache_verify.Flag == req.Flag && cache_verify.Verify == req.Verify) {
					w.WriteJson(message.GetErrorMsg(message.VerifyError))
					return
				}
			}

			orm.Model(&user_account_tbl).Update("password", req.Password)

			w.WriteJson(message.GetSuccessMsg(message.NormalMessageId))
			return
		}
	}
}
