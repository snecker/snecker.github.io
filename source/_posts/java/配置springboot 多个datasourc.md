
---
title: 配置springboot 多个datasourc.md
---

## 第一步

@Configuration标签后面添加
```java
@EnableConfigurationProperties
```
## 然后
---------
```java
@Bean
@ConfigurationProperties(prefix = "my.mysql")
public DataSource primaryDataSource() {
	return DataSourceBuilder.create().build();
}

@Bean
@ConfigurationProperties(prefix = "my.oracle")
public DataSource primaryDataSource() {
	return DataSourceBuilder.create().build();
}
```

## 配置文件
----------

在对应配置文件里面
```properties
my.mysql.jdbcUrl=jdbc:mysql://127.0.0.1:3306/laimi_test_010?useUnicode=true&characterEncoding=UTF-8
my.mysql.username=root
my.mysql.password=
my.mysql.maximumPoolSize=5
my.mysql.minimumIdle=3
my.mysql.connectionTimeout=30000
my.mysql.idleTimeout=30000
my.mysql.pool-prepared-statements=true
my.mysql.max-open-prepared-statements=250
my.mysql.cachePrepStmts=true
my.mysql.prepStmtCacheSize=250
my.mysql.prepStmtCacheSqlLimit=2048

my.oracle.jdbcUrl=jdbc:mysql://127.0.0.1:3306/laimi_test_010?useUnicode=true&characterEncoding=UTF-8
my.oracle.username=root
my.oracle.password=
my.oracle.maximumPoolSize=5
my.oracle.minimumIdle=3
my.oracle.connectionTimeout=30000
my.oracle.idleTimeout=30000
my.oracle.pool-prepared-statements=true
my.oracle.max-open-prepared-statements=250
my.oracle.cachePrepStmts=true
my.oracle.prepStmtCacheSize=250
my.oracle.prepStmtCacheSqlLimit=2048
```

注意：
1. 如果是默认的 ："org.apache.tomcat.jdbc.pool.DataSource",
			"com.zaxxer.hikari.HikariDataSource",
			"org.apache.commons.dbcp.BasicDataSource",
			"org.apache.commons.dbcp2.BasicDataSource" 这四种type的话
可以直接采用上面的方式。如果是其他第三方库的需要
```java
DataSourceBuilder.create().type($VenderDataSource).build();
```

2. 至于 driverClassName：可以直接在 

DataSourceBuilder.create().driverClassName($VenderDriver),也可以在

DataSourceBuilder.create().url($VenderUrl)

中指定，会默认按照 url里面去解析匹配

3. my.mysql + VenderDatasource对应的field。springboot 会检测Datasource里面是否有相同名字的field，如果有，则注入。


