/*
	路由表
*/
package router

import (
	"oauth2Register/data/view/doaction"
	"oauth2Register/data/view/user"
	"oauth2Register/data/view/verify"

	"github.com/ant0ine/go-json-rest/rest"
)

var DefaultRouler = []*rest.Route{

	Post("/get_verify", verify.M_verify.OnGetVerify),       //获取验证码
	Post("/check_user", user.M_user.OnUserCheck),           //检测用户是否存在
	Post("/doaction", doaction.M_doaction.OnDoAction),      //注册或者修改密码
	Post("/get_userinfo", user.M_user.OnGetUserInfo),       //获取用户信息
	Post("/update_userinfo", user.M_user.OnUpdateUserInfo), //更新用户信息
	//管理员登录授权 相关
	//Post("/login", login.M_login.OnLogin), //用户登录

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
