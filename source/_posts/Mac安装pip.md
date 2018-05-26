---
title: Mac安装pip
date: 2017-09-09 19:53:18
tags:  Python
categories: Python
comments: Python
---


## pip是什么？

pip(软件包管理系统)，著名的Python包管理工具，python安装包的工具有easy_install, setuptools, pip，distribute等。常用的有pip、easy_install。 

<!---more--->

```
注：distribute是setuptools的替代品，是对标准库disutils模块的增强，我们知道disutils主要是用来更
加容易的打包和分发包，特别是对其他的包有依赖的包。distribute被创建是因为Setuptools包不再维护了。
而pip是easy_install的替代品。
```

## 安装pip


```
安装：

sudo easy_install pip

卸载：

sudo pip uninstall pip


```

## 其他

国外的源比较慢，这里推荐两个国内的源：

```
#pip豆瓣源安装

pip install -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com nltk

#pip 阿里云源安装

pip install -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com nltk

```

本想通过brew来安装pip，结果发现无法安装，需要先用brew安装Python，用brew 安装Python后发现还是无法安装，只能另辟蹊径了。

安装pip主要用于安装虚拟机，也是用于Python使用，virtualenv、Virtaulenvwrapper需要用pip安装管理


virtualenv用于创建独立的Python环境，多个Python相互独立，互不影响，它能够：
    
    1、在没有权限的情况下安装新套件
    
    2、不同应用可以使用不同的套件版本
    
    3、套件升级不影响其他应用
    
    

Virtaulenvwrapper是virtualenv的扩展包，用于更方便管理虚拟环境，它可以做：

    1、将所有虚拟环境整合在一个目录下
    
    2、管理（新增，删除，复制）虚拟环境
    
    3、切换虚拟环境
    




参考文献：

    Mac多Python版本共存，多个独立Python开发环境切换：
    https://www.cnhzz.com/pyenv_virtualenv_virtaulenvwrapper/
    
    http://blog.csdn.net/liuchunming033/article/details/39578019
    http://www.mamicode.com/info-detail-1312227.html







