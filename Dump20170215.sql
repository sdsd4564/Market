-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: market
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'book'),(2,'etc'),(3,'beauty'),(4,'fashion'),(5,'furniture'),(6,'gear');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `seller` int(10) NOT NULL,
  `regdate` datetime NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `price` int(10) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `category` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `seller` (`seller`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`seller`) REFERENCES `user` (`uid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,17,'0000-00-00 00:00:00','DummyData',29000,'이것은 상품설명입니다','http://localhost:5874/images/wolf.png','대전',2),(4,17,'0000-00-00 00:00:00','Cartier 시계',17950000,'Cartier 시계임. 존나비쌈','https://s-media-cache-ak0.pinimg.com/564x/be/78/0a/be780aa748ebd37d007bee877421f85f.jpg','United Kingdom',4),(5,17,'0000-00-00 00:00:00','Wedding Dress',1354000,'Wedding Dress. 존나 예쁨','https://s-media-cache-ak0.pinimg.com/564x/29/30/06/29300696ffd74187c9fcc3b2afe92ef9.jpg','United Kingdom',4),(6,16,'0000-00-00 00:00:00','Pretty Clothes',121000,'Donna Karan New York pencil skirt + gray top, 존나 내취향','https://s-media-cache-ak0.pinimg.com/564x/cd/0d/0a/cd0d0a94d78c09e720d98e2ba1cb46c4.jpg','홍대',4),(7,16,'0000-00-00 00:00:00','Touring Place',99520000,'Glass Skywalking China, 존나 무서움','https://s-media-cache-ak0.pinimg.com/564x/3e/6f/84/3e6f84a6112d5fb1fe2ab9c75225bc3e.jpg','중국',2),(8,17,'0000-00-00 00:00:00','Gwyneth Paltrow',300,'Gwyneth Paltrow, 잘생겼음','https://s-media-cache-ak0.pinimg.com/236x/e1/86/89/e186891790d1b7cf80fc5540d354ceb2.jpg','Iron Mens Girlfriend',3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('-UYPnyt9j05afTXWJe1u9Yn7bE88KxJz',1487094318,'{\"cookie\":{\"originalMaxAge\":3599997,\"expires\":\"2017-02-14T17:45:18.038Z\",\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"sdsd4564\",\"nickname\":\"Encho\"}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signintime`
--

DROP TABLE IF EXISTS `signintime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signintime` (
  `id` int(10) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `signintime_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signintime`
--

LOCK TABLES `signintime` WRITE;
/*!40000 ALTER TABLE `signintime` DISABLE KEYS */;
/*!40000 ALTER TABLE `signintime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `pwd` varchar(64) NOT NULL,
  `salt` varchar(36) NOT NULL,
  `nickname` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL,
  `region` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (16,'goawoagus','b21dcc84a436e5798d0994b60b02600633fc81a60012f01e151d3593d79f0d83','88c76073-3051-4cd4-b901-d970df47649a','노홍철','sdsd4564@naver.com','서울','01075546154','2017-02-01 20:45:28'),(17,'sdsd4564','0728aa93a40efc717b8c0b0fa70070b6b90e7c7ded296ad4036dd97f34489e9e','8e1739d2-6938-4dbf-8888-bf3ec5d4dc40','Encho','sdsd4564@gmail.com','대전','010993223549','2017-02-01 20:59:50');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-15  1:51:07
