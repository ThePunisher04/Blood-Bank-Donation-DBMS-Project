-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bloodbank
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bb_manager`
--

DROP TABLE IF EXISTS `bb_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_manager` (
  `M_id` int NOT NULL,
  `mName` varchar(100) NOT NULL,
  `m_phNo` bigint DEFAULT NULL,
  PRIMARY KEY (`M_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_manager`
--

LOCK TABLES `bb_manager` WRITE;
/*!40000 ALTER TABLE `bb_manager` DISABLE KEYS */;
INSERT INTO `bb_manager` VALUES (101,'Vatsalya',9693959671),(102,'Vicky',9693959672),(103,'Light',9693959673),(104,'Eren',9693959674),(105,'Mikasa',9693959675),(106,'Goku',9693959676),(107,'Itachi',9693959677),(108,'Naruto',9693959678),(109,'Luffy',9693959679),(110,'Levi',9693959680);
/*!40000 ALTER TABLE `bb_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_donor`
--

DROP TABLE IF EXISTS `blood_donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_donor` (
  `bd_ID` int NOT NULL,
  `bd_name` varchar(100) NOT NULL,
  `bd_age` varchar(100) DEFAULT NULL,
  `bd_sex` varchar(100) DEFAULT NULL,
  `bd_Bgroup` varchar(10) DEFAULT NULL,
  `bd_reg_date` date DEFAULT NULL,
  `reco_ID` int NOT NULL,
  `City_ID` int NOT NULL,
  PRIMARY KEY (`bd_ID`),
  KEY `reco_ID` (`reco_ID`),
  KEY `City_ID` (`City_ID`),
  CONSTRAINT `blood_donor_ibfk_1` FOREIGN KEY (`reco_ID`) REFERENCES `recording_staff` (`reco_ID`),
  CONSTRAINT `blood_donor_ibfk_2` FOREIGN KEY (`City_ID`) REFERENCES `city` (`City_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_donor`
--

LOCK TABLES `blood_donor` WRITE;
/*!40000 ALTER TABLE `blood_donor` DISABLE KEYS */;
INSERT INTO `blood_donor` VALUES (150011,'Steven','25','M','O+','2015-07-19',101412,1100),(150012,'Tony','35','M','A-','2015-12-24',101412,1100),(150013,'Bruce','22','M','AB+','2015-08-28',101212,1200),(150014,'Natasha','29','M','B+','2015-12-17',101212,1300),(150015,'Hermoine','42','M','A+','2016-11-22',101212,1300),(150016,'Harry','44','F','AB-','2016-02-06',101212,1200),(150017,'Sherlock','33','M','B-','2016-10-15',101312,1400),(150018,'Logan','31','F','O+','2016-01-04',101312,1200),(150019,'Peter','24','F','AB+','2016-09-10',101312,1500),(150020,'Odinson','29','M','O-','2016-12-17',101212,1200);
/*!40000 ALTER TABLE `blood_donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `blood_recipient_samebgrp`
--

