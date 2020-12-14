create database dbt_assignment7;
use dbt_assignment7;
create table Ord_master (Ord_no	 int ,Cust_id varchar(30), Status char(2),constraint pk_key primary key(Ord_no));
create table Ord_dtl (Ord_no int, Prod_cd varchar(30),Qty int,constraint fk_key foreign key(Ord_no) references Ord_master(Ord_no));
create table Prod_master(Prod_cd char(2),Prod_name varchar(30),Qty_in_stock int(4),Booked_Qty int(4),constraint pk_key primary key(Prod_cd));
insert into Ord_master values(1,'C1','P');
insert into Ord_dtl values (1,'P1',100),
(1,'P2',200);


insert into Prod_master values('P1','Floppies',10000,1000),
('P2','Printers',5000,600),
('P3','Moderns',3000,200);
select * from Ord_master;
select * from Ord_dtl;
select * from Prod_master;

/* 1. Write a Before Insert trigger on Ord_dtl. Anytime a row is inserted in Ord_dtl, the
Booked_qty in Prod_master should be increased accordingly.
*/

delimiter $$
create trigger Que1 before insert on Ord_dtl
for each row
begin
update Prod_master set Booked_Qty=Booked_Qty+new.Qty where Prod_cd=new.Prod_cd;
end $$

insert into Ord_dtl values (1,'P3',300);


/*2. Write a Before Delete trigger on Ord_dtl. Anytime a row is deleted from Ord_dtl, the
Booked_qty in Prod_master should be decreased accordingly.*/
delimiter $$
create trigger Que2 Before delete on Ord_dtl
for each row
begin
update Prod_master set Booked_qty=Booked_qty-old.Qty where Prod_cd=old.Prod_cd;
end $$
delete from Ord_dtl where Prod_cd='P3';

/*3. write A trigger to update the total salary of a department in dept_sal  table
  when an employee is added or removed from  emp table .
Create table dept_sal (dept_no, tota_salary) – this table contains the total of salaries
 of employees working into that particular department
*/

Create table EMP ( EMPNO numeric(4) not null,
 ENAME varchar(30) not null, 
 JOB varchar(10),
 MGR numeric(4),
 HIREDATE date, 
 SAL numeric(7,2), 
 DEPTNO numeric(2) ); 
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values
(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values
(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values
(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values
(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values
(1006,  'Pooja',  'MANAGER'  ,     null    , '2000-02-18' ,6000, 10 );
select * from EMP;
create table dept_sal( dept_no int, tota_salary int(4));
insert into dept_sal values(30,1200),(10,12000);
select * from dept_sal;

delimiter $$
create trigger Que3 after insert on emp
for each row
begin 
update dept_sal set tota_salary=tota_salary+new.SAL where DEPT_NO=new.deptno;
end$$
insert into EMP values(1007 , 'Saurabh', 'Developer', 1003 ,  '2020-05-20', 9000, 10 );
select * from EMP;
select * from dept_sal;

delimiter $$
create trigger Que33 before delete on emp
for each row
begin
update dept_sal set tota_salary=tota_salary-old.SAL where DEPT_NO=old.deptno;
end $$
delete from Emp where Empno=1007;
