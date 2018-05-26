---
title: CentOS-7-安装Ambari-环境准备
date: 2018-03-25 23:51:15
tags: Linux
categories: Linux
comments: true
---


## Ambari 是什么
---

Ambari跟Hadoop等开源软件一样，也是Apache Software Foundation 中的一个项目，<!---more---> 并且是顶级项目。就Ambari的作用来说，就是创建、管理、监视 Hadoop 的集群，但是这里的Hadoop是广义，指的是Hadoop整个生态圈（例如 Hive，Hbase，Sqoop，Zookeeper 等），而并不仅是特指 Hadoop。用一句话来说，Ambari 就是为了让 Hadoop以及相关的大数据软件更容易使用的一个工具。

说到这里，大家就应该明白什么人最需要 Ambari了。那些苦苦花费好几天去安装、调试 Hadoop 的初学者是最能体会到 Ambari 的方便之处的。而且，Ambari 现在所支持的平台组件也越来越多，例如流行的 Spark，Storm 等计算框架，以及资源调度平台 YARN 等，我们都能轻松地通过 Ambari 来进行部署。

Ambari 自身也是一个分布式架构的软件，主要由两部分组成：Ambari Server 和 Ambari Agent。简单来说，用户通过 Ambari Server 通知 Ambari Agent 安装对应的软件；Agent 会定时地发送各个机器每个软件模块的状态给 Ambari Server，最终这些状态信息会呈现在 Ambari 的 GUI，方便用户了解到集群的各种状态，并进行相应的维护。

目前网上能找到两个发行版：一个是Apache的Ambari，另一个是Hortonworks的，两者区别不大

