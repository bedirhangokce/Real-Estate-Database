-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2020 at 12:40 PM
-- Server version: 8.0.20
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `estate project`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `ID` int NOT NULL,
  `Telephone Number` varchar(13) NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`ID`, `Telephone Number`, `Name`) VALUES
(14, '1212121212', 'Nimet Namlı'),
(15, '2323232323', 'Gorkem Mum'),
(16, '3434343434', 'Fatma Masır'),
(17, '4545454545', 'Abdullah Tanyol'),
(18, '5656565656', 'Mehmet Akay'),
(19, '6767676767', 'Servet Akca');

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `Seller_ID` int NOT NULL,
  `Estate_ID` int NOT NULL,
  `Buyer_ID` int NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`Seller_ID`, `Estate_ID`, `Buyer_ID`, `Date`) VALUES
(2, 42, 19, '2020-03-23'),
(3, 37, 17, '2020-05-04'),
(4, 39, 15, '2020-04-15'),
(5, 38, 16, '2020-05-02'),
(6, 40, 18, '2020-02-06'),
(7, 41, 14, '2020-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `estate`
--

CREATE TABLE `estate` (
  `ID` int NOT NULL,
  `Number of Balconies` int NOT NULL,
  `Status` varchar(45) NOT NULL,
  `Floor` int NOT NULL,
  `Seller_name` varchar(45) NOT NULL,
  `Condition` varchar(45) NOT NULL,
  `Date on Market` date NOT NULL,
  `Price` int NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Number of Rooms` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `estate`
--

INSERT INTO `estate` (`ID`, `Number of Balconies`, `Status`, `Floor`, `Seller_name`, `Condition`, `Date on Market`, `Price`, `Address`, `Number of Rooms`) VALUES
(37, 2, 'Sale', 4, 'Ahmet Yikilmaz', 'Available', '2020-05-07', 220000, 'Yenibaglar', 3),
(38, 5, 'Rent', 2, 'Ayse Durmaz', 'Available', '2020-05-04', 5000, 'Eskibaglar', 8),
(39, 2, 'Rent', 4, 'Emre Kacar', 'Available', '2020-04-23', 1000, 'Visnelik', 2),
(40, 4, 'Rent', 5, 'Hasan Aglamaz', 'Available', '2020-04-30', 3500, 'Sirintepe', 8),
(41, 0, 'Rent', 9, 'Muhittin Koc', 'Available', '2020-05-06', 300, 'Yenibaglar', 1),
(42, 1, 'Rent', 11, 'Mustafa Yilmaz', 'Available', '2020-03-25', 600, 'Bahcelievler', 2);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `ID` int NOT NULL,
  `Telephone Number` int NOT NULL,
  `Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`ID`, `Telephone Number`, `Name`) VALUES
(2, 1111111111, 'Mustafa Yilmaz'),
(3, 222222222, 'Ahmet Yikilmaz'),
(4, 333333333, 'Emre Kacar'),
(5, 444444444, 'Ayse Durmaz'),
(6, 555555555, 'Hasan Aglamaz'),
(7, 666666666, 'Muhittin Koc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`Seller_ID`,`Estate_ID`,`Buyer_ID`),
  ADD UNIQUE KEY `Estate_ID` (`Estate_ID`),
  ADD UNIQUE KEY `Seller_ID` (`Seller_ID`),
  ADD KEY `Buyer_ID` (`Buyer_ID`);

--
-- Indexes for table `estate`
--
ALTER TABLE `estate`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD UNIQUE KEY `Seller_name` (`Seller_name`),
  ADD UNIQUE KEY `ID_2` (`ID`),
  ADD UNIQUE KEY `Seller_name_2` (`Seller_name`),
  ADD UNIQUE KEY `Seller_name_3` (`Seller_name`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `estate`
--
ALTER TABLE `estate`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`Buyer_ID`) REFERENCES `buyer` (`ID`),
  ADD CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`Estate_ID`) REFERENCES `estate` (`ID`),
  ADD CONSTRAINT `seller_id` FOREIGN KEY (`Seller_ID`) REFERENCES `seller` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `estate`
--
ALTER TABLE `estate`
  ADD CONSTRAINT `seller_name` FOREIGN KEY (`Seller_name`) REFERENCES `seller` (`Name`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
