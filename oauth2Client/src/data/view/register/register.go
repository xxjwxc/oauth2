package register

import (
	"strconv"

	"github.com/ant0ine/go-json-rest/rest"
	"github.com/xxjwxc/oauth2/oauth2Client/src/data/config"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/myhttp"
	"github.com/xxjwxc/public/tools"
)

var M_register Register

type Register struct {
}

var url string
var appId string
var app_secret string

func init() {
	var data config.DoactionInfo = config.GetDoactionInfo()
	url = data.Url
	appId = data.AppId
	app_secret = data.App_secret
}

func (v *Register) DoAction(w rest.ResponseWriter, r *rest.Request) {
	var req Req_register
	tools.GetRequestJsonObj(r, &req)

	//入口参数检测
	if !tools.CheckParam(req.UserName, req.Bundleid, req.Password) || req.Flag == 0 {
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid))
		return
	}

	signature := tools.Md5Encoder(req.UserName + req.Password + req.Verify + strconv.Itoa(req.Flag) + req.Bundleid + appId + app_secret)
	requestbody := RequestBody{req.UserName, req.Password, req.Verify, req.Flag, appId, req.Bundleid, signature}
	//发送请求
	var sub ResponseBody
	myhttp.SendPost(&requestbody, &sub, url)
	w.WriteJson(sub)
	return
}
