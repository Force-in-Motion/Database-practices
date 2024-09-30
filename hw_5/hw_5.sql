
CREATE TABLE IF NOT EXISTS `Guilds` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `guild_name` VARCHAR(50) NOT NULL,
  `guild_level` INT(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Players` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `player_name` VARCHAR(50) NOT NULL,
  `level` INT NOT NULL,
  `expirience_points` INT NOT NULL,
  `guild_id` INT UNSIGNED NOT NULL,
  FOREIGN KEY (`guild_id`) REFERENCES `Guilds`(`id`)
);

CREATE TABLE IF NOT EXISTS `Items` (
  `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `item_name` VARCHAR(50) NOT NULL,
  `rarity` VARCHAR(50) NOT NULL,
  `item_type` VARCHAR(20) NOT NULL,
  `player_id` INT UNSIGNED NOT NULL,
  FOREIGN KEY (`player_id`) REFERENCES `Players`(`id`)
);


INSERT INTO `Guilds` (`guild_name`, `guild_level`) VALUES
	('Knights of Valor', 1),
	('Guardians of Light', 2),
	('Dark Brotherhood', 3),
	('Mages Guild', 4),
	('Warriors of Destiny', 2),
	('Rangers of the Wild', 1),
	('Thieves Guild', 3),
	('Order of the Phoenix', 4),
	('Fellowship of Heroes', 5),
	('Sisters of the Moon', 1),
	('Brothers of Steel', 2),
	('Wizards of the East', 3),
	('Shadows of the Past', 2),
	('Knights Templar', 5),
	('Elven Alliance', 1),
	('Dwarven Brotherhood', 4),
	('Dark Knights', 3),
	('Crafters Guild', 2),
	('Brawlers Guild', 1),
	('Mages of the North', 3);


INSERT INTO `Players` (`player_name`, `level`, `expirience_points`, `guild_id`) VALUES
	('Arthur', 10, 150, 1),
	('Lancelot', 12, 180, 1),
	('Gawain', 15, 220, 2),
	('Tristan', 20, 300, 3),
	('Galahad', 25, 400, 4),
	('Merlin', 30, 500, 5),
	('Gandalf', 35, 600, 2),
	('Frodo', 10, 100, 1),
	('Sam', 12, 120, 1),
	('Aragorn', 15, 240, 2),
	('Legolas', 20, 320, 3),
	('Gimli', 25, 420, 4),
	('Sauron', 30, 520, 5),
	('Saruman', 35, 620, 2),
	('Dumbledore', 40, 720, 1),
	('Harry', 12, 110, 2),
	('Hermione', 11, 100, 2),
	('Ron', 10, 900, 3),
	('Voldemort', 50, 10000, 4),
	('Snape', 45, 950, 5);


INSERT INTO `Items` (`item_name`, `rarity`, `item_type`, `player_id`) VALUES
	('Sword of Destiny', 'Rare', 'Weapon', 1),
	('Shield of Valor', 'Common', 'Defense', 2),
	('Staff of Wisdom', 'Epic', 'Magic', 3),
	('Bow of the Night', 'Legendary', 'Weapon', 4),
	('Ring of Power', 'Rare', 'Accessory', 5),
	('Amulet of Protection', 'Common', 'Accessory', 6),
	('Potion of Healing', 'Common', 'Consumable', 7),
	('Elixir of Strength', 'Rare', 'Consumable', 8),
	('Helmet of Courage', 'Epic', 'Armor', 9),
	('Chestplate of Valor', 'Common', 'Armor', 10),
	('Boots of Swiftness', 'Rare', 'Armor', 11),
	('Gauntlets of Might', 'Epic', 'Armor', 12),
	('Cloak of Invisibility', 'Legendary', 'Armor', 13),
	('Dagger of Shadows', 'Rare', 'Weapon', 14),
	('Spellbook of Fire', 'Epic', 'Magic', 15),
	('Crossbow of Precision', 'Common', 'Weapon', 16),
	('Armor of the Dragon', 'Legendary', 'Armor', 17),
	('Belt of Fortitude', 'Rare', 'Accessory', 18),
	('Crystal of Teleportation', 'Epic', 'Magic', 19),
	('Tome of Knowledge', 'Rare', 'Magic', 20);
	

