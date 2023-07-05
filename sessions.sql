-- MySQL dump 10.19  Distrib 10.3.35-MariaDB, for Linux (x86_64)
--
-- Host: studdb.csc.liv.ac.uk    Database: sgewilke
-- ------------------------------------------------------
-- Server version	10.5.16-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `birth_day` date DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES ('1983-02-11','Jamie','Johnson',1),('1995-10-26','Birgit','Doe',2),('1991-05-15','Finn','Smith',3),('1990-07-03','Anita','Taylor',4);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees` (
  `birth_day` date DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `e_id` int(11) NOT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES ('1964-12-01','Carla','Brown',1),('1984-03-14','Bryan','Williams',2),('1991-02-19','Finn','Wilson',3),('1998-08-12','Louis','Davies',4);
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Items` (
  `price_for_each_type` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `amount_in_stock` int(11) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items`
--

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;
INSERT INTO `Items` VALUES (250,4,8,'Apple'),(70,2,7,'Banana'),(200,1,5,'Bread'),(450,3,2,'Chicken'),(25,2,4,'Garlic'),(100,4,15,'Grape'),(200,4,10,'Kiwi'),(100,1,3,'Lemonade'),(150,4,10,'Orange'),(300,3,2,'Pasta'),(200,3,5,'Rice');
/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemsInTransactions`
--

DROP TABLE IF EXISTS `ItemsInTransactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ItemsInTransactions` (
  `name` varchar(20) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL,
  `iit_id` int(11) NOT NULL,
  PRIMARY KEY (`iit_id`),
  KEY `name` (`name`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `ItemsInTransactions_ibfk_1` FOREIGN KEY (`name`) REFERENCES `Items` (`name`),
  CONSTRAINT `ItemsInTransactions_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `Transactions` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemsInTransactions`
--

LOCK TABLES `ItemsInTransactions` WRITE;
/*!40000 ALTER TABLE `ItemsInTransactions` DISABLE KEYS */;
INSERT INTO `ItemsInTransactions` VALUES ('Bread',1,1),('Lemonade',1,2),('Banana',1,3),('Garlic',1,4),('Orange',1,5),('Bread',2,6),('Bread',2,7),('Lemonade',2,8),('Lemonade',2,9),('Orange',2,10),('Orange',2,11),('Orange',2,12),('Orange',2,13),('Apple',3,14),('Apple',3,15),('Apple',3,16),('Orange',3,17),('Orange',3,18),('Orange',3,19),('Grape',3,20),('Grape',3,21),('Grape',3,22),('Bread',4,23),('Bread',4,24),('Garlic',4,25),('Rice',5,26),('Rice',5,27),('Rice',5,28),('Chicken',5,29),('Apple',6,30),('Apple',6,31),('Apple',6,32);
/*!40000 ALTER TABLE `ItemsInTransactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ItemsLeft1`
--

DROP TABLE IF EXISTS `ItemsLeft1`;
/*!50001 DROP VIEW IF EXISTS `ItemsLeft1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ItemsLeft1` (
  `name` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `amount_left` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ItemsLeft2`
--

DROP TABLE IF EXISTS `ItemsLeft2`;
/*!50001 DROP VIEW IF EXISTS `ItemsLeft2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ItemsLeft2` (
  `name` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `amount_left` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `LouisTransactions`
--

DROP TABLE IF EXISTS `LouisTransactions`;
/*!50001 DROP VIEW IF EXISTS `LouisTransactions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `LouisTransactions` (
  `number_of_transactions` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `PeopleInShop`
--

DROP TABLE IF EXISTS `PeopleInShop`;
/*!50001 DROP VIEW IF EXISTS `PeopleInShop`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `PeopleInShop` (
  `birth_day` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Promotion`
--

DROP TABLE IF EXISTS `Promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Promotion` (
  `number_to_buy` int(11) DEFAULT NULL,
  `how_many_are_free` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promotion`
--

LOCK TABLES `Promotion` WRITE;
/*!40000 ALTER TABLE `Promotion` DISABLE KEYS */;
INSERT INTO `Promotion` VALUES (3,1,1),(5,3,2),(4,2,4);
/*!40000 ALTER TABLE `Promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `TEST`
--

DROP TABLE IF EXISTS `TEST`;
/*!50001 DROP VIEW IF EXISTS `TEST`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `TEST` (
  `name` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `amount_left` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transactions` (
  `e_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `t_id` int(11) NOT NULL,
  PRIMARY KEY (`t_id`),
  KEY `c_id` (`c_id`),
  KEY `e_id` (`e_id`),
  CONSTRAINT `Transactions_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `Customers` (`c_id`),
  CONSTRAINT `Transactions_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `Employees` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (1,3,'2022-08-09',1),(4,2,'2022-08-14',2),(4,4,'2022-09-28',3),(3,4,'2022-09-28',4),(4,1,'2022-09-28',5),(1,4,'2022-09-30',6);
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `session_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  KEY `session_id` (`session_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `slot` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,'Micheal North','M.North@student.liverpool.ac.uk'),(5,'Jody Land','J.Land@student.liverpool.ac.uk'),(7,'Trish Shelby','T.Shelby@student.liverpool.ac.uk'),(11,'Wayne Ungood','W.Ungood@student.liverpool.ac.uk');
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_code` varchar(7) NOT NULL,
  `day` varchar(10) NOT NULL,
  `time` time NOT NULL,
  `lab` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `taken_spaces` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'COMP281','Tuesday','11:00:00',2,3,0),(2,'COMP281','Tuesday','15:00:00',2,3,0),(3,'COMP281','Thursday','09:00:00',2,3,0),(4,'COMP281','Thursday','15:00:00',2,3,0),(5,'COMP284','Monday','15:00:00',2,2,0),(6,'COMP284','Tuesday','15:00:00',2,2,0),(7,'COMP285','Monday','09:00:00',3,2,0),(8,'COMP285','Wednesday','13:00:00',3,2,0),(9,'COMP285','Friday','15:00:00',3,2,0);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ItemsLeft1`
--

/*!50001 DROP TABLE IF EXISTS `ItemsLeft1`*/;
/*!50001 DROP VIEW IF EXISTS `ItemsLeft1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgewilke`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ItemsLeft1` AS select `i`.`name` AS `name`,`i`.`type` AS `type`,`i`.`amount_in_stock` - count(`iit`.`name`) AS `amount_left` from (`Items` `i` join `ItemsInTransactions` `iit`) where `i`.`name` = `iit`.`name` group by `i`.`name` having `i`.`type` = 1 or `i`.`type` = 2 order by `i`.`type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ItemsLeft2`
--

/*!50001 DROP TABLE IF EXISTS `ItemsLeft2`*/;
/*!50001 DROP VIEW IF EXISTS `ItemsLeft2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgewilke`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ItemsLeft2` AS select `i`.`name` AS `name`,`i`.`type` AS `type`,`i`.`amount_in_stock` - count(`iit`.`name`) AS `amount_left` from (`Items` `i` join `ItemsInTransactions` `iit`) where `i`.`name` = `iit`.`name` group by `i`.`name` having `i`.`type` = 3 or `i`.`type` = 4 union select `i`.`name` AS `name`,`i`.`type` AS `type`,`i`.`amount_in_stock` AS `amount_left` from `Items` `i` where !(`i`.`name` in (select `ItemsInTransactions`.`name` from `ItemsInTransactions`)) group by `i`.`name` having `i`.`type` = 3 or `i`.`type` = 4 order by `type`,`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LouisTransactions`
--

/*!50001 DROP TABLE IF EXISTS `LouisTransactions`*/;
/*!50001 DROP VIEW IF EXISTS `LouisTransactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgewilke`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `LouisTransactions` AS select count(`t`.`t_id`) AS `number_of_transactions` from (`Employees` `e` join `Transactions` `t`) where `e`.`first_name` = 'Louis' and `e`.`e_id` = `t`.`e_id` and `t`.`date` between '2022-09-01' and '2022-09-30' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PeopleInShop`
--

/*!50001 DROP TABLE IF EXISTS `PeopleInShop`*/;
/*!50001 DROP VIEW IF EXISTS `PeopleInShop`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgewilke`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `PeopleInShop` AS select distinct `e`.`birth_day` AS `birth_day`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name` from (`Employees` `e` join `Transactions` `t`) where `t`.`date` = '2022-9-28' and `e`.`e_id` = `t`.`e_id` union select distinct `c`.`birth_day` AS `birth_day`,`c`.`first_name` AS `first_name`,`c`.`last_name` AS `last_name` from (`Customers` `c` join `Transactions` `t`) where `t`.`date` = '2022-9-28' and `c`.`c_id` = `t`.`c_id` order by `birth_day` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TEST`
--

/*!50001 DROP TABLE IF EXISTS `TEST`*/;
/*!50001 DROP VIEW IF EXISTS `TEST`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgewilke`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `TEST` AS select `i`.`name` AS `name`,`i`.`type` AS `type`,`i`.`amount_in_stock` AS `amount_left` from (`Items` `i` join `ItemsInTransactions` `iit`) where !(`i`.`name` in (select distinct `ItemsInTransactions`.`name` from `ItemsInTransactions`)) and `i`.`type` = 3 or `i`.`type` = 4 order by `i`.`type`,`i`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-24  4:47:33
