-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.26-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5700
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for db_h_todo
CREATE DATABASE IF NOT EXISTS `db_h_todo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_h_todo`;

-- Dumping structure for table db_h_todo.tbl_config
CREATE TABLE IF NOT EXISTS `tbl_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table db_h_todo.tbl_config: ~4 rows (approximately)
/*!40000 ALTER TABLE `tbl_config` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_config` (`id`, `name`, `value`) VALUES
	(1, 'websiteLanguage', 'en'),
	(2, 'charset', 'utf-8'),
	(3, 'websiteName', 'HToDo'),
	(4, 'styleName', 'default');
/*!40000 ALTER TABLE `tbl_config` ENABLE KEYS */;

-- Dumping structure for table db_h_todo.tbl_todo_attachments
CREATE TABLE IF NOT EXISTS `tbl_todo_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `todo_list_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_h_todo.tbl_todo_attachments: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_todo_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_todo_attachments` ENABLE KEYS */;

-- Dumping structure for table db_h_todo.tbl_todo_list
CREATE TABLE IF NOT EXISTS `tbl_todo_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` text,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table db_h_todo.tbl_todo_list: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_todo_list` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_todo_list` (`id`, `user_id`, `content`, `creation`) VALUES
	(31, 7, 'First, Test', '2019-11-18 00:31:22'),
	(32, 7, 'Second, try', '2019-11-18 00:31:36'),
	(33, 7, 'يبليبليبل', '2019-11-18 01:03:04'),
	(34, 7, 'Ccxx', '2019-11-18 01:54:17'),
	(35, 7, 'Ccxx', '2019-11-18 01:54:52');
/*!40000 ALTER TABLE `tbl_todo_list` ENABLE KEYS */;

-- Dumping structure for table db_h_todo.tbl_users
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:guest,1:user,2:admin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='user_type:{0:blocked,1:user,2:admin}';

-- Dumping data for table db_h_todo.tbl_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_users` (`id`, `email`, `password`, `first_name`, `last_name`, `creation`, `user_type`) VALUES
	(7, 'g@y.com', 'g@y.com', 'Haitham', 'Alhaji', '2019-11-17 02:50:46', 2);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
