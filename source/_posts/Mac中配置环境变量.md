---
title: Mac中配置环境变量
date: 2017-06-17 19:06:04
tags: Mac
categories: Mac
comments: true
---


> 环境变量是每个开发者绕不开的话题，本篇简单讲述Mac中 `~/.bash_profile`环境变量的相关

## Mac中配置环境变量的位置

Mac中配置环境变量的位置主要有以下三个(多的几种看下方加载顺序)：
<!---more--->

- /etc/profile   （建议不修改这个文件 ）
全局（公有）配置，不管是哪个用户，登录时都会读取该文件

- /etc/bashrc    （一般在这个文件中添加系统级环境变量）
全局（公有）配置，bash shell执行时，不管是何种方式，都会读取此文件

- ~/.bash_profile （一般在这个文件中添加用户级环境变量**常用**） 
每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该文件仅仅执行一次


OS X系统的环境变量，加载顺序为：

```
/etc/profile
/etc/paths 
~/.bash_profile 
~/.bash_login 
~/.profile 
~/.bashrc

/etc/profile和/etc/paths是系统级别的，系统启动就会加载，
后面几个是当前用户级的环境变量。

~/.bash_profile，~/.bash_login，~/.profile按照从前往后的顺序读取，
如果~/.bash_profile文件存在，则后面的几个文件就会被忽略不读了，
如果~/.bash_profile文件不存在，才会以此类推读取后面的文件。

~/.bashrc没有上述规则，它是bash shell打开的时候载入的
```

## 查看Mac中使用的是什么shell

```
echo $SHELL
```

shell的种类有：

- csh或者是tcsh；这几种归类为：C Shell（Mac OS X 10.2之前默认）
- bash，sh，zsh；这几种归类为：Bourne Shell（Mac OS X 10.3之后默认）


shell语言的不同只会是使用规则会有些许差别，有兴趣的童鞋可以进一步探索一下其中差别；文中的方式适用于**Bourne Shell**


## ~/.bash_profile配置

### 创建

```
touch .bash_profile
```

### 打开

```
open -e .bash_profile

注：这种是用外部的编辑工具打开编辑，优点是可视化强
```
直接关闭编辑框就可以保存了，保存后可刷新一下


```
vi ~/.bash_profile

注：使用vi编辑，优点是无需额外切换窗口
```

vi常用的命令：

命令 		| 释义
------------- | -------------
:w	|保存
:q	|退出vim
:wq	|保存并退出
:wq!	|	（在可以转换权限的情况下）强制保存并退出
:q!	|	直接退出不保存
:w filename	|	另存为filename
:n,m w filename		|将第n行到第m行另存为filename
:set nu 	|显示行号
:set nonu		|不显示行号
:! command	|	暂时离开vim，并执行command，执行完后再进入vim
:r filename	|	将filename文件的数据读入当前文件
:set all		|显示当前vim的环境配置

根据命令编辑，保存；

### 配置

```
export PATH=${PATH}:路径1:路径2 :$PATH （用“：”分割）
```
如：

```
export xx1_HOME=/Library/xxx/xxx/xxx/Contents/Home
export xx2_HOME=/usr/local/xxx/xxx
export xx3__HOME=/Users/xxx/xxx

export PATH=${PATH}:xx1_HOME/bin: xx2_HOME/tools: xx2_HOME/tools/bin: xx3__HOME/bin:$PATH

还可以直接配置

export PATH=$PATH:/usr/local/xxx/bin

或者

export PATH=/usr/local/hbase/bin:"$PATH"

```

或者：

```

export JAVA_HOME=/opt/module/jdk1.8.0_151
export PATH=$PATH:$JAVA_HOME/bin

```




### 刷新

```
source ~/.bash_profile
```


> 以上就是环境变量的一些简单配置，还有很多有意思的配置，童鞋们可自行探索，欢迎交流、分享
