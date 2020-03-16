package verify

import (
	"fmt"
	"log"
	"math/rand"
	"net/smtp"
	"strings"
	"time"

	"oauth2Register/data/config"

	"github.com/axgle/mahonia"
	"github.com/xxjwxc/public/message"
	"github.com/xxjwxc/public/mylog"
)

//	"public/message"

func (v *Verify) SendMail(userName, Language string, flag int) (state bool, code int, verification string) {
	state = true
	code = message.NormalMessageId
	verification = ""

	isfind, canResend, _ := v.OnCheckCacheByUserName(userName)

	if canResend { //能够重发
		now := time.Now()
		year, mon, day := now.Date()
		hour, min, sec := now.Clock()
		dayString := fmt.Sprintf("%d-%02d-%02d %02d:%02d:%02d", year, mon, day, hour, min, sec)
		verification = getVerify() //获取验证码
		body := ""
		subject := ""
		if Language == "en" {
			body = fmt.Sprintf(MailBodyEn, verification, dayString)
			subject = fmt.Sprintf(MailSubjectEn, verification)
		} else {
			body = fmt.Sprintf(MailBodyCn, verification, dayString)

			index := strings.LastIndex(userName, "@")
			if checkGbkMail(userName[index+1 : len(userName)]) {
				subject = mahonia.NewEncoder("gbk").ConvertString(fmt.Sprintf(MailSubjectCn, verification))
			} else {
				subject = fmt.Sprintf(MailSubjectCn, verification)
			}
		}

		mailinfo := config.GetMailInfo()
		user := mailinfo.MailUser         //"noreplay@neobear.com"
		password := mailinfo.MailPassword //"Password!"
		host := mailinfo.MailHost         //"smtp.mxhichina.com:25"
		to := userName

		err := sendToMail(user, password, host, to, subject, body, "html")
		if err != nil {
			log.Println("send mail faild:", err)
			mylog.Print(mylog.Log_Error, fmt.Sprintln("Send mail error:%s", err))
			state = false
			code = message.MailSendFaild
		} else {
			v.OnSaveCacheByUserName(userName, verification, flag, 0) //存储数据
			state = true
			code = message.NormalMessageId
		}
		return
	} else if isfind {
		state = false
		code = message.VerifyTimeError
		return
	}

	return
}

func checkGbkMail(mailBox string) bool {
	for _, v := range strings.SplitAfter(config.GetGbkMailList(), ";") {
		if strings.EqualFold(mailBox, v) {
			return true
		}
	}

	return false
}

const VerifyKey string = "0123456789" //种子
func getVerify() (verify string) {
	rand.Seed(time.Now().UnixNano()) //使用时间种子来获取不同的结果
	for i := 0; i < 6; i++ {
		verify = verify + string(VerifyKey[rand.Intn(len(VerifyKey))])
	}
	return
}

/*
 *    user : example@example.com login smtp server user
 *    password: xxxxx login smtp server password
 *    host: smtp.example.com:port   smtp.163.com:25
 *    to: example@example.com;example1@163.com;example2@sina.com.cn;...
 *    subject:The subject of mail
 *    body: The content of mail
 *    mailtyoe: mail type html or text
 */
func sendToMail(user, password, host, to, subject, body, mailtype string) error {
	//d := mahonia.NewDecoder("UTF-8")
	hp := strings.Split(host, ":")
	auth := smtp.PlainAuth("xxj", user, password, hp[0])
	var content_type string
	if mailtype == "html" {
		content_type = "Content-Type:text/html;charset=UTF-8"
	} else {
		content_type = "Content-Type:text/plain;charset=UTF-8"
	}
	msg := []byte("To:" + to + "\r\nFrom:" + Title_en + "<" + user + ">\r\nSubject:" + subject + "\r\n" + content_type + "\r\n\r\n" + body)
	send_to := strings.Split(to, ";")
	err := smtp.SendMail(host, auth, user, send_to, msg)
	return err
}
