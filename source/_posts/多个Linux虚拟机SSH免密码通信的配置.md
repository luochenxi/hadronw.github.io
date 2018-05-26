---
title: Linux多个虚拟机SSH免密码通信的配置
date: 2017-12-20 13:25:35
tags: Linux
categories: Linux
comments: true
---


先假设有3个Linux虚拟机，分别命名为：master、slave1、slave2(方便区分)。并且都已经配置好了静态IP，设置好了hostname[没有配置好的点击此处](http://hadronw.com/2017/12-19/Mac%E4%B8%8B%E9%85%8D%E7%BD%AEVM%E4%B8%ADLinux-CentOS6-5%E8%99%9A%E6%8B%9F%E6%9C%BA%E7%BD%91%E7%BB%9C%E9%9D%99%E6%80%81IP/)

## IP地址与主机名映射，多个虚拟机相互映射
<!---more--->
[root@master ~]# vi /etc/hosts

### IP地址与主机名映射

先设置master机器

```
[root@master ~]# vi /etc/hosts
```

如图：

{% asset_img 00.jpg %}


slave1、slave2同上

### 多个Linux虚拟机相互映射

先编辑master，将slave1、slave2中配置的映射填写到master机器中的hosts文件，后再将master机器hosts分别拷贝到slave1、slave2机器

```
[root@master ~]# vi /etc/hosts
```

配置结果如图：

{% asset_img 01.jpg master %}

配置slave1

```
[root@slave1 ~]# vi /etc/hosts
```

配置结果如图：

{% asset_img 02.jpg slave1 %}

配置slave2

```
[root@slave2 ~]# vi /etc/hosts
```

配置结果如图：

{% asset_img 03.jpg slave2 %}


## 禁用防火墙


```
/etc/init.d/iptables stop   ---关闭
chkconfig iptables off  ---关闭防火墙自动运行
/etc/init.d/iptables status     ---查看状态

setenforce 0
getenforce 查看是否关闭了
```

或者

```
service iptables stop   ---关闭
chkconfig iptables off  ---关闭防火墙自动运行
service iptables status     ---查看状态
chkconfig --list | grep iptables ---验证
```

master机器关闭如下：

{% asset_img 04.jpg %}


slave1、slave2操作同上


## 多个虚拟机SSH免密码通信的配置

### 每台机器先生成ssh密钥

master机器，先切换了常用的用户Hadoop2，root账号平时不用；所以生成的SSH免密通信也是在hadoop2账号下

```
[hadoop2@master ~]$ mkdir .ssh
[hadoop2@master ~]$ ssh-keygen -t rsa
 (/home/hadoop/.ssh/id_rsa): (Enter键)
Enter passphrase (empty for no passphrase): (Enter键)
Enter same passphrase again: (Enter键)
```

{% asset_img 05.jpg 成功生成 %}


将id_rsa.pub的密钥拷贝到authorized_keys文件中；后续要做的内容也是将其他机器id_rsa.pub拷贝到authorized_keys授权密钥中，当每个机器中都相互存好了密钥，ssh登陆时也就无需输入密码了

{% asset_img 06.jpg 拷贝成功 %}

注：有些虚拟机无法使用ssh命令，则需要安装openssh-clients插件

```
[root@master ~]# yum -y install openssh-clients
```
slave1、slave2机器同上

### 相互拷贝id_rsa.pub

相互拷贝id_rsa.pub确保每一台机器中authorized_keys都有各自密钥

先将slave1中的id_rsa拷贝到master中authorized_keys

```
[hadoop2@slave1 .ssh]$ cat id_rsa.pub | ssh hadoop2@master 'cat >> ~/.ssh/authorized_keys'
```

{% asset_img 07.jpg 拷贝成功 %}

{% asset_img 08.jpg 在master机器中检验 %}

slave2机器需要如同slave1中同样的操作。此时master机器authorized_keys便有了所有机器的id_rsa.pub

或者（此方法的优点是简化了拷贝命令）

```
在每个机器中生成id_rsa.pub后，master、slave1、slave2

在master机器中运行

ssh-copy-id slave1
ssh-copy-id slave2

slave1 
ssh-copy-id slave2
ssh-copy-id master
……

让该机器中的authorized_keys存储需要免密链接的机器id_rsa.pub；执行完毕之后可以直接验证免密登陆

```

### 将master中的authorized_keys分发到其他机器

```
[hadoop2@master .ssh]$ scp -r authorized_keys hadoop2@slave1:~/.ssh/
[hadoop2@master .ssh]$ scp -r authorized_keys hadoop2@slave2:~/.ssh/
```

{% asset_img 09.jpg 传送成功 %}

### 验证是否可以免密码通信

```
[hadoop2@master .ssh]$ ssh slave1  -- ssh 加配置的主机名
在其他机器中也可以验证 
```

{% asset_img 10.jpg 验证成功 %}

注：连接成功后，如需退出通信，则输入exit




