DROP TABLE COOKIES;
alter database open;
CREATE TABLE COOKIES
(
    Id NUMERIC,
    Name VARCHAR(20),
    Mark NUMBER(4,2),
    Production DATE
);

SELECT * FROM COOKIES;

--cd "D:\Учеба в БГТУ\БД\Lab 18"
--sqlldr userid='sys/Pa$$w0rd@KVSPDB' "control='D:\Учеба в БГТУ\БД\Lab 18\LoadCookies.ctl'"

--conn sys/Pa$$w0rd@KVSPDB
-- spool cookies.txt // в файл выводит данные
-- select * from COOKIES;
-- spool off;