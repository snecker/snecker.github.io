docker zookeeper 集群搭建
=============


创建网络bar
----------

```shell
docker network create --subnet 172.19.0.0/16 --gateway 172.19.0.1 --ip-range 172.19.0.0/17 bar
```

pull镜像
---------

```shell
docker pull mesoscloud/zookeeper
```

后台进程形式启动镜像
-----------

```shell
docker run -d \
--name zk1 \
--net bar \
--ip 172.19.200.1 \
-p 2181:2181 \
-e MYID=1 \
-e SERVERS=172.19.200.1,172.19.200.2,172.19.200.3 \
 mesoscloud/zookeeper
 ```
 
```shell
docker run -d \
--name zk2 \
--net bar \
--ip 172.19.200.2 \
-p 2182:2181 \
-e MYID=2 \
-e SERVERS=172.19.200.1,172.19.200.2,172.19.200.3 \
 mesoscloud/zookeeper
 ```

```shell
 docker run -d \
--name zk3 \
--net bar \
--ip 172.19.200.3 \
-p 2183:2181 \
-e MYID=3 \
-e SERVERS=172.19.200.1,172.19.200.2,172.19.200.3 \
 mesoscloud/zookeeper
```

注意:
- 
报错: 启动连接后,可能会报错
`Got user-level KeeperException when processing sessionid` ,一查好像是正常的