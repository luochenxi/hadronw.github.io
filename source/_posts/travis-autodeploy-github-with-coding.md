---
title: Travis CI 自动部署hexo到GitHub/Coding
date: 2018-05-27 11:09:20
tags: [hexo,travis,coding]
categories: hexo 
comments: true
reward: true
---

> 同时部署到GitHub、Coding


使用hexo搭建个人blog一年了，体验还不错，但也存在着一些问题。blog的管理、维护对操作环境有一定的要求，必须安装node、hexo、git等环境。

如果更换了电脑呢？或者说同时想再公司、个人电脑中管理和维护blog呢？

<!--more-->

---


按照剧情的正常发展应该：

* 新的电脑中搭建node、hexo、git等环境
* 拷贝blog源码到搭建好环境的新电脑中
* 使用heox编写blog
* hexo 编译部署到GitHub/Coding


于是想，能否较少对系统环境的依赖呢？

首先hexo博客实现的基本流程：本地环境中编写blog，使用hexo命令编译，再通过git上传编译好的文件（非源码）到GitHub或coding中的对应仓库，从而实现blog的管理维护。

从中可以发现，最关键的就是本地源码了；如果多个环境中操作hexo，每个环境中的blog源码设置、样式不一样，编译上传后还会导致blog发生各种变化。 这样的情况下是不怎么适合多客户端管理、维护blog的。

要解决的问题就是，既可以便捷的多客户端管理、维护blog，同时又减少blog部署对环境的依赖。

-------

方便多客户端管理的实现很简单，可以依赖GitHub实现同步协助。

