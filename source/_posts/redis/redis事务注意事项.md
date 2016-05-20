---
title: redis事务注意事项
---
[redis 事务](http://redisbook.readthedocs.org/en/latest/feature/transaction.html)

需要注意的是：

1. 事务中的命令是按顺序执行的，在命令中间不会夹杂执行其他客户端发出的命令。执行完事务的命令才会执行其他客户端的命令。

2. redis 的事务不可嵌套

3. DISCARD 命令会清空事务队列，返回OK

4. WATCH 只能在事务multi命令之前执行。如果事务队列的命令在执行过程中发现 watch 的值发生变化，则整个事务队列的命令不会执行，直接返回失败
