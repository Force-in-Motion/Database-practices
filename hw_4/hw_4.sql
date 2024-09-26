USE `seschool_08`;

CREATE TABLE IF NOT EXISTS`Пользователи` (
	`ID_пользователя` BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Имя` VARCHAR(200) NOT NULL,
	`Возраст`INT(100) NOT NULL,
	`Страна` VARCHAR(200) NOT NULL
);


CREATE TABLE IF NOT EXISTS `Заказы` (
	`ID_заказа` BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`ID_пользователя` BIGINT(8) UNSIGNED NOT NULL,
	`Сумма_заказа` INT NOT NULL,
	`Дата_заказа` DATE NOT NULL,
	FOREIGN KEY (`ID_пользователя`) REFERENCES `Пользователи` (`ID_пользователя`)
);


CREATE TABLE IF NOT EXISTS `Отзывы` (
	`ID_Отзыва` BIGINT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`ID_пользователя` BIGINT(8) UNSIGNED NOT NULL,
	`Оценка` INT NOT NULL,
	`Текст_отзыва` VARCHAR(250) NOT NULL DEFAULT 'Все прекрасно'
);