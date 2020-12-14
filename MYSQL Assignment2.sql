create database DBT_assignment2;
use  DBT_assignment2;
create table  PUBLISHERS(Pub_id int,P_name varchar(30),Email varchar(50) unique,Phone varchar(30) ,primary key(Pub_id));

create table SUBJECTS(Sub_id int,S_name varchar(30),primary key(Sub_id));

CREATE TABLE  AUTHORS
(
    AUID     int PRIMARY KEY,
    ANAME      VARCHAR(30),
    EMAIL      VARCHAR(50)  UNIQUE,
    PHONE      VARCHAR(30)
);

insert into PUBLISHERS values
(1,'Manoj Bhoye','manojbhoye02@gmail.com','7038366163'),
(2,'Milan Momale','MilanMomale123@gmail.com','7845126598'),
(3,'Mayuresh Jaiswal','jaiswalmayu143@gmail.com','9865413021');


select P_name,Phone,Email from PUBLISHERS;
INSERT INTO AUTHORS VALUES (101, 'HERBERT SCHILD','HERBERT@YAHOO.COM',NULL);
INSERT INTO AUTHORS VALUES (102, 'JAMES GOODWILL','GOODWILL@HOTMAIL.COM',NULL);
INSERT INTO AUTHORS VALUES (103, 'DAVAID HUNTER','HUNTER@HOTMAIL.COM',NULL);
INSERT INTO AUTHORS VALUES (104, 'STEPHEN WALTHER','WALTHER@GMAIL.COM',NULL);
INSERT INTO AUTHORS VALUES (105, 'KEVIN LONEY','LONEY@ORACLE.COM',NULL);
INSERT INTO AUTHORS VALUES (106, 'ED. ROMANS','ROMANS@THESERVERSIDE.COM',NULL);
select ANAME,PHONE from AUTHORS;
insert into  SUBJECTS values (1,'DBT'),(2,'ADS'),(3,'AJP');
insert into SUBJECTS values (4,'oracle'),(5,'oracle');
insert into SUBJECTS VALUES (6,'JAVA LANGUAGE');
 insert into SUBJECTS VALUES (7,'JAVA ENTEPRISE EDITION');
 insert into SUBJECTS VALUES (8,'VISUAL BASIC.NET'),(9,'JSP.NET');
SELECT * FROM  SUBJECTS;
CREATE TABLE  TITLES
(
    TITLEID    int PRIMARY KEY,
    TITLE      VARCHAR(30),
    PUBID     int,
    SUBID       int,
    PUBDATE    DATE,
    COVER      CHAR(1),
    PRICE      int,
	CONSTRAINT TITLES_PUBID_FK FOREIGN KEY (PUBID) REFERENCES PUBLISHERS(Pub_id),
	CONSTRAINT TITLES_SUBID_FK FOREIGN KEY (SUBID) REFERENCES SUBJECTS(Sub_id)
);

select * from PUBLISHERS;
select * from SUBJECTS;
select * from TITLES;
select * from AUTHORS;
insert into TITLES values (1,'qwerty',1,3,'2001-12-23','P',100),
(2,'qwerty1',2,2,'2005-11-12','H',90),
(3,'qwerty2',3,1,'2010-10-05','p',50);
select TITLEID, TITLE, PUBDATE from Titles;

CREATE TABLE  TITLEAUTHORS
(
    TITLEID    int ,
    AUID       int ,
    IMPORTANCE int,
   PRIMARY KEY(TITLEID,AUID),
   CONSTRAINT  TITLESAUTHORS_TITLEID_FK FOREIGN KEY (TITLEID) REFERENCES TITLES(TITLEID),
   CONSTRAINT  TITLESAUTHORS_AUTHID_FK FOREIGN KEY (AUID) REFERENCES AUTHORS(AUID)
);
INSERT INTO TITLEAUTHORS VALUES (1,104,1);
INSERT INTO TITLEAUTHORS VALUES (3,105,1);

