---
title:bat脚本中传递参数包含空格的问题
---
原始
---- 

```shell
@echo off

git ci -m "%1"
```

 ***%1***代表第一个参数
 
修改
----
```shell
@echo off

git ci -m %1

```

结论
----
其实,去掉引号就好了