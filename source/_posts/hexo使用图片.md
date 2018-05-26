---
title: hexo使用图片
date: 2017-06-19 08:33:43
tags: hexo
categories: hexo
comments: true
---

> hexo框架博客使用本地图片；之前尝试的是放入根目录下，再建立起一个upload的文件夹用于存放博客图片，之后发现图片莫名的显示不出，于是重新寻找方法

## 首先安装hexo插件

```
npm install hexo-asset-image --save
或
npm install https://github.com/CodeFalling/hexo-asset-image --save
```
安装成功之后，在你创建一批文章时会同时创建同名文件夹；只需将图片放入同名文件夹中，之后在文章中引用即可
<!---more--->
## config中配置

打开主题_config.xml配置文件：

```
找到：post_asset_folder，将false属性改为

post_asset_folder : true

```

将`_config.yml`文件中的配置项`post_asset_folder`设为true后，执行命令`$ hexo new test`，在source/_posts中会生成文章test.md和同名文件夹test。将图片资源放在test中，文章就可以使用相对路径引用图片资源了。

## 使用图片

hexo [资源文件介绍](https://hexo.io/zh-cn/docs/asset-folders.html#文章资源文件夹)

### markdown的引用方式


`![](image.jpg)`

![](image.jpg)

markdown的引用方式，图片只能在文章中显示，但无法在首页中正常显示


### 标签插件语法

```
{% asset_img image.jpg This is an image %}
```

{% asset_img image.jpg This is an image %}

该方式可以在首页、文章中显示

还有其他标签：

```
{% asset_path slug %}
{% asset_img slug [title] %}
{% asset_link slug [title] %}

```

### HTML语法

```
<img src="/image.jpg" width=50% height=50% align=center/>

```

<img src="image.jpg" width=50% height=50% align=center/>


---



参考文章：

[在hexo中无痛使用本地图片](http://www.tuicool.com/articles/umEBVfI)

[Hexo框架下给博客插入本地图片](https://steflerjiang.github.io/2016/12/20/Hexo%E6%A1%86%E6%9E%B6%E4%B8%8B%E7%BB%99%E5%8D%9A%E5%AE%A2%E6%8F%92%E5%85%A5%E6%9C%AC%E5%9C%B0%E5%9B%BE%E7%89%87/)

[Hexo博客搭建之在文章中插入图片](https://yanyinhong.github.io/2017/05/02/How-to-insert-image-in-hexo-post/)


