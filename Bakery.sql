--Data Definition Language (DDL) , Data Manipulation Language(DML) and Constraints
CREATE DATABASE bakery;

USE bakery

CREATE TABLE products (
  product_id int NOT NULL PRIMARY KEY IDENTITY(1001,1),
  product_name varchar(50) NOT NULL,
  units_in_stock int NOT NULL,
  sale_price decimal(4,2) NOT NULL,
)

INSERT INTO products 
VALUES 	('Chocolate Chip Cookie',200,1.50),
		('Banana Nut Muffin',180,2.50),
		('Croissant',70,1.75),
		('Cheese Danish',55,1.85),
		('Cannoli',112,2.25),
		('Sweet Bread Loaf',32,15.50),
		('Strawberry Macaron',98,2.00),
		('Coffee Cake',25,13.00),
		('Carrot Cake',15,14.50),
		('Chocolate Covered Doughnut',80,1.00)

SELECT * FROM products



CREATE TABLE suppliers (
  supplier_id smallint  NOT NULL PRIMARY KEY IDENTITY(1,1),
  [name] varchar(50) NOT NULL,
) 


INSERT INTO suppliers 
VALUES	('Bakery LLC'),
		('Goods 4 U'),
		('Savory Loaf Delivery Co.'),
		('Mrs. Yums'),
		('Grain to Table LLC')

SELECT * FROM suppliers



CREATE TABLE supplier_delivery_status (
  order_status_id tinyint NOT NULL PRIMARY KEY,
  [name] varchar(50) NOT NULL
  )

INSERT INTO supplier_delivery_status
VALUES	(1,'Processed'),
		 (2,'Shipped'),
		(3,'Delivered');

SELECT * FROM supplier_delivery_status



CREATE TABLE ordered_items (
  order_id int NOT NULL PRIMARY KEY IDENTITY,
  product_id int NOT NULL FOREIGN KEY REFERENCES products(product_id) ON UPDATE CASCADE,
  status tinyint NOT NULL DEFAULT 1 FOREIGN KEY REFERENCES supplier_delivery_status (order_status_id) ON UPDATE CASCADE,
  quantity int NOT NULL,
  unit_price decimal(4,2) NOT NULL,
  shipped_date date DEFAULT NULL,
  shipper_id smallint DEFAULT NULL FOREIGN KEY REFERENCES suppliers(supplier_id) ON UPDATE CASCADE,
  FOREIGN KEY(order_id) REFERENCES ordered_items(order_id)
) 

INSERT INTO ordered_items
VALUES  (1004,1,53,0.35,'2021-08-15',1),
		(1001,2,73,0.29,'2022-03-21',2),
		(1004,3,10,0.35,'2022-02-07',5),
		(1006,2,63,5.28,'2021-06-09',4),
		(1003,1,21,0.50,'2021-09-06',1),
		(1003,2,85,0.50,'2022-06-22',3),
		(1010,3,42,0.39,'2021-05-13',4),
		(1002,1,100,1.89,'2022-02-03',2),
		(1001,2,35,0.29,'2021-11-06',3),
		(1002,2,54,1.89,'2022-12-23',5),
		(1003,3,10,0.50,'2022-04-05',1),
		(1005,3,55,0.47,'2021-05-22',2),
		(1003,3,12,0.50,'2022-06-26',1),
		(1005,2,70,0.47,'2021-09-21',5),
		(1008,2,96,8.59,'2022-11-10',3),
		(1006,3,43,5.28,'2022-10-15',1),
		(1001,1,33,0.29,'2022-01-06',1),
		(1009,3,23,4.28,'2022-07-23',1)

SELECT * FROM ordered_items



CREATE TABLE customers (
  customer_id int NOT NULL PRIMARY KEY IDENTITY(100101,1),
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  birth_date date DEFAULT NULL,
  phone varchar(50) DEFAULT NULL,
  [address] varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  state char(2) NOT NULL,
  total_money_spent int NOT NULL DEFAULT 0
) 

