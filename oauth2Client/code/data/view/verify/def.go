package verify

type Req_verify struct {
	Lg       string `json:"lg,omitempty"`       //语言cn,en
	UserName string `json:"username,omitempty"` //用户名
	Flag     int    `json:"flag,omitempty"`     //1:注册，2:修改密码
	Msgflag  int    `json:"smsflag,omitempty"`  //短信标1：短信 ，2：语音
}

type RequestBody struct {
	Lg        string `json:"lg,omitempty"`        //语言cn,en
	UserName  string `json:"username,omitempty"`  //用户名
	Flag      int    `json:"flag,omitempty"`      //标记：1：注册，2：修改密码
	Appid     string `json:"appid,omitempty"`     //授权id
	Msgflag   int    `json:"smsflag,omitempty"`   //短信标1：短信 ，2：语音
	Signature string `json:"signature,omitempty"` //签名
}

type ResponseBody struct {
	State bool        `json:"state"`
	Code  int         `json:"code,omitempty"`
	Error string      `json:"error,omitempty"`
	Data  interface{} `json:"data,omitempty"`
}
