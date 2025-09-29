-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2025 at 12:46 PM
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
-- Database: `stfs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` bigint(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mobile Phones', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id est enim. Fusce malesuada dapibus lobortis. Maecenas commodo cursus ante, a efficitur lorem ultrices a. Cras tincidunt, leo at consequat viverra, lacus elit tempus diam, sed scelerisque turpis purus eu ex. Sed placerat, sem vel accumsan maximus, nibh massa rhoncus mi, quis lacinia nisl quam eu purus.</p>', 1, '2025-05-01 10:32:44', NULL),
(2, 'Keys', '<p>Nulla at tellus tristique, venenatis mauris a, commodo urna. Integer arcu quam, maximus id nulla vitae, eleifend lacinia tellus. Proin nec consequat risus. Sed et felis justo. Duis quis magna vel felis volutpat consectetur ut et enim. Integer nec auctor felis. Fusce nec mauris luctus, lacinia erat in, porttitor tellus. Nunc quis mauris velit. Sed nec libero vitae leo blandit mattis.</p>', 1, '2025-05-01 10:34:27', NULL),
(3, 'Watches', '<p>Etiam volutpat dictum tempor. Nulla rutrum arcu eu volutpat pharetra. Aliquam non luctus ex. Maecenas nibh ipsum, efficitur in dui at, rhoncus convallis orci. Duis bibendum tempor sapien, non sollicitudin massa porttitor sed.</p>', 1, '2025-05-01 10:35:58', '2025-05-01 10:36:15');

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_list`
--

CREATE TABLE `inquiry_list` (
  `id` bigint(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiry_list`
--

INSERT INTO `inquiry_list` (`id`, `fullname`, `contact`, `email`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'sam walten', '09123546788', 'jdoe@mail.com', 'Vestibulum suscipit felis at magna congue gravida. Quisque interdum eu odio sed vulputate.', 1, '2025-05-01 14:11:19', '2025-05-01 14:25:47');

-- --------------------------------------------------------

--
-- Table structure for table `item_list`
--

CREATE TABLE `item_list` (
  `id` bigint(30) NOT NULL,
  `category_id` bigint(30) NOT NULL,
  `fullname` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `contact` text NOT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_list`
--

INSERT INTO `item_list` (`id`, `category_id`, `fullname`, `title`, `description`, `contact`, `image_path`, `status`, `created_at`, `updated`) VALUES
(1, 1, 'Ritik Kumar', 'Lost iPhone', '<p>Includes smartphones, feature phones, and accessories like chargers, earphones, etc. Report if found or lost within campus.</p>', '9876543210', 'uploads/items/1.jpg', 1, '2025-05-06 10:32:44', NULL),
(2, 2, 'Aman Singh', 'Lost House Keys', '<p>All types of keys including home keys, bike keys, car keys, and locker keys. Mention keychain details if possible.</p>', '8765432109', 'uploads/items/2.jpg', 1, '2025-05-01 10:34:27', NULL),
(3, 3, 'Kavya Sharma', 'Smartwatch Found', '<p>Lost or found wristwatches, smartwatches, or digital watches. Add any specific brand or strap color details.</p>', '9988776655', 'uploads/items/3.jpg', 1, '2025-05-05 10:35:58', '2025-08-01 10:36:15'),
(6, 1, 'Wilson Smith', 'Found Something @ The Mall', 'Donec metus sem, volutpat id mi in, fringilla aliquet odio. Donec eleifend sem et ex maximus tristique. Donec porttitor venenatis aliquet. Aliquam tristique est sed nulla fermentum aliquam eget sed ex', '09123564789', NULL, 2, '2025-05-01 13:34:29', '2025-05-01 14:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Smart Things Finder System '),
(6, 'short_name', 'STFS'),
(11, 'logo', 'uploads/logo.png?v=1754213147'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1682908055'),
(17, 'phone', '638811XXXX'),
(18, 'mobile', '0522-5892365784'),
(19, 'email', 'kr2060398@gmail.com'),
(20, 'address', '127 , Jankipuram Extension ,Lucknow');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='2';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(9, 'Riddhi (bauwa)', '', 'Tiwari', 'Riddhu', '$2y$10$WVRs2wIH1YIypiHXZUrY0eCKlqyVd4ZKD1ZV7Pq1n1Ejs50S.kDcm', 'uploads/avatars/9.png?v=1754212888', NULL, 2, '2023-04-26 15:54:27', '2025-08-03 14:51:28'),
(10, 'Ritik', '', 'kumar', 'Ritik', '$2y$10$CgDB90MBNSgvxMLNNXbpW.qhpRloRI.klPrJ4ogfTIHwtiXM143Ri', 'uploads/avatars/10.png?v=1754212932', NULL, 1, '2025-08-03 14:25:12', '2025-08-03 14:52:12'),
(11, 'Demo', '', '123', 'Visitor123', '$2y$10$5QmZ4VUSvqqJEgmMylAjD./H2ohR9ChIelFRy/aWtkIXvOHrLdZFe', NULL, NULL, 3, '2025-08-03 16:14:17', '2025-08-03 16:14:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiry_list`
--
ALTER TABLE `inquiry_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_list`
--
ALTER TABLE `item_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inquiry_list`
--
ALTER TABLE `inquiry_list`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item_list`
--
ALTER TABLE `item_list`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_list`
--
ALTER TABLE `item_list`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
