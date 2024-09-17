USE `seschool_08`;

CREATE TABLE IF NOT EXISTS `Customers` (
	`id` BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(200) NOT NULL DEFAULT 'Имя клиета',
	`gender` VARCHAR(200) NOT NULL DEFAULT 'Пол клиента',
	`age` INT(100) NOT NULL
);



CREATE TABLE IF NOT EXISTS `Orders` (
	`id` BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`customer_id` BIGINT(8) UNSIGNED NOT NULL,
	`order_date` DATE NOT NULL,
	FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`id`)
);



CREATE TABLE IF NOT EXISTS `Dishes` (
	`id` BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(200) NOT NULL,
	`price` DECIMAL(5,2) NOT NULL,
	`category` VARCHAR(200) NOT NULL
);



CREATE TABLE IF NOT EXISTS `Order_Dishes` (
	`order_id` BIGINT(8) UNSIGNED NOT NULL,
	`dish_id` BIGINT(8) UNSIGNED NOT NULL,
	`quantity` INT(11) NOT NULL,
	FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`),
	FOREIGN KEY (`dish_id`) REFERENCES `Dishes` (`id`)
);



INSERT INTO `Customers` (`name`, `gender`, `age`) VALUES
	('Alice', 'Female', 30),
	('Bob', 'Male', 35),
	('Charlie', 'Male', 28),
	('Diana', 'Female', 40),
	('Edward', 'Male', 22),
	('Fiona', 'Female', 26),
	('George', 'Male', 33),
	('Hannah', 'Female', 29),
	('Ian', 'Male', 31),
	('Julia', 'Female', 27);
	


INSERT INTO `Dishes` (`name`, `price`, `category`) VALUES
	('Caesar Salad', 9.99, 'Appetizer'),
	('Steak', 19.99, 'Main Course'),
	('Chocolate Cake', 5.99, 'Dessert'),
	('Pasta', 12.99, 'Main Course'),
	('Bruschetta', 7.49, 'Appetizer'),
	('Ice Cream', 4.99, 'Dessert'),
	('Chicken Curry', 14.99, 'Main Course'),
	('Greek Salad', 8.99, 'Appetizer'),
	('Tiramisu', 6.99, 'Dessert'),
	('Pizza', 11.99, 'Main Course');
	
	
	
INSERT INTO `Orders` (`customer_id`, `order_date`) VALUES
	(1, '2023-10-01'),
	(2, '2023-10-02'),
	(3, '2023-10-03'),
	(4, '2023-10-04'),
	(5, '2023-10-05'),
	(6, '2023-10-06'),
	(7, '2023-10-07'),
	(8, '2023-10-08'),
	(9, '2023-10-09'),
	(10, '2023-10-10');


	
INSERT INTO `Order_Dishes` (`order_id`, `dish_id`, `quantity`) VALUES
	(1, 1, 2),
	(1, 2, 1),
	(2, 3, 1),
	(2, 4, 2),
	(3, 5, 3),
	(3, 6, 1),
	(4, 7, 1),
	(4, 8, 2),
	(5, 9, 1),
	(5, 10, 1);
	
	
	
SELECT DISTINCT `Customers`.`name`, `Orders`.`order_date` 
	FROM `Customers` 
	JOIN `Orders`ON `Customers`.`id` = `Orders`.`customer_id`
	ORDER BY `Customers`.`name`ASC, `Orders`.`order_date`ASC;
	

SELECT DISTINCT `Customers`.`name`, `Dishes`.`name`
	FROM `Order_Dishes` 
	JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	JOIN `Customers` ON `Customers`.`id` = `Orders`.`customer_id`
	ORDER BY `Customers`.`name`ASC, `Dishes`.`name`ASC;
	
	
SELECT `Customers`.`name`, SUM(`Dishes`.`price`) 
	FROM `Order_Dishes` 
	JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	JOIN `Customers` ON `Customers`.`id` = `Orders`.`customer_id`
	GROUP BY `Customers`.`name`
	ORDER BY SUM(`Dishes`.`price`) DESC;
	
	
SELECT `Customers`.`name`, COUNT(`Order_Dishes`.`quantity`)
	FROM `Order_Dishes` 
	JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	JOIN `Customers` ON `Customers`.`id` = `Orders`.`customer_id`
	GROUP BY `Customers`.`name`
	ORDER BY  COUNT(`Order_Dishes`.`quantity`) ASC;
	
	
SELECT `Dishes`.`name`, COUNT(`Order_Dishes`.`quantity`)
	FROM `Order_Dishes` 
	JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	JOIN `Customers` ON `Customers`.`id` = `Orders`.`customer_id`
	GROUP BY `Dishes`.`name`
	ORDER BY COUNT(`Order_Dishes`.`quantity`) DESC;


SELECT DISTINCT `Customers`.`name`
	FROM `Order_Dishes` 
	JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	JOIN `Customers` ON `Customers`.`id` = `Orders`.`customer_id`
	WHERE `Dishes`.`price` > 50;
	
	
SELECT `Customers`.`name`, `Orders`.`order_date`, `Order_Dishes`.`quantity`
	FROM `Order_Dishes` 
	JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	JOIN `Customers` ON `Customers`.`id` = `Orders`.`customer_id`
	ORDER BY `Customers`.`name`, `Orders`.`order_date`;
	
	
SELECT `Dishes`.`category`, COUNT(*)
	FROM `Order_Dishes` 
	JOIN `Orders` ON `Order_Dishes`.`order_id` = `Orders`.`id`
	JOIN `Dishes` ON `Order_Dishes`.`dish_id` = `Dishes`.`id`
	JOIN `Customers` ON `Customers`.`id` = `Orders`.`customer_id`
	GROUP BY `Dishes`.`category`
	ORDER BY COUNT(*) DESC;