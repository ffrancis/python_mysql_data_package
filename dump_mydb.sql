-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `Amplicons`
--

DROP TABLE IF EXISTS `Amplicons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Amplicons` (
  `Region_name` varchar(50) DEFAULT NULL COMMENT 'Region_name',
  `Amplicon_name` varchar(100) NOT NULL COMMENT 'Amplicon_name: \nChr_no_Start_len_F+Chr_no_Start_len_R',
  `Forward_primer_name` varchar(100) NOT NULL,
  `Reverse_primer_name` varchar(100) NOT NULL,
  `Expected_amplicon_size` mediumint(9) DEFAULT NULL,
  `FA_amplicon_size` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`Amplicon_name`),
  UNIQUE KEY `Forward_primer_UNIQUE` (`Forward_primer_name`),
  UNIQUE KEY `Reverse_primer_UNIQUE` (`Reverse_primer_name`),
  KEY `Region_name_idx` (`Region_name`),
  CONSTRAINT `FK1_Region_name` FOREIGN KEY (`Region_name`) REFERENCES `Loci` (`Region_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Forward_primer_name` FOREIGN KEY (`Forward_primer_name`) REFERENCES `Primers` (`Primer_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Reverse_primer_name` FOREIGN KEY (`Reverse_primer_name`) REFERENCES `Primers` (`Primer_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amplicons`
--

LOCK TABLES `Amplicons` WRITE;
/*!40000 ALTER TABLE `Amplicons` DISABLE KEYS */;
/*!40000 ALTER TABLE `Amplicons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fragment_analyzer_report`
--

DROP TABLE IF EXISTS `Fragment_analyzer_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fragment_analyzer_report` (
  `Amplicon_name` varchar(100) NOT NULL COMMENT 'Amplicon_name: \nChr_no_Start_len_F+Chr_no_Start_len_R',
  `FA_image` mediumblob,
  `FA_mean1` decimal(2,0) unsigned zerofill DEFAULT NULL,
  `FA_mean2` decimal(2,0) unsigned zerofill DEFAULT NULL,
  `FA_mean3` decimal(2,0) unsigned zerofill DEFAULT NULL,
  `FA_notes` longtext,
  PRIMARY KEY (`Amplicon_name`),
  CONSTRAINT `Amplicon_name_1` FOREIGN KEY (`Amplicon_name`) REFERENCES `Amplicons` (`Amplicon_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fragment_analyzer_report`
--

LOCK TABLES `Fragment_analyzer_report` WRITE;
/*!40000 ALTER TABLE `Fragment_analyzer_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fragment_analyzer_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GBrowse`
--

DROP TABLE IF EXISTS `GBrowse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GBrowse` (
  `Region_name` varchar(50) NOT NULL,
  `GBrowse_image` mediumblob,
  PRIMARY KEY (`Region_name`),
  CONSTRAINT `FK3_Region_name` FOREIGN KEY (`Region_name`) REFERENCES `Loci` (`Region_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GBrowse`
--

LOCK TABLES `GBrowse` WRITE;
/*!40000 ALTER TABLE `GBrowse` DISABLE KEYS */;
/*!40000 ALTER TABLE `GBrowse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loci`
--

DROP TABLE IF EXISTS `Loci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Loci` (
  `Region_name` varchar(50) NOT NULL,
  `Chr_no` tinyint(4) NOT NULL,
  `Start` bigint(20) NOT NULL,
  `Stop` bigint(20) NOT NULL,
  `Disease_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loci`
--

LOCK TABLES `Loci` WRITE;
/*!40000 ALTER TABLE `Loci` DISABLE KEYS */;
INSERT INTO `Loci` VALUES ('qMDR_7_128353590_51043',7,128353590,128404632,'MDR'),('qNLB_1_187245104_197947',1,187245104,187443050,'NLB'),('qNLB_1_25377803_22184',1,25377803,25399986,'NLB'),('qSLB_2_36928000_13001',2,36928000,36941000,'SLB'),('qSLB_3_219833000_72001',3,219833000,219905000,'SLB'),('qSLB_3_33490000_24001',3,33490000,33514000,'SLB'),('qSLB_6_7000000_135001',6,7000000,7135000,'SLB'),('qSLB_9_16200311_302962',9,16200311,16503272,'SLB');
/*!40000 ALTER TABLE `Loci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Primers`
--

DROP TABLE IF EXISTS `Primers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Primers` (
  `Primer_name` varchar(100) NOT NULL,
  `Primer_seq` varchar(100) NOT NULL,
  `Tm_Celsius` tinyint(3) unsigned zerofill DEFAULT NULL,
  `Primer_start` bigint(20) NOT NULL,
  `Primer_length` bigint(20) NOT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Primer_name`),
  UNIQUE KEY `Forward_primer_name_UNIQUE` (`Primer_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Primers`
--

LOCK TABLES `Primers` WRITE;
/*!40000 ALTER TABLE `Primers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Primers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transformation_candidates`
--

DROP TABLE IF EXISTS `Transformation_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transformation_candidates` (
  `Gene_id` varchar(45) NOT NULL,
  `Start` bigint(20) NOT NULL,
  `Stop` bigint(20) NOT NULL,
  `Transformation_notes` longtext,
  PRIMARY KEY (`Gene_id`),
  CONSTRAINT `Gene_id` FOREIGN KEY (`Gene_id`) REFERENCES `ZmB73_annotation` (`Gene_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transformation_candidates`
--

LOCK TABLES `Transformation_candidates` WRITE;
/*!40000 ALTER TABLE `Transformation_candidates` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transformation_candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ZmB73_annotation`
--

DROP TABLE IF EXISTS `ZmB73_annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZmB73_annotation` (
  `Gene_id` varchar(45) NOT NULL,
  `Annotation` varchar(45) NOT NULL,
  `Start` bigint(20) NOT NULL,
  `Stop` bigint(20) NOT NULL,
  PRIMARY KEY (`Gene_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ZmB73_annotation`
--

LOCK TABLES `ZmB73_annotation` WRITE;
/*!40000 ALTER TABLE `ZmB73_annotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ZmB73_annotation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-10 18:01:38
