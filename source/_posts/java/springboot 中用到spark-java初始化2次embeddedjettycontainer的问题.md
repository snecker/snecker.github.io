---
title: springboot 中用到spark-java初始化2次embeddedjettycontainer的问题.md
---
springboot 中用到spark-java初始化2次embeddedjettycontainer的问题
=======

sparkjava内置了jetty,集成springboot的时候

springboot会扫描classpath刚好包含了jetty-web/api等jetty包,则会初始化springboot内置的embeddedjetty 8080端口的服务

而spark本身显示调用了创建一个jetty服务,这样项目启动之后就创建了两个服务,其实只spark创建的哪一个.

解决
--- -

```java
ApplicationContext context =new SpringApplicationBuilder(RUNNER.class).web(false).run(args);
```

其中 web(false)就指明不自动创建一个web环境