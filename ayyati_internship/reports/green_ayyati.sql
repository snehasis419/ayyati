-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 04, 2013 at 05:51 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `green_ayyati`
--

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE IF NOT EXISTS `employer` (
  `user_id` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `set_of_internships` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_num` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`set_of_internships`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `set_of_internships` (`set_of_internships`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `internship`
--

CREATE TABLE IF NOT EXISTS `internship` (
  `internship_id` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `prerequisite` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `applied_count` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `set_of_students_applied` varchar(100) NOT NULL,
  PRIMARY KEY (`internship_id`),
  KEY `set_of_students_applied` (`set_of_students_applied`),
  KEY `set_of_students_applied_2` (`set_of_students_applied`),
  KEY `set_of_students_applied_3` (`set_of_students_applied`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `user_id` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `college_name` varchar(50) NOT NULL,
  `set_of_internships` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`,`status`,`set_of_internships`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(50) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `facebook_token` varchar(100) NOT NULL,
  `twitter_token` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `session_token` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `session_token` (`session_token`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employer`
--
ALTER TABLE `employer`
  ADD CONSTRAINT `employer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `internship`
--
ALTER TABLE `internship`
  ADD CONSTRAINT `internship_ibfk_1` FOREIGN KEY (`set_of_students_applied`) REFERENCES `student` (`user_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`status`) REFERENCES `user` (`status`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
