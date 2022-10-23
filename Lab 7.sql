------------------- TASK 1 -------------------
-- �������� ������ ������ ������� ���������. 

ALTER SESSION SET "_ORACLE_SCRIPT" = true;

select * from v$bgprocess;

------------------- TASK 2 -------------------
-- ���������� ������� ��������, ������� �������� � �������� � ��������� ������.

select * from v$bgprocess where paddr != '00';

------------------- TASK 3 -------------------
-- ����������, ������� ��������� DBWn �������� � ��������� ������.

select count(*) from v$bgprocess where paddr!= '00' and name like 'DBW%';

------------------- TASK 4 -------------------
-- �������� �������� ������� ���������� � �����������.

select * from v$session;

------------------- TASK 5 -------------------
-- ���������� ������ ���� ����������.

select username, server from v$session;

------------------- TASK 6 -------------------
-- ���������� ������� (����� ����������� ����������).

select * from v$services;

------------------- TASK 7 -------------------
--	�������� ��������� ��� ��������� ���������� � �� ��������.

select * from v$dispatcher;
show parameter dispatchers;

------------------- TASK 8 -------------------

-- ������� � ������ Windows-�������� ������, ����������� ������� LISTENER.
-- TNSListener

select * from v$services;

------------------- TASK 9 -------------------
-- �������� �������� ������� ���������� � ���������. (dedicated, shared).

select * from v$session where username is not null;

select PADDR, USERNAME, SERVER from V$SESSION where USERNAME is not null;

select ADDR, SPID, PNAME from V$PROCESS where BACKGROUND is null order by PNAME;

------------------- TASK 10 -------------------
-- ����������������� � �������� ���������� ����� LISTENER.ORA. 
-- ������������: C:\app\Admin\product\12.1.0\dbhome_2\NETWORK\ADMIN\listener.ora

------------------- TASK 11 -------------------
-- ��������� ������� lsnrctl � �������� �� �������� �������.
--start LSNRCTL.exe

--lsnrctl
--help --> start, stop,status - ready, blocked, unknown
--services, version
--servacls - get access control lists
--reload - reload the parameter files and SIDs
--save_config - saves configuration changes to parameter file

------------------- TASK 12 -------------------
-- �������� ������ ����� ��������, ������������� ��������� LISTENER.
--LSNRCTL -> services


