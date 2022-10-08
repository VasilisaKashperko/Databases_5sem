------------------- Task 1 -------------------

create tablespace TS_KVS
  datafile 'D:\Учеба в БГТУ\БД\Tablespaces\TS_KVS.dbf'
  size 7m
  autoextend on next 5m
  maxsize 20m;
  
-- drop tablespace TS_KVS;

------------------- Task 2 -------------------

create temporary tablespace TS_KVS_TEMP
  tempfile 'D:\Учеба в БГТУ\БД\Tablespaces\TS_KVS_TEMP.dbf'
  size 5m
  autoextend on next 3m
  maxsize 30m;
commit;

-- drop tablespace TS_KVS_TEMP;

------------------- Task 3 -------------------

select TABLESPACE_NAME from SYS.DBA_TABLESPACES; -- tablespaces
select FILE_NAME, TABLESPACE_NAME from DBA_DATA_FILES;      -- database files
select FILE_NAME, TABLESPACE_NAME from DBA_TEMP_FILES;      -- temp database files

------------------- Task 4 -------------------

alter session set "_ORACLE_SCRIPT" = true;

-- After using this alter session statement, you can create user
-- using the name as specified (testuser).

create role RL_KVSCORE;

grant create session,
         create table, drop any table,
         create view, drop any view,
         create procedure, drop any procedure
         to RL_KVSCORE;
commit;

-- drop role  RL_KVSCORE;

------------------- Task 5 -------------------

select * from dba_roles where ROLE = 'RL_KVSCORE';
select * from dba_sys_privs where grantee = 'RL_KVSCORE';

select * from dba_roles;
select * from dba_sys_privs;

------------------- Task 6 -------------------

alter session set "_ORACLE_SCRIPT"=true;

create profile PF_KVSCORE limit
    password_life_time unlimited -- количество дней жизни пароля
    sessions_per_user 3 -- количество сессий пользователя
    failed_login_attempts 30 -- количество попыток входа
    password_lock_time 1 -- количество дней блокирования после ошибок
    password_reuse_time 10 -- количество дней предупреждений о смене пароля
    connect_time 180 -- время соединения, минуты
    idle_time 30; -- количество минут простоя

------------------- Task 7 -------------------

select * from DBA_PROFILES;
select * from DBA_PROFILES  where PROFILE='PF_KVSCORE';
select * from DBA_PROFILES  where PROFILE='DEFAULT';

------------------- Task 8 -------------------

alter session set "_ORACLE_SCRIPT"=true;

create user KVSCORE identified by 12345
    default tablespace TS_KVS quota unlimited on TS_KVS
    temporary tablespace TS_KVS_TEMP
    profile PF_KVSCORE
    account unlock
    password expire; -- срок действия пароля истёк

grant RL_KVSCORE to KVSCORE;

-- drop user KVSCORE cascade;

------------------- Task 9 -------------------

-- done in SQL Plus

------------------- Task 10 -------------------

create table admirers (
    firstName varchar2(20),
    age number(2)
);

insert  into admirers(firstName, age) VALUES ('Youri', 22);

-- drop table admirers;

create view view_admirers (firstName, age) as select * from admirers;

-- drop view view_admirers;

------------------- Task 11 -------------------

create tablespace KVS_QDATA
    datafile 'D:\Учеба в БГТУ\БД\Tablespaces\KVS_QDATA.dbf'
    size 10m
    autoextend on next 5m
    maxsize 20m
    offline;
    
alter tablespace KVS_QDATA online;

--drop tablespace KVS_QDATA;

alter user KVSCORE quota 2m on KVS_QDATA;

create table cookies (
    title varchar2(40),
    taste varchar2(40)
)tablespace KVS_QDATA;

insert  into cookies(title, taste) VALUES ('Весенняя рапсодия', 'Шоколадовые печеньки');
insert  into cookies(title, taste) VALUES ('Орешки с вареной сгущенкой', 'Вкусные');
insert  into cookies(title, taste) VALUES ('Песочное печенье', 'Полный отстой');
insert  into cookies(title, taste) VALUES ('Орешки с шоколадом', 'Печеньковые орешки с шоколадом внутри');

commit;

-- drop table cookies;

create view view_cookies (title, taste) as select * from cookies;
select * from view_cookies;
