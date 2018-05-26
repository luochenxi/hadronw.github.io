---
title: SQL常用命令(2)
date: 2017-06-06 15:33:50
tags: SQL
categories: SQL
comments: true
---

## 摘要

* SELECT 是您每次要从数据库查询信息时使用的子句。
* WHERE 是一个流行的命令，可以根据您指定的条件过滤查询的结果。
* LIKE并且BETWEEN是可以在一个WHERE子句中使用的特殊操作符
* AND并且OR是可以用于WHERE在两个或多个条件下过滤查询的特殊操作符。
* ORDER BY 允许您以升序或降序对查询的结果进行排序。
* LIMIT允许您指定查询将返回的最大行数。这对于具有数千甚至数百万行的大型表格尤其重要。



## 在表格中添加新列
<!---more--->
```
ALTER TABLE celebs ADD COLUME twitter_handle text;
```

该ALTER TABLE语句向表中添加了一个新列。当您要向表中添加列时，可以使用此命令。

1. ALTER TABLE是一个允许您进行指定更改的子句。
2. celebs是正在更改的表的名称。
3. ADD COLUMN是一个允许您向表添加新列的子句。

twitter_handle 是要添加的新列的名称
TEXT 是新列的数据类型



## 高级查询


### 查询(DISTINCT)

```
SELECT DISTINCT genre FROM movies;
```

SELECT DISTINCT用于返回结果集中的唯一值。它会滤除所有重复的值。在这里，结果集列出了movies表中的每个类型一次。

1. SELECT DISTINCT指定该语句将是一个返回指定列中唯一值的查询

2. genre是要在结果集中显示的列的名称。

3. FROM movies表示要查询的表名。

### 过滤查询
过滤查询的结果是SQL中的一个重要技能。在数据被过滤之后，电影可以看到不同的可能类型更容易，而不是扫描表中的每一行

```
SELECT * FROM movies WHERE imdb_rating > 8;
```
此语句将结果集过滤到仅包含IMDb等级大于8的电影。它如何工作？

1. WHERE是一个子句，表示您要过滤结果集以仅包含以下条件为真的行。

2. imdb_rating > 8是过滤结果集的条件。这里，只有列中值大于8的imdb_rating行才会返回到结果集中。

3. 运算符创建一个可以被评估为true或false的条件。与该WHERE子句一起使用的常用运算符是：

```
= 等于
!= 不等于
> 大于
< 少于
>= 大于或等于
<= 小于或等于
```

### 查询(LIKE)

```
SELECT * FROM movies HERE name LIKE 'Se_en';
```
LIKE当你想比较类似的值时，可以是一个有用的操作符。在这里，我们正在比较两部名称相同但拼写不一的电影。

```
1. LIKE是与WHERE子句一起使用的特殊操作符，用于搜索列中的特定模式。
2. name LIKE Se_en是评估name特定模式的列的条件。
3. Se_en表示具有通配符的模式。这种_方式可以在这里替代任何个人的角色，而不会破坏模式。名称Seven和Se7en两者匹配这种模式。
```

### 查询(%)
%是可以使用的另一个通配符LIKE
```
SELECT * FROM movies WHERE name LIKE 'A%';
```
% 是一个通配符，在该模式中匹配零个或多个缺失的字母。
A% 匹配所有电影，其名称以“A”开头
%a 匹配以“a”结尾的所有电影
%a% 匹配所有中间包含‘a’的电影


### 查询(BETWEEN)
```
SELECT * FROM movies WHERE name BETWEEN 'A'and 'J';
```
此语句将结果集过滤到仅包含以name“A”字母开头但不包括“J”的s的电影。

```
SELECT * FROM movies WHERE year BETWEEN 1990 AND 2000;
```

在这个陈述中，BETWEEN运营商被用来过滤结果集，只包括year1990年至2000年之间的电影。


### 查询(AND)
```
SELECT * FROM movies WHERE year BETWEEN 1990 and 2000 AND genre = 'comedy';
```
有时你想在一个WHERE子句中组合多个条件，使结果集更加具体和有用。这样做的一个方法是使用AND操作符。

1. year BETWEEN 1990 and 2000是该WHERE条款的第一个条件。

2. AND genre = 'comedy'是该WHERE条款中的第二个条件。

3. AND是组合两个条件的运算符。对于要包含在结果集中的行，两个条件都必须为true。在这里，我们使用AND操作员只返回1990年至2000年期间也是喜剧的电影。

### 查询(OR)
```
SELECT * FROM movies WHERE genre = 'comedy' OR year < 1980;

```
该OR运营商还可以使用一个以上条件的组合中的WHERE条款。所述OR操作者将分别评估每个条件，并且如果任何一个条件都为真，则该行被添加到结果集。

1. WHERE genre = 'comedy'是该WHERE条款的第一个条件。

2. OR year < 1980是该WHERE条款中的第二个条件。

3. OR是将结果集过滤到仅包含条件为真的行的操作符。在这里，我们回来有一种喜剧类型的电影或1980年以前发行的电影。


### 查询(ORDER BY, DESC, ASC)
```
SELECT * FROM movies ORDER BY imdb_rating DESC;
```

您可以使用查询结果排序ORDER BY。对结果进行排序通常会使数据更有用和更易于分析。

1. ORDER BY是一个子句，表示您想按字母顺序或数字排列特定列的结果集。

2. imdb_rating是要排序的列的名称。

3. DESC是SQL中的一个关键字，用于ORDER BY按照降序（从高到低或ZA）排序结果。在这里，它按照IMDb评级将所有电影从最高到最低。

也可以按升序对结果进行排序。ASC是SQL中的一个关键字，用于ORDER BY按升序排列结果（从低到高或AZ）。

```
SELECT * FROM movies ORDER BY imdb_rating ASC;
```

### 查询(LIMIT)
```
SELECT * FROM movies ORDER BY imdb_rating DESC LIMIT 3;
```

有时甚至过滤的结果可以在大数据库中返回数千行。在这些情况下，重要的是将结果集中的行数加起来。

LIMIT是一个允许您指定结果集将具有的最大行数的子句。在这里，我们指定结果集不能有三行以上。




