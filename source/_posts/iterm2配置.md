---
title: iterm2配置
date: 2018-02-07 16:14:50
tags: Mac
categories: Mac
comments: true
---

## iterm2简单的配置

本篇主要介绍iterm2的一些配置，以及搭配homebrew的使用


### homebrew


是一款自由及开放源代码的软件包管理系统，用以简化Mac OS X系统上的软件安装过程

<!---more--->

#### 安装homebrew

打开terminal(终端),输入以下命令安装 homebrew

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

```

#### 卸载homebrew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

```

#### 安装homebrew－cask

```
brew install caskroom/cask/brew-cask
brew update && brew upgrade brew-cask && brew  cleanup // 更新

```

#### 使用homebrew／homebrew－cask安装软件

```
brew cask install google-chrome // 安装 Google 浏览器
brew cask/ install 软件名
安装前可以先查看一下是否有该软件
brew cask info 软件名
brew cask uninstall 软件名 卸载
```

还有其它的一些命令，具体可以看帮助

### brew安装iterm2

#### 安装iterm2

```
brew cask install iterm2
```

#### 安装[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

如果有遇到乱码的请再安装一下Menlo-Powerline or Monaco-Powerline字体补丁

安装好oh my zsh后，在`~/.zshrc`中添加如下内容，能让你用的更便捷

```
ZSH_THEME="agnoster"  #使用 agnoster 主题，很好很强大
DEFAULT_USER="你的用户名"     #增加这一项，可以隐藏掉路径前面那串用户名
plugins=(git brew node npm zsh-autosuggestions zsh-syntax-highlighting zsh-completions)   #自己按需把要用的 plugin 写上

zsh-completions # 命令提示
zsh-syntax-highlighting #语法高亮

```

> 基本的一些配置都有了，往后可根据自己喜好再行探索增加设置

配置完成后，记得刷新环境变量`source ~/.zshrc`


### Mac中的环境变量在zsh中无效的问题

oh-my-zsh 安装默认不会假装系统shell中配置的环境，在使用过程中可能会发现之前配置好的软件环境无法使用。原因是zsh 中未加载系统中的配置的环境文件,如下所示：

```
 # If you come from bash you might have to change your $PATH.
 # export PATH=$HOME/bin:/usr/local/bin:$PATH
```

.zshrc 配置文件中，默认是关闭掉的，将注释#删除即可，删除后再刷新一下.zshrc或者重启一下iterm2即可

即使解除掉注释还是可能会发生无效的，解决办法就是引用一下Mac中配置环境变量的配置文件，如过是在`~/.bash_profile` 配置的

```
 # 在.zshrc 文末尾添加
 
 source ~/.bash_profile
 
```

刷新.zshrc 即可