INSERT INTO customers
VALUES  ('Kevin','Malone','1989-04-28','635-573-9754','1229 Main Street','Scranton','PA',11000),
		('Charles','Xavier','1965-04-11','729-287-9456','123 North Hill Drive','Dallas','TX',947),
		('Finley','Danish','1999-02-07','126-583-7856','432 Hilly Road','Austin','TX',534),
		('Obi','Kenobi','1921-04-22','975-357-7663','101 Alpine Avenue','New York','NY',3567),
		('Don','Draper','1948-11-07',NULL,'12 South Main Lane','San Francisco','CA',195),
		('Frodo','Baggins','2001-09-04',NULL,'1 Pastery Lane','Chicago','IL',56),
		('Michael','Scott','1978-08-20','235-357-3464','987 Croissant Street','Scranton','PA',2536),
		('Maggie','Muffin','2001-07-06','906-485-1542','701 North Street','Sarasota','FL',1009),
		('Kelly','Kapoor','1987-05-30','674-357-9151','62810 Julip Lane','Scranton','PA',540),
		('Anakin','Skywalker','1934-10-15','346-458-3370','122 South Street','Charleston','SC',36)

SELECT * FROM customers



CREATE TABLE customer_orders(
  order_id int NOT NULL PRIMARY KEY IDENTITY(1,1),
  customer_id int NOT NULL FOREIGN KEY REFERENCES customers(customer_id) ON UPDATE CASCADE,
  product_id int NOT NULL FOREIGN KEY REFERENCES products(product_id) ON UPDATE CASCADE,
  order_date date NOT NULL,
  order_tota decimal(4,2) NOT NULL,
  tip varchar(2000) DEFAULT NULL
)

INSERT INTO customer_orders 
VALUES (100101,1001,'2020-01-30',26.24,2),
		(100110,1002,'2021-08-25',6.19,1),
		(100106,1005,'2022-12-12',3.87,0),
		(100103,1007,'2018-03-22',4.00,5),
		(100102,1003,'2017-08-25',9.97,10),
		(100108,1009,'2018-11-18',87.01,1),
		(100101,1001,'2022-09-20',2.45,5),
		(100104,1008,'2018-06-08',16.42,0),
		(100105,1007,'2019-07-05',8.11,1),
		(100106,1006,'2018-04-22',53.12,3),
		(100103,1001,'2019-11-18',27.01,1),
		(100101,1003,'2018-09-20',10.45,5),
		(100106,1008,'2020-06-08',90.42,0),
		(100102,1009,'2022-07-05',11.11,1),
		(100104,1006,'2020-04-22',24.12,3)

SELECT * FROM customer_orders




CREATE TABLE customer_orders_review (
  order_id int NOT NULL PRIMARY KEY IDENTITY(1,1),
  customer_id int NOT NULL,
  product_id int NOT NULL,
  order_date date NOT NULL,
  [Rating_1-10] int NOT NULL 
) 

INSERT INTO customer_orders_review 
VALUES  (100101,1001,'2020-01-30',8),
		(100110,1002,'2021-08-25',5),
		(100111,1005,'2022-12-12',10),
		(100103,1007,'2081-03-22',7),
		(100102,1003,'2017-08-25',6),
		(100101,1001,'2022-09-20',8),
		(100104,1008,'2018-06-08',9),
		(100105,1007,'2019-07-05',6),
		(100106,1006,'2018-04-22',8),
		(100103,1001,'2019-11-18',6),
		(1001001,1003,'2018-09-20',9),
		(100106,1008,'2020-06-08',10),
		(100102,1009,'2023-07-05',8),
		(100104,1006,'2020-04-22',7)

SELECT * FROM customer_orders_review



CREATE TABLE employees (
  employee_id int NOT NULL PRIMARY KEY IDENTITY(1,1),
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  department varchar(50) NOT NULL,
  title varchar(50) NOT NULL,
  salary int NOT NULL
) 

INSERT INTO employees 
VALUES  ('Christine','Freberg','Bakery','Lead Baker', 70000),
		('Dwight','Schrute','Bakery','Assistant to the Lead Baker', 45000),
		('Tom','Haveford','Bakery','Chocolatier', 45000),
		('Ann','Perkins','Bakery','Bakery Clerk', 30000),
		('Carl','Lorthner','Bakery','Dough Maker', 40000),
		('Ron','Swanson','Marketing','Director of Marketing', 75000),
		('Troy','Barnes','Marketing','Lead Marketer', 60000),
		('Jeff','Winger','Marketing','Marketing Analyst', 60000),
		('Annie','Edison','Marketing','Social Media Marketer', 65000)

