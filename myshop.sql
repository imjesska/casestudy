-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.5.9-MariaDB-1:10.5.9+maria~focal - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.2.0.6251
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for myshop
CREATE DATABASE IF NOT EXISTS `myshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `myshop`;

-- Dumping structure for table myshop.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table myshop.admin: ~1 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`, `password`, `username`) VALUES
	(1, '$2a$10$rqmUbmLk66PpL9qPMzPj1OdCfRN0S.R6J3AitKH7FWDMDjSbxSdIq', 'admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table myshop.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `sorting` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table myshop.categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `slug`, `sorting`) VALUES
	(2, 'Globes', 'globes', 100),
	(5, 'Food', 'food', 100);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table myshop.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(5000) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `sorting` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table myshop.pages: ~3 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `content`, `slug`, `sorting`, `title`) VALUES
	(5, '<center><b>About Me</b></br>\r\n\r\n<b><i>Hello!</i></b></center><br>\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n<br>\r\n♥  I am currently not taking any custom or personalized orders. I do intend on doing them in the future!\r\n <br>\r\n♥ If you would like, I can stream your custom order on <a href="https://www.twitch.tv/zenndur">Twitch</a>. This way you are free to tell me if you want something changed or added on!\r\n   <br>\r\n   ', 'aboutme', 100, 'About Me'),
	(6, '<center><b>Contact Us</b><br>\r\nFeel free to contact any of us if you have any questions!<br>\r\n\r\n<b>Lynn Muro</b>  <a href="mailto: fakeemail12@gmail.com">fakeemail12@gmail.com</a></td>\r\n<br>\r\n<b>Jessica Yu</b>  <a href="mailto: afemaow123@gmail.com">afemaow123@gmail.com</a></td>\r\n<br>\r\n<b>Steven Paccio</b>  <a href="mailto: notreal56@gmail.com">notreal56@gmail.com</a></td>\r\n</center>\r\n                            ', 'contactus', 100, 'Contact Us'),
	(7, 'this is a test page', 'test', 100, 'test for project');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table myshop.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) DEFAULT NULL,
  `createdAt` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId_fk` (`categoryId`),
  CONSTRAINT `categoryId_fk` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table myshop.products: ~5 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `categoryId`, `createdAt`, `description`, `image`, `name`, `price`, `slug`, `updatedAt`) VALUES
	(1, 2, '2021-06-22 18:25:20.151722', 'Terrarium globe Torchic inspired', 'torchic.png', 'Torchic', '30.50', 'torchic', '2021-06-22 23:37:09.866966'),
	(8, 2, '2021-06-22 23:35:02.027456', 'Terrarium globe Bulbasaur inspired', 'bulbasaur.png', 'Bulbasaur', '30.50', 'bulbasaur', '2021-06-22 23:37:49.755305'),
	(9, 2, '2021-06-22 23:36:04.812383', 'Terrarium globe Pikachu inspired', 'pikachu.png', 'Pikachu', '30.50', 'pikachu', '2021-06-22 23:37:27.483275'),
	(11, 5, '2021-06-23 00:31:04.302848', 'This is a banana', 'bananas.jpg', 'Banana', '1.99', 'banana', '2021-06-23 09:44:42.974764'),
	(13, 5, '2021-06-23 09:57:22.278933', 'This is an apple', 'apples.jpg', 'Apple', '0.99', 'apple', '2021-06-23 09:57:22.279912');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table myshop.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table myshop.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `password`, `phoneNumber`, `username`) VALUES
	(1, 'user1@gmail.com', '$2a$10$rqmUbmLk66PpL9qPMzPj1OdCfRN0S.R6J3AitKH7FWDMDjSbxSdIq', '1234567890', 'user1'),
	(3, 'user2@gmail.com', '$2a$10$kkpjxvkJkzLZ.LO7feD.Re75UO9xaGYcMpjmmzc7qZqNMRNxUpiWi', '1234568798', 'user2'),
	(6, 'user5@gmail.com', '$2a$10$8VxuQNIFaqPQu.du3QwSXubO.xq4ApeURTWS9BDRbCdv0Yvd0yvqm', '123456709', 'user5');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
