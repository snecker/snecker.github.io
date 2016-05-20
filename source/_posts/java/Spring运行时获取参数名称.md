---
title: Spring 运行时获取参数名称
---

# Spring 运行时获取参数名称

```java
ParameterNameDiscoverer parameterNameDiscoverer = new LocalVariableTableParameterNameDiscoverer();
String[] strings = parameterNameDiscoverer.getParameterNames(method);
```

注
----

1. 可以读取到class的方法,Abstract class的非抽象方法
2. interface方法和Abstract class 抽象方法无法获取

