---
title: git使用https方式时候找不到证书文件
---

配置证书路径
---------

```shell
git config --system http.sslcainfo "D:\Program Files\Git\mingw64\ssl\certs\ca-bundle.crt"
git remote rm origin
git remote add origin https://username:password@github.com/sneker/**.git
```

长期存储密码
---------

git config --global credential.helper store