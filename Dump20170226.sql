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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,17,'0000-00-00 00:00:00','DummyData',29000,'이것은 상품설명입니다','http://localhost:5874/images/wolf.png','대전',2),(4,17,'0000-00-00 00:00:00','Cartier 시계',17950000,'Cartier 시계임. 존나비쌈','https://s-media-cache-ak0.pinimg.com/564x/be/78/0a/be780aa748ebd37d007bee877421f85f.jpg','United Kingdom',4),(5,17,'0000-00-00 00:00:00','Wedding Dress',1354000,'Wedding Dress. 존나 예쁨','https://s-media-cache-ak0.pinimg.com/564x/29/30/06/29300696ffd74187c9fcc3b2afe92ef9.jpg','United Kingdom',4),(6,16,'0000-00-00 00:00:00','Pretty Clothes',121000,'Donna Karan New York pencil skirt + gray top, 존나 내취향','https://s-media-cache-ak0.pinimg.com/564x/cd/0d/0a/cd0d0a94d78c09e720d98e2ba1cb46c4.jpg','홍대',4),(7,16,'0000-00-00 00:00:00','Touring Place',99520000,'Glass Skywalking China, 존나 무서움','https://s-media-cache-ak0.pinimg.com/564x/3e/6f/84/3e6f84a6112d5fb1fe2ab9c75225bc3e.jpg','중국',2),(8,17,'0000-00-00 00:00:00','Gwyneth Paltrow',300,'Gwyneth Paltrow, 잘생겼음','https://s-media-cache-ak0.pinimg.com/236x/e1/86/89/e186891790d1b7cf80fc5540d354ceb2.jpg','Iron Mens Girlfriend',3),(9,17,'2017-02-26 01:17:40','샤오미 미밴드 A1',25000,'<p><img alt=\"미밴드에 대한 이미지 검색결과\" src=\"data:image/jpeg;base64,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\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/sdsd4564/9/IMG_5172.jpg\" style=\"height:525px; width:700px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>미밴드 팝니다. 사용한지 3달됐네요. 새로운 기기를 사서 사용하던 기기를 판매합니다</p>\r\n\r\n<p>연락주세요 01099323549</p>\r\n','http://localhost:5874/uploads/sdsd4564/9/IMG_5172.jpg','대전, 한밭대근처',1),(11,16,'2017-02-26 01:32:27','이케아 HELMER 3만 택배거래',30000,'<p><img alt=\"\" src=\"/uploads/goawoagus/11/이케아12.png\" style=\"height:505px; width:704px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>현재 사용중인 이케아 헬머입니다 .택배로 거래할 예정입니다.</p>\r\n\r\n<p>연락주세요 010 9932 3549</p>\r\n','http://localhost:5874/uploads/goawoagus/11/이케아12.png','서울 남가좌동',5);
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
INSERT INTO `sessions` VALUES ('iKejZSrgIjYIoNaVDn1E4cNu8CkrrVYk',1488049334,'{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2017-02-25T19:02:13.846Z\",\"httpOnly\":true,\"path\":\"/\"},\"uid\":16,\"userId\":\"goawoagus\",\"nickname\":\"노홍철\"}'),('s_oXe8qOqdOMSd5uJvnkNa2SEnzBaYHe',1488046757,'{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2017-02-25T18:19:17.138Z\",\"httpOnly\":true,\"path\":\"/\"},\"uid\":16,\"userId\":\"goawoagus\",\"nickname\":\"노홍철\"}');
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

-- Dump completed on 2017-02-26  3:09:56
