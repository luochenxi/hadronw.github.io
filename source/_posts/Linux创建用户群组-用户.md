---
title: 'Linux创建用户群组,用户'
date: 2017-12-19 14:02:07
tags: Linux
categories: Linux
comments: true
---



## 创建用户群组

### 添加用户群组

```
[root ~]# groupadd 选项 用户组    
常用的选项有：
    -g GID 指定新用户组的组标识号（GID）
    -o 一般与-g选项同时使用，表示新用户组的GID可以与系统已有用户组的GID相同

如：
[root ~]# groupadd group1 --创建群组group1,选项可以不指定
```
<!---more--->
### 查看用户群组

```
[root ~]# cat /etc/group

或：
[root ~]# cat /etc/passwd |awk -F [:] '{print $4}' |sort|uniq | getent group |awk -F [:] '{print $1}'
```


### 修改用户群组

```
[root ~]# groupmod 选项 用户组

常用的选项有：
-g GID 为用户组指定新的组标识号。
-o 与-g选项同时使用，用户组的新GID可以与系统已有用户组的GID相同。
-n新用户组 将用户组的名字改为新名字

如：
[root ~]# groupmod -n group1 group2 --将group1改为group2
```

### 删除用户群组

```
groupdel 用户组
如：
[root ~]# groupdel group1
```

## 用户

### 创建用户

```
useradd 选项 用户名

选项:
-c comment 指定一段注释性描述
-d 目录 指定用户主目录，如果此目录不存在，则同时使用-m选项，可以创建主目录
-g 用户组 指定用户所属的用户组
-G 用户组，用户组 指定用户所属的附加组
-s Shell文件 指定用户的登录Shell
-u 用户号 指定用户的用户号，如果同时有-o选项，则可以重复使用其他用户的标识号

用户名:
指定新账号的登录名

如1：

[root ~]# useradd user1     --创建用户

[root ~]# passwd user1      --创建密码

如2：
[root ~]# useradd -g group1 user1  --新建user1用户并增加到group1工作组

```



### 查看所有用户

```
[root ~]# cat /etc/passwd |awk -F \: '{print $1}'

```


### 修改用户

```
usermod 选项 用户名

选项的意义与创建用户的选项一致

[root ~]# usermod -g group2 user1 --将user1的群组改为group2

```

### 删除用户

```
userdel 选项 用户名

[root ~]# userdel -r user1 ---常用的选项是 -r，它的作用是把用户的主目录一起删除

```

### passwd

```
passwd 选项 用户名

可使用的选项：

-l 锁定口令，即禁用账号。
-u 口令解锁。
-d 使账号无口令。
-f 强迫用户下次登录时修改口令

[user1 ~] passwd    ---修改当前用户user1的密码

 [root ~]# passwd xxx ---修改任意用户的密码

```