SELECT * FROM employees


SELECT TOP 5 * FROM customers


--String Functions
SELECT LOWER(LEFT(first_name,1))lowername, 
 REPLACE(First_name, LEFT(First_name,1), LOWER(LEFT(first_name,1)))newname_ ,first_name
 from customers


SELECT TOP 5 CONCAT(customer_id, LEFT(first_name, 2))customer_code, * FROM customers

SELECT * FROM employees

select first_name + CAST(salary AS VARCHAR) FROM employees


SELECT first_name, last_name,
CONCAT_WS(' ', first_name, last_name)fullname
FROM employees
ORDER BY fullname

SELECT CONCAT_WS(' ', first_name, last_name)fullname,
	employee_id,
	department, 
	title,
	salary
FROM employees
ORDER BY fullname


SELECT * FROM customers

SELECT first_name, 
last_name,
phone AS oldphone ,
REPLACE(phone, LEFT(phone, 3), '234')newPhone
FROM customers


SELECT first_name,
last_name,
phone oldphone,
STUFF(phone, 1,3,'234')newphone
FROM customers


SELECT first_name,
last_name,
phone oldphone,
SUBSTRING(phone, CHARINDEX('-', phone) +1,3)area_code
FROM customers


SELECT first_name, 
last_name,
phone, 
CONCAT('+234-', phone)newphone
FROM customers

SELECT employee_id,
first_name,
last_name,
department,
title,
STUFF(Salary, 2,4, '*******')salary
FROM employees

SELECT * FROM customers

SELECT first_name FROM customers
WHERE LEFT(First_name, 1) IN('a', 'e', 'i', 'o', 'u')

SELECT first_name FROM customers
WHERE LEFT(First_name, 1) NOT IN('a', 'e', 'i', 'o', 'u')

SELECT first_name FROM customers
WHERE LEFT(First_name, 1) LIKE '[aeiou]'

SELECT first_name FROM customers
WHERE LEFT(First_name, 1) LIKE '[^aeiou]'


SELECT GETDATE()today, DATENAME(weekday, GETDATE())weekname

SELECT * FROM [dbo].[customer_orders]
SELECT * FROM [dbo].[ordered_items]

--Views
CREATE VIEW vw_order_shipped AS
SELECT o.*, co.customer_id, Order_date FROM ordered_items o
LEFT JOIN customer_orders co 
ON co.order_id = o.order_id

SELECT * from vw_order_shipped


--Date Functions
SELECT Order_date, shipped_date, DATEDIFF(MONTH, Order_date, shipped_date)Monthtodeliver,
DATENAME(dw, shipped_date)deliveryDay,
DATENAME(MONTH,shipped_date)deliverymonth
FROM vw_order_shipped


SELECT order_id, 
	customer_id,
	product_id,
	order_date,
	DATEADD(DAY, 7, order_date)production_date,
	DATEADD(DAY, 7, DATEADD(DAY, 7, order_date))finished_product,
	shipped_date,
	DATEDIFF(DAY, order_date, shipped_date)daystodeliver
FROM vw_order_shipped

SELECT order_date, EOMONTH(order_date)lastday_month
FROM vw_order_shipped

SELECT EOMONTH(GETDATE())

SELECT order_date, FORMAT(order_date, 'MM-yy')formatteddate
FROM vw_order_shipped


SELECT * FROM customers
SELECT * FROM employees

SELECT First_name,
last_name,
DATEDIFF(YEAR, birth_date, GETDATE()) age,
phone,
city,
CASE
	WHEN DATEDIFF(YEAR, birth_date, GETDATE()) BETWEEN 20 AND 35 THEN CONCAT('hey smallie ', LEFT(first_name,3), '!')
	WHEN DATEDIFF(YEAR, birth_date, GETDATE()) BETWEEN 36 AND 50 THEN CONCAT('hey youngie ', LEFT(first_name,3), '!')
	WHEN DATEDIFF(YEAR, birth_date, GETDATE()) BETWEEN 51 AND 70 THEN CONCAT('hey zaddie ', LEFT(first_name,3), '!')
	WHEN DATEDIFF(YEAR, birth_date, GETDATE()) BETWEEN 71 AND 90 THEN CONCAT('hey oldie ', LEFT(first_name,3), '!')
	ELSE CONCAT('hey granny ', LEFT(first_name, 3), '!')
