-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2023 at 03:56 PM
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
-- Database: `rentcars`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(20) NOT NULL,
  `content` varchar(100) NOT NULL,
  `Doors` int(11) NOT NULL,
  `Luggage` int(11) NOT NULL,
  `Passengers` int(11) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(70) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `RegDate`, `title`, `content`, `Doors`, `Luggage`, `Passengers`, `price`, `image`, `active`, `cat_id`) VALUES
(1, '2023-10-28 19:17:25', 'kia pride', 'Engine capacity, cm³ 1,138', 4, 50, 4, 200, '68a0988466e283ea4ee9aee71ecf82e2.jpeg', 1, 4),
(2, '2023-10-28 19:19:05', 'hyundai HD', 'Engine capacity, cm³ 1,138', 4, 80, 5, 500, 'f2fb8f36098be47e31fe80ce02da8082.jpeg', 1, 3),
(3, '2023-10-28 19:22:04', 'Kia Cerato', 'the powerful features of Kia Cerato - available in hatch & sedan with impressive style & advanced te', 4, 50, 4, 500, 'b3790c9b87c0ec6c05a5e5c77972b3e0.jpeg', 1, 4),
(4, '2023-10-28 19:25:01', 'kia Carens', 'Presenting the Kia Carens. Hi-tech by design and inspiring by ... Studded with 66', 4, 50, 7, 600, '32924b3841a03dc63b90d141d6e9f8db.jpeg', 1, 4),
(6, '2023-10-28 19:44:47', 'reno fluence', '\r\n\r\nWikipedia\r\nhttps://en.wikipedia.org › wiki › Rena...\r\nThe Renault Fluence is a compact sedan pro', 4, 50, 5, 700, '72d440de316fb6a53e9f31593607e029.jpeg', 1, 2),
(8, '2023-11-03 08:03:35', 'FAIT TIGGO', 'oijhuhggcgcgvgvg', 4, 5, 5, 500, 'f22cb07c2f63e9cebd34ff35251bcb8a.jpeg', 1, 6),
(15, '2023-11-03 12:27:29', 'Kia Sportage', ' infotainment system display size. The Sportage LX trim has 5-inch touch screen equipped with a six ', 4, 5, 7, 7000, '94541ed07d4b18fe2a2837dfa573f182.jpeg', 0, 4),
(17, '2023-11-03 12:32:49', 'Hyundai Elantra', 'he Hyundai Elantra, also known as the Hyundai Avante, is a compact car produced by the South Korean ', 4, 5, 5, 500, '3d21725870c2e7000c75e3cacf2e2cf3.jpeg', 0, 3),
(18, '2023-11-03 12:37:12', 'Hyundai Tucson', ' produced by the South Korean manufacturer Hyundai since 2004. In the marque\'s lineup', 4, 5, 4, 900, 'b1ebe79c0da4f451f2bde222b0a7fdb4.jpeg', 0, 3),
(20, '2023-11-03 12:40:20', 'Hyundai Sonata', 'mid-size car produced by the South Korean manufacturer Hyundai since 1985. The first generation Sona', 4, 5, 4, 300, 'c1b39625209e254815aaef892c45c387.jpeg', 1, 3),
(21, '2023-11-03 12:43:12', 'Hyundai Accent', 'he Hyundai Accent, or Hyundai Verna is a subcompact car produced by Hyundai. In Australia, the first', 4, 5, 4, 200, '77b1c26f1e7ac1efaaa1a991f65a14e5.jpeg', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(1, 'BMW'),
(6, 'FAIT'),
(3, 'Hyundai'),
(4, 'KIA'),
(2, 'Renalt');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `fullname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '0 inactive & 1 active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `RegDate`, `fullname`, `username`, `password`, `email`, `active`) VALUES
(1, '2023-10-25 22:43:44', 'ayman rafat', 'ayman1986', '$2y$10$oB6P3a7xCB/uTLWurltO9unK0LcAyVQQ8ERA6Gdy8j3tSgyArZvNS', 'ayman@gmail.com', 1),
(2, '2023-10-26 22:33:48', 'noha adel', 'noha2000', '$2y$10$gf0l/PK9DCDFSbKTb4LsfOTSXZTx/Kkx9AwHO2518EXBi6Mnc6L/m', 'noha@gmail.com', 1),
(3, '2023-10-26 23:32:03', 'seif ayman', 'seif2017', '$2y$10$Jof5cXUhHYCXF9pkgh5sSuAfKkwr3zOstkdpkAXDsAjoudaF2kpFK', 'seif@gmail.com', 1),
(4, '2023-10-26 23:44:53', 'mohamed ayman', 'mohamed2017', '$2y$10$xpPad4hs8mAaPmr6j2vEvuf1yf3zd6KWjdahCNwFhJB/aJrglZ8rC', 'mohamed@gamil.com', 0),
(5, '2023-10-27 13:09:49', 'reem ayman', 'reem2014', '$2y$10$akrSQGfP7hlraR6L/ZOTCuScEIvdDUIJpzEIX2eglLlt6Ih81Ix2m', 'reem@gmail.com', 1),
(6, '2023-10-27 13:23:51', 'ahmed mostafa', 'ahmed2013', '$2y$10$.m5ZQFr.Y0PItUgGH4S2T.HTaeapZYDG9fffX0IKE7BbXbSxUFyTu', 'ahmed@gmail.com', 0),
(7, '2023-10-31 09:18:33', 'yousseif mohamed', 'yousseif2023', '$2y$10$DoEN/KOE.c.Yj3g2SYHSi.NWYuIrNjWWmomnE1m4YkRJpACBsXPau', 'yosseif@gmail.com', 0),
(8, '2023-11-04 14:06:06', 'rania rafaat', 'rania1988', '$2y$10$3OAQd4B9xDLRCj02MLNRlO5UTyJ7ZM1UzqAi6tlMlvy/xPTsBRQaC', 'rania@gmail.com', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `title_2` (`title`,`cat_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`category`),
  ADD KEY `category_2` (`category`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `username_2` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
