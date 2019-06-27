#include "MyIni.h"
#include <functional>

CMyIni::CMyIni()
{
	m_isInit = ReadText("config.json",std::bind(&CMyIni::OnDeal,this,std::placeholders::_1));
}

bool CMyIni::OnDeal(const std::string & str)
{
	CMyJson::JsonRoot json;
	if (CMyJson::InitJson(str, json))
	{
		m_verify_url = CMyJson::GetValue<std::string>(json, "verify_url");
		m_check_user_url = CMyJson::GetValue<std::string>(json, "check_user_url");
		m_doaction_url = CMyJson::GetValue<std::string>(json,"doaction_url");
		m_login_url = CMyJson::GetValue<std::string>(json, "login_url");
		m_check_token_url = CMyJson::GetValue<std::string>(json, "check_token_url");
		m_refresh_token_url = CMyJson::GetValue<std::string>(json, "refresh_token_url");
		m_token_type = CMyJson::GetValue<std::string>(json, "token_type");
		m_app_id = CMyJson::GetValue<std::string>(json, "app_id");
		m_app_secret = CMyJson::GetValue<std::string>(json, "app_secret");

		return true;
	}

	assert(false && "json init error.");
	return false;
}


