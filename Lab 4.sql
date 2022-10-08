------------------- Task 1 -------------------

select con_uid, name, open_mode from v$pdbs;

------------------- Task 2 -------------------

select instance_number, instance_name, host_name from v$instance;

------------------- Task 3 -------------------

select comp_id, comp_name, version, status from dba_registry;

------------------- Task 4 -------------------

-- Database Configuration Assistant

alter pluggable database KVSPDB open;

------------------- Task 5 -------------------

select * from v$pdbs;

------------------- Task 6 -------------------

-- Connections -> KVS PDB SYS, KVS PDB

create tablespace TS_KVS_PDB
datafile 'D:\Учеба в БГТУ\БД\Tablespaces\TS_KVS_PDB.dbf'
size 7M
autoextend on next 5M
maxsize 20M
extent management local; 

create temporary tablespace TS_KVS_PDB_TEMP
tempfile 'D:\Учеба в БГТУ\БД\Tablespaces\TS_KVS_PDB_TEMP.dbf'
size 5M
autoextend on next 3M
maxsize 30M
extent management local;

alter session set "_ORACLE_SCRIPT"=true;

create role RL_KVSCORE_PDB;

grant create session,
      create table, drop any table,
      create view, drop any view,
      create procedure, drop any procedure
to RL_KVSCORE_PDB;

-- drop role RL_KVSCORE_PDB;

create profile PF_KVSCORE_PDB limit
    password_life_time unlimited -- количество дней жизни пароля
    sessions_per_user 3 -- количество сессий пользователя
    failed_login_attempts 30 -- количество попыток входа
    password_lock_time 1 -- количество дней блокирования после ошибок
    password_reuse_time 10 -- количество дней предупреждений о смене пароля
    connect_time 180 -- время соединения, минуты
    idle_time 30; -- количество минут простоя

create user U1_KVS_PDB identified by Pa$$w0rd
  default tablespace TS_KVS_PDB quota unlimited on TS_KVS_PDB
  temporary tablespace TS_KVS_PDB_TEMP
  profile PF_KVSCORE_PDB
  account unlock;
  
grant RL_KVSCORE_PDB to U1_KVS_PDB;
      
-- drop user U1_AYV_PDB;

------------------- Task 7 -------------------

-- Connections -> U1_KVS_PDB

create table KVS_table (i number);
insert into KVS_table values (1);

select * from KVS_table;

------------------- Task 8 -------------------

-- Connections -> KVS PDB SYS

select * from user_tablespaces;

select * from dba_data_files;
select * from dba_temp_files;

select * from dba_roles;
select * from dba_role_privs order by grantee;

select * from dba_profiles;
select * from dba_users;

select u.username, r.granted_role
  from dba_users u
  join dba_role_privs r on u.username = r.grantee;

------------------- Task 9 -------------------

-- Connections -> KVS

create user c##KVS identified by Pa$$w0rd
account unlock;

grant create session to C##KVS;

-- Connections -> KVS PDB
grant create session to C##KVS;

------------------- Task 11 -------------------

-- Connections -> KVS PDB

select * from v$session where username is not null;

------------------- Task 12 -------------------

select * from dba_data_files;

------------------- Task 13 -------------------

-- Connections -> KVS PDB SYS

alter pluggable database KVSPDB close immediate;
drop pluggable database KVSPDB;


-- drop all
drop user c##KVS cascade;
