---------------- Preparation -----------------

-- DROP TABLE FACULTY
CREATE TABLE FACULTY
  (
   FACULTY      CHAR(10)      NOT NULL,
   FACULTY_NAME VARCHAR2(50), 
   CONSTRAINT PK_FACULTY PRIMARY KEY(FACULTY) 
  );
     
delete FACULTY;
insert into FACULTY   (FACULTY,   FACULTY_NAME )
             values  ('ИДиП',   'Издателькое дело и полиграфия');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ХТиТ',   'Химическая технология и техника');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ЛХФ',     'Лесохозяйственный факультет');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ИЭФ',     'Инженерно-экономический факультет');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ТТЛП',    'Технология и техника лесной промышленности');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ТОВ',     'Технология органических веществ');

--------------------------------------------------------------------------------------------
-- DROP TABLE PULPIT
CREATE TABLE PULPIT 
(
 PULPIT       CHAR(10)      NOT NULL,
 PULPIT_NAME  VARCHAR2(100), 
 FACULTY      CHAR(10)      NOT NULL, 
 CONSTRAINT FK_PULPIT_FACULTY FOREIGN KEY(FACULTY)   REFERENCES FACULTY(FACULTY), 
 CONSTRAINT PK_PULPIT PRIMARY KEY(PULPIT) 
 ); 
 
delete PULPIT;  
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY )
             values  ('ИСиТ',    'Иформационный систем и технологий ',                         'ИДиП'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY )
             values  ('ПОиСОИ', 'Полиграфического оборудования и систем обработки информации ', 'ИДиП'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
              values  ('ЛВ',      'Лесоводства',                                                 'ЛХФ') ;         
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ОВ',      'Охотоведения',                                                 'ЛХФ') ;   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛУ',      'Лесоустройства',                                              'ЛХФ');           
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛЗиДВ',   'Лесозащиты и древесиноведения',                               'ЛХФ');                
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛПиСПС',  'Ландшафтного проектирования и садово-паркового строительства','ЛХФ');                  
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ТЛ',     'Транспорта леса',                                              'ТТЛП');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛМиЛЗ',  'Лесных машин и технологии лесозаготовок',                      'ТТЛП');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ОХ',     'Органической химии',                                           'ТОВ');            
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                              FACULTY)
             values  ('ТНХСиППМ','Технологии нефтехимического синтеза и переработки полимерных материалов','ТОВ');             
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('ТНВиОХТ','Технологии неорганических веществ и общей химической технологии ','ХТиТ');                    
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                                         FACULTY)
             values  ('ХТЭПиМЭЕ','Химии, технологии электрохимических производств и материалов электронной техники', 'ХТиТ');
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('ЭТиМ',    'экономической теории и маркетинга',                              'ИЭФ');   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('МиЭП',   'Менеджмента и экономики природопользования',                      'ИЭФ');    
------------------------------------------------------------------------------------------------------------------------        - DROP  TABLE TEACHER
CREATE TABLE TEACHER
 ( 
  TEACHER       CHAR(10) NOT  NULL,
  TEACHER_NAME  VARCHAR2(50), 
  PULPIT        CHAR(10) NOT NULL, 
  CONSTRAINT PK_TEACHER  PRIMARY KEY(TEACHER), 
  CONSTRAINT FK_TEACHER_PULPIT FOREIGN   KEY(PULPIT)   REFERENCES PULPIT(PULPIT)
 ) ;
 
 
