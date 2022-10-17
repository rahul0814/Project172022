-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2022 at 12:57 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ads`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `published` datetime DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT 0,
  `shape` varchar(255) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `title`, `description`, `published`, `image`, `flag`, `shape`, `height`, `width`) VALUES
(1, 'Video no 1', 'Video no 1', '2022-09-14 17:33:06', '1.mp4', 0, '', 0, 0),
(2, 'Video no2', 'Video no 2', '2022-09-14 17:33:46', '2.mp4', 0, '', 0, 0),
(3, 'video no3', 'Video no 3', '2022-09-14 17:34:11', '3.mp4', 0, '', 0, 0),
(4, 'Video no4', 'Video no 4', '2022-09-14 17:35:43', '4.mp4', 0, '', 0, 0),
(5, 'Video no5', 'Video no5', '2022-09-14 17:36:12', '5.mp4', 0, '', 0, 0),
(6, 'Video no6', 'Video no6', '2022-09-14 17:36:35', '6.mp4', 0, '', 0, 0),
(7, 'Video no7', 'Video no7', '2022-09-14 17:37:06', '7.mp4', 0, '', 0, 0),
(8, 'Video no8', 'Video no8', '2022-09-14 17:37:27', '8.mp4', 0, '', 0, 0),
(9, 'Video no9', 'Video no9', '2022-09-14 17:37:46', '9.mp4', 0, '', 0, 0),
(10, 'Video no10', 'Video no10', '2022-09-14 17:38:09', '10.mp4', 0, '', 0, 0),
(19, NULL, NULL, '2022-09-23 17:45:19', '1663935319740.png', 0, NULL, NULL, NULL),
(20, NULL, NULL, '2022-09-23 17:46:38', '1663935398280.png', 0, NULL, NULL, NULL),
(21, NULL, NULL, '2022-09-23 17:47:14', '1663935434581.png', 0, NULL, NULL, NULL),
(22, NULL, NULL, '2022-09-23 17:49:30', '1663935570910.png', 0, NULL, NULL, NULL),
(23, NULL, NULL, '2022-09-23 17:51:56', '1663935716994.png', 0, NULL, NULL, NULL),
(24, NULL, NULL, '2022-09-23 17:53:36', '1663935816698.mp4', 0, NULL, NULL, NULL),
(25, NULL, NULL, '2022-09-23 18:10:17', '1663936817030.png', 0, NULL, NULL, NULL),
(26, NULL, NULL, '2022-09-23 18:10:20', '1663936820197.png', 0, NULL, NULL, NULL),
(27, NULL, NULL, '2022-09-23 18:19:16', '1663937356276.png', 0, NULL, NULL, NULL),
(28, NULL, NULL, '2022-09-23 18:19:18', '1663937358322.png', 0, NULL, NULL, NULL),
(29, NULL, NULL, '2022-10-06 11:37:59', '1665036479785.jpeg', 0, NULL, NULL, NULL),
(30, NULL, NULL, '2022-10-06 13:56:26', '1665044786281.png', 0, NULL, NULL, NULL),
(31, NULL, NULL, '2022-10-06 14:53:13', '1665048193172.png', 0, NULL, NULL, NULL),
(32, NULL, NULL, '2022-10-06 15:01:19', '1665048679981.png', 0, NULL, NULL, NULL),
(33, NULL, NULL, '2022-10-06 16:15:25', '1665053125209.png', 0, NULL, NULL, NULL),
(34, NULL, NULL, '2022-10-06 16:17:29', '1665053249115.mp4', 0, NULL, NULL, NULL),
(35, NULL, NULL, '2022-10-06 16:22:46', '1665053566455.png', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `flag`, `created_at`, `updated_at`, `email`, `username`, `password`, `dob`) VALUES
(1, 'james', 0, '2022-10-06 15:40:52', '2022-10-06 15:40:52', 'james@gmail.com', 'james', 'james123', '1996-09-23'),
(2, 'smith', 0, '2022-10-06 15:49:49', '2022-10-06 15:49:49', 'smith@gmail.com', 'smith', 'smith123', '1997-08-08'),
(3, 'martin', 0, '2022-10-06 15:51:05', '2022-10-06 15:51:05', 'martin@gmail.com', 'martin', 'martin123', '1997-07-07'),
(4, 'Elon', 0, '2022-10-06 15:52:22', '2022-10-06 15:52:22', 'elon@gmail.com', 'elon', 'elon123', ''),
(5, 'William', 0, '2022-10-06 16:00:54', '2022-10-06 16:00:54', 'william', 'william', 'william123', '1994-05-06'),
(6, 'oliver', 0, '2022-10-06 16:02:09', '2022-10-06 16:02:09', 'oliver@gmail.com', 'oliver', 'oliver123', '1996-08-21');

-- --------------------------------------------------------

--
-- Table structure for table `client_based_videos`
--

CREATE TABLE `client_based_videos` (
  `id` int(11) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `startDate` date NOT NULL DEFAULT current_timestamp(),
  `endDate` date NOT NULL DEFAULT current_timestamp(),
  `click` bigint(20) NOT NULL,
  `Imp` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `business` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_based_videos`
--

INSERT INTO `client_based_videos` (`id`, `client_id`, `video_id`, `product_id`, `startDate`, `endDate`, `click`, `Imp`, `name`, `url`, `business`) VALUES
(1, 4, '1665053125209.png', 2, '2022-10-13', '2022-10-20', 0, 0, 'name', 'huirehg', 0),
(2, 2, '1665053249115.mp4', 2, '2022-10-06', '2022-10-21', 0, 0, 'name', 'sdfasd', 0),
(3, 2, '1665053566454.png', 1, '2022-10-06', '2022-10-14', 0, 0, 'name', 'sdfgsd', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `flag` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `flag`, `image`) VALUES
(1, 'Bridge', 'Bridge', 0, 'shibnobi-bridge.png'),
(2, 'Chain', 'Chain', 0, 'shibnobi-chain.png'),
(3, 'Learn', 'Learn', 0, 'shibnobi-learn.png'),
(4, 'Nft', 'Nft', 0, 'shibnobi-nft.png'),
(5, 'Play', 'Play', 0, 'shibnobi-play.png'),
(6, 'Store', 'Store', 0, 'shibnobi-store.png'),
(7, 'Studio', 'Studio', 0, 'shibnobi-studio.png'),
(8, 'Swap', 'Swap', 0, 'shibnobi-swap.png'),
(9, 'Verse', 'Verse', 0, 'shibnobi-verse.png'),
(10, 'Wallet', 'Wallet', 0, 'shibnobi-wallet.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_based_videos`
--
ALTER TABLE `client_based_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `client_based_videos`
--
ALTER TABLE `client_based_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
