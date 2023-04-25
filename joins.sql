-- 1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

select * from locations

alter table locations
add city varchar

select a.location_id,
a.street_address,
a.state_province,
b.country_name
from locations as a
left join country_new as b
on a.country_id = b.country_id
group by country_id

-- 2. Write a query to make a join with employees and departments table to find the name of the employee, including first_name and last name, department ID and name of departments.
select a.first_name,
a.last_name,
concat(a.first_name,' ',a.last_name)as name,
a.department_id,
b.department_name
from employees as a
left join departments as b
on a.department_id = b.department_id

-- 3. Write a SQL query to make a join with three tables employees, departments and locations to find the name, including first_name and last_name, jobs, department name and ID, of the employees working in London.
select a.first_name,
a.last_name,
concat(a.first_name,' ',a.last_name)as name,
a.job_id,
a.department_id,
b.department_name,
c.city
from employees as a
left join departments as b
on a.department_id = b.department_id
left join locations as c
on b.location_id = b.location_id
where c.city = 'London'


-- 4. Write a query to make a join with two tables employees and itself to find the employee id, last_name as Employee along with their manager_id and last name as Manager.
SELECT W1.employee_id as "Emp_id" , W1.last_name AS "Employee",
W2.employee_id AS "Manager ID", W2.last_name AS "Manager"
FROM employees W1 JOIN employees W2
ON W1.manager_id= W2.employee_id; 

alter table employees
add hire_date date

-- 5. Write a query to make a join with a table employees and itself to find the name, including first_name and last_name and hire date for those employees who were hired after the employee Jones.
SELECT e.first_name, e.last_name, e.hire_date 
FROM employees e 
JOIN employees f 
ON (f.last_name = 'Jones') 
WHERE f.hire_date < e.hire_date;

-- 6. Write a query to make a join with two tables employees and departments to get the department name and number of employees working in each departmen

select a.department_name,
count(b.employee_id)as "Number of employees"
from departments as a
left join employees b
on a.department_id = b.department_id
group by department_name

-- 7. Write a query to make a join to find the employee ID, job title and number of days an employee worked, for all the employees who worked in a department which ID is 90.
select a.employee_id,
a.job_id,
age(current_timestamp,a.hire_date)as days,
b.department_id
from employees as a
left join departments as b
on a.department_id = b.department_id
where
b.department_id = 90

-- 8. Write a query to make a join with two tables employees and departments to display the department ID, department name and the first name of the manager.

select a.department_id,
a.department_name,
b.first_name,
b.manager_id
from departments as a
left join employees as b
on a.department_id = b.department_id


-- 9. Write a query to make a join with three tables departments, employees, and locations to display the department name, manager name, and city.
select a.department_name,
b.first_name, 
b.last_name,
c.city
from departments as a
left join employees as b
on a.department_id = b.department_id
left join locations as c
on a.location_id = c.location_id

-- 10. Write a query to make a join with two tables employees and jobs to display the job title and average salary of employees
select job_id,
avg(salary)as "Average salary"
from employees
full join jobs


-- 11. Write a query to make a join with two tables employees and jobs to display the job title, employee name, and the difference between salary and the minimum salary of the employees.
select a.job_title,
b.first_name.
b.salary, b.min (salary)
b.salary-min(salary)
from employees as a
natural join jobs b


-- 12. Write a query to make a join with two tables job_history and employees to display the status of employees who is currently drawing the salary above 10000.
select *,
b.employee_id 
from employees as a
left join job_history as b
on a.employee_id = b.employee_id
where a.salary >10000


-- 13. Write a query to make a join with two tables employees and departments to display department name, first_name and last_name, hire date and salary for all the managers who achieved a working experience is more than 15 years.
SELECT department_name, first_name, last_name,
hire_date, salary,date_part('year',age(now(),hire_date)) Experience 
FROM departments w1 
JOIN employees w2 
ON (w1.manager_id = w2.employee_id)
WHERE date_part('year',age(now(),hire_date))>15;


