-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 12, 2014 at 12:08 AM
-- Server version: 5.5.37-0ubuntu0.12.04.1
-- PHP Version: 5.5.12-2+deb.sury.org~precise+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `adv_os`
--

-- --------------------------------------------------------

--
-- Table structure for table `food_image`
--

CREATE TABLE IF NOT EXISTS `food_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_food_restaurant_idx` (`restaurant_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `food_image`
--

INSERT INTO `food_image` (`id`, `restaurant_name`, `title`, `link`) VALUES
(1, 'Guy Savoy', 'Second amuse-bouche: carrot soup with a surprise vegetable spring roll', 'http://s3-media3.ak.yelpcdn.com/bphoto/V8-JjykePIOqN8Nptt7JkA/l.jpg'),
(2, 'Guy Savoy', 'Layered brioche with mushrooms and truffles', 'http://s3-media1.ak.yelpcdn.com/bphoto/klFv5btZqRx4h4XI83c32Q/l.jpg'),
(3, 'Pierre Hermé', 'Pistachio pound cake with pistachio bits along with powdered sugar', 'http://s3-media1.ak.yelpcdn.com/bphoto/c9vkd2Ta_p8oxIcfEHLz6w/l.jpg'),
(4, 'Pierre Hermé', 'Pierre Herme macarons!', 'http://s3-media3.ak.yelpcdn.com/bphoto/LK0Frb3NZHFb_QVaUZ8H9w/l.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE IF NOT EXISTS `restaurant` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rating` decimal(4,2) DEFAULT NULL,
  `neighborhood` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` decimal(20,10) NOT NULL,
  `latitude` decimal(20,10) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`name`, `rating`, `neighborhood`, `address`, `telephone`, `longitude`, `latitude`) VALUES
('Guy Savoy', 4.50, 'Champs-Elysées, 17ème', '18 rue Troyon<br>75017 Paris<br>France', '+33 1 43 80 40 61', 48.8762679000, 2.2951377000),
('Pierre Hermé', 5.00, 'Concorde/Madeleine, 1er', '4 rue Cambon<br>75001 Paris<br>France', '+33 1 43 54 47 77', 48.8762679000, 2.2951377000);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `food_image`
--
ALTER TABLE `food_image`
  ADD CONSTRAINT `fk_food_restaurant` FOREIGN KEY (`restaurant_name`) REFERENCES `restaurant` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
