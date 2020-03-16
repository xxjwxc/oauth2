package def

import (
	"encoding/json"
	"io/ioutil"

	"github.com/ant0ine/go-json-rest/rest"
)

func GetRequestJsonObj(r *rest.Request, v interface{}) error {

	//添加支持json 操作
	body, err := ioutil.ReadAll(r.Body)
	r.Body.Close()
	json.Unmarshal(body, &v)
	//-----------------------------end
	return err
}
