---
title: SQL常用命令(3)
date: 2017-06-07 21:50:33
tags: SQL
categories: SQL
comments: true
---

## 摘要
```
聚合函数将多个行组合在一起以形成更有意义的信息的单个值。
COUNT以列的名称作为参数，并计算值不为的行数NULL。
GROUP BY 是一个用于聚合函数的子句，用于组合一个或多个列的数据。
SUM() 将列名称作为参数，并返回该列中所有值的总和。
MAX() 将列名作为参数，并返回该列中的最大值。
MIN() 将列名作为参数，并返回该列中的最小值。
AVG() 以列名称作为参数，并返回该列的平均值。
ROUND()需要两个参数，列名和小数位数来舍入该列中的值。
```

## 高级查询
<!----more----->
### 查询(COUNT)

```
SELECT COUNT(*) FROM fake_apps;
```
COUNT()是将列的名称作为参数的函数，并计算列不是的行数NULL。在这里，我们想计算每一行，所以我们*作为一个参数传递。

### 查询(GROUP BY)

```
SELECT price, COUNT(*) FROM fake_apps GROUP BY price;
```

GROUP BY是SQL中仅用于聚合函数的子句。它与SELECT声明协作使用，将相同的数据安排成组。

在这里，我们的聚合函数是COUNT()和我们price作为参数传递GROUP BY。SQL会计算price表中每个应用程序的总数。

通常对SELECT您作为参数传递的列有帮助GROUP BY。在这里我们选择price和COUNT(*)。您可以看到结果集合分为两列，可以轻松查看每个价格的应用数量。

### 查询(SUM)

```
SELECT SUM(downloads) FROM fake_apps;
```
SUM()是一个将列的名称作为参数并返回该列中所有值的总和的函数。在这里，它会添加downloads列中的所有值。

### 查询(MAX)

```
SELECT MAX(downloads) FROM fake_apps;
```
MAX()是一个将列的名称作为参数并返回该列中最大值的函数。在这里，我们传递downloads一个参数，所以它将返回downloads列中最大的值。

### 查询(MIN)

```
SELECT MIN(downloads) FROM fake_apps;
```
类似于MAX()SQL，也可以通过使用MIN()函数来简单地返回列中的最小值。

MIN()是将列的名称作为参数的函数，并返回该列中的最小值。在这里，我们传递downloads一个参数，这样它将返回downloads列中最小的值


### 查询(AVG)

```
SELECT AVG(downloads) FROM fake_apps;
```
此语句返回数据库中应用程序的平均下载次数。SQL使用该AVG()函数快速计算特定列的平均值。

该AVG()函数的作用是将列名作为参数，并返回该列的平均值。

### 查询(ROUND)

```
ELECT price, ROUND(AVG(downloads), 2) FROM fake_apps
GROUP BY price;
```
默认情况下，SQL尝试尽可能精确地进行舍入。我们可以使用该ROUND()功能使结果集更容易阅读。

ROUND()是一个使用列名称和整数作为参数的函数。它将列中的值舍入为整数指定的小数位数。在这里，我们传递列AVG(downloads)和2作为参数。SQL首先计算每个价格的平均值，然后将结果舍入到结果集中的两位小数。
