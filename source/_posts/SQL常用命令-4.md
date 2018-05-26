---
title:  SQL常用命令(4)
date: 2017-06-09 20:07:21
tags: SQL
categories: SQL
comments: true
---

## SQL常用的命令(查询－多表)

先创建两个表albums(artist_id,name)`artist_id是外键,专辑表`、artists(id,name,year)`id是主键，艺术家表`
> 一个外键是包含其它表的数据库中的主键列。我们使用外键和主键来连接两个不同表中的行。一个表的外键保存另一个表的主键的值。与主键不同，外键不需要是唯一的，可以是NULL。



<!-- more -->

## 查询

```
SELECT * FROM albums WHERE artist_id = 3;
SELECT * FROM artists WHERE id = 3;
```


这里artist_id是albums表中的外键。我们可以看到迈克尔·杰克逊id在artists表中有3个。迈克尔·杰克逊的所有专辑也在表中的artist_id列中有3张albums。

这是SQL在两个表之间链接数据的方式。在关系之间artists表和albums表是id艺术家的价值。


## 查询

```
SELECT albums.name, albums.year, artists.name FROM albums, artists;
```
查询多个表的一种方法是写一个SELECT多个表名用逗号分隔的语句。这也被称为交叉连接。在这里，albums并且artists是我们正在查询不同的表。

当查询多个表时，列名需要指定table_name.column_name。这里，结果集包括表中的列name和year列和albums表中的name列artists。

不幸的是，这个交叉连接的结果并不是很有用。它将artists表的每一行与表的每一行组合albums。只能组合艺术家创建相册的行更有用。


## 查询(JOIN)

```
SELECT * FROM albums JOIN artists ON albums.artist_id = artists.id;
```
 
在SQL中，连接用于组合来自两个或多个表的行。SQL中最常见的连接类型是内部连接。
如果连接条件为true，内连接将组合来自不同表的行。让我们看看语法，看看它是如何工作的。
SELECT *指定我们的结果集将具有的列。在这里，我们希望在两个表中都包含每一列。
FROM albums 指定我们正在查询的第一个表。
JOIN artists ON指定要使用的连接类型以及第二个表的名称。在这里，我们要做一个内部连接，我们要查询的第二个表artists。
albums.artist_id = artists.id是描述两个表如何相互关联的连接条件。在这里，SQL使用表中的外键列artist_id将albums其与列中与列中artists相同值的恰好一行匹配id。我们知道，它只会在比赛中一排artists表，因为id是PRIMARY KEY的artists。

## 查询(LEFT JOIN)

```
SELECT * FROM albums LEFT JOIN artists ON albums.artist_id = artists.id;
```
外连接也可以组合来自两个或多个表的行，但与内部连接不同，它们不需要满足连接条件。相反，左侧表格中的每一行都会返回到结果集中，如果不符合连接条件，则使用NULL值来从右侧表格中填入列。

左表仅仅是语句中出现的第一个表。在这里，左边的表是albums。同样，右表是出现的第二个表。在这里，artists是正确的表。

