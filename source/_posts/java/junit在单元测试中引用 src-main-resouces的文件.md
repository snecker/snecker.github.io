---
title: junit在单元测试中引用 src-main-resouces的文件
---
在maven项目中单元测试的时候。
有时我希望引入src/main/resources下面的配置文件或其他文件。


默认情况下，运行单元测试的时候， 是从 target/test-classes目录下读取。而这个目录下的文件是从 src/test/resources下编译过来的。

解决：

在pom.xml中配置
```xml
<build>
        <resources>
            <resource>
                <directory>src/main/resources</directory>
            </resource>
        </resources>
        <testResources>
            <testResource>
                <directory>src/test/resources</directory>
            </testResource>
            <testResource>
                <directory>src/main/resources</directory>
            </testResource>
        </testResources>
</build>
```
