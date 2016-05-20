
环境
----------
本人 windows环境


步骤
------

1. 安装node
2. 加入环境变量
3. clone quick-start项目
```bash
$ git clone https://github.com/angular/quickstart  my-project
$ cd my-project
$ npm install
$ npm start
```


没有问题的话会安装第三方库到当前路径下,然后浏览器会自动打开 localhost:3000可以看到quickstart项目运行成功了.

问题:
--------------
idea提示 Error:(1, 1) TS1128: Declaration or statement expected
查资料说是typescript版本不对.

然后在idea里面设置
> settings -> Typescript -> compile version 

选择包含typescriptServices.js的目录上一层
```
C:\Users\Paul\AppData\Roaming\npm\node_modules\typings\node_modules\typings-core\node_modules\typescript\lib\typescriptServices.js
```

改成Hello World!例子
----------

```typescript
import {Component} from 'angular2/core';

@Component({
    selector: 'my-app',
    template: '<h1>{{hello}}.and {{world}}</h1>'
})

export class AppComponent {
    hello = 'Hello';
    world = 'World';
}

```

AppComponent 里面的hello,world 相当于组件包含的业务数据.而业务数据又通组件渲染到模板上来.
