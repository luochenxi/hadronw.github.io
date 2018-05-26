---
title: SQL常用命令(1)
tags: SQL
categories: SQL
comments: true
---
## SQL常用的命令


``记录下来方便复习、回忆，很多的东西许久不用就会慢慢的遗忘掉``


SQL操作的类型就几种归纳起来就四个字：增、删、改、查

* 增：添加数据，关键词``insert``
* 删：删除数据，关键词``delete``
* 改：修改数据，关键词``update``
* 查：查询数据，关键词``select``

``注：通SQL命令的关键字都是大写，这里方便阅读都小写``


### 创建表格

首先的命令是创建一个表格：

```
CREATE TABLE celebs(id  INTEGER,name TEXT,age INTEGER);

```
创建一个名人的数据表格，它有着三个字段id，姓名，年龄；其中integer，text是字段类型（integer表示的是数字，text表示是文字）

<!-- more -->
### 添加数据
```
INSERT INTO celebs(id,name,age) values(1,'Justin Bieber',21);
```
1. INSERT INTO是添加指定行或行的子句。
2. celebs是添加行的表的名称。
3. (id, name, age)是标识数据插入列的参数。
4. VALUES是表示插入数据的子句。
(1, 'Justin Bieber', 21)是标识要插入的值的参数。
1是一个将被插入id列的整数
'Justin Bieber'是将被插入name列的文本
21是一个将被插入age列的整数


### 查询表格
查询表格中name字段的数据

```
SELECT name FROM celebs;
```
SELECT语句用于从数据库中获取数据。在这里，SELECT返回表中name列的所有数据celebs。

1. SELECT是一个表示该语句是查询的子句。SELECT每次从数据库查询数据时，都将使用它。
2. name指定查询数据的列。
3. FROM celebs指定查询数据的表的名称。在此语句中，从celebs表中查询数据。

还可以查询表中所有列的数据(*通配符代表所有表格中的字段)

```
SELECT * FROM celebs;
```

### 修改数据

```
UPDATE celebs SET age=21 WHERE id=1;
```

该UPDATE语句在表格中编辑一行。您可以UPDATE在要更改现有记录时使用该语句。

1. UPDATE是一个在表中编辑一行的子句。
2. celebs是表的名称。
3. SET是表示要编辑的列的子句。
age 是要更新的列的名称
22是要插入age列的新值。
4. WHERE是一个子句，用于指示使用新列值更新的行。这里用一个行1的id列是将有行age更新22。

### 删除数据
```
DELETE FROM celebs WHERE id=1;
```
该DELETE FROM语句从表中删除一行或多行。您可以在要删除现有记录时使用该语句。

DELETE FROM 是一个允许您从表中删除行的子句。
celebs 是我们要删除行的表的名称。
WHERE是一个允许您选择要删除哪些行的子句。这里我们要删除id列中数值为1的那一行。

