---
title: linux 判断是否空,为空设默认值
---

linux 判断空,不为空则设置默认值的简单方式
--------

```shell
$ FOO=${VARIABLE:-default}
#或者
$ FOO=${VARIABLE:=default}```


