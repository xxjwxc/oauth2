/*
	构造restful基础框架类
*/
package data

import (
	"log"
	"net/http"

	"oauth2Client/data/config"
	"oauth2Client/data/router"

	"github.com/ant0ine/go-json-rest/rest"
	"github.com/xxjwxc/public/tools"
)

var api *rest.Api = nil

type ApiRoot struct {
}

func (*ApiRoot) OnCreat() {
	api = rest.NewApi()
	if config.OnIsDev() {
		api.Use(rest.DefaultDevStack...) //DefaultProdStack
	} else {
		api.Use(rest.DefaultProdStack...)
	}

	//	api.Use(&rest.CorsMiddleware{    //开启跨域访问权限
	//		RejectNonCorsRequests: false,
	//		OriginValidator: func(origin string, request *rest.Request) bool {
	//			return true
	//		},
	//		AllowedMethods:                []string{"GET", "POST", "PUT", "OPTION"},
	//		AllowedHeaders:                []string{"Accept", "Content-Type", "X-Custom-Header", "Origin"},
	//		AccessControlAllowCredentials: true,
	//		AccessControlMaxAge:           3600,
	//	})
	router, err := router.OnInitRoter(api)
	if err != nil {
		log.Fatal(err)
		panic(err)
	}
	api.SetApp(router)

	http.Handle("/wwwthings/file/", http.StripPrefix("/wwwthings/file", http.FileServer(http.Dir(tools.GetCurrentDirectory()+"/file"))))
	http.Handle("/wwwthings/api/", http.StripPrefix("/wwwthings/api", api.MakeHandler())) //指定api默认路由
}
