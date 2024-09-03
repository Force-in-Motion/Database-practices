
CREATE TABLE IF NOT EXISTS `MonstersIncEmployees` (
  `EmployeeID` bigint(8) unsigned NOT NULL AUTO_INCREMENT,
  `MonsterName` varchar(75) NOT NULL,
  `Type` varchar(255) NOT NULL DEFAULT 'Монстр',
  `Department` varchar(100) NOT NULL DEFAULT 'Нулевой отдел',
  `ScareLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `MonsterName` (`MonsterName`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


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