package account

import (
	"log"
	"strconv"
	"time"

	"github.com/ant0ine/go-json-rest/rest"
	"github.com/jinzhu/gorm"
	"github.com/xxjwxc/oauth2/oauth2Server/src/data/config"
	"github.com/xxjwxc/oauth2/oauth2Server/src/data/view"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/mylog"
	"github.com/xxjwxc/public/mysign"
	"github.com/xxjwxc/public/mysqldb"
	"github.com/xxjwxc/public/tools"
)

var M_account Account

type Account struct {
}

/*
	授权
*/
func (a *Account) Authorize(w rest.ResponseWriter, r *rest.Request) {
	var req map[string]string
	tools.GetRequestJsonObj(r, &req)
	appid := req["appid"]
	token := req["token"]
	token_type := req["token_type"]
	password := req["password"]
	username := req["username"]
	times := req["time"]
	log.Println(req)
	if len(username) == 0 || len(password) == 0 || len(appid) == 0 || len(token) == 0 || len(times) == 0 {
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid))
		return
	}

	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm(config.GetDbUrl())

	//--------------授权校验client
	original := appid + username + password + times
	state, errcode, token_expire_time := a.VerifyToken(appid, token, original)
	if !state {
		w.WriteJson(message.GetErrorMsg(errcode))
		return
	}
	//-----------------end

	//----------------用户密文校验
	var user view.User_account_tbl
	orm.Where("account=? and password=?", username, password).Find(&user)
	if user.Id == 0 { //未找到此用户
		w.WriteJson(message.GetErrorMsg(message.UserNameDoNotExist))
		return
	}
	//----------------------------end

	//	//------------------reflash_token
	access_token, refresh_token, state := newAccessRefToken(orm, appid, token_type, username, token_expire_time)
	if state {
		mkv := make(map[string]string)
		mkv["access_token"] = access_token
		mkv["refresh_token"] = refresh_token
		mkv["expire_time"] = strconv.Itoa(token_expire_time)

		msg := message.GetSuccessMsg(message.NormalMessageId)
		msg.Data = mkv
		w.WriteJson(msg)
	} else {
		w.WriteJson(message.GetErrorMsg(message.UnknownError))
	}
}

/*
	授权
*/
func (a *Account) AuthorizeNopwd(w rest.ResponseWriter, r *rest.Request) {
	var req map[string]string
	tools.GetRequestJsonObj(r, &req)
	appid := req["appid"]
	token := req["token"]
	token_type := req["token_type"]
	username := req["username"]
	times := req["time"]
	log.Println(req)
	if len(username) == 0 || len(appid) == 0 || len(token) == 0 || len(times) == 0 {
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid))
		return
	}

	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm(config.GetDbUrl())

	//--------------授权校验client
	original := appid + username + times
	state, errcode, token_expire_time := a.VerifyToken(appid, token, original)
	if !state {
		w.WriteJson(message.GetErrorMsg(errcode))
		return
	}
	//-----------------end

	//----------------用户密文校验
	var user view.User_account_tbl
	orm.Where("account=?", username).Find(&user)
	if user.Id == 0 { //未找到此用户
		w.WriteJson(message.GetErrorMsg(message.UserNameDoNotExist))
		return
	}
	//----------------------------end

	//	//------------------reflash_token
	access_token, refresh_token, state := newAccessRefToken(orm, appid, token_type, username, token_expire_time)
	if state {
		mkv := make(map[string]string)
		mkv["access_token"] = access_token
		mkv["refresh_token"] = refresh_token
		mkv["expire_time"] = strconv.Itoa(token_expire_time)

		msg := message.GetSuccessMsg(message.NormalMessageId)
		msg.Data = mkv
		w.WriteJson(msg)
	} else {
		w.WriteJson(message.GetErrorMsg(message.UnknownError))
	}
}

func (a *Account) CheckToken(w rest.ResponseWriter, r *rest.Request) {
	var req map[string]string
	tools.GetRequestJsonObj(r, &req)
	token := req["token"]
	if len(token) == 0 { //参数检测
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid))
		return
	}

	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm(config.GetDbUrl())

	//	var db mysqlbeedb.MySqlDB
	//	defer db.OnDestoryDB()
	//	orm := db.OnGetDBOrm(config.GetDbUrl())
	//------获取一个access_token
	var access_token view.Oauth2_access_token
	err := orm.Where("access_token = ?", token).Find(&access_token).Error
	if err == nil {
		if access_token.Expires.After(tools.GetLocalTime(time.Now())) {
			mkv := make(map[string]string)
			mkv["expire_time"] = strconv.Itoa(int(access_token.Expires.Sub(time.Now()).Seconds()))
			mkv["username"] = access_token.Username
			msg := message.GetSuccessMsg(message.NormalMessageId)
			msg.Data = mkv
			w.WriteJson(msg)
			return
		}
	}

	w.WriteJson(message.GetErrorMsg(message.TokenFailure))
	return
	//------------------------------end
}