SELECT `Players`.player_name, `Players`.`level` FROM `Players`;


SELECT `Players`.`player_name`, `Guilds`.`id`
	FROM `Players`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	WHERE `Guilds`.`id` = 3;


SELECT `Players`.`player_name`, `Players`.`level`
	FROM `Players`
	WHERE `Players`.`level` >= 10;


SELECT `Items`.`item_name`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Players`.`player_name` = 'Gandalf';


SELECT `Items`.`item_name`
	FROM `Items`
	WHERE `Items`.`rarity` = 'Rare';
	

SELECT `Items`.`item_name`, `Items`.item_type
	FROM `Items`
	WHERE `Items`.`item_type` = 'Weapon';
	

SELECT `Guilds`.`guild_name`, COUNT(`Players`.`id`)
	FROM `Players` 
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	GROUP BY `Guilds`.`guild_name`;
	

SELECT `Players`.`player_name`, `Items`.`item_name`, `Items`.`item_type` FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Items`.`item_type` = 'Armor';
	

SELECT `Players`.`player_name`, `Players`.`level`, `Guilds`.`guild_name`, `Guilds`.`guild_level`
	FROM `Players`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	WHERE `Players`.`level` > 30 AND `Guilds`.`guild_level` >= 2;
	
	
SELECT `Players`.`player_name`, `Items`.`item_name`, `Items`.`item_type`, `Items`.`rarity`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Items`.`rarity` = 'Epic';
	
	
SELECT `Players`.`player_name`, `Players`.`level`, `Items`.`item_name`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Players`.`level` > 15;
	
	
SELECT  `Players`.`player_name`, `Guilds`.`guild_name`, `Items`.`item_name`
	FROM `Players`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Guilds`.`guild_name` = 'Dark Brotherhood';


SELECT `Players`.`player_name`, `Items`.`item_name`
	FROM `Players` 
	LEFT JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Items`.`item_id` IS NULL;
	
	
SELECT `Players`.`player_name`, `Items`.`item_name`, `Players`.`level`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE  `Players`.`level` > 30;


SELECT `Players`.`player_name`, `Items`.`item_name`, `Guilds`.`guild_level`
	FROM `Players`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Guilds`.`guild_level` > 3;
	
	
SELECT `Players`.`player_name`, `Players`.`expirience_points`, `Items`.`item_name`, `Items`.`item_type`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	WHERE `Players`.`expirience_points` > 500 AND `Items`.`item_type` = 'Weapon';
	
	
SELECT `Guilds`.`guild_name` 
	FROM `Guilds`
	LEFT JOIN `Players` ON `Guilds`.`id` = `Players`.`guild_id`
	WHERE `Players`.`id` IS NULL;


SELECT `Players`.`player_name`, `Items`.`item_name`, `Items`.`rarity`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Items`.`rarity` = 'Rare';
	
	
SELECT `Players`.`player_name`, `Items`.`item_name`, `Items`.`item_type`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Items`.`item_type` != 'Consumable';
	

SELECT `Players`.`player_name`, `Players`.`level`, `Items`.`item_name`, `Items`.`rarity`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Players`.`level` = 25 AND `Items`.`rarity` = 'Epic';
	

SELECT `Players`.`player_name`, `Players`.`expirience_points`
	FROM `Players`
	WHERE `Players`.`expirience_points` > (SELECT `Players`.`expirience_points`
														FROM `Players`
														WHERE `Players`.`player_name` = 'Galahad');
															
															
SELECT `Players`.`player_name`, `Items`.`item_name`, `Items`.`item_type`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Items`.`item_type` = 'Armor';
	
	
SELECT `Players`.`player_name`, `Guilds`.`guild_level`, `Items`.`item_name`
	FROM `Players`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Guilds`.`guild_level` = (SELECT MAX(`Guilds`.`guild_level`)
											  FROM `Guilds`);
											  	  
										  	  
