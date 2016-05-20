---
title:windows安装 rsync一些问题
---
提示找不到目录
==============
windows下安装rsync时候
运行rsync命令后，在command line下提示：
Could not create directory '/home/Paul/.ssh'.

而我的.ssh文件夹是在

C:\Users\Paul\.ssh


解决
--------

增加***HOME***环境变量：
```
C:\Users\Paul
```
搞定了


提示：uid 4294967295 (-1) is impossible to set on "/mnt/java/aa.sql"
--------

可以在rsync 的option中加上  ***--chown=root:root***
命令如下
```shell
rsync -crzvaP --delete --exclude logs --chown=root:root --chmod=Du=rwx,Dgo=rx,Fu=rx,Fgo=r  $sourcePath  $destPath
```