-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 18, 2022 at 06:36 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` int(11) NOT NULL,
  `account_balance` int(11) NOT NULL,
  `account_creation` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `account_name`, `account_number`, `account_balance`, `account_creation`) VALUES
(1, 'Yolande de Amaya', 628460747, 14791, '2022-06-21'),
(2, 'Delinda Shearmer', 120974864, 16702, '2022-04-18'),
(3, 'Shel Maharey', 981249683, 21139, '2022-09-16'),
(4, 'Louella Needs', 410977776, 49775, '2022-11-05'),
(5, 'Rowan Tucknutt', 126466396, 45203, '2022-06-29'),
(6, 'Sigrid Diprose', 162896840, 21280, '2022-05-07'),
(7, 'Alanna Tubble', 938533825, 2013, '2022-10-13'),
(8, 'Jeana Parkman', 190876408, 31032, '2022-04-01'),
(9, 'Taryn Devitt', 762258384, 43709, '2021-12-09'),
(10, 'Milly Donalson', 954566336, 39828, '2022-05-03'),
(11, 'Mala Winstone', 991406712, 32536, '2022-05-30'),
(12, 'Janessa Aireton', 972788428, 29689, '2022-04-24'),
(13, 'Teresa Gowdridge', 155750733, 33979, '2022-11-11'),
(14, 'Bree Benet', 489848374, 11145, '2021-11-23'),
(15, 'Gordon Tebbett', 145644721, 32115, '2022-02-03'),
(16, 'Barbi Wrathmall', 506605859, 22066, '2022-08-04'),
(17, 'Nicola Deverall', 381623519, 47860, '2022-07-05'),
(18, 'Kesley Buyers', 106865729, 3976, '2022-01-24'),
(19, 'Antonin Hindenberger', 292744211, 4194, '2022-07-02'),
(20, 'Bryn Joddens', 919627218, 34135, '2022-03-15'),
(21, 'Jeanna Piers', 922194772, 14198, '2022-11-06'),
(22, 'Marianne Drezzer', 80084968, 35375, '2022-05-30'),
(23, 'Nicoli Normaville', 306292350, 476, '2022-07-20'),
(24, 'Sarine Cackett', 341281851, 36846, '2022-06-08'),
(25, 'Martin Mascall', 85876549, 15249, '2022-03-25');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `sender_name` varchar(55) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `reciever_name` varchar(55) DEFAULT NULL,
  `reciever_id` int(11) DEFAULT NULL,
  `transaction_amount` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `sender_name`, `sender_id`, `reciever_name`, `reciever_id`, `transaction_amount`, `transaction_date`) VALUES
(1, 'Delinda Shearmer', 120974864, 'Shel Maharey', 981249683, 2000, '2022-11-16'),
(2, 'Shel Maharey', 981249683, 'Delinda Shearmer', 120974864, 4000, '2022-11-16'),
(3, 'Yolande de Amaya', 628460747, 'Delinda Shearmer', 120974864, 3000, '2022-11-18'),
(4, 'Delinda Shearmer', 120974864, 'Delinda Shearmer', 120974864, 2134, '2022-11-18'),
(5, 'Yolande de Amaya', 628460747, 'Delinda Shearmer', 120974864, 2312, '2022-11-18'),
(6, 'Delinda Shearmer', 120974864, 'Delinda Shearmer', 120974864, 123, '2022-11-18'),
(7, 'Yolande de Amaya', 628460747, 'Delinda Shearmer', 120974864, 15000, '2022-11-18'),
(8, 'Delinda Shearmer', 120974864, 'Yolande de Amaya', 628460747, 15000, '2022-11-18'),
(9, 'Yolande de Amaya', 628460747, 'Delinda Shearmer', 120974864, 15000, '2022-11-18'),
(10, 'Delinda Shearmer', 120974864, 'Yolande de Amaya', 628460747, 15000, '2022-11-18'),
(11, 'Yolande de Amaya', 628460747, 'Delinda Shearmer', 120974864, 15000, '2022-11-18'),
(12, 'Delinda Shearmer', 120974864, 'Yolande de Amaya', 628460747, 15000, '2022-11-18'),
(13, 'Delinda Shearmer', 120974864, 'Delinda Shearmer', 120974864, 15000, '2022-11-18'),
(14, 'Delinda Shearmer', 120974864, 'Delinda Shearmer', 120974864, 15000, '2022-11-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `account_number` (`account_number`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
