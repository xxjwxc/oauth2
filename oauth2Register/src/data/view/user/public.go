package user

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	"github.com/xxjwxc/oauth2/oauth2Register/src/data/view"
)

func (u *User) FindAccountByUsername(orm *gorm.DB, username string) (user view.User_account_tbl, isfind bool) {
	isfind = false
	//orm.Where("account=?", username).Find(&user)
	if orm.Where("account=?", username).Find(&user).Error == nil { //找到此用户
		orm.Model(&user).Related(&user.UserInfo, "UserInfo") //外键关联
		isfind = true
	}

	return
}
