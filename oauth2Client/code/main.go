package main

import (
	"log"
	"net/http"

	"oauth2Client/data"
	"oauth2Client/data/config"

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
		server.On(config.GetServiceConfig()).Start(CallBack)
	}
}
