-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 03, 2013 at 01:46 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mobile`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE IF NOT EXISTS `bill` (
  `bid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `product` varchar(30) NOT NULL,
  `amount` int(8) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bid`, `name`, `product`, `amount`, `date`) VALUES
(1, 'niki1', 'Lumia 900, Galaxy S3, ', 57000, '0000-00-00'),
(2, 'niki1', 'Lumia 900, Galaxy S3, ', 57000, '0000-00-00'),
(3, 'niki1', 'Asha 305, 109-Black, ', 6497, '0000-00-00'),
(4, 'niki1', '', 0, '0000-00-00'),
(5, 'niki1', 'Asha 305, 109-Black, ', 6497, '0000-00-00'),
(6, 'niki1', '', 0, '0000-00-00'),
(7, 'niki1', '', 0, '0000-00-00'),
(8, 'niki1', '', 0, '0000-00-00'),
(9, 'niki1', '', 0, '0000-00-00'),
(10, 'niki1', '', 0, '0000-00-00'),
(11, 'niki1', '', 0, '0000-00-00'),
(12, 'niki1', '', 0, '0000-00-00'),
(13, 'niki1', 'GalaxyNote-2, ', 32200, '0000-00-00'),
(14, 'niki1', 'I9082 DUOS, star s5282, Galaxy', 54680, '0000-00-00'),
(15, 'niki1', 'I9082 DUOS, star s5282, ', 22480, '0000-00-00'),
(16, 'niki1', 'Galaxy S3, ', 29000, '0000-00-00'),
(17, 'niki1', '', 0, '0000-00-00'),
(18, 'niki1', '', 0, '0000-00-00'),
(19, 'niki1', '', 0, '0000-00-00'),
(20, 'niki1', '', 0, '0000-00-00'),
(21, 'niki1', '', 0, '0000-00-00'),
(22, 'niki1', ', ', 0, '0000-00-00'),
(23, 'niki1', ', ', 0, '0000-00-00'),
(24, 'niki1', ', ', 0, '0000-00-00'),
(25, 'niki1', '', 0, '0000-00-00'),
(26, 'niki1', 'Galaxy S3, I9082 DUOS, ', 46590, '0000-00-00'),
(27, 'niki1', '', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `type` varchar(1) NOT NULL DEFAULT 'U',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `userid`, `password`, `name`, `type`) VALUES
(1, 'niki1', '123', 'niki', 'U'),
(2, 'm1', '123', 'mmm', 'E'),
(3, 'lingas25', 'lingasv', 'lingas', 'U'),
(4, 'lingas53', 'lingashj', 'lingas', 'U'),
(5, 'anand_10', 'happy', 'anand', 'U');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `itemcode` int(3) NOT NULL AUTO_INCREMENT,
  `mid` varchar(10) NOT NULL,
  `mname` varchar(30) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `image` varchar(30) NOT NULL,
  `price` int(8) NOT NULL,
  PRIMARY KEY (`itemcode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`itemcode`, `mid`, `mname`, `brand`, `image`, `price`) VALUES
(1, 'nlu90', 'Lumia 900', 'Nokia', 'uploaded/nlu90.jpg', 28000),
(2, 'sgs3', 'Galaxy S3', 'Samsung', 'uploaded/sgs3.jpg', 29000),
(3, 'nlu520', 'Lumia 520', 'Nokia', 'uploaded/lumia520.jpg', 10499),
(4, 'nas305', 'Asha 305', 'Nokia', 'uploaded/asha305.jpg', 4599),
(5, 'n109', '109-Black', 'Nokia', 'uploaded/nokia109.jpg', 1898),
(6, 'nc03', 'C2-03', 'Nokia', 'uploaded/c2-03.jpg', 3826),
(7, 'ne05', 'E-05', 'Nokia', 'uploaded/E-05.jpg', 8950),
(8, 'sg9082', 'I9082 DUOS', 'Samsung', 'uploaded/sg9082.jpeg', 17590),
(9, 'sg5282', 'star s5282', 'Samsung', 'uploaded/sg5282.jpeg', 4890),
(10, 'sg6802', 'Ace DUOS 6802', 'Samsung', 'uploaded/sg6802.jpeg', 8399),
(11, 'sn7100', 'GalaxyNote-2', 'Samsung', 'uploaded/note2.jpeg', 32200),
(12, 'sgs4', 'GalaxyS4', 'Samsung', 'uploaded/s4.jpeg', 38230),
(13, 'sgI509', 'GalaxyY', 'Samsung', 'uploaded/sgy.jpeg', 7445),
(14, 'xL', 'Xperia L', 'Sony', 'uploaded/XL.jpeg', 15949),
(15, 'xE', 'Xperia E', 'Sony', 'uploaded/XE.jpeg', 7899),
(16, 'xZ', 'Xperia Z', 'Sony', 'uploaded/XZ.jpeg', 32990),
(17, 'LN4', 'GoogleNexus4', 'LG', 'uploaded/gn4.jpg', 25205),
(18, 'LL7', 'Optimus L7', 'LG', 'uploaded/L7.jpg', 13423),
(19, 'hA320E', 'Desire C', 'HTC', 'uploaded/hc.jpeg', 8299),
(20, 'h600', 'Desire600', 'HTC', 'uploaded/h600.jpg', 28499);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
