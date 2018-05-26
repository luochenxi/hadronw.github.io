---
title: iterm2卡顿问题
date: 2018-02-07 16:24:49
tags: Mac
categories: Mac
comments: true
---

## 解决zsh使用时可能卡顿

### git原因

zsh 使用git时可能会卡顿，原因是oh-my-zsh主题会自动获取git信息
<!---more--->
```
git config --add oh-my-zsh.hide-dirty 1  # 禁止自动获取git信息

git config --add oh-my-zsh.hide-dirty 0 # 恢复默认
```


### 日志过多

Apple System Log（asl）系统日志过多也会影响iterm2开启的速度

系统日志会在 /private/var/log/asl 目录中

查看 /private/var/log/asl 大小的情况

```
du -sh /private/var/log/asl   -- 查看文件所占磁盘的大小

```

如果文件过大，将该文件夹下日志文件清空即可

```
sudo rm /private/var/log/asl/*.asl
```

### 替换iterm2/terminal 启动的shell

将startup shell 从默认的 /usr/bin/login 改为 /bin/bash -l 或者 /usr/bin/zsh ，Terminal 和 iTerm 2 就可以秒开了

iterm2: 修改 Preferences → Startup: 从 Default login shell 改为 /bin/bash -l

terminal：修改 Preferences → Profiles → General → Command: 从 Login Shell 改为 /bin/bash -l




参考链接：https://superuser.com/questions/31403/how-can-i-speed-up-terminal-app-or-iterm-on-mac-osx



