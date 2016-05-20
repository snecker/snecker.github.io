在src/main/resources下有
```
config/application-local.properties
config/application-test.properties
config/application-prod.properties
```
三个文件
在入口runner类中声明
```java
@PropertySource("config/application-${spring.profiles.active:local}.properties")
```
可以引用对应profile的文件

在单元测试中声明
```java
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = RUNNER.class)
@ActiveProfiles("prod")
```