CREATE DATABASE  IF NOT EXISTS `LTS` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `LTS`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 10.0.2.13    Database: LTS
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details` (
  `laptopid` varchar(10) NOT NULL,
  `requesterid` varchar(4) NOT NULL,
  `requestdate` date NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `committedrtndate` date DEFAULT NULL,
  `approverid` varchar(4) DEFAULT NULL,
  `approvedate` date DEFAULT NULL,
  `issueddate` date DEFAULT NULL,
  `issuerid` varchar(4) DEFAULT NULL,
  `collectorid` varchar(4) DEFAULT NULL,
  `collectiondate` date DEFAULT NULL,
  `phoneext` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`laptopid`,`requesterid`,`requestdate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='									';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master`
--

DROP TABLE IF EXISTS `master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master` (
  `laptopid` varchar(10) NOT NULL,
  `binlocation` varchar(10) DEFAULT NULL,
  `isout` tinyint(4) DEFAULT NULL,
  `eta` date DEFAULT NULL,
  `isrequested` tinyint(4) DEFAULT NULL,
  `isapproved` tinyint(4) DEFAULT NULL,
  `isissued` tinyint(4) DEFAULT NULL,
  `isreturned` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`laptopid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master`
--

LOCK TABLES `master` WRITE;
/*!40000 ALTER TABLE `master` DISABLE KEYS */;
/*!40000 ALTER TABLE `master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `empid` varchar(4) NOT NULL,
  `passwd` varchar(45) DEFAULT NULL,
  `isapprover` tinyint(4) DEFAULT NULL,
  `isstorekeeper` tinyint(4) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phoneext` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1003','Trivent@123',0,1,'Govint','300'),('1004','Trivent@123',0,0,'Ayesha Begham','???'),('1005','Trivent@123',1,0,'Premkumar Arumugam','???');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-23  7:33:29
