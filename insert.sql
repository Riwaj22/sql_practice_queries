-- SQL statement to insert a record with your own value into the table countries against each column.

select * from country_new
insert into country_new 
values(1,'Nepal',1002)

-- SQL statement to insert one row into the table countries against the column country_id and country_name.
insert into country_new 
values(2,'India')

--  SQL statement to create duplicates of countries table named country_new with all structure and data.
create table countries_new 
as 
select * from country_new

select * from countries_new

-- SQL statement to insert NULL values into region_id column for a row of countries table.

insert into country_new 
values(3,'India',Null)

select country_name, count(country_id) as total_count from country_new
group by country_name 

-- SQL statement to insert 3 rows by a single insert statement.

INSERT INTO country_new VALUES('C4','India',1001),
('C5','USA',1007),('C6','UK',1003);

-- SQL statement insert rows from the country_new table to countries table.
create table countries()

insert into countries
select * from country_new

-- SQL statement to insert one row in the jobs table to ensure that no duplicate values will be entered into the job_id column.

alter table joobs
add primary key(job_id) 


--  SQL statement to insert a record into the table countries to ensure that, at country_id and the region_id combination will be entered once in the table.
CREATE TABLE countries ( 
COUNTRY_ID integer NOT NULL,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID integer NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID)
);
INSERT INTO countries VALUES(501,'India',185);

--  SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.
CREATE TABLE cc ( 
COUNTRY_ID SERIAL PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID integer NOT NULL
);

INSERT INTO cc(COUNTRY_NAME,REGION_ID) VALUES('India',185);
INSERT INTO cc(COUNTRY_NAME,REGION_ID) VALUES('India',185);
select * from cc

-- SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned to that column.
CREATE TABLE ccc ( 
COUNTRY_ID SERIAL PRIMARY KEY,
COUNTRY_NAME varchar(40) default 'N/A',
REGION_ID integer NOT NULL
);

insert into ccc(REGION_ID) values(2)
select * from ccc

-- SQL statement to insert rows into the job_history table in which one column job_id is containing those values which exist in job_id column of jobs table.
drop table jobs Cascade
CREATE TABLE jobs ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT 20000
);


INSERT INTO jobs(JOB_ID,JOB_TITLE) VALUES(1001,'OFFICER');
INSERT INTO jobs(JOB_ID,JOB_TITLE) VALUES(1002,'CLERK');

drop table job_history cascade
CREATE TABLE job_history ( 
EMPLOYEE_ID integer NOT NULL PRIMARY KEY, 
JOB_ID integer NOT NULL, 
DEPARTMENT_ID integer DEFAULT NULL, 
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

INSERT INTO job_history VALUES(501,1001,60);

select * from job_history

-- SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined value must have existed into the table departments.
drop table departments cascade
CREATE TABLE departments ( 
DEPARTMENT_ID integer NOT NULL UNIQUE, 
DEPARTMENT_NAME varchar(30) NOT NULL, 
MANAGER_ID integer DEFAULT NULL, 
LOCATION_ID integer DEFAULT NULL, 
PRIMARY KEY (DEPARTMENT_ID,MANAGER_ID) 
);

INSERT INTO departments VALUES(60,'SALES',201,89);
INSERT INTO departments VALUES(61,'ACCOUNTS',201,89);
INSERT INTO departments VALUES(80,'FINANCE',211,90);

drop table employees cascade

CREATE TABLE employees ( 
EMPLOYEE_ID integer NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL, 
JOB_ID varchar(10) NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL, 
MANAGER_ID integer DEFAULT NULL, 
DEPARTMENT_ID integer DEFAULT NULL, 
FOREIGN KEY(DEPARTMENT_ID,MANAGER_ID) 
REFERENCES  departments(DEPARTMENT_ID,MANAGER_ID)
);


INSERT INTO employees VALUES(510,'Alex','Hanes','CLERK',18000,201,60);
INSERT INTO employees VALUES(511,'Kim','Leon','CLERK',18000,211,80);