END AS agecategory
FROM customers



--Conditional logic (IIF Function)
SELECT first_name,
Last_name,
department, 
salary,
IIF(department != 'bakery', 'Admin','Baker')workers_category
FROM employees

SELECT * FROM customers
SELECT * FROM employees


--Aggregate , Union  and Grouping Sets Functions
SELECT city,
state, 
SUM(total_money_spent)Total_spending
FROM customers
GROUP BY city, State

UNION ALL

SELECT city, NULL, SUM(total_money_spent)Total_spending
FROM customers
GROUP BY city

UNION ALL

SELECT NULL, state, SUM(total_money_spent)Total_spending
FROM customers
GROUP BY state

UNION ALL

SELECT NULL, NULL, SUM(total_money_spent)Total_spending
FROM customers
GROUP BY ()


SELECT city, state, SUM(total_money_spent)Total_spending
FROM customers
GROUP BY
	GROUPING SETS(
			(city, state),
			(city),
			(state),
			() 
		)
ORDER BY GROUPING(city),GROUPING(state)

SELECT city, state, SUM(total_money_spent)Total_spending
FROM customers
GROUP BY ROLLUP(city, state)

SELECT city, SUM(total_money_spent)Total_spending
FROM customers
GROUP BY ROLLUP(city)

SELECT state, SUM(total_money_spent)total_spending
FROM customers
GROUP BY state WITH ROLLUP

SELECT * FROM employees

SELECT department, 
SUM(salary)Totalsalary, 
MAX(salary)Highestsalary,
MIN(salary)LowestSalary
FROM employees
GROUP BY ROLLUP(department)


SELECT city, state, SUM(total_money_spent)Total_spending
FROM customers
GROUP BY CUBE(city,state)

SELECT state, city, SUM(total_money_spent)total_spending
FROM customers
GROUP BY state, city WITH ROLLUP

SELECT * FROM customers
SELECT  * from [dbo].[ordered_items]
SELECT * FROM[dbo].[customer_orders]


SELECT first_name, last_name,'spender' AS Category
FROM customers
WHERE total_money_spent > 1000
UNION ALL
SELECT first_name, last_name,'generous' AS Category
FROM customers c LEFT JOIN customer_orders co
ON c.customer_id = co.customer_id
WHERE tip > 3
ORDER BY first_name

SELECT * FROM [customer_orders]

 SELECT order_date, YEAR(order_date),  YEAR(GETDATE()) -1, DAY(GETDATE())
 FROM [customer_orders]


 --Window Functions
SELECT *, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id)Rownumber
FROM customer_orders

SELECT * FROM employees

SELECT department, 
salary,
DENSE_RANK() OVER(ORDER BY salary DESC)salaryranking 
FROM employees;

WITH CTEsalary AS (
     SELECT department, salary, DENSE_RANK() OVER(ORDER BY salary DESC)salaryrank FROM employees
		)
SELECT department, salary from CTEsalary WHERE salaryrank = 4

SELECT  * from [dbo].[customers]

SELECT customer_id, 
First_name,
phone, 
city,
total_money_spent,
SUM(total_money_spent) OVER(ORDER BY customer_id)Running_money_spent
FROM dbo.customers


SELECT employee_id,
First_name, 
title,
salary,
NTILE(3) OVER(ORDER BY salary DESC)salarygroup
FROM employees

SELECT  * from customer_orders

select order_date, order_total, sum(order_total) OVER( PARTITION BY YEAR(order_date) ORDER BY  order_id)
FROM customer_orders

SELECT city, total_money_spent, SUM(total_money_spent) OVER( PARTITION BY city ORDER BY city) Totalsales
FROM customers
HAVING  SUM(total_money_spent) OVER( PARTITION BY city ORDER BY city) > 1000


SELECT city, SUM(total_money_spent)  Totalsales
FROM customers
GROUP BY city
HAVING  SUM(total_money_spent)  > 1000


SELECT order_id, 
       (SELECT p.product_name FROM Products p WHERE p.product_id = o.product_id)Product_name,
	order_date,
	Order_total, 
	LEAD(order_total, 1, 0) OVER(ORDER BY product_id)forward,
	LAG(order_total, 1, 0) OVER(ORDER BY product_id)Back
