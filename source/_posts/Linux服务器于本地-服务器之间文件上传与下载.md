---
title: Linux服务器于本地/服务器之间文件上传与下载
date: 2017-11-13 11:55:03
tags: Linux
categories: Linux
comments: true
---


## Terminal连接服务器

一般连接服务器用到的命令`ssh`，打开terminal
<!---more--->
```
ssh -p端口号 username@服务器ip
```
一般默认的端口为22，也可以简写成：

```
ssh -p username@服务器ip

```

注意：此处的p是小写


## Terminal上传文件到服务器

需要用到的命令是`scp`

```
scp -P端口号 本地文件路径 username@服务器ip:目的路径

注意P要大写，一般默认端口是22，如：

[test@admin ~] scp -P22 /Users/test/test-bin.tar.gz root@xxx.xxx.xxx.xxx:/usr/local

也可以

scp -rp 本地文件路径 username@服务器ip:目的路径

```

注：上传文件是在没有连接服务器的窗口中运行，不要在本地连接好服务器之后的窗口运行，否则会提示本地文件目录无法找到


## Terminal从服务器中下载文件

```
scp -P端口号 username@ip:路径 本地路径(P 需要大些)

也可以

scp -rp 本地文件路径 username@服务器ip:目的路径

如：
[test@admin ~]  scp -P22 /Users/test/test-bin.tar.gz root@xxx.xxx.xxx.xxx:/usr/local

```


## 服务器之间传输文件

```
scp -rp 本地服务器文件路径  目标服务器ip:目标路径

如：

scp -rp /Users/test/test-bin.tar.gz root@xxx.xxx.xxx.xxx:/usr/local

```



