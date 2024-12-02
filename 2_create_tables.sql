CREATE TABLE products (
  product_id int NOT NULL PRIMARY KEY IDENTITY(1001,1),
  product_name varchar(50) NOT NULL,
  units_in_stock int NOT NULL,
  sale_price decimal(4,2) NOT NULL,
)


CREATE TABLE suppliers (
  supplier_id smallint  NOT NULL PRIMARY KEY IDENTITY(1,1),
  [name] varchar(50) NOT NULL,
) 

CREATE TABLE supplier_delivery_status (
  order_status_id tinyint NOT NULL PRIMARY KEY,
  [name] varchar(50) NOT NULL
  )


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


CREATE TABLE customer_orders(
  order_id int NOT NULL PRIMARY KEY IDENTITY(1,1),
  customer_id int NOT NULL FOREIGN KEY REFERENCES customers(customer_id) ON UPDATE CASCADE,
  product_id int NOT NULL FOREIGN KEY REFERENCES products(product_id) ON UPDATE CASCADE,
  order_date date NOT NULL,
  order_tota decimal(4,2) NOT NULL,
  tip varchar(2000) DEFAULT NULL
)


CREATE TABLE customer_orders_review (
  order_id int NOT NULL PRIMARY KEY IDENTITY(1,1),
  customer_id int NOT NULL,
  product_id int NOT NULL,
  order_date date NOT NULL,
  [Rating_1-10] int NOT NULL 
) 


CREATE TABLE employees (
  employee_id int NOT NULL PRIMARY KEY IDENTITY(1,1),
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  department varchar(50) NOT NULL,
  title varchar(50) NOT NULL,
  salary int NOT NULL
) 
