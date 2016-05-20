---
title: nginx websocket 连接 每隔一断时间自己断掉.md
---

直接通过 $ip:$port这种形式就没问题，而通过nginx作反向代理之后就会每隔一段时间自己断掉。需要配置
```
server {
        listen 80 ;
        server_name my.com;
        location ~* ^/api/v1/ws{
            proxy_pass http://127.0.0.1:8810;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_connect_timeout 7d;
            proxy_send_timeout 7d;
            proxy_read_timeout 7d;
        }
		...
}
```