---
title: Mac中iTerm2使用ssh连接远程服务器
date: 2017-10-25 18:50:14
tags: iTerm2
categories: Mac
comments: true
---

>有许多专门用于连接远程服务器的软件，其中使用的却是ssh，那在iTerm2中是否可以直接使用呢？如何使用呢？

## ssh
---

### ssh是什么？

这篇文章清晰的介绍了ssh，以及常用的命令：SSH原理与运用（一）：远程登录——阮一峰 http://www.ruanyifeng.com/blog/2011/12/ssh_remote_login.html

<!---more--->
### ssh常用命令

ssh常用的命令：
    
    $ ssh user@host
    详细如下
    $ ssh -p 22 user@host
    
-p后面带的是端口号，一般默认的是22，后面是用户名@主机ip；


### 尝试ssh连接

打开Terminal或者iTerm2，输入：

    $ ssh user@host

会出现以下内容：

```
 $ ssh user@host

The authenticity of host 'host (xxx.xxx.xxx.xxx)' can't be established.

RSA key fingerprint is 98:2e:d7:e0:de:9f:ac:67:28:c2:42:2d:37:16:58:4d.
　　
Are you sure you want to continue connecting (yes/no)? yes

Warning: Permanently added 'host,xxx.xxx.xxx.xxx' (RSA) to the list of known hosts.

Password: (enter password)

Last login: Wed Oct 25 18:48:48 2017 from xxx.xxx.xxx.xxx

Welcome to Elastic Compute Service

[root@4e00u53f7 ~]#

```

以上就是完整的示范了，那问题来了，每次连接都需要填写密码岂不是很麻烦？如果需要连接管理多个远程呢？


## sshpass让iterm2保存登陆信息，无需再输入密码连接远程
---

### iTerm2安装sshpass

使用brew安装sshpass 工具：

    brew install sshpass

它回自动安装好sshpass工具，安装好后就可以使用了。

如果没有安装好brew[可点击此处](https://hadronw.github.io/2017/06-14/Mac%E7%9A%84%E4%B8%80%E4%BA%9B%E9%85%8D%E7%BD%AE%E4%B9%8Biterm2%E7%AF%87/)


### 设置好配置信息实现免密码连接

### 保存好密码信息

在自己本地文件中新建一个文件，保存所需登录的秘密。

如在/Users/test中创建一个sshpass目录／Users/test/sshpass ，再创建一个pass文件，保存登陆密码。如果你的远程端密码是123455，就写123456其他的都不需要写。


### iTerm2配置profiles信息

打开Preferences——>Profiles 选项

{% asset_img 00.jpg This is an image %}

如图所示，可以点击左下方的+新建一个profile。具体配置在右栏Genernal：
    
    Basic->Name：可以配置好别名
    
    Command:选择command并在后方输入
    
    /usr/local/bin/sshpass -f  /Users/hadronw/sshpass/pass ssh -p22 root@xxx.xxx.xxx.xxx

/usr/local/bin/sshpass -f 是sshpass工具执行文件路径，安装sshpass好后，默认会在这个路径

/Users/test/sshpass/pass 这个是前面配置好保存密码的路径，以便于工具读取密码

后面的就是一个连接ssh的命令了，这样就配置好了。

然后就是检验是否配置成功，打开iTerm2，鼠标右键New Wi now 说／New Tab都可以选择已经配置好的profile文件。

注意：第一次可能不会成功，第一次需要用ssh命令连接一次，它需要保存一下验证信息到本机，具体如上文的尝试连接ssh。登陆成功后就可以直接免除密码登陆了。

原理其实就是保存了一下密码，让命令自己去读区密码登陆。

关于iTerm2还有其他的功能等待着你的发掘，欢迎交流学习。

---

参考文章：
SSH原理与运用（一）：远程登录 http://www.ruanyifeng.com/blog/2011/12/ssh_remote_login.html

ssh用法及命令 http://blog.csdn.net/pipisorry/article/details/52269785


