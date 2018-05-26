---
title: Mac中用brew安装Tomcat
date: 2017-06-18 20:22:47
tags: Tomcat
categories: Tomcat
comments: true
---


>Tomcat的安装方式有多种，官网下载安装或用其他管理工具安装；本篇内容是用brew软件管理工具安装Tomcat


## 首先先确认brew命令正常

<!---more--->
```
brew list 查看已安装软件
```

如果命令无法正常运行可参照[此文安装brew](https://hadronw.github.io/2017/06/14/Mac%E7%9A%84%E4%B8%80%E4%BA%9B%E9%85%8D%E7%BD%AE%E4%B9%8Biterm2%E7%AF%87/)


## 查看Tomcat相关信息


```
brew info tomcat
```


## 安装Tomcat

```
brew install tomcat
```



## 检查是否安装成功


```
catalina -h
```

catalina代表Tomcat的服务


```
catalina  查看帮助命令
```

Tomcat的默认端口是8080，如果运行成功可通过[`http://localhost:8080`](http://localhost:8080)访问

webapp的根目录(CATALINA_HOME)

 `/usr/local/Cellar/tomcat/8.5.16/libexec/webapps/ROOT/`



## 运行Tomcat


```
catalina run
```

停止Ctrl＋C

## 开启服务

```
catalina start
```


## 停止服务

```
catalina stop
```






