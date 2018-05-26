---
title: zookeeper的安装与基本操作
date: 2017-12-03 23:34:42
tags: zookeeper
categories: zookeeper
comments: true
---

> 单机配置与集群配置检测状态的区别.集群配置的检测一定要所有的节点都启动了zookeeper程序，再运行zkServer.sh status才是会正确，否则会出现连接异常的提醒，无法检测状态

## 单机与集群配置zookeeper
---
<!---more--->
注：单机配置zookeeper，zoo.cfg中不需要配置server.id=host:port1:port2 

首先下载好[zookeeper软件包(官网)](http://zookeeper.apache.org/)，并解压

打开zookeeper.x.x文件夹

1、在根目录下创建logs，data文件夹

2、进入conf目录下，可以看到有一个zoo_simple.cfg文件，拷贝复制为一个zoo.cfg

3、配置zoo.cfg文件

```
ticketTime=2000
clientPort=2181
initLimit=10
syncLimit=5
dataDir=/xxx/xxx/app/zookeeper-3.4.5/data
dataLogDir=/xxx/xxx/app/zookeeper-3.4.5/logs

server.1=master:2888:3888
server.2=master:2888:3888
server.3=master:2888:3888
```

上文为添加，修改的配置.说明如下：

```
initLimit 
ZooKeeper集群模式下包含多个zk进程，其中一个进程为leader，余下的进程follower。 
当follower最初与leader建立连接时，它们之间会传输相当多的数据，尤其是follower的数据落后leader
很多。initLimit配置follower与leader之间建立连接后进行同步的最长时间。

syncLimit 
配置follower和leader之间发送消息，请求和应答的最大时间长度。

tickTime 
tickTime则是上述两个超时配置的基本单位，例如对于initLimit，其配置值为5，说明其超时时间为
2000ms * 5 = 10秒。

server.id=host:port1:port2 
其中id为一个数字，表示zk进程的id，这个id也是dataDir目录下myid文件的内容。 
host是该zk进程所在的IP地址，port1表示follower和leader交换消息所使用的端口，port2表示选举
leader所使用的端口。

dataDir 
其配置的含义跟单机模式下的含义类似，不同的是集群模式下还有一个myid文件。myid文件的内容只有一行，
且内容只能为1 - 255之间的数字，这个数字亦即上面介绍server.id中的id，表示zk进程的id。

dataLogDir
配置log日志存放的目录
```

进入dataDir配置目录

创建一个myid的文件，文件中写入数字server.id=host:port1:port2 中的id，注意，该id与zoo.cfg中配置中的相对应。如：

```
zoo.cfg中配置

server.1=master:2888:3888
server.2=master:2888:3888
server.3=master:2888:3888

master 主机中的myid应写入的1
slave1 主机中的myid应写入的2
……

```
注：不需要其他的字符，ID的范围1～255

zookeeper的配置就已经完成，也可以添加环境变量。


## zookeeper的操作

### 启动

进入到bin目录，所有的操作命令都在该目录下

./zkServer.sh start

注：一定要空格，配置了环境变量的可以直接 zkServer.sh start

### 查看zookeeper运行状态

./zkServer.sh status

注：如果是配置的集群，该集群所有的节点主机都需要启动之后再检查；单主机无需如此。

运行后会出现Mode，有两个角色一个是leader，一个是follower代表不同的身份。通常是一个leader对应多个follower，角色是随机分配的，当一个leader的主机停止之后，会有另个follower的主机变为leader身份

### 停止

./zkServer.sh stop

### 测试集群的联通性

./zkCli.sh -server master:2181,slave1:2181,slave2:2181

连接成功后，terminal会变成：

```
WatchedEvent state:SyncConnected type:None path:null
[zk:master:2181,slave1:2181,slave2:2181(CONNECTED) 0] 
```

至此，zookeeper配置运行成功




