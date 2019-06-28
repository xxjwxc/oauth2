package oauth_db

import (
	"time"
)

//
type Oauth2AccessToken struct {
	ID          int       `gorm:"primary_key" json:"-"`       //
	AccessToken string    `gorm:"unique" json:"access_token"` //
	TokenType   string    `json:"token_type"`                 //
	AppKey      string    `json:"app_key"`                    //	key
	Username    string    `json:"username"`                   //	用户名
	Expires     time.Time `json:"expires"`                    //	过期时间
}

//
type Oauth2ClientTbl struct {
	ID              int       `gorm:"primary_key" json:"-"` //
	AppKey          string    `json:"app_key"`              //
	AppSecret       string    `json:"app_secret"`           //
	ExpireTime      time.Time `json:"expire_time"`          //	超时时间
	StrictSign      int       `json:"strict_sign"`          //	是否强制验签:0：用户自定义，1：强制
	StrictVerify    int       `json:"strict_verify"`        //	是否强制验证码:0：用户自定义，1：强制
	TokenExpireTime int       `json:"token_expire_time"`    //	token过期时间
}

//
type Oauth2RefreshToken struct {
	ID              int       `json:"-" gorm:"primary_key"`        //
	RefreshToken    string    `gorm:"unique" json:"refresh_token"` //
	TokenType       string    `json:"token_type"`                  //
	AppKey          string    `json:"app_key"`                     //
	Username        string    `json:"username"`                    //
	Expires         time.Time `json:"expires"`                     //
	TokenExpireTime int       `json:"token_expire_time"`           //
}

//
type SignClientTbl struct {
	ID              int       `gorm:"primary_key" json:"-"` //
	AppKey          string    `json:"app_key"`              //
	AppSecret       string    `json:"app_secret"`           //
	ExpireTime      time.Time `json:"expire_time"`          //	超时时间
	StrictSign      int       `json:"strict_sign"`          //	是否强制验签:0：用户自定义，1：强制
	StrictVerify    int       `json:"strict_verify"`        //	是否强制验证码:0：用户自定义，1：强制
	TokenExpireTime int       `json:"token_expire_time"`    //	token过期时间
}

//
type UserAccountTbl struct {
	ID          int       `gorm:"primary_key" json:"-"`  //
	Account     string    `gorm:"unique" json:"account"` //
	Password    string    `json:"password"`              //
	AccountType int       `json:"account_type"`          //	帐号类型:0手机号，1邮件
	AppKey      string    `json:"app_key"`               //	authbucket_oauth2_client表的id
	UserInfoID  int       `json:"user_info_id"`          //
	RegTime     time.Time `json:"reg_time"`              //
	RegIP       string    `json:"reg_ip"`                //
	BundleID    string    `json:"bundle_id"`             //
	Describ     string    `json:"describ"`               //
}

//
type UserInfoTbl struct {
	ID       int    `gorm:"primary_key" json:"-"` //
	Nickname string `json:"nickname"`             //
	Headurl  string `json:"headurl"`              //
}
