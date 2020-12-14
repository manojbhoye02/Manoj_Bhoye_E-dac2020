create database DBT_assignment3;
use DBT_assignment3;
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
desc Employee;


create table authors(author_name varchar(255),constraint pk_key primary key(author_name));
insert into authors values('manoj bhoye'),
('mayuresh jaiswal'),
('mayank yadav'),
('mayank dwevedi'),
('milan momale'),
('meghana mali'),
('aaksh_jejure');
select * from authors;
select * from authors ORDER BY author_name ASC;
desc authors;


create table publishers(publisher_name varchar(255),constraint pk_key primary key(publisher_name));
insert into publishers values('chetan waghere'),
('ganesh chaudhari'),
('omkar dhokale'),
('Amit gade'),
('saurabh kumar'),
('Aniket gavit'),
('tejas pawar');
select * from publishers;
select * from publishers ORDER BY publisher_name DESC;
create table Employee1(emp_id  int not null primary key,
emp_name varchar(50),
dept_id int,
salary int,
manager varchar(50));

select  * from employee;
select *,sum(salary) from employee group by dept_id;
select dept_id,sum(salary) from employee where (salary > 7900) group by dept_id;
select emp_id,SUM(manager) AS totalsalary FROM employee1 GROUP BY emp_id HAVING  totalsalary > 17000;
    
select emp_id,SUM(manager) AS totalsalary FROM employee1 GROUP BY emp_id HAVING totalsalary < 20000;