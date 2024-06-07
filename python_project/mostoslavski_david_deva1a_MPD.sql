-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 01, 2024 at 07:22 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recherche_appart`
--
CREATE DATABASE IF NOT EXISTS `recherche_appart` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `recherche_appart`;

-- --------------------------------------------------------

--
-- Table structure for table `T_address`
--

CREATE TABLE `T_address` (
  `id_address` int NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `street_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_address`
--

INSERT INTO `T_address` (`id_address`, `city`, `street_address`, `zip`, `street_number`) VALUES
(1, 'New York', '5th Avenue', '10001', '1'),
(2, 'Los Angeles', 'Sunset Boulevard', '90026', '101'),
(3, 'Chicago', 'Michigan Avenue', '60602', '500');

-- --------------------------------------------------------

--
-- Table structure for table `T_appartment`
--

CREATE TABLE `T_appartment` (
  `id_appartment` int NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `rent` int DEFAULT NULL,
  `nb_rooms` tinyint DEFAULT NULL,
  `aera_m2` tinyint DEFAULT NULL,
  `date_availability` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_appartment`
--

INSERT INTO `T_appartment` (`id_appartment`, `address`, `rent`, `nb_rooms`, `aera_m2`, `date_availability`) VALUES
(1, '123 Main St', 800, 3, 70, '2024-02-01'),
(2, '456 Oak St', 950, 4, 80, '2024-02-15'),
(3, '789 Pine St', 700, 2, 60, '2024-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `T_appartment_address`
--

CREATE TABLE `T_appartment_address` (
  `id_appartment_address` int NOT NULL,
  `fk_appartment` int DEFAULT NULL,
  `fk_address` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_appartment_address`
--

INSERT INTO `T_appartment_address` (`id_appartment_address`, `fk_appartment`, `fk_address`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `T_appartment_image`
--

CREATE TABLE `T_appartment_image` (
  `id_appartment_image` int NOT NULL,
  `fk_appartment` int DEFAULT NULL,
  `fk_image` int DEFAULT NULL,
  `date_image` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_appartment_image`
--

INSERT INTO `T_appartment_image` (`id_appartment_image`, `fk_appartment`, `fk_image`, `date_image`) VALUES
(1, 1, 1, '2024-01-11'),
(2, 2, 2, '2024-01-16'),
(3, 3, 3, '2024-01-21');

-- --------------------------------------------------------

--
-- Table structure for table `T_appartment_landlord`
--

CREATE TABLE `T_appartment_landlord` (
  `id_appartment_landlord` int NOT NULL,
  `fk_appartment` int DEFAULT NULL,
  `fk_landlord` int DEFAULT NULL,
  `date_appartment` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_appartment_landlord`
--

INSERT INTO `T_appartment_landlord` (`id_appartment_landlord`, `fk_appartment`, `fk_landlord`, `date_appartment`) VALUES
(1, 1, 1, '2024-01-01'),
(2, 2, 2, '2024-01-05'),
(3, 3, 3, '2024-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `T_budget`
--

CREATE TABLE `T_budget` (
  `id_budget` int NOT NULL,
  `rent` int DEFAULT NULL,
  `new_supply` int DEFAULT NULL,
  `transport` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_budget`
--

INSERT INTO `T_budget` (`id_budget`, `rent`, `new_supply`, `transport`) VALUES
(1, 800, 100, 50),
(2, 950, 150, 60),
(3, 700, 120, 55);

-- --------------------------------------------------------

--
-- Table structure for table `T_group`
--

CREATE TABLE `T_group` (
  `id_group` int NOT NULL,
  `landlord_group` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_group`
--

INSERT INTO `T_group` (`id_group`, `landlord_group`) VALUES
(1, 'Group A'),
(2, 'Group B'),
(3, 'Group C');

-- --------------------------------------------------------

--
-- Table structure for table `T_image`
--

CREATE TABLE `T_image` (
  `id_image` int NOT NULL,
  `image` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_image`
--

INSERT INTO `T_image` (`id_image`, `image`) VALUES
(1, NULL),
(2, NULL),
(3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `T_landlord`
--

CREATE TABLE `T_landlord` (
  `id_landlord` int NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_landlord`
--

INSERT INTO `T_landlord` (`id_landlord`, `mail`, `telephone`) VALUES
(1, 'landlord1@example.com', '123-456-7890'),
(2, 'landlord2@example.com', '098-765-4321'),
(3, 'landlord3@example.com', '456-123-7890');

-- --------------------------------------------------------

--
-- Table structure for table `T_landlord_address`
--

CREATE TABLE `T_landlord_address` (
  `id_landlord_address` int NOT NULL,
  `fk_landlord` int DEFAULT NULL,
  `fk_address` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `T_landlord_group`
--

CREATE TABLE `T_landlord_group` (
  `id_landlord_group` int NOT NULL,
  `fk_landlord` int DEFAULT NULL,
  `fk_group` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_landlord_group`
--

INSERT INTO `T_landlord_group` (`id_landlord_group`, `fk_landlord`, `fk_group`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `T_landlord_image`
--

CREATE TABLE `T_landlord_image` (
  `id_landlord_image` int NOT NULL,
  `fk_landlord` int DEFAULT NULL,
  `fk_image` int DEFAULT NULL,
  `date_image` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_landlord_image`
--

INSERT INTO `T_landlord_image` (`id_landlord_image`, `fk_landlord`, `fk_image`, `date_image`) VALUES
(1, 1, 1, '2024-01-12'),
(2, 2, 2, '2024-01-17'),
(3, 3, 3, '2024-01-22');

-- --------------------------------------------------------

--
-- Table structure for table `T_user`
--

CREATE TABLE `T_user` (
  `id_user` int NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `budget` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_user`
--

INSERT INTO `T_user` (`id_user`, `username`, `budget`) VALUES
(1, 'User1', 1200),
(2, 'User2', 1500),
(3, 'User3', 1800);

-- --------------------------------------------------------

--
-- Table structure for table `T_user_appartment`
--

CREATE TABLE `T_user_appartment` (
  `id_user_appartment` int NOT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_appartment` int DEFAULT NULL,
  `date_found` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_user_appartment`
--

INSERT INTO `T_user_appartment` (`id_user_appartment`, `fk_user`, `fk_appartment`, `date_found`) VALUES
(1, 1, 1, '2024-01-10'),
(2, 2, 2, '2024-01-15'),
(3, 3, 3, '2024-01-20');

-- --------------------------------------------------------

--
-- Table structure for table `T_user_budget`
--

CREATE TABLE `T_user_budget` (
  `id_user_budget` int NOT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_budget` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `T_user_budget`
--

INSERT INTO `T_user_budget` (`id_user_budget`, `fk_user`, `fk_budget`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `T_address`
--
ALTER TABLE `T_address`
  ADD PRIMARY KEY (`id_address`);

--
-- Indexes for table `T_appartment`
--
ALTER TABLE `T_appartment`
  ADD PRIMARY KEY (`id_appartment`);

--
-- Indexes for table `T_appartment_address`
--
ALTER TABLE `T_appartment_address`
  ADD PRIMARY KEY (`id_appartment_address`),
  ADD KEY `fk_appartment` (`fk_appartment`),
  ADD KEY `fk_address` (`fk_address`);

--
-- Indexes for table `T_appartment_image`
--
ALTER TABLE `T_appartment_image`
  ADD PRIMARY KEY (`id_appartment_image`),
  ADD KEY `fk_appartment` (`fk_appartment`),
  ADD KEY `fk_image` (`fk_image`);

--
-- Indexes for table `T_appartment_landlord`
--
ALTER TABLE `T_appartment_landlord`
  ADD PRIMARY KEY (`id_appartment_landlord`),
  ADD KEY `fk_appartment` (`fk_appartment`),
  ADD KEY `fk_landlord` (`fk_landlord`);

--
-- Indexes for table `T_budget`
--
ALTER TABLE `T_budget`
  ADD PRIMARY KEY (`id_budget`);

--
-- Indexes for table `T_group`
--
ALTER TABLE `T_group`
  ADD PRIMARY KEY (`id_group`);

--
-- Indexes for table `T_image`
--
ALTER TABLE `T_image`
  ADD PRIMARY KEY (`id_image`);

--
-- Indexes for table `T_landlord`
--
ALTER TABLE `T_landlord`
  ADD PRIMARY KEY (`id_landlord`);

--
-- Indexes for table `T_landlord_address`
--
ALTER TABLE `T_landlord_address`
  ADD PRIMARY KEY (`id_landlord_address`),
  ADD KEY `fk_landlord` (`fk_landlord`),
  ADD KEY `fk_address` (`fk_address`);

--
-- Indexes for table `T_landlord_group`
--
ALTER TABLE `T_landlord_group`
  ADD PRIMARY KEY (`id_landlord_group`),
  ADD KEY `fk_landlord` (`fk_landlord`),
  ADD KEY `fk_group` (`fk_group`);

--
-- Indexes for table `T_landlord_image`
--
ALTER TABLE `T_landlord_image`
  ADD PRIMARY KEY (`id_landlord_image`),
  ADD KEY `fk_landlord` (`fk_landlord`),
  ADD KEY `fk_image` (`fk_image`);

--
-- Indexes for table `T_user`
--
ALTER TABLE `T_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `T_user_appartment`
--
ALTER TABLE `T_user_appartment`
  ADD PRIMARY KEY (`id_user_appartment`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `fk_appartment` (`fk_appartment`);

--
-- Indexes for table `T_user_budget`
--
ALTER TABLE `T_user_budget`
  ADD PRIMARY KEY (`id_user_budget`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `fk_budget` (`fk_budget`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `T_appartment_address`
--
ALTER TABLE `T_appartment_address`
  ADD CONSTRAINT `fk_appartment_address_to_address` FOREIGN KEY (`fk_address`) REFERENCES `T_address` (`id_address`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_appartment_address_to_appartment` FOREIGN KEY (`fk_appartment`) REFERENCES `T_appartment` (`id_appartment`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `T_appartment_image`
--
ALTER TABLE `T_appartment_image`
  ADD CONSTRAINT `fk_appartment_image_to_appartment` FOREIGN KEY (`fk_appartment`) REFERENCES `T_appartment` (`id_appartment`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_appartment_image_to_image` FOREIGN KEY (`fk_image`) REFERENCES `T_image` (`id_image`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `T_appartment_landlord`
--
ALTER TABLE `T_appartment_landlord`
  ADD CONSTRAINT `fk_appartment_landlord_to_appartment` FOREIGN KEY (`fk_appartment`) REFERENCES `T_appartment` (`id_appartment`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_appartment_landlord_to_landlord` FOREIGN KEY (`fk_landlord`) REFERENCES `T_landlord` (`id_landlord`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `T_landlord_address`
--
ALTER TABLE `T_landlord_address`
  ADD CONSTRAINT `fk_landlord_address_to_address` FOREIGN KEY (`fk_address`) REFERENCES `T_address` (`id_address`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_landlord_address_to_landlord` FOREIGN KEY (`fk_landlord`) REFERENCES `T_landlord` (`id_landlord`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `T_landlord_group`
--
ALTER TABLE `T_landlord_group`
  ADD CONSTRAINT `fk_landlord_group_to_group` FOREIGN KEY (`fk_group`) REFERENCES `T_group` (`id_group`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_landlord_group_to_landlord` FOREIGN KEY (`fk_landlord`) REFERENCES `T_landlord` (`id_landlord`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `T_landlord_image`
--
ALTER TABLE `T_landlord_image`
  ADD CONSTRAINT `fk_landlord_image_to_image` FOREIGN KEY (`fk_image`) REFERENCES `T_image` (`id_image`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_landlord_image_to_landlord` FOREIGN KEY (`fk_landlord`) REFERENCES `T_landlord` (`id_landlord`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `T_user_appartment`
--
ALTER TABLE `T_user_appartment`
  ADD CONSTRAINT `fk_user_appartment_to_appartment` FOREIGN KEY (`fk_appartment`) REFERENCES `T_appartment` (`id_appartment`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_user_appartment_to_user` FOREIGN KEY (`fk_user`) REFERENCES `T_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `T_user_budget`
--
ALTER TABLE `T_user_budget`
  ADD CONSTRAINT `fk_user_budget_to_budget` FOREIGN KEY (`fk_budget`) REFERENCES `T_budget` (`id_budget`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_user_budget_to_user` FOREIGN KEY (`fk_user`) REFERENCES `T_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

