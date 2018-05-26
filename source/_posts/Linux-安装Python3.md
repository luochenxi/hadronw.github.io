---
title: Linux 安装Python3
date: 2017-12-14 20:46:40
tags: Python
categories: Python
comments: true
---

>Linux自带Python2.x版本，Python3的安装方法有多种，本文介绍安装包安装

## 安装开发依赖

```
 yum -y groupinstall development
 
 yum -y install zlib-devel
```
<!---more--->
## 下载Python3安装包

```
wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz

tar zxvf Python-3.6.3.tgz

cd Python-3.6.3

./configure

make && make install 
```

跑完之后，查看python3安装位置

```
which python3

显示如下：
[root@ ~]# which python3
/usr/local/bin/python3
```

表示安装成功，此时Python2与Python3都安装在系统中

## 使用不同python版本

此时系统的默认Python版本2.x

```
python
ython 2.6.6 (r266:84292, Aug 18 2016, 15:13:37)
[GCC 4.4.7 20120313 (Red Hat 4.4.7-17)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>>
```
输入exit()，退出python程序

使用python3

```
python3
Python 3.6.3 (default, Dec 14 2017, 19:33:57)
[GCC 4.4.7 20120313 (Red Hat 4.4.7-18)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```
输入exit()，退出python3程序

使用python3则运行python3命令，使用python2则运行python




