---
title: Linux中修改文件只读权限
date: 2017-10-15 10:21:31
tags: Linux
categories: Linux
comments: true
---

Linux 新用户登录后，想要修改一些关键文件往往是没有权限的。怎么办？提升用户权限，以root权限去修改。

<!---more--->
## 切换到root用户权限


```
[test@localhost ~]$ su root
Password:
[root@localhost test]#
```

Terminal 命令行中有`#`就表示已经切换到了root账号，密码是之前test用户设置的那个密码

## 修改/etc/sudoers文件权限

一般用户登录后，打开/etc/sudoers文件是只读权限，如何进入修改呢？先切换到root用户权限，再修改权限如下：


```
[root@localhost test]# ls -l /etc/sudoers
-r--r-----. 1 root root 4002 Mar  1  2012 /etc/sudoers
[root@localhost test]# chmod 777 /etc/sudoers
[root@localhost test]# ls -l /etc/sudoers
-----rwxrwx. 1 root root 4002 Mar  1  2012 /etc/sudoers
[root@localhost test]#
```

接下来就可以用vim愉快的修改/etc/sudoers文件了

## 提升用户权限

```
[root@localhost test]# vim /etc/sudoers
找到
## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL

并在下方参照格式增加自己用户配置

## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL
test    ALL=(ALL)       ALL
```


再保存退出，权限权限就修改好了

## 恢复/etc/sudoers的访问权限为440
```
[root@localhost test]# ls -l /etc/sudoers
-----rwxrwx. 1 root root 4002 Mar  1  2012 /etc/sudoers
[root@localhost test]# chmod 440 /etc/sudoers
[root@localhost test]# ls -l /etc/sudoers
-r--r-----. 1 root root 4002 Mar  1  2012 /etc/sudoers
[root@localhost test]#
```

可以切换成自己普通用户，再测试一下用户权限，

```
[root@localhost test]# su test[test@localhost ~]$ vim /etc/sudoers

注：可任意编辑，别删除掉了关键配置
```

以上操作需要熟悉一些vim的基本操作，编辑模式，如何保存、退出


---
【链接】linux下如何添加一个用户并且让用户获得root
http://www.cnblogs.com/johnw/p/5499442.html





