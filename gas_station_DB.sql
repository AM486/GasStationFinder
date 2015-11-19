-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Φιλοξενητής: localhost
-- Χρόνος δημιουργίας: 19 Νοε 2015 στις 15:23:13
-- Έκδοση διακομιστή: 5.5.44-0ubuntu0.14.04.1
-- Έκδοση PHP: 5.5.9-1ubuntu4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Βάση: `gas_station_DB`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `gas_station`
--

CREATE TABLE IF NOT EXISTS `gas_station` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(60) NOT NULL,
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `adrress_no` int(11) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `city` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `area` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `postal_code` int(11) NOT NULL,
  `latitube` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `gas` tinyint(1) NOT NULL,
  `laundry` tinyint(1) NOT NULL,
  `oil` tinyint(1) NOT NULL,
  `market` tinyint(1) NOT NULL,
  `log` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Άδειασμα δεδομένων του πίνακα `gas_station`
--

INSERT INTO `gas_station` (`ID`, `brand_name`, `address`, `adrress_no`, `phone_no`, `city`, `area`, `postal_code`, `latitube`, `longitude`, `gas`, `laundry`, `oil`, `market`, `log`) VALUES
(2, 'EKO', 'Λαμπράκη', 42, 2147483647, 'Βόλος', 'Μαγνησία', 38334, 39.362164, 22.934807, 1, 0, 1, 0, 'http://www.brandsoftheworld.com/sites/default/files/styles/logo-thumbnail/public/0024/1859/brand.gif?itok=DsupLQoj'),
(4, 'BP', 'Ιάσονος', 138, 2147483647, 'Βόλος', 'Μαγνησία', 38221, 39.358154, 22.950054, 0, 0, 0, 0, 'http://www.bp.com/etc/designs/bp-responsive/images/bp-responsive.svg '),
(6, 'SHELL', 'Λαρίσης', 82, 2421063820, 'Βόλος', 'Μαγνησία', 38334, 39.363621, 22.930159, 1, 1, 1, 0, 'https://upload.wikimedia.org/wikipedia/en/thumb/e/e8/Shell_logo.svg/1105px-Shell_logo.svg.png'),
(7, 'ETEKA', 'Λαρίσης', 234, 2421064802, 'Βόλος', 'Λαρίσης', 38334, 39.369064, 22.918968, 1, 0, 1, 1, 'http://www.e-biografiko.gr/wp-content/uploads/2014/09/logo-eteka-theseis_ergasias.jpg'),
(11, 'BP', 'Αναπαύσεως', 52, 2421085414, 'Βόλος', 'Νέα Ιωνία ', 38446, 39.373959, 22.939404, 1, 0, 1, 0, 'http://www.bp.com/etc/designs/bp-responsive/images/bp-responsive.svg '),
(12, 'BP', 'Χείρωνος ', 51, 2421039019, 'Βόλος', 'Βόλος', 38333, 39.370323, 22.939995, 0, 1, 1, 1, 'http://www.bp.com/etc/designs/bp-responsive/images/bp-responsive.svg '),
(13, 'Elin', 'Αθηνών', 11, 2421061414, 'Βόλος', 'Νεάπολη', 38334, 39.359512, 22.928741, 1, 0, 1, 1, 'http://energyin.gr/wp-content/uploads/2013/05/ELINOIL-LOGO1.jpg'),
(14, 'BP', 'Βασιλέως Παύλου', 49, 2428094533, 'Βόλος', 'Αγριά', 37300, 39.344383, 22.999447, 1, 1, 1, 1, 'http://www.bp.com/etc/designs/bp-responsive/images/bp-responsive.svg '),
(15, 'Elin', 'Πορταριά', 0, 2421025684, 'Βόλος', 'Πορταριά', 37011, 39.388779, 22.996792, 1, 0, 0, 0, 'http://energyin.gr/wp-content/uploads/2013/05/ELINOIL-LOGO1.jpg'),
(16, 'JETOIL', 'Κασσαβέτη ', 152, 2421070821, 'Βόλος', 'Βόλος', 38221, 39.365650, 22.961258, 1, 1, 1, 1, 'http://www.jetoil.gr/sites/default/files/jetoil_logo.jpg'),
(17, 'KAOIL', 'K.Kαρτάλη', 315, 2421054390, 'Βόλος', 'Βόλος', 38221, 39.369968, 22.956530, 1, 1, 1, 1, 'http://www.elektrotexniki.gr/wp-content/uploads/2014/02/kaoil.jpg'),
(18, 'CYCLON', 'Αγίου Δημητρίου ', 37, 2421098342, 'Bόλος', 'Βόλος', 38222, 39.358681, 22.965088, 1, 1, 1, 1, 'http://energyin.gr/wp-content/uploads/2013/04/cyclon-hellas.jpg'),
(19, 'KAOIL', 'Νέγρη', 6, 2421048533, 'Βόλος', 'Βόλος', 38222, 39.356224, 22.925385, 1, 1, 1, 1, 'http://www.elektrotexniki.gr/wp-content/uploads/2014/02/kaoil.jpg'),
(20, 'BP', 'Πολυμέρη ', 114, 2421078343, 'Βόλος', 'Βόλος', 38222, 39.354176, 22.961111, 1, 1, 1, 1, 'http://www.bp.com/etc/designs/bp-responsive/images/bp-responsive.svg bp'),
(21, 'AVIN', 'Ιωλκού', 363, 2421043233, 'Βόλος', 'Ιωλκός', 38333, 39.379486, 22.964968, 1, 1, 1, 1, 'http://www.moh.gr/media/Photos_inside_text/Avin.jpg'),
(22, 'ETEKA', 'Εθνική Οδός Βόλου Νεοχωρίου', 43, 2421025687, 'Βόλος', 'Άνω Λεχώνια', 37300, 39.326195, 23.052427, 1, 0, 0, 0, 'http://www.e-biografiko.gr/wp-content/uploads/2014/09/logo-eteka-theseis_ergasias.jpg'),
(23, 'JETOIL', 'Εθνική Οδός Βόλου Νεοχωρίου', 7, 2421069874, 'Βόλος', 'Kάτω Λεχώνια', 37300, 39.332096, 23.034704, 1, 0, 0, 0, 'http://www.jetoil.gr/sites/default/files/jetoil_logo.jpg'),
(24, 'KAOIL', 'Δημοκρατίας', 203, 2421035647, 'Βόλος', 'Αγριά', 37300, 39.337444, 23.016563, 1, 0, 0, 0, 'http://www.elektrotexniki.gr/wp-content/uploads/2014/02/kaoil.jpg'),
(25, 'KAOIL', 'Εθνική Οδός Τσαγκαράδας Χορευτο', 0, 2421036475, 'Βόλος', 'Μακρυράχη', 35010, 39.427429, 23.125814, 1, 0, 0, 0, 'http://www.elektrotexniki.gr/wp-content/uploads/2014/02/kaoil.jpg'),
(26, 'BP', 'Ιωλκού ', 155, 2421096475, 'Βόλος', 'Ιωλκός', 38333, 39.370266, 22.954119, 1, 1, 1, 1, 'http://www.bp.com/etc/designs/bp-responsive/images/bp-responsive.svg ');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
