-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: crypto
-- ------------------------------------------------------
-- Server version	8.0.27

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

--
-- Table structure for table `cryptolist`
--

DROP TABLE IF EXISTS `cryptolist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cryptolist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cryptolist`
--

LOCK TABLES `cryptolist` WRITE;
/*!40000 ALTER TABLE `cryptolist` DISABLE KEYS */;
INSERT INTO `cryptolist` VALUES (1,'Bitcoin','BTC'),(2,'Ether ','ETH'),(4,'Binance Coin','BNB'),(5,'Tether','USDT'),(6,'Solana','SOL'),(7,'XRP','XRP'),(8,'Cardano ','ADA'),(9,'USD Coin','USDC'),(10,'Terra','LUNA'),(11,'Avalanche','AVAX');
/*!40000 ALTER TABLE `cryptolist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20220408095725','2022-04-08 09:57:33',60),('DoctrineMigrations\\Version20220408100726','2022-04-08 10:07:41',62),('DoctrineMigrations\\Version20220408100852','2022-04-08 10:08:59',34),('DoctrineMigrations\\Version20220408115809','2022-04-08 11:58:18',92);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mycrypto`
--

DROP TABLE IF EXISTS `mycrypto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mycrypto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `crypto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8ED676DDE9571A63` (`crypto_id`),
  CONSTRAINT `FK_8ED676DDE9571A63` FOREIGN KEY (`crypto_id`) REFERENCES `cryptolist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mycrypto`
--

LOCK TABLES `mycrypto` WRITE;
/*!40000 ALTER TABLE `mycrypto` DISABLE KEYS */;
INSERT INTO `mycrypto` VALUES (38,3040.96,1,2),(39,37516.54,2,1),(40,94.25,10,6),(41,2,1,1),(43,1,1,9);
/*!40000 ALTER TABLE `mycrypto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `save`
--

DROP TABLE IF EXISTS `save`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `save` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` varchar(255) NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `save`
--

LOCK TABLES `save` WRITE;
/*!40000 ALTER TABLE `save` DISABLE KEYS */;
INSERT INTO `save` VALUES (10,'2022-04-15',50),(11,'2022-04-16',-300),(12,'2022-04-17',326),(13,'2022-04-18',3091);
/*!40000 ALTER TABLE `save` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-19 11:10:08
