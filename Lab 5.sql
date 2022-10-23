------------------- TASK 1 -------------------
-- Список всех файлов табличных пространств (перманентных  и временных)

select TABLESPACE_NAME, STATUS, contents logging from SYS.DBA_TABLESPACES;

------------------- TASK 2 -------------------

create table KVS_T2 
(
    str varchar2(50)
) tablespace KVS_QDATA;

insert into KVS_T2 values (1);
insert into KVS_T2 values (2);
insert into KVS_T2 values (3);

select * from KVS_T2;

------------------- TASK 3 -------------------
-- Список сегментов табличного пространства

select * from dba_segments where tablespace_name = 'KVS_QDATA'; 
select * from dba_segments where segment_name = 'KVS_T2';
select * from dba_segments;

------------------- TASK 4 -------------------

drop table KVS_T2;
select * from dba_segments where tablespace_name = 'KVS_QDATA'; 
select * from user_recyclebin;
-- Имя удалённого сегмента изменяется на "entry" в recyclebin

select * 
from dba_segments inner join user_recyclebin on segment_name = object_name
where tablespace_name = 'KVS_QDATA';

------------------- TASK 5 -------------------
-- Восстановите (FLASHBACK) удаленную таблицу

flashback table KVS_T2 to before drop;
select * from dba_segments where tablespace_name = 'KVS_QDATA'; 

------------------- TASK 6 -------------------
-- PL/SQL script

begin
    for loop_counter in 1..10000 
    loop
        insert into KVS_T2 values (dbms_random.random);
    end loop;
end;

------------------- TASK 7 -------------------
-- Cколько в сегменте таблицы экстентов, их размер в блоках и байтах. Получите перечень всех экстентов. 

select segment_name, extents, blocks, bytes from dba_segments
where segment_name = 'KVS_T2';

select * from user_extents where segment_name = 'KVS_T2';

------------------- TASK 8 -------------------
-- Удалите табличное пространство и его файл. 

drop tablespace KVS_QDATA including contents and datafiles;

------------------- TASK 9 -------------------
-- Перечень всех групп журналов повтора. Определите текущую группу журналов повтора.

select GROUP#, STATUS, MEMBERS from v$log;

------------------- TASK 10 -------------------
-- Перечень файлов всех журналов повтора инстанса

select GROUP#, MEMBER from v$logfile;

------------------- TASK 11 -------------------
-- С помощью переключения журналов повтора пройдите полный цикл переключений.
-- Запишите серверное время в момент вашего первого переключения (оно понадобится для выполнения следующих заданий)

alter system switch logfile;
select GROUP#, STATUS, MEMBERS from v$log;

alter system switch logfile;
select GROUP#, STATUS, MEMBERS from v$log;

alter system switch logfile;
select GROUP#, STATUS, MEMBERS from v$log;

commit;

------------------- TASK 12 -------------------
-- Создайте дополнительную группу журналов повтора с тремя файлами журнала

alter database add logfile group 4 'D:\OracleDB\oradata\ORCL\REDO4.log' size 50m blocksize 512;
alter database add logfile member 'D:\OracleDB\oradata\ORCL\REDO41.log' to group 4;
alter database add logfile member 'D:\OracleDB\oradata\ORCL\REDO42.log' to group 4;


alter system switch logfile;
select GROUP#, STATUS, MEMBERS, FIRST_CHANGE# from v$log;

------------------- TASK 13 -------------------
-- Удалите созданную группу журналов повтора. Удалите созданные вами файлы журналов на сервере.

alter database drop logfile member 'D:\OracleDB\oradata\ORCL\REDO41.log';
alter database drop logfile member 'D:\OracleDB\oradata\ORCL\REDO42.log';
-- необходимо перед удалением группы
alter system checkpoint;

alter database drop logfile group 4;
select GROUP#, STATUS, MEMBERS from v$log;

------------------- TASK 14 -------------------
-- Определите, выполняется или нет архивирование журналов повтора 

select GROUP#, ARCHIVED from v$log;

------------------- TASK 15 -------------------
-- Определите номер последнего архива

select * from V$ARCHIVED_LOG;

------------------- TASK 16 -------------------
-- Включите архивирование

-- cmd
-- sqlplus / as sysdba

shutdown immediate;
startup mount;
alter database archivelog;
alter database open;

------------------- TASK 17 -------------------
-- Принудительно создайте архивный файл. Определите его номер. Определите его местоположение и убедитесь в его наличии. Проследите последовательность SCN в архивах и журналах повтора. 
-- проверка, в sqldeveloper

select name, log_mode from v$database;
select GROUP#, ARCHIVED from v$log;
select * from V$ARCHIVED_LOG;

-- архивный файл появляется после переключения журнала
alter system switch logfile;
select * from V$ARCHIVED_LOG;

------------------- TASK 18 -------------------
-- Отключите архивирование. 
-- cmd
-- sqlplus / as sysdba

shutdown immediate;
startup mount;
alter database noarchivelog;
alter database open;

-- проверка

select name, log_mode from v$database;

------------------- TASK 19 -------------------
-- Управляющие файлы

select * from v$controlfile;
show parameter control;

------------------- TASK 20 -------------------
-- Содержимое управляющего файла
select * from v$controlfile_record_section;

------------------- TASK 21 -------------------
-- 21. Определите местоположение файла параметров инстанса. Убедитесь в наличии этого файла. 

select * from v$parameter;

show parameter spfile; 

------------------- TASK 22 -------------------
-- 22. Сформируйте PFILE с именем XXX_PFILE.ORA. Исследуйте его содержимое. Поясните известные вам параметры в файле

connect sys/167943 as sysdba;
create pfile = 'KVS_PFILE.ORA' from spfile;

------------------- TASK 23 -------------------
-- 23. Определите местоположение файла паролей инстанса. Убедитесь в наличии этого файла
-- в папке, в которой был spfile: обычно начинается на PW и заканчивается на .ora
show parameter remote_login_passwordfile; 

------------------- TASK 24 -------------------
-- Получите перечень директориев для файлов сообщений и диагностики

select * from v$diag_info;
-- diag trace ->> default trace file

------------------- TASK 25 -------------------
-- Найдите и исследуйте содержимое протокола работы инстанса (LOG.XML), найдите в нем команды переключения журналов которые вы выполняли.
-- расположение alert.xml
 SELECT name,VALUE FROM V$DIAG_INFO where name = 'Diag Alert';
 
 
