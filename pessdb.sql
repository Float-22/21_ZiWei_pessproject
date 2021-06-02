-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2021 at 04:41 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pessdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incident_id` int(11) NOT NULL,
  `patrolcar_id` varchar(10) NOT NULL,
  `time_dispatched` datetime NOT NULL,
  `time_arrived` datetime DEFAULT NULL,
  `time_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incident_id`, `patrolcar_id`, `time_dispatched`, `time_arrived`, `time_completed`) VALUES
(6, 'QX1234', '2014-05-29 10:51:15', NULL, '2014-05-29 10:53:43'),
(6, 'QX4444P', '2014-05-29 11:10:57', NULL, NULL),
(8, 'QX4321R', '2014-05-29 10:59:42', NULL, NULL),
(10, 'QX2341', '2021-05-31 01:56:14', NULL, NULL),
(11, 'QX4321R', '2021-05-31 01:56:23', NULL, NULL),
(12, 'QX2222A', '2021-05-31 01:56:38', NULL, NULL),
(13, 'QX2222A', '2021-05-31 02:01:16', NULL, NULL),
(14, 'QX2222A', '2021-05-31 02:01:20', NULL, NULL),
(15, 'QX1000B', '2021-05-31 02:06:04', NULL, NULL),
(16, 'QX7777', '2021-05-31 02:06:31', NULL, NULL),
(17, 'QX1234', '2021-05-31 02:07:42', NULL, '2021-06-01 21:12:32'),
(18, 'QX1000B', '2021-05-31 02:13:35', NULL, NULL),
(19, 'QX1000B', '2021-06-01 21:05:28', NULL, NULL),
(20, 'QX1234', '2021-06-01 21:05:44', NULL, '2021-06-01 21:12:32'),
(21, 'QX1234', '2021-06-02 10:25:54', NULL, '2021-06-02 10:26:01');

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incident_id` int(11) NOT NULL,
  `caller_name` varchar(30) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `incident_type_id` varchar(3) NOT NULL,
  `incident_location` varchar(50) NOT NULL,
  `incident_desc` varchar(100) NOT NULL,
  `incident_status_id` varchar(1) NOT NULL,
  `time_called` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incident_id`, `caller_name`, `phone_number`, `incident_type_id`, `incident_location`, `incident_desc`, `incident_status_id`, `time_called`) VALUES
(6, 'PETER LEOW', '81234567', '010', 'Junction of North Bridge Rd and Middle Rd', 'A bus collided with a Taxi.2 Injuries', '1', '2021-05-29 17:45:41'),
(8, 'qwerty', '12345678', '030', 'cck', 'qwerty', '3', '2021-05-29 17:45:41'),
(9, 'CR7\"', '81234567\"', '010', 'Madrid\"', 'm\"', '2', '2021-05-31 01:55:50'),
(10, 'CR7\"', '81234567\"', '010', 'Madrid\"', 'm\"', '2', '2021-05-31 01:56:14'),
(11, 'CR7\"', '81234567\"', '010', 'Madrid\"', 'm\"', '2', '2021-05-31 01:56:23'),
(12, 'CR7\"', '12345678\"', '010', 'Madrid\"', 'b\"', '2', '2021-05-31 01:56:38'),
(13, 'CR7\"', '12345678\"', '010', 'Madrid\"', 'b\"', '2', '2021-05-31 02:01:16'),
(14, 'CR7\"', '12345678\"', '010', 'Madrid\"', 'b\"', '2', '2021-05-31 02:01:20'),
(15, 'CRISTIANO\"', '12345678\"', '010', 'Madrid\"', 'b\"', '2', '2021-05-31 02:06:04'),
(16, 'CRISTIANO\"', '12345678\"', '010', 'Madrid\"', 'b\"', '2', '2021-05-31 02:06:31'),
(17, 'CRISTIANO\"', '81234567\"', '010', 'Madrid\"', 'q\"', '2', '2021-05-31 02:07:42'),
(18, 'CRISTIANO\"', '12345678\"', '010', 'Madrid\"', 'b\"', '2', '2021-05-31 02:13:35'),
(19, 'CR7\"', '81234567\"', '010', 'Madrid\"', 'www\"', '2', '2021-06-01 21:05:28'),
(20, 'CR7\"', '81234567\"', '010', 'Madrid\"', 'www\"', '3', '2021-06-01 21:12:32'),
(21, 'CRISTIANO\"', '12345678\"', '020', 'Madrid\"', 'w\"', '3', '2021-06-02 10:26:01');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

CREATE TABLE `incident_status` (
  `incident_status_id` varchar(1) NOT NULL,
  `ident_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident_status`
--

INSERT INTO `incident_status` (`incident_status_id`, `ident_status_desc`) VALUES
('1', 'Pending'),
('2', 'Dispatched'),
('3', 'Completed'),
('4', 'Duplicate');

-- --------------------------------------------------------

--
-- Table structure for table `incident_type`
--

CREATE TABLE `incident_type` (
  `incident_type_id` varchar(3) NOT NULL,
  `incident_type_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident_type`
--

INSERT INTO `incident_type` (`incident_type_id`, `incident_type_desc`) VALUES
('010', 'Fire'),
('020', 'Riot'),
('030', 'Burglary'),
('040', 'Domestic Violent'),
('050', 'Fallen Tree'),
('060', 'Traffic Accident'),
('070', 'Loan Shark'),
('999', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcar_id` varchar(10) NOT NULL,
  `patrolcar_status_id` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcar_id`, `patrolcar_status_id`) VALUES
('QX1000B', '1'),
('QX2341', '2'),
('QX45545', '2'),
('QX7777', '2'),
('QX1234', '3'),
('QX2222A', '3'),
('QX4321R', '3'),
('QX4444P', '3'),
('QX9999H', '3');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

CREATE TABLE `patrolcar_status` (
  `patrolcar_status_id` varchar(1) NOT NULL,
  `patrolcar_status_desc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`patrolcar_status_id`, `patrolcar_status_desc`) VALUES
