-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2016 at 01:25 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_ngebis`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_autobuscompany`
--

CREATE TABLE IF NOT EXISTS `tbl_autobuscompany` (
  `companyId` int(11) NOT NULL,
  `companyName` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_autobuscompany`
--

INSERT INTO `tbl_autobuscompany` (`companyId`, `companyName`) VALUES
(1, 'PO. Cobaan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jadwal`
--

CREATE TABLE IF NOT EXISTS `tbl_jadwal` (
  `scheduleId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `time` time NOT NULL,
  `routeId` int(11) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jadwalharian`
--

CREATE TABLE IF NOT EXISTS `tbl_jadwalharian` (
  `dayScheduleId` int(11) NOT NULL,
  `date` date NOT NULL,
  `scheduleId` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `crewId` int(11) DEFAULT NULL,
  `vehicleId` varchar(8) NOT NULL,
  `facility` set('Restaurant','Nasi Box') NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kruperson`
--

CREATE TABLE IF NOT EXISTS `tbl_kruperson` (
  `crewId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `photo` varchar(128) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `level` enum('Kru Lapangan','Entry Data','Owner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lungguhan`
--

CREATE TABLE IF NOT EXISTS `tbl_lungguhan` (
  `seatsId` int(11) NOT NULL,
  `seatNumber` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_lungguhan`
--

INSERT INTO `tbl_lungguhan` (`seatsId`, `seatNumber`) VALUES
(24, '1A'),
(24, '1B'),
(24, '1C'),
(24, '2A'),
(24, '2B'),
(24, '2C'),
(24, '3A'),
(24, '3B'),
(24, '3C'),
(24, '4A'),
(24, '4B'),
(24, '4C'),
(24, '5A'),
(24, '5B'),
(24, '5C'),
(24, '6A'),
(24, '6B'),
(24, '6C'),
(24, '7A'),
(24, '7B'),
(24, '7C'),
(24, '8A'),
(24, '8B'),
(24, '8C');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mlebu`
--

CREATE TABLE IF NOT EXISTS `tbl_mlebu` (
  `customerId` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_montor`
--

CREATE TABLE IF NOT EXISTS `tbl_montor` (
  `vehicleId` varchar(8) NOT NULL,
  `companyId` int(11) NOT NULL,
  `licenseNumber` varchar(16) NOT NULL,
  `image` varchar(128) NOT NULL,
  `vehicleTypeId` int(11) NOT NULL,
  `position` point DEFAULT NULL,
  `busFasilities` set('AC','Non AC','Music','Charger') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_numpak`
--

CREATE TABLE IF NOT EXISTS `tbl_numpak` (
  `pessengerId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `address` text NOT NULL,
  `phoneNumber` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pesen`
--

CREATE TABLE IF NOT EXISTS `tbl_pesen` (
  `orderId` int(11) NOT NULL COMMENT 'Generate Kode Book di app',
  `timestamp` datetime NOT NULL,
  `expireTime` datetime NOT NULL,
  `customerId` int(11) NOT NULL,
  `paymentStatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rute`
--

CREATE TABLE IF NOT EXISTS `tbl_rute` (
  `routeId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `path` multipoint NOT NULL,
  `routeName` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tiket`
--

CREATE TABLE IF NOT EXISTS `tbl_tiket` (
  `ticketId` int(11) NOT NULL COMMENT 'Generate Kode Tiket di app',
  `orderId` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `seatsNumber` int(11) NOT NULL,
  `pessengerId` int(11) NOT NULL,
  `dayScheduleId` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipe_montor`
--

CREATE TABLE IF NOT EXISTS `tbl_tipe_montor` (
  `vehicleTypeId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `seatsId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_titikmampir`
--

CREATE TABLE IF NOT EXISTS `tbl_titikmampir` (
  `transitId` int(11) NOT NULL,
  `routeId` int(11) NOT NULL,
  `location` point NOT NULL,
  `locationName` varchar(128) NOT NULL,
  `travelingTime` time NOT NULL,
  `order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_autobuscompany`
--
ALTER TABLE `tbl_autobuscompany`
  ADD PRIMARY KEY (`companyId`);

--
-- Indexes for table `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  ADD PRIMARY KEY (`scheduleId`), ADD KEY `companyId` (`companyId`), ADD KEY `routeId` (`routeId`);

--
-- Indexes for table `tbl_jadwalharian`
--
ALTER TABLE `tbl_jadwalharian`
  ADD PRIMARY KEY (`dayScheduleId`), ADD KEY `crewId` (`crewId`), ADD KEY `vehicleId` (`vehicleId`), ADD KEY `scheduleId` (`scheduleId`), ADD KEY `scheduleId_2` (`scheduleId`), ADD KEY `crewId_2` (`crewId`), ADD KEY `vehicleId_2` (`vehicleId`), ADD KEY `vehicleId_3` (`vehicleId`), ADD KEY `vehicleId_4` (`vehicleId`);

--
-- Indexes for table `tbl_kruperson`
--
ALTER TABLE `tbl_kruperson`
  ADD PRIMARY KEY (`crewId`), ADD KEY `companyId` (`companyId`);

--
-- Indexes for table `tbl_lungguhan`
--
ALTER TABLE `tbl_lungguhan`
  ADD PRIMARY KEY (`seatsId`,`seatNumber`);

--
-- Indexes for table `tbl_mlebu`
--
ALTER TABLE `tbl_mlebu`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `tbl_montor`
--
ALTER TABLE `tbl_montor`
  ADD PRIMARY KEY (`vehicleId`), ADD KEY `vehicleTypeId` (`vehicleTypeId`), ADD KEY `companyId` (`companyId`), ADD KEY `vehicleTypeId_2` (`vehicleTypeId`);

--
-- Indexes for table `tbl_numpak`
--
ALTER TABLE `tbl_numpak`
  ADD PRIMARY KEY (`pessengerId`), ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `tbl_pesen`
--
ALTER TABLE `tbl_pesen`
  ADD PRIMARY KEY (`orderId`), ADD KEY `timestamp` (`timestamp`), ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `tbl_rute`
--
ALTER TABLE `tbl_rute`
  ADD PRIMARY KEY (`routeId`), ADD KEY `companyId` (`companyId`);

--
-- Indexes for table `tbl_tiket`
--
ALTER TABLE `tbl_tiket`
  ADD PRIMARY KEY (`ticketId`), ADD KEY `orderId` (`orderId`), ADD KEY `pessengerId` (`pessengerId`), ADD KEY `scheduleId` (`dayScheduleId`), ADD KEY `dayScheduleId` (`dayScheduleId`);

--
-- Indexes for table `tbl_tipe_montor`
--
ALTER TABLE `tbl_tipe_montor`
  ADD PRIMARY KEY (`vehicleTypeId`), ADD KEY `companyId` (`companyId`), ADD KEY `seatsId` (`seatsId`);

--
-- Indexes for table `tbl_titikmampir`
--
ALTER TABLE `tbl_titikmampir`
  ADD PRIMARY KEY (`transitId`), ADD KEY `companyId` (`routeId`), ADD KEY `routeId` (`routeId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_autobuscompany`
--
ALTER TABLE `tbl_autobuscompany`
  MODIFY `companyId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  MODIFY `scheduleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_jadwalharian`
--
ALTER TABLE `tbl_jadwalharian`
  MODIFY `dayScheduleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_kruperson`
--
ALTER TABLE `tbl_kruperson`
  MODIFY `crewId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_rute`
--
ALTER TABLE `tbl_rute`
  MODIFY `routeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_tipe_montor`
--
ALTER TABLE `tbl_tipe_montor`
  MODIFY `vehicleTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_titikmampir`
--
ALTER TABLE `tbl_titikmampir`
  MODIFY `transitId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
ADD CONSTRAINT `tbl_jadwal_ibfk_2` FOREIGN KEY (`routeId`) REFERENCES `tbl_rute` (`routeId`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `tbl_jadwal_ibfk_3` FOREIGN KEY (`companyId`) REFERENCES `tbl_autobuscompany` (`companyId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_jadwalharian`
--
ALTER TABLE `tbl_jadwalharian`
ADD CONSTRAINT `tbl_jadwalharian_ibfk_2` FOREIGN KEY (`crewId`) REFERENCES `tbl_kruperson` (`crewId`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `tbl_jadwalharian_ibfk_3` FOREIGN KEY (`vehicleId`) REFERENCES `tbl_montor` (`vehicleId`) ON UPDATE CASCADE,
ADD CONSTRAINT `tbl_jadwalharian_ibfk_4` FOREIGN KEY (`scheduleId`) REFERENCES `tbl_jadwal` (`scheduleId`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_kruperson`
--
ALTER TABLE `tbl_kruperson`
ADD CONSTRAINT `tbl_kruperson_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `tbl_autobuscompany` (`companyId`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_montor`
--
ALTER TABLE `tbl_montor`
ADD CONSTRAINT `tbl_montor_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `tbl_autobuscompany` (`companyId`) ON UPDATE CASCADE,
ADD CONSTRAINT `tbl_montor_ibfk_3` FOREIGN KEY (`vehicleTypeId`) REFERENCES `tbl_tipe_montor` (`vehicleTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_numpak`
--
ALTER TABLE `tbl_numpak`
ADD CONSTRAINT `tbl_numpak_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `tbl_mlebu` (`customerId`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pesen`
--
ALTER TABLE `tbl_pesen`
ADD CONSTRAINT `tbl_pesen_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `tbl_mlebu` (`customerId`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_tiket`
--
ALTER TABLE `tbl_tiket`
ADD CONSTRAINT `tbl_tiket_ibfk_4` FOREIGN KEY (`dayScheduleId`) REFERENCES `tbl_jadwalharian` (`dayScheduleId`) ON UPDATE CASCADE,
ADD CONSTRAINT `tbl_tiket_ibfk_5` FOREIGN KEY (`orderId`) REFERENCES `tbl_pesen` (`orderId`) ON UPDATE CASCADE,
ADD CONSTRAINT `tbl_tiket_ibfk_6` FOREIGN KEY (`pessengerId`) REFERENCES `tbl_numpak` (`pessengerId`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_tipe_montor`
--
ALTER TABLE `tbl_tipe_montor`
ADD CONSTRAINT `tbl_tipe_montor_ibfk_1` FOREIGN KEY (`seatsId`) REFERENCES `tbl_lungguhan` (`seatsId`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `tbl_tipe_montor_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `tbl_autobuscompany` (`companyId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_titikmampir`
--
ALTER TABLE `tbl_titikmampir`
ADD CONSTRAINT `tbl_titikmampir_ibfk_1` FOREIGN KEY (`routeId`) REFERENCES `tbl_rute` (`routeId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
