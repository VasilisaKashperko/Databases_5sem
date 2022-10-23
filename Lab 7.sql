------------------- TASK 1 -------------------
-- Получите полный список фоновых процессов. 

ALTER SESSION SET "_ORACLE_SCRIPT" = true;

select * from v$bgprocess;

------------------- TASK 2 -------------------
-- Определите фоновые процессы, которые запущены и работают в настоящий момент.

select * from v$bgprocess where paddr != '00';

------------------- TASK 3 -------------------
-- Определите, сколько процессов DBWn работает в настоящий момент.

select count(*) from v$bgprocess where paddr!= '00' and name like 'DBW%';

------------------- TASK 4 -------------------
-- Получите перечень текущих соединений с экземпляром.

select * from v$session;

------------------- TASK 5 -------------------
-- Определите режимы этих соединений.

select username, server from v$session;

------------------- TASK 6 -------------------
-- Определите сервисы (точки подключения экземпляра).

select * from v$services;

------------------- TASK 7 -------------------
--	Получите известные вам параметры диспетчера и их значений.

select * from v$dispatcher;
show parameter dispatchers;

------------------- TASK 8 -------------------

-- Укажите в списке Windows-сервисов сервис, реализующий процесс LISTENER.
-- TNSListener

select * from v$services;

------------------- TASK 9 -------------------
-- Получите перечень текущих соединений с инстансом. (dedicated, shared).

select * from v$session where username is not null;

select PADDR, USERNAME, SERVER from V$SESSION where USERNAME is not null;

select ADDR, SPID, PNAME from V$PROCESS where BACKGROUND is null order by PNAME;

------------------- TASK 10 -------------------
-- Продемонстрируйте и поясните содержимое файла LISTENER.ORA. 
-- Расположение: C:\app\Admin\product\12.1.0\dbhome_2\NETWORK\ADMIN\listener.ora

------------------- TASK 11 -------------------
-- Запустите утилиту lsnrctl и поясните ее основные команды.
--start LSNRCTL.exe

--lsnrctl
--help --> start, stop,status - ready, blocked, unknown
--services, version
--servacls - get access control lists
--reload - reload the parameter files and SIDs
--save_config - saves configuration changes to parameter file

------------------- TASK 12 -------------------
-- Получите список служб инстанса, обслуживаемых процессом LISTENER.
--LSNRCTL -> services


