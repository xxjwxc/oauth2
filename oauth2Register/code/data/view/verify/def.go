package verify

type Req_verify struct {
	Lg        string `json:"lg,omitempty"`        //语言cn,en
	UserName  string `json:"username,omitempty"`  //用户名
	Flag      int    `json:"flag,omitempty"`      //标记：1：注册，2：修改密码
	Appid     string `json:"appid,omitempty"`     //授权id
	Msgflag   int    `json:"smsflag,omitempty"`   //短信标1：短信 ，2：语音
	Signature string `json:"signature,omitempty"` //签名
}

type Cache_Value struct {
	Flag     int
	Verify   string
	timeUnix int64
	SmsFlag  int //语音标记
}

var Title_en string
var Title_cn string
var Color_f string
var Color_s string
var MailBodyCn string
var MailBodyEn string
var MailSubjectCn string
var MailSubjectEn string

func init() {
	Title_en = "paradise4d"
	Title_cn = "永乐数码"
	Color_f = "#C46200"
	Color_s = "#EBBC2E"

	MailBodyCn = `
		<html>
		<body>
		<div style="background-color:#ECECEC; padding: 35px;">
		<table cellpadding="0" align="center" style="width: 600px; margin: 0px; text-align: left; position: relative; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; font-size: 14px; font-family:Courier New,Bold; line-height: 1.5; box-shadow: rgb(153, 153, 153) 0px 0px 5px; border-collapse: collapse; background-position: initial initial; background-repeat: initial initial;background:#fff;">
		<tbody>
		<tr>
		<th valign="middle" style="height: 25px; line-height: 25px; padding: 15px 35px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: #C46200; background-color: #EBBC2E; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px;">
		<font face="Courier New" size="5" style="color: rgb(255, 255, 255); ">` + Title_cn + `</font>
		</th>
		</tr>
		<tr>
		<td>
		<div style="padding:25px 35px 40px; background-color:#fff;">
		<h2 style="margin: 5px 0px; "><font color="#333333" style="line-height: 20px; ">
		<font style="line-height: 22px; " size="4">您好</font></font></h2>
		<p>首先感谢您的注册!</p>
		<p>您本次的验证码为:%s . 请不要回复此邮件,谢谢!</p>
		<p align="right">` + Title_en + ` 官方团队 &nbsp;</p>
		<p align="right">%s</p>
		</div>
		</td>
		</tr>
		</tbody>
		</table>
		</div>
		</body>
		</html>
		`

	MailBodyEn = `
		<html>
		<body>
		<div style="background-color:#ECECEC; padding: 35px;">
		<table cellpadding="0" align="center" style="width: 600px; margin: 0px; text-align: left; position: relative; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; font-size: 14px; font-family:Courier New,Bold; line-height: 1.5; box-shadow: rgb(153, 153, 153) 0px 0px 5px; border-collapse: collapse; background-position: initial initial; background-repeat: initial initial;background:#fff;">
		<tbody>
		<tr>
		<th valign="middle" style="height: 25px; line-height: 25px; padding: 15px 35px; border-bottom-width: 1px; border-bottom-style: solid; 
		border-bottom-color: ` + Color_f + `; background-color: ` + Color_s + `; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px;">
		<font face="Courier New" size="5" style="color: rgb(255, 255, 255); ">` + Title_en + `</font>
		</th>
		</tr>
		<tr>
		<td>
		<div style="padding:25px 35px 40px; background-color:#fff;">
		<h2 style="margin: 5px 0px; "><font color="#333333" style="line-height: 20px; ">
		<font style="line-height: 22px; " size="4">Dear ` + Title_en + ` User:</font></font></h2>
		<p>Thank you for your registration!</p>
		<p>Your verification code is: %s. Please do not reply to this email, thanks!</p>
		<p align="right">Sincerely,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
		<p align="right">The ` + Title_en + ` Team</p>
		<p align="right">%s</p>
		</div>
		</td>
		</tr>
		</tbody>
		</table>
		</div>
		</body>
		</html>
		`

	MailSubjectCn = Title_cn + " 账户系统,验证码:%s"
	MailSubjectEn = Title_en + " User System,Verification Code:%s"
}
