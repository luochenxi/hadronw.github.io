---
title: Charles抓取移动设备Https请求(Mac环境中)
date: 2017-06-10 18:02:27
tags: Charles
categories: Charles
comments: true
---
> 随着Https的普及；Charles对Https请求抓取数据也越来越多

Charles是一款抓包神器，它是Java开发的跨平台的软件，不仅可以在Mac上使用，Linux以及Window下都是可以使用的，当然需要安装JDK,才能运行，他是收费的,也可免费,只是每过一小段时间,就会弹出一个对话框提醒注册缴费。`此处不讲述软件安装，注册`

<!----more----->
## Charles使用

### Charles抓取Http数据

首先打开软件页面：

1. 打开Charles，在Menu选择Proxy > Proxy settings进入页面设置；
2. Proxies页面中的Http Proxy，Port框中可以根据自己实际情况修改端口号，后面在手机中设置Http代理的时候会用到。
3. 选macOS页面，在Enable macOS打勾，在Use Http proxy打勾
4. 选择OK保存，电脑端的就设置好了
5. 手机端，确保手机、电脑连接的是同一个局域网。
6. 打开手机连接的wifi，在Http代理中选择手动代理填写ip，端口
7. ip查看使用软件中的IP地址，端口是上面第二选项中设置的端口号
8. 抓包设置就好了，记得在Charles软件中选择允许抓取数据

### Charles抓取Https数据
抓取Https数据包，电脑与移动端都需要安装证书(可以先尝试一下移动端不安装，如果无法抓取再安装)；

#### Mac安装证书

1. 打开Charles，在Menu选择Help > Install Charles CA SSL Certificate
2. 打开Keychain Access（钥匙访问串），点击左边登陆选项找到Charles Proxy CA，此时证书是不被信任的；双击进去，打开信任，将不信任改为信任
3. 打开Charles，在Menu选择Proxy > SSL Proxying Settings  >  SSL Proxying 点击Add添加一个地址，在Host中填写英文字符*再保存`此时电脑端的证书安装完毕`

#### 手机安装证书

1. 打开Charles，在Menu选择SSL Proxying > Install Charles Root Certificate on a Mobile Device or Remote Browser；
点击之后会出现一个提示框`其中的IP地址每个人都不一样，到时候配置代理时需要使用你自己的IP`
2. 用手机浏览器打开http://charlesproxy.com/getssl 下载证书，再根据提示操作
3. 再配置好HTTP代理，大功告成


> 注：如果没有抓取到数据，请注意检查是否连接同一个局域网，IP地址是否填写正确，端口是否正确以及是否允许抓取数据


