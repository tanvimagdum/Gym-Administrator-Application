CREATE DATABASE  IF NOT EXISTS `gym_schema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gym_schema`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: gym_schema
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add activity',1,'add_activity'),(2,'Can change activity',1,'change_activity'),(3,'Can delete activity',1,'delete_activity'),(4,'Can view activity',1,'view_activity'),(5,'Can add equipment',2,'add_equipment'),(6,'Can change equipment',2,'change_equipment'),(7,'Can delete equipment',2,'delete_equipment'),(8,'Can view equipment',2,'view_equipment'),(9,'Can add equipment_cleaner',3,'add_equipment_cleaner'),(10,'Can change equipment_cleaner',3,'change_equipment_cleaner'),(11,'Can delete equipment_cleaner',3,'delete_equipment_cleaner'),(12,'Can view equipment_cleaner',3,'view_equipment_cleaner'),(13,'Can add gym',4,'add_gym'),(14,'Can change gym',4,'change_gym'),(15,'Can delete gym',4,'delete_gym'),(16,'Can view gym',4,'view_gym'),(17,'Can add member',5,'add_member'),(18,'Can change member',5,'change_member'),(19,'Can delete member',5,'delete_member'),(20,'Can view member',5,'view_member'),(21,'Can add trainer',6,'add_trainer'),(22,'Can change trainer',6,'change_trainer'),(23,'Can delete trainer',6,'delete_trainer'),(24,'Can view trainer',6,'view_trainer'),(25,'Can add trainer_to_activity',7,'add_trainer_to_activity'),(26,'Can change trainer_to_activity',7,'change_trainer_to_activity'),(27,'Can delete trainer_to_activity',7,'delete_trainer_to_activity'),(28,'Can view trainer_to_activity',7,'view_trainer_to_activity'),(29,'Can add room',8,'add_room'),(30,'Can change room',8,'change_room'),(31,'Can delete room',8,'delete_room'),(32,'Can view room',8,'view_room'),(33,'Can add member_to_activity',9,'add_member_to_activity'),(34,'Can change member_to_activity',9,'change_member_to_activity'),(35,'Can delete member_to_activity',9,'delete_member_to_activity'),(36,'Can view member_to_activity',9,'view_member_to_activity'),(37,'Can add equipment_to_equipment_cleaner',10,'add_equipment_to_equipment_cleaner'),(38,'Can change equipment_to_equipment_cleaner',10,'change_equipment_to_equipment_cleaner'),(39,'Can delete equipment_to_equipment_cleaner',10,'delete_equipment_to_equipment_cleaner'),(40,'Can view equipment_to_equipment_cleaner',10,'view_equipment_to_equipment_cleaner'),(41,'Can add log entry',11,'add_logentry'),(42,'Can change log entry',11,'change_logentry'),(43,'Can delete log entry',11,'delete_logentry'),(44,'Can view log entry',11,'view_logentry'),(45,'Can add permission',12,'add_permission'),(46,'Can change permission',12,'change_permission'),(47,'Can delete permission',12,'delete_permission'),(48,'Can view permission',12,'view_permission'),(49,'Can add group',13,'add_group'),(50,'Can change group',13,'change_group'),(51,'Can delete group',13,'delete_group'),(52,'Can view group',13,'view_group'),(53,'Can add user',14,'add_user'),(54,'Can change user',14,'change_user'),(55,'Can delete user',14,'delete_user'),(56,'Can view user',14,'view_user'),(57,'Can add content type',15,'add_contenttype'),(58,'Can change content type',15,'change_contenttype'),(59,'Can delete content type',15,'delete_contenttype'),(60,'Can view content type',15,'view_contenttype'),(61,'Can add session',16,'add_session'),(62,'Can change session',16,'change_session'),(63,'Can delete session',16,'delete_session'),(64,'Can view session',16,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'admin','logentry'),(13,'auth','group'),(12,'auth','permission'),(14,'auth','user'),(15,'contenttypes','contenttype'),(1,'gym','activity'),(2,'gym','equipment'),(3,'gym','equipment_cleaner'),(10,'gym','equipment_to_equipment_cleaner'),(4,'gym','gym'),(5,'gym','member'),(9,'gym','member_to_activity'),(8,'gym','room'),(6,'gym','trainer'),(7,'gym','trainer_to_activity'),(16,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-12-03 20:21:58.424134'),(2,'auth','0001_initial','2022-12-03 20:21:58.527529'),(3,'admin','0001_initial','2022-12-03 20:21:58.546198'),(4,'admin','0002_logentry_remove_auto_add','2022-12-03 20:21:58.549145'),(5,'admin','0003_logentry_add_action_flag_choices','2022-12-03 20:21:58.551435'),(6,'contenttypes','0002_remove_content_type_name','2022-12-03 20:21:58.563625'),(7,'auth','0002_alter_permission_name_max_length','2022-12-03 20:21:58.572439'),(8,'auth','0003_alter_user_email_max_length','2022-12-03 20:21:58.580908'),(9,'auth','0004_alter_user_username_opts','2022-12-03 20:21:58.583012'),(10,'auth','0005_alter_user_last_login_null','2022-12-03 20:21:58.591940'),(11,'auth','0006_require_contenttypes_0002','2022-12-03 20:21:58.592497'),(12,'auth','0007_alter_validators_add_error_messages','2022-12-03 20:21:58.594680'),(13,'auth','0008_alter_user_username_max_length','2022-12-03 20:21:58.605532'),(14,'auth','0009_alter_user_last_name_max_length','2022-12-03 20:21:58.615431'),(15,'auth','0010_alter_group_name_max_length','2022-12-03 20:21:58.619866'),(16,'auth','0011_update_proxy_permissions','2022-12-03 20:21:58.621927'),(17,'auth','0012_alter_user_first_name_max_length','2022-12-03 20:21:58.631174'),(18,'gym','0001_initial','2022-12-03 20:21:58.758510'),(19,'sessions','0001_initial','2022-12-03 20:21:58.763010'),(20,'gym','0002_remove_activity_gym','2022-12-06 23:18:42.532018'),(21,'gym','0003_alter_equipment_cleaner_cleaner_role','2022-12-09 03:26:04.747775'),(22,'gym','0004_alter_equipment_equipment_brand','2022-12-09 03:26:04.763105');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_activity`
--

DROP TABLE IF EXISTS `gym_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(50) NOT NULL,
  `activity_duration` int NOT NULL,
  `activity_calories_burnt` double NOT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `act_to_room_fk` (`room_id`),
  CONSTRAINT `act_to_room_fk` FOREIGN KEY (`room_id`) REFERENCES `gym_room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_activity`
