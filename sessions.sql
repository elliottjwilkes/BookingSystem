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


