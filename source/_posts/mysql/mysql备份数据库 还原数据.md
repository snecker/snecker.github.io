
---
title: mysql备份数据库 还原数据
---

还原
------------

gz
```sql
gunzip < dd.dump.gz | mysql laimi_test_010 -h 192.168.99.100 -u root -p
```

文本
```sql
mysql laimi_test_010 -h 192.168.99.100 -u root -p < $yourFile
```