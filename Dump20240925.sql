CREATE DATABASE  IF NOT EXISTS `univer` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `univer`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: univer
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access` (
  `employee_#emp` int NOT NULL,
  `subject_#subj` int NOT NULL,
  PRIMARY KEY (`employee_#emp`,`subject_#subj`),
  KEY `fk_employee_has_subject_subject1_idx` (`subject_#subj`),
  KEY `fk_employee_has_subject_employee1_idx` (`employee_#emp`),
  CONSTRAINT `fk_employee_has_subject_employee1` FOREIGN KEY (`employee_#emp`) REFERENCES `employee` (`#emp`),
  CONSTRAINT `fk_employee_has_subject_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `iddir` int NOT NULL,
  `dirname` varchar(25) COLLATE utf8_bin NOT NULL,
  `podr` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`iddir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Агавелян','ИД'),(2,'Ктионов','ИИГСО'),(3,'Бульгина','ИФМИП'),(4,'Кандалинцева','ИЕСЕН'),(5,'Гейбука','ИФМИТО'),(6,'Архипова','ИМИСК');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `#emp` int NOT NULL AUTO_INCREMENT,
  `empname` varchar(25) COLLATE utf8_bin NOT NULL,
  `director_iddir` int NOT NULL,
  `post_postname` varchar(21) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`#emp`),
  KEY `fk_employee_director1_idx` (`director_iddir`),
  KEY `fk_employee_post1_idx` (`post_postname`),
  CONSTRAINT `fk_employee_director1` FOREIGN KEY (`director_iddir`) REFERENCES `director` (`iddir`),
  CONSTRAINT `fk_employee_post1` FOREIGN KEY (`post_postname`) REFERENCES `post` (`postname`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Чупин',5,'Доцент'),(2,'Верещагин',5,'Старший преподаватель'),(3,'Верещагин',5,'Старший преподаватель'),(4,'Верещагина',5,'Доцент'),(5,'Петров',5,'Доцент'),(6,'Сартаков',5,'Асистент'),(7,'Ступин',5,'Доцент'),(8,'Ступина',5,'Доцент'),(9,'Классов',5,'Доцент');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `#gr` char(10) COLLATE utf8_bin NOT NULL,
  `code` char(10) COLLATE utf8_bin NOT NULL,
  `napr` mediumtext COLLATE utf8_bin NOT NULL,
  `prof` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`#gr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('1','3.124.2.21','ИСИТ','ОВСАИНТ'),('2','3.124.2.22','ИСИТ','ОВСАИНТ'),('3','3.008.2.21','ИСИТ','ИСИТВО'),('4','3.054.2.21','ПО','МИ');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `#week` int NOT NULL,
  `day` varchar(3) COLLATE utf8_bin NOT NULL,
  `group_#gr` char(10) COLLATE utf8_bin NOT NULL,
  `lessotype_lessonname` varchar(12) COLLATE utf8_bin NOT NULL,
  `subject_#subj` int NOT NULL,
  `#room` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`#week`,`day`,`group_#gr`,`lessotype_lessonname`,`subject_#subj`),
  KEY `fk_group_has_subject_subject1_idx` (`subject_#subj`),
  KEY `fk_group_has_subject_group1_idx` (`group_#gr`),
  KEY `fk_group_has_subject_lessotype1_idx` (`lessotype_lessonname`),
  CONSTRAINT `fk_group_has_subject_group1` FOREIGN KEY (`group_#gr`) REFERENCES `group` (`#gr`),
  CONSTRAINT `fk_group_has_subject_lessotype1` FOREIGN KEY (`lessotype_lessonname`) REFERENCES `lessotype` (`lessonname`),
  CONSTRAINT `fk_group_has_subject_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (1,'вт','1','Семенар',3,NULL),(1,'вт','2','Семенар',2,'201'),(1,'вт','3','Семенар',2,'202'),(1,'пн','1','Лекция',1,'308'),(1,'пн','2','Лекция',2,'307'),(1,'ср','2','Семенар',1,'212'),(2,'вт','1','Лабораторная',1,'201'),(2,'вт','2','Семенар',2,'221'),(2,'вт','3','Семенар',1,'336'),(2,'пн','1','Лекция',1,'201');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessotype`
--

DROP TABLE IF EXISTS `lessotype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessotype` (
  `lessonname` varchar(12) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`lessonname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessotype`
--

LOCK TABLES `lessotype` WRITE;
/*!40000 ALTER TABLE `lessotype` DISABLE KEYS */;
INSERT INTO `lessotype` VALUES ('Лабораторная'),('Лекция'),('Семенар');
/*!40000 ALTER TABLE `lessotype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `postname` varchar(21) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`postname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('Асистент'),('Доцент'),('Профессор'),('Старший преподаватель');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `#stud` int NOT NULL AUTO_INCREMENT,
  `stydname` varchar(25) COLLATE utf8_bin NOT NULL,
  `director_iddir` int NOT NULL,
  `group_#gr` char(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`#stud`),
  KEY `fk_student_director_idx` (`director_iddir`),
  KEY `fk_student_group1_idx` (`group_#gr`),
  CONSTRAINT `fk_student_director` FOREIGN KEY (`director_iddir`) REFERENCES `director` (`iddir`),
  CONSTRAINT `fk_student_group1` FOREIGN KEY (`group_#gr`) REFERENCES `group` (`#gr`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (29,'Иванов',5,'3'),(30,'Петров',5,'2'),(31,'Попов',5,'3'),(32,'Николаев',5,'4'),(33,'Константинова',5,'2'),(34,'Сороков',5,'1'),(35,'Сидоров',5,'3'),(36,'Андреев',5,'4'),(37,'Котов',5,'3'),(38,'Мышкин',5,'1'),(39,'Кошкин',5,'2'),(40,'Иванов',5,'4'),(41,'Петров',5,'3'),(42,'Абрикосов',5,'1');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentmarks`
--

DROP TABLE IF EXISTS `studentmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentmarks` (
  `date` date NOT NULL,
  `student_#stud` int NOT NULL,
  `employee_#emp` int NOT NULL,
  `subject_#subj` int NOT NULL,
  `marks` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`date`,`student_#stud`,`employee_#emp`,`subject_#subj`),
  KEY `fk_student_has_employee_employee1_idx` (`employee_#emp`),
  KEY `fk_student_has_employee_student1_idx` (`student_#stud`),
  KEY `fk_student_has_employee_subject1_idx` (`subject_#subj`),
  CONSTRAINT `fk_student_has_employee_employee1` FOREIGN KEY (`employee_#emp`) REFERENCES `employee` (`#emp`),
  CONSTRAINT `fk_student_has_employee_student1` FOREIGN KEY (`student_#stud`) REFERENCES `student` (`#stud`),
  CONSTRAINT `fk_student_has_employee_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentmarks`
--

LOCK TABLES `studentmarks` WRITE;
/*!40000 ALTER TABLE `studentmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `#subj` int NOT NULL AUTO_INCREMENT,
  `subjname` varchar(45) COLLATE utf8_bin NOT NULL,
  `subjinfo` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`#subj`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'ПрбД','База данных'),(2,'КСХ','компьютерные коммуникации'),(3,'ИБ','Информационная безопасность'),(4,'ОС','Операционныые системы'),(5,'САПТП',NULL),(6,'СА',NULL),(7,'СНТ',NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-25 10:05:29
