package verify

import (
	"strconv"

	"oauth2Register/data/config"
	"oauth2Register/data/view/user"

	"github.com/ant0ine/go-json-rest/rest"
	"github.com/xxjwxc/oauth2/def"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/mysqldb"
	"github.com/xxjwxc/public/tools"
)

var M_verify Verify

type Verify struct {
}

/*
	获取验证码
*/
func (v *Verify) OnGetVerify(w rest.ResponseWriter, r *rest.Request) {
	var req Req_verify
	def.GetRequestJsonObj(r, &req)

	//入口参数检测
	if !tools.CheckParam(req.Lg, req.UserName, req.Appid, req.Signature) || req.Flag == 0 {
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid))
		return
	}

	//check username

	//orm
	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm(config.GetDbUrl())

	//获取授权信息
	//--------------授权校验client
	original := req.Lg + req.UserName + strconv.Itoa(req.Flag) + strconv.Itoa(req.Msgflag) + req.Appid
	state, errcode, _, oauth2_client := v.VerifyToken(orm, req.Appid, original, req.Signature)
	if !state {
		w.WriteJson(message.GetErrorMsg(errcode))
		return
	}
	//-----------------end

	//-----------------校验用户是否存在
	_, isfind := user.M_user.FindAccountByUsername(orm, req.UserName)
	state = true
	var code int = message.NormalMessageId

	if req.Flag == 1 { //注册
		if isfind {
			w.WriteJson(message.GetErrorMsg(message.UserExisted))
			return
		} else { //开始发送验证码
			if oauth2_client.Strict_verify == 2 { //忽略验证码
				w.WriteJson(message.GetSuccessMsg(message.NormalMessageId))
				return
			} else { //oauth2_client.Strict_verify  = 1 强制验证码
				if tools.IsMail(req.UserName) { //邮件
					state, code, _ = v.SendMail(req.UserName, req.Lg, req.Flag)
				} else { //短信
					state, code, _ = v.SendSMS(req.UserName, req.Lg, req.Flag, req.Msgflag)
				}
			}
		}
	} else { //修改密码
		if isfind { //开始发送验证码
			if tools.IsMail(req.UserName) { //邮件
				state, code, _ = v.SendMail(req.UserName, req.Lg, req.Flag)
			} else { //短信
				state, code, _ = v.SendSMS(req.UserName, req.Lg, req.Flag, req.Msgflag)
			}
		} else {
			w.WriteJson(message.GetErrorMsg(message.UserNameDoNotExist))
			return
		}
	}

	//数据返回
	var msg message.MessageBody
	msg.State = state
	msg.Code = code
	msg.Error = message.MessageMap[code]

	w.WriteJson(msg)
	return
	//-------------------end
}
