-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: depot_production
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2015-06-09 09:47:04','2015-06-09 09:47:04'),(2,'2015-06-09 10:21:45','2015-06-09 10:21:45'),(7,'2015-06-09 10:31:40','2015-06-09 10:31:40'),(8,'2015-06-09 10:37:16','2015-06-09 10:37:16'),(9,'2015-06-09 10:37:16','2015-06-09 10:37:16'),(10,'2015-06-09 10:42:47','2015-06-09 10:42:47'),(13,'2015-06-09 10:45:30','2015-06-09 10:45:30');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identities`
--

DROP TABLE IF EXISTS `identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_identities_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identities`
--

LOCK TABLES `identities` WRITE;
/*!40000 ALTER TABLE `identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_items`
--

DROP TABLE IF EXISTS `line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT '1',
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_line_items_on_product_id` (`product_id`),
  KEY `index_line_items_on_cart_id` (`cart_id`),
  KEY `index_line_items_on_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_items`
--

LOCK TABLES `line_items` WRITE;
/*!40000 ALTER TABLE `line_items` DISABLE KEYS */;
INSERT INTO `line_items` VALUES (1,2,2,'2015-06-09 10:21:45','2015-06-09 10:21:47',12,NULL),(2,2,NULL,'2015-06-09 10:22:22','2015-06-09 10:22:43',9,1),(3,2,NULL,'2015-06-09 10:23:27','2015-06-09 10:24:04',33,2),(4,1,NULL,'2015-06-09 10:25:08','2015-06-09 10:25:19',3,3),(5,1,NULL,'2015-06-09 10:26:00','2015-06-09 10:26:19',1,4),(6,2,NULL,'2015-06-09 10:26:01','2015-06-09 10:26:19',1,4),(7,2,8,'2015-06-09 10:37:16','2015-06-09 10:37:17',6,NULL),(8,2,9,'2015-06-09 10:37:16','2015-06-09 10:37:16',1,NULL),(9,2,10,'2015-06-09 10:42:47','2015-06-09 10:42:47',1,NULL),(10,2,NULL,'2015-06-09 10:42:48','2015-06-09 10:42:58',6,5),(11,2,NULL,'2015-06-09 10:45:30','2015-06-09 10:45:39',5,6),(12,2,13,'2015-06-09 10:45:30','2015-06-09 10:45:30',1,NULL),(13,2,NULL,'2015-06-09 10:47:07','2015-06-09 10:47:17',4,7),(14,2,NULL,'2015-06-09 10:50:52','2015-06-09 10:51:03',6,8),(15,2,NULL,'2015-06-09 13:16:56','2015-06-09 13:17:11',8,9);
/*!40000 ALTER TABLE `line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `email` varchar(255) DEFAULT NULL,
  `pay_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'asdfsa','asdfasdf','wangbin_62@126.com','Check','2015-06-09 10:22:43','2015-06-09 10:22:43',1),(2,'production','deploy','wangbin_62@126.com','Credit card','2015-06-09 10:24:04','2015-06-09 10:24:04',1),(3,'asdf','asdf','adsf@asd.com','Purchase order','2015-06-09 10:25:19','2015-06-09 10:25:19',1),(4,'1324','dfsgsdfgsdgf','asdf@123.com','Purchase order','2015-06-09 10:26:19','2015-06-09 10:26:19',1),(5,'asdf','asdf','asdf@ads.com','Check','2015-06-09 10:42:58','2015-06-09 10:42:58',1),(6,'asdf','asdf','adsf@adf.com','Check','2015-06-09 10:45:39','2015-06-09 10:45:39',1),(7,'asdf','asdf','asdf@asdf.com','Check','2015-06-09 10:47:17','2015-06-09 10:47:17',1),(8,'asdf','asdf','asdf@asd.com','Check','2015-06-09 10:51:03','2015-06-09 10:51:03',1),(9,'qfasd','asdfasfd','asdf@asdf.com','Check','2015-06-09 13:17:11','2015-06-09 13:17:11',10);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'adsfa','asdfasdf','asd.jpg',12,'2015-06-09 10:10:11','2015-06-09 10:10:11'),(2,'111','111-11111111','111.png',111,'2015-06-09 10:11:57','2015-06-09 10:11:57'),(3,'222','222111-11111111','222.png',21,'2015-06-09 10:11:57','2015-06-09 10:11:57');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salers`
--

DROP TABLE IF EXISTS `salers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_salers_on_email` (`email`),
  UNIQUE KEY `index_salers_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salers`
--

LOCK TABLES `salers` WRITE;
/*!40000 ALTER TABLE `salers` DISABLE KEYS */;
INSERT INTO `salers` VALUES (1,'aaa','aaa@aaa.com','$2a$10$7Qhw.3nDmJyAiBXx3niv8esozQQP.cglApYtGIN4qweH3SrpXCy1K','aaaaaaaaa',NULL,NULL,NULL,4,'2015-06-09 10:43:48','2015-06-09 10:39:28','127.0.0.1','127.0.0.1','2015-06-09 10:08:42','2015-06-09 10:43:48','promopage7.png'),(2,'wangbin','wangbin_62@126.com','$2a$10$dzXGQ0dc1O9VRTRujhsDUOtNuUAmCOUcnyPnR7wo8sx9hXebq4z0.','nimenzao',NULL,NULL,NULL,1,'2015-06-09 10:19:18','2015-06-09 10:19:18','127.0.0.1','127.0.0.1','2015-06-09 10:19:18','2015-06-09 10:19:18','Screenshot_from_2015-06-04_07_55_03.png'),(3,'bbb','bbb@bbb.com','$2a$10$vHWHZgoCu7zQk6SkYJ29HO2.Q4CbUal.57MXzCDWlpcKbGopF3x7a','bbbbbbbbbbb',NULL,NULL,NULL,1,'2015-06-09 10:31:24','2015-06-09 10:31:24','127.0.0.1','127.0.0.1','2015-06-09 10:31:24','2015-06-09 10:31:24',NULL),(4,'ccc','ccc@ccc.com','$2a$10$GxdrkQCxcUCOHcPm8uyNterGcPRQRLB3.ETYxpR5j4XE5TPPoG9.K',' ccccccccc',NULL,NULL,NULL,1,'2015-06-09 10:33:28','2015-06-09 10:33:28','127.0.0.1','127.0.0.1','2015-06-09 10:33:27','2015-06-09 10:33:28',NULL);
/*!40000 ALTER TABLE `salers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150508044531'),('20150509074441'),('20150509082002'),('20150510022148'),('20150512032039'),('20150512032123'),('20150519112556'),('20150520012007'),('20150520151732'),('20150521030959'),('20150521165724'),('20150521175320'),('20150529103108'),('20150530045459'),('20150530072336');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `employee` tinyint(1) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'aaa@aaa.aaa','$2a$10$BJr.xOeHHuWeNim2fapsHe7B4LJmPYSdcAIrpPpik3gl5y/2Xr/s.',NULL,NULL,NULL,8,'2015-06-09 12:44:42','2015-06-09 12:32:11','127.0.0.1','127.0.0.1','2015-06-09 07:56:39','2015-06-09 12:44:42',NULL,NULL,NULL,NULL,NULL,'62ba14201effa5f8287705932c2d6f3599cb71f46c8ace0d8e5f5a01c7b4a317',NULL,'2015-06-09 07:56:39'),(5,'bbb@bbb.bbb','$2a$10$nVLDXTB7.h8MJ0dNmeGHuug8acCJdHGflyNmPMIE9JV15cGpvrU32',NULL,NULL,NULL,2,'2015-06-09 12:43:09','2015-06-09 12:41:30','127.0.0.1','127.0.0.1','2015-06-09 12:40:59','2015-06-09 12:43:09',NULL,NULL,NULL,NULL,NULL,'85d279366dd995b6f595b051b28072f995bbf9c00073481d8f6905c788c5677f',NULL,'2015-06-09 12:40:59'),(6,'bbb@bbb.com','$2a$10$AO0fUlwqQjoXtTB38c3RB.xY8f72M2MYT/xhxfp2YjXrz25rFLOkO',NULL,NULL,NULL,1,'2015-06-09 12:41:54','2015-06-09 12:41:54','127.0.0.1','127.0.0.1','2015-06-09 12:41:52','2015-06-09 12:41:54',NULL,NULL,NULL,NULL,NULL,'ddd3e719a2e0de75994315e4381d536fa22cb2403a0f22ce45334f57e7dfea1c',NULL,'2015-06-09 12:41:52'),(7,'ccc@ccc.ccc','$2a$10$czD0jWOM3iPIpvi3XZ9z8OJZbMBqcYKCO9k6PdvXQz0nLF5lINoGy',NULL,NULL,NULL,1,'2015-06-09 12:43:55','2015-06-09 12:43:55','127.0.0.1','127.0.0.1','2015-06-09 12:43:53','2015-06-09 12:43:55',NULL,NULL,NULL,NULL,NULL,'42a5a6f6bbbaea7f3679558c06507be3fce119f217c07592c09f2f557cc30ce6',NULL,'2015-06-09 12:43:53'),(10,'ddd@ddd.ddd','$2a$10$uxZv4GbxxyT4fBJUVGFpIuXt4vUXLEO4jXl9V.6vrFswB1mYv21kq',NULL,NULL,NULL,1,'2015-06-09 13:03:08','2015-06-09 13:03:08','127.0.0.1','127.0.0.1','2015-06-09 13:02:55','2015-06-09 13:03:08',NULL,NULL,NULL,NULL,NULL,'4c2bb8a5d4f150ad908e76ac859251b7ab78e6f0f0dcf74b8252238d0e73d0d9',NULL,'2015-06-09 13:02:55');
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

-- Dump completed on 2015-06-11 10:37:40
