------------------- TASK 1 -------------------
--	Общий размер области SGA
select * from V$SGA;
select SUM(value) from v$sga;

------------------- TASK 2 -------------------
--	Текущие размеры основных пулов SGA
select * from v$sga_dynamic_components  where current_size > 0;

------------------- TASK 3 -------------------
--	Размеры гранулы для каждого пула
select component, granule_size from v$sga_dynamic_components  where current_size > 0;

------------------- TASK 4 -------------------
--	Объем доступной свободной памяти в SGA
select current_size from v$sga_dynamic_free_memory;

------------------- TASK 5 -------------------
--	Размеры пулов КЕЕP, DEFAULT и RECYCLE буферного кэша
select component, current_size, min_size from v$sga_dynamic_components  where component='KEEP buffer cache' or component='DEFAULT buffer cache' or component='RECYCLE buffer cache'; 

------------------- TASK 6 -------------------
--	Таблица помещается в пул KEEP (для предотвращения их удаления из буферного кэша им можно назначить постоянный буферный пул)
create table MyTable(x int) storage(buffer_pool keep);
select segment_name, segment_type, tablespace_name, buffer_pool from user_segments where lower(segment_name) like '%mytable%';
drop table MyTable;

------------------- TASK 7 -------------------
--	Таблица кешируется в пуле default
select segment_name, segment_type, tablespace_name, buffer_pool from user_segments where lower(segment_name)='mytable2';

------------------- TASK 8 -------------------
--	Размеры пулов КЕЕP, DEFAULT и RECYCLE буферного кэша (буфера журнала повторов)
show parameter log_buffer;

------------------- TASK 9 -------------------
-- 10 самых больших объектов в разделяемом пуле
select *from (select pool, name, bytes from v$sgastat where pool = 'shared pool' order by bytes desc) where rownum <=10;

------------------- TASK 10 -------------------
-- Размер свободной памяти в большом пуле
select pool, name, bytes from v$sgastat where pool = 'large pool' and name = 'free memory';

------------------- TASK 11 -------------------
-- Перечень текущих соединений с инстансом 
select * from v$session;

------------------- TASK 12 -------------------
-- Режимы текущих соединений с инстансом (dedicated, shared).
select username, server from v$session;

------------------- TASK 13 -------------------
-- Найдите самые часто используемые объекты в базе данных