func (a *Account) RefreshToken(w rest.ResponseWriter, r *rest.Request) {
	var req map[string]string
	tools.GetRequestJsonObj(r, &req)
	token := req["refresh_token"]
	if len(token) == 0 { //参数检测
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid))
		return
	}

	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm(config.GetDbUrl())
	//------获取一个access_token
	var refresh_token view.Oauth2_refresh_token
	err := orm.Where("refresh_token = ?", token).Find(&refresh_token).Error
	if err == nil {
		log.Println(refresh_token.Expires)
		log.Println(time.Now())
		log.Println(tools.GetLocalTime(time.Now()))
		if refresh_token.Expires.After(tools.GetLocalTime(time.Now())) {
			refresh_token.Expires = time.Now()
			orm.Save(&refresh_token)
			//创建新的token
			a_token, re_token, state := newAccessRefToken(orm, refresh_token.App_key, refresh_token.Token_type, refresh_token.Username, refresh_token.Token_expire_time)
			if state {
				mkv := make(map[string]string)
				mkv["access_token"] = a_token
				mkv["refresh_token"] = re_token
				mkv["username"] = refresh_token.Username
				mkv["expire_time"] = strconv.Itoa(refresh_token.Token_expire_time)

				msg := message.GetSuccessMsg(message.NormalMessageId)
				msg.Data = mkv
				w.WriteJson(msg)
			} else {
				w.WriteJson(message.GetErrorMsg(message.UnknownError))
			}
			//------------------------end
			return
		}
	}

	w.WriteJson(message.GetErrorMsg(message.TokenFailure))
	return
}

func newAccessRefToken(orm *gorm.DB, appid, token_type, username string, token_expire_time int) (ac_token, re_token string, state bool) {
	//------创建一个access_token
	var access_token view.Oauth2_access_token
	var refresh_token view.Oauth2_refresh_token

	access_token.App_key = appid
	access_token.Token_type = token_type
	access_token.Username = username
	access_token.Expires = time.Now().Add(time.Duration(token_expire_time) * time.Second)
	//	access_token.
	state = false
	for i := 0; i < 3; i++ {
		access_token.Access_token = tools.GetRandomString(32)
		err := orm.Save(&access_token).Error
		if err == nil {
			state = true
			break
		} else {
			mylog.Print(mylog.Log_Error, err.Error())
		}
	}
	//------------------------------end
	if state {
		state = false
		refresh_token.App_key = appid
		refresh_token.Token_type = token_type
		refresh_token.Username = username
		refresh_token.Token_expire_time = token_expire_time
		refresh_token.Expires = time.Now().Add(time.Duration(token_expire_time*2) * time.Second)
		//	access_token.
		for i := 0; i < 3; i++ {
			refresh_token.Refresh_token = tools.GetRandomString(32)
			err := orm.Save(&refresh_token).Error
			if err == nil {
				state = true
				break
			} else {
				mylog.Print(mylog.Log_Error, err.Error())
			}
		}
	}
	//------------------reflash_token

	if state {
		re_token = refresh_token.Refresh_token
		ac_token = access_token.Access_token
	}

	return
}

//密钥检测
func (a *Account) VerifyToken(key, token, original string) (state bool, errcode int, token_expire_time int) {
	state = false
	errcode = message.UnknownError
	token_expire_time = 0
	client := mysign.GetOne(key)
	if client.Id == 0 { //未找到
		errcode = message.AppidParameterInvalid
		return
	}

	if tools.GetLocalTime(time.Now()).After(client.Expire_time) {
		errcode = message.AppidOverdue
		return
	}

	single := original + client.App_secret
	code := tools.Md5Encoder(single)
	if code != token { //密文校验失败
		state = false
		errcode = message.EncryptCheckError
	} else {
		state = true
		errcode = message.NormalMessageId
		token_expire_time = client.Token_expire_time
	}

	return
}
