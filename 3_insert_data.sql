
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


INSERT INTO suppliers 
VALUES	('Bakery LLC'),
		('Goods 4 U'),
		('Savory Loaf Delivery Co.'),
		('Mrs. Yums'),
		('Grain to Table LLC')


INSERT INTO supplier_delivery_status
VALUES	(1,'Processed'),
		 (2,'Shipped'),
		(3,'Delivered');


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