SELECT `Players`.`player_name`, `Items`.`item_name`, `Items`.`rarity`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Items`.`rarity` = 'Rare';
	

SELECT `Players`.`player_name`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id` 
	GROUP BY `Players`.`id`
	HAVING COUNT(`Items`.`item_id`) > (SELECT COUNT(`Items`.`item_id`)
												  FROM `Players`
	                                   JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
												  WHERE `Players`.`player_name` = 'Lancelot');
	
SELECT `Guilds`.`guild_name`
	FROM `Players`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id` 
	WHERE `Players`.`level` > 20;
	

SELECT `Players`.`player_name`, `Items`.`item_name`, `Items`.`item_type`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id` 
	WHERE `Items`.`item_type` = 'Weapon' AND `Items`.`item_type` != 'Accessory';
	
	
SELECT `Players`.`player_name`, `Items`.`item_name`
	FROM `Players`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id` 
	WHERE `Guilds`.`guild_name` = 'Dark Brotherhood';
	

SELECT `Players`.`player_name`, `Items`.`item_name`, COUNT(`Items`.`item_id`)
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	GROUP BY `Players`.`id`
	HAVING COUNT(`Items`.`player_id`) > 1;
	

SELECT `Players`.`player_name`, `Players`.`expirience_points`
	FROM `Players`
	WHERE `Players`.`expirience_points` > (SELECT AVG(`Players`.`expirience_points`) 
														FROM `Players`);
	

SELECT `Players`.`player_name`, `Items`.`item_name`, `Guilds`.`guild_level`
	FROM `Players`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Guilds`.`guild_level` > (SELECT AVG(`Guilds`.`guild_level`)
											  FROM `Guilds`);
											  
											  
SELECT `Players`.`player_name`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	WHERE `Items`.`rarity` = 'Rare' AND `Players`.`expirience_points` > (SELECT `Players`.`expirience_points`
																								FROM `Players`
																								WHERE `Players`.`player_name` = 'Galahad');
																								
																								
SELECT `Players`.`player_name`, `Guilds`.`guild_level`
	FROM `Players`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	WHERE `Guilds`.`guild_level` > (SELECT `Guilds`.`guild_level`
											  FROM `Guilds`
											  WHERE `Guilds`.`guild_name` = 'Dark Brotherhood');


SELECT `Players`.`player_name`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	GROUP BY `Players`.`id`
	HAVING COUNT(`Items`.`item_id`) > (SELECT AVG(`Items`.`item_id`)
												 FROM `Players`
												 JOIN `Items` ON `Players`.`id` = `Items`.`player_id`);


SELECT `Players`.`player_name`, `Players`.`expirience_points`
	FROM `Players`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	WHERE `Players`.`expirience_points` > (SELECT SUM(`Players`.`expirience_points`)
														FROM `Players`
														JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
														WHERE `Guilds`.`guild_name` = 'Dark Brotherhood');


SELECT `Players`.`player_name`, `Items`.`item_name`
	FROM `Players`
	JOIN `Items` ON `Players`.`id` = `Items`.`player_id`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	WHERE `Players`.`expirience_points` > (SELECT SUM(`Players`.`expirience_points`)
														FROM `Players`
														JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
														WHERE `Guilds`.`guild_name` = 'Dark Brotherhood');
														
														
SELECT `Players`.`player_name`, `Players`.`expirience_points`
	FROM `Players`
	JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	WHERE `Players`.`expirience_points` > (SELECT AVG(`Players`.`expirience_points`)
														FROM `Players`
														JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`);


SELECT `Players`.`player_name`, `Players`.`expirience_points`
	FROM `Players`
	LEFT JOIN `Guilds` ON `Players`.`guild_id` = `Guilds`.`id`
	WHERE `Players`.`expirience_points` > 1000 AND `Players`.`guild_id` = NULL