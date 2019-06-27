 目录 
 空白文档
 restful通用标准
 oauth2
 oauth2帐号系统client
 oauth2帐号系统server
 oauth2帐号系统register
 oauth2相关表结构
 服务器消息返回通用接口
 消息id及定义
 服务器端口号定义
 php微信商城

-
1
### 1. oauth2_access_token表
2
​
3
- 授权登录凭证表
4
​
5
|字段名|类型|主键|说明|是否自增|
6
|:----    |:---|:----- |-----   |
7
|id |int  |是 |ID   |是
8
|access_token |varchar|否  |登录凭证 | 否    |
9
|token_type |varchar  |否 | 登录的应用标记   |否|
10
|app_key |varchar  |否 | 授权id    |否|
11
|username |varchar  |否 | 用户名  |否|
12
|expires |datetime  |否 | 过期时间  |否|
13
​
14
### 2. oauth2_client_tbl表
15
- 授权client信息表
16
​
17
|字段名|类型|主键|说明|是否自增|
18
|:----    |:---|:----- |-----   |
19
|id |int  |是 |ID   |是
20
|app_key |varchar|否  |授权id | 否    |
21
|app_secret |varchar  |否 | 授权secret   |否|
22
|expire_time |datetime  |否 | 过期时间    |否|
23
|strict_verify |int  |否 | 是否强制验证码（1：强制，2：忽略）  |否|
24
|token_expire_time |int  |否 | token过期时间(单位：秒)  |否|
25
​
26
### 3. oauth2_refresh_token表
27
- 授权刷新凭证表
28
​
29
|字段名|类型|主键|说明|是否自增|
30
|:----    |:---|:----- |-----   |
31
|id |int  |是 |ID   |是
32
|refresh_token |varchar|否  |刷新凭证 | 否    |
33
|token_type |varchar  |否 | 登录的应用标记   |否|
34
|app_key |varchar  |否 | 授权id    |否|
35
|username |varchar  |否 | 用户名  |否|
1. oauth2_access_token表

授权登录凭证表
字段名	类型	主键	说明	是否自增
id	int	是	ID	是
access_token	varchar	否	登录凭证	否
token_type	varchar	否	登录的应用标记	否
app_key	varchar	否	授权id	否
username	varchar	否	用户名	否
expires	datetime	否	过期时间	否
2. oauth2_client_tbl表

授权client信息表
字段名	类型	主键	说明	是否自增
id	int	是	ID	是
app_key	varchar	否	授权id	否
app_secret	varchar	否	授权secret	否
expire_time	datetime	否	过期时间	否
strict_verify	int	否	是否强制验证码（1：强制，2：忽略）	否
token_expire_time	int	否	token过期时间(单位：秒)	否
3. oauth2_refresh_token表

授权刷新凭证表
字段名	类型	主键	说明	是否自增
id	int	是	ID	是
refresh_token	varchar	否	刷新凭证	否
token_type	varchar	否	登录的应用标记	否
app_key	varchar	否	授权id	否
username	varchar	否	用户名	否
expires	datetime	否	过期时间	否
token_expire_time	int	否	token过期时间(单位：秒)	否
4. user_account_tbl表

用户信息表
字段名	类型	主键	说明	是否自增
id	int	是	ID	是
account	varchar	否	用户名	否
password	varchar	否	密码	否
account_type	int	否	账号类型（1：手机号，2：邮件）	否
app_key	varchar	否	app_key	否
user_info_id	int	否	关联用户详细信息表的id	否
reg_time	datetime	否	注册时间	否
reg_ip	varchar	否	注册的IP地址	否
bundle_id	varchar	否	场景ID	否
5. user_info_tbl表

用户详细信息表
字段名	类型	主键	说明	是否自增
id	int	是	ID	是
nickname	varchar	否	用户昵称	否
headurl	varchar	否	头像URL	否