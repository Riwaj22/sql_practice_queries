drop table worker
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME varchar(25),
	LAST_NAME varchar(25),
	SALARY INT,
	JOINING_DATE timestamp,
	DEPARTMENT varchar
)

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
		
select * from Worker
drop table Bonus
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE varchar,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
		
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE varchar,
	AFFECTED_FROM timestamp,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);	

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
select * from Worker
--  Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.

select first_name as worker_name from Worker

-- Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.

select upper(first_name) from Worker


-- Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
select distinct department from Worker

-- Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.

select substring(first_name,1,3) from Worker

-- SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
select RTRIM(first_name) from Worker

-- SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
select LTRIM(department) from Worker

-- SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.

select distinct department, length(department) from Worker

-- SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
select  
replace(first_name,'a','A')
from Worker

-- SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.

select 
first_name||' '||last_name as complete_name 
from Worker

-- SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from Worker
order by first_name asc

-- SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Worker
order by first_name asc, department desc

-- SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
select * from Worker
where first_name in ('Vipul','Satish')

-- SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
select * from Worker
where first_name not in ('Vipul','Satish')

-- SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from Worker
where department in ('Admin')

-- SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from Worker
where first_name like '%a%'

-- SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from Worker
where first_name like '%a'

-- SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from Worker
where first_name like '______h'

-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from Worker
where salary between 100000 and 500000

--  SQL query to print details of the Workers who joined in Feb’2014.
select * from Worker
where joining_date = '2014-02'

-- SQL query to fetch the count of employees working in the department ‘Admin’.
select count(worker_id) from Worker
where department in ('Admin')

-- SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select concat(first_name,' ',last_name) as full_name from Worker
where salary >= 50000 and
salary <= 100000

-- SQL query to fetch the no. of workers for each department in descending order.
select department,count(worker_id)
from Worker
group by department 
order by department desc

select * from Worker
select * from Title
-- SQL query to print details of the Workers who are also Managers.
select * ,
b.worker_title
from Worker as a
left join Title as b
on a.worker_id = b.worker_ref_id
where b.worker_title = 'Manager'

-- SQL query to show only odd rows from a table.
select * from Worker 
where mod(worker_id,2) <>0

-- SQL query to show only even rows from a table.
select * from Worker 
where mod(worker_id,2) =0

-- SQL query to clone a new table from another table.
create table clone_table as
select * from Worker

select * from clone_table

-- SQL query to show records from one table that another table does not have.
select * from Worker
except
select * from Title

-- SQL query to show the current date and time.
select current_timestamp

-- SQL query to show the top n (say 10) records of a table
select * from Worker
limit 10

-- SQL query to determine the nth (say n=5) highest salary from a table.
select  salary
from Worker
LIMIT 1 OFFSET 4;

-- SQL query to fetch the list of employees with the same salary.
select * from Worker w1,Worker w2
where w1.salary = w2.salary
and w1.worker_id != w2.worker_id

-- SQL query to show the second-highest salary from a table.
select  salary
from Worker
LIMIT 1 OFFSET 2;

-- SQL query to fetch intersecting records of two tables.
select * from Worker
intersect 
select * from clone_table

-- SQL query to fetch the first 50% of records from a table.
SELECT *
FROM WORKER
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);

-- SQL query to fetch the departments that have less than five people in them.
select department, count(worker_id) as c
from Worker
group by department
having count(worker_id)<5

-- SQL query to show all departments along with the number of people in there.
select department , count(worker_id)
from Worker
group by department

-- SQL query to show the last record from a table.
select * from Worker
where worker_id = (select max(worker_id) from Worker)

-- SQL query to fetch the first row of a table.
select * from Worker
where worker_id = (select min(worker_id) from Worker)

-- SQL query to fetch the last five records from a table.
select * from Worker
where worker_id = (select (worker_id) from Worker  limit 1 offset 4)

-- SQL query to print the name of employees having the highest salary in each department.
select first_name, last_name, max(salary),department
from Worker
group by department

-- SQL query to fetch departments along with the total salaries paid for each of them
select department 
from Worker
where salary = (select count(salary) from Worker)
group by department

-- SQL query to fetch the names of workers who earn the highest salary.
select first_name, last_name from Worker
where salary = (select max(salary) from Worker)

