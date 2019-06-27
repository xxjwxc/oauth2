package verify

import (
	"time"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	"github.com/xxjwxc/oauth2/oauth2Register/src/data/view"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/mycache"
	"github.com/xxjwxc/public/tools"
)

const (
	SecondsToExpiry = int32(600) //超时时间 秒
	ReSendTimeOut   = int64(60)  //重发超时时间 秒

)

//密钥检测
/*
	appid:授权id
	original:明文前半段，不包括secret
	signature:签名
*/
func (a *Verify) VerifyToken(orm *gorm.DB, appid, original, signature string) (state bool, errcode int, token_expire_time int, client view.Oauth2_client_tbl) {

	state = false
	errcode = message.UnknownError
	token_expire_time = 0
	//var client view.Oauth2_client_tbl
	orm.Where("app_key=?", appid).Find(&client)
	if client.Id == 0 { //未找到
		errcode = message.AppidParameterInvalid
		return
	}

	if tools.GetLocalTime(time.Now()).After(client.Expire_time) {
		errcode = message.AppidOverdue
		return
	}

	single := original + client.App_secret
	code := tools.Md5Encoder(single)
	if code != signature { //密文校验失败
		state = false
		errcode = message.EncryptCheckError
	} else {
		state = true
		errcode = message.NormalMessageId
		token_expire_time = client.Token_expire_time
	}

	return
}

/*
	检查验证码是否存在
	返回:
	isfind :是否找到
	canResend ：是否能够重发
	value ：查询的结果
*/
func (a *Verify) OnCheckCacheByUserName(userName string) (isfind, canResend bool, value *Cache_Value) {

	isfind = false
	canResend = true
	value = nil

	//先从缓存中获取
	cache := mycache.OnGetCache("verify")
	var tp interface{}
	tp, b := cache.Value(userName)

	if !b {
		isfind = false
		canResend = true
		value = nil
		return
	}

	value = tp.(*Cache_Value)
	isfind = true

	n := time.Now().Unix() - value.timeUnix
	if n < ReSendTimeOut {
		canResend = false
	} else {
		canResend = true
	}
	return
}

/*
	保存验证码
	参数：
	flag 标记：1注册，2修改密码
	AudioFlag 语音短信标记(在超时范围之内，短信通知不了可以发送语音消息)01短信，11语音短信都发了

	返回:
	isfind :是否找到
	canResend ：是否能够重发
	flag ：查询的结果

*/
func (a *Verify) OnSaveCacheByUserName(userName, verify string, flag, SmsFlag int) {

	var tmp Cache_Value
	tmp.Flag = flag
	tmp.timeUnix = time.Now().Unix()
	tmp.Verify = verify
	tmp.SmsFlag = SmsFlag

	//保存缓存
	cache := mycache.OnGetCache("verify")
	cache.Add(userName, &tmp, time.Duration(SecondsToExpiry)*time.Second)
	//------------------end

	return
}
