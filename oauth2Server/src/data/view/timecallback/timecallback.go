package timecallback

import (
	"time"

	"github.com/xxjwxc/oauth2/oauth2Server/src/data/config"
	"github.com/xxjwxc/oauth2/oauth2Server/src/data/view"
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
