-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 03 avr. 2021 à 09:21
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `web`
--

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `dateBirth` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `addInfo` varchar(64) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `cityBirth` varchar(45) DEFAULT NULL,
  `countryBirth` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `employmentStatus` varchar(64) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`id`, `lname`, `mail`, `dateBirth`, `phone`, `address`, `addInfo`, `nationality`, `cityBirth`, `countryBirth`, `gender`, `employmentStatus`, `password`, `balance`, `status`) VALUES
(1, 'Dupont', 'a@mail.dcu.ie', '01-01-1980', '0102030405', '75006 Paris France', '.', 'French', 'Lyon', 'France', 'male', 'Self-employed or freelance', 'test1', 1000, 1),
(2, 'Jones', 'b@mail.dcu.ie', '02-02-1985', '0203040506', '85000 New-York USA', '..', 'American', 'Washington', 'USA', 'female', 'Student', 'test2', 2000, 2),
(3, 'Adams', 'c@mail.dcu.ie', '03-03-1990', '0304050607', '95003 Dublin Ireland', '...', 'Irish', 'Cork', 'Ireland', 'male', 'Retired or homemaker', 'test3', 10000, 2),
(4, 'Smith', 'd@mail.dcu.ie', '04-04-1995', '0101010101', '62230 Shanghai China', '....', 'Chinese', 'Shenzhen', 'China', 'female', 'Unemployed', 'test4', 20000, 1),
(5, 'Brown', 'e@mail.dcu.ie', '05-05-2000', '0202020202', '55089 Jakarta Indonesia', '......', 'Indonesian', 'Denpasar', 'Indonesia', 'male', 'Student', 'test5', 100000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_transaction_customerid_idx` (`customerID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `transaction`
--

INSERT INTO `transaction` (`id`, `customerID`, `amount`, `date`, `comment`) VALUES
(1, 2, 100, '03-04-2021', 'Food'),
(2, 4, -200, '02-04-2021', 'Movie'),
(3, 5, 300, '01-04-2021', 'Bar'),
(4, 1, -400, '04-04-2021', 'Bus'),
(5, 3, 500, '05-04-2021', 'Swimming pool');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
