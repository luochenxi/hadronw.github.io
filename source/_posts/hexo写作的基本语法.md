---
title: hexo写作的基本语法
date: 2018-05-27 00:49:26
tags:  [hexo]
categories: hexo
comments: true
---

>官方文档:[https://hexo.io/zh-cn/docs/writing.html](https://hexo.io/zh-cn/docs/writing.html)

## 头部规则的相关设置

文章中的头部会需要根据规则编写标题、更新时间，标签分类等类容。对读者是不可见的，语法如下：

<!--more-->

```
---
title: Git添加账号
date: 2017-06-08 19:49:26
tags:  git
categories: git
comments: true
---
```
解释说明

```
---
title: Git添加账号   # 文章标题
date: 2017-06-08 19:49:26   #创建时间
tags:  git      # 文章标签，可使用多个标签
categories: git     #文章分类目录
comments: true  # 是否开启评论功能，注：需要在blog相关配置中添加第三方评论插件
---

```


## 基本规则

遵循Markdown语法规则，维基百科：[https://zh.wikipedia.org/wiki/Markdown](https://zh.wikipedia.org/wiki/Markdown) 中有基本介绍、语法介绍。

Markdown文档（.md文档）的编辑器：Atom、Mweb（功能强大，喜欢它的页面）、Mou／MacDown（免费，简介容易上手）、Quiver等都支持。


## 多个标签的使用


```
tages: [标签1,标签2,...标签n]

或

tages: 
- 标签1
- 标签2
...
- 标签n

```

## 图片的使用

[hexo官方使用说明](https://hexo.io/zh-cn/docs/tag-plugins.html#Image)

[hexo使用图片](http://hadronw.com/2017/06-19/hexo%E4%BD%BF%E7%94%A8%E5%9B%BE%E7%89%87/)

使用网络URL图片地址

```
![图片](http://img.ivsky.com/img/bizhi/pre/201804/26/may_2018-012.jpg)

```

也可以把自己需要使用的图片上传到云上，生成URL链接，然后再使用（如：七牛）。具体根据自己的情况做决定。

