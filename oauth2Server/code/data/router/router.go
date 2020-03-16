/*
	路由表
*/
package router

import (
	"oauth2Server/data/view/account"

	"github.com/ant0ine/go-json-rest/rest"
)

var DefaultRouler = []*rest.Route{
	//登录授权 相关
	Post("/authorize", account.M_account.Authorize),        //用户授权
	Post("/check_token", account.M_account.CheckToken),     //验证token
	Post("/refresh_token", account.M_account.RefreshToken), //刷新token

	Post("/authorize_nopwd", account.M_account.AuthorizeNopwd), //用户授权(不用密码)

	//Post("/token_check", account.M_account.GetAllCountries),
}

/*
	默认初始化
*/
func OnInitRoter(api *rest.Api) (router rest.App, err error) {
	router, err = rest.MakeRouter(
		//各自的数据结构操作点
		/*例子
		  rest.Get("/users", users.GetAllUsers),
		   rest.Post("/users", users.PostUser),
		   rest.Get("/users/:id", users.GetUser),
		   rest.Put("/users/:id", users.PutUser),
		   rest.Delete("/users/:id", users.DeleteUser),
		*/
		DefaultRouler...,
	)

	return
}
