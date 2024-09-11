USE `seschool_08`;

CREATE TABLE IF NOT EXISTS `Movies` (
	`id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`title` VARCHAR(200) NOT NULL,
	`release_year` YEAR NOT NULL,
	`genre` VARCHAR(200) NOT NULL,
	`rating` DECIMAL(3,1) NOT NULL
);


CREATE TABLE IF NOT EXISTS `Actors` (
	`id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(200) NOT NULL,
	`birth_year` YEAR NOT NULL,
	`nationality` VARCHAR(200) NOT NULL DEFAULT 'Гражданин мира'
);


CREATE TABLE IF NOT EXISTS `Movie_Actors` (
	`movie_id` INT UNSIGNED NOT NULL,
	`actor_id` INT UNSIGNED NOT NULL,
	`role` VARCHAR(200) NOT NULL,
	FOREIGN KEY (`movie_id`) REFERENCES `Movies` (`id`),
	FOREIGN KEY (`actor_id`) REFERENCES `Actors` (`id`)
);


INSERT INTO `Movies` (`title`, `release_year`, `genre`, `rating`) VALUES
('Inception', 201, 'Sci-Fi', 8.8),
('The Godfather', 1972, 'Crime', 9.2),
('The Dark Knight', 2008, 'Action', 9.),
('Pulp Fiction', 1994, 'Drama', 8.9),
('The Shawshank Redemption', 1994, 'Drama', 9.3),
('Fight Club', 1999, 'Drama', 8.8),
('Forrest Gump', 1994, 'Drama', 8.8),
('The Matrix', 1999, 'Sci-Fi', 8.7),
('The Lord of the Rings: The Return of the King', 2003, 'Fantasy', 8.9),
('Interstellar', 2014, 'Sci-Fi', 8.6),
('The Social Network', 201, 'Biography', 5.0),
('Gladiator', 200, 'Action', 8.5),
('The Silence of the Lambs', 1991, 'Thriller', 8.6),
('Saving Private Ryan', 1998, 'War', 8.6),
('The Usual Suspects', 1995, 'Crime', 8.5),
('The Lion King', 1994, 'Animation', 8.5),
('Titanic', 1997, 'Romance', 7.8),
('The Avengers', 2012, 'Action', 8.9),
('Spider-Man: No Way Home', 2021, 'Action', 8.7),
('Coco', 2017, 'Animation', 8.4),
('Parasite', 2019, 'Thriller', 8.6),
('Joker', 2019, 'Drama', 8.5),
('Avengers: Endgame', 2019, 'Action', 8.4),
('The Departed', 2006, 'Crime', 8.5),
('Whiplash', 2014, 'Drama', 8.5),
('Oldboy', 2003, 'Thriller', 8.4),
('The Prestige', 2006, 'Drama', 8.5),
('Django Unchained', 2012, 'Western', 8.4);


INSERT INTO `Actors` (`name`, `birth_year`, `nationality`) VALUES
('Robert Downey Jr.', 1965, 'США'),
('Scarlett Johansson', 1984, 'США'),
('Leonardo DiCaprio', 1974, 'США'),
('Kate Winslet', 1975, 'Великобритания'),
('Morgan Freeman', 1937, 'США'),
('Meryl Streep', 1949, 'США'),
('Tom Hanks', 1956, 'США');


INSERT INTO `Movie_Actors` (`movie_id`, `actor_id`, `role`) VALUES
	(1, 7, 'Маньяк'),
	(2, 1, 'Повар'),
	(3, 1, 'Обезьяна'),
	(4, 2, 'Самовар'),
	(5, 3, 'Лопата'),
	(6, 7, 'Муравей'),
	(7, 2, 'Спанч Боб'),
	(8, 5, 'Теща'),
	(9, 7, 'Чебурек'),
	(10, 7, 'Картошка'),
	(11, 3, 'Диретор'),
	(12, 1, 'Разрушитель'),
	(13, 7, 'Кот'),
	(14, 4, 'Крыса'),
	(15, 6, 'Унитаз'),
	(16, 1, 'Гефест'),
	(17, 7, 'Пингвин'),
	(18, 5, 'Шуруп'),
	(19, 7, 'Петух'),
	(20, 6, 'Клоп'),
	(21, 5, 'Виноград'),
	(22, 2, 'Каменьщик'),
	(23, 7, 'Тапок'),
	(24, 2, 'Атом углерода'),
	(25, 3, 'Черенок'),
	(26, 3, 'Сапог'),
	(27, 7, 'Алкаш'),
	(28, 4, 'Покемон');
	
