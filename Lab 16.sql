---------------- Task 1 ---------------- 
-- �������� ������� T_RANGE c ����������� ����������������. ����������� ���� ��������������� ���� NUMBER.

CREATE TABLE T_RANGE
(
    Num NUMERIC(3, 0)
)
PARTITION BY RANGE (Num)
(
    PARTITION LOWER_500 VALUES LESS THAN (500),
    PARTITION T_RANGE_DEFAULT VALUES LESS THAN (MAXVALUE)
)
ENABLE ROW MOVEMENT;

---------------- Task 2 ---------------- 
-- �������� ������� T_INTERVAL c ������������ ����������������. ����������� ���� ��������������� ���� DATE.

CREATE TABLE T_INTERVAL
(
    SomeDate DATE
)
PARTITION BY RANGE (SomeDate)
INTERVAL (INTERVAL '1' MONTH)
(
    PARTITION UNDER_2015 VALUES LESS THAN (TO_DATE('01-JAN-2015','dd-MON-yyyy'))
);

---------------- Task 3 ---------------- 
-- �������� ������� T_HASH c ���-����������������. ����������� ���� ��������������� ���� VARCHAR2.

CREATE TABLE T_HASH
(
    SomeText VARCHAR2(50)
)
PARTITION BY HASH (SomeText)
PARTITIONS 2
ENABLE ROW MOVEMENT;

---------------- Task 4 ---------------- 
-- �������� ������� T_LIST �� ��������� ����������������. ����������� ���� ��������������� ���� CHAR.

CREATE TABLE T_LIST
(
    SomeChar CHAR
)
PARTITION BY LIST (SomeChar)
(
    PARTITION ABC VALUES ('A', 'B', 'C'),
    PARTITION OTHER_CHAR VALUES (DEFAULT)
)
ENABLE ROW MOVEMENT;

---------------- Task 5 ---------------- 
-- ������� � ������� ���������� INSERT ������ � ������� T_RANGE, T_INTERVAL, T_HASH, T_LIST.
-- ������ ������ ���� ������, ����� ��� ������������ �� ���� �������. ����������������� ��� � ������� SELECT �������.

INSERT INTO T_RANGE VALUES (300);
INSERT INTO T_RANGE VALUES (600);

INSERT INTO T_INTERVAL VALUES(TO_DATE('01-JAN-2019','dd-MON-yyyy'));
INSERT INTO T_INTERVAL VALUES(TO_DATE('01-JAN-2013','dd-MON-yyyy'));

INSERT INTO T_HASH VALUES ('1');
INSERT INTO T_HASH VALUES ('Hello World! Hello World! Hello World!');

INSERT INTO T_LIST VALUES('A');
INSERT INTO T_LIST VALUES('K');

SELECT * FROM USER_TAB_PARTITIONS;
SELECT * FROM T_RANGE PARTITION (LOWER_500);
SELECT * FROM T_RANGE PARTITION (T_RANGE_DEFAULT);
SELECT * FROM T_INTERVAL PARTITION (UNDER_2015);
SELECT * FROM T_INTERVAL PARTITION (SYS_P448); --autonaming
SELECT * FROM T_HASH PARTITION (SYS_P445); --autonaming
SELECT * FROM T_HASH PARTITION (SYS_P446); --autonaming
SELECT * FROM T_LIST PARTITION (ABC);
SELECT * FROM T_LIST PARTITION (OTHER_CHAR);

SELECT * FROM T_INTERVAL;
SELECT * FROM T_INTERVAL PARTITION (SYS_P448);
SELECT * FROM T_INTERVAL PARTITION (SYS_P447);
SELECT * FROM T_INTERVAL PARTITION (UNDER_2015);

-- DROP TABLE T_RANGE;
-- DROP TABLE T_INTERVAL;
-- DROP TABLE T_HASH;
-- DROP TABLE T_LIST;

---------------- Task 6 ---------------- 
-- ����������������� ��� ���� ������ ������� ����������� ����� ����� ��������, ��� ��������� (�������� UPDATE) ����� ���������������.

UPDATE T_RANGE SET NUM = 501 WHERE NUM = 300;
UPDATE T_INTERVAL SET SOMEDATE = '02-JAN-2019' WHERE SOMEDATE = '01-JAN-2017';
UPDATE T_HASH SET SOMETEXT = 'HELLO WORLD! HELLO WORLD! HELLO WORLD!' WHERE SOMETEXT = '1';
UPDATE T_LIST SET SOMECHAR = 'P' WHERE SOMECHAR = 'A';

---------------- Task 7 ---------------- 
-- ��� ����� �� ������ ����������������� �������� ��������� ALTER TABLE SPLIT.

ALTER TABLE T_RANGE SPLIT PARTITION T_RANGE_DEFAULT INTO
    (
        PARTITION LOWER_750 VALUES LESS THAN (750),
        PARTITION T_RANGE_DEFAULT
    );
SELECT * FROM USER_TAB_PARTITIONS WHERE TABLE_NAME = 'T_RANGE';

---------------- Task 8 ---------------- 
-- ��� ����� �� ������ ����������������� �������� ��������� ALTER TABLE MERGE.

ALTER TABLE T_RANGE MERGE PARTITIONS LOWER_750, T_RANGE_DEFAULT INTO PARTITION T_RANGE_DEFAULT;
SELECT * FROM USER_TAB_PARTITIONS WHERE TABLE_NAME = 'T_RANGE';

---------------- Task 9 ---------------- 
-- ��� ����� �� ������ ����������������� �������� ��������� ALTER TABLE EXCHANGE.

CREATE TABLE T_RANGE_ADDITIONAL
(
    Num NUMERIC(3, 0)
);
INSERT INTO T_RANGE_ADDITIONAL VALUES (0);

ALTER TABLE T_RANGE EXCHANGE PARTITION T_RANGE_DEFAULT WITH TABLE T_RANGE_ADDITIONAL WITHOUT VALIDATION;
SELECT * FROM T_RANGE PARTITION (T_RANGE_DEFAULT);
SELECT * FROM USER_TAB_PARTITIONS WHERE TABLE_NAME = 'T_RANGE';

-- ��������������� �� ������
-- ����������� ���������������