delete  TEACHER;
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT )
                       values  ('СМЛВ',    'Смелов Владимир Владиславович',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('АКНВЧ',    'Акунович Станислав Иванович',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('КЛСНВ',    'Колесников Леонид Валерьевич',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ГРМН',    'Герман Олег Витольдович',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ЛЩНК',    'Лащенко Анатолий Пвалович',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('БРКВЧ',    'Бракович Андрей Игорьевич',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ДДК',     'Дедко Александр Аркадьевич',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('КБЛ',     'Кабайло Александр Серафимович',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('УРБ',     'Урбанович Павел Павлович',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('РМНК',     'Романенко Дмитрий Михайлович',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ПСТВЛВ',  'Пустовалова Наталия Николаевна', 'ИСиТ' );
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('?',     'Неизвестный',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                      values  ('ГРН',     'Гурин Николай Иванович',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ЖЛК',     'Жиляк Надежда Александровна',  'ИСиТ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('БРТШВЧ',   'Барташевич Святослав Александрович',  'ПОиСОИ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ЮДНКВ',   'Юденков Виктор Степанович',  'ПОиСОИ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('БРНВСК',   'Барановский Станислав Иванович',  'ЭТиМ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('НВРВ',   'Неверов Александр Васильевич',  'МиЭП');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('РВКЧ',   'Ровкач Андрей Иванович',  'ОВ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ДМДК', 'Демидко Марина Николаевна',  'ЛПиСПС');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('МШКВСК',   'Машковский Владимир Петрович',  'ЛУ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ЛБХ',   'Лабоха Константин Валентинович',  'ЛВ');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ЗВГЦВ',   'Звягинцев Вячеслав Борисович',  'ЛЗиДВ'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('БЗБРДВ',   'Безбородов Владимир Степанович',  'ОХ'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ПРКПЧК',   'Прокопчук Николай Романович',  'ТНХСиППМ'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('НСКВЦ',   'Насковец Михаил Трофимович',  'ТЛ'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('МХВ',   'Мохов Сергей Петрович',  'ЛМиЛЗ'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ЕЩНК',   'Ещенко Людмила Семеновна',  'ТНВиОХТ'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT )
                       values  ('ЖРСК',   'Жарский Иван Михайлович',  'ХТЭПиМЭЕ'); 
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE SUBJECT 
CREATE TABLE SUBJECT
    (
     SUBJECT      CHAR(10)     NOT NULL, 
     SUBJECT_NAME VARCHAR2(50)  NOT NULL,
     PULPIT       CHAR(10)     NOT NULL,  
     CONSTRAINT PK_SUBJECT PRIMARY KEY(SUBJECT),
     CONSTRAINT FK_SUBJECT_PULPIT FOREIGN  KEY(PULPIT)  REFERENCES PULPIT(PULPIT)
    );

delete SUBJECT;
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('СУБД',   'Системы управления базами данных',                   'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT)
                       values ('БД',     'Базы данных',                                        'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ИНФ',    'Информацтонные технологии',                          'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОАиП',  'Основы алгоритмизации и программирования',            'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПЗ',     'Представление знаний в компьютерных системах',       'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПСП',    'Пограммирование сетевых приложений',                 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('МСОИ',     'Моделирование систем обработки информации',        'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПИС',     'Проектирование информационных систем',              'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('КГ',      'Компьютерная геометрия ',                           'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПМАПЛ',   'Полиграфические машины, автоматы и поточные линии', 'ПОиСОИ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('КМС',     'Компьютерные мультимедийные системы',               'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОПП',     'Организация полиграфического производства',         'ПОиСОИ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                            PULPIT)
               values ('ДМ',   'Дискретная матеатика',                     'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('МП',   'Математисеское программирование',          'ИСиТ');  
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('ЛЭВМ', 'Логические основы ЭВМ',                     'ИСиТ');                   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('ООП',  'Объектно-ориентированное программирование', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ЭП',     'Экономика природопользования',                       'МиЭП');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ЭТ',     'Экономическая теория',                               'ЭТиМ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('БЛЗиПсOO','Биология лесных зверей и птиц с осн. охотов.',      'ОВ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОСПиЛПХ','Основы садовопаркового и лесопаркового хозяйства',  'ЛПиСПС');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ИГ',     'Инженерная геодезия ',                              'ЛУ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ЛВ',    'Лесоводство',                                        'ЛЗиДВ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОХ',    'Органическая химия',                                 'ОХ');   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ТРИ',    'Технология резиновых изделий',                      'ТНХСиППМ'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ВТЛ',    'Водный транспорт леса',                             'ТЛ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ТиОЛ',   'Технология и оборудование лесозаготовок',           'ЛМиЛЗ'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ТОПИ',   'Технология обогащения полезных ископаемых ',        'ТНВиОХТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПЭХ',    'Прикладная электрохимия',                           'ХТЭПиМЭЕ');          
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE AUDITORIUM_TYPE 
create table AUDITORIUM_TYPE 
(
  AUDITORIUM_TYPE   char(10) constraint AUDITORIUM_TYPE_PK  primary key,  
  AUDITORIUM_TYPENAME  varchar2(30) constraint AUDITORIUM_TYPENAME_NOT_NULL not null         
);

delete AUDITORIUM_TYPE;
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛК',   'Лекционная');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛБ-К',   'Компьютерный класс');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛК-К', 'Лекционная с уст. компьютерами');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛБ-X', 'Химическая лаборатория');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛБ-СК', 'Спец. компьютерный класс');
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE AUDITORIUM 
create table AUDITORIUM 
(
 AUDITORIUM           char(10) primary key,  -- код аудитории
 AUDITORIUM_NAME      varchar2(200),          -- аудитория 
 AUDITORIUM_CAPACITY  number(4),              -- вместимость
 AUDITORIUM_TYPE      char(10) not null      -- тип аудитории
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE)  
);

delete  AUDITORIUM;
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('206-1',   '206-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
                       values  ('301-1',   '301-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('236-1',   '236-1', 'ЛК',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('313-1',   '313-1', 'ЛК',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('324-1',   '324-1', 'ЛК',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('413-1',   '413-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('423-1',   '423-1', 'ЛБ-К', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('408-2',   '408-2', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('103-4',   '103-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('105-4',   '105-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('107-4',   '107-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('110-4',   '110-4', 'ЛК',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('111-4',   '111-4', 'ЛК',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                      values  ('114-4',   '114-4', 'ЛК-К',  90 );
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('132-4',   '132-4', 'ЛК',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('02Б-4',   '02Б-4', 'ЛК',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('229-4',   '229-4', 'ЛК',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('304-4',   '304-4','ЛБ-К', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('314-4',   '314-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('320-4',   '320-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('429-4',   '429-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                        values  ('?',   '???', 'ЛК',  90);

------------------- Task 1 -------------------

begin
  null;
end;

------------------- Task 2 -------------------

begin
  dbms_output.put_line('Oracle!');
end;

------------------- Task 3 -------------------

declare 
  x number(3):=21;
  y number(3):=0;
  z number(3);
begin
  dbms_output.put_line('x= ' || x || ', y= ' || y);
  z:=x/y;
  dbms_output.put_line('z= '|| z);
exception 
  when others
  then dbms_output.put_line('error = '|| sqlerrm || ', error sqlcode = ' || sqlcode);
end;

------------------- Task 4 -------------------

declare
    z number(10,2) := 21;
begin
    begin
        z := 5/0;
    exception
        when OTHERS
        then dbms_output.put_line('ERROR SQLCODE = ' || sqlcode || chr(10) || 'ERROR MESSAGE = ' || sqlerrm);
    end;
    dbms_output.put_line('z = '||z);
end;

------------------- Task 5 -------------------

show parameter plsql_warnings;
select name, value from v$parameter where name = 'plsql_warnings';

------------------- Task 6 -------------------

select keyword from v$reserved_words where length=1 and keyword !='A';

------------------- Task 7 -------------------

select keyword from v$reserved_words where length>1 and keyword !='A' order by keyword;

------------------- Task 8 -------------------

select name,value from v$parameter where name like 'plsql%';
show parameter plsql;

------------------- Task 9-10  -------------------

declare 
  n1 number(3):=21;
  n2 number(10):=2112;
  n3 number(10):=21122001;
begin
  dbms_output.put_line('n1 = '|| n1);
  dbms_output.put_line('n2 = '|| n2);
  dbms_output.put_line('n3 = '|| n3);
end;

------------------- Task 11 -------------------

declare 
  x number(5):=500;
  y number(5):=100;
  
  s number(3);
  r number(3);
  d number(3);
  dw number(3);
  u number (6);
  
begin
  s:=x+y;
  r:=x-y;
  u:=x*y;
  d:=x/y;
  dw:=mod(x,y);
  
  dbms_output.put_line('Сумма: '|| s);
  dbms_output.put_line('Разность: '|| r);
  dbms_output.put_line('Деление: '|| d);
  dbms_output.put_line('Умножение: '|| u);
  dbms_output.put_line('Деление с остатком: '|| dw);
  
end;

------------------- Task 12 -------------------

declare
  d number (5, 2);
  d1 number (3,2) := 21.12;
  d2 number(5,4):=2.1122;
begin
  d:=567.66;
  dbms_output.put_line('d = '|| d);
  dbms_output.put_line('d1 = '|| d1);
  dbms_output.put_line('d2 = '|| d2);
end;

------------------- Task 13 -------------------
declare
  d number (5, -2);
  d1 number (3,-2) := 211;
  d2 number(4,-3):=2112;
begin
  d:=567;
  dbms_output.put_line('d = '|| d);
  dbms_output.put_line('d1 = '|| d1);
  dbms_output.put_line('d2 = '|| d2);
end;

------------------- Task 14-15 -------------------

declare 
  n1 binary_float:=12345.6789;
  n2 binary_double:=123456.789;
begin
  dbms_output.put_line('n1 = ' || n1);
  dbms_output.put_line('n2 = ' || n2);
end;

------------------- Task 16 -------------------

declare 
  n1 number:=123E-2;
  n2 number:=123E+5;
begin
  dbms_output.put_line('n1 = ' || n1);
  dbms_output.put_line('n2 = ' || n2);
end;
  
------------------- Task 17 -------------------

declare 
  boot boolean:= true;
  boof boolean:= false;
  boo boolean;
begin
  if boot then dbms_output.put_line('boot = '|| 'true'); end if;
  if not boof then dbms_output.put_line('boof = '|| 'false'); end if;
  if boo is null then dbms_output.put_line('boo = '|| 'null'); end if;
end;

------------------- Task 18 -------------------

declare
    n constant number(2) := 21;
    v constant varchar2(8) := 'vasilisa';
    c constant char(4) := 'pdbv';
begin
    dbms_output.put_line('Constant n = '|| n);
    dbms_output.put_line('Constant n + n = '||(n+n)); 
    dbms_output.put_line('Constant n - 5 = '||(n-5)); 
    dbms_output.put_line('Constant n * 5 = '||(n*5)); 
    dbms_output.put_line('Constant n / 3 = '||(n/3)); 
    dbms_output.put_line('Constant v = '|| v);
    dbms_output.put_line('Constant c = '|| c);
    
    --n := 10;
    
    exception 
        when others
        then dbms_output.put_line('error = '|| sqlerrm);
end;

------------------- Task 19 -------------------

declare
  pulp pulpit.pulpit%TYPE;
begin 
  pulp := 'ИСиТ';
  dbms_output.put_line(pulp);
end;

------------------- Task 20 -------------------

declare
  faculty_res faculty%ROWTYPE;
begin 
  faculty_res.faculty := 'ФИТ';
  faculty_res.faculty_name := 'Факультет информационных технологий';
  dbms_output.put_line(faculty_res.faculty);
end;

------------------- Task 21 -------------------

declare 
  x PLS_INTEGER := 16;
begin
  if 5 > x then
    dbms_output.put_line('5 > '|| x);
  elsif 5 < x then
    dbms_output.put_line('5 < '|| x);
  else
    dbms_output.put_line('5 = '|| x);
  end if;
end;

------------------- Task 23 -------------------

declare 
  x pls_integer:=20;
begin
case
  when 10>x then dbms_output.put_line('10> '|| x);
  when 10=x then dbms_output.put_line('10= ' || x);
  when 15=x then dbms_output.put_line('15= ' || x);
  when x between 16 and 25 then dbms_output.put_line('16<=' || x || '<=25');
  else dbms_output.put_line('else');
  end case;
end;

------------------- Task 24 -------------------

declare
    x pls_integer :=0;
begin
  dbms_output.put_line('------- 24 -------');
    loop x:=x+1;
        dbms_output.put_line(x);
        exit when x>5;
    end loop;
    
------------------- Task 25 -------------------

  dbms_output.put_line('------- 25 -------');
    for k in 1..5
        loop dbms_output.put_line(k); 
    end loop;
    
------------------- Task 26 -------------------

  dbms_output.put_line('------- 26 -------');
    while (x>0) 
        loop x:=x-1;
      dbms_output.put_line(x);
    end loop;
end;