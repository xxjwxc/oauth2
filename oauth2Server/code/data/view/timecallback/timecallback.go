package timecallback

import (
	"time"

	"oauth2Server/data/config"
	"oauth2Server/data/view"

	"github.com/xxjwxc/public/mysqldb"
)

func OnTimeCallBackToken() {
	var db mysqldb.MySqlDB
	defer db.OnDestoryDB()
	orm := db.OnGetDBOrm(config.GetDbUrl())

	//删除access_token
	orm.Where("expires <= ?", time.Now()).Delete(view.Oauth2_access_token{})

	//删除refresh_token
	orm.Where("expires <= ?", time.Now()).Delete(view.Oauth2_refresh_token{})
}