FROM customer_orders o

SELECT *,
LEAD(units_in_stock,1,0) OVER(ORDER BY product_id)forward,
LAG(units_in_stock,1,0) OVER(ORDER BY product_id)back
FROM Products

SELECT * FROM customer_sweepstakes_staging

SELECT * 
INTO dbo.customer_sweepstakes
FROM customer_sweepstakes_staging

SELECT * FROM customer_sweepstakes


SELECT * FROM customer_sweepstakes

SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id)row_num
FROM  customer_sweepstakes


SELECT sweepstake_id FROM (
			SELECT sweepstake_id,
			ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id)row_num
			FROM  customer_sweepstakes)row_table
WHERE row_num > 1


DELETE FROM customer_sweepstakes
WHERE sweepstake_id IN (
					SELECT sweepstake_id 
					FROM (
						SELECT sweepstake_id,
						ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id)row_num
						FROM  customer_sweepstakes)row_table
					WHERE row_num > 1)

--Data Cleaning and Standardizing
SELECT phone,  REPLACE(phone, '-', ' '), 
REPLACE(phone, '(', ' '),
REPLACE(phone, ')', ' '),
REPLACE(phone, '/', ' ')
FROM customer_sweepstakes


SELECT phone,  
 REPLACE(REPLACE(REPLACE(REPLACE(phone, '-', ' '), '(', ' '),  ')', ' '), '/', ' ')
FROM customer_sweepstakes


UPDATE customer_sweepstakes
SET phone =
 REPLACE(REPLACE(REPLACE(REPLACE(phone, '-', ''), '(', ''),  ')', ''), '/', '')
FROM customer_sweepstakes

SELECT * FROM customer_sweepstakes


UPDATE customer_sweepstakes
SET phone =
REPLACE(phone, ' ', '')


SELECT phone,
SUBSTRING(phone, 1, 3), SUBSTRING(phone, 4, 3), SUBSTRING(phone, 7, 4),
CONCAT_WS('-', SUBSTRING(phone, 1, 3), SUBSTRING(phone, 4, 3), SUBSTRING(phone, 7, 4))
FROM customer_sweepstakes


UPDATE customer_sweepstakes
SET phone =
CONCAT_WS('-', SUBSTRING(phone, 1, 3), SUBSTRING(phone, 4, 3), SUBSTRING(phone, 7, 4))
WHERE phone <> ''

			
SELECT phone, LTRIM(phone) FROM customer_sweepstakes


SELECT birth_date FROM  customer_sweepstakes


ALTER TABLE customer_sweepstakes
ALTER COLUMN birth_date DATE

SELECT birth_date FROM  customer_sweepstakes
WHERE ISDATE(birth_date) = 0


SELECT birth_date, REPLACE(birth_date, '1978-20-08', '08/20/1978') FROM  customer_sweepstakes
WHERE ISDATE(birth_date) = 0


SELECT birth_date, CONVERT(DATE, birth_date, 101)
FROM  customer_sweepstakes
WHERE ISDATE(birth_date) = 1


SELECT birth_date,
SUBSTRING(birth_date, 1,4) + '-' + SUBSTRING(birth_date, 6,1) +'-' + SUBSTRING(birth_date, 10,1)
FROM customer_sweepstakes
WHERE ISDATE(birth_date) = 0


UPDATE customer_sweepstakes 
SET birth_date =
SUBSTRING(birth_date, 1,4) + '-' + SUBSTRING(birth_date, 6,1) +'-' + SUBSTRING(birth_date, 10,1)
WHERE ISDATE(birth_date) = 0


SELECT birth_date FROM  customer_sweepstakes
WHERE ISDATE(birth_date) = 1

SELECT birth_date FROM  customer_sweepstakes
WHERE ISDATE(birth_date) = 0


SELECT birth_date, REPLACE(birth_date, '1978-20-08', '08/20/1978') 
FROM  customer_sweepstakes


UPDATE customer_sweepstakes 
SET birth_date = '05/30/1978'
WHERE birth_date = '1978-30-5'


SELECT birth_date, CONVERT(DATE, birth_date)
FROM  customer_sweepstakes
WHERE ISDATE(birth_date) = 1

