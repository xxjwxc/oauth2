package main

import (
	"log"
	"net/http"

	"github.com/xxjwxc/oauth2/oauth2Client/src/data"
	"github.com/xxjwxc/oauth2/oauth2Client/src/data/config"
	"github.com/xxjwxc/public/server"
)

func CallBack() {
	var apiroot data.ApiRoot
	apiroot.OnCreat()
	log.Println("OAuth2 client is running at " + config.GetServerPort() + " port.")
	log.Fatal(http.ListenAndServe(":"+config.GetServerPort(), nil))
}

func main() {
	//fmt.Println(user.OnGetUserInfo("admin"))

	if config.OnIsDev() {
		CallBack()
	} else {
		server.OnStart(CallBack)
	}
}
