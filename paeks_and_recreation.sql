

select  dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id;

select *
FROM employee_demographics;

select *
FROM employee_salary;

select *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id;
   
   select emp1.employee_id AS emp_santa,
   emp1.first_name AS first_name_santa,
   emp1.last_name AS last_name_santa,
    emp2.employee_id AS emp_name,
   emp2.first_name AS first_name_emp,
   emp2.last_name AS last_name_emp
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
ON emp1.employee_id +1 = emp2.employee_id;


SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id
   INNER JOIN parks_departments AS pd
   ON sal.dept_id = pd.department_id
   ;
   
   select *
   FROM parks_departments;
   
select first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary;   
   
select first_name, last_name, 'OLD MAN'  as Label
FROM employee_demographics
WHERE age>40 AND gender = 'MALE'
UNION
select first_name, last_name, 'HIGHLY PAID EMPLOYEES'  as Label
FROM employee_salary
WHERE salary > 70000
UNION
select first_name, last_name, 'OLD LADY'  as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
ORDER BY first_name, last_name
;


SELECT first_name, last_name, age,
CASE 
    WHEN age<= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age > 50 THEN 'ON Death Door'
END
FROM employee_demographics;

select first_name, last_name, salary,
CASE
    WHEN salary < 50000 THEN salary+(salary*0.05)
    WHEN salary > 50000 THEN salary+(salary*0.07)
END AS New_salary,
CASE
    WHEN dept_id = 6 THEN salary+(salary*0.10)
END  AS Bonus
FROM employee_salary;

SELECT *
FROM employee_demographics
WHERE employee_id IN (
SELECT employee_id
FROM employee_salary
WHERE dept_id = 1);

select first_name, salary, 
(SELECT avg(salary)
FROM employee_salary)
FROM employee_salary
group by first_name, salary
;

SELECT gender, AVG(age) , MAX(age), MIn(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT AVG( `MAX(age)` )
FROM 
(SELECT gender, AVG(age) AS avg_age, MAX(age) AS max_age, MIn(age) AS min_age, COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender) AS Agg_table;

SELECT gender, AVG(salary)
FROM employee_demographics As empd
JOIN employee_salary AS emps
ON empd.employee_id = emps.employee_id
GROUP BY gender;

SELECT gender, AVG(salary) OVER ()
FROM employee_demographics As empd
JOIN employee_salary AS emps
ON empd.employee_id = emps.employee_id
;