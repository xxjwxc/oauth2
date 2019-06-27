#include "login.h"
#include <boost/algorithm/string.hpp>
#include <Tools/Json/MyJson.h>
#include <Tools/Md5/MyMd5.h>
#include <Tools/Libcurl/MyHttpTools.h>
#include <Tools/MyTimes.h>

#include "../init/MyIni.h"



std::tuple<bool, std::string> CLogin::OnLogin(std::string username, std::string password)
{
	std::string times = std::to_string(CMyTimes::get_utc());
	CMyJson::JsonRoot json;
	CMyJson::AddValue(json, "appid", CMyIni::instance()->m_app_id);
	CMyJson::AddValue(json, "token_type", CMyIni::instance()->m_token_type);
	CMyJson::AddValue(json, "username", username);
	CMyJson::AddValue(json, "password", password);
	CMyJson::AddValue(json, "time", times);
	

	std::string signature = boost::to_upper_copy(MyMd5(CMyIni::instance()->m_app_id 
		+ username + password + times + CMyIni::instance()->m_app_secret).hexdigest());
	CMyJson::AddValue(json, "token", signature);

	return CMyHttpTools().OnOpenHttpByjson(CMyIni::instance()->m_login_url, CMyJson::GetJsonStr(json), true);//post
}

std::tuple<bool, std::string> CLogin::OnCheckToken(std::string token)
{
	std::string times = std::to_string(CMyTimes::get_utc());
	CMyJson::JsonRoot json;
	CMyJson::AddValue(json, "token", token);

	return CMyHttpTools().OnOpenHttpByjson(CMyIni::instance()->m_check_token_url, CMyJson::GetJsonStr(json), true);//post

}

std::tuple<bool, std::string> CLogin::OnRefreshToken(std::string refresh_token)
{
	std::string times = std::to_string(CMyTimes::get_utc());
	CMyJson::JsonRoot json;
	CMyJson::AddValue(json, "refresh_token", refresh_token);

	return CMyHttpTools().OnOpenHttpByjson(CMyIni::instance()->m_refresh_token_url, CMyJson::GetJsonStr(json), true);//post

}
