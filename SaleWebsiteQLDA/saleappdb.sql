-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: saleappdb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Xiaomi','https://res.cloudinary.com/dsbkju7j9/image/upload/v1721896818/woyfdivhw93netgvaxcr.png'),(2,'Apple','https://res.cloudinary.com/dsbkju7j9/image/upload/v1721896909/y3vneqwuogxdagdop3x4.png'),(3,'Samsung','https://res.cloudinary.com/dsbkju7j9/image/upload/v1721896922/ycdelptnmarfw9laespq.png'),(4,'Oppo','https://res.cloudinary.com/dsbkju7j9/image/upload/v1725959695/fr3rlc6mk02n5va8j9lj.png'),(5,'LG','https://res.cloudinary.com/dsbkju7j9/image/upload/v1721896941/hrckzo1wrxme6hgyqfap.png'),(6,'Sony','https://res.cloudinary.com/dsbkju7j9/image/upload/v1721896952/kgjgsyye4l8jbk4cmyhi.png'),(8,'Acer','https://res.cloudinary.com/dsbkju7j9/image/upload/v1725959665/p07wrmwnnngej5l9t2ws.jpg');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Mobile','Điện thoại di động'),(2,'Phụ kiện','Phụ kiện điện thoại'),(3,'Laptop','Máy tính di động'),(4,'TV','TIVI'),(5,'Äá»ng há»','Äá»ng há» thÃ´ng minh');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forgotpassword`
--

DROP TABLE IF EXISTS `forgotpassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forgotpassword` (
  `id` int NOT NULL AUTO_INCREMENT,
  `otp` int NOT NULL,
  `expirationTime` datetime NOT NULL,
  `user` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forgotpassword`
--

LOCK TABLES `forgotpassword` WRITE;
/*!40000 ALTER TABLE `forgotpassword` DISABLE KEYS */;
INSERT INTO `forgotpassword` VALUES (1,736066,'2024-09-06 23:12:32',1),(2,754487,'2024-09-06 23:15:03',1),(3,571970,'2024-09-06 23:18:48',1),(4,284577,'2024-09-06 23:19:39',1);
/*!40000 ALTER TABLE `forgotpassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1721814864/n2ivvktn9kqvemspxx3k.png',2),(2,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1721814866/mqmm1vxjqcctwmtu8q5n.png',2),(3,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1721822357/pnvs0gncgixdrtbydrkv.png',2),(5,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1721822357/pnvs0gncgixdrtbydrkv.png',11),(15,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1721835919/vprtso9qrrggq1czcayh.png',12),(16,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1721835919/vprtso9qrrggq1czcayh.png',12),(17,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1721836246/y5odmgpm8ax4bhf7sjfa.png',13),(20,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1725960214/rxavjlyiywjuqydnfnsn.png',17),(21,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1725960352/ip1vl2mdhuzibh88qnjg.png',8),(22,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1725960388/hq8u96jpuytwm6gg6egz.png',8);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT '0',
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `sale_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,1,1),(2,2,2,1),(3,1,3,2),(4,2,4,2),(5,1,1,3),(6,2,2,3),(7,1,3,4),(8,2,4,4),(9,1,1,5),(10,2,2,5),(11,1,3,6),(12,2,4,6),(13,1,1,7),(14,2,2,7),(15,1,3,8),(16,2,4,8),(17,1,1,9),(18,2,2,9),(19,1,3,10),(20,2,4,10),(21,1,1,11),(22,2,2,11),(23,1,3,12),(24,2,4,12),(25,1,1,13),(26,2,2,13),(27,1,3,14),(28,2,4,14),(29,1,1,15),(30,2,2,15),(31,1,3,16),(32,2,4,16),(33,1,1,17),(34,2,2,17),(35,1,3,18),(36,2,4,18),(37,1,1,19),(38,2,2,19),(39,1,3,20),(40,2,4,20);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'iPhone 13','Latest Apple smartphone',23000000,'2024-07-22 16:16:26',1,2),(2,'Galaxy S21','Latest Samsung smartphone',19500000,'2024-07-22 16:16:26',1,3),(3,'OPPO A58','4K UHD TV',5490000,'2024-07-22 16:16:26',1,4),(4,'Xiaomi 13T 5G 8GB/256GB','Screen ShareAirPlay 2',13990000,'2024-07-22 16:16:26',1,1),(5,'Smart Tivi LG 4K 55 inch 55UQ8000PSC','4K UHD TV',15000000,'2024-07-22 16:16:26',4,5),(6,'Sony Bravia','4K UHD TV',15000000,'2024-07-22 16:16:26',4,6),(7,'Macbook A','High-performance laptop',33000000,'2024-07-22 16:16:26',3,2),(8,'Tai nghe Bluetooth True Wireless OPPO','Tai nghe Bluetooth 4.1',790000,'2024-09-10 16:24:51',2,4),(9,'Bút cảm ứng Apple Pencil 2 MU8F2','Bút cảm ứng',2500000,'2024-07-22 16:16:26',2,2),(10,'Loa Thanh Samsung HW-B650D/XV 370W','Loa Thanh Samsung',6190000,'2024-07-22 16:16:26',2,3),(11,'Iphone 11 64GB (Likenew 99%)','Iphone đã qua sử dụng',5000000,'2024-07-24 22:37:40',1,2),(12,'Iphone 12 64GB (Likenew 99%)','Iphone đã bóc seal và dùng 1 tháng',690000,'2024-07-24 22:39:24',1,2),(13,'Iphone 11 Promax 64GB (Likenew 99%)','Iphone đã qua sử dụng 1 thời gian nhưng còn mới',7500000,'2024-07-24 22:48:51',1,2),(17,'Laptop Gaming Acer Nitro 5 Version 16GB','Laptop Gaming Acer Nitro 5 Tiger AN515 58 52SP I5-12500H/16GB/512GB PCIE/VGA 4GB RTX3050/15.6',19990000,'2024-09-10 16:23:22',3,8);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `product_tag_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tag`
--

LOCK TABLES `product_tag` WRITE;
/*!40000 ALTER TABLE `product_tag` DISABLE KEYS */;
INSERT INTO `product_tag` VALUES (1,1,1),(2,2,2),(3,3,1),(4,4,2),(5,7,2),(6,8,1),(7,9,1);
/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_CUSTOMER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order`
--

