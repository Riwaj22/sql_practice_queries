-- 1. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id

create table countries(
	country_id int,
	country_name varchar,
	region_id int

)

select * from countries

--  SQL statement to create a simple table countries including columns country_id,country_name and region_id which already exist.

create table countries (
	country_id int,
	country_name varchar,
	region_id int

)

-- SQL statement to create the structure of a table dup_countries similar to countries.

create table dup_countries
as
select * from countries

select * from dup_countries

-- SQL statement to create a table countrys set a constraint NULL.

create table countrys (
	country_id int,
	country_name varchar,
	region_id int Null

)
select * from countrys


-- SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.

create table jobs(
	job_id int,
	job_title varchar,
	min_salary int,
	max_salary int,
	check(max_salary<=25000)
)

select * from jobs

-- SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.

create table country(
		country_id int,
		country_name varchar,
		region_id varchar,
		check(country_name in ('Italy','India','China'))
)

insert into country 
values(
	'1',
	'Nepal',
	'22'
)

-- SQL statement to create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.

create table countries(
	country_id int,
	country_name varchar,
	region_id int,
	unique(country_id)

)

-- SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.

create table job(
	job_id int,
	job_title varchar default null,
	min_salary int default 8000,
	max_salary int default null
	
)

select * from job

insert into job values(1)

-- SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.

create table c(
	country_id int,
	country_name varchar,
	region_id int,
	unique(country_id)
)

-- SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto-incremented value.

create table co(
	country_id SERIAL primary key,
	country_name varchar,
	region_id int,
	unique(country_id)
)

select  * from co

-- SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique.

create table cou(
	country_id SERIAL primary key,
	country_name varchar,
	region_id int,
	unique(country_id,region_id)
)

select * from cou

-- SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which exist in the jobs table.

drop table jobs
create table jobs(
	job_id int primary key,
	job_title varchar,
	min_salary int,
	max_salary int,
	check(max_salary<=25000)
)

create table job_history(
	employee_id int Primary key,
	start_date date,
	end_date date,
	job_id int,
	department_id int,
	unique(employee_id),
	foreign key(job_id) references jobs(job_id)
)

-- SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations exist in the departments table.

create table departments(
	department_id numeric primary key,
	department_name varchar ,
	manager_id int ,
	location_id int
	
)



create table employees(
	employee_id int,
	first_name varchar,
	last_name varchar,
	email varchar,
	phone_number int,
	hire_date date,
	job_id int,
	salary int,
	commission int,
	department_id int,
	manager_id int,
	FOREIGN KEY(department_id,manager_id) 
    REFERENCES  departments(department_id,manager_id)

)

select * from departments;



