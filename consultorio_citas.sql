-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: appsalon_mvc
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
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_citas_usuarios_idx` (`usuarioId`),
  CONSTRAINT `citas_FK` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (5,'2022-09-28','15:07:00',1,0),(6,'2022-10-02','16:14:00',1,1),(7,'2022-09-27','15:15:00',1,0),(8,'2022-09-28','15:17:00',5,0),(9,'2022-09-28','16:17:00',5,0),(10,'2022-09-28','17:00:00',7,0),(11,'2022-09-29','17:00:00',7,0),(12,'2022-10-03','16:00:00',6,1),(13,'2022-10-04','17:00:00',6,1),(16,'2022-10-05','19:00:00',6,1),(17,'2022-10-04','15:00:00',6,1),(18,'2022-10-05','14:00:00',6,0),(19,'2022-10-05','14:30:00',6,0),(20,'2022-10-04','09:30:00',6,0),(21,'2022-10-06','14:00:00',6,0);
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citasservicios`
--

DROP TABLE IF EXISTS `citasservicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citasservicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citaId` int DEFAULT NULL,
  `servicioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cita_servicios_citas1_idx` (`citaId`),
  KEY `fk_cita_servicios_servicios1_idx` (`servicioId`),
  CONSTRAINT `fk_cita_servicios_citas1` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_cita_servicios_servicios1` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citasservicios`
--

LOCK TABLES `citasservicios` WRITE;
/*!40000 ALTER TABLE `citasservicios` DISABLE KEYS */;
INSERT INTO `citasservicios` VALUES (1,5,3),(2,5,4),(3,5,1),(4,6,1),(5,6,4),(6,6,3),(7,7,1),(8,7,2),(9,8,3),(10,8,4),(11,8,1),(12,9,1),(13,9,5),(14,10,1),(15,10,2),(16,11,1),(17,11,2),(18,12,1),(19,12,3),(20,12,4),(21,13,1),(22,NULL,1),(23,NULL,1),(24,16,1),(25,17,1),(26,18,1),(27,19,1),(28,20,1),(29,21,1);
/*!40000 ALTER TABLE `citasservicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Observación general',30000.00),(2,'Blanqueamiento',20000.00),(3,' Coronas',50000.00),(4,'Ortodoncia',1000000.00),(5,'Valoracion',30000.00),(7,' cordales',500000.00);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,' sergio','yela','correo2@correo.com','$2y$10$Ji.gTwGpYgeBn9dk7KJRqefsBP9vw3ZSuL6LmLcErLiRAtjwkWsJ6','123',0,1,''),(3,' Admin','Yela','admin@admin.com','$2y$10$XQBV8l5ikocnmREa8LiLm.W0WBoVB5SNN3HYlZUdJU6GR8EhMch0.','1234567890',1,1,''),(4,' sergio','yela','correo4@correo.com','$2y$10$tCrOR.dxwXBVhBhUEK7X5evGBArU80w2f2XYuDclYmc/i3MiDID3.','123',0,1,''),(5,' jennifer','yela','jenifer@jenifer.com','$2y$10$XQpt.yRTCcSFoN1P6Td55OtBRm.3R7KAdogdvYsH7Fi9H5yz2tgBO','12234',0,1,''),(6,' Pruba','Preba','correo@correo.com','$2y$10$Zpz6ru7ZEK/sRTWixvtngeVZBEFza.WmnDYn6hTj5SGAwF2GX0mnS','123456',0,1,''),(7,' Daniela','Gutierrez','daniela@daniela.com','$2y$10$zYpOI6Zc2n78z7utSCr8B.e5Yl4trsN7W.T4MP/2oAdsJVJ3Dxpya','123456789',0,1,''),(8,' Steven','Yela','stiveny@hotmail.es','$2y$10$Tij4nszZYsJkT2talcb16urn4lcNJvLbx3QZ2kLLQFvV6N9teeZHm','3232854981',0,1,'');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-05 16:56:34
