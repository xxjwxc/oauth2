#include <iostream>
#include "src/data/verify/verify.h"
#include <Tools/MyTools.h>
#include <Tools/Json/MyJson.h>
#include "src/data/doaction/doaction.h"
#include "src/data/login/login.h"

int main()
{
	std::tuple<bool, std::string> tup;
	CMyJson::JsonRoot json;


//	//获取验证码
// 	CVerify verify;
// 	tup = verify.OnGetVerify("346944475@qq.com", "cn", 2, 1);
// 	std::cout << std::get<0>(tup)<<std::endl << MyTools::GetGB2312( std::get<1>(tup));
// 	
// 	CMyJson::InitJson(MyTools::GetGB2312(std::get<1>(tup)), json);
// 	if (CMyJson::GetValue<bool>(json,"state"))
// 	{
// 		std::cout << "获取成功";
// 	}

// 	//检测用户是否存在
// 	CVerify verify;
// 	tup = verify.OnCheckUser("346944475@qq.com");
// 	std::cout << std::get<0>(tup)<<std::endl << MyTools::GetGB2312( std::get<1>(tup));
// 	
// 	CMyJson::InitJson(MyTools::GetGB2312(std::get<1>(tup)), json);
// 	if (CMyJson::GetValue<bool>(json,"state"))
// 	{
// 		std::cout << "获取成功";
// 	}

//	//注册
// 	CDoaction doaction;
// 	tup = doaction.OnDoaction("346944475@qq.com", "aaaaa", "422162", 1, "yueke");
// 	std::cout << std::get<0>(tup) << std::endl << MyTools::GetGB2312(std::get<1>(tup));
// 	//CMyJson::JsonRoot json;
// 	CMyJson::InitJson(MyTools::GetGB2312(std::get<1>(tup)), json);
// 	if (CMyJson::GetValue<bool>(json, "state"))
// 	{
// 		std::cout << "获取成功";
// 	}

//	//修改密码
// 	CDoaction doaction;
// 	tup = doaction.OnDoaction("346944475@qq.com", "bbbbb", "526089", 2, "yueke");
// 	std::cout << std::get<0>(tup) << std::endl << MyTools::GetGB2312(std::get<1>(tup));
// 	//CMyJson::JsonRoot json;
// 	CMyJson::InitJson(MyTools::GetGB2312(std::get<1>(tup)), json);
// 	if (CMyJson::GetValue<bool>(json, "state"))
// 	{
// 		std::cout << "获取成功";
// 	}

// 	//登录
// 	CLogin login;
// 	tup = login.OnLogin("346944475@qq.com", "bbbbb");
// 	std::cout << std::get<0>(tup) << std::endl << MyTools::GetGB2312(std::get<1>(tup));
// 	//CMyJson::JsonRoot json;
// 	CMyJson::InitJson(MyTools::GetGB2312(std::get<1>(tup)), json);
// 	if (CMyJson::GetValue<bool>(json, "state"))
// 	{
// 		std::cout << "获取成功";
// 	}

//	//验证token接口 成功返回username 及过期时间
	CLogin login;
	tup = login.OnCheckToken("jvkBUbYcH0kg2Sp2McNKv1yuzGzeD44d");
	std::cout << std::get<0>(tup) << std::endl << MyTools::GetGB2312(std::get<1>(tup));
	//CMyJson::JsonRoot json;
	CMyJson::InitJson(MyTools::GetGB2312(std::get<1>(tup)), json);
	if (CMyJson::GetValue<bool>(json, "state"))
	{
		std::cout << "获取成功";
	}

//	//刷新toke
// 	CLogin login;
// 	tup = login.OnRefreshToken("LuJpee3WyOqzoInP1M4qdE9O00HfXvjv");
// 	std::cout << std::get<0>(tup) << std::endl << MyTools::GetGB2312(std::get<1>(tup));
// 	//CMyJson::JsonRoot json;
// 	CMyJson::InitJson(MyTools::GetGB2312(std::get<1>(tup)), json);
// 	if (CMyJson::GetValue<bool>(json, "state"))
// 	{
// 		std::cout << "获取成功";
// 	}
    return 0;
}