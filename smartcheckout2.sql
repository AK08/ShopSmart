-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: smartcheckout
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` date NOT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`admin`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (101,'Joel B Koshy','joelbkoshy@gmail.com','Joel@123','2001-04-14',8330829907);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  CONSTRAINT `check_name_chars` CHECK (`cat_name` regexp '^[a-zA-Z0-9 ]+$')
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (298,'Fashion'),(299,'Watches'),(300,'Books'),(301,'Furniture'),(302,'Fitness'),(303,'Home'),(304,'Kitchen'),(311,'Electronics'),(312,'FASHION');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER delete_category
BEFORE DELETE ON category
FOR EACH ROW
BEGIN
CALL delete_products_by_category(OLD.cat_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(30) NOT NULL,
  `cemail` varchar(35) NOT NULL,
  `cpass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cphone` bigint(20) DEFAULT NULL,
  `gender` varchar(7) NOT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cphone` (`cphone`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (140,'Joel B Koshy','joelbkoshy@gmail.com','Joel@123',8330829907,'Male','2001-04-14'),(147,'Raison P Sabu','raisonpsabu@gmail.com','Raison@123',8330829909,'Female','2001-04-02'),(148,'Ben George','bengeorge@gmail.com','ben@123',8990912311,'male','2004-06-10');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `overall` varchar(30) NOT NULL,
  `offer` varchar(30) NOT NULL,
  `user_friendly` varchar(30) NOT NULL,
  `support` varchar(30) NOT NULL,
  `recommend` varchar(30) NOT NULL,
  `expectation` text NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (3,'VGood','Good','Good','Good','Good','Till now its good!'),(4,'VGood','Fair','Good','VGood','Good','Good'),(5,'Fair','Good','VGood','Fair','Poor','Expecting a real-time chatbot to clear our queries.'),(6,'VGood','Good','VGood','Good','VGood','Make a chatbot!!'),(7,'VGood','Fair','Good','Poor','VPoor','Expecting more from the organization'),(8,'Good','Good','Fair','Fair','Fair','Nice');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `total_pay` float NOT NULL,
  `vc_id` int(11) NOT NULL,
  `pay_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (319,140,400,120,'2023-04-17 19:02:45'),(320,147,900,121,'2023-04-17 19:02:50'),(321,140,4600,122,'2023-04-17 19:02:55'),(322,140,200,123,'2023-04-17 19:02:57'),(323,140,1999,124,'2023-04-17 19:02:58'),(324,147,1399,126,'2023-04-17 19:03:00'),(325,140,49,120,'2023-04-17 19:51:25'),(326,140,5849,50,'2023-04-20 11:20:40'),(327,140,6089,36,'2023-04-20 11:59:25'),(328,140,6089,84,'2023-04-20 12:36:19'),(329,148,4999,157,'2023-04-20 12:39:28'),(330,148,4999,55,'2023-04-20 12:39:53'),(331,140,1090,45,'2023-04-25 15:30:03'),(332,140,1090,185,'2023-06-30 05:47:07');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(30) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `pimg` varchar(255) NOT NULL,
  `STOCKS` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pname` (`pname`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (15,'Fossil Chronograph Black Men W',299,5849,'Dial Color: Black, Case Shape: Round, Dial Glass Material: Mineral\nBand Color: Brown: Band Material: Leather','             https://m.media-amazon.com/images/I/41NIrnFfXoL.jpg',4),(16,'FastTrack Smart Watch',299,5999,'REFLEX PLAY- SMART WATCH WITH PINK STRAP, AMOLED DISPLAY, HEALTH SUITE, IN-BUILT GAMES, & PERIOD TRACKER','    https://th.bing.com/th/id/R.dbdfe6a6337a58a161c7e3f3e6da7db9?rik=saFv4I8BOnr5rw&riu=http%3a%2f%2fstaticimg.titan.co.in%2fproduction%2fIndia%2fFastrack%2fdetail%2fSWD90059PP01.jpg%3fv%3d2&ehk=Lkc%2fKtjDeT8g7fiLg73DdiFJmL9Uphc606CDeP8TC20%3d&risl=&pid=I',4),(19,'Cockatoo SKP-TP Skipping Rope ',303,49,'Cockatoo skipping rope increases body stamina\nThis jump rope can be used as a cardiovascular workout, similar to jogging or bicycle riding','   https://n3.sdlcdn.com/imgs/a/s/x/Cockatoo-Yellow-Skipping-Rope-SDL139394194-2-49e9d.jpg',8),(20,'Kushuvi 4XL Bean Bag Cover wit',301,1090,'Soft, Comfotable & Relaxable Bean Bag Chair without Beans For Your Desirable Posture And Make You Feel Calm','  https://th.bing.com/th/id/OIP.wuLgPn7m0n3cWfqhXsLeaAHaHa?pid=ImgDet',5),(27,'Apple AirPods (2nd Generation)',311,4999,'RICHER AUDIO EXPERIENCE ΓÇô The Apple-designed H2 chip pushes advanced audio performance even further, resulting in smarter noise cancellation and more immersive sound.','       https://m.media-amazon.com/images/I/61f1YfTkTDL._AC_SX679_.jpg',10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_cart`
--

DROP TABLE IF EXISTS `virtual_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_cart` (
  `vc_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_cart`
--

LOCK TABLES `virtual_cart` WRITE;
/*!40000 ALTER TABLE `virtual_cart` DISABLE KEYS */;
INSERT INTO `virtual_cart` VALUES (120,140,400,2),(120,140,401,2),(121,147,26,3),(122,147,26,3),(120,140,26,3),(123,140,19,1),(124,140,26,3),(126,147,16,5),(120,140,19,1),(50,140,15,2),(36,140,27,2),(36,140,20,2),(84,140,20,2),(84,140,20,2),(84,140,20,2),(84,140,27,2),(157,148,27,2),(55,148,27,2),(91,140,27,2),(45,140,20,2),(185,140,20,2);
/*!40000 ALTER TABLE `virtual_cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-26  8:29:01
