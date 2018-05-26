---
title: Linux中安装Maven & Ant
date: 2018-04-22 13:43:24
tags: Linux
categories: Linux
comments: true
---

## Linux中安装Maven
---

### 下载Maven安装包 

Maven apache官方下载[http://maven.apache.org/bindownload.cgi](http://maven.apache.org/bindownload.cgi)
<!---more--->
[阿里云镜像](https://mirrors.aliyun.com/apache/maven/)

下载:apache-maven-x.x.x-bin.tar.gz 到Linux 常用文件保存目录,如/home/soft

```
[root@test soft]# tar zxvf apache-maven-x.x.x-bin.tar.gz -C /home/modules  

```
tar zxvf xxx -C xxxx 压缩包解压到 xxx 目录

### 配置环境变量

[root@test modules]# vi /etc/profile 

```
MAVEN_HOME=/home/modules/apache-maven-3.5.3
export MAVEN_HOME
export PATH=${PATH}:${MAVEN_HOME}/bin
```

### 刷新配置文件

```
[root@test modules]# source /etc/profile
```

### 验证

```
[root@test modules]# mvn -v

Apache Maven 3.5.3 (3383c37e1f9e9b3bc3df5050c29c8aff9f295297; 2018-02-25T03:49:05+08:00)
Maven home: /home/modules/apache-maven-3.5.3
Java version: 1.8.0_151, vendor: Oracle Corporation
Java home: /home/modules/jdk1.8.0_151/jre
Default locale: zh_CN, platform encoding: UTF-8
OS name: "linux", version: "3.10.0-693.2.2.el7.x86_64", arch: "amd64", family: "unix"

```




## Linux中安装Ant 
---

### 下载Ant安装包 

Ant apache官方下载[http://ant.apache.org/bindownload.cgi](http://ant.apache.org/bindownload.cgi)

[阿里云镜像](https://mirrors.aliyun.com/apache/ant/binaries/)

下载:apache-ant-x.x.x-bin.tar.gz 到Linux 常用文件保存目录,如/home/soft


```
[root@test soft]# tar zxvf apache-ant-x.x.x-bin.tar.gz -C /home/modules  

```
tar zxvf xxx -C xxxx 压缩包解压到 xxx 目录

### 配置环境变量

[root@test modules]# vi /etc/profile 

```
export ANT_HOME=/home/modules/apache-ant-1.9.11
export PATH=$PATH:$ANT_HOME/bin
```

### 刷新配置文件

```
[root@test modules]# source /etc/profile
```

### 验证

```
[root@test modules]# ant -version
Apache Ant(TM) version 1.9.11 compiled on March 23 2018
```

[root@a0 modules]# ant -version
Apache Ant(TM) version 1.9.11 compiled on March 23 2018


至此，Linux中Maven，Ant成功安装







