-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: mysql-5b2bc8dc-o277c36e9.database.cloud.ovh.net    Database: SockWorld
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '6e513054-ae38-11ee-8ede-fa163e4035f5:1-104';

--
-- Table structure for table `LaundryBaskets`
--

DROP TABLE IF EXISTS `LaundryBaskets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LaundryBaskets` (
  `BasketID` int NOT NULL,
  `OwnerName` text NOT NULL,
  `Color` text,
  `Capacity` int DEFAULT NULL,
  PRIMARY KEY (`BasketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LaundryBaskets`
--

LOCK TABLES `LaundryBaskets` WRITE;
/*!40000 ALTER TABLE `LaundryBaskets` DISABLE KEYS */;
INSERT INTO `LaundryBaskets` VALUES (1,'Alice','Red',30),(2,'Bob','Blue',25),(3,'Charlie','Green',20),(4,'Diana','Yellow',15),(5,'Evan','White',10);
/*!40000 ALTER TABLE `LaundryBaskets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SockSightings`
--

DROP TABLE IF EXISTS `SockSightings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SockSightings` (
  `SightingID` int NOT NULL,
  `SockID` int DEFAULT NULL,
  `SuspectID` int DEFAULT NULL,
  `SightingDate` date DEFAULT NULL,
  PRIMARY KEY (`SightingID`),
  KEY `SockID` (`SockID`),
  KEY `SuspectID` (`SuspectID`),
  CONSTRAINT `SockSightings_ibfk_1` FOREIGN KEY (`SockID`) REFERENCES `Socks` (`SockID`),
  CONSTRAINT `SockSightings_ibfk_2` FOREIGN KEY (`SuspectID`) REFERENCES `Suspects` (`SuspectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SockSightings`
--

LOCK TABLES `SockSightings` WRITE;
/*!40000 ALTER TABLE `SockSightings` DISABLE KEYS */;
INSERT INTO `SockSightings` VALUES (1,1,1,'2024-01-01'),(2,4,2,'2024-01-02'),(3,5,4,'2024-01-03'),(4,7,5,'2024-01-04'),(5,8,1,'2024-01-05'),(6,9,3,'2024-01-06'),(7,10,2,'2024-01-07'),(8,11,4,'2024-01-08'),(9,12,5,'2024-01-09'),(10,14,1,'2024-01-10');
/*!40000 ALTER TABLE `SockSightings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Socks`
--

DROP TABLE IF EXISTS `Socks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Socks` (
  `SockID` int NOT NULL,
  `BasketID` int DEFAULT NULL,
  `Color` text,
  `Pattern` text,
  `MatchID` int DEFAULT NULL,
  PRIMARY KEY (`SockID`),
  KEY `BasketID` (`BasketID`),
  CONSTRAINT `Socks_ibfk_1` FOREIGN KEY (`BasketID`) REFERENCES `LaundryBaskets` (`BasketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Socks`
--

LOCK TABLES `Socks` WRITE;
/*!40000 ALTER TABLE `Socks` DISABLE KEYS */;
INSERT INTO `Socks` VALUES (1,1,'White','Stripes',NULL),(2,1,'Black','Plain',3),(3,2,'Black','Plain',2),(4,3,'Yellow','Polka Dots',NULL),(5,4,'Red','None',6),(6,4,'Red','None',5),(7,5,'Blue','Stripes',NULL),(8,5,'Green','Polka Dots',NULL),(9,3,'Purple','None',NULL),(10,2,'Pink','None',NULL),(11,1,'Orange','Stripes',NULL),(12,5,'Grey','Plain',13),(13,4,'Grey','Plain',12),(14,2,'Brown','Polka Dots',NULL);
/*!40000 ALTER TABLE `Socks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suspects`
--

DROP TABLE IF EXISTS `Suspects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Suspects` (
  `SuspectID` int NOT NULL,
  `Name` text NOT NULL,
  `LastSeenLocation` text,
  `SuspiciousActivities` text,
  PRIMARY KEY (`SuspectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suspects`
--

LOCK TABLES `Suspects` WRITE;
/*!40000 ALTER TABLE `Suspects` DISABLE KEYS */;
INSERT INTO `Suspects` VALUES (1,'Sneaky Pete','Laundry Room','Seen lurking near baskets'),(2,'Shifty Sheila','Under the Bed','Frequently spotted with mismatched socks'),(3,'Grabby Gary','Back of the Closet','Has a collection of single socks'),(4,'Crafty Katie','Garden','Collecting various fabrics'),(5,'Mysterious Mike','Attic','Often seen with a bag of unknown items');
/*!40000 ALTER TABLE `Suspects` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-11 15:45:32
