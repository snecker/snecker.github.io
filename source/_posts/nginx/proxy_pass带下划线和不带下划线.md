---
title: proxy_pass带下划线和不带下划线
---

首先看例子
---------

``` conf
server{
	listen 80;
	server_name aa.com;
	
	# 第一种
	location / {
		proxy_pass http://192.168.1.89;
	}
	
	# 第二种
	location / {
		proxy_pass http://192.168.1.89/;
	}
	
	# 第三种
	location /api/ {
		proxy_pass http://192.168.1.89/rest;
	}
	
	# 第四种
	location /api/ {
		proxy_pass http://192.168.1.89/rest/;
	}
	
}
```

效果:
----

1. 第一种 , 第二种 效果相同

2. 第三 , 第四种 效果不同.

如对 aa.com/api/one/two 路径.

- 第三种: 转发到 http://192.168.1.89/rest/api/one/two;
- 第四种: 转发到 http://192.168.1.89/rest/one/two;


注意:
---------

***带下划线***是把 location 匹配路径在反代后丢掉了 /api/, 相当于:
```
替换 /api/ 为 /
```