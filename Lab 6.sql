------------------- TASK 1 -------------------
--	����� ������ ������� SGA
select * from V$SGA;
select SUM(value) from v$sga;

------------------- TASK 2 -------------------
--	������� ������� �������� ����� SGA
select * from v$sga_dynamic_components  where current_size > 0;

------------------- TASK 3 -------------------
--	������� ������� ��� ������� ����
select component, granule_size from v$sga_dynamic_components  where current_size > 0;

------------------- TASK 4 -------------------
--	����� ��������� ��������� ������ � SGA
select current_size from v$sga_dynamic_free_memory;

------------------- TASK 5 -------------------
--	������� ����� ���P, DEFAULT � RECYCLE ��������� ����
select component, current_size, min_size from v$sga_dynamic_components  where component='KEEP buffer cache' or component='DEFAULT buffer cache' or component='RECYCLE buffer cache'; 

------------------- TASK 6 -------------------
--	������� ���������� � ��� KEEP (��� �������������� �� �������� �� ��������� ���� �� ����� ��������� ���������� �������� ���)
create table MyTable(x int) storage(buffer_pool keep);
select segment_name, segment_type, tablespace_name, buffer_pool from user_segments where lower(segment_name) like '%mytable%';
drop table MyTable;

------------------- TASK 7 -------------------
--	������� ���������� � ���� default
select segment_name, segment_type, tablespace_name, buffer_pool from user_segments where lower(segment_name)='mytable2';

------------------- TASK 8 -------------------
--	������� ����� ���P, DEFAULT � RECYCLE ��������� ���� (������ ������� ��������)
show parameter log_buffer;

------------------- TASK 9 -------------------
-- 10 ����� ������� �������� � ����������� ����
select *from (select pool, name, bytes from v$sgastat where pool = 'shared pool' order by bytes desc) where rownum <=10;

------------------- TASK 10 -------------------
-- ������ ��������� ������ � ������� ����
select pool, name, bytes from v$sgastat where pool = 'large pool' and name = 'free memory';

------------------- TASK 11 -------------------
-- �������� ������� ���������� � ��������� 
select * from v$session;

------------------- TASK 12 -------------------
-- ������ ������� ���������� � ��������� (dedicated, shared).
select username, server from v$session;

------------------- TASK 13 -------------------
-- ������� ����� ����� ������������ ������� � ���� ������