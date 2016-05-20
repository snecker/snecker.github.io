打开监控
======
```sql
> SET profiling = 1;
> show profiles;

```
结果:

| Query_ID | Duration | Query | 
| -: | -: | - | 
| 1 | 0.00054125 | explain   select * from t_sales_bill where  date(last_update_date) = '2016-03-02' | 
| 2 | 0.00045175 | explain   select last_update_date from t_sales_bill where  ...| 
| 3 | 0.00027050 | SHOW WARNINGS LIMIT 5 | 

索引选择性
=========

> 索引的选择性（Selectivity），是指不重复的索引值（也叫基数，Cardinality）与表记录数（#T）的比值：
有关的索引优化策略叫做***前缀索引***,就是用列的前缀代替整个列作为索引key，当前缀长度合适时，
可以做到既使得前缀索引的选择性接近全列索引，同时因为索引key变短而减少了索引文件的大小和维护开销。

长度的选择:接近全名的索引选择性并且长度短的优先.


举例:

```sql
SELECT count(DISTINCT(title))/count(*) AS Selectivity FROM employees.titles;

ALTER TABLE employees.employees
ADD INDEX `first_name_last_name4` (first_name, last_name(4));

```

缺点:
- 不能用于order by ,group by