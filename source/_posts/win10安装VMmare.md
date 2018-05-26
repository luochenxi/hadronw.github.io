---
title: win10安装VMmare
date: 2017-10-13 20:47:39
tags: win
categories: win
comments: true
---

> win10 中安装VMware虚拟机时遇到的问题


## Microsoft Runtime DLL问题

在安装VMware时出现Microsoft Runtime DLL提示信息，导致无法安装。在寻找解决方案的时候，网上有几种情况：
<!--more-->
    1、权限原因导致，未能用管理员权限运行／权限不足————提升用户权限，以管理权限运行
    2、电脑缺少依赖工具包————安装所需工具包
    3、系统注册表中出了问题————清理注册表
    4、服务中Windows install 服务相关问题————开启相关服务
    5、其它解决方式——另辟蹊径————实际解决问题方式
    
### 权限问题

win10系统中，系统默认的Admin用户是禁止的，需要解禁。步骤如下：

先进入计算机管理页面

{% asset_img img00.jpg 图片00 %}

{% asset_img img01.jpg 图片01 %}

{% asset_img img02.jpg 图片02 %}

{% asset_img img03.jpg 图片03 %}

注：如果计算机管理页面没有本地用户的选项，则说明系统需要升级。从普通家庭版升级到专业版或者企业版，网上搜索“win10从家庭版升级到专业版”即可

解决权限问题后，发现并不能解决问题；继续尝试问题2、3、4处理方式：

[官方论坛信息](https://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2078258)注册表相关问题


[缺少依赖包Visual C++ Redistributable-贴吧的说明](https://tieba.baidu.com/p/4236344841) 下载地址[Visual C++ Redistributable](https://www.microsoft.com/zh-cn/download/details.aspx?id=48145)

### 最终解决方案

在安装VMware出现Microsoft Runtime DLL的问题时不用点击关闭程序，win+R 输入 %temp% 回车。

然后会出现一个窗口，里面有许多列表，找到一个~setup结尾的文件夹，打开进去，里面会有如下几个文件：

    vcredist_x64
    vcredist_x86
    VMwareWorkstation

将这三个文件拷贝到桌面或者其它地方，再点VMwareWorkstation即可正常安装。

安装完成后可能会出现有注册码确无法注册的情况，它提示权限不足，或者不是管理员等提示信息。


## VMmare激活权限问题

安装VMmare成功后，可能会出现激活的问题，解决方案：

VMmare右键——程序位置如下图：

{% asset_img img04.jpg 图片04 %}

再进入到x64文件夹下面，复制这个路径：

    C:\Program Files (x86)\VMware\VMware Workstation\x64
    
再以管理员权限运行cmd，可在这个目录下找到：

    C:\Windows\System32
    
找到cmd.exe右键以管理员身份运行：

    cd C:\Program Files (x86)\VMware\VMware Workstation\x64
    
再运行：

    vmware-vmx.exe --new-sn xxxx-xxxx-xxxx-xxxx

后面的xxxx-xxxx 是指激活码，可购买或自行去寻找

以上是我安装VMmare遇到的问题，以及解决方案，欢迎交流学习




