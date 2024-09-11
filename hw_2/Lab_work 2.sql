CREATE TABLE IF NOT EXISTS `students_table` (
	`№` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`Фамилия` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Пол` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`Дата рождения` DATE NOT NULL,
	`СНИЛС` VARCHAR(14) NOT NULL COLLATE 'utf8_general_ci',
	`Курс` TINYINT(4) NOT NULL DEFAULT '1',
	`Группа` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`Средний балл` FLOAT NOT NULL,
	`Хобби` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`№`) USING BTREE,
	UNIQUE INDEX `СНИЛС` (`СНИЛС`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=16
;


SELECT * FROM `students_table`;


SELECT * FROM `students_table`
	WHERE `Курс` = 3;
	
	
SELECT * FROM `students_table`
	WHERE `Дата рождения` > 1994-02-03;
	
	
SELECT * FROM `students_table`
	WHERE `Средний балл` BETWEEN 70 AND 85;
	
	
SELECT * FROM `students_table`
	WHERE `Курс` IN (2, 3);
	

SELECT * FROM `students_table`
	WHERE `Фамилия` LIKE('С%') OR `Фамилия` LIKE('К%');
	
	
SELECT * FROM `students_table`
	WHERE `Группа` LIKE ('АУС%');
	
	
SELECT * FROM `students_table`
	WHERE `Хобби` IS NULL;
	
	
SELECT `Курс` FROM `students_table`
	GROUP BY `Курс`;


SELECT * FROM `students_table`
	ORDER BY `Средний балл` 
	LIMIT 10;
	
	
SELECT COUNT(*) FROM `students_table`;

SELECT COUNT(*) FROM `students_table`
	WHERE `Хобби` IS NULL;

SELECT MAX(`Средний балл`) FROM `students_table`;

SELECT MIN(`Средний балл`) FROM `students_table`;

SELECT AVG(`Средний балл`) FROM `students_table`;


SELECT `Курс`, COUNT(*) FROM `students_table`
	GROUP BY `Курс`;


SELECT `Пол`, AVG(`Средний балл`) FROM `students_table`
	GROUP BY `Пол`;


SELECT MAX(`Средний балл`) FROM `students_table`
	WHERE `Курс` = 3 AND `Дата рождения` >= '1993-01-01'
	GROUP BY `Курс`;
	

SELECT `Фамилия`, `Средний балл`, CASE
	 WHEN `Средний балл` BETWEEN 0 AND 55 THEN 'Неудовлетворительно'
	 WHEN `Средний балл` BETWEEN 56 AND 70 THEN 'Удовлетворительно'
	 WHEN `Средний балл` BETWEEN 71 AND 85 THEN 'Хорошо'
	 WHEN `Средний балл` BETWEEN 86 AND 100 THEN 'Отлично'
	END AS 'Оценка'
	FROM `students_table`;