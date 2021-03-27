-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 26 mars 2021 à 10:52
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
  `id` varchar(45) NOT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `balance` double NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`id`, `mail`, `password`, `name`, `phone`, `address`, `balance`, `status`) VALUES
('C00001', 'a@mail.dcu.ie', 'test', 'Dupont', '0102030405', 'address1', 1000, 1),
('C00002', 'b@mail.dcu.ie', 'test2', 'Jones', '0203040506', 'address2', 2000, 2),
('C00003', 'c@mail.dcu.ie', 'test3', 'Adams', '0304050607', 'address3', 10000, 2),
('C00004', 'd@mail.dcu.ie', 'test4', 'Smith', '0101010101', 'address4', 20000, 1),
('C00005', 'a', 'a', 'a', 'a', 'a', 100000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` varchar(45) DEFAULT NULL,
  `recipientID` varchar(45) DEFAULT NULL,
  `amount` double NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_transaction_customerid_idx` (`customerID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `transaction`
--

INSERT INTO `transaction` (`id`, `customerID`, `recipientID`, `amount`, `date`) VALUES
(1, 'C00001', 'C00005', 100, '2021-03-26'),
(2, 'C00002', 'C12345', 200, '2021-03-26'),
(3, 'C00003', 'C00341', 300, '2021-03-26'),
(4, 'C00004', 'C00012', 400, '2021-03-26'),
(5, 'C00005', 'C00894', 500, '2021-03-26');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