DROP TABLE IF EXISTS `sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sale_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order`
--

LOCK TABLES `sale_order` WRITE;
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
INSERT INTO `sale_order` VALUES (1,'2024-07-22 16:27:45',2),(2,'2024-07-22 16:27:45',3),(3,'2024-07-22 16:27:45',2),(4,'2024-07-22 16:27:45',3),(5,'2024-07-22 16:27:45',2),(6,'2024-07-22 16:27:45',3),(7,'2024-07-22 16:27:45',2),(8,'2024-07-22 16:27:45',3),(9,'2024-07-22 16:27:45',2),(10,'2024-07-22 16:27:45',3),(11,'2024-07-22 16:27:45',2),(12,'2024-07-22 16:27:45',3),(13,'2024-07-22 16:27:45',2),(14,'2024-07-22 16:27:45',3),(15,'2024-07-22 16:27:45',2),(16,'2024-07-22 16:27:45',3),(17,'2024-07-22 16:27:45',2),(18,'2024-07-22 16:27:45',3),(19,'2024-07-22 16:27:45',2),(20,'2024-07-22 16:27:45',3);
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'New Arrival'),(2,'Best Seller');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Trinh T','Hiep','hiep','$2a$12$lmLeox857119Kz6oRzwtbO1WbHhWcKdxx9mBkCVtGVdbTeV2y1z7a','tonghiep25@gmail.com','0383876123','700 Lê Văn Lương Phước Kiển,Nhà Bè TPHCM','2022-05-27 22:17:55','https://res.cloudinary.com/dsbkju7j9/image/upload/v1719163511/bshktjhrrdzspkm7u301.png',1),(2,'Tran','Dat','dat','$2a$12$lmLeox857119Kz6oRzwtbO1WbHhWcKdxx9mBkCVtGVdbTeV2y1z7a','tonghiep21@gmail.com','0383876456','800 Nguyễn Hữu Thọ','2022-05-27 22:17:55','https://res.cloudinary.com/dsbkju7j9/image/upload/v1715327227/BoardingHouse/Image_avt/fly0xp3n6dpveqxh4wpv.jpg',2),(3,'Vo','Nhat','nhat','$2a$12$lmLeox857119Kz6oRzwtbO1WbHhWcKdxx9mBkCVtGVdbTeV2y1z7a','tonghiep666@gmail.com','0383876781','900 Đào Sư Tích','2022-05-27 22:17:55','https://res.cloudinary.com/dsbkju7j9/image/upload/v1715327228/BoardingHouse/Image_avt/iwluu8bmrfben6oryra2.webp',2),(6,'Trịnh','Hiệp','tonghiep','$2a$10$r3d55XcHwU24oeeFkdzT/O52e7g.6cnobTK9shZ1ZwV1nEWc.aHhO','tonghiep22@gmail.com','0383876058','724/44 LÊ VĂN LƯƠNG',NULL,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1726040675/rcjl9crunyjbbaiisav3.png',2),(7,'Trịnh Tông','Hiệp','hiep123','$2a$10$LGz16R8i4l0gj8SBZ/qKP.WzD9u8jLob5192jhCzwz1jPPM6tI/s6','tonghiep221@gmail.com','0383876008','724/44 LÊ VĂN LƯƠNG',NULL,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1726040775/zufkdlunbyplpjd0r7ix.png',2),(8,'Trịnh','Hiệp Tông','abc','$2a$10$QwBVqelU4y3dvYKsxr7/RO1vQeZXfz6teifkyAdflf6e7eSBlP0yi','tonghiep122@gmail.com','0383876018','724/44 LÊ VĂN LƯƠNG',NULL,'https://res.cloudinary.com/dsbkju7j9/image/upload/v1726040837/q23kplrle19dlkajh8dr.jpg',2);
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

-- Dump completed on 2024-09-12 21:06:47
