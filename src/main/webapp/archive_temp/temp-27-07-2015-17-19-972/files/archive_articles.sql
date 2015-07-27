-- phpMyAdmin SQL Dump
-- version 4.4.11deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 26, 2015 at 09:03 PM
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
-- Table structure for table `archive_articles`
--

CREATE TABLE IF NOT EXISTS `archive_articles` (
  `article_id` int(11) NOT NULL,
  `article_title_EN` varchar(500) CHARACTER SET utf8 NOT NULL,
  `article_title_UA` varchar(500) CHARACTER SET utf8 NOT NULL,
  `article_title_HU` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `article_title_SK` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `article_title_RO` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `article_text_EN` text CHARACTER SET utf8 NOT NULL,
  `article_text_UA` text CHARACTER SET utf8 NOT NULL,
  `article_text_HU` text CHARACTER SET utf8,
  `article_text_SK` text CHARACTER SET utf8,
  `article_text_RO` text CHARACTER SET utf8,
  `article_category` int(11) NOT NULL,
  `article_author` varchar(100) CHARACTER SET utf8 NOT NULL,
  `article_editor` varchar(100) CHARACTER SET utf8 NOT NULL,
  `article_add_date` varchar(100) CHARACTER SET utf8 NOT NULL,
  `article_edit_date` varchar(100) CHARACTER SET utf8 NOT NULL,
  `article_is_edit` int(11) NOT NULL DEFAULT '1',
  `article_is_delete` int(11) NOT NULL DEFAULT '0',
  `article_is_publish` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `archive_articles`
--

INSERT INTO `archive_articles` (`article_id`, `article_title_EN`, `article_title_UA`, `article_title_HU`, `article_title_SK`, `article_title_RO`, `article_text_EN`, `article_text_UA`, `article_text_HU`, `article_text_SK`, `article_text_RO`, `article_category`, `article_author`, `article_editor`, `article_add_date`, `article_edit_date`, `article_is_edit`, `article_is_delete`, `article_is_publish`) VALUES
(1, 'Test article  ew', 'Test article uasss', NULL, NULL, NULL, '<p>Test article uaTest article uaTest article uaTest article uaTest article uaTest article ua</p>\r\n', '<p>Test article uaTest article ua</p>\r\n', NULL, NULL, NULL, 92, 'admin', 'admin', '26.07.2015', '26.07.2015 20:56', 1, 0, 0),
(2, '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, 92, 'admin', 'admin', '26.07.2015 20:59', '26.07.2015 20:59', 1, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archive_articles`
--
ALTER TABLE `archive_articles`
  ADD PRIMARY KEY (`article_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archive_articles`
--
ALTER TABLE `archive_articles`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
