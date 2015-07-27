-- phpMyAdmin SQL Dump
-- version 4.4.11deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 16, 2015 at 02:12 PM
-- Server version: 5.5.43-0+deb8u1
-- PHP Version: 5.6.9-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carpath`
--

-- --------------------------------------------------------

--
-- Table structure for table `archive_users`
--

CREATE TABLE IF NOT EXISTS `archive_users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `user_password` varchar(250) CHARACTER SET utf8 NOT NULL,
  `user_firstname` varchar(250) CHARACTER SET utf8 NOT NULL,
  `user_lastname` varchar(250) CHARACTER SET utf8 NOT NULL,
  `user_avatar` varchar(250) CHARACTER SET utf8 NOT NULL,
  `user_contacts` varchar(350) CHARACTER SET utf8 NOT NULL,
  `user_role` int(11) NOT NULL DEFAULT '0',
  `user_enabled` int(11) NOT NULL DEFAULT '1',
  `user_descr` varchar(350) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `archive_users`
--

INSERT INTO `archive_users` (`user_id`, `user_name`, `user_password`, `user_firstname`, `user_lastname`, `user_avatar`, `user_contacts`, `user_role`, `user_enabled`, `user_descr`) VALUES
(1, 'admin', 'adminarchivepass2015', 'John', 'Doe', '', 'google@gmail.com', 1, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archive_users`
--
ALTER TABLE `archive_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archive_users`
--
ALTER TABLE `archive_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
