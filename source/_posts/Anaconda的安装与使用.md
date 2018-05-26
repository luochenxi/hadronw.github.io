---
title: Anaconda的安装与使用
date: 2018-02-08 14:21:03
tags: Python
categories: Python
comments: true
---

Python版本过多，来回切换会不太方便。尽管Python管理的工具（如：pyenv）会有很多，但Anaconda却是最为全面的。

Anaconda的优点：

* Anaconda跨平台，Linux、Mac、Windows都支持
* 提供包管理功能，支持许多Python依赖包的使用与管理
* 提供环境管理的功能，类似Virtualenv 解决了多个Python版本共存的问题

<!---more--->
## 下载
---

[Anaconda官网](https://www.anaconda.com/download/#macos) 选择符合自己平台的版本下载Linux/Mac/Windows。官网下载的速度相对于国内会比较慢[清华镜像下载页面下载会快些](https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/?C=N&O=D) 包含了Anconda的各个平台的历史版本，选择自己所需要的版本下载,如下图


{% asset_img 00.jpg  %}


## 安装
---

安装，软件安装是最简单的。打开安装包，然后根据提示下一步即可。如果有不会的，可以查看官方文档，入口如下图所示。

{% asset_img 01.jpg  %}

## 使用
---

Anaconda安装好后会默认添加好环境变量，打开Terminal运行conda，如果无法运行，则需要先添加Anaconda环境变量。

打开.bashrc or .bash_profile或者其它配置文档，在文末尾添加如下：

```
export PATH="/xxx/bin:$PATH" # Anaconda安装的目录

```

source刷新一下环境变量即可使用


## 常用操作
---

### Anaconda的常用命令--环境管理

```
# conda的常用操作，详细的可使用 -h 命令查看

conda info -e  #查看已经安装的的环境

# 创建名为env1，版本为3.6的Python环境

conda create --name env1 python=3.6 

# 创建名为env2，版本为2.7的Python环境

conda create --name env2 python=2.7

# 进入新建立的环境

source activate env1 # env1为环境名
或
conda activate env1

# 退出当前环境

source deactivate  # 退出，进入即实现了不同环境版本的切换
或
conda deactivate 

# 删除env1环境

conda env remove -n env1 
或
conda remove --name env1 --all

# 重命名

#将env1 环境名改为env00

conda create --env00 --clone env1 

# 将env1的删除，即实现了环境的重命名

conda remove --name env1 --all

```


### conda包管理

```

# 更新Python

conda update python

# 更新Anaconda应用

conda update anaconda

# 更新conda

conda update conda 

# 查看已经安装的包

conda list

# 安装包

conda install matplotlib

# 更新包

conda update matplotlib

# 删除包

conda remove matplotlib


```


好了，Anaconda的安装与基本使用介绍完毕；也可以使用它的图形页面。更多的功能等着你去发现，欢迎交流学习

















