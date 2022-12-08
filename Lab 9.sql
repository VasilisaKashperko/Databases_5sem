---------------------- Task1 ----------------------

select * from user_sys_privs;
select * from session_privs;
select * from user_tablespaces;

grant create table to SYSTEM;

grant create view to SYSTEM;

grant dba to SYSTEM;

grant create session to SYSTEM;

grant create sequence to SYSTEM;

grant create cluster to SYSTEM;

grant create synonym to SYSTEM;

grant create public synonym to SYSTEM;

grant create MATERIALIZED view to SYSTEM;

commit;

alter user SYSTEM quota unlimited on users;

---------------------- Task 2 ----------------------

create sequence S1
        increment by 10
        start with 1000
        nominvalue
        nomaxvalue
        nocycle
        nocache
        noorder;
commit;

select S1.nextval from dual;

select S1.currval from dual;

select S1.currval, S1.nextval from dual; 

drop sequence S1;
commit;

---------------------- Task 3-4 ----------------------

create sequence S2
    start with 10
    increment by 10
    maxvalue 100
    nocycle;
commit;

select S2.nextval from dual;
select S2.currval from dual;
alter sequence S2 increment by 100;
alter sequence S2 increment by 10;

drop sequence S2;
commit;

---------------------- Task 5 ----------------------

create sequence S3
    start with 10
    increment by -10
    minvalue -100
    maxvalue 20
    nocycle
    order;
commit;

select S3.nextval from dual;
select S3.currval from dual;

alter sequence S3 increment by -100;
alter sequence S3 increment by -10;

drop sequence S3;
commit;

---------------------- Task 6 ----------------------

create sequence S4
    start with 1
    increment by 1
    maxvalue 10
    cycle
    cache 5
    noorder;
commit;

select S4.nextval from dual;
select S4.currval from dual;

drop sequence S4;
commit;

---------------------- Task 7 ----------------------

SELECT * FROM SYS.all_sequences WHERE SEQUENCE_OWNER = 'SYSTEM';

---------------------- Task 8 ----------------------

create table T1 (
        N1 NUMBER(20),
        N2 NUMBER(20),
        N3 NUMBER(20),
        N4 NUMBER(20))
        cache storage(buffer_pool keep);
commit;

insert into T1(N1, N2, N3, N4) values(S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);
commit;

select * from T1;

drop table T1;

---------------------- Task 9 ----------------------

create cluster ABC (
      X number(10),
      V varchar2(12))
      hashkeys 200;
commit;

select * from all_clusters where owner='SYSTEM';

drop cluster ABC;

---------------------- Task 10 ----------------------

create table A(
                 XA number(10),
                 VA varchar2(12), 
                 AA number(10))
                 cluster ABC (XA, VA); 
                 
drop table A;

---------------------- Task 11 ----------------------

create table B(XB number(10),
                VB varchar2(12), 
                BB number(10))
                cluster ABC (XB, VB); 

drop table B;

---------------------- Task 12 ----------------------

create table C(XC number(10),
                VC varchar2(12), 
                CC number(10))
                cluster ABC (XC, VC); 
                
drop table C;    

---------------------- Task 13 ----------------------

select * from user_tables;

select * from user_clusters;

---------------------- Task 14 ----------------------

create synonym SYNONC for C;
commit;

select * from SYNONC;

drop synonym SYNONC;

---------------------- Task 15 ----------------------

create public synonym SYNONB for B;
commit;

select * from SYNONB;

drop public synonym SYNONB;

---------------------- Task 16 ----------------------

create table FirstTable(
    x number(21), 
    y varchar(12),
    constraint x_pk primary key (x)
    );
    
create table SecondTable(
    i number(21),
    j varchar(12), 
    constraint i_fk foreign key (i) references FirstTable(x)
    );
commit;

insert into FirstTable (x, y) values (1,'v');
insert into FirstTable (x, y) values (2,'a');
insert into FirstTable (x, y) values (3,'s');
insert into FirstTable (x, y) values (4,'i');

insert into SecondTable (i, j) values (1,'l');
insert into SecondTable (i, j) values (2,'i');
insert into SecondTable (i, j) values (3,'s');
insert into SecondTable (i, j) values (4,'a');
commit;

select * from FirstTable;
select * from SecondTable;

create view ThisIsAView as select FirstTable.x,
                                                   FirstTable.y as FirstT,
                                                   SecondTable.j as SecondT
from FirstTable inner join SecondTable on FirstTable.x=SecondTable.i;
commit;

select * from ThisIsAView;

drop view ThisIsAView;

drop table FirstTable;

drop table SecondTable;

---------------------- Task 17 ----------------------

create materialized view MaterialView
build immediate
refresh complete on demand next sysdate+numtodsinterval(2,'minute')
as select * from FirstTable;
commit;

select * from MaterialView;

insert into FirstTable(x,y) values (5, 'laboratory');
insert into FirstTable(x,y) values (6, 'work');
commit;

drop materialized view MaterialView;
commit;
