---
title: Mac制作系统安装U盘
date: 2017-06-15 17:09:57
tags: Mac
categories: Mac
comments: true
---

## 制作Mac OS U盘启动

Mac中有时候系统更新会觉得没有自己以前的系统好用，此时不妨试着自己重新安装系统，降级系统；如果你之前有对系统备份，那就不需要重新安装。如果没有，哪只能重新安装系统

### 首先下载你所想的历史版本系统
> 通常经过AppStore更新的，会在已购列表中找到记录；找到以后可以直接下载，再到应用程序中栏目去寻找。如果没有则需要到网上搜索。

<!---more--->
### 通过命令刻录U盘
> 请使用大于4G的U盘，或者移动硬盘的分区。

打开你的终端输入以下命令：[ —volume /Volumes/MacOS  (MacOS  是你的移动硬盘名字)]

```
sudo /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/MacOS --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app
```
![success](macu.png)

如提示如上图，则说明刻录成功

### 安装系统

从U盘启动系统

- 重启电脑，开机时按住option键不放，直到进入磁盘选择界面，选择你自己的磁盘

- 之后会进入一个界面，有“通过Time Machine恢复”，“安装OS X”等选项，此时你有两个选择


（1）. 通过菜单栏的磁盘工具抹掉系统硬盘，磁盘工具的使用和制作U盘启动时一样，将系统盘抹掉，格式化为Mac OS扩展格式。然后选择“安装OS X”，将系统安装到抹掉的硬盘里。此种方式会删除所有数据


（2）. 直接点击“安装Os X”，将U盘里的系统安装到系统盘上，这种方式是覆盖安装，只会替换系统文件，用户文件还在

> 以上几种方式分别对应不同的场景需求，最简单也最保险的当然是通过Time Machine备份系统，所以在此也提醒各位在升级系统前一定要备份，否则你将尝到无尽折腾的味道。另外，由于Time Machine无法选择部分文件备份，觉得备份太慢且只想备份部分文件或软件时，可以自己用移动硬盘拷贝，由于Mac下的软件都类似于Windows下的绿色软件，也就是说你将/Applications目录下的软件考走，放到另一台Mac的/Applications目录下，一样是可以运行的（除了少部分要依赖系统文件的软件），所以你可以像拷贝文件一样将软件拷贝到移动硬盘，重装系统后再将软件拷贝到/Applications下即可，这种方式经本人试验大部分软件都可用。