[这21个自动化部署工具，你都知道吗？](https://blog.csdn.net/qq_25711251/article/details/72869682)

Travis CI 便适用于GitHub中使用[Travis CI：https://travis-ci.org/](https://travis-ci.org/) 可以同步到你的GitHub账户，允许自动化测试和部署。

Travis CI原理：Travis CI会在你每一次提交之后生成一个虚拟机来执行你事先安排好的build任务，你可以调整这个虚拟机的软件环境，甚至能执行sudo来进行apt-get install。

集成Travis CI用来做什么呢？

通过Travis CI（Continuous Integration是持续集成的意思）去做hexo 源码编译部署的工作。通过配置文件进行设置，当hexo博客的源码仓库中有改动，触发编译部署命令，去部署hexo，然后再把编译好的文件传入blog的仓库中进行更新。

这样只需要关注blog源码仓库，不用再管blog的运行仓库。

本地也不再需要依赖node、hexo-cli等环境了。只需要可以访问GitHub，操作GitHub即可（浏览器也可以操作GitHub的这样调整一下，可以说完全解决了对环境的依赖）。


## Travis CI 使用

---

GitHub Pages 的博客站点已经搭建成功，并且可以正常访问。如果未搭建或者说无法正常访问，先把GitHub Pages 的博客站点搭建好。 可以搜索GitHub搭建hexo/jeykll博客，或者Coding搭建hexo/jeykll博客

GitHub Pages默认要求必须使用master分支，所以我们可以在该仓库中新建一个分支（分支名随意如：hexo）用于保存博客的源码文件。编译好的blog文件则放入master分支。

已经搭建成功的默认是有master分支的，只需要新建一个`hexo`分支。

### 新建仓库hexo分支

---

```git
# 先克隆项目到本地某个空文件夹下
git clone https://github.com/hadronw/hadronw.github.io.git 

# 创建并切换分支 hexo
git checkout -b hexo

```

`hexo` 分支是用来存放blog的源码文件的，所以应该把该分支下的文件都删除，再把blog的源文件上传到改分支，再提交到远程仓库hexo分支上。 参考操作如下：


```git
git rm -rf *    #删除仓库中的文件，可能本地的文件还存有，则需要使用 rm -rf 命令
git commit -m "清空文件夹" #提交删除信息
git push origin hexo:hexo #将删除的信息推送到远程仓库
```

再把blog的源文件拷贝到上放的hexo分支对于的文件夹中，再把blog源文件上传到hexo分支上

```git
git add *
git commit -m "提交blog源文件"
git push origin hexo 
```

{% asset_img local-sources.png 仅供参考，有些文件是没必要的再之后可以把它们删除掉 %}

{% asset_img hexo-sources.png 标号的为本地上传的源文件，删除了一些不必要的 %}

这样GitHub中的仓库就可以看到两个分支：`hexo`用于存放源文件，`master`分支用于存放编译后的静态文件

之后我们更新文章都是提交到指定的hexo分支中，注：一定要提交正确，否则无法展示出来

```git
git push origin hexo  # 参考代码
```

### Travis CI 设置

---

进入[Travis 官网](https://travis-ci.org/)，用GitHub账号登陆。登陆成功之后会发现自动关联上了GitHub上的仓库。

找到你的个人blog对应的仓库即`yourname/yourname.github.io`，启用项目（点击按钮，启动状态有为绿色）再点击setting进入到仓库的配置页面。

More option ——》 Settings 进入到仓库的设置页面

General 栏开启：

`Build only if .travis.yml is present`——表示“只有当 .travis.yml配置文件 存在时才构建”

`Build branch updates` —— 表示 “当分支更新时构建” 

其它的选默认选项


Travis CI在自动构建完成后需要push静态文件到仓库的 master 分支下，而访问GitHub的仓库是需要权限的，下面来看看如何添加GitHub权限


### 配置GitHub Access Token

---

GitHub页面，账号Settings ——》Developer Settings ——》Personal access tokens ——》 Generate new token

点击后提示输入密码后继续，然后来到如下界面，取名字`Travis_gh_token 后面的步骤会用到`，勾选相关权限选项`repo 下全部和 user 下的 user:email 即可`。图片如下：

{% asset_img GitHub-access-token01.png  %}

{% asset_img GitHub-access-token02.png  %}

{% asset_img GitHub-access-token03.png  %}

生成完成后，将该token拷贝下来。

**此token页面只会出现一次，一定要拷贝保存下来，Travis中的配置需要添加**。如果忘记只能重新创建一个



### 配置Coding中的Token

---

Coding.net 个人账号页面 ——》访问令牌 ——》新建令牌 ——》令牌描述`取名为（Travis_co_token）后续的步骤会用到` ——》勾选相关权限`project:depot 和user.email` 如图所示：

{% asset_img Coding-access-token3.png  %}

生成完成后，将该token拷贝下来。

**此token页面只会出现一次，一定要拷贝保存下来，Travis中的配置需要添加**。如果忘记只能重新创建一个


### 在Travis CI中配置GitHub、Coding生成的token值

---

将上面获取到的GitHub token添加到`Environment Variables`部分，值为上文要求保存的token值,而名称即为上面设置的`Travis_gh_token`(请更改为个人所设置名称)。不勾选后面的 Display value in build log . 否则会在日志文件中暴露你的`token`信息，而日志文件是公开可见的。

同样的步骤添加Coding中生成的token值。注意不要添加混乱，如果再后续的构建中出现令牌无效，只需要重新配置一个即可

至此我们已经配置好了要构建的仓库和访问的token，接下来就是为Travis配置构建了。如何设置触发自动部署，如何部署。

{% asset_img travis-toke-setting.png  结果如图所示 %}



### Travis部署设置

---

在hexo分支根目录下创建`.travis.yml` 配置文件。在之前的步骤中我们勾选了`Build only if .travis.yml is present`仅当.travis.yml存在时才构建。 只有hexo分支中含有改文件，才会执行构建。该怎么部署的也是在该文件中配置，参考`.travis.yml`配置文件如下：

```yml
language: node_js # 设置语言
node_js: stable # 设置相应版本
cache:
    apt: true
    directories:
        - node_modules # 缓存不经常更改的内容
install:
    - npm install # 安装hexo及插件
    - npm rebuild node-sass --force #该命令是根据构建失败的日志提示添加的
before_install:
    - export TZ='Asia/Shanghai' # 更改时区
    - npm install hexo-cli -g  # 安装hexo环境
    - chmod +x ./publish-to-gh-pages.sh  # 为shell文件添加可执行权限
after_script:
    - ./publish-to-gh-pages.sh
script:
    - hexo clean # 清除
    - hexo g # 生成
branches:
    only:
        - hexo # 只监测hexo分支
env:
    global:
        # Github Pages
        - GH_REF: github.com/hadronw/hadronw.github.io.git #设置GH_REF，注意更改成自己的仓库地址
        # Coding Pages https://git.coding.net/hadronw/hadronw.git
        - CO_REF: git.coding.net/hadronw/hadronw.git 
```

辅助配置文件`publish-to-gh-pages.sh`

```
#!/bin/bash
set -ev
git clone https://${GH_REF} .deploy_git
cd .deploy_git
git checkout master
cd ../
mv .deploy_git/.git/ ./public/
cd ./public
git config user.name  "hadronw"
git config user.email "hadronw@qq.com" 
# add commit timestamp
git add .
git commit -m "Travis CI Auto Builder at `date +"%Y-%m-%d %H:%M"`"
git push --force --quiet "https://${Travis_gh_token}@${GH_REF}" master:master
git push --force --quiet "https://hadronw:${Travis_co_token}@${CO_REF}" master:master

```

注意，文中的配置文件仅供参考，对应的名称根据实际换成自己设置的名称。`GH_REF`表示GitHub上的仓库地址，`CO_REF`表示Coding上的仓库地址



### 上传配置文件及所有源文件开启自动部署

---

到此为止，基本上的流程配置已经完成，现在把编写好的配置文件上传到GitHub中仓库hexo分支中。`注：同时部署GitHub、Coding等多个仓库时，还是一GitHub为主，travis支持的就是GitHub，所以Coding只是作为辅助仓库用的`

```git
git add *
git add .travis.yml # 注.travis.yml 文件 git add * 命令可能无法添加，所以需要单独再添加一次
git commit -m "提交配置信息及源码"
git push origin hexo # 一定要推送到对应的分支上——hexo 否则会无法触发自动部署
```

当我们把文件上传到hexo分支中后`.travis.yml配置文件上传后`，Travis CI的项目页面会自动监测，如检测到了`.travis.yml`配置文件后，会根据`.travis.yml`中的配置文件自动部署项目。

Travis CI页面中会显示部署的日志，如果部署成功，则可以访问我们的博客了。注意查看日志文件，如果出错了，根据日志文件中的提示修改`.travis.yml`配置信息

---

常见错误：

```
remote: Coding 提示: Authentication failed! 认证失败，请确认您输入了正确的账号密码

检查配置文件，token是否配置正确

```


---

参考链接：

使用Travis自动部署Hexo到Github与自己的服务器：https://segmentfault.com/a/1190000009054888

使用Travis CI自动部署Hexo： https://xuanwo.org/2015/02/07/travis-ci-hexo-autodeploy/

Hexo 自动部署到 Github：http://lotabout.me/2016/Hexo-Auto-Deploy-to-Github/

使用 Travis CI 自动部署 Hexo 博客：https://shawnho.me/2017/11/23/deploy-hexo-blog-with-travis-ci/

使用Travis CI自动部署Hexo博客：http://www.itfanr.cc/2017/08/09/using-travis-ci-automatic-deploy-hexo-blogs/

使用travis-ci自动部署Hexo到github和coding: https://juejin.im/post/5afe61f5f265da0b8d422a3e

基于Travis CI实现 Hexo 在 Github 和 Coding 的同步部署: https://blog.csdn.net/qinyuanpei/article/details/79388983


