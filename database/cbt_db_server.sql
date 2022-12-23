-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2022 at 07:44 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cbt_db_server`
--

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE `jawaban` (
  `id` varchar(100) NOT NULL,
  `soal_id` varchar(100) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `jawaban` char(1) NOT NULL,
  `koreksi` int(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jawaban`
--

INSERT INTO `jawaban` (`id`, `soal_id`, `nis`, `jawaban`, `koreksi`, `createdAt`, `updatedAt`) VALUES
('', '17d08b56-2669-47c9-847c-b6b5f0ec38bf', '001', 'a', 1, '2022-12-03 22:46:06', '2022-12-03 22:46:06'),
('492u2', '01827', '002', 'c', 1, '2022-12-12 03:18:27', '2022-12-12 03:18:27'),
('sdwj9920-ghwu88-82900', '17d08b56-2669-47c9-847c-b6b5f0ec38bf', '001', 'c', 1, '2022-12-03 22:48:37', '2022-12-03 22:48:37');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id` varchar(100) NOT NULL,
  `soal` text NOT NULL,
  `pilihan_a` varchar(255) NOT NULL,
  `pilihan_b` varchar(255) NOT NULL,
  `pilihan_c` varchar(255) NOT NULL,
  `pilihan_d` varchar(255) NOT NULL,
  `pilihan_e` varchar(255) NOT NULL,
  `kunci` char(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id`, `soal`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `pilihan_e`, `kunci`, `createdAt`, `updatedAt`) VALUES
('17d08b56-2669-47c9-847c-b6b5f0ec38bf', '10 + 5 = berapa hayoooo', '5', '10', '15', '20', '25', 'c', '2022-12-03 07:26:26', '2022-12-03 07:34:19'),
('918f1ed0-42a7-4781-8448-5b7194c8f07e', '100 / 0 = ', '~', '0', '10', '100', '1000', 'a', '2022-12-03 07:36:49', '2022-12-03 07:36:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
