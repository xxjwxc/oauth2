
### 简要描述：
以下为
Content-Type = application/json
数据格式为json格式

- 用户登录接口

### 请求域名:

- http://localhost:9094/

### 请求URL:
POST:/api/v1/authorize

### 参数:


|参数名|是否必须|类型|说明|
|:----    |:---|:----- |-----   |
|appid|是|string|appid用于授权登录|
|token_type|否|string|登录的应用标记|
|username |是  |string |用户名   |
|password |是  |string | 密码    |
|time|是|sring|当前登录的时间戳|
|token|是|string|密钥校验值|

其中：token = MD5(appid + username + password + times + secret )
其中：secret为系统获取

### 返回示例:

**正确时返回:**

```
{
"state": true,
"error": "默认返回值",
"data":{
"access_token": "2DNweL5l6MOm1ftxzP8UreP6xKd2BBme",
"expire_time": "10000",
"refresh_token": "qIhC0BLYESjN5mAjFN29QlEGvJgAzJ5U"
}
}
```

**错误时返回:**


```
{
"state": false,
"code": 1003,
"error": "密文校验失败"
}
```
### 可能出现的返回id
1001 //参数无效
1002 //appid参数无效
3 //appid过期
1003 //密文校验失败
1004 //用户名不存在或密码错误
 0 ////默认的返回值，为0，自增
 101 //未知错误
 
### 返回参数说明:
data：

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|access_token |string   |登录凭证  |
|refresh_token |string   |刷新凭证  |

其它基础返回值请查看相关信息列表


## #################################################################


- 验证token接口

### 请求域名:

- http://localhost:9094/

### 请求URL:
POST:/api/v1/check_token

### 参数:

|参数名|是否必须|类型|说明|
|:----    |:---|:----- |-----   |
|token|是|string|access_token|


### 返回示例:

**正确时返回:**

```
{
"state": true,
"error": "默认返回值",
"data":{
"username": "18020119796",
"expire_time": "10000"
}
}
```

**错误时返回:**


```
{
"state": false,
"code": 102,
"error": "Token失效"
}
```

### 可能出现的返回id
1001 //参数无效
 0 ////默认的返回值，为0，自增
 102 //token失效
 
### 返回参数说明:
data：

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|username |string   |用户名  |
|expire_time|string|过期时间(秒)|

成功返回用户名


## #################################################################

- 刷新token接口

### 请求域名:

- http://localhost:9094/

### 请求URL:
POST:/api/v1/refresh_token

### 参数:

|参数名|是否必须|类型|说明|
|:----    |:---|:----- |-----   |
|refresh_token|是|string|refresh_token|



### 返回示例:

**正确时返回:**

```
{
"state": true,
"error": "默认返回值",
"data":{
"access_token": "nE97OUonpIIPtfnKYoQBMz94qJDjHDC6",
"refresh_token": "NI1k9Q5zsEZfX2wyhad3PT0i46dcazI1",
"expire_time": "10000",
"username": "18020119796"
}
}
```

**错误时返回:**


```
{
"state": false,
"code": 102,
"error": "Token失效"
}
```
### 可能出现的返回id
1001 //参数无效
 0 ////默认的返回值，为0，自增
 101 //未知错误
 102 //token失效
 
### 返回参数说明:
data：

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|access_token |string   |登录凭证  |
|refresh_token |string   |刷新凭证  |
|username |string   |用户名  |
|expire_time|string|过期时间(秒)|



### 备注:

- 更多返回错误代码请看首页的错误代码描述