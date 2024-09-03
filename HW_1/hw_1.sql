-- --------------------------------------------------------
-- Хост:                         109.206.169.221
-- Версия сервера:               5.7.28-0ubuntu0.19.04.2 - (Ubuntu)
-- Операционная система:         Linux
-- HeidiSQL Версия:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица seschool_08.Employees
CREATE TABLE IF NOT EXISTS `Employees` (
  `EmployeeID` bigint(8) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `HireDate` date NOT NULL,
  `Position` varchar(100) NOT NULL,
  `Salary` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `FirstName` (`FirstName`),
  UNIQUE KEY `LastName` (`LastName`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы seschool_08.Employees: ~10 rows (приблизительно)
INSERT INTO `Employees` (`EmployeeID`, `FirstName`, `LastName`, `DateOfBirth`, `HireDate`, `Position`, `Salary`) VALUES
	(1, 'Иван', 'Иванов', '1980-01-15', '2010-06-01', 'Менеджер', 75000),
	(2, 'Анна', 'Петрова', '1985-07-23', '2012-08-15', 'Инженер', 68000),
	(3, 'Михаил', 'Смирнов', '1990-03-12', '2015-01-30', 'Программист', 72000),
	(4, 'Елена', 'Сидорова', '1992-05-14', '2016-09-21', 'Аналитик', 70000),
	(6, 'Алексей', 'Кузнецов', '1975-11-02', '2005-10-10', 'Руководитель отдела', 90000),
	(7, 'Ольга', 'Васильева', '1988-04-22', '2014-03-05', 'Маркетолог', 65000),
	(8, 'Дмитрий', 'Попов', '1993-08-19', '2017-11-11', 'Программист', 71000),
	(10, 'Мария', 'Козлова', '1983-02-10', '2010-04-07', 'HR-менеджер', 66000),
	(11, 'Сергей', 'Лебедев', '1979-12-01', '2008-07-01', 'Менеджер проектов', 80000),
	(12, 'Наталья', 'Морозова', '1986-09-09', '2013-12-18', 'Дизайнер', 69000);

-- Дамп структуры для таблица seschool_08.MonstersIncEmployees
CREATE TABLE IF NOT EXISTS `MonstersIncEmployees` (
  `EmployeeID` bigint(8) unsigned NOT NULL AUTO_INCREMENT,
  `MonsterName` varchar(75) NOT NULL,
  `Type` varchar(255) NOT NULL DEFAULT 'Монстр',
  `Department` varchar(100) NOT NULL DEFAULT 'Нулевой отдел',
  `ScareLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `MonsterName` (`MonsterName`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы seschool_08.MonstersIncEmployees: ~10 rows (приблизительно)
INSERT INTO `MonstersIncEmployees` (`EmployeeID`, `MonsterName`, `Type`, `Department`, `ScareLevel`) VALUES
	(1, 'Mike Wazowski', 'Пугало', 'Отдел пуганий', 7),
	(2, 'James P. Sullivan', 'Пугало', 'Отдел пуганий', 10),
	(4, 'Randall Boggs', 'Пугало', 'Отдел пуганий', 8),
	(5, 'Celia Mae', 'Администратор', 'Отдел поддержки', 3),
	(6, 'Roz', 'Администратор', 'Отдел документации', 2),
	(7, 'George Sanderson', 'Пугало', 'Отдел пуганий', 5),
	(8, 'Henry J. Waternoose', 'Администратор', 'Управление', 4),
	(9, 'Fungus', 'Помощник', 'Отдел пуганий', 6),
	(10, 'Needleman', 'Помощник', 'Отдел документации', 4),
	(11, 'Smitty', 'Помощник', 'Отдел поддержки', 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
