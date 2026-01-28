CREATE TABLE table_1 (
id int primary key,
name nvarchar(20)
)
CREATE TABLE table_2 (
id int primary key,
name nvarchar(20)
)
-- insert table1 on table1
insert into table_1(id,name)
SELECT t2.id,t2.name FROM table_2 t2 WHERE t2.name not in
(SELECT t1.name FROM table_1 t1)
-- check table1 this  
SELECT t2.name FROM table_2 t2 WHERE t2.name  in
(SELECT t1.name FROM table_1 t1)

select t1.name from table_1 t1
where exists
(select 1 name from table_2)

select t1.name from table_1 t1
where not exists
(select 1 name from table_2)

UPDATE t1
SET
t1.name = t2.name
FROM table_2 t2
JOIN table_1 t1
on t1.id = t2.id
WHERE t1.name != t2.name


DELETE t1 from table_1 t1 where not exists
(select * from table_2 t2 where t2.id = t1.id  )

delete from table_2 where name = 'www' 