DROP TABLE IF EXISTS `blood_recipient_samebgrp`;
/*!50001 DROP VIEW IF EXISTS `blood_recipient_samebgrp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `blood_recipient_samebgrp` AS SELECT 
 1 AS `bd_name`,
 1 AS `reci_name`,
 1 AS `reco_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bloodspecimen`
--

DROP TABLE IF EXISTS `bloodspecimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodspecimen` (
  `specimen_number` int NOT NULL,
  `b_group` varchar(10) NOT NULL,
  `status` int DEFAULT NULL,
  `dfind_ID` int NOT NULL,
  `M_id` int NOT NULL,
  PRIMARY KEY (`specimen_number`,`b_group`),
  KEY `M_id` (`M_id`),
  KEY `dfind_ID` (`dfind_ID`),
  CONSTRAINT `bloodspecimen_ibfk_1` FOREIGN KEY (`M_id`) REFERENCES `bb_manager` (`M_id`),
  CONSTRAINT `bloodspecimen_ibfk_2` FOREIGN KEY (`dfind_ID`) REFERENCES `diseasefinder` (`dfind_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodspecimen`
--

LOCK TABLES `bloodspecimen` WRITE;
/*!40000 ALTER TABLE `bloodspecimen` DISABLE KEYS */;
INSERT INTO `bloodspecimen` VALUES (1001,'B+',1,11,101),(1002,'O+',1,12,102),(1003,'AB+',1,11,102),(1004,'O-',1,13,103),(1005,'A+',0,14,101),(1006,'A-',1,13,104),(1007,'AB-',1,15,104),(1008,'AB-',0,11,105),(1009,'B+',1,13,105),(1010,'O+',0,12,105),(1011,'O+',1,13,103),(1012,'O-',1,14,102),(1013,'B-',1,14,102),(1014,'AB+',0,15,101);
/*!40000 ALTER TABLE `bloodspecimen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `City_ID` int NOT NULL,
  `City_name` varchar(100) NOT NULL,
  PRIMARY KEY (`City_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1100,'Asgard'),(1200,'Paradis'),(1300,'Marley'),(1400,'Wakanda'),(1500,'Valhalla'),(1600,'Madripoor'),(1700,'Hogwarts'),(1800,'Sokovia'),(1900,'Kamar-Taj'),(2000,'Gotham');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseasefinder`
--

DROP TABLE IF EXISTS `diseasefinder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseasefinder` (
  `dfind_ID` int NOT NULL,
  `dfind_name` varchar(100) NOT NULL,
  `dfind_PhNo` bigint DEFAULT NULL,
  PRIMARY KEY (`dfind_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseasefinder`
--

LOCK TABLES `diseasefinder` WRITE;
/*!40000 ALTER TABLE `diseasefinder` DISABLE KEYS */;
INSERT INTO `diseasefinder` VALUES (11,'Indiana',9693959681),(12,'Stephen',9693959682),(13,'Christine',9693959683),(14,'Gwen',9693959672),(15,'Viktor',9693959679),(16,'Skywalker',9693959684),(17,'Julius',9693959685),(18,'Kratos',9693959686),(19,'Brutus',9693959687),(20,'Murdock',9693959688);
/*!40000 ALTER TABLE `diseasefinder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_info_1`
--

DROP TABLE IF EXISTS `hospital_info_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_info_1` (
  `hosp_ID` int NOT NULL,
  `hosp_name` varchar(100) NOT NULL,
  `City_ID` int NOT NULL,
  `M_id` int NOT NULL,
  PRIMARY KEY (`hosp_ID`),
  KEY `M_id` (`M_id`),
  KEY `City_ID` (`City_ID`),
  CONSTRAINT `hospital_info_1_ibfk_1` FOREIGN KEY (`M_id`) REFERENCES `bb_manager` (`M_id`),
  CONSTRAINT `hospital_info_1_ibfk_2` FOREIGN KEY (`City_ID`) REFERENCES `city` (`City_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_info_1`
--

LOCK TABLES `hospital_info_1` WRITE;
/*!40000 ALTER TABLE `hospital_info_1` DISABLE KEYS */;
INSERT INTO `hospital_info_1` VALUES (1,'Springfield',1100,101),(2,'Hampshire',1200,103),(3,'Winterfell',1300,103),(4,'Riverrun',1400,104),(5,'Hogsmeade',1800,103),(6,'Greenoaks',1300,106),(7,'Forestpark',1300,102),(8,'Parkland',1200,106),(9,'Pinecreek',1500,109),(10,'Alphaville',1700,105);
/*!40000 ALTER TABLE `hospital_info_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_info_2`
--

DROP TABLE IF EXISTS `hospital_info_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_info_2` (
  `hosp_ID` int NOT NULL,
  `hosp_name` varchar(100) NOT NULL,
  `hosp_needed_Bgrp` varchar(10) NOT NULL,
  `hosp_needed_qnty` int DEFAULT NULL,
  PRIMARY KEY (`hosp_ID`,`hosp_needed_Bgrp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_info_2`
--

LOCK TABLES `hospital_info_2` WRITE;
/*!40000 ALTER TABLE `hospital_info_2` DISABLE KEYS */;
INSERT INTO `hospital_info_2` VALUES (1,'Springfield','A-',0),(1,'Springfield','A+',20),(1,'Springfield','AB-',10),(1,'Springfield','AB+',40),(1,'Springfield','B-',20),(2,'Hampshire','A-',10),(2,'Hampshire','A+',40),(2,'Hampshire','AB-',10),(2,'Hampshire','AB+',20),(2,'Hampshire','B-',30),(2,'Hampshire','B+',0),(3,'Winterfell','A-',0),(3,'Winterfell','A+',0),(3,'Winterfell','AB-',0),(3,'Winterfell','AB+',0),(3,'Winterfell','B-',20),(3,'Winterfell','B+',10),(4,'Riverrun','A-',40),(4,'Riverrun','A+',10),(7,'Forestpark','B-',40),(8,'Parkland','B+',10),(9,'Pinecreek','AB-',20);
/*!40000 ALTER TABLE `hospital_info_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipient`
--

DROP TABLE IF EXISTS `recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipient` (
  `reci_ID` int NOT NULL,
  `reci_name` varchar(100) NOT NULL,
  `reci_age` varchar(10) DEFAULT NULL,
  `reci_Brgp` varchar(100) DEFAULT NULL,
  `reci_Bqnty` float DEFAULT NULL,
  `reco_ID` int NOT NULL,
  `City_ID` int NOT NULL,
  `M_id` int NOT NULL,
  `reci_sex` varchar(100) DEFAULT NULL,
  `reci_reg_date` date DEFAULT NULL,
  PRIMARY KEY (`reci_ID`),
  KEY `M_id` (`M_id`),
  KEY `City_ID` (`City_ID`),
  CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`M_id`) REFERENCES `bb_manager` (`M_id`),
  CONSTRAINT `recipient_ibfk_2` FOREIGN KEY (`City_ID`) REFERENCES `city` (`City_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipient`
--

LOCK TABLES `recipient` WRITE;
/*!40000 ALTER TABLE `recipient` DISABLE KEYS */;
INSERT INTO `recipient` VALUES (10001,'Indiana','25','B+',1.5,101212,1100,101,'F','2015-12-17'),(10002,'Bruce','60','A+',1,101312,1100,102,'M','2015-12-16'),(10003,'Goku','35','AB+',0.5,101312,1200,102,'M','2015-10-17'),(10004,'Stephen','66','B+',1,101212,1300,104,'M','2016-11-17'),(10005,'Itachi','53','B-',1,101412,1400,105,'M','2015-04-17'),(10006,'Erwin','45','O+',1.5,101512,1500,105,'M','2015-12-17'),(10007,'Natasha','22','AB-',1,101212,1500,101,'M','2015-05-17'),(10008,'Julius','25','B+',2,101412,1300,103,'F','2015-12-14'),(10009,'Hemsworth','30','A+',1.5,101312,1100,104,'M','2015-02-16'),(10010,'Langford','25','AB+',3.5,101212,1200,107,'F','2016-10-17');
/*!40000 ALTER TABLE `recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording_staff`
--

DROP TABLE IF EXISTS `recording_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recording_staff` (
  `reco_ID` int NOT NULL,
  `reco_Name` varchar(100) NOT NULL,
  `reco_phNo` bigint DEFAULT NULL,
  PRIMARY KEY (`reco_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording_staff`
--

LOCK TABLES `recording_staff` WRITE;
/*!40000 ALTER TABLE `recording_staff` DISABLE KEYS */;
INSERT INTO `recording_staff` VALUES (101012,'Tanjiro',4044846553),(101112,'Zenitsu',4045856553),(101212,'Inosuke',4045806553),(101312,'Mitsuri',4045806553),(101412,'Nezuko',4045806553),(101512,'Muzan',4045806553),(101612,'Akaza',4045806553),(101712,'Tengen',4045816553),(101812,'Rengoku',4045826553),(101912,'Kokushibo',4045836553);
/*!40000 ALTER TABLE `recording_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `blood_recipient_samebgrp`
--

/*!50001 DROP VIEW IF EXISTS `blood_recipient_samebgrp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `blood_recipient_samebgrp` AS select `blood_donor`.`bd_name` AS `bd_name`,`recipient`.`reci_name` AS `reci_name`,`recording_staff`.`reco_Name` AS `reco_Name` from ((`recording_staff` join `blood_donor` on((`recording_staff`.`reco_ID` = `blood_donor`.`reco_ID`))) join `recipient` on((`recording_staff`.`reco_ID` = `recipient`.`reco_ID`))) where ((`blood_donor`.`bd_Bgroup` = `recipient`.`reci_Brgp`) and (`blood_donor`.`bd_reg_date` = `recipient`.`reci_reg_date`)) */;
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

-- Dump completed on 2023-05-28  0:14:51
