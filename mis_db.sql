-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2025 at 12:37 PM
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
-- Database: `mis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_Fname` varchar(50) NOT NULL,
  `admin_Mname` varchar(50) NOT NULL,
  `admin_Lname` varchar(50) NOT NULL,
  `admin_contact` varchar(50) NOT NULL,
  `display_picture` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`id`, `admin_id`, `admin_Fname`, `admin_Mname`, `admin_Lname`, `admin_contact`, `display_picture`) VALUES
(42, 5, 'Eric', 'Love', 'Febe', '09461463222', '');

-- --------------------------------------------------------

--
-- Table structure for table `declined_request`
--

CREATE TABLE `declined_request` (
  `request_id` int(11) NOT NULL,
  `decline_date` date NOT NULL,
  `decline_reason` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `declined_user`
--

CREATE TABLE `declined_user` (
  `temporary_id` int(11) NOT NULL,
  `date_remove` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `decline_reason` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edit_requests`
--

CREATE TABLE `edit_requests` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `requested_by` int(11) NOT NULL,
  `field_to_edit` varchar(50) NOT NULL,
  `new_value` text NOT NULL,
  `request_date` datetime NOT NULL,
  `status` enum('pending','approved','declined') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_info`
--

CREATE TABLE `employee_info` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_fname` varchar(50) NOT NULL,
  `employee_mname` varchar(50) NOT NULL,
  `employee_lname` varchar(50) NOT NULL,
  `employee_contact` varchar(50) NOT NULL,
  `display_picture` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_info`
--

INSERT INTO `employee_info` (`id`, `employee_id`, `employee_fname`, `employee_mname`, `employee_lname`, `employee_contact`, `display_picture`) VALUES
(38, 5, 'Eric', 'Love', 'Febe', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `hr_info`
--

CREATE TABLE `hr_info` (
  `id` int(11) NOT NULL,
  `hr_id` int(11) NOT NULL,
  `hr_fname` varchar(50) NOT NULL,
  `hr_mname` varchar(50) NOT NULL,
  `hr_lname` varchar(50) NOT NULL,
  `hr_contact` varchar(20) NOT NULL,
  `display_picture` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_info`
--

CREATE TABLE `request_info` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `request_status` varchar(15) NOT NULL,
  `request_description` varchar(50) NOT NULL,
  `request_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tech_info`
--

CREATE TABLE `tech_info` (
  `id` int(11) NOT NULL,
  `tech_id` int(11) NOT NULL,
  `tech_fname` varchar(50) NOT NULL,
  `tech_mname` varchar(50) NOT NULL,
  `tech_lname` varchar(50) NOT NULL,
  `tech_contact` varchar(50) NOT NULL,
  `display_picture` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tech_request`
--

CREATE TABLE `tech_request` (
  `request_id` int(11) NOT NULL,
  `tech_id` int(11) NOT NULL,
  `tech_status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temporary_login`
--

CREATE TABLE `temporary_login` (
  `temporary_id` int(16) NOT NULL,
  `temporary_username` varchar(50) NOT NULL,
  `temporary_password` varchar(500) NOT NULL,
  `temporary_fname` varchar(50) NOT NULL,
  `temporary_mname` varchar(50) NOT NULL,
  `temporary_lname` varchar(50) NOT NULL,
  `temporary_email` varchar(50) NOT NULL,
  `temporary_position` varchar(50) NOT NULL,
  `temporary_department` varchar(50) NOT NULL,
  `temporary_contact` varchar(11) NOT NULL,
  `temporary_session_id` varchar(200) NOT NULL,
  `temporary_status` int(1) NOT NULL,
  `pending_date_request` date NOT NULL,
  `pending_time_request` time NOT NULL,
  `approval_date` date NOT NULL,
  `approval_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_reg` varchar(20) NOT NULL,
  `time_reg` time NOT NULL,
  `user_session_id` varchar(200) NOT NULL,
  `position` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `department` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `user_id`, `username`, `password`, `email`, `date_reg`, `time_reg`, `user_session_id`, `position`, `status`, `department`) VALUES
(1, '', 'Hr', '$2y$10$iTjaUNnEJJJfxHmY5QqDqOkOLWMxHfO//RUzCsFHOJDkwR9khp5kq', 'Hrdefault@yahoo.com', '', '00:00:00', '', 'hr', 0, ''),
(6, '', 'Admin', '$2y$10$PukYQnEGSrSi8XpwR/38SuUVuvx64dCU2LnPS7T9Fp70zBei6hbLu', 'Admindefault@yahoo.com', '', '00:00:00', '5ff919ef2426724fcd6c0e66b9e920548414ee85608c3da799e5d68d1d1f5451', 'admin', 1, ''),
(17, '', 'Tech', '$2y$10$GArIZC41Pn.kx93YyPedyuW0mdDMeFfCTe4dJPFUv6R0wfvz6dEb2', 'Techdefault@gmail.com', '', '00:00:00', '758a357e63219e2b12092cada3003ca7218816459055f155c248d2580286252d', 'tech', 1, 'BSCS'),
(38, '', 'EricEmployee', '$2y$10$z/DUGVmXyoAenREueQFMQ.QL63G8Qf7P4BK7jXJ.5TSb2Wym5wmEa', 'loversinnextlife@gmail.com', '', '00:00:00', '151051948e2b7e0c04e3528dd77c8e94b033f1e862cc2e6f385b4ae09a2fa2eb', 'employee', 1, ''),
(42, '', 'EricAdmin', '$2y$10$rHeh4Ztqib3/ag9s0frZ7Oj7eaNK9.QW5qO1GYnnXNvngbWB.V8yu', 'loversinnextlife2@gmail.com', '2025-04-27', '12:34:43', '', 'admin', 0, 'BSCS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `admin_info_ibfk_1` (`id`);

--
-- Indexes for table `declined_user`
--
ALTER TABLE `declined_user`
  ADD KEY `temporary_id` (`temporary_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `edit_requests`
--
ALTER TABLE `edit_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee_info`
--
ALTER TABLE `employee_info`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `hr_info`
--
ALTER TABLE `hr_info`
  ADD PRIMARY KEY (`hr_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `request_info`
--
ALTER TABLE `request_info`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tech_info`
--
ALTER TABLE `tech_info`
  ADD PRIMARY KEY (`tech_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tech_request`
--
ALTER TABLE `tech_request`
  ADD KEY `request_id` (`request_id`),
  ADD KEY `tech_id` (`tech_id`);

--
-- Indexes for table `temporary_login`
--
ALTER TABLE `temporary_login`
  ADD PRIMARY KEY (`temporary_id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `edit_requests`
--
ALTER TABLE `edit_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_info`
--
ALTER TABLE `employee_info`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hr_info`
--
ALTER TABLE `hr_info`
  MODIFY `hr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `request_info`
--
ALTER TABLE `request_info`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tech_info`
--
ALTER TABLE `tech_info`
  MODIFY `tech_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `temporary_login`
--
ALTER TABLE `temporary_login`
  MODIFY `temporary_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD CONSTRAINT `admin_info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `declined_user`
--
ALTER TABLE `declined_user`
  ADD CONSTRAINT `declined_user_ibfk_1` FOREIGN KEY (`temporary_id`) REFERENCES `temporary_login` (`temporary_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `declined_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `edit_requests`
--
ALTER TABLE `edit_requests`
  ADD CONSTRAINT `edit_request_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_info` (`employee_id`) ON UPDATE CASCADE;

--
-- Constraints for table `employee_info`
--
ALTER TABLE `employee_info`
  ADD CONSTRAINT `employee_info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_login` (`id`);

--
-- Constraints for table `hr_info`
--
ALTER TABLE `hr_info`
  ADD CONSTRAINT `hr_info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_login` (`id`);

--
-- Constraints for table `request_info`
--
ALTER TABLE `request_info`
  ADD CONSTRAINT `request_info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_login` (`id`);

--
-- Constraints for table `tech_info`
--
ALTER TABLE `tech_info`
  ADD CONSTRAINT `tech_info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_login` (`id`);

--
-- Constraints for table `tech_request`
--
ALTER TABLE `tech_request`
  ADD CONSTRAINT `tech_request_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request_info` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tech_request_ibfk_2` FOREIGN KEY (`tech_id`) REFERENCES `tech_info` (`tech_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
