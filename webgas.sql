-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2025 at 02:47 AM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webgas`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `order_created_at` datetime DEFAULT NULL,
  `product_size` varchar(10) DEFAULT NULL,
  `order_updated_at` datetime DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `phone_number`, `address`, `order_created_at`, `product_size`, `order_updated_at`, `quantity`) VALUES
(1, 14, 'U', '1234567890', '1234 ddd', '2024-09-13 10:50:10', '5', NULL, 1),
(5, 8, 'Finn', '', '', '2024-09-19 19:37:29', '3', NULL, 1),
(6, 8, 'Finn', '', '', '2024-11-01 11:04:44', '4', NULL, 1),
(10, 8, 'Finn', '', '', '2025-01-21 23:03:13', '4', NULL, 1),
(11, 8, 'Finn', '', '', '2025-01-24 09:49:52', '11.5', NULL, 1),
(12, 16, 'Nelliel', '1111111111', '55/5', '2025-02-10 11:54:45', '4', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_size` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT 'customer',
  `phone_number` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `display_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `phone_number`, `address`, `display_name`) VALUES
(1, 'alice', '$2a$10$eS9VwO.G9nUyIX7REa/MdOjXhN5L3sPTp4D/RhS7v8UvTqD1l2dIu', 'customer', '', '', 'John Doe'),
(2, 'bob', '$2a$10$eS9VwO.G9nUyIX7REa/MdOjXhN5L3sPTp4D/RhS7v8UvTqD1l2dIu', 'staff', '', '', NULL),
(3, 'charlie', '$2a$10$eS9VwO.G9nUyIX7REa/MdOjXhN5L3sPTp4D/RhS7v8UvTqD1l2dIu', 'administrator', '', '', NULL),
(8, 'Finn', '$2a$10$9ObtR7/yLcU0Stj/rg92x.dbvHd0f5PtSE0pVCk3SuNJ6eHH5VUbS', 'customer', '', '', NULL),
(14, 'U', '$2a$10$0BbGlbR.fHDhDYak/GX3tehUMz0vY3qsgkaHClcA6JjnYoYYIKDo6', 'customer', '1234567890', '1234 ddd', 'UU'),
(16, 'Nelliel', '$2a$10$X7iYdML6undJGlo3V2OYq.ic7A.qav.7cJUX3N1DcUcbsoAvyu1KS', 'admin', '1111111111', '55/5', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
