#include "doaction.h"
#include <boost/algorithm/string.hpp>
#include <Tools/Json/MyJson.h>
#include <Tools/Md5/MyMd5.h>
#include <Tools/Libcurl/MyHttpTools.h>

#include "../init/MyIni.h"

std::tuple<bool, std::string> CDoaction::OnDoaction(std::string username, std::string password, std::string verify, int flag, std::string bundle_id)
{
	CMyJson::JsonRoot json;
	CMyJson::AddValue(json, "username", username);
	CMyJson::AddValue(json, "password", password);
	CMyJson::AddValue(json, "verify", verify);
	CMyJson::AddValue(json, "flag", flag);
	CMyJson::AddValue(json, "bundleid", bundle_id);
	CMyJson::AddValue(json, "appid", CMyIni::instance()->m_app_id);

	std::string signature = boost::to_upper_copy(MyMd5(username + password + verify + std::to_string(flag) + bundle_id 
		+ CMyIni::instance()->m_app_id
		+ CMyIni::instance()->m_app_secret).hexdigest());
	CMyJson::AddValue(json, "signature", signature);

	return CMyHttpTools().OnOpenHttpByjson(CMyIni::instance()->m_doaction_url, CMyJson::GetJsonStr(json), true);//post
}