--

LOCK TABLES `gym_activity` WRITE;
/*!40000 ALTER TABLE `gym_activity` DISABLE KEYS */;
INSERT INTO `gym_activity` VALUES (15,'Deadlifts',5,100,18),(16,'Aerobics',30,120,20),(17,'Squats',20,130,15),(18,'Pull-ups',20,70,15),(19,'Lat pull-ups',20,90,16),(20,'Push-ups',20,140,21);
/*!40000 ALTER TABLE `gym_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_equipment`
--

DROP TABLE IF EXISTS `gym_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_equipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipment_name` varchar(50) NOT NULL,
  `equipment_weight` int NOT NULL,
  `equipment_brand` varchar(120) NOT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eq_to_room_fk` (`room_id`),
  CONSTRAINT `eq_to_room_fk` FOREIGN KEY (`room_id`) REFERENCES `gym_room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_equipment`
--

LOCK TABLES `gym_equipment` WRITE;
/*!40000 ALTER TABLE `gym_equipment` DISABLE KEYS */;
INSERT INTO `gym_equipment` VALUES (16,'Leg Press',120,'Fitbee',15),(17,'Leg Extension',100,'Fitbee',15),(18,'Squat Machine',120,'Fitbee',15),(19,'Leg Extension',100,'Fitbee',19),(20,'Leg Press',120,'Fitbee',19),(21,'Squat Machine',120,'Fitbee',19),(22,'Lat Pulley',130,'AeroFit',16),(23,'Rowing Machine',120,'AeroFit',16),(24,'Shoulder Press',100,'AeroFit',16),(25,'Crunch Machine',125,'AeroFit',17),(26,'Chest Machine',120,'AeroFit',17),(27,'Bar 5lb',5,'Balance',18),(28,'Bar 10lb',10,'Balance',18),(29,'Bar 20lb',20,'Balance',18),(30,'Dumbbells set 2lb',4,'Balance',19),(31,'Dumbbells set 5lb',10,'Balance',19),(32,'Dumbbells set 8lb',16,'Balance',19);
/*!40000 ALTER TABLE `gym_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_equipment_cleaner`
--

DROP TABLE IF EXISTS `gym_equipment_cleaner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_equipment_cleaner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cleaner_name` varchar(50) NOT NULL,
  `cleaner_address` varchar(120) NOT NULL,
  `cleaner_phone` varchar(10) NOT NULL,
  `cleaner_role` varchar(120) NOT NULL,
  `gym_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eqcl_to_gym_fk` (`gym_id`),
  CONSTRAINT `eqcl_to_gym_fk` FOREIGN KEY (`gym_id`) REFERENCES `gym_gym` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_equipment_cleaner`
--

LOCK TABLES `gym_equipment_cleaner` WRITE;
/*!40000 ALTER TABLE `gym_equipment_cleaner` DISABLE KEYS */;
INSERT INTO `gym_equipment_cleaner` VALUES (12,'CLARA HOLMES','Smith Street, Boston','2000000001','Staff Associate',13),(13,'','','','',13),(14,'JATIN PATEL','Dudley Street, Boston','2000000003','Staff Manager',13),(15,'SAM WILSON','Waltham, Boston','2000000004','Staff Associate',14),(16,'FRED TODD','Waltham, Boston','2000000005','Staff Manager',14),(17,'SARAH SMITH','Quincy Main, Boston','2000000006','Staff Manager',15),(18,'JASPER PIXLEY','Wollaston, Boston','2000000007','Assoc. Manager',15),(19,'PERRIE EDWARDS','Chestnut Hill, Boston','2000000008','Staff Manager',16),(20,'SAMSON HILL','Shawmut, Boston','2000000009','Staff Manager',17),(21,'GARY MARTIN','Smith Street, Boston','2000000010','Staff Manager',13);
/*!40000 ALTER TABLE `gym_equipment_cleaner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_equipment_to_equipment_cleaner`
--

DROP TABLE IF EXISTS `gym_equipment_to_equipment_cleaner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_equipment_to_equipment_cleaner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `equipment_id` int NOT NULL,
  `equipment_cleaner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_eq_eqcl_fk1` (`equipment_id`),
  KEY `gym_eq_eqcl_fk2` (`equipment_cleaner_id`),
  CONSTRAINT `gym_eq_eqcl_fk1` FOREIGN KEY (`equipment_id`) REFERENCES `gym_equipment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gym_eq_eqcl_fk2` FOREIGN KEY (`equipment_cleaner_id`) REFERENCES `gym_equipment_cleaner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_equipment_to_equipment_cleaner`
--

LOCK TABLES `gym_equipment_to_equipment_cleaner` WRITE;
/*!40000 ALTER TABLE `gym_equipment_to_equipment_cleaner` DISABLE KEYS */;
/*!40000 ALTER TABLE `gym_equipment_to_equipment_cleaner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_gym`
--

DROP TABLE IF EXISTS `gym_gym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_gym` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gym_name` varchar(50) NOT NULL,
  `gym_address` varchar(120) NOT NULL,
  `gym_phone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gym_name_unique` (`gym_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_gym`
--

LOCK TABLES `gym_gym` WRITE;
/*!40000 ALTER TABLE `gym_gym` DISABLE KEYS */;
INSERT INTO `gym_gym` VALUES (13,'GOLD MARINO GYM CENTRE','Huntington Ave, Boston','8000890009'),(14,'GOLD WELLNESS SOCIETY','Waltham, Boston','7000790009'),(15,'GOLD SYNERGY FITNESS CLUB','Quincy Centre, Boston','9000990009'),(16,'GOLD XTREME STRENGTH CLUB','Chestnut Hill Avenue, Boston','4000490009'),(17,'GOLD 360 MIND AND BODY','Ashmont, Boston','6000690009');
/*!40000 ALTER TABLE `gym_gym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_member`
--

DROP TABLE IF EXISTS `gym_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_name` varchar(50) NOT NULL,
  `member_dob` varchar(10) NOT NULL,
  `member_phone` varchar(10) NOT NULL,
  `member_height` double NOT NULL,
  `member_weight` double NOT NULL,
  `gym_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mem_to_gym_fk` (`gym_id`),
  KEY `mem_to_tr_fk` (`trainer_id`),
  CONSTRAINT `mem_to_gym_fk` FOREIGN KEY (`gym_id`) REFERENCES `gym_gym` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mem_to_tr_fk` FOREIGN KEY (`trainer_id`) REFERENCES `gym_trainer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_member`
--

LOCK TABLES `gym_member` WRITE;
/*!40000 ALTER TABLE `gym_member` DISABLE KEYS */;
INSERT INTO `gym_member` VALUES (19,'JAMES SCOTT','1990-10-11','1000000001',170.10000610351562,65.5999984741211,13,26),(20,'HAILEY WATSON','2001-01-18','1000000002',165.8000030517578,54.900001525878906,13,16),(21,'PETER JACKSON','1989-02-20','1000000003',171.1999969482422,67.4000015258789,13,22),(22,'AMY BROWN ','1994-01-05','1000000004',162.8000030517578,57.79999923706055,13,22),(23,'FRANCISCA MILLER','2000-10-10','1000000005',172.89999389648438,57.29999923706055,15,17),(24,'ABBY RICARDS','2001-05-10','1000000006',169.39999389648438,54.400001525878906,14,23),(25,'AJIT DESHMUKH','1999-01-17','1000000007',170.1999969482422,68.5,16,27),(26,'ALEX LAMBERT','1979-03-15','1000000008',174.60000610351562,65.4000015258789,17,20),(27,'BRUCE BANNER','1989-08-19','1000000009',173.39999389648438,69,16,18),(28,'OLIVIA FLORES','1990-10-15','1000000010',167.3000030517578,54,13,26),(29,'JAMES DOMM','2000-01-01','8888811111',170,57,13,16),(30,'JAMES SCOTT','2000-01-01','8888811111',67,170,13,16);
/*!40000 ALTER TABLE `gym_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_member_to_activity`
--

DROP TABLE IF EXISTS `gym_member_to_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_member_to_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_act_fk` (`member_id`),
  KEY `gym_act_fk2` (`activity_id`),
  CONSTRAINT `gym_act_fk` FOREIGN KEY (`member_id`) REFERENCES `gym_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gym_act_fk2` FOREIGN KEY (`activity_id`) REFERENCES `gym_activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_member_to_activity`
--

LOCK TABLES `gym_member_to_activity` WRITE;
/*!40000 ALTER TABLE `gym_member_to_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `gym_member_to_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_room`
--

DROP TABLE IF EXISTS `gym_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_number` int NOT NULL,
  `room_capacity` int NOT NULL,
  `gym_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_number` (`room_number`),
  KEY `room_to_gym_fk` (`gym_id`),
  CONSTRAINT `room_to_gym_fk` FOREIGN KEY (`gym_id`) REFERENCES `gym_gym` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_room`
--

LOCK TABLES `gym_room` WRITE;
/*!40000 ALTER TABLE `gym_room` DISABLE KEYS */;
INSERT INTO `gym_room` VALUES (15,1,120,13),(16,2,120,13),(17,3,60,13),(18,4,60,14),(19,5,120,15),(20,6,100,14),(21,7,30,17),(22,8,120,16),(23,9,50,16),(24,10,120,15);
/*!40000 ALTER TABLE `gym_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_trainer`
--

DROP TABLE IF EXISTS `gym_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_trainer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trainer_name` varchar(50) NOT NULL,
  `trainer_address` varchar(120) NOT NULL,
  `trainer_phone` varchar(10) NOT NULL,
  `trainer_working_hours` double NOT NULL,
  `gym_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_to_gym_fk` (`gym_id`),
  CONSTRAINT `tr_to_gym_fk` FOREIGN KEY (`gym_id`) REFERENCES `gym_gym` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_trainer`
--

LOCK TABLES `gym_trainer` WRITE;
/*!40000 ALTER TABLE `gym_trainer` DISABLE KEYS */;
INSERT INTO `gym_trainer` VALUES (16,'KELLY JACOBS','Huntington','1111122222',6.5,13),(17,'SARAH LIVELY','Wollaston, Boston','4444422222',3.25,15),(18,'KARAN MENON','Allston, Boston','4444455555',7,16),(19,'MARC JONES','BELMONT, Boston','4444477777',4.5,14),(20,'CARLOS GARCIA','Shawmut, Boston','9999977777',6.5,17),(21,'JIM WILSON','Chestnut Hill, Boston','9999988888',6.5,16),(22,'MANPREET SINGH','Mission Main, Boston','9999900000',6.5,13),(23,'YING LI','Waltham, Boston','9999911111',5.5,14),(24,'RAMIRO SANCHEZ','Quincy Adams, Boston','6666611111',5,15),(25,'IMRAN WAHID','Cedar Grove, Boston','5555511111',5,17),(26,'EMILY CLARK','Park Drive, Boston','5555588888',5,13),(27,'SIA BAKER','Brighton, Boston','3333388888',5,16),(28,'Marc Gray','Shawmut, Boston','3333366666',5,17),(29,'Sierra Ruiz','Central Avenue, Boston','3333322222',5,17);
/*!40000 ALTER TABLE `gym_trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_trainer_to_activity`
--

DROP TABLE IF EXISTS `gym_trainer_to_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_trainer_to_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_tr_act_fk1` (`trainer_id`),
  KEY `gym_tr_act_fk2` (`activity_id`),
  CONSTRAINT `gym_tr_act_fk1` FOREIGN KEY (`trainer_id`) REFERENCES `gym_trainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gym_tr_act_fk2` FOREIGN KEY (`activity_id`) REFERENCES `gym_activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_trainer_to_activity`
--

LOCK TABLES `gym_trainer_to_activity` WRITE;
/*!40000 ALTER TABLE `gym_trainer_to_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `gym_trainer_to_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gym_schema'
--

--
-- Dumping routines for database 'gym_schema'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_activity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_activity`(
    local_act_name VARCHAR(60),
    local_act_duration INT,
    local_act_calories FLOAT,
    local_act_roomID INT
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_act_name) OR
        ISNULL(local_act_duration) OR
        ISNULL(local_act_calories) OR
        ISNULL(local_act_roomID))THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_activity (activity_name, activity_duration, activity_calories_burnt, room_id)
        VALUES(local_act_name, local_act_duration, local_act_calories, local_act_roomID);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_equipment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_equipment`(
    local_eq_name VARCHAR(60),
    local_eq_weight FLOAT,
    local_eq_brand VARCHAR(60),
    local_eq_roomID INT
)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_eq_name) OR
        ISNULL(local_eq_weight) OR
        ISNULL(local_eq_brand) OR
        ISNULL(local_eq_roomID)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_equipment (equipment_name, equipment_weight, equipment_brand, room_id)
        VALUES(local_eq_name, local_eq_weight, local_eq_brand, local_eq_roomID);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_equipment_cleaner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_equipment_cleaner`(
    local_eqcl_name VARCHAR(60),
    local_eqcl_address VARCHAR(60),
    local_eqcl_phone VARCHAR(60),
    local_eqcl_role VARCHAR(40),
    local_eqcl_gymID INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_eqcl_name) OR
        ISNULL(local_eqcl_address) OR
        ISNULL(local_eqcl_phone) OR
        ISNULL(local_eqcl_role) OR
        ISNULL(local_eqcl_gymID)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_equipment_cleaner (cleaner_name, cleaner_address, cleaner_phone, cleaner_role, gym_id)
        VALUES(local_eqcl_name, local_eqcl_address, local_eqcl_phone, local_eqcl_role, local_eqcl_gymID);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_eq_to_eqcl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_eq_to_eqcl`(
    local_eteq_eqid INT,
    local_eteq_eqclid INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_eteq_eqid) OR
        ISNULL(local_eteq_eqclid))THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_equipment_to_equipment_cleaner (equipment_id, equipment_cleaner_id)
        VALUES(local_eteq_eqid, local_eteq_eqclid);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_gym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_gym`(
    local_gym_name VARCHAR(60),
    local_gym_address VARCHAR(60),
    local_gym_phone VARCHAR(30)
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_gym_name) OR 
		ISNULL(local_gym_address) OR
		ISNULL(local_gym_phone)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_gym (gym_name, gym_address, gym_phone)
        VALUES(local_gym_name, local_gym_address, local_gym_phone);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_member`(
    local_mem_name VARCHAR(60),
    local_mem_dob DATE,
    local_mem_phone VARCHAR(30),
    local_mem_height FLOAT,
    local_mem_weight FLOAT,
    local_mem_gymId INT,
    local_mem_trID INT
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_mem_name) OR 
		ISNULL(local_mem_dob) OR
		ISNULL(local_mem_phone) OR 
        ISNULL(local_mem_height) OR 
        ISNULL(local_mem_weight) OR
        ISNULL(local_mem_gymID) OR
        ISNULL(local_mem_trID)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_member (member_name, member_dob, member_phone, 
										member_height, member_weight, gym_id, trainer_id)
        VALUES(local_mem_name, local_mem_dob, local_mem_phone,
								local_mem_height, local_mem_weight, local_mem_gymID, local_mem_trID);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_mem_to_act` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_mem_to_act`(
    local_mta_aid INT,
    local_mta_mid INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_mta_aid) OR
        ISNULL(local_mta_mid))THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_member_to_activity (activity_id, member_id)
        VALUES(local_mta_aid, local_mta_mid);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_room`(
    local_room_roomNo INT,
    local_room_cap INT,
    local_room_gymID INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_room_roomNo) OR
		ISNULL(local_room_cap) OR
        ISNULL(local_room_gymID)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_room (room_number, room_capacity, gym_id)
        VALUES(local_room_roomNo, local_room_cap, local_room_gymID);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_trainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_trainer`(
    local_tr_name VARCHAR(60),
    local_tr_address VARCHAR(60),
    local_tr_phone VARCHAR(30),
    local_tr_work FLOAT,
    local_tr_gymID INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_tr_name) OR 
        ISNULL(local_tr_address) OR
		ISNULL(local_tr_phone) OR 
        ISNULL(local_tr_work) OR
        ISNULL(local_tr_gymID)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_trainer(trainer_name, trainer_address, trainer_phone, trainer_working_hours, gym_id)
        VALUES(local_tr_name, local_tr_address, local_tr_phone, local_tr_work, local_tr_gymID);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_tr_to_act` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_tr_to_act`(
    local_tta_aid INT,
    local_tta_tid INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_tta_aid) OR
        ISNULL(local_tta_tid))THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_trainer_to_activity (activity_id, trainer_id)
        VALUES(local_tta_aid, local_tta_tid);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_activity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_activity`(
	local_act_id INT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
	DELETE FROM gym_activity WHERE id = local_act_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_equipment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_equipment`(
	local_eq_id INT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
	DELETE FROM gym_equipment WHERE id = local_eq_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_equipment_cleaner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_equipment_cleaner`(
	local_eqcl_id INT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
	DELETE FROM gym_equipment_cleaner WHERE id = local_eqcl_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_gym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_gym`(
	local_gym_id INT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
	DELETE FROM gym_gym WHERE id = local_gym_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_member`(
	local_mem_id INT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
	DELETE FROM gym_member WHERE id = local_mem_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_trainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_trainer`(
	local_tr_id INT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
	DELETE FROM gym_trainer WHERE id = local_tr_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_activity_by_gym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_activity_by_gym`(
	local_gym_name VARCHAR(60)
)
BEGIN    
	SELECT a.id, a.activity_name, a.activity_duration, a.activity_calories_burnt, r.room_number
    FROM gym_activity a
    INNER JOIN gym_room r
    ON a.room_id = r.id
    WHERE r.gym_id = (SELECT id FROM gym_gym WHERE gym_name = local_gym_name)
    ORDER BY a.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_equipmentCleaners_by_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_equipmentCleaners_by_role`()
BEGIN    
	SELECT cleaner_role, IFNULL(COUNT(*), 0) as "Number of staff members"
    FROM gym_equipment_cleaner
    GROUP BY cleaner_role;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_equipment_by_gym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_equipment_by_gym`(
	local_gym_name VARCHAR(60)
)
BEGIN 
	SELECT eq.id, eq.equipment_name, eq.equipment_weight, eq.equipment_brand, r.room_number 
    FROM gym_equipment eq
    INNER JOIN gym_room r
    ON eq.room_id = r.id
    WHERE r.gym_id = (SELECT id FROM gym_gym WHERE gym_name = local_gym_name)
    ORDER by eq.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_equipment_by_room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_equipment_by_room`(
	local_room_no VARCHAR(60)
)
BEGIN    
	SELECT e.id, e.equipment_name, e.equipment_weight, e.equipment_brand, r.room_number, g.gym_name
    FROM gym_equipment e
    INNER JOIN gym_room r
    ON e.room_id = r.id
    INNER JOIN gym_gym g
    ON g.id = r.gym_id
    WHERE r.room_number = local_room_no
    ORDER BY e.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_equipment_cleaner_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_equipment_cleaner_by_name`(
	local_eqcl_name VARCHAR(60)
)
BEGIN    
	SELECT eqcl.id, eqcl.cleaner_name, eqcl.cleaner_address, eqcl.cleaner_phone, eqcl.cleaner_role, g.gym_name
    FROM gym_equipment_cleaner eqcl
    INNER JOIN gym_gym g
    ON g.id = eqcl.gym_id
    WHERE eqcl.cleaner_name = local_eqcl_name
    ORDER BY eqcl.cleaner_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_gym_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_gym_by_name`(
	local_gym_name VARCHAR(60)
)
BEGIN    
	SELECT * FROM gym_gym WHERE gym_name = local_gym_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_member_by_gym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_member_by_gym`(
	local_gym_name VARCHAR(60)
)
BEGIN    
	SELECT m.id, m.member_name, m.member_dob, m.member_phone, m.member_height, g.gym_name, t.trainer_name, m.member_weight
    FROM gym_member m 
    INNER JOIN gym_gym g
    ON m.gym_id = g.id
    INNER JOIN gym_trainer t
    ON m.trainer_id = t.id
	WHERE g.gym_name = local_gym_name
    ORDER BY m.member_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_member_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_member_by_name`(
	local_mem_name VARCHAR(60)
)
BEGIN    
	SELECT m.id, m.member_name, m.member_dob, m.member_phone, m.member_height, g.gym_name, t.trainer_name, m.member_weight
    FROM gym_member m 
    INNER JOIN gym_gym g
    ON m.gym_id = g.id
    INNER JOIN gym_trainer t
    ON m.trainer_id = t.id
    WHERE m.member_name = local_mem_name
    ORDER BY m.member_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_member_by_trainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_member_by_trainer`(
	local_tr_name VARCHAR(60)
)
BEGIN    
	SELECT m.id, m.member_name, m.member_dob, m.member_phone, m.member_height, g.gym_name, t.trainer_name, m.member_weight
    FROM gym_member m
    INNER JOIN gym_gym g
    ON m.gym_id = g.id
    INNER JOIN gym_trainer t
    ON m.trainer_id = t.id
	WHERE t.trainer_name = local_tr_name
    ORDER BY m.member_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_trainer_by_gym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_trainer_by_gym`(
	local_gym_name VARCHAR(60)
)
BEGIN    
	SELECT t.id, t.trainer_name, t.trainer_address, t.trainer_phone, t.trainer_working_hours, g.gym_name
    FROM gym_trainer t 
    INNER JOIN gym_gym g
    ON t.gym_id = g.id
	WHERE g.gym_name = local_gym_name
    ORDER BY t.trainer_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_trainer_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_trainer_by_name`(
	local_tr_name VARCHAR(60)
)
BEGIN    
	SELECT t.id, t.trainer_name, t.trainer_address, t.trainer_phone, t.trainer_working_hours, g.gym_name
    FROM gym_trainer t 
    INNER JOIN gym_gym g
    ON t.gym_id = g.id
    WHERE trainer_name = local_tr_name
    ORDER BY t.trainer_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_activity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_activity`(
	local_act_id INT,
    local_act_name VARCHAR(60),
    local_act_duration INT,
    local_act_calories FLOAT,
    local_act_roomID INT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    IF(ISNULL(local_act_id)) THEN
		SELECT 'ID field blank' AS message;
    ELSE
		UPDATE gym_activity SET	activity_name = local_act_name,
								activity_duration = local_act_duration,
								activity_calories_burnt = local_act_calories,
								room_id = local_act_roomID
			WHERE id = local_act_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_equipment_cleaner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_equipment_cleaner`(
	local_eqcl_id INT,
    local_eqcl_name VARCHAR(60),
    local_eqcl_address VARCHAR(60),
    local_eqcl_phone VARCHAR(60),
    local_eqcl_role VARCHAR(40)
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    IF(ISNULL(local_eqcl_id)) THEN
		SELECT 'ID field blank' AS message;
    ELSE
		UPDATE gym_equipment_cleaner SET	cleaner_name = local_eqcl_name,
											cleaner_address = local_eqcl_address,
											cleaner_phone = local_eqcl_phone,
											cleaner_role = local_eqcl_role
			WHERE id = local_eqcl_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_gym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_gym`(
	local_gym_id INT,
    local_gym_name VARCHAR(60),
    local_gym_address VARCHAR(60),
    local_gym_phone VARCHAR(30)
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    IF(ISNULL(local_gym_id)) THEN
		SELECT 'ID field blank' AS message;
    ELSE
		UPDATE gym_gym SET	gym_name = local_gym_name, 
							gym_address = local_gym_address, 
							gym_phone = local_gym_phone
			WHERE id = local_gym_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_member`(
	local_mem_id INT,
    local_mem_name VARCHAR(60),
    local_mem_dob DATE,
    local_mem_phone VARCHAR(30),
    local_mem_height FLOAT,
    local_mem_weight FLOAT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    IF(ISNULL(local_mem_id)) THEN
		SELECT 'ID field blank' AS message;
    ELSE
		UPDATE gym_member SET	member_name = local_mem_name, 
								member_dob = local_mem_dob, 
								member_phone = local_mem_phone,
								member_height = local_mem_height, 
								member_weight = local_mem_weight
			WHERE id = local_mem_id;
     END IF;       
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_trainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_trainer`(
	local_tr_id INT,
    local_tr_name VARCHAR(60),
    local_tr_address VARCHAR(60),
    local_tr_phone VARCHAR(30),
    local_tr_work FLOAT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    IF(ISNULL(local_tr_id)) THEN
		SELECT 'ID field blank' AS message;
    ELSE
		UPDATE gym_trainer SET	trainer_name = local_tr_name, 
								trainer_address = local_tr_address, 
								trainer_phone = local_tr_phone, 
								trainer_working_hours = local_tr_work
		WHERE id = local_tr_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-09 10:56:30
