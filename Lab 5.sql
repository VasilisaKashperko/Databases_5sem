------------------- TASK 1 -------------------
-- ������ ���� ������ ��������� ����������� (������������  � ���������)

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
-- ������ ��������� ���������� ������������

select * from dba_segments where tablespace_name = 'KVS_QDATA'; 
select * from dba_segments where segment_name = 'KVS_T2';
select * from dba_segments;

------------------- TASK 4 -------------------

drop table KVS_T2;
select * from dba_segments where tablespace_name = 'KVS_QDATA'; 
select * from user_recyclebin;
-- ��� ��������� �������� ���������� �� "entry" � recyclebin

select * 
from dba_segments inner join user_recyclebin on segment_name = object_name
where tablespace_name = 'KVS_QDATA';

------------------- TASK 5 -------------------
-- ������������ (FLASHBACK) ��������� �������

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
-- C������ � �������� ������� ���������, �� ������ � ������ � ������. �������� �������� ���� ���������. 

select segment_name, extents, blocks, bytes from dba_segments
where segment_name = 'KVS_T2';

select * from user_extents where segment_name = 'KVS_T2';

------------------- TASK 8 -------------------
-- ������� ��������� ������������ � ��� ����. 

drop tablespace KVS_QDATA including contents and datafiles;

------------------- TASK 9 -------------------
-- �������� ���� ����� �������� �������. ���������� ������� ������ �������� �������.

select GROUP#, STATUS, MEMBERS from v$log;

------------------- TASK 10 -------------------
-- �������� ������ ���� �������� ������� ��������

select GROUP#, MEMBER from v$logfile;

------------------- TASK 11 -------------------
-- � ������� ������������ �������� ������� �������� ������ ���� ������������.
-- �������� ��������� ����� � ������ ������ ������� ������������ (��� ����������� ��� ���������� ��������� �������)

alter system switch logfile;
select GROUP#, STATUS, MEMBERS from v$log;

alter system switch logfile;
select GROUP#, STATUS, MEMBERS from v$log;

alter system switch logfile;
select GROUP#, STATUS, MEMBERS from v$log;

commit;

------------------- TASK 12 -------------------
-- �������� �������������� ������ �������� ������� � ����� ������� �������

alter database add logfile group 4 'D:\OracleDB\oradata\ORCL\REDO4.log' size 50m blocksize 512;
alter database add logfile member 'D:\OracleDB\oradata\ORCL\REDO41.log' to group 4;
alter database add logfile member 'D:\OracleDB\oradata\ORCL\REDO42.log' to group 4;


alter system switch logfile;
select GROUP#, STATUS, MEMBERS, FIRST_CHANGE# from v$log;

------------------- TASK 13 -------------------
-- ������� ��������� ������ �������� �������. ������� ��������� ���� ����� �������� �� �������.

alter database drop logfile member 'D:\OracleDB\oradata\ORCL\REDO41.log';
alter database drop logfile member 'D:\OracleDB\oradata\ORCL\REDO42.log';
-- ���������� ����� ��������� ������
alter system checkpoint;

alter database drop logfile group 4;
select GROUP#, STATUS, MEMBERS from v$log;

------------------- TASK 14 -------------------
-- ����������, ����������� ��� ��� ������������� �������� ������� 

select GROUP#, ARCHIVED from v$log;

------------------- TASK 15 -------------------
-- ���������� ����� ���������� ������

select * from V$ARCHIVED_LOG;

------------------- TASK 16 -------------------
-- �������� �������������

-- cmd
-- sqlplus / as sysdba

shutdown immediate;
startup mount;
alter database archivelog;
alter database open;

------------------- TASK 17 -------------------
-- ������������� �������� �������� ����. ���������� ��� �����. ���������� ��� �������������� � ��������� � ��� �������. ���������� ������������������ SCN � ������� � �������� �������. 
-- ��������, � sqldeveloper

select name, log_mode from v$database;
select GROUP#, ARCHIVED from v$log;
select * from V$ARCHIVED_LOG;

-- �������� ���� ���������� ����� ������������ �������
alter system switch logfile;
select * from V$ARCHIVED_LOG;

------------------- TASK 18 -------------------
-- ��������� �������������. 
-- cmd
-- sqlplus / as sysdba

shutdown immediate;
startup mount;
alter database noarchivelog;
alter database open;

-- ��������

select name, log_mode from v$database;

------------------- TASK 19 -------------------
-- ����������� �����

select * from v$controlfile;
show parameter control;

------------------- TASK 20 -------------------
-- ���������� ������������ �����
select * from v$controlfile_record_section;

------------------- TASK 21 -------------------
-- 21. ���������� �������������� ����� ���������� ��������. ��������� � ������� ����� �����. 

select * from v$parameter;

show parameter spfile; 

------------------- TASK 22 -------------------
-- 22. ����������� PFILE � ������ XXX_PFILE.ORA. ���������� ��� ����������. �������� ��������� ��� ��������� � �����

connect sys/167943 as sysdba;
create pfile = 'KVS_PFILE.ORA' from spfile;

------------------- TASK 23 -------------------
-- 23. ���������� �������������� ����� ������� ��������. ��������� � ������� ����� �����
-- � �����, � ������� ��� spfile: ������ ���������� �� PW � ������������� �� .ora
show parameter remote_login_passwordfile; 

------------------- TASK 24 -------------------
-- �������� �������� ����������� ��� ������ ��������� � �����������

select * from v$diag_info;
-- diag trace ->> default trace file

------------------- TASK 25 -------------------
-- ������� � ���������� ���������� ��������� ������ �������� (LOG.XML), ������� � ��� ������� ������������ �������� ������� �� ���������.
-- ������������ alert.xml
 SELECT name,VALUE FROM V$DIAG_INFO where name = 'Diag Alert';
 
 
