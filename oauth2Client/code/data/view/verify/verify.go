package verify

import (
	"strconv"

	"oauth2Client/data/config"

	"github.com/ant0ine/go-json-rest/rest"
	"github.com/xxjwxc/oauth2/def"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/myhttp"
	"github.com/xxjwxc/public/tools"
)

var M_verify Verify

type Verify struct {
}

var url string
var appId string
var app_secret string

func init() {
	var data config.VerifyInfo = config.GetVerifyInfo()
	url = data.Url
	appId = data.AppId
	//tmp := mysign.GetOne(appId)
	//app_secret = tmp.App_secret
	app_secret = data.App_secret
}

func (v *Verify) GetVerify(w rest.ResponseWriter, r *rest.Request) {
	var req Req_verify
	def.GetRequestJsonObj(r, &req)

	//入口参数检测
	if !tools.CheckParam(req.UserName, req.Lg) || req.Flag == 0 {
		w.WriteJson(message.GetErrorMsg(message.ParameterInvalid, req))
		return
	}
	signature := tools.Md5Encoder(req.Lg + req.UserName + strconv.Itoa(req.Flag) + strconv.Itoa(req.Msgflag) + appId + app_secret)
	requestbody := RequestBody{req.Lg, req.UserName, req.Flag, appId, req.Msgflag, signature}
	//发送请求
	stb := ResponseBody{}
	myhttp.SendPost(&requestbody, &stb, url)
	w.WriteJson(stb)
	return

}
