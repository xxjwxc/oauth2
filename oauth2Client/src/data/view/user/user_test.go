package user

import (
	"fmt"
	"plug/def"
	"testing"
)

func Test_sing(t *testing.T) {
	var userinfo def.User_info_tbl
	userinfo.Headurl = "回填土图片拍摄拍摄"
	userinfo.Nickname = "啊哇哇哇"
	fmt.Println(OnUpdateUserInfo("admin", userinfo))
}
