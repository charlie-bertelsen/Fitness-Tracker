-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fitness_tracker
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
-- Table structure for table `daily_amino_acids`
--

DROP TABLE IF EXISTS `daily_amino_acids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_amino_acids` (
  `user_id` int NOT NULL,
  `entry_date` date NOT NULL,
  `cystine_g` float DEFAULT NULL,
  `histidine_g` float DEFAULT NULL,
  `isoleucine_g` float DEFAULT NULL,
  `leucine_g` float DEFAULT NULL,
  `lysine_g` float DEFAULT NULL,
  `methionine_g` float DEFAULT NULL,
  `phenylalanine_g` float DEFAULT NULL,
  `threonine_g` float DEFAULT NULL,
  `tryptophan_g` float DEFAULT NULL,
  `tyrosine_g` float DEFAULT NULL,
  `valine_g` float DEFAULT NULL,
  PRIMARY KEY (`user_id`,`entry_date`),
  CONSTRAINT `daily_amino_acids_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_amino_acids`
--

LOCK TABLES `daily_amino_acids` WRITE;
/*!40000 ALTER TABLE `daily_amino_acids` DISABLE KEYS */;
INSERT INTO `daily_amino_acids` VALUES (1,'2025-04-23',0.21,0.37,0.49,0.96,0.49,0.24,0.63,0.43,0.14,0.37,0.7),(1,'2025-04-24',0.55,0.69,1.33,2.12,1.8,0.72,1.34,1.17,0.3,0.97,1.52),(1,'2025-04-25',0.96,1.83,2.89,4.88,3.98,1.49,2.86,2.46,0.75,2.11,3.22),(1,'2025-04-26',0.01,0.06,0.02,0.05,0.04,0.01,0.04,0.02,0.01,0.01,0.04),(1,'2025-04-27',1.66,3.41,5.27,9,9.09,2.99,4.75,4.66,0.89,3.72,5.91),(1,'2025-04-28',1.15,2.65,4.37,6.44,6.75,2.28,3.53,3.52,0.99,2.83,4.33);
/*!40000 ALTER TABLE `daily_amino_acids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_minerals`
--

DROP TABLE IF EXISTS `daily_minerals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_minerals` (
  `user_id` int NOT NULL,
  `entry_date` date NOT NULL,
  `calcium_mg` float DEFAULT NULL,
  `copper_mg` float DEFAULT NULL,
  `iron_mg` float DEFAULT NULL,
  `magnesium_mg` float DEFAULT NULL,
  `manganese_mg` float DEFAULT NULL,
  `phosphorus_mg` float DEFAULT NULL,
  `potassium_mg` float DEFAULT NULL,
  `selenium_mcg` float DEFAULT NULL,
  `sodium_mg` float DEFAULT NULL,
  `zinc_mg` float DEFAULT NULL,
  PRIMARY KEY (`user_id`,`entry_date`),
  CONSTRAINT `daily_minerals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_minerals`
--

LOCK TABLES `daily_minerals` WRITE;
/*!40000 ALTER TABLE `daily_minerals` DISABLE KEYS */;
INSERT INTO `daily_minerals` VALUES (1,'2025-04-23',1229.76,0.72,27.46,240.83,3.54,794.15,7369.2,29.15,5066.82,2.83),(1,'2025-04-24',1014.45,0.43,12.63,120.17,0.8,418.46,4257.83,54.6,4751.04,2.71),(1,'2025-04-25',1023.75,0.75,17.44,172.61,2.97,1005.55,2223.05,97.08,4483.16,8.12),(1,'2025-04-26',722.4,0.12,6.8,33.04,0.3,421.96,1667.18,3,595,0.19),(1,'2025-04-27',1026.86,1.17,32.52,191.96,0.62,1484.5,3335.07,175.57,1250.88,23.89),(1,'2025-04-28',968.03,1.23,30.88,386.22,3.41,1441.5,3946.96,96.43,2091.74,11.5);
/*!40000 ALTER TABLE `daily_minerals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_vitamins`
--

DROP TABLE IF EXISTS `daily_vitamins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_vitamins` (
  `user_id` int NOT NULL,
  `entry_date` date NOT NULL,
  `vitamin_a_mcg` float DEFAULT NULL,
  `vitamin_c_mg` float DEFAULT NULL,
  `vitamin_d_iu` float DEFAULT NULL,
  `vitamin_e_mg` float DEFAULT NULL,
  `vitamin_k_mcg` float DEFAULT NULL,
  `folate_mcg` float DEFAULT NULL,
  `b1_mg` float DEFAULT NULL,
  `b2_mg` float DEFAULT NULL,
  `b3_mg` float DEFAULT NULL,
  `b5_mg` float DEFAULT NULL,
  `b6_mg` float DEFAULT NULL,
  `b12_mcg` float DEFAULT NULL,
  PRIMARY KEY (`user_id`,`entry_date`),
  CONSTRAINT `daily_vitamins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_vitamins`
--

LOCK TABLES `daily_vitamins` WRITE;
/*!40000 ALTER TABLE `daily_vitamins` DISABLE KEYS */;
INSERT INTO `daily_vitamins` VALUES (1,'2025-04-23',346.78,298.17,680,1.4,28.86,229.08,0.81,0.68,9.62,2.7,1.02,0.4),(1,'2025-04-24',814.84,324.59,155.12,3.49,11.89,185.81,0.39,1.04,3.35,4.4,1,1.95),(1,'2025-04-25',218,44.6,175.74,4.85,67.68,436.11,1.87,0.99,24.28,4.11,1.47,2.84),(1,'2025-04-26',134.63,14.51,180,0.15,0.12,16.52,0.07,0.3,2.28,0.39,0.25,0.6),(1,'2025-04-27',539,74.98,493.62,5.03,22.52,374.37,1.03,2.22,36.53,7.9,3.26,10.12),(1,'2025-04-28',362.61,75.1,260,5.41,45.81,719.51,1.86,0.92,44.75,5.22,3.02,3.14);
/*!40000 ALTER TABLE `daily_vitamins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heart_rate`
--

DROP TABLE IF EXISTS `heart_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heart_rate` (
  `user_id` int NOT NULL,
  `entry_date` date NOT NULL,
  `resting_hr_bpm` int DEFAULT NULL,
  `max_hr_bpm` int DEFAULT NULL,
  PRIMARY KEY (`user_id`,`entry_date`),
  CONSTRAINT `heart_rate_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heart_rate`
--

LOCK TABLES `heart_rate` WRITE;
/*!40000 ALTER TABLE `heart_rate` DISABLE KEYS */;
INSERT INTO `heart_rate` VALUES (1,'2025-04-24',58,137),(1,'2025-04-25',46,112),(1,'2025-04-26',44,122),(1,'2025-04-27',48,184),(1,'2025-04-28',46,112);
/*!40000 ALTER TABLE `heart_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `primary_nutrition`
--

DROP TABLE IF EXISTS `primary_nutrition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `primary_nutrition` (
  `user_id` int NOT NULL,
  `entry_date` date NOT NULL,
  `calories` float DEFAULT NULL,
  `carbs_g` float DEFAULT NULL,
  `net_carbs_g` float DEFAULT NULL,
  `fiber_g` float DEFAULT NULL,
  `starch_g` float DEFAULT NULL,
  `sugars_g` float DEFAULT NULL,
  `added_sugars_g` float DEFAULT NULL,
  `fat_g` float DEFAULT NULL,
  `saturated_fat_g` float DEFAULT NULL,
  `monounsaturated_fat_g` float DEFAULT NULL,
  `polyunsaturated_fat_g` float DEFAULT NULL,
  `cholesterol_mg` float DEFAULT NULL,
  `protein_g` float DEFAULT NULL,
  `water_g` float DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`entry_date`),
  CONSTRAINT `primary_nutrition_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primary_nutrition`
--

LOCK TABLES `primary_nutrition` WRITE;
/*!40000 ALTER TABLE `primary_nutrition` DISABLE KEYS */;
INSERT INTO `primary_nutrition` VALUES (1,'2025-04-23',3761.47,510.18,448.8,53.29,88.42,173.85,13.9,97.78,30.61,15.48,8.63,340,207.05,691.67,0),(1,'2025-04-24',3363.79,377.36,341.7,27.6,8.7,185.72,30.02,118.75,43.12,22.09,4.74,864.24,197.99,497.27,0),(1,'2025-04-25',3657.05,414.49,391.98,14.37,151.03,138.1,51.98,153.03,43.31,20.17,20.84,316.44,163.54,621.32,0),(1,'2025-04-26',1930.84,176.04,156.02,12.01,4.32,52.17,11,71.14,11.63,3.04,1.09,70,141.27,88.85,0),(1,'2025-04-27',3213.64,223.03,199.24,14.78,59.63,62.64,10,144.44,28.53,34.77,7.27,968.08,256.64,581.12,0),(1,'2025-04-28',2688.67,363.18,324.64,30.45,126.57,108.47,9.79,71.74,19.52,7.57,5.21,254,157.84,759.75,0);
/*!40000 ALTER TABLE `primary_nutrition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `running_workouts`
--

DROP TABLE IF EXISTS `running_workouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `running_workouts` (
  `workout_id` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `distance_miles` float DEFAULT NULL,
  `cadence_avg` int DEFAULT NULL,
  `cadence_max` int DEFAULT NULL,
  `avg_pace` time DEFAULT NULL,
  `best_pace` time DEFAULT NULL,
  `elevation_gain_ft` int DEFAULT NULL,
  `elevation_loss_ft` int DEFAULT NULL,
  `stride_length` float DEFAULT NULL,
  `vertical_ratio` float DEFAULT NULL,
  `vertical_oscillation` float DEFAULT NULL,
  `ground_contact_time_ms` int DEFAULT NULL,
  `avg_gap` time DEFAULT NULL,
  `steps` int DEFAULT NULL,
  PRIMARY KEY (`workout_id`),
  CONSTRAINT `running_workouts_ibfk_1` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`workout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `running_workouts`
--

LOCK TABLES `running_workouts` WRITE;
/*!40000 ALTER TABLE `running_workouts` DISABLE KEYS */;
INSERT INTO `running_workouts` VALUES (4,'Bellingham Running',2.66,141,228,'10:35:00','05:35:00',167,174,1.06,8,8.5,285,'10:14:00',3970);
/*!40000 ALTER TABLE `running_workouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleep`
--

DROP TABLE IF EXISTS `sleep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleep` (
  `user_id` int NOT NULL,
  `entry_date` date NOT NULL,
  `sleep_score` int DEFAULT NULL,
  `resting_heart_rate` int DEFAULT NULL,
  `body_battery` int DEFAULT NULL,
  `respiration_rate` int DEFAULT NULL,
  `hrv_status` int DEFAULT NULL,
  `quality` varchar(20) DEFAULT NULL,
  `duration_min` int DEFAULT NULL,
  `sleep_need_min` int DEFAULT NULL,
  `bedtime` time DEFAULT NULL,
  `wake_time` time DEFAULT NULL,
  PRIMARY KEY (`user_id`,`entry_date`),
  CONSTRAINT `sleep_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleep`
--

LOCK TABLES `sleep` WRITE;
/*!40000 ALTER TABLE `sleep` DISABLE KEYS */;
INSERT INTO `sleep` VALUES (1,'2025-04-25',87,46,69,13,NULL,'Good',446,480,'22:16:00','06:19:00'),(1,'2025-04-26',91,44,73,13,NULL,'Excellent',567,480,'22:20:00','08:07:00'),(1,'2025-04-27',86,48,60,13,NULL,'Good',433,480,'00:44:00','08:17:00'),(1,'2025-04-28',93,46,77,13,90,'Excellent',530,480,'22:39:00','07:41:00'),(1,'2025-04-29',83,48,57,13,87,'Good',457,450,'00:06:00','08:04:00');
/*!40000 ALTER TABLE `sleep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strength_workouts`
--

DROP TABLE IF EXISTS `strength_workouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strength_workouts` (
  `workout_id` int NOT NULL,
  `steps` int DEFAULT NULL,
  `total_reps` int DEFAULT NULL,
  `total_sets` int DEFAULT NULL,
  PRIMARY KEY (`workout_id`),
  CONSTRAINT `strength_workouts_ibfk_1` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`workout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strength_workouts`
--

LOCK TABLES `strength_workouts` WRITE;
/*!40000 ALTER TABLE `strength_workouts` DISABLE KEYS */;
INSERT INTO `strength_workouts` VALUES (5,308,154,15),(6,176,88,11),(7,88,44,6);
/*!40000 ALTER TABLE `strength_workouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stress`
--

DROP TABLE IF EXISTS `stress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stress` (
  `user_id` int NOT NULL,
  `entry_date` date NOT NULL,
  `avg_stress_level` int DEFAULT NULL,
  `rest_minutes` int DEFAULT NULL,
  `low_stress_minutes` int DEFAULT NULL,
  `medium_stress_minutes` int DEFAULT NULL,
  `high_stress_minutes` int DEFAULT NULL,
  PRIMARY KEY (`user_id`,`entry_date`),
  CONSTRAINT `stress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stress`
--

LOCK TABLES `stress` WRITE;
/*!40000 ALTER TABLE `stress` DISABLE KEYS */;
INSERT INTO `stress` VALUES (1,'2025-04-24',11,219,5,NULL,2),(1,'2025-04-25',17,437,157,36,10),(1,'2025-04-26',22,727,262,83,10),(1,'2025-04-27',22,537,53,27,64),(1,'2025-04-28',17,537,110,34,5);
/*!40000 ALTER TABLE `stress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'charlieb','charlie.bertelsen07@gmail.com','2025-04-28 15:14:48');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weight`
--

DROP TABLE IF EXISTS `weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weight` (
  `user_id` int NOT NULL,
  `log_datetime` datetime NOT NULL,
  `weight_kg` float NOT NULL,
  `change_kg` float DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  PRIMARY KEY (`user_id`,`log_datetime`),
  CONSTRAINT `weight_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weight`
--

LOCK TABLES `weight` WRITE;
/*!40000 ALTER TABLE `weight` DISABLE KEYS */;
/*!40000 ALTER TABLE `weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workouts`
--

DROP TABLE IF EXISTS `workouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workouts` (
  `workout_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `workout_date` datetime NOT NULL,
  `activity_type` varchar(50) DEFAULT NULL,
  `calories` int DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `avg_hr` int DEFAULT NULL,
  `max_hr` int DEFAULT NULL,
  `aerobic_te` float DEFAULT NULL,
  PRIMARY KEY (`workout_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `workouts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workouts`
--

LOCK TABLES `workouts` WRITE;
/*!40000 ALTER TABLE `workouts` DISABLE KEYS */;
INSERT INTO `workouts` VALUES (4,1,'2025-04-27 00:00:00','Running',385,'00:28:06',153,192,3.2),(5,1,'2025-04-27 00:00:00','Strength Training',273,'00:42:23',105,140,0.9),(6,1,'2025-04-26 00:00:00','Strength Training',240,'00:36:08',104,153,0.9),(7,1,'2025-04-24 00:00:00','Strength Training',220,'00:26:49',111,153,1.4);
/*!40000 ALTER TABLE `workouts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-29 16:32:02
