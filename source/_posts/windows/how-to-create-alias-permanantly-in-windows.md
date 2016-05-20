---
title:how-to-create-alias-permanantly-in-windows.md
---
windows 下创建 类似 linux alias命令
==========

1. 下载git
---------


2. 添加git Path
--------

	D:\Program Files\Git\mingw64\bin
	

现在可以在命令行输入很多如ssh，grep等linux命令了
	
3. 新建命令行脚本 C:\bin\autorun.bat
---

`
	@echo off
	cls
	color 0A
	doskey prod=ssh root@192.168.X.X $*
`

4.加入注册表
------

	reg add "hkcu\software\microsoft\command processor" /v Autorun /t reg_sz /d D:\autorun.bat