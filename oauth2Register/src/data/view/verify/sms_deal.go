package verify

import (
	"github.com/xxjwxc/oauth2/oauth2Register/src/data/view/verify/ihuyisms"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/tools"
	//"data/view/verify/cloopenaudio"
	//"data/view/verify/cloopensms"
)

//	"public/message"

//发送短信
func (v *Verify) SendSMS(userName, Language string, flag, isAudo int) (state bool, code int, verification string) {
	if !tools.IsPhone(userName) { //非手机号
		state = false
		code = message.ParameterInvalid
		verification = ""
		return
	}

	state = true
	code = message.NormalMessageId
	verification = ""

	isfind, canResend, cache_value := v.OnCheckCacheByUserName(userName)
	smsFlag := 0
	if isAudo == 2 { //语音
		if canResend { //能重发
			if isfind && (cache_value.SmsFlag&0x10) == 0x10 { //语音->之前发过短信
				verification = cache_value.Verify
			} else {
				verification = getVerify()
			}

			if isfind {
				smsFlag = cache_value.SmsFlag
			}

			smsFlag = smsFlag | 2
			b := ihuyisms.SendAudioSMS(userName, verification)
			if !b {
				state = false
				code = message.SMSSendFaild
			} else {
				v.OnSaveCacheByUserName(userName, verification, flag, smsFlag) //存储数据
				state = true
				code = message.NormalMessageId
			}
			return
		} else {
			state = false
			code = message.VerifyTimeError
			return
		}
	} else { //短信
		if canResend { //能重发
			if isfind && (cache_value.SmsFlag&0x1) == 0x1 { //短信
				verification = cache_value.Verify
			} else {
				verification = getVerify()
			}

			if isfind {
				smsFlag = cache_value.SmsFlag
			}
			smsFlag = smsFlag | 1
			b := ihuyisms.SendToSMS(userName, verification)
			if !b {
				state = false
				code = message.SMSSendFaild
			} else {
				v.OnSaveCacheByUserName(userName, verification, flag, smsFlag) //存储数据
				state = true
				code = message.NormalMessageId
			}
			return
		} else {
			state = false
			code = message.VerifyTimeError
			return
		}
	}

	return
}
