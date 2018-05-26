---
title: Mac中安装nvm
date: 2018-01-23 17:48:21
tags: Mac
categories: Mac
comments: true
---

最近使用hexo时，总提示配置警告，追踪排查发现是node引起的错误。查看配置文件，替换配置文件，或者重新安装一下node，最后重装解决了问题。那么问题是怎么引起的呢？本文记录一下过程。

* 问题起因
* 重装过程

<!---more--->

## Homebrew升级包情况
---

Mac中Homebrew是一个很好用的软件包管理工具，通过它可以简化软件安装、管理的过程。[一些关于brew介绍可点击查看](http://hadronw.com/2017/06/14/Mac%E7%9A%84%E4%B8%80%E4%BA%9B%E9%85%8D%E7%BD%AE%E4%B9%8Biterm2%E7%AF%87/)在搭建博客初期，由于hexo需要依赖git、node等依赖环境。本着方便的想法，于是使用brew安装了node。

在平时的使用中，经常会使用brew update更新软件。多次的更新过程下（其中也有node的升级），与hexo 产生了不兼容的过程。【hexo之前安装了一个最新版的，后面也没有再更新升级了】

由此可见，使用的项目需要及时维护，特别是在使用开发版/测试版软件时。软件更新后应及时检查相关项目，看看是否兼容，是否正常使用。在确定自己没有太多的时间解决使用出现的问题时，因该优先使用稳定版软件，使用稳定版软件会减少许多不必要的问题。


## 重新安装node
---

node的版本管理工具有n、nvm；本文使用nvm安装node。吸取之前用homebrew直接安装管理node的教训，这次的思路是，先用homebrew安装nvm，再使用nvm安装管理node。

### homebrew安装nvm（无法实现）

在使用homebrew安装好nvm后，却在使用过程中出现了

```
nvm is not compatible with the npm config "prefix" option: currently set to "/Users/fabian/.nvm/versions/node/v9.4.0" Run `nvm use --delete-prefix v9.4.0` to unset it.

```
根据提示解决问题，配置环境变量。再使用发现还是出现以上问题，在查找过程中发现nvm的[官方文档](https://github.com/creationix/nvm)说明中如下所示：

{% asset_img 001.jpg %}

那么只能重新安装了


### 卸载已经安装nvm

为了避免覆盖安装出现不兼容问题，先把原来软件环境卸载

```
npm ls -g --depth=0 #查看已经安装在全局的模块，以便删除这些全局模块后再按照不同的 node 版本重新进行全局安装 

sudo rm -rf /usr/local/lib/node_modules #删除全局 node_modules 目录 

sudo rm /usr/local/bin/node #删除 node 

cd /usr/local/bin && ls -l | grep "../lib/node_modules/" | awk '{print $9}'| xargs rm #删除全局 node 模块注册的软链

```


### 安装nvm

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

或者

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

```

### 配置nvm环境变量

在~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc任意一个配置文件中配置一些nvm环境变量

```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

```

刷新一下环境变量，nvm --version查看一下版本


### 安装node

nvm的使用命令有很多，具体的可以通过help命令查看

```
nvm install stable  # 直接安装最新稳定版，不需要关注node的版本

```

如果你需要使用不同的node版本，也可以通过nvm install 版本号安装指定版本。

至此hexo所需要的环境就安装完毕，接下来就是重新部署hexo，迁移之前的环境。


### 安装hexo

[hexo官网](https://hexo.io/zh-cn/docs/index.html)

```
 npm install -g hexo-cli

```


相关主题，如[next主题官网](http://theme-next.iissnan.com/getting-started.html)


hexo的使用配置可以看官方文档，文中如有不足之处欢迎指出。







