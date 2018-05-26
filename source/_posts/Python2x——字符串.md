---
title: Python2x——字符串
date: 2017-11-16 22:44:19
tags: Python
categories: Python
comments: true
---

>Python目前的主要区别Python2与Python3，Python3有许多的优化，改版，有许多的语法使用方式与Python2有所区别。Python2x是指Python2.xx的版本，Python3则是指Python3.xx版本
<!---more--->


## 什么是字符串？
---
字符串就是一个个字符串成一串，也就是单个的连在一起，经常看到的如下：

```
单引号的—— 'abc' , 'hello world'

双引号的——  "abc" , "hello world"

```

Python中的一般使用：

```
>>> print 'hello python'
hello python
>>> print "hello python"
hello python
>>>

```

也可以嵌套使用：

```
>>> print 'hello "python"'
hello "python"
>>> print "hello 'python'"
hello 'python'
>>>
```
注意输出的区别

```
错误的示范：
>>> print "hello 'py"t"hon'"
  File "<stdin>", line 1
    print "hello 'py"t"hon'"
                     ^
SyntaxError: invalid syntax

正确的示范：
>>> print "hello 'py't'hon'"
hello 'py't'hon'

或
错误的示范：
>>> print 'h"e'l'l"o'
  File "<stdin>", line 1
    print 'h"e'l'l"o'
               ^
SyntaxError: invalid syntax

错误的示范：
>>> print 'he"l'lo py'th"on'
  File "<stdin>", line 1
    print 'he"l'lo py'th"on'
                 ^
SyntaxError: invalid syntax

正确的示范：
>>> print 'he"l"lo py"th"on'
he"l"lo py"th"on

正确的示范：
>>> print 'he"l"l"o p"y"th"on'
he"l"l"o p"y"th"on

```

看看发现了什么，如果最外层用的是单引号`''`，单引号`''`里面嵌套的字符串需要再作引用说明时就只能是双引号`""`。

同理亦然，最外层用了双引号`""`，字符串中间的就只能用单引号`''`。

也就是说在Python2中一个字符串最外层的引用符号只能出现一次！


## 字符串的连接
---

```
1、
>>> print 'hello '+ " python"
hello  python

2、
>>> print "hello "+ " python"
hello  python

3、
>>> print 'hello '+' python'
hello  python

```

这几种都是可以的，通常为了提高代码的可读性，会统一用一种风格方式。约定好用第二种，或者第三种。不建议用第一种


## 其他类型转为字符串

最简单的一种就是用斜引号引用

```
>>> print "No"+`1`
No1
```

作为数字的1是不能和字符串相加的，因为两个类型不一样，同理类型不一样的时候是需要先统一类型再做处理的(整型/浮点型数据不在此类)。





