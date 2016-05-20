---
title: maven 运行时候排除某些模块.md
---

有时为了提高打包速度，会把不相关的模块排除掉

```bash
mvn clean install -pl \!module,\!module/submodule,\!groupId:artifactId
```

注意：多个模块之间不能有空格