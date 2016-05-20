---
title: linux xargs中如果包含空格怎么处理
---
经常用到 xargs,但如果管道中包含空格如何处理?

```shell
ls -l | xargs -i echo {}
```