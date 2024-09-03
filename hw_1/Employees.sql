
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