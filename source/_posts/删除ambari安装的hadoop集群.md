---
title: 删除ambari安装的hadoop集群
date: 2018-03-27 09:12:55
tags: Linux
categories: Linux
comments: Linux
---

> 机器环境适用于——CentOS/redhat

注：生产环境谨慎尝试


## 停止Ambari服务

```
ambari-server stop
```

<!---more--->


## 删除hdp.repo和hdp-util.repo

```
cd /etc/yum.repos.d/
rm -rf hdp*
rm -rf HDP*
rm -rf ambari*
```

## 删除安装包

```
用yum list installed | grep HDP来检查安装的ambari的包

yum remove -y ambari-*
yum remove -y postgresql

yum remove -y  sqoop.noarch  
yum remove -y  lzo-devel.x86_64  
yum remove -y  hadoop-libhdfs.x86_64  
yum remove -y  rrdtool.x86_64  
yum remove -y  hbase.noarch  
yum remove -y  pig.noarch  
yum remove -y  lzo.x86_64  
yum remove -y  ambari-log4j.noarch  
yum remove -y  oozie.noarch  
yum remove -y  oozie-client.noarch  
yum remove -y  gweb.noarch  
yum remove -y  snappy-devel.x86_64  
yum remove -y  hcatalog.noarch  
yum remove -y  python-rrdtool.x86_64  
yum remove -y  nagios.x86_64  
yum remove -y  webhcat-tar-pig.noarch  
yum remove -y  snappy.x86_64  
yum remove -y  libconfuse.x86_64    
yum remove -y  webhcat-tar-hive.noarch  
yum remove -y  ganglia-gmetad.x86_64  
yum remove -y  extjs.noarch  
yum remove -y  hive.noarch  
yum remove -y  hadoop-lzo.x86_64  
yum remove -y  hadoop-lzo-native.x86_64  
yum remove -y  hadoop-native.x86_64  
yum remove -y  hadoop-pipes.x86_64  
yum remove -y  nagios-plugins.x86_64  
yum remove -y  hadoop.x86_64  
yum remove -y  zookeeper.noarch      
yum remove -y  hadoop-sbin.x86_64  
yum remove -y  ganglia-gmond.x86_64  
yum remove -y  libganglia.x86_64  
yum remove -y  perl-rrdtool.x86_64
yum remove -y  epel-release.noarch
yum remove -y  compat-readline5*
yum remove -y  fping.x86_64
yum remove -y  perl-Crypt-DES.x86_64
yum remove -y  exim.x86_64
yum remove -y ganglia-web.noarch
yum remove -y perl-Digest-HMAC.noarch
yum remove -y perl-Digest-SHA1.x86_64

```

## 删除快捷方式

```
cd /etc/alternatives
rm -rf hadoop-etc 
rm -rf zookeeper-conf 
rm -rf hbase-conf 
rm -rf hadoop-log 
rm -rf hadoop-lib 
rm -rf hadoop-default 
rm -rf oozie-conf 
rm -rf hcatalog-conf 
rm -rf hive-conf 
rm -rf hadoop-man 
rm -rf sqoop-conf 
rm -rf hadoop-conf

```

## 删除用户

```
userdel nagios 
userdel hive 
userdel ambari-qa 
userdel hbase 
userdel oozie 
userdel hcat 
userdel mapred 
userdel hdfs 
userdel rrdcached 
userdel zookeeper 
userdel mysql 
userdel sqoop
userdel puppet

```

## 删除文件夹

```
rm -rf /hadoop
rm -rf /etc/hadoop 
rm -rf /etc/hbase 
rm -rf /etc/hcatalog 
rm -rf /etc/hive 
rm -rf /etc/ganglia 
rm -rf /etc/nagios 
rm -rf /etc/oozie 
rm -rf /etc/sqoop 
rm -rf /etc/zookeeper 
rm -rf /etc/flume   
rm -rf /etc/storm   
rm -rf /etc/hive-hcatalog  
rm -rf /etc/tez   
rm -rf /etc/falcon   
rm -rf /etc/knox   
rm -rf /etc/hive-webhcat  
rm -rf /etc/kafka   
rm -rf /etc/slider   
rm -rf /etc/storm-slider-client  
rm -rf /etc/spark   
rm -rf /var/lib/ambari*
rm -rf /usr/lib/hadoop
rm -rf /usr/lib/hbase 
rm -rf /usr/lib/hcatalog 
rm -rf /usr/lib/hive 
rm -rf /usr/lib/oozie 
rm -rf /usr/lib/sqoop 
rm -rf /usr/lib/zookeeper 
rm -rf /var/lib/hive 
rm -rf /var/lib/ganglia 
rm -rf /var/lib/oozie 
rm -rf /var/lib/zookeeper 
rm -rf /var/tmp/oozie 
rm -rf /var/nagios 

rm -rf /tmp/hive 
rm -rf /tmp/nagios 
rm -rf /tmp/ambari-qa 
rm -rf /tmp/sqoop-ambari-qa 
rm -rf /hadoop/oozie 
rm -rf /hadoop/zookeeper 
rm -rf /hadoop/mapred 
rm -rf /hadoop/hdfs 

rm -rf /tmp/hadoop-hive 
rm -rf /tmp/hadoop-nagios 
rm -rf /tmp/hadoop-hcat 
rm -rf /tmp/hadoop-ambari-qa 
rm -rf /tmp/hsperfdata_hbase 
rm -rf /tmp/hsperfdata_hive 
rm -rf /tmp/hsperfdata_nagios 
rm -rf /tmp/hsperfdata_oozie 
rm -rf /tmp/hsperfdata_zookeeper 
rm -rf /tmp/hsperfdata_mapred 
rm -rf /tmp/hsperfdata_hdfs 
rm -rf /tmp/hsperfdata_hcat 
rm -rf /tmp/hsperfdata_ambari-qa

rm -rf /var/run/hadoop 
rm -rf /var/run/hbase 
rm -rf /var/run/hive 
rm -rf /var/run/ganglia 
rm -rf /var/run/nagios 
rm -rf /var/run/oozie
rm -rf /var/run/zookeeper
rm -rf /var/run/spark  
rm -rf /var/run/hadoop  
rm -rf /var/run/hbase  
rm -rf /var/run/zookeeper  
rm -rf /var/run/flume  
rm -rf /var/run/storm  
rm -rf /var/run/webhcat  
rm -rf /var/run/hadoop-yarn  
rm -rf /var/run/hadoop-mapreduce  
rm -rf /var/run/kafka  
rm -rf /var/log/ambari*
rm -rf /var/log/hadoop  
rm -rf /var/log/hbase  
rm -rf /var/log/flume  
rm -rf /var/log/storm  
rm -rf /var/log/hadoop-yarn  
rm -rf /var/log/hadoop-mapreduce  
rm -rf /var/log/knox  
rm -rf /var/log/hadoop 
rm -rf /var/log/hbase 
rm -rf /var/log/hive 
rm -rf /var/log/nagios 
rm -rf /var/log/oozie 
rm -rf /var/log/zookeeper 
```

至此大部分的删除完毕，还有些没有删除干净的。再次安装会检测出来，再根据提示删除
