#ifndef MY_INI_H_
#define MY_INI_H_
#include <Tools/MyIni/MyIniBase.h>
#include <Tools/MySingleton.h>

class CMyIni:public CIniBase,public MySingleton<CMyIni>
{
public:
	CMyIni();
protected:
	bool OnDeal(const std::string & strjson);
public:
	std::string m_verify_url;//获取验证码url
	std::string m_check_user_url;//验证用户是否存在
	std::string m_doaction_url;//注册修改密码
	std::string m_login_url;//登录
	std::string m_check_token_url;//验证token
	std::string m_refresh_token_url;//刷新token
	std::string m_token_type;//授权类型
	std::string m_app_id;
	std::string m_app_secret;
private:
	bool m_isInit = false;
};

#endif // !MY_INI_H_
