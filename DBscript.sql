create database myDBjoe;
use myDBjoe;
create table emp1(
emp_id INT,
fname VARCHAR(12),
lname VARCHAR(12),
hourly_rt DECIMAL(3,2),
hire_date Date
);
alter table emp1 add constraint primary key(emp_id);
desc emp1;
alter table emp1  add ph_no varchar(10);
select * from emp1;
alter table emp1 rename column ph_no to email;
alter table emp1 modify email varchar(25);
alter table emp1 modify email varchar(30) after lname;
alter table emp1 drop column email ;
insert into emp1 
values (102, "ravi", "kumar", 20.50, "2024-03-09"),
(103, "latha", "kumar", 27.50, "2024-03-23");
alter table emp1 modify hourly_rt decimal(5,2);
select fname,lname from emp1;
select fname,lname from emp1
where hourly_rt >=20.50;

insert into emp1 (emp_id,fname,lname)
values (104,"vijay", "anthony");
select * from emp1;
select fname,lname from emp1
where hourly_rt is Null;
select fname,lname from emp1
where hourly_rt is Not Null;

use myDBjoe;
update emp1
set hourly_rt = 26.50 , hire_date ="2024-03-11"
where fname ="vijay";
select * from emp1;
create table date_time(
Date1   Date,
time1   time, 
datetime1 datetime);
select * from date_time;
insert into date_time
values( current_date(),current_time(), now());

create table customers(
cust_id int,
fname varchar(12),
lname varchar(12));
alter table customers add constraint primary key(cust_id);
alter table customers 
auto_increment = 1001;
desc customers;
insert into customers (fname,lname)
values ("joe","britt"),
       ("ramesh","babu"),
       ("Ravi","kumar"),
        ("lakshmi","roy"); 
alter  table customers 
modify cust_id int auto_increment;
alter table customers auto_increment = 1001;
desc customers;
select * from customers;
create table transactions(
trans_id int primary key auto_increment ,
amount decimal(4,2) ,
cust_id int ,
foreign key(cust_id) references customers (cust_id));
desc transactions;
alter table transactions
auto_increment = 2001;
select * from customers;
insert into transactions(amount,cust_id)
values (25.50 ,1002),
       (18.50 ,1004),
      (15.50 ,1001),
      (35.50 ,1003);
select * from transactions;      
use myDBjoe;
select * 
from transactions inner join customers
on transactions.cust_id = customers.cust_id; 
desc transactions;
select trans_id, amount,fname,lname
from transactions inner join customers
select *
from transactions left join customers
on transactions.cust_id = customers.cust_id; 
select *
from transactions right join customers
on transactions.cust_id = customers.cust_id; 
select * from customers;
use myDBjoe;
show databases;
use new_dbjoe;
select user();
show tables;
create database demo_con;
use demo_con;
select min(amount) as Minimum
from transactions;
select max(amount) as Maximum
from transactions;
select sum(amount) as Total
from transactions;
select concat(fname," ",lname) as Full_Name
from customers;
select * from emp1;
alter table emp1
add column job varchar(25) after hourly_rt;
desc emp1;
update emp1
set job = "asst manager" 
where emp_id = 104;
insert into emp1
values (105,"Sandy","Charles",23.75, "cook" ,"2024-01-22");

select * from emp1
where hire_date < "2024-04-01"  
AND 
job = "cashier";

select * from emp1
where hourly_rt > 24.50
OR 
job = "manager";
select * from emp1
where Not job ="cook";
select * from emp1
where Not job ="cook" AND not job ="cashier";

select * from emp1
where job IN ("cook","janitor","cashier");

select * from emp1
where hire_date between  "2024-03-20"  AND "2024-03-29";

use demo_con;
show databases;
show databases;


select *from emp1;

show tables;
select * from customers;
use myDBjoe;
select fname, lname  from emp1
Union All
select fname,lname from customers;

alter table customers
add reference_id int;

select * from customers;
update customers
set reference_id = null
where cust_id = 1001;

select * from customers;
update customers
set reference_id = 1001
where cust_id = 1002

select * from customers;

-- inner join  commands jo 
-- As   is used to create copy of a table 
--  another As  is used along with ineer join for duplicate copy of a table
--  below a and b are tables
select * from customers AS a
inner join customers AS b
ON a.reference_id = b.cust_id;

--  now with specific column  from tables a and begin
--  reference_by   is a alias name for column
select a.cust_id, a.fname , a.lname,
concat(b.fname, " " , b.lname) AS "reference_by"
 from customers AS a
inner join customers AS b
ON a.reference_id = b.cust_id;

-- next is left join 
select a.cust_id, a.fname , a.lname,
concat(b.fname, " " , b.lname) AS "reference_by"
 from customers AS a
left  join customers AS b
ON a.reference_id = b.cust_id;

select a.cust_id, a.fname , a.lname,
concat(b.fname, " " , b.lname) AS "reference_by"
 from customers AS a
right join customers AS b
ON a.reference_id = b.cust_id;
-- next  example of inner join 
alter table emp1
add supervisor_id  int;
select * from emp1;
update emp1
set supervisor_id = 104
where emp_id = 102;

select  a.fname,a.lname,
concat(b.fname," ",b.lname) AS "reports TO"
from emp1 AS a
inner join emp1 As b
ON a.supervisor_id = b.emp_id;

select  a.fname,a.lname,
concat(b.fname," ",b.lname) AS "reports TO"
from emp1 AS a
left join emp1 As b
ON a.supervisor_id = b.emp_id;
--  END of Inner join topic
show databases;
use myDBjoe;
show tables;
select * from emp1;
select * from customers;
select * from transactions;
alter table customers
add column email varchar(40);
update customers 
set email = "lakshmiroy@gmail.com"
where cust_id = 1004;

-- creating a view table 
create view cust_email As 
select email from customers ;
select * from cust_email;

--  indexes on customers table 
show indexes from customers;

create index firstname_lastname_idx
on customers(fname,lname);

select * from customers
where fname="joe" AND lname="britt";
create index fname
on customers(fname);
show indexes from customers;
select * from customers
where fname="joe" ;

-- Subquery 
select * from emp1;
select fname,lname,hourly_rt, 
(select Avg(hourly_rt) from emp1) AS avg_pay 
from emp1;
select fname,lname,hourly_rt 
from emp1 where hourly_rt > (select Avg(hourly_rt) from emp1) ;
select * from transactions;
-- "Procedure"   called as methods() or function() in other 
-- programming languages
Delimiter $$
create procedure get_customer()
Begin 
select * from customers;
End $$
Delimiter ;
call get_customer();
-- Drop procedure get_customer;
--Another example with passing argument to procedure
Delimiter $$
create procedure find_customer(IN id int)
Begin 
select * from customers
where cust_id = id;
End $$
Delimiter ;

-- Calling procedure 
call find_customer(1003);