-- 1. Write a query to display the names (first_name, last_name) using an alias name “First Name", "Last Name".

select first_name as FirstName,
last_name as LastName
from employees

-- 2. Write a query to get a unique department ID from employee table.
select distinct department_id
from employees

-- 3. Write a query to get the details of all employees from the employee table in descending order by their first name.
select * from employees
order by first_name desc

-- 4. Write a query to get the names (first_name, last_name), salary and 15% of salary as PF for all the employees.
select concat(first_name,' ',last_name)as full_name,
salary,
0.15* salary as pf
from employees

-- Write a query to get the employee ID, names (first_name, last_name) and salary in ascending order according to their salary.
select employee_id, concat(first_name,' ',last_name)as full_name,
salary from
employees
order by salary asc

-- 6. Write a query to get the total salaries payable to employees
SELECT SUM(salary) 
FROM employees;

-- 7. Write a query to get the maximum and minimum salary paid to the employees.
select max(salary)as maximum_salary,
min(salary)as minimum_salary 
from employees

-- 8. Write a query to get the average salary and number of employees are working.
select avg(salary) as "average salary",
count(employee_id)as "total number of employees"
from employees

-- 9. Write a query to get the number of employees working with the company.
select count(*)
from employees

-- 10. Write a query to get the unique number of designations available in the employees table.
SELECT COUNT(DISTINCT job_id) 
FROM employees;

-- 11. Write a query to get all the first name from the employees table in upper case.
select upper(first_name )
from employees

-- 12. Write a query to get the first three characters of the first name for all the employees in the employees table.
SELECT SUBSTRING(first_name,1,3) 
FROM employees;

-- 13. Write a query to calculate the expression 171*214+625.
select 171*214+625

-- 14. Write a query to get the name, including first name and last name of all the employees from employees table

SELECT  CONCAT(first_name,' ', last_name) "Employee Name" 
FROM employees;

-- 15. Write a query to get the first names after removing all the leading and trailing blanks of all the employees from employees table.
select trim(first_name)
from employees

-- 16. Write a query to get the first name, last name and the length of the name, including first_name and last_name of all the employees from employees table
SELECT first_name,last_name, 
LENGTH(first_name)+LENGTH(last_name)  "Length of  Names" 
FROM employees;

-- 17. Write a query to check whether the first_name column of the employees table containing any number.
SELECT * 
FROM employees 
WHERE  first_name 
SIMILAR TO   '%0|1|2|3|4|5|6|7|8|9%';

-- 18. Write a query to select first ten records from a table.
select * 
from employees
limit 10

-- Write a query to get a monthly salary (rounded up to 2 decimal places) of each employee.
select round(salary) as salary
from employees




