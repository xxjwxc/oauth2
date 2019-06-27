package main

import (
	"log"
	"net/http"
	"time"

	"github.com/xxjwxc/oauth2/oauth2Server/src/data"
	"github.com/xxjwxc/oauth2/oauth2Server/src/data/config"
	"github.com/xxjwxc/oauth2/oauth2Server/src/data/view/timecallback"
	"github.com/xxjwxc/public/server"
	"github.com/xxjwxc/public/timerDeal"
)

func CallBack() {
	//设置时间回调
	var tcb timerDeal.TimerDeal
	tcb.AddOneCall(timecallback.OnTimeCallBackToken)
	tcb.SetCallBackTimer(24 * time.Hour)
	tcb.OnSart()
	//---------------------end

	var apiroot data.ApiRoot
	apiroot.OnCreat()
	log.Println("OAuth2 server is running at " + config.GetServerPort() + " port.")
	log.Fatal(http.ListenAndServe(":"+config.GetServerPort(), nil))
}

func main() {
	if config.OnIsDev() {
		CallBack()
	} else {
		server.OnStart(CallBack)
	}
}
