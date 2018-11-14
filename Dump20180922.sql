-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lts
-- ------------------------------------------------------
-- Server version	5.7.14

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
INSERT INTO `details` VALUES ('TSL-LP04','1003','2018-09-14','Case','2018-09-15',NULL,NULL,NULL,NULL,NULL,NULL,'300'),('TSL-LP01','1003','2018-09-14','Case there','2018-09-16',NULL,NULL,NULL,NULL,NULL,NULL,'300'),('TSL-LP03','1003','2018-09-14','Rush Case','2018-09-17',NULL,NULL,NULL,NULL,NULL,NULL,'300'),('TSL-LP06','1003','2018-09-14','Rush Case','2018-09-20',NULL,NULL,NULL,NULL,NULL,NULL,'300'),('TSL-LP07','1003','2018-09-14','Rush cases','2018-10-20',NULL,NULL,NULL,NULL,NULL,NULL,'300');
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
INSERT INTO `master` VALUES ('TSL-LP01','BIn1',0,'2018-08-20',0,0,1,0),('TSL-LP02','BIn1',0,'2018-08-21',0,0,1,0),('TSL-LP03','BIn1',0,'2018-09-20',0,0,0,0),('TSL-LP04','BIn1',0,'2018-09-20',0,0,0,0),('TSL-LP05','BIn1',0,'2018-09-20',0,0,0,0),('TSL-LP06','BIn1',0,'2018-09-20',1,0,0,0),('TSL-LP07','BIn1',0,'2018-10-20',1,0,0,0),('TSL-LP08','BIn1',0,'2018-09-20',0,0,0,0),('TSL-LP09','BIn1',0,'2018-09-20',0,0,0,0),('TSL-LP10','BIn1',0,'2018-09-20',0,0,0,0);
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

-- Dump completed on 2018-09-22 20:43:15
