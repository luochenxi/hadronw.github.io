---
title: Linux中配置环境变量
date: 2017-12-20 15:02:13
tags: Linux
categories: Linux
comments: true
---


Linux中可以配置环境变量的文件有许多如：/etc/profile、/etc/bashrc 、~/.bash_profile、~/.bashrc，不同的文件，加载的顺序是不同的，适用的范围也是不一样的
<!---more--->

```
/etc/profile （建议不修改这个文件 ）
全局（公有）配置，不管是哪个用户，登录时都会读取该文件

/etc/bashrc （一般在这个文件中添加系统级环境变量）
全局（公有）配置，bash shell执行时，不管是何种方式，都会读取此文件

~/.bash_profile （一般在这个文件中添加用户级环境变量常用）
每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该文件仅仅执行一次

```
加载顺序

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

推荐在~/.bash_profile中配置环境变量

前提：jdk文件已经解压好了

打开jdk目录，拷贝路径

```
[hadoop2@master app]$ cd jdk1.8.0_151/
[hadoop2@master jdk1.8.0_151]$ pwd
/home/hadoop2/app/jdk1.8.0_151  ---拷贝它
```


打开~/.bash_profile 

```
JAVA_HOME=/home/hadoop2/app/jdk1.8.0_151
CLASSPATH=$JAVA_HOME/lib:$CLASSPATH


PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME CLASSPATH PATH

注，其他的软件配置可如下

OTHER=/xxx/xxx/xx

PATH=$JAVA_HOME/bin:$OTHER/bin:$PATH
export JAVA_HOME OTHER CLASSPATH PATH

```

或者简单一点的如：

```
export JAVA_HOME=/opt/module/jdk1.8.0_151
export PATH=$PATH:$JAVA_HOME/bin

```



将以上配置添加其中，保存退出


刷新~/.bash_profile配置文件

```
touch ~/.bash_profile
```

验证jdk环境变量是否配置成功

```
java -version
```

正确输出了版本，则说明配置成功

java version "1.8.0_151"
Java(TM) SE Runtime Environment (build 1.8.0_151-b12)
Java HotSpot(TM) 64-Bit Server VM (build 25.151-b12, mixed mode)







