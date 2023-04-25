-- 1. Write a query to get the job_id and the ID(s) for those employees who is working in that post.

SELECT job_id, ARRAY_AGG(employee_id) 
FROM employees 
GROUP BY job_id;

-- 2. Write a query to update the phone_number column with '999' where the substring '124' found in that column
UPDATE employees 
SET phone_number = REPLACE(phone_number, '124', '999') 
WHERE phone_number LIKE '%124%';

select * from employees

-- 3. Write a query to find the details of those employees who contain eight or more characters in their first name.
select * from employees
group by employee_id
having length(first_name) >= 8

-- 4. Write a query to fill the maximum and minimum salary with leading asterisks whether these two columns does not contain a seven digit number
SELECT job_id,  LPAD(trim(to_char(max_salary,'9999999')),7,'*') "Max Salary" ,
LPAD(trim(to_char(min_salary,'9999999')),7,'*') "Min Salary" 
FROM jobs;

-- 5. Write a query to join the text '@example.com' with the email column.
update employees
set email = concat(email, '@example.com')

-- 6. Write a query to get the employee id, first name and hire month of an employee.
select employee_id, first_name, last_name
from employees

-- 7. Write a query to get the employee id, email id to discard the last three characters.
SELECT employee_id, REVERSE(SUBSTR(REVERSE(email), 4)) as Email_ID 
FROM employees;

-- 8. Write a query to find all the employees which first name contains all the uppercase letter
select * from employees
where 
first_name= upper(first_name)

-- 9. Write a query to extract the last four character of phone numbers.
SELECT RIGHT(phone_number, 4) as "Ph.No." 
FROM employees;


-- 10. Write a query to get the information about those locations which contain the characters in its street address is on and below the minimum character length of street_address.
select * from locations
where length(street_address)<=(
	select min(length(street_address))
	from locations
)


-- 11. Write a query to display the first word in the job title if the job title contains more than one words.
 SELECT job_title,  SUBSTR(job_title,1, POSITION(' ' IN job_title)) 
FROM jobs;

-- 12. Write a query to display the first name, last name for the employees, which contain a letter 'C' to their last name at 3rd or greater position.

SELECT first_name, last_name 
FROM employees 
WHERE POSITION('C' IN last_name) > 2;

-- 13. Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names.
select first_name , length(first_name)
from employees 
where first_name in ('A%','J%','M%')
order by first_name

-- 14. Write a query to display the first name and salary for all employees. Form the salary to be 10 characters long, left-padded with the $ symbol. Label the column as SALARY.
SELECT first_name,
LPAD(TRIM(TO_CHAR(salary,'9999999')), 7, '$') SALARY 
FROM employees;