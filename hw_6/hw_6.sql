


CREATE TABLE IF NOT EXISTS `Categories` (
	`id` BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`category_name` VARCHAR(50) NOT NULL);



CREATE TABLE IF NOT EXISTS `Products` (
	`id` BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`product_name` VARCHAR(50) NOT NULL,
	`price` INT NOT NULL,
	`category_id` BIGINT(8) UNSIGNED NOT NULL,
	FOREIGN KEY (`category_id`) REFERENCES `Categories` (`id`));
	


INSERT INTO `Categories` (`category_name`) VALUES
	('Electronics'),
	('Books'),
	('Clothing'),
	('Toys'),
	('Home Appliances');



INSERT INTO `Products` (`product_name`, `price`, `category_id`) VALUES
	('Smartphone', 699, 1),
	('Laptop', 999, 1),
	('Headphones', 199, 1),
	('Novel', 10, 2),
	('Science Fiction Book', 15, 2),
	('Shirt', 25, 3),
	('Pants', 40, 3),
	('Action Figure', 20, 4),
	('Board Game', 30, 4),
	('Coffee Maker', 99, 5),
	('Blender', 49, 5),
	('Toaster', 29, 5),
	('E-reader', 120, 2),
	('Smartwatch', 199, 1),
	('Tablet', 299, 1);


SELECT  `Products`.`product_name`, `Products`.`price` 
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	WHERE `Products`.`price` > (SELECT AVG(`Products`.`price`) FROM `Products`);
	
	
SELECT  `Products`.`product_name`, `Products`.`price`, `Categories`.`category_name`
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	WHERE `Products`.`price` > 100;


SELECT `Categories`.`category_name`, COUNT(`Products`.`id`)
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	GROUP BY `Categories`.`id`;


SELECT `Products`.`product_name`, AVG(`Products`.`price`)
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	WHERE `Products`.`price` > (SELECT AVG(`Products`.`price`)
											FROM `Products`
											JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`);


SELECT `Categories`.`category_name` 
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	GROUP BY `Categories`.`id`
	HAVING AVG(`Products`.price) > (SELECT AVG(`Products`.`price`) FROM `Products`);


SELECT `Categories`.`category_name`, MAX(`Products`.`price`)
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	GROUP BY `Categories`.`id`;
	
	
SELECT `Products`.`product_name`, MAX(`Products`.`price`)
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	GROUP BY `Categories`.`id`;


SELECT `Categories`.`category_name`, COUNT(`Products`.`id`)
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	GROUP BY `Categories`.`id`
	HAVING COUNT(`Products`.`id`) > (SELECT AVG(`Products`.`id`) FROM `Products`);


SELECT `Products`.`product_name`, `Products`.`price`
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	WHERE `Products`.`price` > (SELECT AVG(`Products`.`price`)
											FROM `Products`
											JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`);


SELECT `Categories`.`category_name`, MIN(`Products`.`price`)
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	GROUP BY `Categories`.`id`
	HAVING MIN(`Products`.`price`) > (SELECT AVG(`Products`.`price`)
													FROM `Products`
													JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`);
 										

SELECT `Categories`.`category_name`, COUNT(`Products`.`id`)
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	GROUP BY `Categories`.`id`
	ORDER BY COUNT(`Products`.`id`) DESC
	LIMIT 1;


SELECT `Products`.`product_name`, MIN(`Products`.`price`)
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`;


SELECT `Categories`.`category_name`, MAX(`Products`.`price`)
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	GROUP BY `Categories`.`id`
	HAVING MAX(`Products`.`price`) > 200;
	

SELECT `Categories`.`category_name`, AVG(`Products`.`price`)
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`
	GROUP BY `Categories`.`id`
	HAVING AVG(`Products`.`price`) > 150;
	
	
SELECT `Products`.`product_name`, `Products`.`price`
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`	
		GROUP BY `Categories`.`id`
		HAVING `Products`.`price` < MIN(`Products`.`price`) * 2;
	
		
SELECT `Categories`.`category_name`, COUNT(`Products`.`id`)
	FROM `Products`
	JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`	
	GROUP BY `Categories`.`id`
	HAVING COUNT(`Products`.`id`) > (SELECT AVG(`Products`.`id`)
													FROM `Products`
													JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`)
	AND AVG(`Products`.`price`) < (SELECT AVG(`Products`.`price`)
													FROM `Products`
													JOIN `Categories` ON `Products`.`category_id` = `Categories`.`id`);	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
