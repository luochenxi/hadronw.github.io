---
title: Mac下配置VM中Linux-CentOS6.5虚拟机网络静态IP
date: 2017-12-19 19:08:56
tags: Linux
categories: Linux
comments: true
---

> 在CentOS中，每次开机其IP都是动态变化的；为了方便的使用shell，故对CentOS虚拟机配置静态IP。本文讲述的是在Mac端的VM虚拟机，Windows下虚拟机配置是一样的，差别在于虚拟机的网络查看、配置不一样

## 首先查看VM虚拟机可以配置IP的数字范围
<!---more--->
```
cat /Library/Preferences/VMware\ Fusion/vmnet8/dhcpd.conf
```

滑动到最后，如下图所示

{% asset_img 00.jpg 示例 %}

通常静态IP配置的范围为xxx.xxx.xxx.128--xxx.xxx.xxx.254；每次CentOS开机时动态IP变动的范围也是在这区间。

## 设置

首先打开配置文件，必须是root账号才有权限编辑

```
[root@master ~]# vi /etc/sysconfig/network-scripts/ifcfg-eth0
```

显示如下：

```
DEVICE=eth0
HWADDR=00:0C:29:6F:3E:46
TYPE=Ethernet
UUID=8cda677d-9ef1-48fd-86c8-3110c26ba046
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=dhcp
```

### 首先

```
BOOTPROTO=dhcp  ----> BOOTPROTO=static 
```

### 再将HWADDR的值与虚拟机中网络配置的Mac统一，以虚拟机中网络配置的Mac值为准

```
HWADDR=00:0C:29:6F:3E:46
```

{% asset_img 01.jpg 步骤 %}

{% asset_img 02.jpg MAC值 %}


### 添加其他配置

```
DEFROUTE=yes
PEERDNS=yes
PEERROUTES=yes
IPV4_FAILURE_FATAL=yes
IPV6INIT=no
NAME="System eth0"
IPADDR=172.16.164.131       ---配置的IP地址
BCAST=172.16.164.255        ---广播地址，xx.xx.xx.255前面的数字参照IP前面，
GATEWAY=172.16.164.2        ---网关地址为上文查看中的数值
NETMASK=255.255.255.0       ---子网掩码

DNS1=172.16.164.2           ---同上
DNS2=8.8.8.8
```


至此静态网络IP设置完毕


## 重启网络服务并检验

### 重启网络服务

```
/etc/init.d/network restart
或
service network restart

```

查看输出信息，全部为OK则重启成功

注：DEVICE=eth0的值为唯一，有冲突时可设为eth1，eth2……依次上推


### 检验网络

```
一、

curl www.baidu.com

二、

电脑中ping虚拟机的IP，信息联通则表示成功；或者互相ping ip


```

### 设置hostname便于在shell中区分多台Linux机器

```
[root@master ~]# hostname   ---查看
master
[root@master ~]# hostname xxx ---设置
[root@master ~]# hostname
xxx

以上只是临时设置，如若需要永久生效需：
[root@master ~]# vi /etc/sysconfig/network

修改其中的HOSTNAME=xxx  如将master改为test。保存退出
再重新加载生效
[root@master ~]# hostname test
```


### IP地址与主机名的映射

```
[root@master ~]# vi /etc/hosts

xxx.xxx.xxx.xxx  master ---master与上文中查看的hostname相统一
```

如图：

{% asset_img 03.jpg  %}


编辑，保存后，再重启检查ifconfig，如果IP地址跟设置的一样，则表明设置成功。


注：VM中一个Linux虚拟机创建成功后，还需要多个同样类型的虚拟机。

先将虚拟机关机，然后再选择虚拟机创建完整克隆。创建成功后多个同样配置的虚拟机便创建成功。比起重新安装要迅速许多。

需要注意的是，克隆的虚拟机中网络配置的数值可能会一样【比如：DEFROUTE、HWADDR】。

DEFROUTE的值可以自行设置，HWADDR需要的MAC值可再虚拟机关闭的时候，选择虚拟机设置——网络适配器——高级选项 MAC旁有一个生成，可重新生成新的MAC值；生成之后再将数值填入到HWADDR即可。




