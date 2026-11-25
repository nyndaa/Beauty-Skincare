-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2026 at 10:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beautyskincare`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_code` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_code`, `qty`) VALUES
(18, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `code` int(11) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`code`, `category`) VALUES
(1, 'Facial Wash'),
(2, 'Mask'),
(3, 'Moisturizer'),
(4, 'Serum'),
(5, 'Toner'),
(6, 'Micellar Water');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_address` text NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL,
  `total` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `customer_phone`, `customer_address`, `order_date`, `status`, `total`) VALUES
(1, 'dewi rahmawati', '222222222', 'utdi', '2026-06-14 20:14:24', 'Diproses', 0),
(2, 'dewi rahmawati', '245679800', 'utdi', '2026-06-14 23:04:47', 'Selesai', 0),
(3, 'Raharjian Sustanadia Wijayanti', '087767360291', 'Yogyakarta', '2026-07-05 10:55:18', 'Dibatalkan', 0),
(4, 'ANDI', '873898372189', 'MEDAN', '2026-07-05 10:58:28', 'Selesai', 0),
(5, 'SINDY', '83478294', 'SUMATRA', '2026-07-05 10:59:57', 'Diproses', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_code` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_code`, `qty`) VALUES
(1, 1, 1, 1),
(2, 2, 3, 2),
(3, 3, 1, 1),
(4, 3, 16, 1),
(5, 3, 2, 1),
(6, 3, 15, 1),
(7, 4, 16, 1),
(8, 4, 8, 1),
(9, 4, 2, 1),
(10, 5, 17, 1),
(11, 5, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `code` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `category_code` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT 4.8
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`code`, `name`, `description`, `price`, `stock`, `category_code`, `image`, `rating`) VALUES
(1, 'Glad2Glow Facial Wash Matcha Salicylic Acid Acne Cleanser 80g (Pump)', 'Facial wash untuk membersihkan wajah dan membantu mengatasi jerawat', 45000, 49, 1, 'green/cleanser.jpeg', 4.8),
(2, 'Glad2Glow Centella Salicylic Acid Acne Gel Cleanser Oil Control', 'Facial wash dengan centella dan salicylic acid untuk kontrol minyak', 48000, 43, 1, 'green/facial.jpeg', 4.8),
(3, 'Glad2Glow Mugwort Salicylic Acid Acne Clay Stick 25g', 'Masker clay stick untuk membantu merawat kulit berjerawat', 55000, 35, 2, 'green/mask.jpeg', 4.8),
(4, 'Glad2Glow Acne Moisturizer 30g', 'Moisturizer ringan untuk kulit berjerawat', 62000, 40, 3, 'green/mois.jpeg', 4.8),
(5, 'Glad2Glow Centella 2% Salicylic Acid Power Clear Acne Serum', 'Serum dengan salicylic acid untuk membantu mengatasi jerawat', 75000, 30, 4, 'green/serum.jpeg', 4.9),
(6, 'Glad2Glow Centella Ceramide Soothing Toner', 'Toner dengan centella dan ceramide untuk menenangkan kulit', 58000, 50, 5, 'green/toner.jpeg', 4.8),
(7, 'Glad2Glow Milk Amino Acids Gentle Cleanser 80g (Pump)', 'Facial wash lembut dengan amino acids', 47000, 45, 1, 'pink/facial.jpeg', 4.8),
(8, 'Glad2Glow Pomegranate Niacinamide Brightening Clay Mask Stick', 'Clay mask dengan niacinamide untuk mencerahkan kulit', 59000, 29, 2, 'pink/mask.jpeg', 4.8),
(9, 'Glad2Glow Cherry Blossom Betaine Micellar Water', 'Micellar water untuk membersihkan makeup dan kotoran', 52000, 60, 6, 'pink/micelar.jpeg', 4.8),
(10, 'Glad2Glow Pomegranate 5% Niacinamide Brightening Moisturizer', 'Moisturizer dengan niacinamide untuk membantu mencerahkan kulit', 68000, 35, 3, 'pink/mois.jpeg', 4.9),
(11, 'Glad2Glow Pomegranate 10% Niacinamide Power Bright Serum', 'Serum brightening dengan kandungan niacinamide 10%', 79000, 30, 4, 'pink/serum.jpeg', 4.9),
(12, 'Glad2Glow Pomegranate Niacinamide Brightening Toner', 'Toner brightening dengan niacinamide', 60000, 40, 5, 'pink/toner.jpeg', 4.8),
(13, 'Glad2Glow Facial Wash Blueberry Ceramide Low pH Gel Cleanser', 'Facial wash low pH dengan blueberry dan ceramide', 50000, 50, 1, 'purple/facial.jpeg', 4.8),
(14, 'Glad2Glow Pore Clearing Micellar Water', 'Micellar water untuk membantu membersihkan pori-pori', 53000, 54, 6, 'purple/micellar.jpeg', 4.8),
(15, 'Glad2Glow Blueberry 5% Ceramide Moisturizer', 'Moisturizer dengan ceramide untuk menjaga skin barrier', 70000, 34, 3, 'purple/mois.jpeg', 4.9),
(16, 'Glad2Glow Blackberry AHA BHA PHA Daily Exfoliating Serum', 'Serum eksfoliasi harian dengan AHA BHA PHA', 82000, 23, 4, 'purple/serum.jpeg', 4.9),
(17, 'Glad2Glow Blackberry AHA BHA PHA Daily Exfoliating Toner', 'Toner eksfoliasi harian dengan AHA BHA PHA', 65000, 34, 5, 'purple/toner.jpeg', 4.8);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `product_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `product_code`) VALUES
(1, 5),
(2, 3),
(3, 15),
(4, 16),
(5, 16),
(6, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