-- 1.1

SELECT DISTINCT `title`, `release_year`, `rating` FROM `Movies`
	WHERE `release_year` > 2010 AND `rating` > 8.0
	ORDER BY `rating` DESC ;	
	
-- 1.2

SELECT DISTINCT `genre` FROM  `Movies`
	ORDER BY `genre`;

-- 1.3

SELECT DISTINCT `title`, `rating` FROM `Movies`
	ORDER BY `rating` DESC
	LIMIT 10;
	
-- 1.4

SELECT DISTINCT `name`, `birth_year` FROM `Actors`
	WHERE `birth_year` <= 1980
	ORDER BY `birth_year`;
	
-- 1.5

SELECT DISTINCT `title` FROM `Movies`
	WHERE `genre` = 'Sci-Fi'
	ORDER BY `title`;
	
-- 1.6

SELECT `nationality` FROM `Actors`
	GROUP BY `nationality`
	ORDER BY `nationality` DESC;
	
-- 1.7

SELECT DISTINCT `title`, `rating` FROM `Movies`
	WHERE `rating` <= 5.0
	ORDER BY `rating` DESC;
	
-- 1.8

SELECT DISTINCT `title`, `release_year`, `rating` FROM `Movies`
	ORDER BY `release_year` DESC
	LIMIT 5;
	
-- 1.9	
	
SELECT DISTINCT `name`, `birth_year`, `nationality` FROM `Actors`
	ORDER BY `birth_year`
	LIMIT 3;
	
-- 2.1

SELECT `genre`, AVG(`rating`) FROM `Movies`
	GROUP BY `genre`
	ORDER BY `rating` DESC;	
	
-- 2.2

SELECT `release_year`, COUNT(*) FROM `Movies`
	GROUP BY `release_year`
	ORDER BY `release_year` DESC;

-- 2.3 

SELECT `genre`, COUNT(*) AS 'count_movies' FROM `Movies`
	GROUP BY `genre`
	HAVING 'count_movies' > 5
	ORDER BY 'count_movies' DESC;
	
-- 2.4

SELECT `genre`, SUM(`rating`) AS 'sum_rating' FROM `Movies`
	GROUP BY `genre`
	HAVING 'sum_rating' > 50
	ORDER BY 'sum_rating' DESC;
	
-- 2.5

SELECT `release_year` FROM `Movies`
	WHERE `rating` > 7.0
	GROUP BY `release_year`
	HAVING 'count_movies' > 5
	ORDER BY 'count_movies' DESC;
	
-- 3.1

SELECT `genre`, COUNT(*) AS 'count_movies' FROM `Movies`
	GROUP BY `genre`
	HAVING AVG(`rating`) > 6.5 AND 'count_movies' > 10
	ORDER BY AVG(`rating`) DESC;
	
-- 3.2

SELECT `release_year`, MIN(`rating`) FROM `Movies`
	GROUP BY `release_year`
	HAVING COUNT(*) > 3
	ORDER BY `release_year`;
	
-- 3.4 

SELECT AVG(`rating`) FROM `Movies`
	WHERE `release_year` < 2000
	GROUP BY `genre`
	HAVING COUNT(*) > 3
	ORDER BY AVG(`rating`) DESC;
	
-- 3.5

SELECT `genre`, MIN(`rating`) FROM `Movies`
	GROUP BY `genre`
	HAVING COUNT(*) > 8
	ORDER BY `rating`;	
	
	
CREATE TABLE IF NOT EXISTS `subscriptions` (
	`sb_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`sb_subscriber` INT NOT NULL,
	`sb_book` INT NOT NULL,
	`sb_start` DATE NOT NULL,
	`sb_finish` DATE NOT NULL,
	`sb_is_active` VARCHAR(85) CHECK (`sb_is_active` IN ('Y', 'N'))
);


SELECT `sb_book` FROM `subscriptions`
	WHERE `sb_is_active` = 'Y'
	GROUP BY `sb_book`


SELECT `sb_book`, COUNT(*) FROM `subscriptions`
	WHERE `sb_is_active` = 'Y'
	GROUP BY `sb_book`;
