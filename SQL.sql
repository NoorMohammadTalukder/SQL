USE SAMPLEDB
GO

--select all employess
select *
from hcm.employees;

--Backup Database
BACKUP DATABASE SAMPLEDB
TO DISK = 'D:\SQL BACKUP\SAMPLEDB.bak';

/*Use a SELECT statement to get 
select first_name,last_name
from hcm.employees

/*Use a SELECT statement to get the 
from oes.customers;

select last_name as 'Last Name',city
from oes.customers;

/*Use a SELECT statement to select all columns from the
oes.order_items table*/

select * from oes.order_items;

/*Use a SELECT DISTINCT statement to get the distinct (i.e.
unique) values that occur in the locality column from the
bird.antarctic_populations table.*/

select * from bird.antarctic_populations; 
select distinct locality from bird.antarctic_populations;

/*Use a SELECT DISTINCT statement to get the distinct
combinations of values for both the locality and
species_id columns from the bird.antarctic_populations
table.*/
select 
distinct locality,species_id 
from bird.antarctic_populations;

/*Write a query that returns all employees ordered
alphabetically by their last name from A to Z.*/

select * 
from hcm.employees 
order by last_name asc;

/*Write a query that returns all employees ordered by
salary from highest to lowest.*/

select * 
from hcm.employees
order by salary desc ;

/*Write a query to return all employees ordered by most
recently hired to longest serving*/

select *
from hcm.employees
order by hire_date

/*Write a query to return all employees ordered by
department_id in ascending order and within each
department_id, order by salary from highest to lowest.*/

select *
from hcm.employees
order by department_id asc, salary desc;

/*Write a query to return the employee_id, first_name,
last_name and salary for the top 10 employees who get
paid the most.*/
last_name and salary for the employee or employees
who get paid the least.*/

select employee_id, first_name,last_name,salary 
from hcm.employees
order by salary asc;

/*Select products from the oes.products table which have
a price greater than $100.*/

select * from oes.products;

select * 
from oes.products
where list_price > 100;

/*Select all orders from the oes.orders table which have
not yet been shipped.*/

select * 
from oes.orders
where  shipped_date IS NULL;

/*Select all orders from the oes.orders table which were
placed on the 26th of February 2020.*/

select * 
from oes.orders
where shipped_date='20200226';

select * 
from oes.orders
where shipped_date='2020-02-26';

/*Select all orders from the oes.orders table which were
placed on or after the 1st of January 2020.*/
select * 
from oes.orders
where order_date > '2020-01-01';

select * 
from oes.orders
where order_date > '20200101';

/*Select countries from the hcm.countries table which
start with the letter �N�.*/

select * 
from hcm.countries 
where country_name like 'N%';

/*Select customers from the oes.customers table who
have a Gmail email address.*/

select * 
from oes.customers
where email like '%@gmail.com';

/*Select product names from the oes.products table
which contain the word �mouse� anywhere within the
product name.*/

select product_name 
from oes.products 
where product_name like '%mouse%';

/*Select all product names from the oes.products table
which end in a number.*/

select product_name
from oes.products 
where product_name like '%[0-9]';

/*Write query to give the total number of employees in
each department as given by the department_id column
in the hcm.employees table.*/
SELECT *
FROM hcm.employees;

select department_id, count(employee_id) as Employee_COUNT
from hcm.employees 
group by department_id;

SELECT department_id, COUNT(*) AS employee_count
FROM hcm.employees
GROUP BY department_id;

/*Write a query to give the average salary in each
department as given by the department_id column in the
hcm.employees table. Order the query result by average
salary from highest to lowest.*/

SELECT department_id, AVG(salary) AS AVG_SALARY
FROM hcm.employees
GROUP BY department_id
ORDER BY avg_salary DESC;

/*Write a query to give the total number of products on hand at
each warehouse as given by the warehouse_id column in the
oes.inventories table. Also, limit the result to only
warehouses which have greater than 5,000 product items on
hand.*/

SELECT *
FROM oes.inventories;

select warehouse_id,sum(quantity_on_hand) as 'number of products on hand' 
from oes.inventories
group by warehouse_id
having sum(quantity_on_hand) > 5000;

/*What is the date of the most recent population count at
each locality in the bird.antarctic_populations table?*/
SELECT *
FROM bird.antarctic_populations;

select locality, max(date_of_count) AS date_of_recent_pop_count
from bird.antarctic_populations
group by locality;

/*What is the date of the most recent population count for each
species at each locality in the bird.antarctic_populations
table?*/
select * from bird.antarctic_populations;

select locality,
species_id, Count(date_of_count) AS "Recent Population Count Date"
from bird.antarctic_populations
group by locality, species_id;

/*Select employees from the hcm.employees table who live
in either Seattle or Sydney.*/

select * from hcm.employees; 

select * from hcm.employees
where city='Seattle' or city='Sydney';

/*Select employees who live in any of the following cities:
- Seattle
- Sydney
- Ascot
- Hillston*/

select * from hcm.employees
where city in ('Seattle','Sydney','Ascot','Hillston');

/*Select employees from Sydney who have a salary greater
than $200,000.*/

select * from hcm.employees
where city='Sydney' and salary>200000;

/*Select employees who live in either Seattle or Sydney
and were also hired on or after 1st January 2019.*/

select * from hcm.employees
where (city = 'Seattle' OR city = 'Sydney') 
	  AND hire_date >= '20190101'; --YYYYMMDD

/*Select products from the oes.products table which do
not have a product category_id of either 1, 2, or 5.*/

select *from oes.products
where product_id not in (1,2,5);