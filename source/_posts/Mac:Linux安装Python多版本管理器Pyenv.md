---
title: Mac/Linux安装Python多版本管理器Pyenv
date: 2017-09-09 21:53:52
tags: Python
categories: Python
comments: true
---

> Mac OS 自带有Python 2.X版本，由于Python3.X版本有很大改动，与之前版本许多方法并不是相同的使用方式，因此会需要在电脑中安装不同的Python版本

<!---more--->
Python的版本有许多，这里介绍一个pyenv，通过它来安装管理，切换Python版本

## 安装pyenv

通用方法Linux/MacOS通用：

```
 git clone https://github.com/yyuu/pyenv.git ~/.pyenv

```

Mac 中安装brew软件管理的可以通过brew安装

此处介绍通过homebrew安装pyenv，没有安装[homebrew](https://hadronw.github.io/2017/06/14/Mac%E7%9A%84%E4%B8%80%E4%BA%9B%E9%85%8D%E7%BD%AE%E4%B9%8Biterm2%E7%AF%87/)可以点击看安装介绍。也可以查看[pyenv](https://github.com/pyenv/pyenv#homebrew-on-mac-os-x)github原本说明，

```
brew install pyenv
```
此时pyenv就安装好了，接下来是需要配置一下环境

## 配置环境变量

```
方式一：打开.bash_profile文件，在该文件中手动添加

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

方式二：直接通过命令
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile

```

接下来再配置一下Python版本切换中环境变量的相关

```
方式一：打开.bash_profile文件，在该文件中末尾手动添加

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

方式二：命令

$ echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile

```

添加之后切记刷新一下环境变量，命令方式：
    
    source ~/.bash_profile

[Mac环境变量相关](https://hadronw.github.io/2017/06/17/Mac%E4%B8%AD%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F/)可点击查看

## 使用pyenv

pyenv命令介绍，

```
   commands    列出所有pyenv可用的命令
   local       设置或显示本地应用程序特定的Python版本
   global      设置或显示系统全局的Python版本
   shell       设置或显示shell外壳的Python版本
   install     使用python-build安装指定Python版本
   uninstall   卸载已经安装的Python
   rehash      刷新 pyenv shims (安装之后运行这个)
   version     查看当前使用的版本
   versions    列出已经安装的Python版本，当前激活版本用*号标注
   which       显示的完整路径的可执行文件
   whence      列出包含给定的可执行所有的Python版本
```

建议：
    
    系统全局用系统默认的Python比较好，不建议直接对其操作
    pyenv global system(不建议使用系统自带的Python版本开发或测试)
    
查看Python可用版本：
    
    pyenv install -l 列举版本较多，需要仔细浏览

安装Python：

    pyenv install xx.xx.xx (pyenv install 3.4.3)
    pyenv rehash   # 记得一定要rehash

切换Python版本：

    pyenv local xx.xx.xx（3.4.3）
    
    
临时设定Python版本，退出后失效：
    
    pyenv shell xx.xx.xx（3.4.3）

取消某版本切换：

    pyenv local xx.xx.xx（3.4.3） --unset

优先级关系：shell——local——global


参考文章：

https://www.cnhzz.com/pyenv_virtualenv_virtaulenvwrapper/

https://my.oschina.net/damienchen/blog/852006

https://github.com/pyenv/pyenv#homebrew-on-mac-os-x

http://lovekaiyuan.iteye.com/blog/2214417


