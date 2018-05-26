---
title: CentOS-7-安装Ambari-在线安装
date: 2018-03-26 18:16:57
tags: Linux
categories: Linux
comments: Linux
---

在线安装Ambari-2.6.00，安装前的准备可以看上一篇文章。本文安装的是Hortonworks版的

[CentOS-7-安装Ambari-环境准备](http://hadronw.github.io/2018/03-25/CentOS-7-%E5%AE%89%E8%A3%85Ambari-%E7%8E%AF%E5%A2%83%E5%87%86%E5%A4%87/)
<!---more--->

[Hortonworks官方安装文档](https://docs.hortonworks.com/HDPDocuments/Ambari/Ambari-2.6.0.0/index.html)

## 下载ambari.repo文件
---

进入到官方文档，查找到[在线安装的仓库文件链接列表](https://docs.hortonworks.com/HDPDocuments/Ambari-2.6.0.0/bk_ambari-installation/content/ambari_repositories.html)，选择对应的系统版本

CentOS7—— http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.0.0/ambari.repo 

打开主节点a0

```
wget http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.0.0/ambari.repo

cp ambari.repo /etc/yum.repo.d/ 将ambari.repo 放入yum源根目录中用于安装

或者

wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.0.0/ambari.repo -O /etc/yum.repos.d/ambari.repo

```

## 重新加载检查yum源

```
yum repolist
```

## 安装Ambari

```
yum install ambari-server

```

## 配置Ambari

```
ambari-server setup
```

以下为流程：

### 检查SELinux是否关闭，如果关闭不用操作

```
Using python  /usr/bin/python
Setup ambari-server
Checking SELinux...
SELinux status is 'disabled'

```

### 提示是否自定义设置 输入：y

```
Customize user account for ambari-server daemon [y/n] (n)? y

```

### ambari-server 账号 输入：ambari

```
Enter user account for ambari-server daemon (root):ambari
Adjusting ambari-server permissions and ownership...

```
亦可不输入

### 检查防火墙，如果关闭则不用操作

```
Checking firewall status...
Redirecting to /bin/systemctl status  iptables.service

```

### 设置JDK 输入：3

```
Checking JDK...
Do you want to change Oracle JDK [y/n] (n)? y
[1] Oracle JDK 1.8 + Java Cryptography Extension (JCE) Policy Files 8
[2] Oracle JDK 1.7 + Java Cryptography Extension (JCE) Policy Files 7
[3] Custom JDK
==============================================================================
Enter choice (1): 3

```
此前环境准备中已经配置过jdk，此处选自定义，

### 如果上面选择3自定义JDK,则需要设置JAVA_HOME

```
WARNING: JDK must be installed on all hosts and JAVA_HOME must be valid on all hosts.
WARNING: JCE Policy files are required for configuring Kerberos security. If you plan to use Kerberos,please make sure JCE Unlimited Strength Jurisdiction Policy Files are valid on all hosts.
Path to JAVA_HOME: /xxx/xxx/jdk1.8.0_152
Validating JDK on Ambari Server...done.
Completing setup...

```
查看机器中配置的JAVA_HOME，

```
echo $JAVA_HOME
/xxx/xxx/jdk1.8.0_152

```
注：如果不选择自定义，注意选择1，安装1.8的jdk


### 数据库配置  选择：y

```
Configuring database...
Enter advanced database configuration [y/n] (n)? y

```

### 选择数据库类型 输入：3

```
Configuring database...
==============================================================================
Choose one of the following options:
[1] - PostgreSQL (Embedded)
[2] - Oracle
[3] - MySQL
[4] - PostgreSQL
[5] - Microsoft SQL Server (Tech Preview)
[6] - SQL Anywhere
==============================================================================
Enter choice (3): 3

```
此前，以及安装好了mysql数据库，故选择3


### 设置数据库的具体配置信息，根据实际情况输入，如果和括号内相同，则可以直接回车

```
Hostname (localhost): 
Port (3306): 
Database name (ambari): 
Username (ambari): 
Enter Database Password (123456): 

```

数据库名，用户名，密码可根据自己设置的填入

### 提示必须安装MySQL JDBC，回车结束ambari配置

```
WARNING: Before starting Ambari Server, you must copy the MySQL JDBC driver JAR file to /usr/share/java.
Press <enter> to continue.

```

### 将Ambari数据库脚本导入到数据库,如果使用自己定义的数据库，必须在启动Ambari服务之前导入Ambari的sql脚本

```
#用Ambari用户（上面设置的用户）登录mysql
mysql -u ambari -p
use ambari；
source /var/lib/ambari-server/resources/Ambari-DDL-MySQL-CREATE.sql

```

至此Ambari配置完毕，下面则是启动Ambari服务

## 启动ambari

启动Amabri
执行启动命令，启动Ambari服务

```
ambari-server start

```

启动成功后，在浏览器中输入主机点ip：xxx.xxx.xxx.xxx:8080进入Ambari管理页面，默认管理用户名：admin，密码：admin

{% asset_img 001.jpg 上图则表明Ambari安装成功 %}


## Ambari配置集群

登陆进去后界面如下，点击安装

{% asset_img 002.jpg 初始化页面 %}

{% asset_img 00.jpg 设置集群名 %}

{% asset_img 01.jpg 选择安装HDP版本 %}

{% asset_img 02.jpg 选择安装仓库本地/线上公共 %}

{% asset_img 03.jpg 配置hosts节点信息 %}

{% asset_img 04.jpg 确认 %}

{% asset_img 05.jpg 检测节点有问题则需要解决才能正常安装 %}

{% asset_img 003.jpg 选择要安装的服务 %}

{% asset_img 004.jpg 服务Master配置 %}

{% asset_img 005.jpg 服务的Slaves 和 Clients节配置  %}

{% asset_img 006.jpg 服务的客制化配置  %}

{% asset_img 007.jpg 显示配置信息  %}

{% asset_img 07.jpg 开始安装集群 %}

{% asset_img 08.jpg 安装完成 %}

{% asset_img 09.jpg 集群管理页面 %}


注：线上安装不需要修改本地源，离线安装则需要新建xxx/xxx目录，需要修改本地源