UPDATE customer_sweepstakes
SET birth_date = CONVERT(DATE, birth_date)

SELECT * FROM customer_sweepstakes

SELECT [Are_you_over_18],
CASE 
	WHEN  [Are_you_over_18] = 'Yes' THEN 'Y'
	WHEN  [Are_you_over_18] = 'No' THEN 'N'
	ELSE [Are_you_over_18]
END
FROM customer_sweepstakes


UPDATE customer_sweepstakes
SET [Are_you_over_18] = CASE 
	WHEN  [Are_you_over_18] = 'Yes' THEN 'Y'
	WHEN  [Are_you_over_18] = 'No' THEN 'N'
	ELSE [Are_you_over_18]
END


SELECT address, CHARINDEX(',', address)textindex,
RIGHT(address, CHARINDEX(',' , address)) FROM customer_sweepstakes

SELECT address, 
SUBSTRING(address, CHARINDEX(',', address) +1, LEN(address) -  CHARINDEX(',', address))citystate,
LEFT(address, CHARINDEX(',' , address)-1)street,
RIGHT(address, LEN(address) - CHARINDEX(',' , address)-1)
FROM customer_sweepstakes


SELECT address, 
SUBSTRING(address, CHARINDEX(',', address) +1, LEN(address) -  CHARINDEX(',', address))citystate,
LEFT(address, CHARINDEX(',' , address)-1)street,
RIGHT(address, 2) state
FROM customer_sweepstakes


SELECT address, 
LEFT(address, CHARINDEX(',' , address)-1)street,
RIGHT(address, 2) state,
LEFT(RIGHT(address, LEN(address) - CHARINDEX(',', address)), CHARINDEX(',', RIGHT(address, LEN(address) - CHARINDEX(',', address)))-1)city
FROM customer_sweepstakes


ALTER TABLE customer_sweepstakes
ADD street VARCHAR(50)

ALTER TABLE customer_sweepstakes
ADD city VARCHAR(20)

ALTER TABLE customer_sweepstakes
ADD state VARCHAR(4)

SELECT * FROM customer_sweepstakes
SELECT * FROM customer_sweepstakes_staging

SELECT address FROM customer_sweepstakes
SELECT address FROM customer_sweepstakes_staging
UPDATE customer_sweepstakes
SET street = TRIM(LEFT(address, CHARINDEX(',' , address)-1))

UPDATE customer_sweepstakes
SET city = TRIM(LEFT(RIGHT(address, LEN(address) - CHARINDEX(',', address)), CHARINDEX(',', RIGHT(address, LEN(address) - CHARINDEX(',', address)))-1))

UPDATE customer_sweepstakes
SET state = TRIM(RIGHT(address, 2))


SELECT birth_date, [Are_you_over_18], YEAR(GETDATE()) - YEAR(birth_date)
FROM customer_sweepstakes


UPDATE [dbo].[customer_sweepstakes]
SET birth_date = '2008-07-21'
WHERE  [sweepstake_id] = 10


SELECT birth_date,
[Are_you_over_18],
YEAR(GETDATE()) - YEAR(birth_date),
CASE
	WHEN YEAR(GETDATE()) - YEAR(birth_date) > 18 THEN 'Y'
	WHEN YEAR(GETDATE()) - YEAR(birth_date) < 18 THEN 'N'
	ELSE [Are_you_over_18]
END 'over_18'
FROM customer_sweepstakes


UPDATE customer_sweepstakes
SET   [Are_you_over_18] =
CASE
	WHEN YEAR(GETDATE()) - YEAR(birth_date) > 18 THEN 'Y'
	WHEN YEAR(GETDATE()) - YEAR(birth_date) < 18 THEN 'N'
	ELSE [Are_you_over_18]
END

SELECT [sweepstake_id], birth_date from customer_sweepstakes

UPDATE customer_sweepstakes
SET birth_date ='1934-10-15'
WHERE [sweepstake_id] = 12


SELECT CONVERT(DATE, birth_date)
FROM [dbo].[customer_sweepstakes]


SELECT birth_date, CONVERT(DATE, birth_date)
FROM  customer_sweepstakes
WHERE ISDATE(birth_date) = 1

UPDATE customer_sweepstakes
SET birth_date = CONVERT(DATE, birth_date)