('1', 'Dispatched'),
('3', 'Free'),
('5', 'NA'),
('4', 'On-site'),
('2', 'Patrol');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incident_id`,`patrolcar_id`),
  ADD KEY `patrolcar_id` (`patrolcar_id`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incident_id`),
  ADD KEY `incident_type_id` (`incident_type_id`,`incident_status_id`),
  ADD KEY `incident_status_id` (`incident_status_id`);

--
-- Indexes for table `incident_status`
--
ALTER TABLE `incident_status`
  ADD PRIMARY KEY (`incident_status_id`);

--
-- Indexes for table `incident_type`
--
ALTER TABLE `incident_type`
  ADD PRIMARY KEY (`incident_type_id`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcar_id`),
  ADD KEY `patrolcar_status_id` (`patrolcar_status_id`);

--
-- Indexes for table `patrolcar_status`
--
ALTER TABLE `patrolcar_status`
  ADD PRIMARY KEY (`patrolcar_status_id`),
  ADD KEY `patrolcar_status_desc` (`patrolcar_status_desc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incident_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD CONSTRAINT `dispatch_ibfk_1` FOREIGN KEY (`incident_id`) REFERENCES `incident` (`incident_id`),
  ADD CONSTRAINT `dispatch_ibfk_2` FOREIGN KEY (`patrolcar_id`) REFERENCES `patrolcar` (`patrolcar_id`);

--
-- Constraints for table `incident`
--
ALTER TABLE `incident`
  ADD CONSTRAINT `incident_ibfk_1` FOREIGN KEY (`incident_type_id`) REFERENCES `incident_type` (`incident_type_id`),
  ADD CONSTRAINT `incident_ibfk_2` FOREIGN KEY (`incident_status_id`) REFERENCES `incident_status` (`incident_status_id`);

--
-- Constraints for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD CONSTRAINT `patrolcar_ibfk_1` FOREIGN KEY (`patrolcar_status_id`) REFERENCES `patrolcar_status` (`patrolcar_status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
