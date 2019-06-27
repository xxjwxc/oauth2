
> REST的核心原则是将你的API拆分为逻辑上的资源。这些资源通过http被操作（GET ,POST,PUT,DELETE）。

## 一、协议选择

常见API与用户的通信协议，有http和https等多种协议，根据项目需求选取

## 二、域名

将API部署在专属域名下
```
[https://api.example.com:80] =>[host]
```
如果API已经确定，并且不会有大的改动，将api放于主域名之后，代码如下
```
[host]/api/
```
## 三、版本（Versioning）

应该API版本放入URL，代码如下
```
 [host]/[api]/[v1]/
```
## 四、路径（Endpoint）
路径一般用来表示API的网址，在Restful架构中，一个网址代表着一种资源，所以网址中不能有动词只能有名词，而且所使用的名词往往与数据库的表名相对应。一般来说，数据库中的表都是同种记录的‘集合’，所以API中的名词也应该使用复数。

示例代码：

```
[host]/api/v1/zoos
[host]/api/v1/animals
[host]/api/v1/employees
```

### 五、资源操作类型

对于资源的具体操作类型，由HTTP动词表示。
常用的HTTP动词有下面五个（括号里是对应的SQL命令）。

```
GET（SELECT）：从服务器取出资源（一项或多项）。
POST（CREATE）：在服务器新建一个资源。
PUT（UPDATE）：在服务器更新资源（客户端提供改变后的完整资源）。
PATCH（UPDATE）：在服务器更新资源（客户端提供改变的属性）。
DELETE（DELETE）：从服务器删除资源。
```
### 请求URL:

GET:/api/login

POST:/api/login

PUT:/api/login

DELETE:/api/login

TRACE:/api/login
#### 资源操作原则：

即使你的内部数据模型和资源已经有了很好的对应，API设计的时候你仍然不需要把它们一对一的都暴露出来。这里的关键是隐藏内部资源，暴露必需的外部资源。

### 六、过滤信息（Filtering）
如果记录数量很多，服务器不可能都将它们返回给用户。API应该提供参数，过滤返回结果。
下面是一些常见的参数。

```
[host]/api/v1/[endpoint]?limit=10：指定返回记录的数量
[host]/api/v1/[endpoint]?offset=10：指定返回记录的开始位置。
[host]/api/v1/[endpoint]?page=2&per_page=100：指定第几页，以及每页的记录数。
[host]/api/v1/[endpoint]?sortby=name&order=asc：指定返回结果按照哪个属性排序，以及排序顺序。
[host]/api/v1/[endpoint]?animal_type_id=1：指定筛选条件
```

参数的设计允许存在冗余，即允许API路径和URL参数偶尔有重复。比如，GET /zoo/ID/animals 与 GET /animals?zoo_id=ID 的含义是相同的。

### 七、状态码（Status Codes）

服务器向用户返回的状态码和提示信息，常见的有以下一些（方括号中是该状态码对应的HTTP动词）。

```
200 OK - [GET]：服务器成功返回用户请求的数据，该操作是幂等的（Idempotent）。
201 CREATED - [POST/PUT/PATCH]：用户新建或修改数据成功。
202 Accepted - [*]：表示一个请求已经进入后台排队（异步任务）
204 NO CONTENT - [DELETE]：用户删除数据成功。
400 INVALID REQUEST - [POST/PUT/PATCH]：用户发出的请求有错误，服务器没有进行新建或修改数据的操作，该操作是幂等的。
401 Unauthorized - [*]：表示用户没有权限（令牌、用户名、密码错误）。
403 Forbidden - [*] 表示用户得到授权（与401错误相对），但是访问是被禁止的。
404 NOT FOUND - [*]：用户发出的请求针对的是不存在的记录，服务器没有进行操作，该操作是幂等的。
406 Not Acceptable - [GET]：用户请求的格式不可得（比如用户请求JSON格式，但是只有XML格式）。
410 Gone -[GET]：用户请求的资源被永久删除，且不会再得到的。
422 Unprocesable entity - [POST/PUT/PATCH] 当创建一个对象时，发生一个验证错误。
500 INTERNAL SERVER ERROR - [*]：服务器发生错误，用户将无法判断发出的请求是否成功。
```

### 八、错误处理（Error handling）

如果状态码是4xx，就应该向用户返回出错信息。一般来说，返回的信息中将error作为键名，出错信息作为键值即可。

```
{
    error: "Invalid API key"
}
```

### 九、返回结果

针对不同操作，服务器向用户返回的结果应该符合以下规范。

```
GET /collection：返回资源对象的列表（数组）
GET /collection/resource：返回单个资源对象
POST /collection：返回新生成的资源对象
PUT /collection/resource：返回完整的资源对象
PATCH /collection/resource：返回完整的资源对象
DELETE /collection/resource：返回一个空文档
```

###  十、Hypermedia API
RESTful API最好做到Hypermedia，即返回结果中提供链接，连向其他API方法，使得用户不查文档，也知道下一步应该做什么。
比如，当用户向api.example.com的根目录发出请求，会得到这样一个文档。

```
{"link": {
  "rel":   "collection https://www.example.com/zoos",
  "href":  "https://api.example.com/zoos",
  "title": "List of zoos",
  "type":  "application/vnd.yourformat+json"
}}
```
上面代码表示，文档中有一个link属性，用户读取这个属性就知道下一步该调用什么API了。rel表示这个API与当前网址的关系（collection关系，并给出该collection的网址），href表示API的路径，title表示API的标题，type表示返回类型。  

Hypermedia API的设计被称为HATEOAS。Github的API就是这种设计，访问api.github.com会得到一个所有可用API的网址列表。  


### 十一其他  

1、API的身份认证应该使用OAuth 2.0框架。（OAuth是一个关于授权（authorization）的开放网络标准，在全世界得到广泛应用，目前的版本是2.0版。）  

2、服务器返回的数据格式，应该尽量使用JSON，避免使用XML。  



