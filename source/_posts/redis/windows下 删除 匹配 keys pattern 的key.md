---
title: windows下 redis-cli 如果删除keys * 匹配的key
tags:
- key
- windows
---

``` bash
redis-cli -h 192.168.99.101 -a xx keys sync.plugin.*|sed 's/\r$//' |xargs redis-cli -h 192.168.99.101 -a xx DEL
```

注意.windows下 查出来的结果包含了 "\r",需要去掉

