---
title: Mac中使用SSH连接服务器中断问题
date: 2018-03-28 12:24:15
tags: Mac
categories: Mac
comments: true
---

> Mac中iterm2使用SSH连接服务器时，会出现与服务器中断/无响应的问题。

主要原因是：是服务器端把空闲连接给断开了，或者是网络断开


iterm2/terminal 使用SSH命令连接服务器过程中会定时发送心跳以确定是否客服端与服务端是否连接。

<!---more--->

客服端中设定的通信时间过长，服务端中也有这空闲一段时间后会断开远程连接的机制，两边任意一方没有通信请求，连接中断。

思路，修改客服端发送通信心跳间隔，或者修改服务器中的时间间隔。


解决方案：

* 修改客服端/Mac中的SSH参数
* 修改服务器端中的配置


## 客服端/Mac中修改SSH参数


客服端中通过配置ServerAliveInterval来实现，在 ~/.ssh/config 中加入： ServerAliveInterval=30

```

vi ~/.ssh/config  

# 新增以下内容

Host *
    ServerAliveInterval 45
```

ServerAliveInterval 30 #表示ssh客户端每隔30秒给远程主机发送一个no-op包，no-op是无任何操作的意思，这样远程主机就不会关闭这个SSH会话。可根据实际情况更改时间间隔

Host * 是指任意服务IP



## 服务器端中的配置

```
vim /etc/ssh/sshd_config

# 添加/或者解除注释
ClientAliveInterval 30
ClientAliveCountMax 6

```

ClientAliveInterval表示每隔多少秒，服务器端向客户端发送心跳
下面的ClientAliveInterval表示上述多少次心跳无响应之后，会认为Client已经断开。
所以，总共允许无响应的时间是60*3=180秒


注：本文仅作为日常实践记录

参考文档：

[iTerm2中ssh保持连接不断开](http://bluebiu.com/blog/iterm2-ssh-session-idle.html)

[iTerm2保持ssh连接不断开](http://flygopher.me/2017/08/12/iterm2-ssh/)

[mac电脑iTerm2链接linux服务器断线解决方案
](http://www.haorooms.com/post/mac_iterm2_ssh)

[Linux使用ssh超时断开连接的真正原因](http://bluebiu.com/blog/linux-ssh-session-alive.html)

[解决SSH自动断线，无响应的问题](https://www.coder4.com/archives/3751)

