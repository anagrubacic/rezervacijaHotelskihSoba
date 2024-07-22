-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2023 at 07:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hoteli`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `administrator_id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`administrator_id`, `firstname`, `lastname`, `email`, `username`, `password`) VALUES
(1, 'Ana', 'Grubacic', 'grubacicana@gmail.com', 'grubacicana', 'ana-admin');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(10) UNSIGNED NOT NULL,
  `numberOfPersons` int(10) NOT NULL,
  `dateFrom` date NOT NULL,
  `dateTo` date NOT NULL,
  `room` int(10) UNSIGNED NOT NULL,
  `hotel` int(10) UNSIGNED NOT NULL,
  `points` int(20) NOT NULL DEFAULT 0,
  `client` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `numberOfPersons`, `dateFrom`, `dateTo`, `room`, `hotel`, `points`, `client`, `price`) VALUES
(1, 1, '2023-09-20', '2023-09-23', 1, 1, 20, 1, 120),
(12, 1, '2023-10-04', '2023-10-07', 1, 1, 25, 2, 400);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `numberOfPoints` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `firstname`, `lastname`, `email`, `password`, `numberOfPoints`) VALUES
(1, 'Nikola', 'Nikolic', 'nikola.nikolic@gmail.com', 'nikola123', 20),
(2, 'Tamara', 'Jovic', 'tamara@gmail.com', 'tamara123', 25);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `stars` int(11) NOT NULL,
  `numberOfRooms` int(20) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `name`, `address`, `city`, `country`, `phoneNumber`, `stars`, `numberOfRooms`, `image`) VALUES
(1, 'Royal Lancaster', 'Lancaster Terrace, Vestminster', 'Vestminster, London', 'Velika Britanija', '+44 20 7551 6000', 5, 50, 'https://cf.bstatic.com/xdata/images/hotel/max1280x900/130774650.jpg?k=32c21c86a35e378fb22fc61e3ffa996308c82b6600d6f245146429209b47a6b7&o=&hp=1'),
(2, 'Sonder Park House', 'Vossiusstraat 52-53', 'Amsterdam', 'Holandija', '+31 20 241 7095', 4, 48, 'https://cf.bstatic.com/xdata/images/hotel/max1280x900/489578773.jpg?k=db29647cac2bf4665c677e93a91ffa14b5ebf041fbe275615323ad1581e9f234&o=&hp=1'),
(3, 'Moonbeam Hotel', 'ÃÂ ÃÂµÃÂÃÂºÃÂ¬ÃÂÃÂ¹ 640', 'Thassos', 'Grcka', '+30 2593 051701', 3, 25, 'https://cf.bstatic.com/xdata/images/hotel/max1280x900/186686857.jpg?k=76d659e0f43df904e24ce812242f40ca4e7d7bacef0108b9766404790820944f&o=&hp=1');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `hotel` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `firstname`, `lastname`, `email`, `username`, `password`, `hotel`) VALUES
(1, 'Anja', 'Pumpalovic', 'anja.pumpa@gmail.com', 'anja.pumpa', 'anja.pumpaa', 1),
(2, 'Jovan', 'Jovic', 'jovan1999@gmail.com', 'jovan123', 'jovan123', 2),
(3, 'Pera', 'Peric', 'peric.p@gmail.com', 'pera-men', 'pera-men', 3);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(10) UNSIGNED NOT NULL,
  `roomType` int(10) UNSIGNED NOT NULL,
  `hotel` int(10) UNSIGNED NOT NULL,
  `numberOfBeds` int(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `number` int(10) NOT NULL,
  `price` double NOT NULL,
  `points` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `roomType`, `hotel`, `numberOfBeds`, `description`, `image`, `number`, `price`, `points`) VALUES
(1, 2, 1, 1, 'Klasicna Dvokrevetna Soba sa Bracnim Krevetomm', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/489474274.jpg?k=9270e2514cab927790401cb79945d24542787bb8b0ed6e53f776528222af4aae&o=', 10, 400, 20),
(2, 1, 2, 1, 'Jednokrevetna Soba. Odlikuje ih prostranost, idealne su za odmor.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/386143486.jpg?k=9ba990cdd6a697d1b3e2765bf10ca24c46fd11fa456f942cd57b587400cb3ac0&o=', 11, 120, 12),
(4, 6, 3, 3, 'Apartman sa 1 Spavaćom Sobom', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/186685598.jpg?k=b5e137c3306c0964d05e6bd3a4dad634a0350d0fecaecfe87d37dd956d18e085&o=', 13, 30, 10),
(5, 7, 1, 3, 'Luksuzni Suite sa 1 Spavacom Sobom i Pogledom na Park\r\nImaju TV, sopstveno kupatilo, raspolaÃÂ¾u sa otvorenom wi-fi konekcijom.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/489481730.jpg?k=8e52295eb18bb82dd116520282b18d9d33ec45436ad25a722dd52c4b7523538f&o=', 14, 840, 40),
(6, 2, 2, 2, 'Dvokrevetna Soba sa Zasebnim Krevetima', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/386143529.jpg?k=8434c9e2153acb387130316a97a2604915ff2c6038659dbfd22d68a59bd31577&o=', 16, 100, 12),
(7, 4, 3, 3, 'Trokrevetna soba sa pogledom na bazen', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/186685648.jpg?k=16fbae7bd6db064db88a5411772ccb299b3258ef4aac10a98b7fc415c3c4a64d&o=', 20, 30, 10);

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `roomType_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `numberOfPoints` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`roomType_id`, `name`, `numberOfPoints`) VALUES
(1, 'Jednokrevetna', 10),
(2, 'Dvokrevetna', 20),
(4, 'Trokrevetna', 30),
(5, 'Cetvorokrevetna', 40),
(6, 'Apartman', 50),
(7, 'Predsednicki apartman', 80);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`administrator_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_bookinghotel` (`hotel`),
  ADD KEY `fk_bookingroom` (`room`),
  ADD KEY `fk_bookingclient` (`client`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `client_email` (`email`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`),
  ADD KEY `fk_hotelmanager` (`hotel`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `fk_roomhotel` (`hotel`),
  ADD KEY `fk_roomtype` (`roomType`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`roomType_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `administrator_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `manager_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `roomType_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_bookingclient` FOREIGN KEY (`client`) REFERENCES `client` (`client_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_bookinghotel` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_bookingroom` FOREIGN KEY (`room`) REFERENCES `room` (`room_id`) ON DELETE CASCADE;

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `fk_hotelmanager` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `fk_roomhotel` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_roomtype` FOREIGN KEY (`roomType`) REFERENCES `roomtype` (`roomType_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
