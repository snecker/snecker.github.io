---
title: docker常见问题.md
---
docker 常见问题
==============




* 端口映射/volumn映射

本地ip:192.168.1.90
容器ip:192.168.99.100

本地已经按照mysql image
需要按照如下命令
``` bash
$ docker-machine ssh default
$ docker run --restart=always -dit -v ~/mysql:/var/lib/mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true --name mysql-server -p 3306:3306  mysql
```其中: ***-p*** 就是指定端口映射,在宿主机中就可以通过192.168.99.100:3306端口进行访问

- 加上--restart=always


* docker-machine 默认root密码

``` bash
$ docker-machine ssh default
$ sudo -i
```就可以了

* docker-machine 共享windows文件夹

```
"C:/Program Files/Oracle/VirtualBox/VBoxManage" sharedfolder add default -name /home/docker/shared -hostpath D:/
```
- 其中sharedfolder是关键词.
- default :对应vm的名称
- ***D:/***对应windows路径
- /home/docker/shared 对应vm的共享路径

*  The name "/gogs" is already in use by container
docker rm gogs

* 查看端口

```shell
netstat -nlp
netstat命令各个参数说明如下：
　　-t : 指明显示TCP端口
　　-u : 指明显示UDP端口
　　-l : 仅显示监听套接字(所谓套接字就是使应用程序能够读写与收发通讯协议(protocol)与资料的程序)
　　-p : 显示进程标识符和程序名称，每一个套接字/端口都属于一个程序。
　　-n : 不进行DNS轮询(可以加速操作)
```

例子
--------
安装 gogs/gogs

docker run --restart=always -dit --name=gogs -p 22:22 -p 3000:3000 -v /home/docker/gogs:/data gogs/gogs

安装 nginx

docker run --restart=always -dit -v /mnt/sda1/var/lib/nginx:/etc/nginx/ -v /mnt/sda1/var/lib/nginx/log:/var/log/nginx --name nginx -p 80:80  nginx

docker run --restart=always -dit -v /mnt/sda1/var/lib/redis:/data --name redis -p 6379:6379  redis redis-server  --requirepass u2CVLsHGYn4dVh6M4qTMr17iaQk

