--1
-- Подключитесь к серверу ORA12D. Создайте DBLINK по схеме USER1-USER2 для подключения к вашей базе данных (ваша БД находится на сервере ORA12W). 
DROP DATABASE LINK pdb;

CREATE DATABASE LINK pdb 
   CONNECT TO KVSCORE
   IDENTIFIED BY "Pa$$w0rd"
   USING 'ORCL1';
commit;

select * from COOKIES@pdb;

--drop database link oracle2;


--2
--	Продемонстрируйте выполнение операторов SELECT, INSERT, UPDATE, DELETE, вызов процедур и функций с объектами удаленного сервера.
select * from COOKIES@pdb;

insert into COOKIES@pdb (x, y) values (1, 2);
insert into COOKIES@pdb (x, y) values (3, 4);
insert into COOKIES@pdb (x, y) values (5, 6);

update COOKIES@pdb set x = 2 where y = 2;

delete COOKIES@pdb where y > 0;
commit;

select COOKIES@pdb(2, 4) from dual;

declare
  y number;
begin
  y := 0;
  return_10@pdb(y);
  dbms_output.put_line(y);
end;

--3
-- 	Создайте DBLINK по схеме USER - GLOBAL.

DROP DATABASE LINK pdb2;

CREATE PUBLIC DATABASE LINK pdb2 
   CONNECT TO system
   IDENTIFIED BY "Pa$$w0rd"
   USING 'ORCL1';
commit;

--4
-- 	Продемонстрируйте выполнение операторов SELECT, INSERT, UPDATE, DELETE, вызов процедур и функций с объектами удаленного сервера
select * from COOKIES@pdb2;

insert into COOKIES@pdb2 (x, y) values (1, 2);
insert into COOKIES@pdb2 (x, y) values (3, 4);
insert into COOKIES@pdb2l (x, y) values (5, 6);

update COOKIES@pdb2 set x = 2 where y = 2;

delete COOKIES@pdb2l where y > 0;
commit;

select custom_sum@pdb2(2, 4) from dual;

declare
  y number;
begin
  y := 0;
  return_10@pdb2(y);
  dbms_output.put_line(y);
end;