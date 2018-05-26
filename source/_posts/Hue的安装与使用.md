---
title: Hue的安装与使用
date: 2018-05-24 21:07:43
tags: hue
categories: Hadoop
comments: true
---

> hue 3.9

## 简介

Hue是Cloudera开源的一个Hadoop UI，由Cloudera Desktop演化而来。面向用户提供方便的UI用于平时的Hadoop操作中。Apache Ambari面向的是管理员，用于安装、维护集群，而不是使用集群。两者针对的是不同需求

<!--more-->

## 安装

---

hue官方文档：[http://cloudera.github.io/hue/latest/admin-manual/manual.html#installation](http://cloudera.github.io/hue/latest/admin-manual/manual.html#installation)

hue github 仓库地址：[https://github.com/cloudera/hue](https://github.com/cloudera/hue)

### Maven & Ant的安装配置


[Linux中安装Maven & Ant](https://hadronw.com/2018/04-22/Linux%E4%B8%AD%E5%AE%89%E8%A3%85Maven-Ant/)


### 依赖安装

```
yum -y install ant asciidoc cyrus-sasl-devel cyrus-sasl-gssapi cyrus-sasl-plain gcc gcc-c++ krb5-devel libffi-devel libxml2-devel libxslt-devel make  mysql mysql-devel openldap-devel python-devel sqlite-devel gmp-devel
```
注：以上命令可依次安装，Linux可正常连接网络


### 下载


hue cdh5版下载[http://archive.cloudera.com/cdh5/cdh/5/](http://archive.cloudera.com/cdh5/cdh/5/)
注：选择下载与自己使用Hadoop 生态包相匹配的包。CDH版的不同版本生态包做过适配处理，减少不同安装包版本冲突。

将hue-3.9.0-cdh5.10.1.tar.gz 下载到 /opt/soft 目录下 


### 安装

#### 解压安装包

```
[root@test soft]# tar zxvf hue-3.9.0-cdh5.10.1.tar.gz -C ../modules 

```
将解压到/opt/modules 目录下

#### 编译源码包

cd /opt/modules/hue-3.9.0-cdh5.10.1

```
[root@test hue-3.9.0-cdh5.10.1]# make apps
```

编译会需要一段时间,编译速度取决于网速。此阶段没有出错就表明安装成功

/opt/modules/zookeeper-3.4.5/bin/zkServer.sh start

## 配置

### hue


```
secret_key=jFE93j;2[290-eiw.KEiwN2s3['d;/.q[eIW^y#e=+Iei*@Mn<qW5o
http_host=0.0.0.0
http_port=8888
server_user=root
server_group=root
default_user=root
default_hdfs_superuser=root
```

### hdfs

```
fs_defaultfs=hdfs://master:9000
webhdfs_url=http://master:50070/webhdfs/v1
hadoop_conf_dir=/home/hadoop-2.6.0/etc/hadoop
```

### yarn


```
resourcemanager_host=master
resourcemanager_port=8032
resourcemanager_api_url=http://master:8088
proxy_api_url=http://master:8088
history_server_api_url=http://master:19888

```

### 修改时区

hue 的默认时区是American/LosAngeles，需要把timezone修改成Asia/Shanghai


```
time_zone = Asia/Shanghai
```


### hive


```
hive_server_host=master
hive_server_port=10000
hive_conf_dir=/opt/hive-2.0.0/conf
```



### hbase

```code
hbase_clusters=(Cluster|master:9090)
hbase_conf_dir=/opt/hbase-1.2.2/conf
```

## 使用

### 启动


```
build/env/bin/supervisor            //启动命令-session关闭后，进程会结束
nohup build/env/bin/supervisor &    //后台启动 session关闭后，进程不会结束
```


### hue管理页面

访问地址：[http://master:8888](http://master:8888)  主机名+端口名


### hive使用


```
nohup bin/hiveserver2 & //启动
```

### hbase的使用


```
bin/start-hbase.sh
bin/hbase-daemon.sh start thrift

bin/hbase-daemon.sh stop thrift

hbase thrift -p 9090

```
之后就可以打开hueUI页面进入到hbase中


## 常见问题

### 缺少hue用户

```error
KeyError: "Couldn't get user id for user hue" #27
```

需要创建一个hue用户


```bash
 adduser hue
```

### SecurityException


```error
WebHdfsException: SecurityException: Failed to obtain user group information: org.apache.hadoop.security.authorize.AuthorizationException: User: root is not allowed to impersonate root (error 403)
```


hue没用权限访问hdfs文件管理，hue中的root用户没有hdfs访问权限

启动hue设置的用户是与hdfs中的用户是区开的，想要有权限可以访问hdfs中需要在Hadoop中的配置文件中添加用户配置。

在Hadoop中的core-site.xml 中添加hue中的用户

```xml
    <property>
        <name>hadoop.proxyuser.root.hosts</name>
        <value>*</value>
    </property>
    <property>
        <name>hadoop.proxyuser.root.groups</name>
        <value>*</value>
    </property>

```

这个用户配置可以添加多个[可以同时配置hue、root、hadoop]，如果hue启动之后设置的默认用户是`hue`，则把以上代码中的配置`root` 改成`hue`

注意一下安装使用的用户，有些问题是用户权限问题导致的




参考链接：

https://www.zybuluo.com/BrandonLin/note/456756

https://blog.csdn.net/m0_37739193/article/details/77963240

https://blog.csdn.net/feinifi/article/details/79418246

http://www.cnblogs.com/zlslch/p/6819622.html




