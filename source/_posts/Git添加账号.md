---
title: Git添加账号
date: 2017-06-08 19:49:26
tags:  git
categories: git
comments: true
---

## Git添加账号

### 测试SSH是否连接
打开Terminal

```shell
ssh -T git@github.com
```

以下反馈则表示账号连接成功，可以直接使用。如果是其它的则需要在你的git添加SSH key
<!----more----->

```shell
Hi username! You've successfully authenticated, but GitHub does not
provide shell access.
```


### 先查看电脑是否存在SSH key

> 有则直接在您的GitHub账号中添加，没有则现在您的电脑中先创建再添加
检查电脑中是否存在SSH keys

```shell
ls -al ~/.ssh
```

如果存在，则会显示id_dsa.pub、id_dsa等相关显示；不存在则需要先创建SSH keys


### 创建SSH key

```shell
ssh-keygen -t rsa -C "your_email@youremail.com" 
注：your_email@youremail.com 请注意替换您自己的GitHub 账号
```
再根据命令的提示操作

```shell
Generating public/private rsa key pair. Enter file in which to save thekeys (/Users/your_user_directory/.ssh/id_rsa): //这里需要按下 enter 键就好
```
按下enter之后，又会出现下面的提示：

```
Enter passphrase(empty for no passphrase):
提示输入一个类似于密码的自定义的通行证号，如果直接回车则为空
```
此时会再出现一个密码的二次确认（请注意设置容易记住的，后面在测试连接时需要用到）
> 如果再二次确认中忘记了刚刚设置的密码，可以重新再生成一个新的SSH key

之后出现的一大堆提示则说明您的SSH key创建成功

### 在你的GitHub中添加SSH key验证

先打开您生成的id_dsa.pub，拷贝SSH值。可以直接找到.ssh文件夹打开拷贝，也可以选择用命令

```shell
pbcopy < ~/.ssh/id_rsa.pub
```
再登录你的Github账号，在**Settings－>SSH and GPG keys->**选项中添加
按照提示讲拷贝的SSH添入其中，提交后会有输入密码的确认，之后会有提示。
如果提示添加成功，可以测试一下是否可以理解，参照“测试SSH是否与您的账号连接”

