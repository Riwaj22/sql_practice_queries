create table regions(
	region_id int Primary key,
	region_name varchar(25)
)

create table countries(
	country_id varchar(2) Primary key,
	country_name varchar,
	region_id int,
	foreign key (region_id) references regions(region_id)
)

select * from countries

create table locations(
	location_id int primary key,
	street_address varchar(25),
	postal_code varchar,
	city varchar,
	state_province varchar,
	country_id varchar(2),
	foreign key(country_id) references countries(country_id)	
)

select * from locations
drop table departments
create table departments(
	department_id int primary key,
	department_name varchar,
	manager_id int,
	location_id int,
	foreign key (location_id) references locations(location_id)

)

select * from departments
create table joobs(
	job_id varchar primary key,
	job_title varchar,
	min_salary int,
	max_salary int
)

select * from joobs

create table joob_history(
	employee_id int primary key,
	start_date timestamp,
	end_date timestamp,
	job_id int,
	department_id int,
	foreign key (job_id) references joobs(job_id),
	foreign key (department_id) references departments(department_id)
)

select * from joob_history

create table employees(
	employee_id int ,
	first_name varchar,
	last_name varchar,
	email varchar,
	phone_number varchar(20),
	hire_date date,
	job_id varchar,
	commission int,
	manager_id int,
	department_id int,
	foreign key(employee_id) references joob_history(employee_id),
	foreign key (department_id) references departments(department_id),
	foreign key (job_id) references joobs(job_id)
)

select * from employees

-- SQL statement to rename the table countries to country_new.
select * from countries
drop table country_new
alter table countries rename to country_new

select * from country_new

-- SQL statement to add a column region_id to the table locations.

alter table locations
add  region_id int

-- SQL statement to change the data type of the column region_id to text in the table locations.
alter table locations
alter region_id type varchar

-- SQL statement to drop the column city from the table locations.
alter table locations
drop column city

-- SQL statement to change the name of the column state_province to state, keeping the data type and size same
alter table locations
rename column state_province to state

-- SQL statement to add a primary key for the columns location_id in the locations table.
alter table locations
add column if exists location_id int primary key

-- SQL statement to add a primary key for a combination of columns location_id and country_id.
ALTER TABLE locations ADD CONSTRAINT locations_id PRIMARY KEY (location_id, country_id);

--  SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.
alter table locations
drop column locations_id

-- SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table
alter table joob_history
add  job_id varchar
foreign key (job_id) references joobs(job_id)\

-- SQL statement to add a foreign key constraint named fk_job_id on job_id column of job_history table referencing to the primary key job_id of jobs table.
ALTER TABLE joob_history 
ADD CONSTRAINT fk_job_id 
FOREIGN KEY (job_id) 
REFERENCES jobs(job_id) 
ON UPDATE RESTRICT 
ON DELETE CASCADE;

-- SQL statement to drop the existing foreign key fk_job_id from job_history table on job_id column which is referencing to the job_id of jobs table.
alter table job_history 
drop column fk_job_id

-- SQL statement to add an index named index_job_id on job_id column in the table job_history.
create index index_job_id 
on joob_history(job_id)

-- SQL statement to drop the index indx_job_id from job_history table.
drop index index_job_id