SELECT birth_date,
[Are_you_over_18],
YEAR(GETDATE()) - YEAR(birth_date),
CASE
	WHEN YEAR(GETDATE()) - YEAR(birth_date) > 18 THEN 'Y'
	WHEN YEAR(GETDATE()) - YEAR(birth_date) < 18 THEN 'N'
	ELSE [Are_you_over_18]
END 'over_18'
FROM customer_sweepstakes


UPDATE customer_sweepstakes
SET  [Are_you_over_18] =
CASE
	WHEN YEAR(GETDATE()) - YEAR(birth_date) > 18 THEN 'Y'
	WHEN YEAR(GETDATE()) - YEAR(birth_date) < 18 THEN 'N'
	ELSE [Are_you_over_18]
END

SELECT * FROM customer_sweepstakes

ALTER TABLE customer_sweepstakes
DROP COLUMN favorite_color

SELECT state, LTRIM(UPPER(state))
FROM customer_sweepstakes

UPDATE customer_sweepstakes
SET state = UPPER(state)

SELECT * FROM ordered_items

SELECT * FROM suppliers

SELECT * FROM customer_orders


--Joins
SELECT [name],
SUM(order_total)Total_amount
FROM suppliers s
JOIN ordered_items oi
	ON s.supplier_id = oi.shipper_id
JOIN customer_orders co
	ON oi.order_id = co.order_id
GROUP BY [name]


SELECT *
--count(*), SUM(order_total)Total_amount
FROM suppliers s
JOIN ordered_items oi
	ON s.supplier_id = oi.shipper_id
JOIN customer_orders co
	ON oi.order_id = co.order_id
--GROUP BY [name]
ORDER BY name


SELECT *
--count(*), SUM(order_total)Total_amount
FROM suppliers s
JOIN ordered_items oi
	ON s.supplier_id = oi.shipper_id
JOIN customer_orders co
	ON oi.product_id = co.product_id
	AND  oi.order_id = co.order_id
	--group by name
ORDER BY name

SELECT * FROM employees

SELECT e1.employee_id, 
e1.first_name,
e2.employee_id boss_id, 
e2.first_name boss_name
FROM employees e1
JOIN employees e2
	ON e1.employee_id +1 = e2.employee_id


--Subqueries
SELECT first_name, Salary FROM (
	SELECT first_name,
	salary,
	DENSE_RANK() OVER(ORDER BY salary DESC) rank_sal
	FROM employees)salary_ranking
WHERE rank_sal = 2;

SELECT TOP 1 employee_id, first_name FROM employees
WHERE salary NOT IN 
			(select MAX(salary) FROM employees)
ORDER BY salary DESC

SELECT * FROM customer_orders

SELECT customer_id,
order_total, (SELECT AVG(order_total) FROM customer_orders)average_order_total
FROM customer_orders
WHERE order_total > (SELECT AVG(order_total) FROM customer_orders)


SELECT * FROM customer_orders

SELECT customer_id, order_total,
SUM(order_total) OVER(PARTITION BY customer_id ORDER BY order_total ASC) Rolling_total
FROM customer_orders

SELECT customer_id, order_total,
SUM(order_total) OVER(PARTITION BY customer_id ORDER BY order_total ASC) Rolling_total,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total DESC)Rownumber
FROM customer_orders


SELECT customer_id, order_total, rolling_total, rownumber
FROM
	(SELECT customer_id, order_total,
	SUM(order_total) OVER(PARTITION BY customer_id ORDER BY order_total ASC) Rolling_total,
	ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total DESC)Rownumber
	FROM customer_orders)highest_row
WHERE rownumber = 1

SELECT customer_id, order_total, rolling_total, rownumber
FROM
	(SELECT customer_id, order_total,
	SUM(order_total) OVER(PARTITION BY customer_id ORDER BY order_total ASC) Rolling_total,
	ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total DESC)Rownumber
	FROM customer_orders)highest_row
WHERE rownumber IN(1,2)


SELECT * FROM customer_orders

SELECT * FROM customers

SELECT c.customer_id, first_name, last_name, o.order_id
FROM customers c
LEFT JOIN customer_orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL

SELECT * FROM employees
SELECT * FROM customers

