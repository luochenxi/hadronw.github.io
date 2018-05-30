---
title: Mosh优化SSH连接卡顿问题
date: 2018-03-13 20:55:38
tags: [Mac,Linux,mosh,iterm2,tmux]
categories: Mac
comments: Mac
---

> 在使用SSH连接远程服务器时，因为网络等原因会产生卡顿，导致使用非常不爽。网上找到一个解决方案Mosh，本文记录一下使用过程。

## Mosh是什么
---

[Mosh](https://mosh.org/)官网，是一个替代SSH的免费软件，它最大的特点是支持网络漫游和间歇性连接。
<!---more--->
* 会话的中断不会导致当前正在前端执行的命令中断，相当于你所有的操作都是在screen命令中一样在后台执行
* 会话在中断过后，不会立刻退出，而是启用一个计时器，当网络恢复后会自动重新连接，同时会延续之前的会话，不会重新开启一个


## Mosh安装
---

Mosh使用需要在服务端、客户端分别安装Mosh工具，才能使用

### Mac安装

```
brew install mosh
```


### Linux安装

```
# Debian、Ubuntu 和Mint 类似的系统中，你可以很容易地用apt-get包管理器安装

 apt-get update
 apt-get install mosh

# 在基于RHEL/CentOS/Fedora的系统中，要使用yum包管理器安装mosh，你需要打开第三方的EPEL

 yum update
 yum install mosh
 
 # 在Fedora 22+的版本中，你需要使用dnf包管理器来安装Mosh
 dnf install mosh

```

## Mosh使用
---

简单的使用，用mosh连接Linux服务器

```
mosh root@xxx.xxx.xxx.xxx

输入密码后就连接成功了,使用之后你会发现卡顿消失了

输入exit则退出连接

```

以上是简单的使用，还有进阶版的使用，指定端口等。具体看官方文档，参考如下：

```
sudo iptables -I INPUT -p udp --dport 60001 -j ACCEPT
```
服务端开启60001端口，提供客服端访问，客服端访问参考如下：

```
mosh -p 60001 用户名@ip地址

p 参数用于指定 UDP 端口
```


如果连接不成功，可能是防火墙有关端口的问题。

mosh可以结合tmux一起使用，效果会更佳



参考链接：

官方网站： https://mosh.org/

https://meiriyitie.com/2015/05/28/mosh/

https://www.hi-linux.com/posts/23118.html

http://blog.sciencenet.cn/blog-935970-856971.html

https://linux.cn/article-6262-1.html