* Apache的[Ambari官网](https://ambari.apache.org/)
* Hortonworks的[Ambari中文官网](https://zh.hortonworks.com/apache/ambari/)，[Ambari官网](https://hortonworks.com/apache/ambari/)


## 安装前的准备

大于3台的服务器(虚拟机中的亦可)——最好Linux系统。
如：a0，a1，a2，a0为主节点，a1、a2为从节点。主节点的机器配置最好高一些。

本文假设准备好了3台服务器，都为新安装的CentOS 7系统。

前期准备：（每个节点机器都需要配置）

* 每个节点上配置jdk
* 设置主机名
* 相互添加IP地址映射，优化DNS
* 节点间SSH的无密码登录
* 设置网络静态IP（虚拟机中设置是为了防止每次开机ip出现动态变化）
* 同步时间NTP
* 关闭防火墙、selinux
* 关闭transparent_hugepage
* Python版本要大于或等于2.6（CentOS 7内置版本2.7）
* 设置最大打开文件数ulimit
* 配置umask
* 主节点安装mysql/mariadb


### 每个节点上配置jdk

下载好jdk包，解压到服务器中/xxx/xxx 目录，解压后配置好环境变量

```
vi /etc/profile

export JAVA_HOME=/xxx/xxx/xxx
export PATH=$JAVA_HOME/bin:$PATH

保存退出，

source /etc/profile

```


### 设置主机名，关闭防火墙,关闭SELinux


[CentOS 7设置hostname](https://hadronw.github.io/2018/03-13/CentOS-7%E8%AE%BE%E7%BD%AEhostname%EF%BC%8C%E5%85%B3%E9%97%AD%E9%98%B2%E7%81%AB%E5%A2%99/)



### 相互添加IP地址映射，优化DNS，节点间SSH的无密码登录



[Linux多个虚拟机SSH免密码通信的配置](https://hadronw.github.io/2017/12-20/%E5%A4%9A%E4%B8%AALinux%E8%99%9A%E6%8B%9F%E6%9C%BASSH%E5%85%8D%E5%AF%86%E7%A0%81%E9%80%9A%E4%BF%A1%E7%9A%84%E9%85%8D%E7%BD%AE/)


### 设置网络静态IP

[虚拟机网络静态IP](https://hadronw.github.io/2017/12-19/Mac%E4%B8%8B%E9%85%8D%E7%BD%AEVM%E4%B8%ADLinux-CentOS6-5%E8%99%9A%E6%8B%9F%E6%9C%BA%E7%BD%91%E7%BB%9C%E9%9D%99%E6%80%81IP/)



### 同步时间NTP

```
yum install ntp
systemctl is-enabled ntpd
systemctl enable ntpd
systemctl start ntpd

ntpdate time1.aliyun.com
crontab e
 30 02 * * *  ntpdate time1.aliyun.com

```

### 关闭transparent_hugepage

```
查看transparent_hugepage状态
cat /sys/kernel/mm/transparent_hugepage/defrag
[always] madvise never  # 表示开启
cat /sys/kernel/mm/transparent_hugepage/enabled
[always] madvise never  # 表示开启

vi /etc/rc.d/rc.local  #在文末添加

if test -f /sys/kernel/mm/transparent_hugepage/enabled; then
 echo never > /sys/kernel/mm/transparent_hugepage/enabled
 fi
 if test -f /sys/kernel/mm/transparent_hugepage/defrag; then
 echo never > /sys/kernel/mm/transparent_hugepage/defrag
fi

保存后退出chmod +x /etc/rc.d/rc.local  
赋予chmod +x /etc/rc.d/rc.local文件执行权限

重启系统再查看状态

cat /sys/kernel/mm/transparent_hugepage/defrag
always madvise [never]  # 表示关闭
cat /sys/kernel/mm/transparent_hugepage/enabled
always madvise [never]  # 表示关闭
```


### 设置最大打开文件数ulimit

```
ulimit -Sn
ulimit -Hn # 如果最大数小于10000 则重设
ulimit -n 10000
```

### 配置umask

UMASK (用户掩码或用户文件创建掩码) 设置在 Linux 计算机上创建新文件或文件夹时授予的默认权限或基本权限。大多数 Linux 发行将022设置为默认的 umask 值。umask 值022授予对新文件或文件夹的读取、写入、执行权限755。umask 值027授予对新文件或文件夹的读取、写入、执行权限750
umaks # 如果不是0022，则执行以下语句

```
echo umask 0022 >> /etc/profile

```

### 主节点安装mysql/mariadb

```
yum install mariadb-server

yum install mysql-connector-java # 安装jdbc驱动

systemctl start mariadb
systemctl enable mariadb  #启动

mysql_secure_installation  # 数据库初始化设置

#首先是设置密码，会提示先输入密码
Enter current password for root (enter for none):<–初次运行直接回车
#设置密码
Set root password? [Y/n] <– 是否设置root用户密码，输入y并回车或直接回车
New password: <– 设置root用户的密码
Re-enter new password: <– 再输入一次你设置的密码
#其他配置
Remove anonymous users? [Y/n] <– 是否删除匿名用户，回车
Disallow root login remotely? [Y/n] <–是否禁止root远程登录,回车,
Remove test database and access to it? [Y/n] <– 是否删除test数据库，回车
Reload privilege tables now? [Y/n] <– 是否重新加载权限表，回车
#初始化MariaDB完成，接下来测试登录，输入密码能正常登陆就完成了


```

创建ambari数据库，用户

```
mysql -uroot -p  #连接数据库

mysql> create database ambari character set utf8 ;  
mysql> CREATE USER 'ambari'@'%'IDENTIFIED BY '123456';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'ambari'@'%';
mysql> FLUSH PRIVILEGES;


```

如果要安装Hive，再创建Hive数据库和用户 再执行下面的语句：

```
mysql> create database hive character set utf8 ;  
mysql> CREATE USER 'hive'@'%'IDENTIFIED BY '123456';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'hive'@'%';
mysql> FLUSH PRIVILEGES;

```

至此，Ambari的准备工作就完成了


注：如果要在云上面搭建，一定要选择相同的地区，地域打击。主从节点在同一个地区！否则会出现IP连接上的错误










