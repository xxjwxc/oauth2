package main

import (
	"fmt"
	"strconv"
	"testing"
	"time"

	"github.com/xxjwxc/oauth2/oauth2Server/src/data/view"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/mysqldb"
	"github.com/xxjwxc/public/tools"
)

func TestMytest(t *testing.T) {
	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm("root:qwer@tcp(192.168.0.99:3306)/oauth_db?charset=utf8&parseTime=True&loc=Local")

	fmt.Println("in")
	//	var db mysqlbeedb.MySqlDB
	//	defer db.OnDestoryDB()
	//	orm := db.OnGetDBOrm(config.GetDbUrl())
	//------获取一个access_token
	var access_token view.Oauth2_access_token
	err := orm.Where("access_token = ?", "test").Find(&access_token).Error
	fmt.Println(err)
	if err == nil {
		if access_token.Expires.After(tools.GetLocalTime(time.Now())) {
			fmt.Println("yes")
			mkv := make(map[string]string)
			mkv["expire_time"] = strconv.Itoa(int(access_token.Expires.Sub(time.Now()).Seconds()))
			mkv["username"] = access_token.Username
			msg := message.GetSuccessMsg(message.NormalMessageId)
			msg.Data = mkv
		} else {
			fmt.Println("no")
		}
	}
}
