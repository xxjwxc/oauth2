package user

import (
	"data/config"
	"fmt"
	"plug/def"
	"public/message"
	"public/mysign"
	"public/mysqldb"
	"public/tools"
	"testing"
)

func Test_sing(t *testing.T) {
	var req Req_user_info
	req.Appid = "wwwthings"
	req.UserName = "admin"
	req.Signature = mysign.OnGetSign(req.Appid, req)

	//签名校验
	signature := req.Signature
	req.Signature = "" //归零
	if !mysign.OnCheckSign(req.Appid, signature, req) {
		fmt.Println("nnnnnnnnnnnn")
		return
	}

	//orm
	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm(config.GetDbUrl())
	//-----------------校验用户是否存在

	user, isfind := M_user.FindAccountByUsername(orm, req.UserName)

	if !isfind {
		fmt.Println("!isfind")
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
		fmt.Println(tools.GetJsonStr(msg))
	}
}
