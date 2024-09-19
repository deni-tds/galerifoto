-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 19, 2024 at 02:43 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dean`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `albumid` int NOT NULL AUTO_INCREMENT,
  `namaalbum` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggalbuat` date NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`albumid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`albumid`, `namaalbum`, `deskripsi`, `tanggalbuat`, `userid`) VALUES
(1, 'Lokomotif', '                                Kereta                              ', '2024-09-13', 2),
(3, 'perwira', 'komandan', '2024-09-13', 2),
(5, 'cita-cita', 'perwira', '2024-09-13', 2);

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

DROP TABLE IF EXISTS `foto`;
CREATE TABLE IF NOT EXISTS `foto` (
  `fotoid` int NOT NULL AUTO_INCREMENT,
  `judulfoto` varchar(255) NOT NULL,
  `deskripsifoto` text NOT NULL,
  `tanggalunggah` date NOT NULL,
  `lokasifile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `albumid` int NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`fotoid`),
  KEY `albumid` (`albumid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`fotoid`, `judulfoto`, `deskripsifoto`, `tanggalunggah`, `lokasifile`, `albumid`, `userid`) VALUES
(1, 'Mobil roda empat', 'Monster', '2024-09-13', '722615149-ms.jpg', 1, 2),
(6, 'perwira', 'komando', '2024-09-13', '786738620-perwira.jpg', 5, 2),
(4, 'motor', 'sport', '2024-09-13', '1069414779-Baz-Testing.jpg', 1, 2),
(5, 'mobil', 'sport', '2024-09-13', '856787176-OIP.jpeg', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `komentarfoto`
--

DROP TABLE IF EXISTS `komentarfoto`;
CREATE TABLE IF NOT EXISTS `komentarfoto` (
  `komentarid` int NOT NULL AUTO_INCREMENT,
  `fotoid` int NOT NULL,
  `userid` int NOT NULL,
  `isikomentar` text NOT NULL,
  `tanggalkomentar` date NOT NULL,
  PRIMARY KEY (`komentarid`),
  KEY `fotoid` (`fotoid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `komentarfoto`
--

INSERT INTO `komentarfoto` (`komentarid`, `fotoid`, `userid`, `isikomentar`, `tanggalkomentar`) VALUES
(1, 1, 2, 'kece bat dah', '2024-09-11'),
(2, 1, 2, 'keren', '2024-09-11'),
(3, 1, 2, 'mantap', '2024-09-11'),
(4, 1, 2, 'bagus', '2024-09-11'),
(5, 1, 2, 'ganas', '2024-09-11'),
(6, 4, 2, 'keren', '2024-09-13'),
(7, 4, 2, 'pro', '2024-09-13');

-- --------------------------------------------------------

--
-- Table structure for table `likefoto`
--

DROP TABLE IF EXISTS `likefoto`;
CREATE TABLE IF NOT EXISTS `likefoto` (
  `likeid` int NOT NULL AUTO_INCREMENT,
  `fotoid` int NOT NULL,
  `userid` int NOT NULL,
  `tanggallike` date NOT NULL,
  PRIMARY KEY (`likeid`),
  KEY `fotoid` (`fotoid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `likefoto`
--

INSERT INTO `likefoto` (`likeid`, `fotoid`, `userid`, `tanggallike`) VALUES
(8, 1, 2, '2024-09-13'),
(9, 5, 2, '2024-09-13');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `namalengkap` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `email`, `namalengkap`, `alamat`) VALUES
(1, 'admin', 'bcbe3365e6ac95ea2c0343a2395834dd', 'admin@gmail.com', 'administrator', 'durian'),
(2, 'admin', '698d51a19d8a121ce581499d7b701668', 'admin@gmail.com', 'administrator', 'durian'),
(3, 'admin', '698d51a19d8a121ce581499d7b701668', 'admin@gmail.com', 'administrasi', 'tanjung'),
(4, 'admin', '698d51a19d8a121ce581499d7b701668', 'admin@gmail.com', 'administrator', 'tanjung'),
(5, 'admin', '698d51a19d8a121ce581499d7b701668', 'admin@gmail.com', 'administrator', 'tanjung');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
