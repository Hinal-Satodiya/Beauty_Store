-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 15, 2024 at 06:54 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categoryId` smallint(6) NOT NULL AUTO_INCREMENT,
  `categoryName` text NOT NULL,
  `createdBy` smallint(6) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryId`, `categoryName`, `createdBy`, `createdAt`) VALUES
(7, 'HairCare', 26, '2024-04-15 04:50:36'),
(8, 'SkinCare', 26, '2024-04-15 04:50:51'),
(9, 'EyeMakeOut', 26, '2024-04-15 04:51:23'),
(10, 'LipMakeOut', 26, '2024-04-15 04:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productId` smallint(6) NOT NULL AUTO_INCREMENT,
  `productName` text NOT NULL,
  `productDesc` text NOT NULL,
  `productPrice` int(11) NOT NULL,
  `categoryId` smallint(6) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `productImages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `productName`, `productDesc`, `productPrice`, `categoryId`, `createdBy`, `productImages`) VALUES
(5, 'Hair_Serum', '..', 500, 7, 26, '[\"96bcc5860f1abb71-Hseum1.jpg\",\"0aa8fa44efadd4db-Hserum1.1.jpg\"]'),
(6, 'Eye-Shadows', 'eye-mackup', 400, 9, 26, '[\"a55c076514b93a81-Eye-Shadow.jpg\"]'),
(7, 'Mate_Lipstics', '....', 400, 10, 26, '[\"7e317b98307c071d-l1.jpg\"]'),
(8, 'Hair_Serum', 'anb', 500, 7, 26, '[\"ea0005f811131593-Hserum1.1.jpg\"]');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `roleId` tinyint(4) NOT NULL AUTO_INCREMENT,
  `roleName` tinytext NOT NULL,
  `userId` smallint(6) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleId`, `roleName`, `userId`) VALUES
(1, 'user', 19),
(2, 'user', 20),
(3, 'user', 21),
(4, 'user', 22),
(5, 'user', 23),
(6, 'user', 24),
(7, 'user', 25),
(8, 'user', 26),
(9, 'user', 27),
(10, 'user', 28);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userId` smallint(6) NOT NULL AUTO_INCREMENT,
  `firstName` tinytext NOT NULL,
  `lastName` tinytext NOT NULL,
  `email` tinytext NOT NULL,
  `password` text NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `hobbies` tinytext NOT NULL,
  `roleName` tinytext NOT NULL,
  `profilePic` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `firstName`, `lastName`, `email`, `password`, `gender`, `hobbies`, `roleName`, `profilePic`, `createdAt`) VALUES
(25, 'hinal', 'satodiya', 'hs@gmail.com', '$2b$10$ZjzMo5LBOIKlbo.0y6DwFuY2I/vwq.Z2GI0/T.Ly6zHngZDQz2I.u', 'Male', 'abc,bcd', 'user', '1112c08b98346fe5-hinal.png', '2024-04-15 03:10:53'),
(26, 'hinal', 'satodiya', 'h@gmail.com', '$2b$10$RnsA9gXzcO7OOjFCVZvi3eO33PvfmH7DkvvLuiS3KmtHpMAigVS6m', 'Female', 'abc,bcd', 'user', 'd7458e673e5a87f0-hinal.png', '2024-04-15 03:12:12'),
(27, 'HINAL', 'satodiya', 'hsatodiya@gmail.com', '$2b$10$9uK34OeD.a0tBHnYUqbE4O8iq0ZUCszSDAx0.J9MjuBq22yj9B4Ue', 'Female', 'abc,bcd', 'user', 'a86a2480aa3d2334-hinal.png', '2024-04-15 06:43:58'),
(28, 'hinal', 'satodiya', 'has@gmail.com', '$2b$10$wY3zxaW0cd23nV24TQ.V..gYQEVR9FGXT5ucbBD8ydfl6i1DN40K6', 'Female', 'abc,bcd', 'user', '2dd0d75b8e728e5f-hinal.png', '2024-04-15 06:47:13');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
