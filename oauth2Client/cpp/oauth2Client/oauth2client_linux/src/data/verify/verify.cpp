#include "verify.h"
#include <boost/algorithm/string.hpp>
#include <Tools/Json/MyJson.h>
#include <Tools/Md5/MyMd5.h>
#include <Tools/Libcurl/MyHttpTools.h>

#include "../init/MyIni.h"



std::tuple<bool, std::string> CVerify::OnGetVerify(std::string username, std::string lg, int flag, int smsFlag /*= 1*/)
{
	CMyJson::JsonRoot json;
	CMyJson::AddValue(json, "lg", lg);
	CMyJson::AddValue(json, "username", username);
	CMyJson::AddValue(json, "flag", flag);
	CMyJson::AddValue(json, "appid", CMyIni::instance()->m_app_id);
	CMyJson::AddValue(json, "smsflag", smsFlag);

	std::string signature = boost::to_upper_copy(MyMd5(lg+username+std::to_string(flag)
		+std::to_string(smsFlag)
		+CMyIni::instance()->m_app_id
	    +CMyIni::instance()->m_app_secret).hexdigest());
	CMyJson::AddValue(json, "signature", signature);

	return CMyHttpTools().OnOpenHttpByjson(CMyIni::instance()->m_verify_url, CMyJson::GetJsonStr(json), true);//post
}

std::tuple<bool, std::string> CVerify::OnCheckUser(std::string username)
{
	CMyJson::JsonRoot json;
	CMyJson::AddValue(json, "username", username);

	return CMyHttpTools().OnOpenHttpByjson(CMyIni::instance()->m_check_user_url, CMyJson::GetJsonStr(json), true);//post
}

