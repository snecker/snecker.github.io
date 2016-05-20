docker-machine restart丢失数据的问题
===========

场景
----

执行  docker-machine restart 之后

然后  docker-machine ssh default 发现 以前在
`/home/docker`下的目录全部不见了

查找目录属性
```
Filesystem                Size      Used Available Use% Mounted on
tmpfs                     1.8G    129.5M      1.6G   7% /
tmpfs                  1001.3M     96.0K   1001.2M   0% /dev/shm
/dev/sda1                18.2G     13.3G      3.9G  77% /mnt/sda1
cgroup                 1001.3M         0   1001.3M   0% /sys/fs/cgroup
c/Users                 100.0G     74.3G     25.7G  74% /c/Users
/dev/sda1                18.2G     13.3G      3.9G  77% /mnt/sda1/var/lib/docker/aufs
```

是 tmpfs属性,看名字就和临时相关的,查后原来是存储于Volatile memory
> Volatile memory is computer storage that only maintains its data while the device is powered

然后把以前的
`/home/docker` 切换到 `/mnt/sda1/var/lib` 下
docker rm -f mysql-server
docker run --restart=always -dit -v /mnt/sda1/var/lib/mysql:/var/lib/mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true --name mysql -p 3306:3306  mysql
docker rm -f gogs



# 成功!

