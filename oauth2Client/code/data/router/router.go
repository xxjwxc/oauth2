/*
	路由表
*/
package router

import (
	"oauth2Client/data/view/login"
	"oauth2Client/data/view/register"
	"oauth2Client/data/view/verify"

	"github.com/ant0ine/go-json-rest/rest"
)

var DefaultRouler = []*rest.Route{
	//管理员登录授权 相关
	Post("/login", login.M_login.OnLogin),              //用户登录
	Post("/check_token", login.M_login.CheckToken),     //验证token
	Post("/refresh_token", login.M_login.RefreshToken), //刷新token管理员
	Post("/go/verify", verify.M_verify.GetVerify),      //获取验证码
	Post("/go/doaction", register.M_register.DoAction), //注册或修改密码
	//Post("/token_check", account.M_account.GetAllCountries),
}

/*
	默认初始化
*/
func OnInitRoter(api *rest.Api) (router rest.App, err error) {
	router, err = rest.MakeRouter(
		DefaultRouler...,
	)

	return
}
