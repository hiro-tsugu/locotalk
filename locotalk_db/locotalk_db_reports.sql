-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: locotalk_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `municipality_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `image_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `municipality_id` (`municipality_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`municipality_id`) REFERENCES `municipalities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (11,1,1,'横浜の夜景がきれいでした','観覧車からの眺めが最高です。',1,'2024-02-01 10:00:00'),(12,2,2,'札幌の雪まつり','大きな雪像に感動しました。',2,'2024-02-02 11:00:00'),(13,3,3,'仙台の牛タン最高','地元グルメに舌鼓。',3,'2024-02-03 12:00:00'),(14,4,4,'名古屋のモーニング文化','喫茶店が楽しい。',NULL,'2024-02-04 13:00:00'),(15,5,5,'大阪のたこ焼き','アツアツでうまい！',4,'2024-02-05 14:00:00'),(16,6,6,'広島のお好み焼き','ボリューム満点。',5,'2024-02-06 15:00:00'),(17,7,7,'福岡の屋台めぐり','にぎやかで活気ありました。',NULL,'2024-02-07 16:00:00'),(18,8,8,'那覇の海が綺麗','エメラルドブルーの海。',6,'2024-02-08 17:00:00'),(19,9,9,'新潟の日本酒が美味しい','蔵元めぐりしました。',7,'2024-02-09 18:00:00'),(20,10,10,'桜島をバックに温泉','鹿児島の自然に癒やされました。',8,'2024-02-10 19:00:00'),(21,1,1,'','',NULL,'2025-04-03 21:12:40'),(22,1,1,'テスト','テストのレポート送信です',22,'2025-04-03 21:14:16'),(23,1,2,'2回目のテスト','テストレポートの送信',23,'2025-04-03 21:21:54'),(24,1,5,'ｙｙｙ￥','おおおお',27,'2025-04-03 22:46:49'),(25,1,5,'たこ','やき',28,'2025-04-03 22:48:02'),(27,1,1,'よこはま','みなとみらい',30,'2025-04-03 23:03:35'),(28,1,1,'よこはま','みなとみらい',31,'2025-04-03 23:03:36'),(30,1,1,'よこはま','みなとみらい',33,'2025-04-03 23:03:38'),(31,1,1,'よこはま','みなとみらい',34,'2025-04-03 23:03:38'),(32,1,1,'よこはま','みなとみらい',35,'2025-04-03 23:03:39'),(33,1,1,'よこはま','みなとみらい',36,'2025-04-03 23:03:39'),(34,1,1,'よこはま','みなとみらい',37,'2025-04-03 23:03:39'),(35,1,1,'よこはま','みなとみらい',38,'2025-04-03 23:03:39'),(36,1,1,'よこはま','みなとみらい',39,'2025-04-03 23:03:39'),(37,1,1,'よこはま','みなとみらい',40,'2025-04-03 23:03:39'),(38,1,1,'よこはま','みなとみらい',41,'2025-04-03 23:03:39'),(45,1,3,'だて','まさむね',48,'2025-04-03 23:04:20'),(46,1,1,'再投稿','みなとみらい２－３－１',49,'2025-04-04 00:38:19'),(47,1,7,'はかた','どんたく',50,'2025-04-04 01:00:50'),(48,1,8,'沖縄の秘密','それは・・・',51,'2025-04-04 01:24:01');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-05  7:37:07
