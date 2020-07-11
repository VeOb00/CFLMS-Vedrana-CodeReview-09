-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 12:19 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_vedrana_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_vedrana_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_vedrana_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `ID` int(11) NOT NULL,
  `street_name_and_number` varchar(250) DEFAULT NULL,
  `zip_code_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`ID`, `street_name_and_number`, `zip_code_ID`) VALUES
(1, 'Kärntner Straße 10', 1),
(2, 'Praterstraße 115', 2),
(3, 'Landstraßer Hauptstraße 35', 3),
(4, 'Baumgasse 12', 3),
(5, 'Neulinggasse 84', 3),
(6, 'Ungargasse 9', 3),
(7, 'Himmelpfortgasse 24', 1),
(8, 'Wassergasse 11', 3),
(9, 'Rochusgasse 50', 3),
(10, 'Sechskrügelgasse 82', 3),
(11, 'Berliner Straße 20', 46),
(12, 'Pariser Straße 100', 45),
(13, 'Obala Kulina Bana 50', 44),
(14, 'Rennweg 50', 3),
(15, 'Groß-Enzersdorer Straße 20', 22);

-- --------------------------------------------------------

--
-- Table structure for table `cities_places`
--

CREATE TABLE `cities_places` (
  `ID` int(11) NOT NULL,
  `city_place` varchar(150) DEFAULT NULL,
  `country_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities_places`
--

INSERT INTO `cities_places` (`ID`, `city_place`, `country_ID`) VALUES
(1, 'Vienna', 1),
(2, 'Sankt Pölten', 1),
(3, 'Linz', 1),
(4, 'Salzburg', 1),
(5, 'Innsbruck', 1),
(6, 'Eisenstadt', 1),
(7, 'Graz', 1),
(8, 'Klagenfurt', 1),
(9, 'Sarajevo', 2),
(10, 'Zagreb', 3),
(11, 'Copenhagen', 4),
(12, 'Tallinn', 5),
(13, 'Paris', 6),
(14, 'Berlin', 7);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `ID` int(11) NOT NULL,
  `country` varchar(150) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`ID`, `country`, `country_code`) VALUES
(1, 'Austria', 'AT'),
(2, 'Bosnia and Herzegowina', 'BA'),
(3, 'Croatia', 'HR'),
(4, 'Denmark', 'DK'),
(5, 'Estonia', 'EE'),
(6, 'France', 'FR'),
(7, 'Germany', 'DE'),
(8, 'Hungary', 'HU'),
(9, 'Irland', 'IE'),
(10, 'Japan', 'JP'),
(11, 'Korea', 'KR'),
(12, 'Latvia', 'LV'),
(13, 'Madagascar', 'MG'),
(14, 'Nepal', 'NP'),
(15, 'Oman', 'OM'),
(16, 'Portugal', 'PT'),
(17, 'Qatar', 'QA'),
(18, 'Russia', 'RU'),
(19, 'Serbia', 'RS'),
(20, 'Thailand', 'TH'),
(21, 'Ukraine', 'UA'),
(22, 'Vatican', 'VA'),
(23, 'Wallis and Futuna', 'WF'),
(24, 'Yemen', 'YE'),
(25, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `address_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`ID`, `first_name`, `last_name`, `address_ID`) VALUES
(1, 'Willie', 'Lumpkin', 8),
(2, 'Mary', 'Hope', 9),
(3, 'Carl', 'Smith', 10),
(4, 'Max', 'Mustermann', 11),
(5, 'Andre', 'Martin', 12),
(6, 'Osman', 'Osmanovic', 13),
(7, 'Max', 'Hueber', 7),
(8, 'Moritz', 'Grueber', 6);

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `ID` int(11) NOT NULL,
  `delivery_start_time` datetime DEFAULT NULL,
  `delivery_end_time` datetime DEFAULT NULL,
  `delivery_status` varchar(250) DEFAULT NULL,
  `package_entry_ID` int(11) NOT NULL,
  `employee_delivering_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`ID`, `delivery_start_time`, `delivery_end_time`, `delivery_status`, `package_entry_ID`, `employee_delivering_ID`) VALUES
(1, '2020-07-10 08:00:00', NULL, 'in progress', 1, 3),
(2, '2020-07-06 08:00:00', '2020-07-06 16:35:00', 'delivered', 2, 3),
(3, '2020-07-06 08:00:00', NULL, 'delivery failed, return to sender', 3, 3),
(4, '2020-07-05 08:00:00', '2020-07-05 10:00:00', 'delivered', 4, 4),
(5, '2020-07-02 08:00:00', '2020-07-02 14:00:00', 'in progress', 5, 3),
(6, '2020-07-01 08:00:00', '2020-07-01 13:00:00', 'delivered', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `position_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`ID`, `first_name`, `last_name`, `position_ID`) VALUES
(1, 'Henry', 'Chinaski', 1),
(2, 'Jamie', 'Hope', 2),
(3, 'Gordon', 'Krantz', 3),
(4, 'Schmordon', 'Schmrantz', 3);

