-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: vinahouseDB
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.20.04.1

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
-- Table structure for table `admin_logs`
--

drop database vinahouseDB;
create database vinahouseDB;
use vinahouseDB;

DROP TABLE IF EXISTS `admin_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `target_table` varchar(100) DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `details` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `admin_logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_logs`
--

LOCK TABLES `admin_logs` WRITE;
/*!40000 ALTER TABLE `admin_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `idx_artists_search` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'RUM BARACADI',NULL,1,'2025-03-21 08:09:07','2025-03-21 08:09:07'),(2,'THÁI HOÀNG','https://danviet.mediacdn.vn/296231569849192448/2024/11/21/edit-dj-thai-hoang-la-ai-2-17321597455961875560440.jpeg',1,'2025-03-21 08:09:07','2025-05-21 03:28:04'),(3,'VAVH',NULL,1,'2025-03-21 08:09:07','2025-03-21 08:09:07'),(4,'BEE',NULL,1,'2025-03-21 08:09:07','2025-03-21 08:09:07'),(5,'Lou Hoàng','https://photo-resize-zmp3.zadn.vn/w600_r1x1_jpeg/cover/f/c/8/c/fc8cb20289f86c0929c61958e7d0ec9c.jpg',1,'2025-03-21 08:09:07','2025-05-21 04:05:56'),(6,'TBYNZ',NULL,1,'2025-03-21 08:09:07','2025-03-21 08:09:07'),(7,'LEMON_2K',NULL,1,'2025-03-21 08:09:07','2025-03-21 08:09:07'),(8,'Demo2','http:dsa.d',1,'2025-05-23 03:33:14','2025-05-23 03:33:14'),(9,'dsa','dsad',1,'2025-05-23 03:34:06','2025-05-23 03:34:06'),(10,'Chi Dân','https://media-cdn-v2.laodong.vn/storage/newsportal/2024/11/10/1419511/Chidan.jpg',1,'2025-05-23 03:36:34','2025-05-23 03:36:34');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `user_id` int NOT NULL,
  `song_id` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`song_id`),
  KEY `song_id` (`song_id`),
  KEY `idx_favorites_user_id` (`user_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (6,'NHẠC CỔ'),(1,'NHẠC GỖ'),(7,'Nhạc POP'),(2,'NHẠC TRỐI'),(3,'NHẠC TỪNG TỪNG'),(4,'NHẠC VIỆT HOT'),(5,'TIKTOK REMIX');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_song`
--

DROP TABLE IF EXISTS `playlist_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_song` (
  `playlist_id` int NOT NULL,
  `song_id` int NOT NULL,
  `position` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_id`,`song_id`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `playlist_song_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `playlist_song_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_song`
--

LOCK TABLES `playlist_song` WRITE;
/*!40000 ALTER TABLE `playlist_song` DISABLE KEYS */;
INSERT INTO `playlist_song` VALUES (1,1,1,'2025-05-20 09:28:57'),(1,2,2,'2025-05-20 09:28:57'),(1,3,3,'2025-05-20 09:28:57'),(1,4,4,'2025-05-20 09:28:57'),(1,5,5,'2025-05-20 09:28:57'),(1,6,6,'2025-05-20 09:28:57'),(1,7,7,'2025-05-20 09:28:57'),(1,8,8,'2025-05-20 09:28:57'),(1,9,9,'2025-05-20 09:28:57'),(1,10,10,'2025-05-20 09:28:57'),(1,11,11,'2025-05-20 09:28:57'),(1,12,12,'2025-05-20 09:28:57'),(1,13,13,'2025-05-20 09:28:57'),(1,14,14,'2025-05-20 09:28:57'),(1,15,15,'2025-05-20 09:28:57'),(1,16,16,'2025-05-20 09:28:57'),(1,17,17,'2025-05-20 09:28:57'),(2,18,1,'2025-05-20 09:28:57'),(2,19,2,'2025-05-20 09:28:57'),(2,20,3,'2025-05-20 09:28:57'),(2,21,4,'2025-05-20 09:28:57'),(2,22,5,'2025-05-20 09:28:57'),(2,23,6,'2025-05-20 09:28:57'),(2,24,7,'2025-05-20 09:28:57'),(2,25,8,'2025-05-20 09:28:57'),(2,26,9,'2025-05-20 09:28:57'),(2,27,10,'2025-05-20 09:28:57'),(2,28,11,'2025-05-20 09:28:57'),(2,29,12,'2025-05-20 09:28:57'),(2,30,13,'2025-05-20 09:28:57'),(2,31,14,'2025-05-20 09:28:57'),(2,32,15,'2025-05-20 09:28:57'),(2,33,16,'2025-05-20 09:28:57'),(2,34,17,'2025-05-20 09:28:57'),(3,35,1,'2025-05-20 09:28:57'),(3,36,2,'2025-05-20 09:28:57'),(3,37,3,'2025-05-20 09:28:57'),(3,38,4,'2025-05-20 09:28:57'),(3,39,5,'2025-05-20 09:28:57'),(3,40,6,'2025-05-20 09:28:57'),(3,41,7,'2025-05-20 09:28:57'),(3,42,8,'2025-05-20 09:28:57'),(3,43,9,'2025-05-20 09:28:57'),(3,44,10,'2025-05-20 09:28:57'),(3,45,11,'2025-05-20 09:28:57'),(3,46,12,'2025-05-20 09:28:57'),(3,47,13,'2025-05-20 09:28:57'),(3,48,14,'2025-05-20 09:28:57'),(3,49,15,'2025-05-20 09:28:57'),(3,50,16,'2025-05-20 09:28:57'),(3,51,17,'2025-05-20 09:28:57'),(4,52,1,'2025-05-20 09:28:57'),(4,53,2,'2025-05-20 09:28:57'),(4,54,3,'2025-05-20 09:28:57'),(4,55,4,'2025-05-20 09:28:57'),(4,56,5,'2025-05-20 09:28:57'),(4,57,6,'2025-05-20 09:28:57'),(4,58,7,'2025-05-20 09:28:57'),(4,59,8,'2025-05-20 09:28:57'),(4,60,9,'2025-05-20 09:28:57'),(4,61,10,'2025-05-20 09:28:57'),(4,62,11,'2025-05-20 09:28:57'),(4,63,12,'2025-05-20 09:28:57'),(4,64,13,'2025-05-20 09:28:57'),(4,65,14,'2025-05-20 09:28:57'),(4,66,15,'2025-05-20 09:28:57'),(4,67,16,'2025-05-20 09:28:57'),(4,68,17,'2025-05-20 09:28:57'),(5,69,1,'2025-05-20 09:28:57'),(5,70,2,'2025-05-20 09:28:57'),(5,71,3,'2025-05-20 09:28:57'),(5,72,4,'2025-05-20 09:28:57'),(5,73,5,'2025-05-20 09:28:57'),(5,74,6,'2025-05-20 09:28:57'),(5,75,7,'2025-05-20 09:28:57'),(5,76,8,'2025-05-20 09:28:57'),(5,77,9,'2025-05-20 09:28:57'),(5,78,10,'2025-05-20 09:28:57'),(5,79,11,'2025-05-20 09:28:57'),(5,80,12,'2025-05-20 09:28:57'),(5,81,13,'2025-05-20 09:28:57'),(5,82,14,'2025-05-20 09:28:57'),(5,83,15,'2025-05-20 09:28:57'),(5,84,16,'2025-05-20 09:28:57'),(5,85,17,'2025-05-20 09:28:57'),(5,86,18,'2025-05-20 09:28:57'),(6,87,1,'2025-05-20 09:28:57'),(6,88,2,'2025-05-20 09:28:57'),(6,89,3,'2025-05-20 09:28:57'),(6,90,4,'2025-05-20 09:28:57'),(6,91,5,'2025-05-20 09:28:57'),(6,92,6,'2025-05-20 09:28:57'),(6,93,7,'2025-05-20 09:28:57'),(6,94,8,'2025-05-20 09:28:57'),(6,95,9,'2025-05-20 09:28:57'),(6,96,10,'2025-05-20 09:28:57'),(6,97,11,'2025-05-20 09:28:57'),(6,98,12,'2025-05-20 09:28:57'),(6,99,13,'2025-05-20 09:28:57'),(6,100,14,'2025-05-20 09:28:57'),(6,101,15,'2025-05-20 09:28:57'),(6,102,16,'2025-05-20 09:28:57');
/*!40000 ALTER TABLE `playlist_song` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_playlist_count_insert` AFTER INSERT ON `playlist_song` FOR EACH ROW BEGIN
    UPDATE playlists SET song_count = song_count + 1 WHERE id = NEW.playlist_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_playlist_count_delete` AFTER DELETE ON `playlist_song` FOR EACH ROW BEGIN
    UPDATE playlists SET song_count = song_count - 1 WHERE id = OLD.playlist_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT '0',
  `cover_image_url` varchar(255) DEFAULT NULL,
  `song_count` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_playlists_user_id` (`user_id`),
  KEY `idx_playlists_is_public` (`is_public`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,'Nhạc cổ dân hộc ban bay',NULL,1,'https://file.hstatic.net/200000568629/file/nhac-tru-tinh-la-gi-3_aa26bff1875f40b093ca044d5c732719.jpeg',17,'2025-03-21 08:10:59','2025-05-20 09:57:48'),(2,'Nỗi tình yêu bất đầu',NULL,1,'https://file.hstatic.net/200000568629/file/nhac-tru-tinh-la-gi-3_aa26bff1875f40b093ca044d5c732719.jpeg',17,'2025-03-21 08:10:59','2025-05-20 09:57:48'),(3,'nhạc phòng bay 2025',NULL,1,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-lZ_7SHby_T55DIAfvQ-_IoqRUuf5EXIujQ&s',17,'2025-03-21 08:10:59','2025-05-20 09:57:48'),(4,'thiên đường nhạc cổ',NULL,1,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-lZ_7SHby_T55DIAfvQ-_IoqRUuf5EXIujQ&s',17,'2025-03-21 08:10:59','2025-05-20 09:57:48'),(5,'Hơi ức',NULL,1,NULL,18,'2025-03-21 08:10:59','2025-05-20 09:28:57'),(6,'Chặng trai năm ấy',NULL,1,NULL,16,'2025-03-21 08:10:59','2025-05-20 09:28:57');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_artist`
--

DROP TABLE IF EXISTS `song_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_artist` (
  `song_id` int NOT NULL,
  `artist_id` int NOT NULL,
  `role` enum('primary','featured','composer','producer') NOT NULL DEFAULT 'primary',
  PRIMARY KEY (`song_id`,`artist_id`,`role`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `song_artist_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `song_artist_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_artist`
--

LOCK TABLES `song_artist` WRITE;
/*!40000 ALTER TABLE `song_artist` DISABLE KEYS */;
INSERT INTO `song_artist` VALUES (1,1,'primary'),(2,1,'primary'),(3,1,'primary'),(4,1,'primary'),(5,1,'primary'),(6,1,'primary'),(7,1,'primary'),(8,1,'primary'),(9,1,'primary'),(10,1,'primary'),(11,1,'primary'),(12,1,'primary'),(13,1,'primary'),(14,1,'primary'),(15,1,'primary'),(16,1,'primary'),(17,1,'primary'),(18,1,'primary'),(19,1,'primary'),(20,1,'primary'),(103,1,'primary'),(107,1,'primary'),(21,2,'primary'),(22,2,'primary'),(23,2,'primary'),(24,2,'primary'),(25,2,'primary'),(26,2,'primary'),(27,2,'primary'),(28,2,'primary'),(29,2,'primary'),(30,2,'primary'),(31,2,'primary'),(32,2,'primary'),(33,2,'primary'),(34,2,'primary'),(35,2,'primary'),(86,2,'primary'),(36,3,'primary'),(37,3,'primary'),(38,3,'primary'),(39,3,'primary'),(40,3,'primary'),(41,3,'primary'),(42,3,'primary'),(43,3,'primary'),(44,3,'primary'),(45,3,'primary'),(46,3,'primary'),(47,3,'primary'),(48,3,'primary'),(49,3,'primary'),(50,3,'primary'),(51,3,'primary'),(52,3,'primary'),(53,3,'primary'),(54,3,'primary'),(55,3,'primary'),(56,3,'primary'),(57,3,'primary'),(58,3,'primary'),(59,3,'primary'),(60,3,'primary'),(61,3,'primary'),(62,3,'primary'),(63,3,'primary'),(64,3,'primary'),(65,3,'primary'),(66,3,'primary'),(67,3,'primary'),(68,3,'primary'),(69,3,'primary'),(70,3,'primary'),(108,3,'primary'),(112,3,'primary'),(117,3,'primary'),(71,4,'primary'),(72,4,'primary'),(73,4,'primary'),(74,4,'primary'),(75,4,'primary'),(76,4,'primary'),(77,4,'primary'),(78,4,'primary'),(79,4,'primary'),(80,4,'primary'),(81,5,'primary'),(82,5,'primary'),(83,5,'primary'),(84,5,'primary'),(85,5,'primary'),(87,5,'primary'),(88,5,'primary'),(89,5,'primary'),(90,5,'primary'),(91,6,'primary'),(92,6,'primary'),(93,7,'primary'),(94,7,'primary'),(95,7,'primary'),(96,7,'primary'),(97,7,'primary'),(125,8,'primary'),(126,10,'primary');
/*!40000 ALTER TABLE `song_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_genre`
--

DROP TABLE IF EXISTS `song_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_genre` (
  `song_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`song_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `song_genre_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `song_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_genre`
--

LOCK TABLES `song_genre` WRITE;
/*!40000 ALTER TABLE `song_genre` DISABLE KEYS */;
INSERT INTO `song_genre` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(103,1),(107,1),(108,1),(112,1),(117,1),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,3),(36,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,3),(46,3),(47,3),(48,3),(49,3),(50,3),(51,3),(125,3),(52,4),(53,4),(54,4),(55,4),(56,4),(57,4),(58,4),(59,4),(60,4),(61,4),(62,4),(63,4),(64,4),(65,4),(66,4),(67,4),(68,4),(69,5),(70,5),(71,5),(72,5),(73,5),(74,5),(75,5),(76,5),(77,5),(78,5),(79,5),(80,5),(81,5),(82,5),(83,5),(84,5),(85,5),(86,5),(87,6),(88,6),(89,6),(90,6),(91,6),(92,6),(93,6),(94,6),(95,6),(96,6),(97,6),(98,6),(99,6),(100,6),(101,6),(102,6),(126,7);
/*!40000 ALTER TABLE `song_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `song_file_url` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `file_format` varchar(10) DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT '0',
  `is_approved` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_songs_title` (`title`),
  KEY `idx_songs_is_featured` (`is_featured`),
  FULLTEXT KEY `idx_songs_search` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'Cảm giác lúc ấy sẽ ra sao','CamGiacLucAySeRaSao-KyLanLangTu-11590656.mp3','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQyqCICWJo8eeudbRhAoF2kpbn1JsUVz_3Pg&s',282,'MP3',11052,1,1,'2025-03-16 18:48:14','2025-05-21 07:01:37'),(2,'Sai Nguoi Sai Thoi Diem','SaiNguoiSaiThoiDiem-ThanhHungIdol-5333777.mp3','https://photo-resize-zmp3.zadn.vn/w600_r1x1_jpeg/cover/1/3/4/c/134cd70f34f1310e3488d535678320b9.jpg',401,'MP3',15672,1,1,'2025-03-16 18:48:14','2025-05-21 07:02:55'),(3,'TINH EM LA DAI DUONG','C:\\Users\\phung\\Downloads\\TINH EM LA DAI DUONG _ RUM.mp3',NULL,352,'MP3',13777,1,1,'2025-03-16 18:48:14','2025-03-16 18:48:14'),(4,'DEM TRANG TINH YEU','C:\\Users\\phung\\Downloads\\DEM TRANG TINH YEU _ RUMBARCADI FULL.mp3',NULL,364,'MP3',14235,1,1,'2025-03-16 18:48:14','2025-03-16 18:48:14'),(5,'Ngoi Nha Hoa Hong Full','C:\\Users\\phung\\Downloads\\Ngoi Nha Hoa Hong Full - Rum ft NhanCivili HD.mp3',NULL,254,'MP3',9946,1,1,'2025-03-16 18:48:14','2025-03-16 18:48:14'),(6,'TUYET YEU THUONG _ DJ RUMBARCADI Ft LEEDUY REMIX','C:\\Users\\phung\\Downloads\\TUYET YEU THUONG _ DJ RUMBARCADI Ft LEEDUY REMIX.mp3',NULL,331,'MP3',12951,1,1,'2025-03-16 18:48:14','2025-03-16 18:48:14'),(7,'KHI NAO _ RUMBARCADI MIX FULL-1','C:\\Users\\phung\\Downloads\\KHI NAO _ RUMBARCADI MIX FULL-1.mp3',NULL,274,'MP3',10708,1,1,'2025-03-16 18:48:14','2025-03-16 18:48:14'),(8,'MUA TUYET _ RUMBARCADI MIX1','C:\\Users\\phung\\Downloads\\MUA TUYET _ RUMBARCADI MIX1.mp3',NULL,329,'MP3',12865,1,1,'2025-03-16 18:48:14','2025-03-16 18:48:14'),(9,'PHUT BIET LY _ HD JESSICA FULL','C:\\Users\\phung\\Downloads\\PHUT BIET LY _ HD JESSICA FULL.mp3',NULL,316,'MP3',12359,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(10,'NGUOI NAO DO _ RUMBARCADI FT TINBLACKY _ FULL','C:\\Users\\phung\\Downloads\\NGUOI NAO DO _ RUMBARCADI FT TINBLACKY _ FULL.mp3',NULL,272,'MP3',10652,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(11,'XUAN LY _ TINH VE NOI DAU _ DJ RUMBARCADI MIX FULL','C:\\Users\\phung\\Downloads\\XUAN LY _ TINH VE NOI DAU _ DJ RUMBARCADI MIX FULL.mp3',NULL,337,'MP3',13194,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(12,'Dung Co Yeu - Rumbarcadi Ft Bionic','C:\\Users\\phung\\Downloads\\Khac Viet - Dung Co Yeu - Rumbarcadi Ft Bionic Full Mix.mp3',NULL,260,'MP3',10182,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(13,'VI MOT NGUOI _ RUM _ LEEDUY _ BIONIC FULL MIX','C:\\Users\\phung\\Downloads\\VI MOT NGUOI _ RUM _ LEEDUY _ BIONIC FULL MIX.mp3',NULL,293,'MP3',11465,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(14,'LUA DOI _ RUMBARCADI FULL','C:\\Users\\phung\\Downloads\\LUA DOI _ RUMBARCADI FULL.wav',NULL,283,'WAV',48856,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(15,'B - Energy 7 - Cuu Van Kip Khong - Rumbarcadi Remixx Vocal','C:\\Users\\phung\\Downloads\\B - 140 - Cuu Van Kip Khong - Rumbarcadi.mp3',NULL,290,'MP3',11340,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(16,'HO YEU AI MAT ROI _ RUMBARCADI MIXXX','C:\\Users\\phung\\Downloads\\HO YEU AI MAT ROI _ RUMBARCADI MIXXX.mp3',NULL,364,'MP3',14235,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(17,'CO LE A CHUA TUNG _ RUMBARCADI MIXX','C:\\Users\\phung\\Downloads\\CO LE A CHUA TUNG _ RUMBARCADI MIXX.mp3',NULL,348,'MP3',13602,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(18,'Rum - Hoang Mang - Full','C:\\Users\\phung\\Downloads\\Rum - Hoang Mang - Full.mp3',NULL,340,'MP3',13320,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(19,'ANH _ RUMBARCADI MIX','C:\\Users\\phung\\Downloads\\ANH _ RUMBARCADI MIX.mp3',NULL,371,'MP3',14528,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(20,'Ho Quang Hieu - Nguyen Dinh Vu - Con Buom Xuan - DJ Rumbarcadi ft Leeduy Remix','Ho Quang Hieu - Nguyen Dinh Vu - Con Buom Xuan - DJ Rumbarcadi ft Leeduy Remix',NULL,270,'MP3',11408,1,1,'2025-03-17 02:43:52','2025-03-17 02:43:52'),(21,'HÀ NHI-DĨ VÃNG NHẠT NHOÀ (KHANG CHJVAS REMIX)','C:\\Users\\phung\\Downloads\\HÀ NHI-DĨ VÃNG NHẠT NHOÀ (KHANG CHJVAS REMIX).mp3',NULL,327,'MP3',12804,1,1,'2025-03-17 05:21:00','2025-03-17 05:21:00'),(22,'Alan Walker-Faded( Ranji Remake+Intro)','C:\\Users\\phung\\Downloads\\Alan Walker-Faded( Ranji Remake+Intro).wav',NULL,414,'WAV',71398,1,1,'2025-03-17 05:21:00','2025-03-17 05:21:00'),(23,'GMT','C:\\Users\\phung\\Downloads\\GMT (2).mp3',NULL,337,'MP3',13169,1,1,'2025-03-17 05:21:00','2025-03-17 05:21:00'),(24,'I Need Your Love 2020 (TH Mix)','C:\\Users\\phung\\Downloads\\I Need Your Love 2020 (TH Mix).mp3',NULL,369,'MP3',14779,1,1,'2025-03-17 05:21:00','2025-03-17 05:21:00'),(25,'You 2021 - Thai Hoang Rmx','C:\\Users\\phung\\Downloads\\You 2021 - Thai Hoang Rmx.mp3',NULL,338,'MP3',5292,1,1,'2025-03-17 05:21:00','2025-03-17 05:21:00'),(26,'Khong Dau Vi Qua Dau - TH','C:\\Users\\phung\\Downloads\\Khong Dau Vi Qua Dau - TH.mp3',NULL,358,'MP3',14382,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(27,'Tinh Nong Ft Ngon Nen Truoc Gio - Thai Hoang','C:\\Users\\phung\\Downloads\\Tinh Nong Ft Ngon Nen Truoc Gio - Thai Hoang.mp3',NULL,379,'MP3',16062,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(28,'Bara Bara Bere Bere - Thai Hoang Remix','C:\\Users\\phung\\Downloads\\Bara Bara Bere Bere - Thai Hoang Remix.mp3',NULL,289,'MP3',9607,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(29,'1977 Vlog - Thai Hoang Remix FULL','C:\\Users\\phung\\Downloads\\1977 Vlog - Thai Hoang Remix FULL.mp3',NULL,329,'MP3',10864,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(30,'China Mix - Tay Trai Chi Trang - Thai Hoang Remix Full','C:\\Users\\phung\\Downloads\\China Mix - Tay Trai Chi Trang - Thai Hoang Remix Full.wav',NULL,314,'WAV',59061,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(31,'DUY MANH - VẪN MÃI YÊU EM - THÁI HOÀNG REMIX','C:\\Users\\phung\\Downloads\\DUY MANH - VẪN MÃI YÊU EM - THÁI HOÀNG REMIX.wav',NULL,320,'WAV',60001,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(32,'City Of Dreams - Thái Hoàng Remix FULL','C:\\Users\\phung\\Downloads\\City Of Dreams - Thái Hoàng Remix FULL.mp3',NULL,313,'MP3',10246,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(33,'Song Xa Anh Ft Lan Cuoi - ThaiHoang (Trung Hoang)','C:\\Users\\phung\\Downloads\\Song Xa Anh Ft Lan Cuoi - ThaiHoang (Trung Hoang).mp3',NULL,325,'MP3',12707,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(34,'Hanh Phuc Do Em Khong Co (Version 2) - Thang Kanta X Thai Hoang Remix','C:\\Users\\phung\\Downloads\\Hanh Phuc Do Em Khong Co (Version 2) - Thang Kanta X Thai Hoang Remix.mp3',NULL,332,'MP3',13424,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(35,'Than Thoai (DJ Thai Hoang Remix)','C:\\Users\\phung\\Downloads\\Than Thoai (DJ Thai Hoang Remix).mp3',NULL,363,'MP3',14251,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(36,'Super Bomb','C:\\Users\\phung\\Downloads\\(DOC) Super Bomb - Thang Kanta X Dat Myn Remix.mp3',NULL,261,'MP3',10630,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(37,'Dong Thoi Gian - VAVH','C:\\Users\\phung\\Downloads\\Dong Thoi Gian - VAVH.mp3',NULL,300,'MP3',11721,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(38,'10A - CHAY VE KHOC VOI ANH 2022- VAVH HD Tiddy','C:\\Users\\phung\\Downloads\\10A - CHAY VE KHOC VOI ANH 2022- VAVH HD Tiddy.mp3',NULL,325,'MP3',12728,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(39,'I Love My People - VAVH','C:\\Users\\phung\\Downloads\\I Love My People - VAVH.mp3',NULL,285,'MP3',11163,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(40,'Amore Mio - VAVH','C:\\Users\\phung\\Downloads\\Amore Mio - VAVH.mp3',NULL,356,'MP3',13994,1,1,'2025-03-17 11:52:37','2025-03-17 11:52:37'),(41,'KẸO FT A KO BIET DAU','C:\\Users\\phung\\Downloads\\KẸO FT A KO BIET DAU- VAVH .mp3',NULL,257,'MP3',10066,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(42,'VAVH - FEEL 2024 - REMIX','C:\\Users\\phung\\Downloads\\VAVH - FEEL 2024 - REMIX.mp3',NULL,285,'MP3',11168,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(43,'VAVH - NEXT LEVEL - REMIX','C:\\Users\\phung\\Downloads\\VAVH - NEXT LEVEL - REMIX.mp3',NULL,284,'MP3',11030,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(44,'Hen Gap Em Duoi Anh Trang (GLG Remix)','C:\\Users\\phung\\Downloads\\Hen Gap Em Duoi Anh Trang (GLG Remix).mp3',NULL,238,'MP3',9354,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(45,'Juicce, Ishimaru - Tek Tek Tek (Extended Mix)','C:\\Users\\phung\\Downloads\\Juicce, Ishimaru - Tek Tek Tek (Extended Mix).wav',NULL,247,'WAV',42616,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(46,'From Space & Reaction - Cabide OFICIAL 16bit','C:\\Users\\phung\\Downloads\\From Space & Reaction - Cabide OFICIAL 16bit.wav',NULL,278,'WAV',52138,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(47,'HƯƠNG NGỌC LAN - VAVH REMIX','C:\\Users\\phung\\Downloads\\HƯƠNG NGỌC LAN - VAVH REMIX.mp3',NULL,288,'MP3',11256,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(48,'Bye Baby Bye bye 2021 - Quan Rapper ft Vavh (1)','C:\\Users\\phung\\Downloads\\Bye Baby Bye bye 2021 - Quan Rapper ft Vavh (1).mp3',NULL,340,'MP3',13310,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(49,'Sao em no vay 2021 - VAVH','C:\\Users\\phung\\Downloads\\Sao em no vay 2021 - VAVH.mp3',NULL,333,'MP3',13029,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(50,'DJ Got Us Fallin\' In Love - VAVH','C:\\Users\\phung\\Downloads\\DJ Got Us Fallin\' In Love - VAVH.mp3',NULL,308,'MP3',12056,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(51,'STEREO LOVE - VAVH HD','C:\\Users\\phung\\Downloads\\STEREO LOVE - VAVH HD.mp3',NULL,287,'MP3',11231,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(52,'RUN TO YOU 2 - VAVH','C:\\Users\\phung\\Downloads\\RUN TO YOU 2 - VAVH.mp3',NULL,263,'MP3',10276,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(53,'I Like To Move It - VAVH','C:\\Users\\phung\\Downloads\\I Like To Move It - VAVH.mp3',NULL,260,'MP3',9412,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(54,'Drive By - VAVH','C:\\Users\\phung\\Downloads\\Drive By - VAVH.mp3',NULL,296,'MP3',11587,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(55,'Ghostly & Zai Hư - VAVH HD','C:\\Users\\phung\\Downloads\\Ghostly & Zai Hư - VAVH HD.mp3',NULL,321,'MP3',12571,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(56,'Thiên Đường Vắng Em - VAVH','C:\\Users\\phung\\Downloads\\Thiên Đường Vắng Em - VAVH.mp3',NULL,322,'MP3',12584,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(57,'She Got It - VAVH Remix','C:\\Users\\phung\\Downloads\\She Got It - VAVH Remix.mp3',NULL,308,'MP3',12033,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(58,'Nhu Vay Nhe - VAVH HD LinhLee','C:\\Users\\phung\\Downloads\\Nhu Vay Nhe - VAVH HD LinhLee.mp3',NULL,342,'MP3',13372,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(59,'Nắm Lấy Tay Anh - VAVH','C:\\Users\\phung\\Downloads\\Nắm Lấy Tay Anh - VAVH.mp3',NULL,342,'MP3',13396,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(60,'I WANT IT THAT WAY - VAVH (1)','C:\\Users\\phung\\Downloads\\I WANT IT THAT WAY - VAVH (1).mp3',NULL,343,'MP3',13417,1,1,'2025-03-19 15:43:58','2025-03-19 15:43:58'),(61,'CHAN TINH 2021 - VAVH FULL','C:\\Users\\phung\\Downloads\\CHAN TINH 2021 - VAVH FULL.mp3',NULL,337,'MP3',13197,1,1,'2025-03-19 16:04:52','2025-03-19 16:04:52'),(62,'Destination - VAVH','C:\\Users\\phung\\Downloads\\Destination - VAVH.mp3',NULL,267,'MP3',10444,1,1,'2025-03-19 16:04:52','2025-03-19 16:04:52'),(63,'Set fire to the rain 2021 - VAVH Remix','C:\\Users\\phung\\Downloads\\Set fire to the rain 2021 - VAVH Remix.wav',NULL,312,'WAV',60217,1,1,'2025-03-19 16:04:52','2025-03-19 16:04:52'),(64,'Love Me Or Hate Me - VAVH','C:\\Users\\phung\\Downloads\\Love Me Or Hate Me - VAVH.mp3',NULL,276,'MP3',10788,1,1,'2025-03-19 16:04:52','2025-03-19 16:04:52'),(65,'Chicken 2021 - VAVH','C:\\Users\\phung\\Downloads\\Chicken 2021 - VAVH.mp3',NULL,253,'MP3',9907,1,1,'2025-03-19 16:04:52','2025-03-19 16:04:52'),(66,'Sweet but Psycho - VaVh Remix','C:\\Users\\phung\\Downloads\\Sweet but Psycho - VaVh Remix.mp3',NULL,257,'MP3',10059,1,1,'2025-03-19 16:04:52','2025-03-19 16:04:52'),(67,'Rise Up 2020 - VAVH','C:\\Users\\phung\\Downloads\\Rise Up 2020 - VAVH.mp3',NULL,264,'MP3',10333,1,1,'2025-03-19 16:04:52','2025-03-19 16:04:52'),(68,'Outside - VAVH','C:\\Users\\phung\\Downloads\\Outside - VAVH.mp3',NULL,304,'MP3',11895,1,1,'2025-03-19 16:04:52','2025-03-19 16:04:52'),(69,'MAGIC TOUCH 2019 - VAVH','C:\\Users\\phung\\Downloads\\MAGIC TOUCH 2019 - VAVH.mp3',NULL,311,'MP3',12158,1,1,'2025-03-19 16:04:52','2025-03-19 16:04:52'),(70,'I Say Yeah - VAVH','C:\\Users\\phung\\Downloads\\I Say Yeah - VAVH.mp3',NULL,298,'MP3',11655,1,1,'2025-03-19 16:04:52','2025-03-19 16:04:52'),(71,'NUMA MUMA - BEE Remix','C:\\Users\\phung\\Downloads\\NUMA MUMA - BEE Remix.mp3',NULL,365,'MP3',14267,1,1,'2025-03-19 16:39:13','2025-03-19 16:39:13'),(72,'Find Your Self - Bee','C:\\Users\\phung\\Downloads\\Find Your Self - Bee.mp3',NULL,309,'MP3',12107,1,1,'2025-03-19 16:39:13','2025-03-19 16:39:13'),(73,'XIANG XIANG - BEE REMIX','C:\\Users\\phung\\Downloads\\XIANG XIANG - BEE REMIX.mp3',NULL,322,'MP3',12581,1,1,'2025-03-19 16:39:13','2025-03-19 16:39:13'),(74,'My Neck My Back - BEE Remix','C:\\Users\\phung\\Downloads\\My Neck My Back - BEE Remix.mp3',NULL,313,'MP3',12262,1,1,'2025-03-19 16:39:13','2025-03-19 16:39:13'),(75,'Relax 2020 - Bee Remix','C:\\Users\\phung\\Downloads\\Relax 2020 - Bee Remix.mp3',NULL,281,'MP3',10985,1,1,'2025-03-19 16:39:13','2025-03-19 16:39:13'),(76,'Take Me To Your Heart - Dj Bee 2','C:\\Users\\phung\\Downloads\\Take Me To Your Heart - Dj Bee 2.mp3',NULL,341,'MP3',13328,1,1,'2025-03-19 16:39:13','2025-03-19 16:39:13'),(77,'No More Goodbye - Bee remix','C:\\Users\\phung\\Downloads\\No More Goodbye - Bee remix.mp3',NULL,354,'MP3',13894,1,1,'2025-03-19 16:39:13','2025-03-19 16:39:13'),(78,'Anh Trang Tinh Ai - Bee','C:\\Users\\phung\\Downloads\\Anh Trang Tinh Ai - Bee.mp3',NULL,306,'MP3',11989,1,1,'2025-03-19 16:39:13','2025-03-19 16:39:13'),(79,'Tinh Dep Den May Cung Tan - Dj Bee','C:\\Users\\phung\\Downloads\\Tinh Dep Den May Cung Tan - Dj Bee.mp3',NULL,257,'MP3',10054,1,1,'2025-03-19 16:39:13','2025-03-19 16:39:13'),(80,'GỬI NGÀN LỜI YÊU - DJ BEE REMIX','C:\\Users\\phung\\Downloads\\GỬI NGÀN LỜI YÊU - DJ BEE REMIX.mp3',NULL,335,'MP3',13100,1,1,'2025-03-19 16:39:13','2025-03-19 16:39:13'),(81,'Không Nên Vấn Vương - JET Remix','C:\\Users\\phung\\Downloads\\Không Nên Vấn Vương - JET Remix.mp3',NULL,393,'MP3',15356,1,1,'2025-03-20 09:01:43','2025-03-20 09:01:43'),(82,'Bao Ngoc - Tình Khúc Vàng - Jet Remix','C:\\Users\\phung\\Downloads\\Bao Ngoc - Tình Khúc Vàng - Jet Remix.mp3',NULL,334,'MP3',13049,1,1,'2025-03-20 09:01:43','2025-03-20 09:01:43'),(83,'Noo - Quen - JET Remix','C:\\Users\\phung\\Downloads\\Noo - Quen - JET Remix.mp3',NULL,294,'MP3',11491,1,1,'2025-03-20 09:01:43','2025-03-20 09:01:43'),(84,'Toan Yo - Con Mua Bang Gia - JET Remix (full)','C:\\Users\\phung\\Downloads\\Toan Yo - Con Mua Bang Gia - JET Remix (full).mp3',NULL,320,'MP3',10324,1,1,'2025-03-20 09:01:43','2025-03-20 09:01:43'),(85,'NGAY MAI K CON NHO - JET','C:\\Users\\phung\\Downloads\\NGAY MAI K CON NHO - JET.mp3',NULL,316,'MP3',12350,1,1,'2025-03-20 09:01:43','2025-03-20 09:01:43'),(86,'E - READY TO FLY JET REMIX','C:\\Users\\phung\\Downloads\\E - READY TO FLY JET REMIX.mp3',NULL,282,'MP3',11050,1,1,'2025-03-20 09:01:43','2025-03-20 09:01:43'),(87,'Cảm giác lúc ấy sẽ ra sao','CamGiacLucAySeRaSao-KyLanLangTu-11590656.mp3','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQyqCICWJo8eeudbRhAoF2kpbn1JsUVz_3Pg&s',348,'MP3',13616,1,1,'2025-03-20 09:01:43','2025-05-21 04:04:55'),(88,'Khac Viet - Sau bao năm - JET Remix','C:\\Users\\phung\\Downloads\\Khac Viet - Sau bao năm - JET Remix.mp3',NULL,361,'MP3',14134,1,1,'2025-03-20 09:01:43','2025-03-20 09:01:43'),(89,'Sugar Daddy HD Jet','C:\\Users\\phung\\Downloads\\Sugar Daddy HD Jet.wav',NULL,294,'WAV',50769,1,1,'2025-03-20 09:01:43','2025-03-20 09:01:43'),(90,'WHY - JET HD','C:\\Users\\phung\\Downloads\\WHY - JET HD.mp3',NULL,325,'MP3',12713,1,1,'2025-03-20 09:01:43','2025-03-20 09:01:43'),(91,'Timebomb - T-Bynz Remix (1)','C:\\Users\\phung\\Downloads\\Timebomb - T-Bynz Remix (1).mp3',NULL,315,'MP3',13567,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(92,'Make It Bum Style - T.Bynz','C:\\Users\\phung\\Downloads\\Make It Bum Style - T.Bynz.mp3',NULL,343,'MP3',13424,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(93,'Hom Qua Toi Da Khoc','C:\\Users\\phung\\Downloads\\Hom Qua Toi Da Khoc.mp3',NULL,329,'MP3',12872,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(94,'All My People - Lemon2k','C:\\Users\\phung\\Downloads\\All My People - Lemon2k .mp3',NULL,333,'MP3',13025,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(95,'Ana','C:\\Users\\phung\\Downloads\\Ana.mp3',NULL,278,'MP3',10862,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(96,'LEMON2K - STRONGER 2023 V2','C:\\Users\\phung\\Downloads\\LEMON2K - STRONGER 2023 V2.mp3',NULL,301,'MP3',11788,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(97,'Lao nhao','C:\\Users\\phung\\Downloads\\Lao nhao.mp3',NULL,300,'MP3',11721,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(98,'Battle Forte (Tiktok Remix)','C:\\Users\\phung\\Downloads\\BattleForteTiktokRemix-Lollipop-6037422.mp3',NULL,233,'MP3',3661,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(99,'Sweet Boy (TikTok Remix)','C:\\Users\\phung\\Downloads\\SweetBoyTikTokRemix-VA-5946929.mp3',NULL,162,'MP3',2540,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(100,'Bang Bang Bang (Tiktok Remix)','C:\\Users\\phung\\Downloads\\BangBangBangTiktokRemix-BigBang-6953716.mp3',NULL,195,'MP3',3108,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(101,'Leaving (Tiktok Remix)','C:\\Users\\phung\\Downloads\\LeavingTiktokRemix-VA-7004130.mp3',NULL,157,'MP3',2468,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(102,'Em Ơi Đừng Khóc (TikTok Remix)','C:\\Users\\phung\\Downloads\\EmOiDungKhocTikTokRemix-TangDuyTan-7615590.mp3',NULL,146,'MP3',2301,1,1,'2025-03-20 15:49:08','2025-03-20 15:49:08'),(103,'demo','demo_url','image_url',123,'MP3',2301,0,1,'2025-05-21 01:25:20','2025-05-21 16:00:18'),(104,'DA','dsada','3232',124,'MP3',2301,0,1,'2025-05-21 01:41:20','2025-05-21 16:00:38'),(105,'Demo 1','brain-implant-cyberpunk-sci-fi-trailer-action-intro-330416.mp3','https://i.ytimg.com/vi/WL11bwvAYWI/maxresdefault.jpg',4,'',2031,1,1,'2025-05-21 08:57:51','2025-05-21 16:00:50'),(107,'demo 2','demo_url','image_url',123,'',NULL,0,1,'2025-05-23 02:30:32','2025-05-23 02:30:32'),(108,'demo 2','demo_url','image_url',123,'',NULL,0,1,'2025-05-23 02:31:08','2025-05-23 02:31:08'),(112,'demo 2','demo_url','image_url',123,'',NULL,0,1,'2025-05-23 03:44:22','2025-05-23 03:44:22'),(117,'Sự thật sau một','3213','image_3131url',123,'',NULL,0,1,'2025-05-23 03:45:24','2025-05-23 03:45:24'),(125,'231','3123','321',3123,'',NULL,0,1,'2025-05-23 03:50:32','2025-05-23 03:50:32'),(126,'Sự thật sau một lời hứa','SuThatSauMotLoiHua-ChiDan-3316709.mp3','https://i.scdn.co/image/ab67616d00001e02a590a864d18bb8b9791627d8',4,'',NULL,0,1,'2025-05-23 03:52:06','2025-05-23 03:52:06');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `role` enum('user','artist','admin') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_users_username` (`username`),
  KEY `idx_users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin1','admin1@vinahouse.com','123456','Admin One',NULL,1,'admin','2025-05-20 09:28:57','2025-05-23 09:10:21'),(2,'user0','user1@example.com','password123','Nguyễn Văn A',NULL,1,'user','2025-05-20 09:28:57','2025-05-20 09:28:57'),(3,'user2','user2@example.com','password456','Trần Thị B',NULL,1,'user','2025-05-20 09:28:57','2025-05-20 09:28:57'),(4,'user3','user3@example.com','password789','Lê Văn C',NULL,1,'user','2025-05-20 09:28:57','2025-05-20 09:28:57'),(5,'test','test@gmail.com','123',NULL,NULL,1,'user','2025-05-23 01:44:13','2025-05-23 01:44:13'),(7,'test2','test2@gmail.colm','123456',NULL,NULL,1,'user','2025-05-23 01:49:44','2025-05-23 01:49:44'),(8,'test3','test2@gmail.com','123456',NULL,NULL,1,'user','2025-05-23 01:51:06','2025-05-23 01:51:06'),(9,'admin','admin@gmail.com','123456','Admin  2',NULL,1,'admin','2025-05-20 09:28:57','2025-05-23 09:10:21'),(10,'demo2','demo2@gmail.com','123456',NULL,NULL,1,'user','2025-05-23 02:18:41','2025-05-23 02:18:41'),(11,'demo19@gmail.com','demo19@gmail.com','123456',NULL,NULL,1,'user','2025-05-23 03:53:36','2025-05-23 03:53:36');
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

-- Dump completed on 2025-05-23 17:55:27
