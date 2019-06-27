/********************************************************************
    创建时间:     2017/09/27  14:40:24 
    文件名:       doaction.h
    作者:         谢小军
    emal:        346944475@qq.com
    
    功能:        1.用于oauth2Register 的client 
				2.用户登录
                
    说明:        1. 
                2. 
*********************************************************************/
#include <tuple>
#include <string>

#ifndef LOGIN_H_
#define LOGIN_H_

class CLogin {
public:
	/*
		注册或者修改密码:
		参数:
			username:要操作的用户名
			password:密码(md5)
	*/
	std::tuple<bool, std::string> OnLogin(std::string username,std::string password);

	/*
		验证token
		参数:
			token
		返回：
			成功返回username 跟 过期时间(expire_time)(秒)
	*/
	std::tuple<bool, std::string> OnCheckToken(std::string token);


	/*
	刷新token
	参数:
	token
	返回：
	成功返回username 跟 过期时间(expire_time)(秒)
	*/
	std::tuple<bool, std::string> OnRefreshToken(std::string refresh_token);
};



#endif // !DOACTION_H_
