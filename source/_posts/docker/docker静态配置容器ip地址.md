---
title: 静态配置容器的ip地址
---


``` bash
docker network create --subnet 172.19.0.0/16 --gateway 172.19.0.1 --ip-range 172.19.0.0/17 bar
```

这样,就保留了172.19.128.0/17这个子网可以用于静态IP地址分配了