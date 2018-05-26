---
title: CentOS 7设置hostname，关闭防火墙
date: 2018-03-13 19:27:45
tags: Linux
categories: Linux
comments: Linux
---

Cent OS 6与CentOS7许多命令有些区别


## 设置hostname
---

### 查看主机名相关的设置:
<!---more--->

```
[root@test]# hostnamectl
   Static hostname: a0
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 01def7c99eb943af9f28735310ffc0f9
           Boot ID: b9e7b57216764c13a9a3bac5a3fc7284
    Virtualization: vmware   
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-693.el7.x86_64
      Architecture: x86-64
```


在CentOS中有对主机名有三种定义：static[静态]、transient[瞬间]、pretty[灵活]

           
static：主机名也称为内核主机名，是系统在启动时从/etc/hostname自动初始化的主机名

transient：主机名是在系统运行时临时分配的主机名，例如，通过DHCP或mDNS服务器分配
           
注：静态主机名和瞬态主机名都遵从互联网域名同样的字符限制规则

pretty：主机名则允许使用自由形式（包括特殊/空白字符）的主机名，以展示给终端用户


### 查看hostname

```
[root@test]# hostnamectl --static   # 查看静态主机名
test

[root@test]# hostnamectl --pretty   # 查看灵活主机名
test

[root@test]# hostnamectl --transient # 查看瞬间主机名
test

```

### 同时修改所有主机名

```
[root@test]# hostnamectl set-hostname test1

查看主机名
[root@test]# hostnamectl --pretty   # 查看灵活主机名
test1

[root@test]# hostnamectl --transient # 查看瞬间主机名
test1

```

### 修改特定主机名

```

[root@test]# hostnamectl --static set-hostname test2 #将static改为pretty、transient即修改特定的主机名

```

**注：上文的修改并不会立刻出现变化，需要注销用户重新登陆或者重启机器**


## 防火墙相关
---

```
[root@test]# systemctl stop firewalld.service #停止firewall

[root@test]# systemctl disable firewalld.service #禁止firewall开机启动

[root@test]#  systemctl restart iptables.service #重启防火墙使配置生效

[root@test]#  systemctl enable iptables.service #设置防火墙开机启动

```

## 关闭SELinux
---

SELinux(Secure Enhanced Linux)安全增强的Linux是由美国国家安全局NSA针对计算机基础结构安全开发的一个全新的Linux安全策略机制。就是管理Linux的安全机制。

大多数情况SELinux都是关闭的。多数情况是没有专门的运维，或者运维懒；另一个方面就是管理设置麻烦。

对于非商业性质使用来说，选择关闭是最为便捷的选择，否则许多软件使用会出现安全机制问题。

### 查看SELinux状态

```
[root@test]# sestatus
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Max kernel policy version:      28

```

### 修改/etc/sysconfig/selinux并关闭

```

[root@test]# vi /etc/sysconfig/selinux 

# 编辑/etc/sysconfig/selinux 文件,将文件中的SELINUX=enforcing改为
SELINUX=disabled 修改后保存退出

[root@test]# setenforce 0


```

**注：修改文档后需要重启机器才能生效** 

重启之后，可再次查看selinux状态，

```
[root@test]# sestatus
SELinux status:                 disabled
```

出现以上则selinux关闭成功。







