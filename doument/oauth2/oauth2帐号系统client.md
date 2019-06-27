
### 简要描述：

- 用户登录接口

### 请求域名:

- http://localhost:9094/

### 请求URL:
POST:/api/v1/login


### 参数:

|参数名|是否必须|类型|说明|
|:----    |:---|:----- |-----   |
|username |是  |string |用户名   |
|password |是  |string | 密码    |
|time |是  |string | 当前时间戳（精确到秒）    |

### 返回示例:

**正确时返回:**

```
{
"state": true,
"error": "默认返回值",
"data":{
"access_token": "W5YDyk1XAvf3BZp7fpBDng9l6Sy0cBZv",
"expire_time": "10000",
"refresh_token": "pJNCoTqT9Jc2WHWqPaKEZxZvCWzHBq7V"
}
}
```

**错误时返回:**


```
{
"state": false,
"code": 1004,
"error": "用户名不存在或密码错误"
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
|expire_time|string|过期时间(秒)|

### 返回示例:

**正确时返回:**

```
{
"state": true,
"error": "默认返回值",
"data":{
"access_token": "nE97OUonpIIPtfnKYoQBMz94qJDjHDC6",
"expire_time": "10000",
"refresh_token": "NI1k9Q5zsEZfX2wyhad3PT0i46dcazI1",
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

### 简要描述：

- 用户获取验证码接口

### 请求域名:

- http://localhost:9094/

### 请求URL:
POST:/api/v1/go/verify（golang版本）
POST:/api/v1/php/verify（php版本）


### 参数:

|参数名|是否必须|类型|说明|
|:----    |:---|:----- |-----   |
|lg |是  |string |语言（cn，en）   |
|username |是  |string | 用户名    |
|flag |是  |int | 标识（1：注册，2：修改密码） 
|smsflag |是  |int | 接收标识（1：短信，2：语音） 

### 参数示例:
```
{
 "lg": "cn",
 "username":"741377031@qq.com",
 "flag":1,
 "smsflag":1
}
```
### 返回示例:

**正确时返回:**

```
{
"state": true
}
```

**错误时返回:**


```
{
"state": false
}
```

### 备注:

- 无

### 简要描述：

- 用户获取注册或修改密码接口

### 请求域名:

- http://localhost:9094/

### 请求URL:
POST:/api/v1/go/doaction（golang版本）
POST:/api/v1/php/doaction（PHP版本）


### 参数:

|参数名|是否必须|类型|说明|
|:----    |:---|:----- |-----   |
|username |是  |string | 用户名    |
|password |是  |string | 密码    |
|verify |否  |string | 验证码（当可以忽略验证码时，可以省略）    |
|flag |是  |int | 标识（1：注册，2：修改密码） 
|bundleid |是  |string | 授权场景ID

### 参数示例:
```
{
  "username":"741377031@qq.com",
  "password":"123",
  "verify":"934770",
  "flag":1,
  "bundleid":"nomal"
}
```
### 返回示例:

**正确时返回:**

```
{
"state": true
}
```

**错误时返回:**


```
{
"state": false,
"code": 1017,
"error": "验证码错误"
}
```

### 备注:

- 无