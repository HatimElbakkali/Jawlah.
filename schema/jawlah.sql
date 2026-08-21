-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2026 at 04:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jawlah`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `activity_id` char(36) DEFAULT NULL,
  `pack_id` char(36) DEFAULT NULL,
  `full_name` varchar(150) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `reservation_date` date NOT NULL,
  `adults` int(11) NOT NULL DEFAULT 0,
  `children` int(11) NOT NULL DEFAULT 0,
  `infants` int(11) NOT NULL DEFAULT 0,
  `duration` varchar(50) DEFAULT NULL,
  `selected_time` varchar(20) NOT NULL,
  `price_per_person` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `status` enum('confirmed','pending','cancelled','completed') NOT NULL DEFAULT 'confirmed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `activity_id`, `pack_id`, `full_name`, `phone_number`, `email`, `reservation_date`, `adults`, `children`, `infants`, `duration`, `selected_time`, `price_per_person`, `total_price`, `created_at`, `status`) VALUES
(2, 'b063825c-9387-11f1-991b-4c77cb9a64c8', NULL, 'Hatim Elbakkali', '0678795098', 'hatimelbakkali4@gmail.com', '2026-08-13', 2, 2, 0, '30 min', '04:30 PM', 20.00, 60.00, '2026-08-13 15:49:10', 'confirmed'),
(3, 'b063825c-9387-11f1-991b-4c77cb9a64c8', NULL, 'Hatim Elbakkali', '0678795098', 'hatim4@gmail.com', '2026-08-17', 2, 2, 0, '60 min', '04:30 PM', 40.00, 120.00, '2026-08-16 16:30:56', 'confirmed'),
(4, 'b063825c-9387-11f1-991b-4c77cb9a64c8', NULL, 'Hatim Elbakkali', '0678795098', 'hatimelbakkali4@gmail.com', '2026-08-20', 2, 2, 0, '30 min', '05:00 PM', 20.00, 60.00, '2026-08-20 14:27:04', 'confirmed'),
(5, 'b063825c-9387-11f1-991b-4c77cb9a64c8', NULL, 'Hatim Elbakkali', '0678795098', 'hatimelbakkali4@gmail.com', '2026-08-20', 2, 2, 0, '30 min', '05:00 PM', 20.00, 60.00, '2026-08-20 14:36:18', 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('unread','read','replied') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `subject`, `message`, `status`, `created_at`) VALUES
(1, 'hatim', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'asgfsghaDFHJFDSDFGHASGHFSDAGFDFJDADFJSAFSAD', 'unread', '2026-08-09 23:19:37'),
(2, 'hatim', 'hatimelbakkali840@gmail.com', '79879877897', 'hjhjgghfgh', 'ghgfhgfghfgh', 'unread', '2026-08-09 23:49:40'),
(3, 'hatim', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'fgfhfgfgfgfgf', 'unread', '2026-08-09 23:51:47'),
(4, 'mohamed', 'hatimelbakkali840@gmail.com', '0679785098', 'adventure', 'hasghghsghafgfasfhsfas', 'unread', '2026-08-09 23:54:53'),
(5, 'hatim', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'ghccfgagfaX', 'unread', '2026-08-09 23:56:54'),
(6, 'hatim', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'gsghsgffsgsffgsgfs', 'unread', '2026-08-09 23:59:16'),
(7, 'asasd', 'hatimelbakkali840@gmail.com', '989898', 'adventure', 'hghhghhgh', 'unread', '2026-08-10 00:00:16'),
(8, 'hatim', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'sgfgssgfsgfs', 'unread', '2026-08-10 00:02:10'),
(9, 'hatim', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'sgfgssgfsgfs', 'unread', '2026-08-10 00:02:29'),
(10, 'hatim', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'sgfgssgfsgfs', 'unread', '2026-08-10 00:02:40'),
(11, 'mohamed', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'nbvghghfghfghf', 'unread', '2026-08-10 00:04:09'),
(12, 'mohamed', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'nbvghghfghfghf', 'unread', '2026-08-10 00:05:39'),
(13, 'hatim', 'hatimelbakkali840@gmail.com', '0678795098', 'adventure', 'gvghfghfgh', 'unread', '2026-08-10 00:08:56'),
(14, 'hatim', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'edadsdsdf', 'unread', '2026-08-10 00:10:19'),
(15, 'hatim', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'hnhqwsgvcfhadscgvbasb', 'unread', '2026-08-10 00:11:27'),
(16, 'mohamed', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'vgasfghswfghghasghas', 'unread', '2026-08-13 13:21:38'),
(17, 'hatim', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'hyhghhghghghghg', 'read', '2026-08-13 13:32:42'),
(18, 'hatim', 'hatimelbakkali4@gmail.com', '067988676767', 'adventure', 'gfaGHFHAgfASGFhahgADFHGDA', 'unread', '2026-08-20 13:28:27'),
(19, 'hatim', 'hatimelbakkali4@gmail.com', '067988676767', 'adventure', 'gfaGHFHAgfASGFhahgADFHGDA', 'unread', '2026-08-20 13:28:35'),
(20, 'hatim', 'hatimelbakkali4@gmail.com', '067988676767', 'adventure', 'dasDSadsaDS', 'unread', '2026-08-20 13:31:36'),
(21, 'hatim', 'hatimelbakkali840@gmail.com', '067988676767', 'adventure', 'gfsghfghsFSDhga', 'unread', '2026-08-20 13:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `desert_activities_pack`
--

CREATE TABLE `desert_activities_pack` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `age_restriction` varchar(100) NOT NULL,
  `accompanied` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `capacity` int(11) NOT NULL,
  `status` enum('available','not_available') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `desert_activities_pack`
--

INSERT INTO `desert_activities_pack` (`id`, `title`, `image`, `description`, `location`, `age_restriction`, `accompanied`, `price`, `created_at`, `capacity`, `status`) VALUES
('b5590e10-939f-11f1-991b-4c77cb9a64c8', 'The Desert Trilogy', '/public/assets/Images/pack.webp', 'Enjoy a complete desert experience that blends relaxation and adventure in one journey. Start with a peaceful Camel Riding tour across the golden dunes, guided by an expert who introduces you to the beauty of the desert. Then enjoy an exciting Quad Bike ride, where you can drive yourself or ride with a professional driver for a safe and thrilling experience. Finish your adventure with Sandboarding, sliding down the dunes and enjoying pure fun in the heart of the desert.', 'Merzouga, Morocco', 'Suitable for adults only', 'Self-drive or professional driver, accompanied by a guide', 60.00, '2026-08-09 04:09:17', 10, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `desert_activity`
--

CREATE TABLE `desert_activity` (
  `id` char(36) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon_title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `age_restriction` varchar(50) DEFAULT NULL,
  `accompanied` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `capacity` int(11) DEFAULT NULL,
  `status` enum('available','not_available') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `desert_activity`
--

INSERT INTO `desert_activity` (`id`, `image`, `title`, `icon_title`, `description`, `location`, `age_restriction`, `accompanied`, `price`, `created_at`, `capacity`, `status`) VALUES
('b063825c-9387-11f1-991b-4c77cb9a64c8', '/public/assets/Images/Camel-Riding.webp', 'Camel Riding', '/public/assets/Icons/camel.png', 'Enjoy a peaceful ride through the golden dunes and experience authentic desert life.', 'Merzouga, Morocco', 'all ages', 'Accompanied by a guide', 20.00, '2026-08-09 01:17:21', 30, 'available'),
('b0638ff2-9387-11f1-991b-4c77cb9a64c8', '/public/assets/Images/Quad bike.webp', 'Quad Bike', '/public/assets/Icons/Quad bike.png', 'Feel the adrenaline as you explore the desert on powerful quad bikes.', 'Merzouga, Morocco', 'adults only', 'Self-drive or professional driver', 25.00, '2026-08-09 01:17:21', 25, 'available'),
('b0639097-9387-11f1-991b-4c77cb9a64c8', '/public/assets/Images/Sandbording.webp', 'Sandboarding', '/public/assets/Icons/Sandbording.png', 'Slide down the dunes and enjoy a fun, thrilling desert activity.', 'Merzouga, Morocco', 'adults only', 'Accompanied by a guide', 10.00, '2026-08-09 01:17:21', 50, 'available'),
('b06390d2-9387-11f1-991b-4c77cb9a64c8', '/public/assets/Images/car 4.webp', 'Car 4x4 Desert', '/public/assets/Icons/Car 4 4 desert.png', 'Feel the adrenaline as you conquer the desert dunes in a powerful 4x4 vehicle.', 'Merzouga, Morocco', 'all ages', 'Self-drive or professional driver', 40.00, '2026-08-09 01:17:21', 10, 'available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_id` (`activity_id`),
  ADD KEY `bookings_ibfk_1` (`pack_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `desert_activities_pack`
--
ALTER TABLE `desert_activities_pack`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `desert_activity`
--
ALTER TABLE `desert_activity`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`pack_id`) REFERENCES `desert_activities_pack` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
