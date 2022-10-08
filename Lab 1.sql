------------------- Task 1 -------------------

drop table KVS_t1;
drop table KVS_t;
create table KVS_t (x number(3) primary key, s varchar2(50));

------------------- Task 2 -------------------

insert into kvs_t (x,s) values (1, 'hey');
insert into kvs_t (x,s) values (2, 'hello');
insert into kvs_t (x,s) values (3, 'world');

commit;

select * from kvs_t;

------------------- Task 3 -------------------

update kvs_t set x=0 where x=1;
update kvs_t set x=1 where x=2;
update kvs_t set x=2 where x=3;

commit;

select * from kvs_t;

------------------- Task 4 -------------------

select s
from kvs_t
where s = 'world' or s = 'hey'
order by s asc;

select count(*) from kvs_t;

------------------- Task 5 -------------------

delete from kvs_t where x = 0;
commit;

select * from kvs_t;

------------------- Task 6 -------------------

create table KVS_t1
(
  id_x number(3),
  d varchar2(20),
  constraint ID_FK
  foreign key (id_x) references kvs_t(x)
);

insert into kvs_t1 values (1, 'The first');
insert into kvs_t1 values (2, 'The second');

commit;

select * from kvs_t1;

------------------- Task 7 -------------------

select * from kvs_t;
select * from kvs_t1;

select kvs_t.s, kvs_t1.d
from kvs_t
join kvs_t1 on kvs_t.x = kvs_t1.id_x;



