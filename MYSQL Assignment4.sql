create database dbt_assignment4;
use dbt_assignment4;

create table Department(dept_id int,dept_name varchar(50),constraint pk_key primary key(dept_id));
show tables;
insert into Department values
(1,'Finance'),
(2,'Training'),
(3,'Marketing');
select  * from Department;
create table Employee(emp_id  int not null primary key,
emp_name varchar(50),
dept_id int,
salary int,
manager varchar(50),
constraint fk_key foreign key(dept_id) references Department(dept_id));
select * from Employee;
insert into Employee values
(1,'Arun',1,8000,4),
(2,'kiran',1,7000,1),
(3,'Scott',1,3000,1),
(4,'max',2,9000,null),
(5,'Jack',2,8000,4),
(6,'King',2,6000,1);
select * from Employee;
select  * from Department;
/* -----------------------Join---------------------------*/
select D.DEPT_NAME, E.EMP_NAME from DEPARTMENT D join EMPLOYEE E on D.DEPT_ID=E.DEPT_ID;
select * FROM DEPARTMENT D join EMPLOYEE E on D.DEPT_ID=E.DEPT_ID;

select D.DEPT_ID, SUM(E.SALARY) as SUM  from DEPARTMENT D join EMPLOYEE E on D.DEPT_ID=E.DEPT_ID group by D.DEPT_ID;
select D.DEPT_NAME, E.EMP_NAME from EMPLOYEE E right outer join D on E.DEPT_ID=D.DEPT_ID; 
select D.DEPT_NAME, E.EMP_NAME from EMPLOYEE E left outer join DEPARTMENT D on E.DEPT_ID=D.DEPT_ID; 
CREATE TABLE MANAGER (MAN_ID INT primary KEY, NAME varchar(10));
INSERT INTO MANAGER VALUES(1,'manoj'),(2,'saurabh'),(3,'milan'),(4,'tanuja'),(5,'meghana');
select * from MANAGER;
select EMPLOYEE.EMP_NAME , MANAGER.NAME as MANAGER from EMPLOYEE   join MANAGER  on EMPLOYEE.MANAGER=MANAGER.MAN_ID;
select EMPLOYEE.EMP_NAME , DEPARTMENT.DEPT_NAME as DEPARTMENT from EMPLOYEE   join DEPARTMENT  on EMPLOYEE.DEPT_ID=DEPARTMENT.DEPT_ID;
/* -----------------------Join---------------------------*/
 create table EMP1 (EMP_ID int primary key, EMP_NAME varchar(10));
insert into EMP1  values(1,'A'),(2,'B'),(3,'C');
select * from EMP1;
 create table EMP2 as select * from EMP1;
 insert into EMP2 values (4,'D'),(5,'E');
 select * from EMP2;


select * from EMP1 union select * from EMP2;
----------- (SUBQUERY) -----------------

SELECT EMP_NAME FROM EMPLOYEE WHERE SALARY=(SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='Arun') AND EMP_NAME NOT LIKE 'ARUN';
SELECT EMP_NAME FROM EMPLOYEE WHERE DEPT_ID=(SELECT DEPT_ID FROM EMPLOYEE WHERE EMP_NAME='jack');
SELECT EMP_NAME FROM EMPLOYEE WHERE SALARY=(SELECT SALARY FROM EMPLOYEE ORDER BY SALARY LIMIT 1 );
UPDATE  EMPLOYEE SET SALARY=15000  WHERE DEPT_ID = (select dept_id from(SELECT DEPT_ID FROM employee  WHERE EMP_NAME='Max') as a) and EMP_NAME!='Max';

