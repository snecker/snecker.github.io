创建Repository
-----------

首先是要在github上手动创建一个Repository的。创建Repostitory有两种方式

- github页面上 create repository
- github提供的 api 创建

注：不支持直接在git bash当中创建


第一次提交代码
---------

如果已经有项目目录:
```
cd $project
git init
git remote add origin git@github.com:snecker/my_blog.git
git add .
git push -u origin master
```
如果项目改了路径或者用户名改了，需要
```
git remote set-url origin $git-new-url
```
注：如果new-url不存在的话会报repository不存在的。


问题
----------------
1. 第一次提交的时候是用 git remote add https://github.com/** 这种形式，结果每次都需要输入帐号
后来改成 git@github.com 这种形式就好了

