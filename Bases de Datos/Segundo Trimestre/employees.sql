-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: employees
-- ------------------------------------------------------
-- Server version	8.0.19

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

drop database employees;
create database employees;
use employees;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` varchar(45) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(4000) DEFAULT NULL,
  `country` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('206029942415600789459081602478379791854','Delivery','Tanquecitos','United States'),('206029942415601998384901217107554498030','Shipping and Receiving','Sugarloaf','United States'),('206029942415603207310720831736729204206','e-Commerse','Dale City','United States'),('206029942415604416236540446365903910382','Customer Support','Grosvenor','United States');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `emp_v`
--

DROP TABLE IF EXISTS `emp_v`;
/*!50001 DROP VIEW IF EXISTS `emp_v`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `emp_v` AS SELECT 
 1 AS `department_id`,
 1 AS `department_name`,
 1 AS `location`,
 1 AS `country`,
 1 AS `employee_id`,
 1 AS `employee_name`,
 1 AS `email`,
 1 AS `cost_center`,
 1 AS `date_hired`,
 1 AS `job`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` varchar(45) NOT NULL,
  `department_id` varchar(45) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cost_center` int DEFAULT NULL,
  `date_hired` datetime DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_i1` (`department_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('206029942415605625162360060995078616558','206029942415604416236540446365903910382','Gricelda Luebbers','gricelda.luebbers@aaab.com',5,'2019-12-11 16:35:34','Sustaining Engineering',55000),('206029942415606834088179675624253322734','206029942415603207310720831736729204206','Dean Bollich','dean.bollich@aaac.com',63,'2019-11-12 16:35:34','Sustaining Engineering',52000),('206029942415608043013999290253428028910','206029942415600789459081602478379791854','Milo Manoni','milo.manoni@aaad.com',8,'2019-11-08 16:35:34','System Operations',45000),('206029942415609251939818904882602735086','206029942415604416236540446365903910382','Laurice Karl','laurice.karl@aaae.com',25,'2020-01-24 16:35:34','Operations Manager',65000),('206029942415610460865638519511777441262','206029942415601998384901217107554498030','August Rupel','august.rupel@aaaf.com',98,'2019-12-20 16:35:34','Programmer',42000),('206029942415611669791458134140952147438','206029942415603207310720831736729204206','Salome Guisti','salome.guisti@aaag.com',54,'2020-01-01 16:35:34','Analyst',53000),('206029942415612878717277748770126853614','206029942415600789459081602478379791854','Lovie Ritacco','lovie.ritacco@aaah.com',94,'2019-12-29 16:35:34','Quality Control Specialist',51000),('206029942415614087643097363399301559790','206029942415603207310720831736729204206','Chaya Greczkowski','chaya.greczkowski@aaai.com',61,'2020-01-24 16:35:34','Java Developer',57000),('206029942415615296568916978028476265966','206029942415604416236540446365903910382','Twila Coolbeth','twila.coolbeth@aaaj.com',60,'2019-12-17 16:35:34','Marketing Associate',71000),('206029942415616505494736592657650972142','206029942415601998384901217107554498030','Carlotta Achenbach','carlotta.achenbach@aaak.com',98,'2019-12-17 16:35:34','Vice President',147000),('206029942415617714420556207286825678318','206029942415603207310720831736729204206','Jeraldine Audet','jeraldine.audet@aaal.com',74,'2019-11-01 16:35:34','Receptionist',32000),('206029942415618923346375821916000384494','206029942415603207310720831736729204206','August Arouri','august.arouri@aaam.com',16,'2019-11-21 16:35:34','Sales Consultant',72000),('206029942415620132272195436545175090670','206029942415603207310720831736729204206','Ward Stepney','ward.stepney@aaan.com',67,'2019-12-28 16:35:34','Help Desk Specialist',47000),('206029942415621341198015051174349796846','206029942415604416236540446365903910382','Ayana Barkhurst','ayana.barkhurst@aaao.com',41,'2019-12-17 16:35:34','Program Manager',64000);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `emp_v`
--

/*!50001 DROP VIEW IF EXISTS `emp_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`externo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `emp_v` AS select `departments`.`id` AS `department_id`,`departments`.`name` AS `department_name`,`departments`.`location` AS `location`,`departments`.`country` AS `country`,`employees`.`id` AS `employee_id`,`employees`.`name` AS `employee_name`,`employees`.`email` AS `email`,`employees`.`cost_center` AS `cost_center`,`employees`.`date_hired` AS `date_hired`,`employees`.`job` AS `job` from (`departments` join `employees`) where (`employees`.`department_id` = `departments`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-28 20:43:04
