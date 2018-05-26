---
title: Mac常用软件
date: 2017-06-11 20:40:09
tags: Mac
categories: Mac
comments: true
---

## Mac常用的软件及一些配置

每个人都有不同的电脑使用习惯，记录一下自己常用的软件以及一些配置

## 个人常用的一些软件

* 网易云音乐／QQ音乐
* 微信
* QQ <!---more----->
* foxmail
* Chrome `浏览器`
* 印象笔记／有道云笔记
* Shadowsocks `vpn`
* Alfred `必备利器`
* iterm2 `terminal的替代`
* homebrew `软件管理工具，可命令下载软件`
* Mou／MacDown／Typora `markdown几款免费的文本编辑器`
* Atom `文本编辑器可高度自定义，具体可看官网，也支持markdown写作`



## 个人的一些配置

### 安装homebrew

打开terminal(终端),输入以下命令安装 [homebrew](https://brew.sh/)

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

卸载homebrew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
```

### 安装homebrew－cask


```
 brew install caskroom/cask/brew-cask
 brew update && brew upgrade brew-cask && brew cleanup // 更新
```

### 用homebrew／homebrew－cask安装软件

```
 brew cask install google-chrome // 安装 Google 浏览器
 brew cask/ install 软件名
 安装前可以先查看一下是否有该软件
 brew cask info 软件名
 brew cask uninstall 软件名 卸载
```

还有其它的一些命令，具体可以看帮助

> 这只介绍了简单的一些软件，以及一些配置；还有很多的软件需要自己去探索如：iterm、Alfred、Atom


