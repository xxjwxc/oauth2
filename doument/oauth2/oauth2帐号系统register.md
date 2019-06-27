#用户注册，忘记密码，获取验证码系统

### 简要描述：

- 获取验证码

### 请求域名:

- http://[url]:[port]/

### 请求URL:
POST:/api/v1/get_verify


### 参数:

|参数名|是否必须|类型|说明|
|:----    |:---|:----- |-----   |
|lg |是  |string |语言cn,en   |
|username |是  |string | 用户名    |
|flag |是  |int | 标记：1：注册，2：修改密码    |
|appid |是  |string | 授权id    |
|smsflag |是  |int | 语音短信标记，1：短信 2:语音 (超时范围内可以重发语音)    |
|signature |是  |string | 签名 :MD5()   |
   
   
其中：signature = MD5(lg + username + flag + smsflag + appid + secret )
其中：secret从授权系统获取

### 参数示例:

### 返回示例:
```
{
"lg": "cn",
 "username":"346944475@qq.com",
 "flag":1,
 "appid":"wwwthings",
 "smsflag":1,
 "signature":"4BD95AB18B63E0EF9223832468605B79"
 }
```

**正确时返回:**

```
{
"state": true,
"data":{
"verify": "587870"
}
}
```

**错误时返回:**


```
{
"state": false
}
```


### 简要描述：

- 检测用户名是否存在
### 请求域名:

- http://[url]:[port]/

### 请求URL:
POST:/api/v1/check_user

### 参数:

|参数名|是否必须|类型|说明|
|:----    |:---|:----- |-----   |
|username |是  |string | 用户名    |

### 返回值
```
{
"state": true,
"data":{
"isfind": false
}
}
```


### 简要描述：

- 注册，或者修改密码
### 请求域名:

- http://[url]:[port]/

### 请求URL:
POST:/api/v1/doaction

### 参数:

|参数名|是否必须|类型|说明|
|:----    |:---|:----- |-----   |
|username |是  |string | 用户名    |
|password |是  |string | 密码(MD5)    |
|verify |否  |string | 验证码(非强制可以不加)    |
|flag |是  |int | 1:注册，2:修改密码    |
|bundleid |是  |string |产品id    |
|appid |是  |string | appid    |
|signature |是  |string | 签名    |
   
   
其中：signature = MD5(username + password + verify + flag + bundleid +  appid +secret)   

其中：secret从授权系统获取
   



### 备注

- 更多返回错误代码请看首页的错误代码描述