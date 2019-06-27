/********************************************************************
    创建时间:     2017/09/27  14:40:24 
    文件名:       doaction.h
    作者:         谢小军
    emal:        346944475@qq.com
    
    功能:        1.用于oauth2Register 的client 
				2.用户注册，修改密码接口
                
    说明:        1. 
                2. 
*********************************************************************/
#include <tuple>
#include <string>

#ifndef DOACTION_H_
#define DOACTION_H_

class CDoaction {
public:
	/*
		注册或者修改密码:
		参数:
			username:要操作的用户名
			password:密码
			verify:验证码
			flag:1:注册，2:修改密码
			bundle_id:注册的产品id，或者叫渠道号(由用户自定义)
	*/
	std::tuple<bool, std::string> OnDoaction(std::string username,std::string password,std::string verify,int flag,std::string bundle_id);
};



#endif // !DOACTION_H_
