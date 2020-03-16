package view

type MapMessageBody struct {
	State bool              `json:"state"`
	Code  int               `json:"code,omitempty"`
	Error string            `json:"error,omitempty"`
	Data  map[string]string `json:"data,omitempty"`
}

type UserCacheBody struct {
	Access_token string
	User_name    string
	Expire_time  int
}

type TokenBody struct {
	Access_token string `json:"access_token"`
}

type UserInfo struct {
	Username    string `json:"username"`
	Newpassword string `json:"newpassword"`
	Times       int    `json:"time"`
}

type REQ_Product_tbl struct {
	Id      int    `json:"key"`
	Type_id int    `json:"type_id"`
	Describ string `json:"describ"`
	Menu    []int  `json:"menu"`
}