INSERT INTO TITLEAUTHORS VALUES (2,106,1);
select  AUID, TITLEID, IMPORTANCE from titleauthors;
-- ________________2QWERIES(like)______________
select S_name from subjects where S_name='oracle';
select S_name from subjects where S_name like 'j%';
select S_name from subjects where S_name like '%.net%';
select ANAME from authors where ANAME like '%er';
select P_name from publishers where P_name like'%hill%';
-- _____________3QWERIES(relational Operators)_____________________________
select TITLE from titles where PRICE < 500;
select TITLE from titles where PUBDATE < '2005-04-03';
select TITLE from titles where SUBID=2 or SUBID=3;
select AUID from authors where AUID > 103;
  select * from titles where TITLEID=101 or PRICE > 400;
  --------  4 QUERIES (IN OPERATOR) ------------
SELECT * FROM PUBLISHERS WHERE p_name IN('TECHMEDIA','WROX');

--------  5 QUERIES (AGGREGATE FUNCTION) ------------
SELECT MAX(PRICE) AS MAX_PRICE FROM TITLES; 
select * from titleauthors;
SELECT AVG(IMPORTANCE) AVG_IMPORTANCE FROM TITLEAUTHORS;
SELECT COUNT(AUID) AS NU_RECORDS FROM AUTHORS;
SELECT SUM(PRICE) AS SUM_BOOKS_PRICE FROM TITLES;

--------  6 QUERIES (DATE) ------------
SELECT TITLE FROM TITLES WHERE MONTH(PUBDATE)=4;
SELECT YEAR(CURDATE()) as YEAR;
SELECT MONTH(CURDATE()) as MONTH;
SELECT LAST_DAY(PUBDATE) from TITLES  where TITLE='JAVA COMP. REF';

--------  7 QUERIES (DML) ------------

CREATE TABLE EMPLOYEE (EMP_ID INT , EMP_NAME char);
INSERT INTO EMPLOYEE VALUES(1,'MEGHANA'),(2,'HARSHAL'),(3,'MEGHA');
ALTER TABLE EMPLOYEE ADD COLUMN DEPT_ID INT;
ALTER TABLE EMPLOYEE MODIFY COLUMN EMP_NAME varchar(20);
UPDATE EMPLOYEE SET EMP_NAME='Scott'; 
TRUNCATE TABLE EMPLOYEE;

--------  8 QUERIES (EMPLOYEE) ------------
SELECT * FROM EMPLOYEE;
ALTER  TABLE EMPLOYEE ADD COLUMN SALARY float(7,4);
INSERT INTO EMPLOYEE VALUES(1,'MEGHANA',3,123.567),(2,'HARSHAL',2,153.019),(3,'MEGHA',1,165.786),(4,'XYZ',2,177.156);

SELECT round(SALARY) AS SAL FROM EMPLOYEE;
-- SELECT truncate(SALARY) AS SAL FROM EMPLOYEE;
SELECT CEIL(SALARY) AS SAL FROM EMPLOYEE;
SELECT FLOOR(SALARY) AS SAL FROM EMPLOYEE;
SELECT SIGN(SALARY) AS SAL FROM EMPLOYEE;
SELECT mod(SALARY,2) AS HALF_SAL FROM EMPLOYEE;
SELECT SQRT(SALARY) AS SAL FROM EMPLOYEE;
SELECT POWER(SALARY) AS SAL FROM EMPLOYEE;

--------  8 QUERIES (STRING) ------------

SELECT length('Cdac Khargar') AS STR_LENGTH;
SELECT upper('Cdac Khargar') AS STR_LENGTH;
SELECT LOWER('Cdac Khargar') AS STR_LENGTH;

--------  8 QUERIES (STRING) ------------
SELECT current_date() AS DATE;
SELECT date_format(current_date(),'%d-%m-%y') as DATE;
SELECT date_format(current_date(),'%W-%D-%M-%Y') as DATE;
SELECT date_format(current_date(),'%W-%d-%b-%Y') as DATE;