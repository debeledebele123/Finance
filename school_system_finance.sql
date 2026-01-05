-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2026 at 10:53 PM
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
-- Database: `school_system_finance`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `description`) VALUES
(1, 'Grade 1', 'Grade 1 students'),
(2, 'Grade 2', 'Grade 2 students'),
(3, 'Grade 3', 'Grade 3 students'),
(4, 'Form 1', 'Form 1 students'),
(5, 'Form 2', 'Form 2 students'),
(6, 'Grade 1', 'Grade 1 students'),
(7, 'Grade 2', 'Grade 2 students'),
(8, 'Grade 3', 'Grade 3 students'),
(9, 'Form 1', 'Form 1 students'),
(10, 'Form 2', 'Form 2 students'),
(11, 'Grade 1', 'Grade 1 students'),
(12, 'Grade 2', 'Grade 2 students'),
(13, 'Grade 3', 'Grade 3 students'),
(14, 'Form 1', 'Form 1 students'),
(15, 'Form 2', 'Form 2 students'),
(16, 'Grade 1', 'Grade 1 students'),
(17, 'Grade 2', 'Grade 2 students'),
(18, 'Grade 3', 'Grade 3 students'),
(19, 'Form 1', 'Form 1 students'),
(20, 'Form 2', 'Form 2 students');

-- --------------------------------------------------------

--
-- Table structure for table `fee_structure`
--

CREATE TABLE `fee_structure` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `term` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `health_records`
--

CREATE TABLE `health_records` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `medical_condition` text DEFAULT NULL,
  `allergies` text DEFAULT NULL,
  `medication` text DEFAULT NULL,
  `special_care` text DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('Cash','MPesa','Econet','Bank') NOT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `status` enum('Confirmed','Pending') DEFAULT 'Confirmed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `student_id`, `amount`, `payment_method`, `reference_no`, `payment_date`, `status`, `created_at`) VALUES
(1, 1, '1000.00', 'Cash', 'CASH001', '2026-01-01', 'Confirmed', '2026-01-05 21:02:15'),
(2, 2, '1000.00', 'MPesa', 'MPESA001', '2026-01-02', 'Pending', '2026-01-05 21:02:15'),
(3, 3, '1000.00', 'Bank', 'BANK001', '2026-01-03', 'Confirmed', '2026-01-05 21:02:15'),
(4, 4, '1000.00', 'Econet', 'ECONET001', '2026-01-04', 'Confirmed', '2026-01-05 21:02:15');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_name` varchar(50) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_name`, `capacity`) VALUES
(1, 'Room A', 10),
(2, 'Room B', 12),
(3, 'Room C', 8),
(4, 'Room A', 10),
(5, 'Room B', 12),
(6, 'Room C', 8),
(7, 'Room A', 10),
(8, 'Room B', 12),
(9, 'Room C', 8),
(10, 'Room A', 10),
(11, 'Room B', 12),
(12, 'Room C', 8);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `admission_no` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `disability_type` varchar(100) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `admission_no`, `first_name`, `last_name`, `gender`, `dob`, `disability_type`, `class_id`, `room_id`, `guardian_name`, `guardian_phone`, `created_at`) VALUES
(1, 'ADM001', 'John', 'Doe', 'Male', '2010-05-12', 'None', 1, 1, 'Jane Doe', '0771234567', '2026-01-05 21:01:59'),
(2, 'ADM002', 'Mary', 'Smith', 'Female', '2011-07-20', 'Visual Impairment', 2, 2, 'Peter Smith', '0789876543', '2026-01-05 21:01:59'),
(3, 'ADM003', 'Paul', 'Johnson', 'Male', '2010-03-15', 'Hearing Impairment', 3, 1, 'Lucy Johnson', '0764567890', '2026-01-05 21:01:59'),
(4, 'ADM004', 'Anna', 'Brown', 'Female', '2012-01-10', 'None', 1, 3, 'Michael Brown', '0791122334', '2026-01-05 21:01:59'),
(5, 'ADM005', 'James', 'Williams', 'Male', '2009-12-05', 'None', 4, 2, 'Sarah Williams', '0756677889', '2026-01-05 21:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','finance','teacher','health') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `role`, `created_at`) VALUES
(7, 'Admin User', 'admin@school.com', '$2y$10$R2DzJKGZxzG/1Q1VUV8Bcu9Ooua4LhFG77tLkz3J3fLg1t3/n0zXW', 'admin', '2026-01-05 20:35:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_structure`
--
ALTER TABLE `fee_structure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `health_records`
--
ALTER TABLE `health_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payment_student` (`student_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admission_no` (`admission_no`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `idx_student_class` (`class_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `fee_structure`
--
ALTER TABLE `fee_structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_records`
--
ALTER TABLE `health_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fee_structure`
--
ALTER TABLE `fee_structure`
  ADD CONSTRAINT `fee_structure_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `health_records`
--
ALTER TABLE `health_records`
  ADD CONSTRAINT `health_records_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
