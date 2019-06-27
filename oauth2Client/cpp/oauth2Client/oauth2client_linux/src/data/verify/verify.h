
/********************************************************************
    创建时间:     2017/09/26  16:12:30 
    文件名:       verify.h
    作者:         谢小军
    emal:        346944475@qq.com
    
    功能:        1.用于oauth2Register 的client 
                2.获取验证码(手机，邮箱)
                
    说明:        1. 
                2. 
*********************************************************************/

#ifndef VERIFY_H_
#define VERIFY_H_
#include <tuple>
#include <string>

class CVerify
{
public:
	/*
	获取验证码：

	参数:
		username:用户名，支持邮件，短信
		lg:cn,中文。en,英文
		flag:1:注册，2:修改密码
		smsFlag:短信标志 1：短信 ，2：语音
	返回值:
		tup<0> :false:发送失败，网络问题，true：发送成功并且有返回值
		tup<1> ：返回的结果
		具体请查看：服务器消息返回通用接口
	*/
	std::tuple<bool, std::string> OnGetVerify(std::string username, std::string lg,int flag ,int smsFlag = 1);

	/*
		验证用户是否存在
	*/
	std::tuple<bool, std::string> OnCheckUser(std::string username);
};

#endif