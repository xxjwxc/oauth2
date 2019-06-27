package config

type Config struct {
	Cfg_Base
	Sign_api_key string `json:"sign_api_key,omitempty"` //验签key
}

func GetSignKey() string {
	return _map.Sign_api_key
}
