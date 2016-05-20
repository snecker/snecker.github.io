两个目录
- gitbook 目录: md文件的目录.对应 snecker.github.io项目的 develop分支

- snecker.github.io 目录:对应 snecker.github.io项目的 master分支.存放静态html文件

平常记录一篇笔记之后.发布到 snecker.github.io.步骤是:

1. cd gitbook目录
2. gitbook build . ../snecker.github.io
3. cd snecker.github.io
4. git pull && git add . && git ci -am "comment" && git push

能不能把这些操作放到一条命令就能执行呢?

1. cd gitbook

2. 创建脚本 gen_gitbook.bat 用于build 静态资源,内容
```bash
@echo off
cd /d "E:\github\gitbook"
gitbook build . ../snecker.github.io
```
3. 创建脚本 commit_and_push.bat 用于git 提交 并push
```bash
@echo off
echo "准备提交md..."
g pull
g add .
g ci -am "update"
g push


echo "准备push static html..."
cd /d "E:\github\snecker.github.io"
g pull
g add .
g ci -am "update"
g push

```

4. 创建脚本pblog.bat 用于合并两个脚本命令
```bash
@echo off
gen_gitbook.bat && commit_and_push.bat
```

5. 定义别名 (可以参考之前文章 [如何定义别名](/windows/how-to-create-alias-permanantly-in-windows.md))
末尾添加一行```bash
doskey pblog=E:\github\gitbook\pblog.bat
```

6. 打开cmd.直接输入 pblog,build,push一气呵成.

优化
------------

git ci -am "comment"在脚本里面是写死的.可以通过参数传递进去.

(提示:%0表示批处理命令本身，其它参数字符串用%1到%9顺序表示)





