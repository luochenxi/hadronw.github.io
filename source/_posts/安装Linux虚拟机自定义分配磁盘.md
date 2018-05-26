---
title: 安装Linux虚拟机自定义分配磁盘
date: 2017-12-20 10:58:33
tags: Linux
categories: Linux
comments: true
---


>安装CentOS6.5自定义分配磁盘，虚拟机默认的磁盘大小为20G，内部分配也是默认的。为了避免出现磁盘不足情况，故将虚拟机磁盘大小扩展到36G，并自定义内部磁盘分配

Mac中VM与Windows中VM的前期选择镜像文件，修改磁盘大小会有些许差别。
<!---more--->

注：磁盘分区时，要好好考虑那个目录下会经常使用，比如/home目录会经常使用，就多分配点空间；下文的数字仅供参考，请根据自己实际需求分配空间


{%  asset_img 01.jpg 此时已经选好了镜像文件，在开始安装之前先选择调整磁盘大小如图  %}

{%  asset_img 02.jpg 调整大小为36G并应用  %}

{%  asset_img 03.jpg 开始安装选择自定义创建磁盘分区  %}

{%  asset_img 04.jpg 创建磁盘分区页面  %}

{%  asset_img 05.jpg 创建默认选项下一步  %}

{%  asset_img 06.jpg 创建/boot分区如图所示  %}

{%  asset_img 07.jpg 再创建  %}

{% asset_img 08.jpg 创建/home分区如图所示 %}

{% asset_img 09.jpg 再创建 %}

{% asset_img 10.jpg 创建swap分区如图所示 %}

{% asset_img 11.jpg 再创建 %}

{% asset_img 12.jpg 创建/分区分配剩余磁盘空间 %}

{% asset_img 13.jpg 看图 %}

{% asset_img 14.jpg 下一步 %}

{% asset_img 15.jpg 格式化 %}

{% asset_img 16.jpg 修改磁盘 %}

{% asset_img 17.jpg 下一步 %}

{% asset_img 18.jpg 看图选择自己需求 %}

{% asset_img 19.jpg 安装过程 %}

{% asset_img 20.jpg 安装过程 %}

{% asset_img 21.jpg 看图 %}

{% asset_img 22.jpg 重启过程 %}

{% asset_img 23.jpg 安装成功 %}

以上为自定义分配磁盘的Linux安装流程，默认安装的流程可看[Mac中vm安装Linux-Centos6.5](https://hadronw.github.io/2017/12-19/Mac%E4%B8%ADvm%E5%AE%89%E8%A3%85Linux-Centos6-5/)