SELECT first_name, last_name, 'Big man' AS Label
FROM Employees 
WHERE salary > (SELECT AVG(salary) FROM employees)

UNION 

SELECT first_name, last_name, 'Spender' Label
FROM customers
WHERE total_money_spent > (SELECT AVG(total_money_spent) FROM customers)

SELECT * FROM customer_orders

SELECT order_date, 
YEAR(order_date) Yr,
EOMONTH(order_date)end_of_month,
DATEPART(QUARTER, order_date)Qtr, 
DATENAME(dw, order_date)
FROM customer_orders

SELECT order_date, 
DATEADD(DAY, +7 , order_date) production_date,
DATEADD(DAY, 7, DATEADD(DAY, 7, order_date)) delivery_date
FROM customer_orders

SELECT * FROM employees

SELECT * , REPLACE(title, SUBSTRING(title, PATINDEX('%mark%', title), Len(title)), 'Sales')new_title
FROM employees

SELECT * , STUFF(title, PATINDEX('%mark%', title), LEN(title) - PATINDEX('%mark%', title), 'Sales')new_title
FROM employees


SELECT * ,
IIf( title LIKE '%Mark%',
        STUFF(title, PATINDEX('%mark%', title) , LEN(title) , 'Sales'),
		title) new_title
FROM employees



--Conditional logic (CASE Statement)
SELECT * ,
CASE
WHEN title LIKE '%Mark%' THEN STUFF(title, PATINDEX('%mark%', title) , LEN(title) , 'Sales')
ELSE title
END AS new_title
FROM employees

SELECT * FROM products
WHERE sale_price % 2 = 1    --odd price

SELECT * FROM products
WHERE sale_price % 2 = 0     --even price

SELECT * FROM ordered_items
SELECT * FROM products


--Null Function
SELECT product_name,
units_in_stock inventory,
quantity quantity_sold,
sale_price,
unit_price,
ISNULL(sale_price - unit_price, sale_price)profit
FROM products p
LEFT JOIN ordered_items o
ON p.product_id = o.product_id


SELECT * FROM employees


SELECT department, title, SUM(salary) highest_salary
FROM employees
GROUP BY
GROUPING SETS(
	(title),
	(department),
	()
)

SELECT first_name,
department,
SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS Total_salary
FROM employees

SELECT * FROM ordered_items

SELECT *,
SUM(quantity) OVER(PARTITION BY product_id ORDER BY quantity DESC) total_orders,
MAX(unit_price) OVER(PARTITION BY product_id ORDER BY unit_price) highest_price
FROM ordered_items


SELECT *,
SUM(quantity) OVER(PARTITION BY product_id ORDER BY order_id) rolling_orders,
MAX(unit_price) OVER(PARTITION BY product_id ORDER BY order_id) highest_price
FROM ordered_items



SELECT *,
RANK() OVER(ORDER BY salary DESC) ranking,
DENSE_RANK() OVER( ORDER BY salary DESC) dense_ranking
FROM employees;


--WITH Statement (CTE)
WITH cte_salary 
AS(
  SELECT *,
  RANK() OVER(ORDER BY salary DESC) ranking,
  DENSE_RANK() OVER( ORDER BY salary DESC) dense_ranking
  FROM employees
)
SELECT * FROM cte_salary 
WHERE dense_ranking = 4


WITH cte_salary 
AS(
  SELECT *,
  RANK() OVER(PARTITION BY department ORDER BY salary DESC) ranking,
  DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) dense_ranking
  FROM employees
)
SELECT * FROM cte_salary 
WHERE dense_ranking = 2 AND department = 'Marketing'


SELECT * 
FROM (
  SELECT *,
  RANK() OVER(PARTITION BY department ORDER BY salary DESC) ranking,
  DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) dense_ranking
  FROM employees
)salary_rank
WHERE dense_ranking = 2 AND department = 'Marketing'



SELECT * FROM ordered_items

DELETE *
FROM
   (SELECT * ,
   ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY Product_id)rownumber
   FROM ordered_items)duplicates
WHERE rownumber > 1


SELECT product_id, quantity,
LAG(quantity,1) OVER(PARTITION BY product_id ORDER BY product_id)prior_order,
LEAD(quantity, 1) OVER(PARTITION BY product_id ORDER BY product_id)next_order
FROM ordered_items
