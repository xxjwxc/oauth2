/*
	构造restful基础框架类
*/
package data

import (
	"log"
	"net/http"

	"oauth2Server/data/router"

	"github.com/ant0ine/go-json-rest/rest"
)

var api *rest.Api = nil

type ApiRoot struct {
}

func (*ApiRoot) OnCreat() {
	api = rest.NewApi()
	api.Use(rest.DefaultDevStack...) //DefaultProdStack
	router, err := router.OnInitRoter(api)
	if err != nil {
		log.Fatal(err)
		panic(err)
	}
	api.SetApp(router)
	http.Handle("/oauth2/api/", http.StripPrefix("/oauth2/api", api.MakeHandler())) //指定api默认路由
}