-- --------------------------------------------------------

--
-- Table structure for table `employees_positions`
--

CREATE TABLE `employees_positions` (
  `ID` int(11) NOT NULL,
  `position` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees_positions`
--

INSERT INTO `employees_positions` (`ID`, `position`) VALUES
(1, 'Customer service'),
(2, 'Package processing and sorting'),
(3, 'Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `ID` int(11) NOT NULL,
  `package_attributes_ID` int(11) NOT NULL,
  `package_sender` int(11) NOT NULL,
  `package_reciever` int(11) NOT NULL,
  `delivery_price_euro` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`ID`, `package_attributes_ID`, `package_sender`, `package_reciever`, `delivery_price_euro`) VALUES
(1, 1, 1, 4, '1.50'),
(2, 2, 2, 5, '24.30'),
(3, 3, 3, 6, '542.80'),
(4, 4, 7, 8, '1.80'),
(5, 5, 7, 6, '2.40'),
(6, 6, 7, 5, '1.20');

-- --------------------------------------------------------

--
-- Table structure for table `package_attributes`
--

CREATE TABLE `package_attributes` (
  `ID` int(11) NOT NULL,
  `height_mm` int(11) NOT NULL,
  `width_mm` int(11) NOT NULL,
  `length_mm` int(11) NOT NULL,
  `package_weight_kg` decimal(7,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_attributes`
--

INSERT INTO `package_attributes` (`ID`, `height_mm`, `width_mm`, `length_mm`, `package_weight_kg`) VALUES
(1, 5, 162, 235, '0.010'),
(2, 600, 600, 1000, '6.000'),
(3, 100, 600, 1000, '60.300'),
(4, 30, 250, 353, '3.200'),
(5, 35, 162, 235, '2.000'),
(6, 60, 800, 400, '4.000');

-- --------------------------------------------------------

--
-- Table structure for table `package_entries`
--

CREATE TABLE `package_entries` (
  `ID` int(11) NOT NULL,
  `entry_date` date DEFAULT NULL,
  `package_ID` int(11) NOT NULL,
  `pickup_location_ID` int(11) NOT NULL,
  `employee_processing_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_entries`
--

INSERT INTO `package_entries` (`ID`, `entry_date`, `package_ID`, `pickup_location_ID`, `employee_processing_ID`) VALUES
(1, '2020-07-10', 1, 1, 2),
(2, '2020-07-05', 2, 2, 2),
(3, '2020-07-05', 3, 3, 2),
(4, '2020-07-04', 4, 3, 2),
(5, '2020-07-01', 5, 4, 2),
(6, '2020-07-01', 6, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pickup_locations`
--

CREATE TABLE `pickup_locations` (
  `ID` int(11) NOT NULL,
  `address_ID` int(11) NOT NULL,
  `post_office_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pickup_locations`
--

INSERT INTO `pickup_locations` (`ID`, `address_ID`, `post_office_ID`) VALUES
(1, 4, 3),
(2, 5, 3),
(3, 6, 3),
(4, 7, 1),
(5, 1, 1),
(6, 2, 2),
(7, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pickup_requests`
--

CREATE TABLE `pickup_requests` (
  `ID` int(11) NOT NULL,
  `pickup_status` enum('requested','in progress','done') NOT NULL DEFAULT 'requested',
  `request_recieved` date DEFAULT NULL,
  `customer_ID` int(11) NOT NULL,
  `pickup_location_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pickup_requests`
--

INSERT INTO `pickup_requests` (`ID`, `pickup_status`, `request_recieved`, `customer_ID`, `pickup_location_ID`) VALUES
(1, 'done', '2020-06-29', 1, 1),
(2, 'done', '2020-06-29', 3, 3),
(3, 'requested', '2020-06-30', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_offices`
--

CREATE TABLE `post_offices` (
  `ID` int(11) NOT NULL,
  `office_name` varchar(250) DEFAULT NULL,
  `office_type` varchar(250) DEFAULT NULL,
  `address_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_offices`
--

INSERT INTO `post_offices` (`ID`, `office_name`, `office_type`, `address_ID`) VALUES
(1, 'The City Center Post', 'Post office', 1),
(2, 'Prater Post', 'Post office', 2),
(3, 'Post 1030', 'Post office', 3),
(4, 'Post Headquarters', 'Headquarters', 14),
(5, 'Post Sorting Center', 'Sorting Center', 15);

-- --------------------------------------------------------

--
-- Table structure for table `zip_codes`
--

CREATE TABLE `zip_codes` (
  `ID` int(11) NOT NULL,
  `zip_code` int(11) NOT NULL,
  `city_place_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zip_codes`
--

INSERT INTO `zip_codes` (`ID`, `zip_code`, `city_place_ID`) VALUES
(1, 1010, 1),
(2, 1020, 1),
(3, 1030, 1),
(4, 1040, 1),
(5, 1050, 1),
(6, 1060, 1),
(7, 1070, 1),
(8, 1080, 1),
(9, 1090, 1),
(10, 1100, 1),
(11, 1110, 1),
(12, 1120, 1),
(13, 1130, 1),
(14, 1140, 1),
(15, 1150, 1),
(16, 1160, 1),
(17, 1170, 1),
(18, 1180, 1),
(19, 1190, 1),
(20, 1200, 1),
(21, 1210, 1),
(22, 1220, 1),
(23, 3100, 2),
(24, 3104, 2),
(25, 3105, 2),
(26, 3140, 2),
(27, 4020, 3),
(28, 4024, 3),
(29, 4030, 3),
(30, 5020, 4),
(31, 5026, 4),
(32, 5071, 4),
(33, 6020, 5),
(34, 6063, 5),
(35, 6072, 5),
(36, 7000, 6),
(37, 7051, 6),
(38, 8010, 7),
(39, 8036, 7),
(40, 8042, 7),
(41, 9010, 8),
(42, 9020, 8),
(43, 9061, 8),
(44, 71000, 9),
(45, 75000, 13),
(46, 10115, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `zip_code_ID` (`zip_code_ID`);

--
-- Indexes for table `cities_places`
--
ALTER TABLE `cities_places`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `country_ID` (`country_ID`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `address_ID` (`address_ID`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `package_entry_ID` (`package_entry_ID`),
  ADD KEY `employee_delivering_ID` (`employee_delivering_ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `position_ID` (`position_ID`);

--
-- Indexes for table `employees_positions`
--
ALTER TABLE `employees_positions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `package_attributes_ID` (`package_attributes_ID`),
  ADD KEY `package_sender` (`package_sender`),
  ADD KEY `package_reciever` (`package_reciever`);

--
-- Indexes for table `package_attributes`
--
ALTER TABLE `package_attributes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `package_entries`
--
ALTER TABLE `package_entries`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `package_ID` (`package_ID`),
  ADD KEY `pickup_location_ID` (`pickup_location_ID`),
  ADD KEY `employee_processing_ID` (`employee_processing_ID`);

--
-- Indexes for table `pickup_locations`
--
ALTER TABLE `pickup_locations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `address_ID` (`address_ID`),
  ADD KEY `post_office_ID` (`post_office_ID`);

--
-- Indexes for table `pickup_requests`
--
ALTER TABLE `pickup_requests`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `customer_ID` (`customer_ID`),
  ADD KEY `pickup_location_ID` (`pickup_location_ID`);

--
-- Indexes for table `post_offices`
--
ALTER TABLE `post_offices`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `address_ID` (`address_ID`);

--
-- Indexes for table `zip_codes`
--
ALTER TABLE `zip_codes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `city_place_ID` (`city_place_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cities_places`
--
ALTER TABLE `cities_places`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees_positions`
--
ALTER TABLE `employees_positions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_attributes`
--
ALTER TABLE `package_attributes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_entries`
--
ALTER TABLE `package_entries`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pickup_locations`
--
ALTER TABLE `pickup_locations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pickup_requests`
--
ALTER TABLE `pickup_requests`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_offices`
--
ALTER TABLE `post_offices`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `zip_codes`
--
ALTER TABLE `zip_codes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`zip_code_ID`) REFERENCES `zip_codes` (`ID`);

--
-- Constraints for table `cities_places`
--
ALTER TABLE `cities_places`
  ADD CONSTRAINT `cities_places_ibfk_1` FOREIGN KEY (`country_ID`) REFERENCES `countries` (`ID`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`address_ID`) REFERENCES `addresses` (`ID`);

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`package_entry_ID`) REFERENCES `package_entries` (`ID`),
  ADD CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`employee_delivering_ID`) REFERENCES `employees` (`ID`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`position_ID`) REFERENCES `employees_positions` (`ID`);

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`package_attributes_ID`) REFERENCES `package_attributes` (`ID`),
  ADD CONSTRAINT `packages_ibfk_2` FOREIGN KEY (`package_sender`) REFERENCES `customers` (`ID`),
  ADD CONSTRAINT `packages_ibfk_3` FOREIGN KEY (`package_reciever`) REFERENCES `customers` (`ID`);

--
-- Constraints for table `package_entries`
--
ALTER TABLE `package_entries`
  ADD CONSTRAINT `package_entries_ibfk_1` FOREIGN KEY (`package_ID`) REFERENCES `packages` (`ID`),
  ADD CONSTRAINT `package_entries_ibfk_2` FOREIGN KEY (`pickup_location_ID`) REFERENCES `pickup_locations` (`ID`),
  ADD CONSTRAINT `package_entries_ibfk_3` FOREIGN KEY (`employee_processing_ID`) REFERENCES `employees` (`ID`);

--
-- Constraints for table `pickup_locations`
--
ALTER TABLE `pickup_locations`
  ADD CONSTRAINT `pickup_locations_ibfk_1` FOREIGN KEY (`address_ID`) REFERENCES `addresses` (`ID`),
  ADD CONSTRAINT `pickup_locations_ibfk_2` FOREIGN KEY (`post_office_ID`) REFERENCES `post_offices` (`ID`);

--
-- Constraints for table `pickup_requests`
--
ALTER TABLE `pickup_requests`
  ADD CONSTRAINT `pickup_requests_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customers` (`ID`),
  ADD CONSTRAINT `pickup_requests_ibfk_2` FOREIGN KEY (`pickup_location_ID`) REFERENCES `pickup_locations` (`ID`);

--
-- Constraints for table `post_offices`
--
ALTER TABLE `post_offices`
  ADD CONSTRAINT `post_offices_ibfk_1` FOREIGN KEY (`address_ID`) REFERENCES `addresses` (`ID`);

--
-- Constraints for table `zip_codes`
--
ALTER TABLE `zip_codes`
  ADD CONSTRAINT `zip_codes_ibfk_1` FOREIGN KEY (`city_place_ID`) REFERENCES `cities_places` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
