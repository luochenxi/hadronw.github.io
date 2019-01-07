---
title: zsh 常用的插件
date: 2019-01-07 20:12
tags: Mac
categories: Mac 
comments: true
---

zsh 全称是 oh-my-zsh ，它在 Mac 中与iTerm2 搭配起来用非常的爽。本文将介绍 zsh 使用的插件。
<!--more-->

zsh 的安装以及 brew 的安装可以看这篇文章：[iterm2配置](https://hadronw.com/2018/02-07/iterm2%E9%85%8D%E7%BD%AE/)

# zsh 添加插件的方式，以及部分配置的修改

打开终端 `vi ~/.zshrc` 在 `~/.zshrc` 中配置 
```
# 配置 zsh 插件的地方，git 是默认的，其他的插件都是新添加的
plugins=(
  git zsh-autosuggestions zsh-completions git-open autojump zsh-syntax-highlighting
)  
```

一般的插件安装之后，在 `~/.zshrc` 中的 `plugins` 中添加插件名后，保存退出，再刷新一下 `~/.zshrc` 环境配置，即可使用。有的插件则需要在 `~/.zshrc` 添加其他配置

### zsh-syntax-highlighting

常用命令高亮的插件，正确会显示绿色，错误会显示红色

推荐用 `brew` 安装（brew 是 Mac 中的一个软件管理工具，不单单支持开发软件，还支持一下常用的软件如：微信、QQ 等），安装 `brew` 后，再安装其他的插件会非常的方便。

安装方式：
```
brew install zsh-syntax-highlighting
```

配置方式：`vi ~/.zshrc`
```
plugins=(
  git zsh-syntax-highlighting
)  
```

###  zsh-autosuggestions

效率神器，当你输入命令时，会从历史命令中查找匹配的，如果你想要输入的命令跟提升的命令（灰色）相同，按下 tab 键就自动补全了

安装
```
brew install zsh-autosuggestions
```
配置
```
plugins=(
  git zsh-syntax-highlighting zsh-autosuggestions 
)  
```


### git-open

在本地 git 的仓库下，可以使用 `git-open` 直接在浏览器打开它的远程仓库地址，非常的方便，省去了查找远程地址的麻烦。

安装方式：
``` 克隆项目
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
```

在`~/.zshrc`配置中添加
```~/.zshrc
plugins=(
  git zsh-syntax-highlighting zsh-autosuggestions git-open
)  
```

### autojump 

「智能跳转」方便打开目录的命令，安装后可以省去敲多余命令。
```
cd /xxx/xxxx/test  ==》 j test
jo test # 可以直接在访达中打开该目录
j 目录名 （支持模糊匹配和自动补全）
d （列出当前会话中访问过的目录列表，输入列表前的序号可以直接跳转）
.. (跳转到父目录，替代 cd ..)
... (跳转到父目录的父目录) 
```

安装：`brew install autojump`

配置：在 `~/.zshrc` 中 添加 autojump 插件
```
plugins=(
  git zsh-syntax-highlighting zsh-autosuggestions git-open autojump
)  
```

同时在`~/.zshrc` 中添加一个配置信息，
```
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
```

保存退出`~/.zshrc` 后刷新即可生效

### trash 

配置之后，在终端中使用`rm`命令，删除的文件将会移动到废纸篓，并不会直接删除，拥有了反悔的机会

安装
```
npm install --global trash-cli
```

配置，在 `~/.zshrc` 中添加如下
```
alias rm="trash"
```
保存 `~/.zshrc` 退出，并刷新配置即可生效

### bat 代替 cat 

`bat` 命令与 `cat` 的作用是一样的，不过 `bat` 提示了 `cat` 的颜值，增加了行号，颜色。[bat 官网](https://github.com/sharkdp/bat)

安装方式：
```
brew install bat
```

无需其他配置。

ps：注意，设置好配置`~/.zshrc`后，一定要刷新一下 `~/.zshrc` ，否则新的配置无法生效！