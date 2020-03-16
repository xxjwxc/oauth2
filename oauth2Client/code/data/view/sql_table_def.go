package view

import (
	"time"
)

//`beedb:"PK" sql:"UID" tname:"USER_INFO"` //if the table's PrimaryKey is not "Id", use this tag
type Key_card_tbl struct {
	Id              int       `beedb:"PK" json:"-"`
	Key_code        string    `sql:"key_code" json:"key_code"`
	Type            int       `json:"type"`
	Valid           int       `json:"valid"`
	Activate_number int       `json:"activate_number"` //激活数量
	Username        string    `json:"username"`
	Creat_time      time.Time `json:"creat_time"`
}

type Oauth2_client_tbl struct {
	Id                int       `gorm:"primary_key"`
	App_key           string    `gorm:"column:app_key"`           //key
	App_secret        string    `gorm:"column:app_secret"`        //secret
	Expire_time       time.Time `gorm:"column:expire_time"`       //超时时间
	Strict_verify     int       `gorm:"column:strict_verify"`     //是否强制验证码:1：强制，2：忽略
	Token_expire_time int       `gorm:"column:token_expire_time"` //token超时时间
}

type Product_type_tbl struct {
	Id      int    `beedb:"PK" json:"key"`
	Describ string `sql:"describ" json:"describ"`
}

type Product_tbl struct {
	Id      int    `beedb:"pk" json:"key"`
	Type_id int    `sql:"type_id" json:"type_id"`
	Describ string `sql:"describ" json:"describ"`
	Menu    string `sql:"menu" json:"menu"`
}

type Op_tbl struct {
	Id      int    `beedb:"pk" json:"-"`
	Key     int    `sql:"pkey" json:"key"`
	Describ string `sql:"describ" json:"describ"`
	Type    int    `sql:"type" json:"type"`
	Tm_len  int    `sql:"tm_len" json:"tm_len"`
}

type User_tbl struct {
	Id       int    `beedb:"pk" json:"-"`
	Username string `sql:"username" json:"username"`
	Password string `sql:"password" json:"password"`
}

type Actv_tbl struct {
	Id               int       `beedb:"pk" json:"-"`
	Key_card_id      string    `json:"key_card_id"`     //激活授权码
	Device_id        string    `json:"device_id"`       //设备id(GUID)
	Type             int       `json:"type"`            //激活码类型
	Ip               string    `json:"ip"`              //ip
	Cmd_state        int       `json:"cmd_state"`       //命令行（发送指令用）
	Cmd_pid          int       `json:"cmd_pid"`         //web过来的预设状态的产品id
	State            int       `json:"state"`           //状态(1正常，2禁用)
	Actv_time        time.Time `json:"actv_time"`       //激活时间
	Last_time        time.Time `json:"last_time"`       //最近心跳时间
	Act_product_list string    `json"act_product_list"` //激活的产品列表
	Username         string    `json"username"`         //用户名
	Alias            string    `json"alias"`            //别名
}

type Sub_device_tbl struct {
	Id              int       `beedb:"pk" json:"-"`
	Activ_device_id string    `json:"activ_device_id"` //总控设备id
	Device_id       string    `json:"device_id"`       //设备id
	Describ         string    `json:"describ"`         //设备描述
	Ip              string    `json:"ip"`              //局域网ip
	Cmd_state       int       `json:"cmd_state"`       //web过来的预设状态
	Cmd_pid         int       `json:"cmd_pid"`         //web过来的预设状态的产品id
	State           int       `json:"state"`           //当前状态
	Actv_time       time.Time `json:"actv_time"`       //激活时间
}

type Log_tbl struct {
	Id            int    `gorm:"primary_key" json:"-"`
	Device_id     string `json:"device_id"`          //总控设备id
	Sub_device_id string `json:"sub_device_id"`      //子设备id
	DidType       int    `json:"didType"`            //1:总控，2：子设备
	Timestamp     int    `json:"timestamp"`          //消息产生的时间点
	Ip            string `json:"ip"`                 //ip地址
	Pid           int    `json:"pid"`                //产品id
	Op            int    `json:"op"`                 //操作
	Ack           int    `json:"ack"`                //是否是ack消息
	Ack_time      int    `json:"ack_time"`           //持续时间
	States        int    `json:"states"`             //状态 1:连接成功 2:连接断开 3:手动删除 4:被授权
	Log_time      int    `json:"log_time,omitempty"` //go 服务器时间
}
type Log_analytics_tbl struct {
	Id            int    `gorm:"primary_key" json:"-"`
	Device_id     string `json:"device_id"`          //总控设备id
	Sub_device_id string `json:"sub_device_id"`      //子设备id
	Pid           int    `json:"pid"`                //类别
	Count         int    `json:"count"`              //使用次数
	Log_time      int    `json:"log_time,omitempty"` //go 服务器时间
	Day0          int    `json:"day0,omitempty"`     //当天的零点时间
	Month0        int    `json:"month0,omitempty"`   //当月的零点时间
	Week0         int    `json:"week0,omitempty"`    //当月的零点时间
}

type V_tbl struct {
	Version string `json:"version"` //版本号
	Url     string `json:"url"`     //URL地址
}

type Log_pay_tbl struct {
	Id        int    `gorm:"primary_key" json:"-"`
	Bundle_id string `json:"bundle_id"` //场景ID
	Pname     string `json:"pname"`     //产品名称
	Timestamp int    `json:"timestamp"` //生成时间
	Price     int    `json:"price"`     //最终支付价格
	Counts    int    `json:"counts"`    //购买数量
}

type Log_pay_analytics_tbl struct {
	Id        int    `gorm:"primary_key" json:"-"`
	Bundle_id string `json:"bundle_id"` //场景ID
	Pname     string `json:"pname"`     //产品名称
	Price     int    `json:"pid"`       //最终支付价格
	Counts    int    `json:"counts"`    //购买数量
	Hour_time int    `json:"hour_time"` //整点时间
	Day0      int    `json:"day0"`      //当天零点时间
	Week0     int    `json:"week0"`     //当周零点时间
	Month0    int    `json:"month0"`    //当月零点时间
}
