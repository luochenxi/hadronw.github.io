---
title: hexo blog 添加分享功能
date: 2018-05-28 19:49:26
tags: [hexo,blog]
categories: hexo
comments: true
---


前几天把hexo博客的主题更换了一下，新换的主题没有集成分享功能，所以手动添加一下。

此次添加的分享功能为第三方[http://www.mob.com/](http://www.mob.com/)提供的，本着快速的方式，整个功能的添加过程也很简单。时间充裕的情况下，可以尝试自己编写。下文是记录的步骤。

<!-- more -->

主要有两个步骤：

* mob网站应用的创建
* hexo博客中添加ShareSDK的功能

## 第一步 —— mob
---

先注册mob账号，登陆成功后进入后台管理。 下面文字记录一下操作步骤：

1. 新建应用 `如新建hexo应用`

2. 进入hexo应用管理页面 `进入新建的hexo应用后台管理页面会有相关功能的添加`

3. 添加ShareSDK功能 `添加成功后会出现相关提示`

4. 记录好AppKey  `一个应用的Appkey值只有一个，后续的Share功能中会需要用到`

至此，mob中的账号信息，应用创建完毕。

参考如下图所示：

{% asset_img hexo-addshare-01.png This is an image %}


进入mob官网中的产品文档区，找到web集成文档[http://wiki.mob.com/%E5%BF%AB%E9%80%9F%E9%9B%86%E6%88%90-13/](http://wiki.mob.com/%E5%BF%AB%E9%80%9F%E9%9B%86%E6%88%90-13/)。找到快速集成区域，可以看到需要集成的代码。此处将官网的集成代码拷贝了过来，如下所示：

```HTML
<!--MOB SHARE BEGIN-->
<div class="-mob-share-ui-button -mob-share-open">分享</div>
<div class="-mob-share-ui" style="display: none">
    <ul class="-mob-share-list">
        <li class="-mob-share-weibo"><p>新浪微博</p></li>
        <li class="-mob-share-qzone"><p>QQ空间</p></li>
        <li class="-mob-share-qq"><p>QQ好友</p></li>
        <li class="-mob-share-douban"><p>豆瓣</p></li>
        <li class="-mob-share-facebook"><p>Facebook</p></li>
        <li class="-mob-share-twitter"><p>Twitter</p></li>
    </ul>
    <div class="-mob-share-close">取消</div>
</div>
<div class="-mob-share-ui-bg"></div>
<script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=你的appkey"></script>
<!--MOB SHARE END-->
```

将上面的代码拷贝到博客中的页面，修改成自己设置应用的Appkey值，部署之后即可使用


## 第二步 —— hexo博客中添加功能

---

上文中已经完成了先期的准备工作，现在开始在hexo博客中添加功能。

找到hexo博客使用的主题目录，进入`layout`文件夹，所有页面相关的功能都是在此文件夹下。

`_layout.swig` 页面是整个hexo博客功能关联的核心。以下简单介绍一下hexo资源相关作用

```
一般hexo主题下会存有如下几个文件夹

languages：用与做多语言适配

layout：页面功能设计区，主页面功能，菜单栏，页面头部，页面底部，评论，统计等都是添加在此处

source：资源管理区域，css样式，图片，字体，依赖lib

```

进过简单的源码梳理，发现只有在主题下的`/layout/_layout.swig` 文件中`<body></body>`标签中添加快速集成的代码即可。

注意一下添加的位置，建议放到评论功能的位置之上。参考如下图所示

{% asset_img hexo-addshare-00.png This is an image %}

---

这样简单的添加功能是好了，但却不利于后期的维护。通过查看源码，我们发现主题源码已经做了相关接藕操作。`将功能分成不同的部分，然后在_layout.swig页面进行拼装` 所以，添加share功能也应该进行相似的处理。

思路：

* 在/layout/_partial文件夹下新建`shares.swig` 文件
* 把快速集成中的代码加入其中
* _layout.swig页面相关位置引用添加的shares.swig文件

shares.swig 文件参考代码

```
{% if page.comments and not is_home()  %}
<div class="-mob-share-ui-text -mob-share-open">分享</div>
<div class="-mob-share-ui -mob-share-ui-theme-slide-bottom" style="display: none">
    <ul class="-mob-share-list">
        <li class="-mob-share-weibo"><p>新浪微博</p></li>
        <li class="-mob-share-weixin"><p>微信</p></li>
        <li class="-mob-share-qzone"><p>QQ空间</p></li>
        <li class="-mob-share-qq"><p>QQ好友</p></li>
        <li class="-mob-share-douban"><p>豆瓣</p></li>
        <li class="-mob-share-youdao"><p>有道云笔记</p></li>
        <li class="-mob-share-facebook"><p>Facebook</p></li>
        <li class="-mob-share-twitter"><p>Twitter</p></li>
    </ul>
    <div class="-mob-share-close">取消</div>
</div>
<div class="-mob-share-ui-bg"></div>
<script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=theme.shares.shares-mob"></script>
{% endif %}
```

参考代码有所调整，首先增加了功能限制，并不是每一个页面都需要分享功能。上面的处理是评论功能开启，分享功能也同时开启，blog首页中不展示分享功能。可根据实际情况做调整。

_layout.swig中的引用代码

```
{% include '_partial/shares.swig' %}  注意存放的页面位置
```


## Share SDK相关设置说明

---

### 支持的平台

上文中，share功能已经添加成功，这部分是记录一下mob官网中关于shareSDK的一些设置说明。

支持的分享平台如下所示，本文中的功能并没有完全添加，知道了官方支持的分享平台后，则可以根据实际情况进行调整

```
平台名称   		 ID   

新浪微博    ——》 weibo  

微信       ——》 weixin 

QQ空间     ——》 qzone 

QQ好友     ——》 qq 

豆瓣网      ——》 douban 

Faceboo    ——》 facebook 

Twitter    ——》 twitter  

Pocket     ——》 pocket  

Google+    ——》 google  

有道云笔记   ——》 youdao  

Tumblr     ——》 tumblr  

Instapap   ——》 instapaper  

Linkedin   ——》 linkedin 


```
### 分享功能弹出的效果

---

通过增加-mob-share-ui元素的css类改变弹出效果

默认效果 -mob-share-ui-theme -mob-share-ui-theme-scatter
上边滑出 -mob-share-ui-theme -mob-share-ui-theme-slide-top
下边滑出 -mob-share-ui-theme -mob-share-ui-theme-slide-bottom
左边滑出 -mob-share-ui-theme -mob-share-ui-theme-slide-left
右边滑出 -mob-share-ui-theme -mob-share-ui-theme-slide-right

修改参考如下，改成了左侧弹出分享功能

```
<!--MOB SHARE BEGIN-->
<div class="-mob-share-ui -mob-share-ui-theme -mob-share-ui-theme-slide-left" style="display: none">
    略...
</div>
```

根据实际需求修改样式。

更多的功能可看官方文档：[分享设定](http://wiki.mob.com/%E5%88%86%E4%BA%AB%E8%AE%BE%E5%AE%9A/)

注：如有遇到问题先自己排查一下，然后再看看官方文档，之后再做调整修改。ps：所有想满足自己的功能都经过无数次的调整、修改



