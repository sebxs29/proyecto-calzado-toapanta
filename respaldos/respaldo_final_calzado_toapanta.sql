-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: calzado_toapanta
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Current Database: `calzado_toapanta`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `calzado_toapanta` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `calzado_toapanta`;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tabla_afectada` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_clientes`
--

DROP TABLE IF EXISTS `auditoria_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_clientes` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `operacion` varchar(15) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usuario` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `cedula` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `datos_anteriores` text COLLATE utf8mb4_spanish_ci,
  `datos_nuevos` text COLLATE utf8mb4_spanish_ci,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_clientes`
--

LOCK TABLES `auditoria_clientes` WRITE;
/*!40000 ALTER TABLE `auditoria_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_precios`
--

DROP TABLE IF EXISTS `auditoria_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_precios` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `precio_anterior` decimal(10,2) DEFAULT NULL,
  `precio_nuevo` decimal(10,2) DEFAULT NULL,
  `usuario` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_precios`
--

LOCK TABLES `auditoria_precios` WRITE;
/*!40000 ALTER TABLE `auditoria_precios` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'Activa',
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre_categoria` (`nombre_categoria`),
  CONSTRAINT `chk_categoria_estado` CHECK ((`estado` in (_utf8mb4'Activa',_utf8mb4'Inactiva')))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Escolar','Categoria de calzado Escolar','Activa'),(2,'Deportivo','Categoria de calzado Deportivo','Activa'),(3,'Sandalias','Categoria de calzado Sandalias','Activa'),(4,'Formal','Categoria de calzado Formal','Activa'),(5,'Botas','Categoria de calzado Botas','Activa'),(6,'Industrial','Categoria de calzado Industrial','Activa'),(7,'Casual','Categoria de calzado Casual','Activa'),(8,'Infantil','Categoria de calzado Infantil','Activa');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombres` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `provincia` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cedula` (`cedula`),
  UNIQUE KEY `correo` (`correo`),
  CONSTRAINT `chk_cliente_cedula` CHECK ((char_length(`cedula`) = 10)),
  CONSTRAINT `chk_cliente_telefono` CHECK ((char_length(`telefono`) = 10))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'1710000000','Juan','Perez','0930000000','juan.perez@gmail.com','Pichincha','1985-01-01'),(2,'1810000001','Maria','Lopez','0930000001','maria.lopez@gmail.com','Guayas','1986-02-02'),(3,'1910000002','Carlos','Andrade','0930000002','carlos.andrade@gmail.com','Azuay','1987-03-03'),(4,'2010000003','Ana','Torres','0930000003','ana.torres@gmail.com','Manabi','1988-04-04'),(5,'2110000004','Luis','Zambrano','0930000004','luis.zambrano@gmail.com','Tungurahua','1989-05-05'),(6,'2210000005','Andrea','Salazar','0930000005','andrea.salazar@gmail.com','Loja','1990-06-06'),(7,'2310000006','Pedro','Mena','0930000006','pedro.mena@gmail.com','Imbabura','1991-07-07'),(8,'1710000007','Camila','Vera','0930000007','camila.vera@gmail.com','El Oro','1992-08-08'),(9,'1810000008','Jose','Cedeno','0930000008','jose.cedeno@gmail.com','Cotopaxi','1993-09-09'),(10,'1910000009','Daniela','Paredes','0930000009','daniela.paredes@gmail.com','Chimborazo','1994-10-10'),(11,'2010000010','Miguel','Gomez','0930000010','miguel.gomez@gmail.com','Pichincha','1995-11-11'),(12,'2110000011','Sofia','Castro','0930000011','sofia.castro@gmail.com','Guayas','1996-12-12'),(13,'2210000012','Jorge','Morales','0930000012','jorge.morales@gmail.com','Azuay','1997-01-13'),(14,'2310000013','Valeria','Herrera','0930000013','valeria.herrera@gmail.com','Manabi','1998-02-14'),(15,'1710000014','Diego','Jimenez','0930000014','diego.jimenez@gmail.com','Tungurahua','1999-03-15'),(16,'1810000015','Gabriela','Guerrero','0930000015','gabriela.guerrero@gmail.com','Loja','2000-04-16'),(17,'1910000016','Ricardo','Ortega','0930000016','ricardo.ortega@gmail.com','Imbabura','2001-05-17'),(18,'2010000017','Paula','Reyes','0930000017','paula.reyes@gmail.com','El Oro','2002-06-18'),(19,'2110000018','Mateo','Toapanta','0930000018','mateo.toapanta@gmail.com','Cotopaxi','1985-07-19'),(20,'2210000019','Diana','Nunez','0930000019','diana.nunez@gmail.com','Chimborazo','1986-08-20'),(21,'2310000020','Sebastian','Flores','0930000020','sebastian.flores@gmail.com','Pichincha','1987-09-21'),(22,'1710000021','Lucia','Molina','0930000021','lucia.molina@gmail.com','Guayas','1988-10-22'),(23,'1810000022','Andres','Ramos','0930000022','andres.ramos@gmail.com','Azuay','1989-11-23'),(24,'1910000023','Natalia','Vargas','0930000023','natalia.vargas@gmail.com','Manabi','1990-12-24'),(25,'2010000024','Fernando','Sanchez','0930000024','fernando.sanchez@gmail.com','Tungurahua','1991-01-25'),(26,'2110000025','Carolina','Chavez','0930000025','carolina.chavez@gmail.com','Loja','1992-02-26'),(27,'2210000026','David','Romero','0930000026','david.romero@gmail.com','Imbabura','1993-03-27'),(28,'2310000027','Monica','Cruz','0930000027','monica.cruz@gmail.com','El Oro','1994-04-01'),(29,'1710000028','Cristian','Espinoza','0930000028','cristian.espinoza@gmail.com','Cotopaxi','1995-05-02'),(30,'1810000029','Alejandra','Aguilar','0930000029','alejandra.aguilar@gmail.com','Chimborazo','1996-06-03'),(32,'1723456789','Ana','Gómez','0987654321','ana.gomez@mail.com','Guayas','1995-10-20');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auditoria_insert_clientes` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN
    INSERT INTO auditoria_clientes (operacion, usuario, fecha, id_cliente, cedula, datos_nuevos)
    VALUES (
        'INSERT', 
        CURRENT_USER(), 
        NOW(), 
        NEW.id_cliente, 
        NEW.cedula, 
        CONCAT('Nombres: ', NEW.nombres, ' ', NEW.apellidos, ' - Correo: ', NEW.correo)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auditoria_update_clientes` AFTER UPDATE ON `clientes` FOR EACH ROW BEGIN
    INSERT INTO auditoria_clientes (operacion, usuario, fecha, id_cliente, cedula, datos_anteriores, datos_nuevos)
    VALUES (
        'UPDATE', 
        CURRENT_USER(), 
        NOW(), 
        NEW.id_cliente, 
        NEW.cedula,
        CONCAT('Telf: ', OLD.telefono, ' Correo: ', OLD.correo),
        CONCAT('Telf: ', NEW.telefono, ' Correo: ', NEW.correo)
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auditoria_delete_clientes` BEFORE DELETE ON `clientes` FOR EACH ROW BEGIN
    INSERT INTO auditoria_clientes (operacion, usuario, fecha, id_cliente, cedula, datos_anteriores)
    VALUES (
        'DELETE', 
        CURRENT_USER(), 
        NOW(), 
        OLD.id_cliente, 
        OLD.cedula, 
        CONCAT('Nombres: ', OLD.nombres, ' ', OLD.apellidos)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_detalle_venta` (`id_venta`),
  KEY `fk_detalle_producto` (`id_producto`),
  CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_detalle_cantidad` CHECK ((`cantidad` > 0)),
  CONSTRAINT `chk_detalle_valores` CHECK (((`precio_unitario` > 0) and (`subtotal` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,7,35.00,245.00),(2,1,2,7,36.50,255.50),(3,1,3,5,48.50,242.50),(4,1,4,5,55.00,275.00),(5,2,5,1,28.00,28.00),(6,2,6,2,25.00,50.00),(7,2,7,2,60.00,120.00),(8,2,8,2,62.00,124.00),(9,3,9,2,75.00,150.00),(10,3,10,2,85.00,170.00),(11,3,11,3,58.00,174.00),(12,3,12,2,65.00,130.00),(13,4,13,2,72.00,144.00),(14,4,14,3,45.00,135.00),(15,4,15,3,50.00,150.00),(16,4,16,2,42.00,84.00),(17,5,17,2,32.00,64.00),(18,5,18,3,26.00,78.00),(19,5,19,2,90.00,180.00),(20,5,20,1,59.00,59.00),(21,6,1,8,35.00,280.00),(22,6,2,3,36.50,109.50),(23,6,3,8,48.50,388.00),(24,6,4,5,55.00,275.00),(25,7,5,1,28.00,28.00),(26,7,6,1,25.00,25.00),(27,7,7,3,60.00,180.00),(28,7,8,3,62.00,186.00),(29,8,9,1,75.00,75.00),(30,8,10,1,85.00,85.00),(31,8,11,3,58.00,174.00),(32,8,12,1,65.00,65.00),(33,9,13,1,72.00,72.00),(34,9,14,1,45.00,45.00),(35,9,15,3,50.00,150.00),(36,9,16,2,42.00,84.00),(37,10,17,2,32.00,64.00),(38,10,18,1,26.00,26.00),(39,10,19,1,90.00,90.00),(40,10,20,1,59.00,59.00),(41,11,1,8,35.00,280.00),(42,11,2,4,36.50,146.00),(43,11,3,5,48.50,242.50),(44,11,4,6,55.00,330.00),(45,12,5,1,28.00,28.00),(46,12,6,1,25.00,25.00),(47,12,7,1,60.00,60.00),(48,12,8,1,62.00,62.00),(49,13,9,3,75.00,225.00),(50,13,10,1,85.00,85.00),(51,13,11,1,58.00,58.00),(52,13,12,3,65.00,195.00),(53,14,13,2,72.00,144.00),(54,14,14,1,45.00,45.00),(55,14,15,1,50.00,50.00),(56,14,16,1,42.00,42.00),(57,15,17,3,32.00,96.00),(58,15,18,3,26.00,78.00),(59,15,19,1,90.00,90.00),(60,15,20,2,59.00,118.00),(61,16,1,4,35.00,140.00),(62,16,2,3,36.50,109.50),(63,16,3,7,48.50,339.50),(64,16,4,3,55.00,165.00),(65,17,5,3,28.00,84.00),(66,17,6,3,25.00,75.00),(67,17,7,2,60.00,120.00),(68,17,8,2,62.00,124.00),(69,18,9,1,75.00,75.00),(70,18,10,3,85.00,255.00),(71,18,11,2,58.00,116.00),(72,18,12,1,65.00,65.00),(73,19,13,2,72.00,144.00),(74,19,14,2,45.00,90.00),(75,19,15,2,50.00,100.00),(76,19,16,3,42.00,126.00),(77,20,17,1,32.00,32.00),(78,20,18,2,26.00,52.00),(79,20,19,2,90.00,180.00),(80,20,20,3,59.00,177.00),(81,21,1,3,35.00,105.00),(82,21,2,6,36.50,219.00),(83,21,3,3,48.50,145.50),(84,21,4,6,55.00,330.00),(85,22,5,2,28.00,56.00),(86,22,6,2,25.00,50.00),(87,22,7,1,60.00,60.00),(88,22,8,3,62.00,186.00),(89,23,9,2,75.00,150.00),(90,23,10,2,85.00,170.00),(91,23,11,1,58.00,58.00),(92,23,12,1,65.00,65.00),(93,24,13,1,72.00,72.00),(94,24,14,2,45.00,90.00),(95,24,15,3,50.00,150.00),(96,24,16,2,42.00,84.00),(97,25,17,2,32.00,64.00),(98,25,18,3,26.00,78.00),(99,25,19,3,90.00,270.00),(100,25,20,1,59.00,59.00),(101,26,1,5,35.00,175.00),(102,26,2,4,36.50,146.00),(103,26,3,6,48.50,291.00),(104,26,4,3,55.00,165.00),(105,27,5,2,28.00,56.00),(106,27,6,1,25.00,25.00),(107,27,7,3,60.00,180.00),(108,27,8,1,62.00,62.00),(109,28,9,2,75.00,150.00),(110,28,10,1,85.00,85.00),(111,28,11,3,58.00,174.00),(112,28,12,3,65.00,195.00),(113,29,13,3,72.00,216.00),(114,29,14,2,45.00,90.00),(115,29,15,1,50.00,50.00),(116,29,16,1,42.00,42.00),(117,30,17,1,32.00,32.00),(118,30,18,3,26.00,78.00),(119,30,19,2,90.00,180.00),(120,30,20,1,59.00,59.00),(121,31,1,8,35.00,280.00),(122,31,2,7,36.50,255.50),(123,31,3,8,48.50,388.00),(124,31,4,6,55.00,330.00),(125,32,5,3,28.00,84.00),(126,32,6,2,25.00,50.00),(127,32,7,1,60.00,60.00),(128,32,8,1,62.00,62.00),(129,33,9,2,75.00,150.00),(130,33,10,1,85.00,85.00),(131,33,11,2,58.00,116.00),(132,33,12,1,65.00,65.00),(133,34,13,1,72.00,72.00),(134,34,14,1,45.00,45.00),(135,34,15,3,50.00,150.00),(136,34,16,3,42.00,126.00),(137,35,17,1,32.00,32.00),(138,35,18,3,26.00,78.00),(139,35,19,1,90.00,90.00),(140,35,20,1,59.00,59.00),(141,36,1,5,35.00,175.00),(142,36,2,5,36.50,182.50),(143,36,3,5,48.50,242.50),(144,36,4,3,55.00,165.00),(145,37,5,1,28.00,28.00),(146,37,6,2,25.00,50.00),(147,37,7,1,60.00,60.00),(148,37,8,1,62.00,62.00),(149,38,9,2,75.00,150.00),(150,38,10,1,85.00,85.00),(151,38,11,3,58.00,174.00),(152,38,12,2,65.00,130.00),(153,39,13,2,72.00,144.00),(154,39,14,3,45.00,135.00),(155,39,15,2,50.00,100.00),(156,39,16,2,42.00,84.00),(157,40,17,2,32.00,64.00),(158,40,18,2,26.00,52.00),(159,40,19,2,90.00,180.00),(160,40,20,1,59.00,59.00),(161,41,1,8,35.00,280.00),(162,41,2,3,36.50,109.50),(163,41,3,8,48.50,388.00),(164,41,4,4,55.00,220.00),(165,42,5,3,28.00,84.00),(166,42,6,3,25.00,75.00),(167,42,7,1,60.00,60.00),(168,42,8,3,62.00,186.00),(169,43,9,2,75.00,150.00),(170,43,10,1,85.00,85.00),(171,43,11,1,58.00,58.00),(172,43,12,1,65.00,65.00),(173,44,13,1,72.00,72.00),(174,44,14,1,45.00,45.00),(175,44,15,1,50.00,50.00),(176,44,16,2,42.00,84.00),(177,45,17,2,32.00,64.00),(178,45,18,3,26.00,78.00),(179,45,19,2,90.00,180.00),(180,45,20,3,59.00,177.00),(181,46,1,3,35.00,105.00),(182,46,2,5,36.50,182.50),(183,46,3,8,48.50,388.00),(184,46,4,3,55.00,165.00),(185,47,5,3,28.00,84.00),(186,47,6,3,25.00,75.00),(187,47,7,2,60.00,120.00),(188,47,8,3,62.00,186.00),(189,48,9,3,75.00,225.00),(190,48,10,2,85.00,170.00),(191,48,11,2,58.00,116.00),(192,48,12,1,65.00,65.00),(193,49,13,3,72.00,216.00),(194,49,14,3,45.00,135.00),(195,49,15,2,50.00,100.00),(196,49,16,2,42.00,84.00),(197,50,17,1,32.00,32.00),(198,50,18,3,26.00,78.00),(199,50,19,3,90.00,270.00),(200,50,20,3,59.00,177.00),(256,64,1,2,35.00,70.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_control_stock_negativo` BEFORE INSERT ON `detalle_venta` FOR EACH ROW BEGIN
    DECLARE v_stock_actual INT;
    
    -- Consultamos cuánto stock hay en bodega
    SELECT stock_actual INTO v_stock_actual 
    FROM inventario 
    WHERE id_producto = NEW.id_producto;
    
    -- Validamos
    IF (v_stock_actual - NEW.cantidad) < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Stock insuficiente. La cantidad solicitada supera el inventario actual.';
    END IF;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_descontar_stock_venta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
    UPDATE inventario
    SET stock_actual = stock_actual - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devoluciones` (
  `id_devolucion` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `cantidad` int NOT NULL,
  `motivo` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `estado` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'Procesada',
  PRIMARY KEY (`id_devolucion`),
  KEY `fk_devolucion_venta` (`id_venta`),
  KEY `fk_devolucion_producto` (`id_producto`),
  CONSTRAINT `fk_devolucion_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_devolucion_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_devolucion_cantidad` CHECK ((`cantidad` > 0)),
  CONSTRAINT `chk_devolucion_estado` CHECK ((`estado` in (_utf8mb4'Pendiente',_utf8mb4'Procesada',_utf8mb4'Rechazada')))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones`
--

LOCK TABLES `devoluciones` WRITE;
/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
INSERT INTO `devoluciones` VALUES (1,1,1,'2026-06-02',1,'Cambio de color','Procesada'),(2,1,2,'2026-06-08',1,'No cumple expectativa','Procesada'),(3,1,3,'2026-06-02',1,'No cumple expectativa','Procesada'),(4,1,4,'2026-06-05',1,'Producto equivocado','Procesada'),(5,2,5,'2026-06-03',1,'Talla incorrecta','Procesada'),(6,2,6,'2026-06-08',1,'Defecto de fabrica','Procesada'),(7,2,7,'2026-06-03',1,'Producto equivocado','Procesada'),(8,2,8,'2026-06-07',1,'No cumple expectativa','Procesada'),(9,3,9,'2026-06-10',1,'Defecto de fabrica','Procesada'),(10,3,10,'2026-06-05',1,'Defecto de fabrica','Procesada'),(11,3,11,'2026-06-08',1,'No cumple expectativa','Procesada'),(12,3,12,'2026-06-06',1,'Cambio de color','Procesada'),(13,4,13,'2026-06-09',1,'Defecto de fabrica','Procesada'),(14,4,14,'2026-06-10',1,'Producto equivocado','Procesada'),(15,4,15,'2026-06-07',1,'Defecto de fabrica','Procesada'),(16,4,16,'2026-06-11',1,'Talla incorrecta','Procesada'),(17,5,17,'2026-06-11',1,'Producto equivocado','Procesada'),(18,5,18,'2026-06-07',1,'Cambio de color','Procesada'),(19,5,19,'2026-06-06',1,'Talla incorrecta','Procesada'),(20,5,20,'2026-06-09',1,'Defecto de fabrica','Procesada'),(32,1,1,'2026-07-22',1,'Talla incorrecta','Procesada'),(33,1,1,'2026-07-22',1,'Producto defectuoso de fábrica','Procesada');
/*!40000 ALTER TABLE `devoluciones` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_incrementar_stock_devolucion` AFTER INSERT ON `devoluciones` FOR EACH ROW BEGIN
    UPDATE inventario
    SET stock_actual = stock_actual + NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombres` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cargo` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `rol` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `cedula` (`cedula`),
  UNIQUE KEY `correo` (`correo`),
  CONSTRAINT `chk_empleado_cedula` CHECK ((char_length(`cedula`) = 10)),
  CONSTRAINT `chk_empleado_rol` CHECK ((`rol` in (_utf8mb4'Administrador',_utf8mb4'Gerente',_utf8mb4'Cajero',_utf8mb4'Vendedor',_utf8mb4'Auditor'))),
  CONSTRAINT `chk_empleado_telefono` CHECK ((char_length(`telefono`) = 10))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com'),(2,'1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com'),(3,'1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com'),(4,'1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com'),(5,'1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com'),(6,'1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com'),(7,'1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com'),(8,'1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com'),(9,'1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com'),(10,'1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `stock_actual` int NOT NULL,
  `stock_minimo` int NOT NULL,
  `ubicacion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_inventario`),
  UNIQUE KEY `id_producto` (`id_producto`),
  CONSTRAINT `fk_inventario_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_inventario_stock` CHECK (((`stock_actual` >= 0) and (`stock_minimo` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,112,20,'Bodega principal'),(2,2,73,20,'Bodega principal'),(3,3,207,20,'Bodega principal'),(4,4,76,20,'Bodega principal'),(5,5,100,20,'Bodega principal'),(6,6,100,20,'Bodega principal'),(7,7,103,20,'Bodega principal'),(8,8,100,20,'Bodega principal'),(9,9,100,20,'Bodega principal'),(10,10,105,20,'Bodega principal'),(11,11,99,20,'Bodega principal'),(12,12,104,20,'Bodega principal'),(13,13,102,20,'Bodega principal'),(14,14,101,20,'Bodega principal'),(15,15,99,20,'Bodega principal'),(16,16,100,20,'Bodega principal'),(17,17,103,20,'Bodega principal'),(18,18,94,20,'Bodega principal'),(19,19,101,20,'Bodega principal'),(20,20,103,20,'Bodega principal'),(32,32,100,10,'Bodega A');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_inventario`
--

DROP TABLE IF EXISTS `movimientos_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_inventario` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `tipo_movimiento` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cantidad` int NOT NULL,
  `fecha_movimiento` date NOT NULL,
  `motivo` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empleado` int NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `fk_movimiento_producto` (`id_producto`),
  KEY `fk_movimiento_empleado` (`id_empleado`),
  CONSTRAINT `fk_movimiento_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_movimiento_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_movimiento_cantidad` CHECK ((`cantidad` > 0)),
  CONSTRAINT `chk_movimiento_tipo` CHECK ((`tipo_movimiento` in (_utf8mb4'Entrada',_utf8mb4'Salida',_utf8mb4'Devolucion',_utf8mb4'Ajuste')))
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventario`
--

LOCK TABLES `movimientos_inventario` WRITE;
/*!40000 ALTER TABLE `movimientos_inventario` DISABLE KEYS */;
INSERT INTO `movimientos_inventario` VALUES (1,1,'Salida',7,'2026-06-01','Venta factura 1001',1),(2,2,'Salida',7,'2026-06-01','Venta factura 1001',1),(3,3,'Salida',5,'2026-06-01','Venta factura 1001',1),(4,4,'Salida',5,'2026-06-01','Venta factura 1001',1),(5,5,'Salida',1,'2026-06-02','Venta factura 1002',2),(6,6,'Salida',2,'2026-06-02','Venta factura 1002',2),(7,7,'Salida',2,'2026-06-02','Venta factura 1002',2),(8,8,'Salida',2,'2026-06-02','Venta factura 1002',2),(9,9,'Salida',2,'2026-06-03','Venta factura 1003',3),(10,10,'Salida',2,'2026-06-03','Venta factura 1003',3),(11,11,'Salida',3,'2026-06-03','Venta factura 1003',3),(12,12,'Salida',2,'2026-06-03','Venta factura 1003',3),(13,13,'Salida',2,'2026-06-04','Venta factura 1004',4),(14,14,'Salida',3,'2026-06-04','Venta factura 1004',4),(15,15,'Salida',3,'2026-06-04','Venta factura 1004',4),(16,16,'Salida',2,'2026-06-04','Venta factura 1004',4),(17,17,'Salida',2,'2026-06-05','Venta factura 1005',5),(18,18,'Salida',3,'2026-06-05','Venta factura 1005',5),(19,19,'Salida',2,'2026-06-05','Venta factura 1005',5),(20,20,'Salida',1,'2026-06-05','Venta factura 1005',5),(21,1,'Salida',8,'2026-06-06','Venta factura 1006',6),(22,2,'Salida',3,'2026-06-06','Venta factura 1006',6),(23,3,'Salida',8,'2026-06-06','Venta factura 1006',6),(24,4,'Salida',5,'2026-06-06','Venta factura 1006',6),(25,5,'Salida',1,'2026-06-07','Venta factura 1007',7),(26,6,'Salida',1,'2026-06-07','Venta factura 1007',7),(27,7,'Salida',3,'2026-06-07','Venta factura 1007',7),(28,8,'Salida',3,'2026-06-07','Venta factura 1007',7),(29,9,'Salida',1,'2026-06-08','Venta factura 1008',8),(30,10,'Salida',1,'2026-06-08','Venta factura 1008',8),(31,11,'Salida',3,'2026-06-08','Venta factura 1008',8),(32,12,'Salida',1,'2026-06-08','Venta factura 1008',8),(33,13,'Salida',1,'2026-06-09','Venta factura 1009',9),(34,14,'Salida',1,'2026-06-09','Venta factura 1009',9),(35,15,'Salida',3,'2026-06-09','Venta factura 1009',9),(36,16,'Salida',2,'2026-06-09','Venta factura 1009',9),(37,17,'Salida',2,'2026-06-10','Venta factura 1010',10),(38,18,'Salida',1,'2026-06-10','Venta factura 1010',10),(39,19,'Salida',1,'2026-06-10','Venta factura 1010',10),(40,20,'Salida',1,'2026-06-10','Venta factura 1010',10),(41,1,'Salida',8,'2026-06-11','Venta factura 1011',1),(42,2,'Salida',4,'2026-06-11','Venta factura 1011',1),(43,3,'Salida',5,'2026-06-11','Venta factura 1011',1),(44,4,'Salida',6,'2026-06-11','Venta factura 1011',1),(45,5,'Salida',1,'2026-06-12','Venta factura 1012',2),(46,6,'Salida',1,'2026-06-12','Venta factura 1012',2),(47,7,'Salida',1,'2026-06-12','Venta factura 1012',2),(48,8,'Salida',1,'2026-06-12','Venta factura 1012',2),(49,9,'Salida',3,'2026-06-13','Venta factura 1013',3),(50,10,'Salida',1,'2026-06-13','Venta factura 1013',3),(51,11,'Salida',1,'2026-06-13','Venta factura 1013',3),(52,12,'Salida',3,'2026-06-13','Venta factura 1013',3),(53,13,'Salida',2,'2026-06-14','Venta factura 1014',4),(54,14,'Salida',1,'2026-06-14','Venta factura 1014',4),(55,15,'Salida',1,'2026-06-14','Venta factura 1014',4),(56,16,'Salida',1,'2026-06-14','Venta factura 1014',4),(57,17,'Salida',3,'2026-06-15','Venta factura 1015',5),(58,18,'Salida',3,'2026-06-15','Venta factura 1015',5),(59,19,'Salida',1,'2026-06-15','Venta factura 1015',5),(60,20,'Salida',2,'2026-06-15','Venta factura 1015',5),(61,1,'Salida',4,'2026-06-16','Venta factura 1016',6),(62,2,'Salida',3,'2026-06-16','Venta factura 1016',6),(63,3,'Salida',7,'2026-06-16','Venta factura 1016',6),(64,4,'Salida',3,'2026-06-16','Venta factura 1016',6),(65,5,'Salida',3,'2026-06-17','Venta factura 1017',7),(66,6,'Salida',3,'2026-06-17','Venta factura 1017',7),(67,7,'Salida',2,'2026-06-17','Venta factura 1017',7),(68,8,'Salida',2,'2026-06-17','Venta factura 1017',7),(69,9,'Salida',1,'2026-06-18','Venta factura 1018',8),(70,10,'Salida',3,'2026-06-18','Venta factura 1018',8),(71,11,'Salida',2,'2026-06-18','Venta factura 1018',8),(72,12,'Salida',1,'2026-06-18','Venta factura 1018',8),(73,13,'Salida',2,'2026-06-19','Venta factura 1019',9),(74,14,'Salida',2,'2026-06-19','Venta factura 1019',9),(75,15,'Salida',2,'2026-06-19','Venta factura 1019',9),(76,16,'Salida',3,'2026-06-19','Venta factura 1019',9),(77,17,'Salida',1,'2026-06-20','Venta factura 1020',10),(78,18,'Salida',2,'2026-06-20','Venta factura 1020',10),(79,19,'Salida',2,'2026-06-20','Venta factura 1020',10),(80,20,'Salida',3,'2026-06-20','Venta factura 1020',10),(81,1,'Salida',3,'2026-06-21','Venta factura 1021',1),(82,2,'Salida',6,'2026-06-21','Venta factura 1021',1),(83,3,'Salida',3,'2026-06-21','Venta factura 1021',1),(84,4,'Salida',6,'2026-06-21','Venta factura 1021',1),(85,5,'Salida',2,'2026-06-22','Venta factura 1022',2),(86,6,'Salida',2,'2026-06-22','Venta factura 1022',2),(87,7,'Salida',1,'2026-06-22','Venta factura 1022',2),(88,8,'Salida',3,'2026-06-22','Venta factura 1022',2),(89,9,'Salida',2,'2026-06-23','Venta factura 1023',3),(90,10,'Salida',2,'2026-06-23','Venta factura 1023',3),(91,11,'Salida',1,'2026-06-23','Venta factura 1023',3),(92,12,'Salida',1,'2026-06-23','Venta factura 1023',3),(93,13,'Salida',1,'2026-06-24','Venta factura 1024',4),(94,14,'Salida',2,'2026-06-24','Venta factura 1024',4),(95,15,'Salida',3,'2026-06-24','Venta factura 1024',4),(96,16,'Salida',2,'2026-06-24','Venta factura 1024',4),(97,17,'Salida',2,'2026-06-25','Venta factura 1025',5),(98,18,'Salida',3,'2026-06-25','Venta factura 1025',5),(99,19,'Salida',3,'2026-06-25','Venta factura 1025',5),(100,20,'Salida',1,'2026-06-25','Venta factura 1025',5),(101,1,'Salida',5,'2026-06-26','Venta factura 1026',6),(102,2,'Salida',4,'2026-06-26','Venta factura 1026',6),(103,3,'Salida',6,'2026-06-26','Venta factura 1026',6),(104,4,'Salida',3,'2026-06-26','Venta factura 1026',6),(105,5,'Salida',2,'2026-06-27','Venta factura 1027',7),(106,6,'Salida',1,'2026-06-27','Venta factura 1027',7),(107,7,'Salida',3,'2026-06-27','Venta factura 1027',7),(108,8,'Salida',1,'2026-06-27','Venta factura 1027',7),(109,9,'Salida',2,'2026-06-28','Venta factura 1028',8),(110,10,'Salida',1,'2026-06-28','Venta factura 1028',8),(111,11,'Salida',3,'2026-06-28','Venta factura 1028',8),(112,12,'Salida',3,'2026-06-28','Venta factura 1028',8),(113,13,'Salida',3,'2026-06-29','Venta factura 1029',9),(114,14,'Salida',2,'2026-06-29','Venta factura 1029',9),(115,15,'Salida',1,'2026-06-29','Venta factura 1029',9),(116,16,'Salida',1,'2026-06-29','Venta factura 1029',9),(117,17,'Salida',1,'2026-06-30','Venta factura 1030',10),(118,18,'Salida',3,'2026-06-30','Venta factura 1030',10),(119,19,'Salida',2,'2026-06-30','Venta factura 1030',10),(120,20,'Salida',1,'2026-06-30','Venta factura 1030',10),(121,1,'Salida',8,'2026-06-01','Venta factura 1031',1),(122,2,'Salida',7,'2026-06-01','Venta factura 1031',1),(123,3,'Salida',8,'2026-06-01','Venta factura 1031',1),(124,4,'Salida',6,'2026-06-01','Venta factura 1031',1),(125,5,'Salida',3,'2026-06-02','Venta factura 1032',2),(126,6,'Salida',2,'2026-06-02','Venta factura 1032',2),(127,7,'Salida',1,'2026-06-02','Venta factura 1032',2),(128,8,'Salida',1,'2026-06-02','Venta factura 1032',2),(129,9,'Salida',2,'2026-06-03','Venta factura 1033',3),(130,10,'Salida',1,'2026-06-03','Venta factura 1033',3),(131,11,'Salida',2,'2026-06-03','Venta factura 1033',3),(132,12,'Salida',1,'2026-06-03','Venta factura 1033',3),(133,13,'Salida',1,'2026-06-04','Venta factura 1034',4),(134,14,'Salida',1,'2026-06-04','Venta factura 1034',4),(135,15,'Salida',3,'2026-06-04','Venta factura 1034',4),(136,16,'Salida',3,'2026-06-04','Venta factura 1034',4),(137,17,'Salida',1,'2026-06-05','Venta factura 1035',5),(138,18,'Salida',3,'2026-06-05','Venta factura 1035',5),(139,19,'Salida',1,'2026-06-05','Venta factura 1035',5),(140,20,'Salida',1,'2026-06-05','Venta factura 1035',5),(141,1,'Salida',5,'2026-06-06','Venta factura 1036',6),(142,2,'Salida',5,'2026-06-06','Venta factura 1036',6),(143,3,'Salida',5,'2026-06-06','Venta factura 1036',6),(144,4,'Salida',3,'2026-06-06','Venta factura 1036',6),(145,5,'Salida',1,'2026-06-07','Venta factura 1037',7),(146,6,'Salida',2,'2026-06-07','Venta factura 1037',7),(147,7,'Salida',1,'2026-06-07','Venta factura 1037',7),(148,8,'Salida',1,'2026-06-07','Venta factura 1037',7),(149,9,'Salida',2,'2026-06-08','Venta factura 1038',8),(150,10,'Salida',1,'2026-06-08','Venta factura 1038',8),(151,11,'Salida',3,'2026-06-08','Venta factura 1038',8),(152,12,'Salida',2,'2026-06-08','Venta factura 1038',8),(153,13,'Salida',2,'2026-06-09','Venta factura 1039',9),(154,14,'Salida',3,'2026-06-09','Venta factura 1039',9),(155,15,'Salida',2,'2026-06-09','Venta factura 1039',9),(156,16,'Salida',2,'2026-06-09','Venta factura 1039',9),(157,17,'Salida',2,'2026-06-10','Venta factura 1040',10),(158,18,'Salida',2,'2026-06-10','Venta factura 1040',10),(159,19,'Salida',2,'2026-06-10','Venta factura 1040',10),(160,20,'Salida',1,'2026-06-10','Venta factura 1040',10),(161,1,'Salida',8,'2026-06-11','Venta factura 1041',1),(162,2,'Salida',3,'2026-06-11','Venta factura 1041',1),(163,3,'Salida',8,'2026-06-11','Venta factura 1041',1),(164,4,'Salida',4,'2026-06-11','Venta factura 1041',1),(165,5,'Salida',3,'2026-06-12','Venta factura 1042',2),(166,6,'Salida',3,'2026-06-12','Venta factura 1042',2),(167,7,'Salida',1,'2026-06-12','Venta factura 1042',2),(168,8,'Salida',3,'2026-06-12','Venta factura 1042',2),(169,9,'Salida',2,'2026-06-13','Venta factura 1043',3),(170,10,'Salida',1,'2026-06-13','Venta factura 1043',3),(171,11,'Salida',1,'2026-06-13','Venta factura 1043',3),(172,12,'Salida',1,'2026-06-13','Venta factura 1043',3),(173,13,'Salida',1,'2026-06-14','Venta factura 1044',4),(174,14,'Salida',1,'2026-06-14','Venta factura 1044',4),(175,15,'Salida',1,'2026-06-14','Venta factura 1044',4),(176,16,'Salida',2,'2026-06-14','Venta factura 1044',4),(177,17,'Salida',2,'2026-06-15','Venta factura 1045',5),(178,18,'Salida',3,'2026-06-15','Venta factura 1045',5),(179,19,'Salida',2,'2026-06-15','Venta factura 1045',5),(180,20,'Salida',3,'2026-06-15','Venta factura 1045',5),(181,1,'Salida',3,'2026-06-16','Venta factura 1046',6),(182,2,'Salida',5,'2026-06-16','Venta factura 1046',6),(183,3,'Salida',8,'2026-06-16','Venta factura 1046',6),(184,4,'Salida',3,'2026-06-16','Venta factura 1046',6),(185,5,'Salida',3,'2026-06-17','Venta factura 1047',7),(186,6,'Salida',3,'2026-06-17','Venta factura 1047',7),(187,7,'Salida',2,'2026-06-17','Venta factura 1047',7),(188,8,'Salida',3,'2026-06-17','Venta factura 1047',7),(189,9,'Salida',3,'2026-06-18','Venta factura 1048',8),(190,10,'Salida',2,'2026-06-18','Venta factura 1048',8),(191,11,'Salida',2,'2026-06-18','Venta factura 1048',8),(192,12,'Salida',1,'2026-06-18','Venta factura 1048',8),(193,13,'Salida',3,'2026-06-19','Venta factura 1049',9),(194,14,'Salida',3,'2026-06-19','Venta factura 1049',9),(195,15,'Salida',2,'2026-06-19','Venta factura 1049',9),(196,16,'Salida',2,'2026-06-19','Venta factura 1049',9),(197,17,'Salida',1,'2026-06-20','Venta factura 1050',10),(198,18,'Salida',3,'2026-06-20','Venta factura 1050',10),(199,19,'Salida',3,'2026-06-20','Venta factura 1050',10),(200,20,'Salida',3,'2026-06-20','Venta factura 1050',10),(256,3,'Entrada',150,'2026-07-22','Ingreso de nuevo lote',1),(257,1,'Entrada',50,'2026-07-22','Lote nuevo de zapatos deportivos',1);
/*!40000 ALTER TABLE `movimientos_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tipo_producto` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `talla` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `color` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'Activo',
  `id_categoria` int NOT NULL,
  `id_proveedor` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `uq_producto_unico` (`nombre_producto`,`talla`,`color`),
  KEY `fk_producto_categoria` (`id_categoria`),
  KEY `fk_producto_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_producto_estado` CHECK ((`estado` in (_utf8mb4'Activo',_utf8mb4'Inactivo'))),
  CONSTRAINT `chk_producto_precio` CHECK ((`precio` > 0)),
  CONSTRAINT `chk_producto_tipo` CHECK ((`tipo_producto` in (_utf8mb4'Nacional',_utf8mb4'Importado')))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Zapato escolar negro','Nacional','36','Negro',35.00,'Activo',1,1),(2,'Zapato escolar cafe','Nacional','37','Cafe',36.50,'Activo',1,1),(3,'Zapatilla deportiva blanca','Importado','38','Blanco',48.50,'Activo',2,2),(4,'Zapatilla running azul','Importado','40','Azul',55.00,'Activo',2,2),(5,'Sandalia casual mujer','Nacional','36','Beige',28.00,'Activo',3,3),(6,'Sandalia playera hombre','Nacional','41','Negro',25.00,'Activo',3,3),(7,'Zapato formal hombre','Nacional','40','Negro',60.00,'Activo',4,4),(8,'Zapato formal mujer','Importado','37','Rojo',62.00,'Activo',4,5),(9,'Botin cuero cafe','Nacional','41','Cafe',75.00,'Activo',5,6),(10,'Bota industrial punta acero','Nacional','42','Negro',85.00,'Activo',6,7),(11,'Mocasin hombre','Importado','40','Azul',58.00,'Activo',4,5),(12,'Tacon negro','Importado','36','Negro',65.00,'Activo',4,8),(13,'Botin mujer beige','Importado','37','Beige',72.00,'Activo',5,8),(14,'Zapato casual urbano','Nacional','39','Gris',45.00,'Activo',7,9),(15,'Tenis juvenil rojo','Importado','38','Rojo',50.00,'Activo',2,10),(16,'Zapato infantil luces','Importado','30','Azul',42.00,'Activo',8,10),(17,'Bota lluvia nino','Nacional','31','Amarillo',32.00,'Activo',8,6),(18,'Alpargata tradicional','Nacional','39','Blanco',26.00,'Activo',7,9),(19,'Zapato ejecutivo cuero','Nacional','42','Cafe',90.00,'Activo',4,4),(20,'Zapatilla training negra','Importado','41','Negro',59.00,'Activo',2,2),(32,'Zapato de Cuero','Nacional','40','Negro',65.50,'Activo',1,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_cambio_precio` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
    -- Validamos si el precio realmente cambió
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO auditoria_precios (id_producto, precio_anterior, precio_nuevo, usuario, fecha)
        VALUES (
            NEW.id_producto, 
            OLD.precio, 
            NEW.precio, 
            CURRENT_USER(), 
            NOW()
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_promocion` int NOT NULL AUTO_INCREMENT,
  `nombre_promocion` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `porcentaje_descuento` decimal(5,2) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'Activa',
  PRIMARY KEY (`id_promocion`),
  UNIQUE KEY `nombre_promocion` (`nombre_promocion`),
  CONSTRAINT `chk_promocion_descuento` CHECK (((`porcentaje_descuento` >= 0) and (`porcentaje_descuento` <= 100))),
  CONSTRAINT `chk_promocion_estado` CHECK ((`estado` in (_utf8mb4'Activa',_utf8mb4'Inactiva'))),
  CONSTRAINT `chk_promocion_fechas` CHECK ((`fecha_fin` >= `fecha_inicio`))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,'Sin promocion',0.00,'2026-06-01','2026-12-31','Activa'),(2,'Escolar 10%',10.00,'2026-06-01','2026-12-31','Activa'),(3,'Black Friday 15%',15.00,'2026-06-01','2026-12-31','Activa'),(4,'Cliente frecuente 8%',8.00,'2026-06-01','2026-12-31','Activa'),(5,'Promocion deportiva 12%',12.00,'2026-06-01','2026-12-31','Activa'),(6,'Liquidacion 20%',20.00,'2026-06-01','2026-12-31','Activa'),(7,'Cyber Monday 18%',18.00,'2026-06-01','2026-12-31','Activa'),(8,'Descuento mayorista 10%',10.00,'2026-06-01','2026-12-31','Activa'),(9,'Promocion sandalias 7%',7.00,'2026-06-01','2026-12-31','Activa'),(10,'Temporada formal 5%',5.00,'2026-06-01','2026-12-31','Activa');
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `pais` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tipo_proveedor` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `nombre_proveedor` (`nombre_proveedor`),
  UNIQUE KEY `correo` (`correo`),
  CONSTRAINT `chk_tipo_proveedor` CHECK ((`tipo_proveedor` in (_utf8mb4'Nacional',_utf8mb4'Internacional')))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com'),(2,'SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com'),(3,'Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com'),(4,'Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com'),(5,'Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com'),(6,'Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com'),(7,'Seguridad Total Shoes','Ecuador','Nacional','022345005','contacto@seguridadtotal.com'),(8,'Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com'),(9,'Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com'),(10,'Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com'),(16,'Calzados Nike','Estados Unidos','Internacional','1800-555-000','ventas@nike.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quejas`
--

DROP TABLE IF EXISTS `quejas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quejas` (
  `id_queja` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `fecha_queja` date NOT NULL,
  `tipo_queja` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `estado` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`id_queja`),
  KEY `fk_queja_cliente` (`id_cliente`),
  CONSTRAINT `fk_queja_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_queja_estado` CHECK ((`estado` in (_utf8mb4'Pendiente',_utf8mb4'En proceso',_utf8mb4'Resuelta'))),
  CONSTRAINT `chk_queja_tipo` CHECK ((`tipo_queja` in (_utf8mb4'Reclamo',_utf8mb4'Sugerencia',_utf8mb4'Otro')))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quejas`
--

LOCK TABLES `quejas` WRITE;
/*!40000 ALTER TABLE `quejas` DISABLE KEYS */;
INSERT INTO `quejas` VALUES (1,3,'2026-06-03','Sugerencia','El cliente reporta inconveniente con el producto.','Resuelta'),(2,3,'2026-06-03','Reclamo','El cliente sugiere nuevas promociones.','Resuelta'),(3,3,'2026-06-03','Otro','El cliente indica demora en la entrega.','En proceso'),(4,4,'2026-06-04','Sugerencia','El cliente solicita mas variedad de tallas.','Resuelta'),(5,4,'2026-06-04','Sugerencia','El cliente sugiere nuevas promociones.','Pendiente'),(6,4,'2026-06-04','Sugerencia','El cliente indica demora en la entrega.','Resuelta'),(7,4,'2026-06-04','Otro','El cliente reporta inconveniente con el producto.','Pendiente'),(8,5,'2026-06-05','Sugerencia','El cliente solicita mas variedad de tallas.','Resuelta'),(9,5,'2026-06-05','Otro','El cliente indica demora en la entrega.','Resuelta'),(10,5,'2026-06-05','Sugerencia','El cliente reporta inconveniente con el producto.','Resuelta'),(11,5,'2026-06-05','Sugerencia','El cliente solicita mejorar los tiempos de atencion.','Pendiente'),(16,5,'2026-07-22','Sugerencia','Deberían abrir los domingos.','Pendiente');
/*!40000 ALTER TABLE `quejas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_accesos`
--

DROP TABLE IF EXISTS `registro_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_accesos` (
  `id_acceso` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `accion` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_acceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_accesos`
--

LOCK TABLES `registro_accesos` WRITE;
/*!40000 ALTER TABLE `registro_accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `nro_factura` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_venta` date NOT NULL,
  `tipo_venta` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `iva` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  `id_promocion` int DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  UNIQUE KEY `nro_factura` (`nro_factura`),
  KEY `fk_venta_cliente` (`id_cliente`),
  KEY `fk_venta_empleado` (`id_empleado`),
  KEY `fk_venta_promocion` (`id_promocion`),
  CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_promocion` FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id_promocion`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_venta_tipo` CHECK ((`tipo_venta` in (_utf8mb4'Mayorista',_utf8mb4'Minorista'))),
  CONSTRAINT `chk_venta_valores` CHECK (((`subtotal` >= 0) and (`descuento` >= 0) and (`iva` >= 0) and (`total` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'1001','2026-06-01','Mayorista',1018.00,101.80,137.43,1053.63,1,1,2),(2,'1002','2026-06-02','Minorista',322.00,32.20,43.47,333.27,2,2,2),(3,'1003','2026-06-03','Minorista',624.00,93.60,79.55,609.95,3,3,3),(4,'1004','2026-06-04','Minorista',513.00,41.04,70.79,542.75,4,4,4),(5,'1005','2026-06-05','Minorista',381.00,45.72,50.30,385.58,5,5,5),(6,'1006','2026-06-06','Mayorista',1052.50,210.50,126.30,968.30,6,6,6),(7,'1007','2026-06-07','Minorista',419.00,75.42,51.53,395.11,7,7,7),(8,'1008','2026-06-08','Minorista',399.00,39.90,53.86,412.96,8,8,8),(9,'1009','2026-06-09','Minorista',351.00,24.57,48.97,375.40,9,9,9),(10,'1010','2026-06-10','Minorista',239.00,11.95,34.05,261.10,10,10,10),(11,'1011','2026-06-11','Mayorista',998.50,0.00,149.78,1148.28,11,1,1),(12,'1012','2026-06-12','Minorista',175.00,17.50,23.63,181.13,12,2,2),(13,'1013','2026-06-13','Minorista',563.00,84.45,71.78,550.33,13,3,3),(14,'1014','2026-06-14','Minorista',281.00,22.48,38.78,297.30,14,4,4),(15,'1015','2026-06-15','Minorista',382.00,45.84,50.43,386.59,15,5,5),(16,'1016','2026-06-16','Mayorista',754.00,150.80,90.48,693.68,16,6,6),(17,'1017','2026-06-17','Minorista',403.00,72.54,49.56,380.02,17,7,7),(18,'1018','2026-06-18','Minorista',511.00,51.10,68.98,528.88,18,8,8),(19,'1019','2026-06-19','Minorista',460.00,32.20,64.17,491.97,19,9,9),(20,'1020','2026-06-20','Minorista',441.00,22.05,62.84,481.79,20,10,10),(21,'1021','2026-06-21','Mayorista',799.50,0.00,119.92,919.42,21,1,1),(22,'1022','2026-06-22','Minorista',352.00,35.20,47.52,364.32,22,2,2),(23,'1023','2026-06-23','Minorista',443.00,66.45,56.48,433.03,23,3,3),(24,'1024','2026-06-24','Minorista',396.00,31.68,54.65,418.97,24,4,4),(25,'1025','2026-06-25','Minorista',471.00,56.52,62.18,476.66,25,5,5),(26,'1026','2026-06-26','Mayorista',777.00,155.40,93.24,714.84,26,6,6),(27,'1027','2026-06-27','Minorista',323.00,58.14,39.73,304.59,27,7,7),(28,'1028','2026-06-28','Minorista',604.00,60.40,81.53,625.13,28,8,8),(29,'1029','2026-06-29','Minorista',398.00,27.86,55.51,425.65,29,9,9),(30,'1030','2026-06-30','Minorista',349.00,17.45,49.73,381.28,30,10,10),(31,'1031','2026-06-01','Mayorista',1253.50,0.00,188.02,1441.52,1,1,1),(32,'1032','2026-06-02','Minorista',256.00,25.60,34.56,264.96,2,2,2),(33,'1033','2026-06-03','Minorista',416.00,62.40,53.04,406.64,3,3,3),(34,'1034','2026-06-04','Minorista',393.00,31.44,54.24,415.80,4,4,4),(35,'1035','2026-06-05','Minorista',259.00,31.08,34.19,262.11,5,5,5),(36,'1036','2026-06-06','Mayorista',765.00,153.00,91.80,703.80,6,6,6),(37,'1037','2026-06-07','Minorista',200.00,36.00,24.60,188.60,7,7,7),(38,'1038','2026-06-08','Minorista',539.00,53.90,72.76,557.86,8,8,8),(39,'1039','2026-06-09','Minorista',463.00,32.41,64.59,495.18,9,9,9),(40,'1040','2026-06-10','Minorista',355.00,17.75,50.59,387.84,10,10,10),(41,'1041','2026-06-11','Mayorista',997.50,0.00,149.63,1147.13,11,1,1),(42,'1042','2026-06-12','Minorista',405.00,40.50,54.67,419.17,12,2,2),(43,'1043','2026-06-13','Minorista',358.00,53.70,45.64,349.94,13,3,3),(44,'1044','2026-06-14','Minorista',251.00,20.08,34.64,265.56,14,4,4),(45,'1045','2026-06-15','Minorista',499.00,59.88,65.87,504.99,15,5,5),(46,'1046','2026-06-16','Mayorista',840.50,168.10,100.86,773.26,16,6,6),(47,'1047','2026-06-17','Minorista',465.00,83.70,57.19,438.49,17,7,7),(48,'1048','2026-06-18','Minorista',576.00,57.60,77.77,596.17,18,8,8),(49,'1049','2026-06-19','Minorista',535.00,37.45,74.63,572.18,19,9,9),(50,'1050','2026-06-20','Minorista',557.00,27.85,79.37,608.52,20,10,10),(64,'FAC-001-0002','2026-07-22','Minorista',70.00,0.00,10.50,80.50,1,2,NULL);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_historicas_bruto`
--

DROP TABLE IF EXISTS `ventas_historicas_bruto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_historicas_bruto` (
  `id_registro` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `nro_factura` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_venta` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `tipo_venta` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `cedula_cliente` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `nombres_cliente` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `apellidos_cliente` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `telefono_cliente` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `correo_cliente` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `provincia_cliente` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_nacimiento_cliente` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `cedula_empleado` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `nombres_empleado` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `apellidos_empleado` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `cargo_empleado` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `rol_empleado` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `telefono_empleado` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `correo_empleado` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `nombre_producto` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `tipo_producto` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `categoria_producto` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `talla` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `precio_unitario` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `nombre_proveedor` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `pais_proveedor` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `tipo_proveedor` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `telefono_proveedor` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `correo_proveedor` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `cantidad` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `subtotal_linea` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `nombre_promocion` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `porcentaje_descuento` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `descuento_linea` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `iva_linea` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `total_linea` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `stock_antes` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `stock_despues` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `tipo_movimiento` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `motivo_movimiento` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `tiene_devolucion` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_devolucion` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `cantidad_devolucion` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `motivo_devolucion` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `tiene_queja` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `tipo_queja` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `descripcion_queja` text COLLATE utf8mb4_spanish_ci,
  `estado_queja` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_historicas_bruto`
--

LOCK TABLES `ventas_historicas_bruto` WRITE;
/*!40000 ALTER TABLE `ventas_historicas_bruto` DISABLE KEYS */;
INSERT INTO `ventas_historicas_bruto` VALUES ('1','1001','2026-06-01','Mayorista','1710000000','Juan','Perez','0930000000','juan.perez@gmail.com','Pichincha','1985-01-01','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapato escolar negro','Nacional','Escolar','36','Negro','35.0','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','7','245.0','Sin promocion','0','0.0','36.75','281.75','120','113','Salida','Venta factura 1001','Si','2026-06-02','1','Cambio de color','No','','',''),('2','1001','2026-06-01','Mayorista','1710000000','Juan','Perez','0930000000','juan.perez@gmail.com','Pichincha','1985-01-01','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapato escolar cafe','Nacional','Escolar','37','Cafe','36.5','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','7','255.5','Sin promocion','0','0.0','38.32','293.82','120','113','Salida','Venta factura 1001','Si','2026-06-08','1','No cumple expectativa','No','','',''),('3','1001','2026-06-01','Mayorista','1710000000','Juan','Perez','0930000000','juan.perez@gmail.com','Pichincha','1985-01-01','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapatilla deportiva blanca','Importado','Deportivo','38','Blanco','48.5','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','5','242.5','Sin promocion','0','0.0','36.38','278.88','120','115','Salida','Venta factura 1001','Si','2026-06-02','1','No cumple expectativa','No','','',''),('4','1001','2026-06-01','Mayorista','1710000000','Juan','Perez','0930000000','juan.perez@gmail.com','Pichincha','1985-01-01','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapatilla running azul','Importado','Deportivo','40','Azul','55.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','5','275.0','Sin promocion','0','0.0','41.25','316.25','120','115','Salida','Venta factura 1001','Si','2026-06-05','1','Producto equivocado','No','','',''),('5','1002','2026-06-02','Minorista','1810000001','Maria','Lopez','0930000001','maria.lopez@gmail.com','Guayas','1986-02-02','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Sandalia casual mujer','Nacional','Sandalias','36','Beige','28.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','1','28.0','Escolar 10%','10','2.8','3.78','28.98','120','119','Salida','Venta factura 1002','Si','2026-06-03','1','Talla incorrecta','No','','',''),('6','1002','2026-06-02','Minorista','1810000001','Maria','Lopez','0930000001','maria.lopez@gmail.com','Guayas','1986-02-02','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Sandalia playera hombre','Nacional','Sandalias','41','Negro','25.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','2','50.0','Escolar 10%','10','5.0','6.75','51.75','120','118','Salida','Venta factura 1002','Si','2026-06-08','1','Defecto de fabrica','No','','',''),('7','1002','2026-06-02','Minorista','1810000001','Maria','Lopez','0930000001','maria.lopez@gmail.com','Guayas','1986-02-02','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Zapato formal hombre','Nacional','Formal','40','Negro','60.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','2','120.0','Escolar 10%','10','12.0','16.2','124.2','120','118','Salida','Venta factura 1002','Si','2026-06-03','1','Producto equivocado','No','','',''),('8','1002','2026-06-02','Minorista','1810000001','Maria','Lopez','0930000001','maria.lopez@gmail.com','Guayas','1986-02-02','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Zapato formal mujer','Importado','Formal','37','Rojo','62.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','2','124.0','Escolar 10%','10','12.4','16.74','128.34','120','118','Salida','Venta factura 1002','Si','2026-06-07','1','No cumple expectativa','No','','',''),('9','1003','2026-06-03','Minorista','1910000002','Carlos','Andrade','0930000002','carlos.andrade@gmail.com','Azuay','1987-03-03','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Botin cuero cafe','Nacional','Botas','41','Cafe','75.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','2','150.0','Black Friday 15%','15','22.5','19.12','146.62','120','118','Salida','Venta factura 1003','Si','2026-06-10','1','Defecto de fabrica','No','','',''),('10','1003','2026-06-03','Minorista','1910000002','Carlos','Andrade','0930000002','carlos.andrade@gmail.com','Azuay','1987-03-03','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Bota industrial punta acero','Nacional','Industrial','42','Negro','85.0','Seguridad Total Shoes','Ecuador','Nacional','022345005','contacto@seguridadtotal.com','2','170.0','Black Friday 15%','15','25.5','21.68','166.18','120','118','Salida','Venta factura 1003','Si','2026-06-05','1','Defecto de fabrica','Si','Sugerencia','El cliente reporta inconveniente con el producto.','Resuelta'),('11','1003','2026-06-03','Minorista','1910000002','Carlos','Andrade','0930000002','carlos.andrade@gmail.com','Azuay','1987-03-03','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Mocasin hombre','Importado','Formal','40','Azul','58.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','3','174.0','Black Friday 15%','15','26.1','22.18','170.08','120','117','Salida','Venta factura 1003','Si','2026-06-08','1','No cumple expectativa','Si','Reclamo','El cliente sugiere nuevas promociones.','Resuelta'),('12','1003','2026-06-03','Minorista','1910000002','Carlos','Andrade','0930000002','carlos.andrade@gmail.com','Azuay','1987-03-03','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Tacon negro','Importado','Formal','36','Negro','65.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','2','130.0','Black Friday 15%','15','19.5','16.57','127.07','120','118','Salida','Venta factura 1003','Si','2026-06-06','1','Cambio de color','Si','Otro','El cliente indica demora en la entrega.','En proceso'),('13','1004','2026-06-04','Minorista','2010000003','Ana','Torres','0930000003','ana.torres@gmail.com','Manabi','1988-04-04','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Botin mujer beige','Importado','Botas','37','Beige','72.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','2','144.0','Cliente frecuente 8%','8','11.52','19.87','152.35','120','118','Salida','Venta factura 1004','Si','2026-06-09','1','Defecto de fabrica','Si','Sugerencia','El cliente solicita mas variedad de tallas.','Resuelta'),('14','1004','2026-06-04','Minorista','2010000003','Ana','Torres','0930000003','ana.torres@gmail.com','Manabi','1988-04-04','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Zapato casual urbano','Nacional','Casual','39','Gris','45.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','3','135.0','Cliente frecuente 8%','8','10.8','18.63','142.83','120','117','Salida','Venta factura 1004','Si','2026-06-10','1','Producto equivocado','Si','Sugerencia','El cliente sugiere nuevas promociones.','Pendiente'),('15','1004','2026-06-04','Minorista','2010000003','Ana','Torres','0930000003','ana.torres@gmail.com','Manabi','1988-04-04','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Tenis juvenil rojo','Importado','Deportivo','38','Rojo','50.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','3','150.0','Cliente frecuente 8%','8','12.0','20.7','158.7','120','117','Salida','Venta factura 1004','Si','2026-06-07','1','Defecto de fabrica','Si','Sugerencia','El cliente indica demora en la entrega.','Resuelta'),('16','1004','2026-06-04','Minorista','2010000003','Ana','Torres','0930000003','ana.torres@gmail.com','Manabi','1988-04-04','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Zapato infantil luces','Importado','Infantil','30','Azul','42.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','2','84.0','Cliente frecuente 8%','8','6.72','11.59','88.87','120','118','Salida','Venta factura 1004','Si','2026-06-11','1','Talla incorrecta','Si','Otro','El cliente reporta inconveniente con el producto.','Pendiente'),('17','1005','2026-06-05','Minorista','2110000004','Luis','Zambrano','0930000004','luis.zambrano@gmail.com','Tungurahua','1989-05-05','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Bota lluvia nino','Nacional','Infantil','31','Amarillo','32.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','2','64.0','Promocion deportiva 12%','12','7.68','8.45','64.77','120','118','Salida','Venta factura 1005','Si','2026-06-11','1','Producto equivocado','Si','Sugerencia','El cliente solicita mas variedad de tallas.','Resuelta'),('18','1005','2026-06-05','Minorista','2110000004','Luis','Zambrano','0930000004','luis.zambrano@gmail.com','Tungurahua','1989-05-05','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Alpargata tradicional','Nacional','Casual','39','Blanco','26.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','3','78.0','Promocion deportiva 12%','12','9.36','10.3','78.94','120','117','Salida','Venta factura 1005','Si','2026-06-07','1','Cambio de color','Si','Otro','El cliente indica demora en la entrega.','Resuelta'),('19','1005','2026-06-05','Minorista','2110000004','Luis','Zambrano','0930000004','luis.zambrano@gmail.com','Tungurahua','1989-05-05','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Zapato ejecutivo cuero','Nacional','Formal','42','Cafe','90.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','2','180.0','Promocion deportiva 12%','12','21.6','23.76','182.16','120','118','Salida','Venta factura 1005','Si','2026-06-06','1','Talla incorrecta','Si','Sugerencia','El cliente reporta inconveniente con el producto.','Resuelta'),('20','1005','2026-06-05','Minorista','2110000004','Luis','Zambrano','0930000004','luis.zambrano@gmail.com','Tungurahua','1989-05-05','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Zapatilla training negra','Importado','Deportivo','41','Negro','59.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','1','59.0','Promocion deportiva 12%','12','7.08','7.79','59.71','120','119','Salida','Venta factura 1005','Si','2026-06-09','1','Defecto de fabrica','Si','Sugerencia','El cliente solicita mejorar los tiempos de atencion.','Pendiente'),('21','1006','2026-06-06','Mayorista','2210000005','Andrea','Salazar','0930000005','andrea.salazar@gmail.com','Loja','1990-06-06','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapato escolar negro','Nacional','Escolar','36','Negro','35.0','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','8','280.0','Liquidacion 20%','20','56.0','33.6','257.6','113','105','Salida','Venta factura 1006','No','','','','No','','',''),('22','1006','2026-06-06','Mayorista','2210000005','Andrea','Salazar','0930000005','andrea.salazar@gmail.com','Loja','1990-06-06','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapato escolar cafe','Nacional','Escolar','37','Cafe','36.5','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','3','109.5','Liquidacion 20%','20','21.9','13.14','100.74','113','110','Salida','Venta factura 1006','No','','','','No','','',''),('23','1006','2026-06-06','Mayorista','2210000005','Andrea','Salazar','0930000005','andrea.salazar@gmail.com','Loja','1990-06-06','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapatilla deportiva blanca','Importado','Deportivo','38','Blanco','48.5','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','8','388.0','Liquidacion 20%','20','77.6','46.56','356.96','115','107','Salida','Venta factura 1006','No','','','','No','','',''),('24','1006','2026-06-06','Mayorista','2210000005','Andrea','Salazar','0930000005','andrea.salazar@gmail.com','Loja','1990-06-06','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapatilla running azul','Importado','Deportivo','40','Azul','55.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','5','275.0','Liquidacion 20%','20','55.0','33.0','253.0','115','110','Salida','Venta factura 1006','No','','','','No','','',''),('25','1007','2026-06-07','Minorista','2310000006','Pedro','Mena','0930000006','pedro.mena@gmail.com','Imbabura','1991-07-07','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Sandalia casual mujer','Nacional','Sandalias','36','Beige','28.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','1','28.0','Cyber Monday 18%','18','5.04','3.44','26.4','119','118','Salida','Venta factura 1007','No','','','','No','','',''),('26','1007','2026-06-07','Minorista','2310000006','Pedro','Mena','0930000006','pedro.mena@gmail.com','Imbabura','1991-07-07','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Sandalia playera hombre','Nacional','Sandalias','41','Negro','25.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','1','25.0','Cyber Monday 18%','18','4.5','3.07','23.57','118','117','Salida','Venta factura 1007','No','','','','No','','',''),('27','1007','2026-06-07','Minorista','2310000006','Pedro','Mena','0930000006','pedro.mena@gmail.com','Imbabura','1991-07-07','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Zapato formal hombre','Nacional','Formal','40','Negro','60.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','3','180.0','Cyber Monday 18%','18','32.4','22.14','169.74','118','115','Salida','Venta factura 1007','No','','','','No','','',''),('28','1007','2026-06-07','Minorista','2310000006','Pedro','Mena','0930000006','pedro.mena@gmail.com','Imbabura','1991-07-07','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Zapato formal mujer','Importado','Formal','37','Rojo','62.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','3','186.0','Cyber Monday 18%','18','33.48','22.88','175.4','118','115','Salida','Venta factura 1007','No','','','','No','','',''),('29','1008','2026-06-08','Minorista','1710000007','Camila','Vera','0930000007','camila.vera@gmail.com','El Oro','1992-08-08','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Botin cuero cafe','Nacional','Botas','41','Cafe','75.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','1','75.0','Descuento mayorista 10%','10','7.5','10.12','77.62','118','117','Salida','Venta factura 1008','No','','','','No','','',''),('30','1008','2026-06-08','Minorista','1710000007','Camila','Vera','0930000007','camila.vera@gmail.com','El Oro','1992-08-08','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Bota industrial punta acero','Nacional','Industrial','42','Negro','85.0','Seguridad Total Shoes','Ecuador','Nacional','022345005','contacto@seguridadtotal.com','1','85.0','Descuento mayorista 10%','10','8.5','11.47','87.97','118','117','Salida','Venta factura 1008','No','','','','No','','',''),('31','1008','2026-06-08','Minorista','1710000007','Camila','Vera','0930000007','camila.vera@gmail.com','El Oro','1992-08-08','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Mocasin hombre','Importado','Formal','40','Azul','58.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','3','174.0','Descuento mayorista 10%','10','17.4','23.49','180.09','117','114','Salida','Venta factura 1008','No','','','','No','','',''),('32','1008','2026-06-08','Minorista','1710000007','Camila','Vera','0930000007','camila.vera@gmail.com','El Oro','1992-08-08','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Tacon negro','Importado','Formal','36','Negro','65.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','1','65.0','Descuento mayorista 10%','10','6.5','8.78','67.28','118','117','Salida','Venta factura 1008','No','','','','No','','',''),('33','1009','2026-06-09','Minorista','1810000008','Jose','Cedeno','0930000008','jose.cedeno@gmail.com','Cotopaxi','1993-09-09','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Botin mujer beige','Importado','Botas','37','Beige','72.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','1','72.0','Promocion sandalias 7%','7','5.04','10.04','77.0','118','117','Salida','Venta factura 1009','No','','','','No','','',''),('34','1009','2026-06-09','Minorista','1810000008','Jose','Cedeno','0930000008','jose.cedeno@gmail.com','Cotopaxi','1993-09-09','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Zapato casual urbano','Nacional','Casual','39','Gris','45.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','1','45.0','Promocion sandalias 7%','7','3.15','6.28','48.13','117','116','Salida','Venta factura 1009','No','','','','No','','',''),('35','1009','2026-06-09','Minorista','1810000008','Jose','Cedeno','0930000008','jose.cedeno@gmail.com','Cotopaxi','1993-09-09','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Tenis juvenil rojo','Importado','Deportivo','38','Rojo','50.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','3','150.0','Promocion sandalias 7%','7','10.5','20.93','160.43','117','114','Salida','Venta factura 1009','No','','','','No','','',''),('36','1009','2026-06-09','Minorista','1810000008','Jose','Cedeno','0930000008','jose.cedeno@gmail.com','Cotopaxi','1993-09-09','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Zapato infantil luces','Importado','Infantil','30','Azul','42.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','2','84.0','Promocion sandalias 7%','7','5.88','11.72','89.84','118','116','Salida','Venta factura 1009','No','','','','No','','',''),('37','1010','2026-06-10','Minorista','1910000009','Daniela','Paredes','0930000009','daniela.paredes@gmail.com','Chimborazo','1994-10-10','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Bota lluvia nino','Nacional','Infantil','31','Amarillo','32.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','2','64.0','Temporada formal 5%','5','3.2','9.12','69.92','118','116','Salida','Venta factura 1010','No','','','','No','','',''),('38','1010','2026-06-10','Minorista','1910000009','Daniela','Paredes','0930000009','daniela.paredes@gmail.com','Chimborazo','1994-10-10','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Alpargata tradicional','Nacional','Casual','39','Blanco','26.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','1','26.0','Temporada formal 5%','5','1.3','3.7','28.4','117','116','Salida','Venta factura 1010','No','','','','No','','',''),('39','1010','2026-06-10','Minorista','1910000009','Daniela','Paredes','0930000009','daniela.paredes@gmail.com','Chimborazo','1994-10-10','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Zapato ejecutivo cuero','Nacional','Formal','42','Cafe','90.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','1','90.0','Temporada formal 5%','5','4.5','12.82','98.32','118','117','Salida','Venta factura 1010','No','','','','No','','',''),('40','1010','2026-06-10','Minorista','1910000009','Daniela','Paredes','0930000009','daniela.paredes@gmail.com','Chimborazo','1994-10-10','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Zapatilla training negra','Importado','Deportivo','41','Negro','59.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','1','59.0','Temporada formal 5%','5','2.95','8.41','64.46','119','118','Salida','Venta factura 1010','No','','','','No','','',''),('41','1011','2026-06-11','Mayorista','2010000010','Miguel','Gomez','0930000010','miguel.gomez@gmail.com','Pichincha','1995-11-11','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapato escolar negro','Nacional','Escolar','36','Negro','35.0','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','8','280.0','Sin promocion','0','0.0','42.0','322.0','105','97','Salida','Venta factura 1011','No','','','','No','','',''),('42','1011','2026-06-11','Mayorista','2010000010','Miguel','Gomez','0930000010','miguel.gomez@gmail.com','Pichincha','1995-11-11','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapato escolar cafe','Nacional','Escolar','37','Cafe','36.5','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','4','146.0','Sin promocion','0','0.0','21.9','167.9','110','106','Salida','Venta factura 1011','No','','','','No','','',''),('43','1011','2026-06-11','Mayorista','2010000010','Miguel','Gomez','0930000010','miguel.gomez@gmail.com','Pichincha','1995-11-11','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapatilla deportiva blanca','Importado','Deportivo','38','Blanco','48.5','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','5','242.5','Sin promocion','0','0.0','36.38','278.88','107','102','Salida','Venta factura 1011','No','','','','No','','',''),('44','1011','2026-06-11','Mayorista','2010000010','Miguel','Gomez','0930000010','miguel.gomez@gmail.com','Pichincha','1995-11-11','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapatilla running azul','Importado','Deportivo','40','Azul','55.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','6','330.0','Sin promocion','0','0.0','49.5','379.5','110','104','Salida','Venta factura 1011','No','','','','No','','',''),('45','1012','2026-06-12','Minorista','2110000011','Sofia','Castro','0930000011','sofia.castro@gmail.com','Guayas','1996-12-12','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Sandalia casual mujer','Nacional','Sandalias','36','Beige','28.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','1','28.0','Escolar 10%','10','2.8','3.78','28.98','118','117','Salida','Venta factura 1012','No','','','','No','','',''),('46','1012','2026-06-12','Minorista','2110000011','Sofia','Castro','0930000011','sofia.castro@gmail.com','Guayas','1996-12-12','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Sandalia playera hombre','Nacional','Sandalias','41','Negro','25.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','1','25.0','Escolar 10%','10','2.5','3.38','25.88','117','116','Salida','Venta factura 1012','No','','','','No','','',''),('47','1012','2026-06-12','Minorista','2110000011','Sofia','Castro','0930000011','sofia.castro@gmail.com','Guayas','1996-12-12','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Zapato formal hombre','Nacional','Formal','40','Negro','60.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','1','60.0','Escolar 10%','10','6.0','8.1','62.1','115','114','Salida','Venta factura 1012','No','','','','No','','',''),('48','1012','2026-06-12','Minorista','2110000011','Sofia','Castro','0930000011','sofia.castro@gmail.com','Guayas','1996-12-12','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Zapato formal mujer','Importado','Formal','37','Rojo','62.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','1','62.0','Escolar 10%','10','6.2','8.37','64.17','115','114','Salida','Venta factura 1012','No','','','','No','','',''),('49','1013','2026-06-13','Minorista','2210000012','Jorge','Morales','0930000012','jorge.morales@gmail.com','Azuay','1997-01-13','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Botin cuero cafe','Nacional','Botas','41','Cafe','75.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','3','225.0','Black Friday 15%','15','33.75','28.69','219.94','117','114','Salida','Venta factura 1013','No','','','','No','','',''),('50','1013','2026-06-13','Minorista','2210000012','Jorge','Morales','0930000012','jorge.morales@gmail.com','Azuay','1997-01-13','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Bota industrial punta acero','Nacional','Industrial','42','Negro','85.0','Seguridad Total Shoes','Ecuador','Nacional','022345005','contacto@seguridadtotal.com','1','85.0','Black Friday 15%','15','12.75','10.84','83.09','117','116','Salida','Venta factura 1013','No','','','','No','','',''),('51','1013','2026-06-13','Minorista','2210000012','Jorge','Morales','0930000012','jorge.morales@gmail.com','Azuay','1997-01-13','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Mocasin hombre','Importado','Formal','40','Azul','58.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','1','58.0','Black Friday 15%','15','8.7','7.39','56.69','114','113','Salida','Venta factura 1013','No','','','','No','','',''),('52','1013','2026-06-13','Minorista','2210000012','Jorge','Morales','0930000012','jorge.morales@gmail.com','Azuay','1997-01-13','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Tacon negro','Importado','Formal','36','Negro','65.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','3','195.0','Black Friday 15%','15','29.25','24.86','190.61','117','114','Salida','Venta factura 1013','No','','','','No','','',''),('53','1014','2026-06-14','Minorista','2310000013','Valeria','Herrera','0930000013','valeria.herrera@gmail.com','Manabi','1998-02-14','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Botin mujer beige','Importado','Botas','37','Beige','72.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','2','144.0','Cliente frecuente 8%','8','11.52','19.87','152.35','117','115','Salida','Venta factura 1014','No','','','','No','','',''),('54','1014','2026-06-14','Minorista','2310000013','Valeria','Herrera','0930000013','valeria.herrera@gmail.com','Manabi','1998-02-14','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Zapato casual urbano','Nacional','Casual','39','Gris','45.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','1','45.0','Cliente frecuente 8%','8','3.6','6.21','47.61','116','115','Salida','Venta factura 1014','No','','','','No','','',''),('55','1014','2026-06-14','Minorista','2310000013','Valeria','Herrera','0930000013','valeria.herrera@gmail.com','Manabi','1998-02-14','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Tenis juvenil rojo','Importado','Deportivo','38','Rojo','50.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','1','50.0','Cliente frecuente 8%','8','4.0','6.9','52.9','114','113','Salida','Venta factura 1014','No','','','','No','','',''),('56','1014','2026-06-14','Minorista','2310000013','Valeria','Herrera','0930000013','valeria.herrera@gmail.com','Manabi','1998-02-14','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Zapato infantil luces','Importado','Infantil','30','Azul','42.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','1','42.0','Cliente frecuente 8%','8','3.36','5.8','44.44','116','115','Salida','Venta factura 1014','No','','','','No','','',''),('57','1015','2026-06-15','Minorista','1710000014','Diego','Jimenez','0930000014','diego.jimenez@gmail.com','Tungurahua','1999-03-15','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Bota lluvia nino','Nacional','Infantil','31','Amarillo','32.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','3','96.0','Promocion deportiva 12%','12','11.52','12.67','97.15','116','113','Salida','Venta factura 1015','No','','','','No','','',''),('58','1015','2026-06-15','Minorista','1710000014','Diego','Jimenez','0930000014','diego.jimenez@gmail.com','Tungurahua','1999-03-15','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Alpargata tradicional','Nacional','Casual','39','Blanco','26.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','3','78.0','Promocion deportiva 12%','12','9.36','10.3','78.94','116','113','Salida','Venta factura 1015','No','','','','No','','',''),('59','1015','2026-06-15','Minorista','1710000014','Diego','Jimenez','0930000014','diego.jimenez@gmail.com','Tungurahua','1999-03-15','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Zapato ejecutivo cuero','Nacional','Formal','42','Cafe','90.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','1','90.0','Promocion deportiva 12%','12','10.8','11.88','91.08','117','116','Salida','Venta factura 1015','No','','','','No','','',''),('60','1015','2026-06-15','Minorista','1710000014','Diego','Jimenez','0930000014','diego.jimenez@gmail.com','Tungurahua','1999-03-15','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Zapatilla training negra','Importado','Deportivo','41','Negro','59.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','2','118.0','Promocion deportiva 12%','12','14.16','15.58','119.42','118','116','Salida','Venta factura 1015','No','','','','No','','',''),('61','1016','2026-06-16','Mayorista','1810000015','Gabriela','Guerrero','0930000015','gabriela.guerrero@gmail.com','Loja','2000-04-16','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapato escolar negro','Nacional','Escolar','36','Negro','35.0','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','4','140.0','Liquidacion 20%','20','28.0','16.8','128.8','97','93','Salida','Venta factura 1016','No','','','','No','','',''),('62','1016','2026-06-16','Mayorista','1810000015','Gabriela','Guerrero','0930000015','gabriela.guerrero@gmail.com','Loja','2000-04-16','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapato escolar cafe','Nacional','Escolar','37','Cafe','36.5','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','3','109.5','Liquidacion 20%','20','21.9','13.14','100.74','106','103','Salida','Venta factura 1016','No','','','','No','','',''),('63','1016','2026-06-16','Mayorista','1810000015','Gabriela','Guerrero','0930000015','gabriela.guerrero@gmail.com','Loja','2000-04-16','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapatilla deportiva blanca','Importado','Deportivo','38','Blanco','48.5','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','7','339.5','Liquidacion 20%','20','67.9','40.74','312.34','102','95','Salida','Venta factura 1016','No','','','','No','','',''),('64','1016','2026-06-16','Mayorista','1810000015','Gabriela','Guerrero','0930000015','gabriela.guerrero@gmail.com','Loja','2000-04-16','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapatilla running azul','Importado','Deportivo','40','Azul','55.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','3','165.0','Liquidacion 20%','20','33.0','19.8','151.8','104','101','Salida','Venta factura 1016','No','','','','No','','',''),('65','1017','2026-06-17','Minorista','1910000016','Ricardo','Ortega','0930000016','ricardo.ortega@gmail.com','Imbabura','2001-05-17','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Sandalia casual mujer','Nacional','Sandalias','36','Beige','28.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','3','84.0','Cyber Monday 18%','18','15.12','10.33','79.21','117','114','Salida','Venta factura 1017','No','','','','No','','',''),('66','1017','2026-06-17','Minorista','1910000016','Ricardo','Ortega','0930000016','ricardo.ortega@gmail.com','Imbabura','2001-05-17','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Sandalia playera hombre','Nacional','Sandalias','41','Negro','25.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','3','75.0','Cyber Monday 18%','18','13.5','9.22','70.72','116','113','Salida','Venta factura 1017','No','','','','No','','',''),('67','1017','2026-06-17','Minorista','1910000016','Ricardo','Ortega','0930000016','ricardo.ortega@gmail.com','Imbabura','2001-05-17','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Zapato formal hombre','Nacional','Formal','40','Negro','60.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','2','120.0','Cyber Monday 18%','18','21.6','14.76','113.16','114','112','Salida','Venta factura 1017','No','','','','No','','',''),('68','1017','2026-06-17','Minorista','1910000016','Ricardo','Ortega','0930000016','ricardo.ortega@gmail.com','Imbabura','2001-05-17','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Zapato formal mujer','Importado','Formal','37','Rojo','62.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','2','124.0','Cyber Monday 18%','18','22.32','15.25','116.93','114','112','Salida','Venta factura 1017','No','','','','No','','',''),('69','1018','2026-06-18','Minorista','2010000017','Paula','Reyes','0930000017','paula.reyes@gmail.com','El Oro','2002-06-18','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Botin cuero cafe','Nacional','Botas','41','Cafe','75.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','1','75.0','Descuento mayorista 10%','10','7.5','10.12','77.62','114','113','Salida','Venta factura 1018','No','','','','No','','',''),('70','1018','2026-06-18','Minorista','2010000017','Paula','Reyes','0930000017','paula.reyes@gmail.com','El Oro','2002-06-18','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Bota industrial punta acero','Nacional','Industrial','42','Negro','85.0','Seguridad Total Shoes','Ecuador','Nacional','022345005','contacto@seguridadtotal.com','3','255.0','Descuento mayorista 10%','10','25.5','34.42','263.92','116','113','Salida','Venta factura 1018','No','','','','No','','',''),('71','1018','2026-06-18','Minorista','2010000017','Paula','Reyes','0930000017','paula.reyes@gmail.com','El Oro','2002-06-18','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Mocasin hombre','Importado','Formal','40','Azul','58.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','2','116.0','Descuento mayorista 10%','10','11.6','15.66','120.06','113','111','Salida','Venta factura 1018','No','','','','No','','',''),('72','1018','2026-06-18','Minorista','2010000017','Paula','Reyes','0930000017','paula.reyes@gmail.com','El Oro','2002-06-18','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Tacon negro','Importado','Formal','36','Negro','65.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','1','65.0','Descuento mayorista 10%','10','6.5','8.78','67.28','114','113','Salida','Venta factura 1018','No','','','','No','','',''),('73','1019','2026-06-19','Minorista','2110000018','Mateo','Toapanta','0930000018','mateo.toapanta@gmail.com','Cotopaxi','1985-07-19','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Botin mujer beige','Importado','Botas','37','Beige','72.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','2','144.0','Promocion sandalias 7%','7','10.08','20.09','154.01','115','113','Salida','Venta factura 1019','No','','','','No','','',''),('74','1019','2026-06-19','Minorista','2110000018','Mateo','Toapanta','0930000018','mateo.toapanta@gmail.com','Cotopaxi','1985-07-19','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Zapato casual urbano','Nacional','Casual','39','Gris','45.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','2','90.0','Promocion sandalias 7%','7','6.3','12.55','96.25','115','113','Salida','Venta factura 1019','No','','','','No','','',''),('75','1019','2026-06-19','Minorista','2110000018','Mateo','Toapanta','0930000018','mateo.toapanta@gmail.com','Cotopaxi','1985-07-19','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Tenis juvenil rojo','Importado','Deportivo','38','Rojo','50.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','2','100.0','Promocion sandalias 7%','7','7.0','13.95','106.95','113','111','Salida','Venta factura 1019','No','','','','No','','',''),('76','1019','2026-06-19','Minorista','2110000018','Mateo','Toapanta','0930000018','mateo.toapanta@gmail.com','Cotopaxi','1985-07-19','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Zapato infantil luces','Importado','Infantil','30','Azul','42.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','3','126.0','Promocion sandalias 7%','7','8.82','17.58','134.76','115','112','Salida','Venta factura 1019','No','','','','No','','',''),('77','1020','2026-06-20','Minorista','2210000019','Diana','Nunez','0930000019','diana.nunez@gmail.com','Chimborazo','1986-08-20','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Bota lluvia nino','Nacional','Infantil','31','Amarillo','32.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','1','32.0','Temporada formal 5%','5','1.6','4.56','34.96','113','112','Salida','Venta factura 1020','No','','','','No','','',''),('78','1020','2026-06-20','Minorista','2210000019','Diana','Nunez','0930000019','diana.nunez@gmail.com','Chimborazo','1986-08-20','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Alpargata tradicional','Nacional','Casual','39','Blanco','26.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','2','52.0','Temporada formal 5%','5','2.6','7.41','56.81','113','111','Salida','Venta factura 1020','No','','','','No','','',''),('79','1020','2026-06-20','Minorista','2210000019','Diana','Nunez','0930000019','diana.nunez@gmail.com','Chimborazo','1986-08-20','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Zapato ejecutivo cuero','Nacional','Formal','42','Cafe','90.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','2','180.0','Temporada formal 5%','5','9.0','25.65','196.65','116','114','Salida','Venta factura 1020','No','','','','No','','',''),('80','1020','2026-06-20','Minorista','2210000019','Diana','Nunez','0930000019','diana.nunez@gmail.com','Chimborazo','1986-08-20','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Zapatilla training negra','Importado','Deportivo','41','Negro','59.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','3','177.0','Temporada formal 5%','5','8.85','25.22','193.37','116','113','Salida','Venta factura 1020','No','','','','No','','',''),('81','1021','2026-06-21','Mayorista','2310000020','Sebastian','Flores','0930000020','sebastian.flores@gmail.com','Pichincha','1987-09-21','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapato escolar negro','Nacional','Escolar','36','Negro','35.0','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','3','105.0','Sin promocion','0','0.0','15.75','120.75','93','90','Salida','Venta factura 1021','No','','','','No','','',''),('82','1021','2026-06-21','Mayorista','2310000020','Sebastian','Flores','0930000020','sebastian.flores@gmail.com','Pichincha','1987-09-21','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapato escolar cafe','Nacional','Escolar','37','Cafe','36.5','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','6','219.0','Sin promocion','0','0.0','32.85','251.85','103','97','Salida','Venta factura 1021','No','','','','No','','',''),('83','1021','2026-06-21','Mayorista','2310000020','Sebastian','Flores','0930000020','sebastian.flores@gmail.com','Pichincha','1987-09-21','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapatilla deportiva blanca','Importado','Deportivo','38','Blanco','48.5','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','3','145.5','Sin promocion','0','0.0','21.82','167.32','95','92','Salida','Venta factura 1021','No','','','','No','','',''),('84','1021','2026-06-21','Mayorista','2310000020','Sebastian','Flores','0930000020','sebastian.flores@gmail.com','Pichincha','1987-09-21','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapatilla running azul','Importado','Deportivo','40','Azul','55.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','6','330.0','Sin promocion','0','0.0','49.5','379.5','101','95','Salida','Venta factura 1021','No','','','','No','','',''),('85','1022','2026-06-22','Minorista','1710000021','Lucia','Molina','0930000021','lucia.molina@gmail.com','Guayas','1988-10-22','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Sandalia casual mujer','Nacional','Sandalias','36','Beige','28.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','2','56.0','Escolar 10%','10','5.6','7.56','57.96','114','112','Salida','Venta factura 1022','No','','','','No','','',''),('86','1022','2026-06-22','Minorista','1710000021','Lucia','Molina','0930000021','lucia.molina@gmail.com','Guayas','1988-10-22','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Sandalia playera hombre','Nacional','Sandalias','41','Negro','25.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','2','50.0','Escolar 10%','10','5.0','6.75','51.75','113','111','Salida','Venta factura 1022','No','','','','No','','',''),('87','1022','2026-06-22','Minorista','1710000021','Lucia','Molina','0930000021','lucia.molina@gmail.com','Guayas','1988-10-22','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Zapato formal hombre','Nacional','Formal','40','Negro','60.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','1','60.0','Escolar 10%','10','6.0','8.1','62.1','112','111','Salida','Venta factura 1022','No','','','','No','','',''),('88','1022','2026-06-22','Minorista','1710000021','Lucia','Molina','0930000021','lucia.molina@gmail.com','Guayas','1988-10-22','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Zapato formal mujer','Importado','Formal','37','Rojo','62.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','3','186.0','Escolar 10%','10','18.6','25.11','192.51','112','109','Salida','Venta factura 1022','No','','','','No','','',''),('89','1023','2026-06-23','Minorista','1810000022','Andres','Ramos','0930000022','andres.ramos@gmail.com','Azuay','1989-11-23','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Botin cuero cafe','Nacional','Botas','41','Cafe','75.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','2','150.0','Black Friday 15%','15','22.5','19.12','146.62','113','111','Salida','Venta factura 1023','No','','','','No','','',''),('90','1023','2026-06-23','Minorista','1810000022','Andres','Ramos','0930000022','andres.ramos@gmail.com','Azuay','1989-11-23','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Bota industrial punta acero','Nacional','Industrial','42','Negro','85.0','Seguridad Total Shoes','Ecuador','Nacional','022345005','contacto@seguridadtotal.com','2','170.0','Black Friday 15%','15','25.5','21.68','166.18','113','111','Salida','Venta factura 1023','No','','','','No','','',''),('91','1023','2026-06-23','Minorista','1810000022','Andres','Ramos','0930000022','andres.ramos@gmail.com','Azuay','1989-11-23','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Mocasin hombre','Importado','Formal','40','Azul','58.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','1','58.0','Black Friday 15%','15','8.7','7.39','56.69','111','110','Salida','Venta factura 1023','No','','','','No','','',''),('92','1023','2026-06-23','Minorista','1810000022','Andres','Ramos','0930000022','andres.ramos@gmail.com','Azuay','1989-11-23','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Tacon negro','Importado','Formal','36','Negro','65.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','1','65.0','Black Friday 15%','15','9.75','8.29','63.54','113','112','Salida','Venta factura 1023','No','','','','No','','',''),('93','1024','2026-06-24','Minorista','1910000023','Natalia','Vargas','0930000023','natalia.vargas@gmail.com','Manabi','1990-12-24','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Botin mujer beige','Importado','Botas','37','Beige','72.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','1','72.0','Cliente frecuente 8%','8','5.76','9.94','76.18','113','112','Salida','Venta factura 1024','No','','','','No','','',''),('94','1024','2026-06-24','Minorista','1910000023','Natalia','Vargas','0930000023','natalia.vargas@gmail.com','Manabi','1990-12-24','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Zapato casual urbano','Nacional','Casual','39','Gris','45.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','2','90.0','Cliente frecuente 8%','8','7.2','12.42','95.22','113','111','Salida','Venta factura 1024','No','','','','No','','',''),('95','1024','2026-06-24','Minorista','1910000023','Natalia','Vargas','0930000023','natalia.vargas@gmail.com','Manabi','1990-12-24','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Tenis juvenil rojo','Importado','Deportivo','38','Rojo','50.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','3','150.0','Cliente frecuente 8%','8','12.0','20.7','158.7','111','108','Salida','Venta factura 1024','No','','','','No','','',''),('96','1024','2026-06-24','Minorista','1910000023','Natalia','Vargas','0930000023','natalia.vargas@gmail.com','Manabi','1990-12-24','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Zapato infantil luces','Importado','Infantil','30','Azul','42.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','2','84.0','Cliente frecuente 8%','8','6.72','11.59','88.87','112','110','Salida','Venta factura 1024','No','','','','No','','',''),('97','1025','2026-06-25','Minorista','2010000024','Fernando','Sanchez','0930000024','fernando.sanchez@gmail.com','Tungurahua','1991-01-25','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Bota lluvia nino','Nacional','Infantil','31','Amarillo','32.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','2','64.0','Promocion deportiva 12%','12','7.68','8.45','64.77','112','110','Salida','Venta factura 1025','No','','','','No','','',''),('98','1025','2026-06-25','Minorista','2010000024','Fernando','Sanchez','0930000024','fernando.sanchez@gmail.com','Tungurahua','1991-01-25','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Alpargata tradicional','Nacional','Casual','39','Blanco','26.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','3','78.0','Promocion deportiva 12%','12','9.36','10.3','78.94','111','108','Salida','Venta factura 1025','No','','','','No','','',''),('99','1025','2026-06-25','Minorista','2010000024','Fernando','Sanchez','0930000024','fernando.sanchez@gmail.com','Tungurahua','1991-01-25','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Zapato ejecutivo cuero','Nacional','Formal','42','Cafe','90.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','3','270.0','Promocion deportiva 12%','12','32.4','35.64','273.24','114','111','Salida','Venta factura 1025','No','','','','No','','',''),('100','1025','2026-06-25','Minorista','2010000024','Fernando','Sanchez','0930000024','fernando.sanchez@gmail.com','Tungurahua','1991-01-25','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Zapatilla training negra','Importado','Deportivo','41','Negro','59.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','1','59.0','Promocion deportiva 12%','12','7.08','7.79','59.71','113','112','Salida','Venta factura 1025','No','','','','No','','',''),('101','1026','2026-06-26','Mayorista','2110000025','Carolina','Chavez','0930000025','carolina.chavez@gmail.com','Loja','1992-02-26','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapato escolar negro','Nacional','Escolar','36','Negro','35.0','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','5','175.0','Liquidacion 20%','20','35.0','21.0','161.0','90','85','Salida','Venta factura 1026','No','','','','No','','',''),('102','1026','2026-06-26','Mayorista','2110000025','Carolina','Chavez','0930000025','carolina.chavez@gmail.com','Loja','1992-02-26','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapato escolar cafe','Nacional','Escolar','37','Cafe','36.5','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','4','146.0','Liquidacion 20%','20','29.2','17.52','134.32','97','93','Salida','Venta factura 1026','No','','','','No','','',''),('103','1026','2026-06-26','Mayorista','2110000025','Carolina','Chavez','0930000025','carolina.chavez@gmail.com','Loja','1992-02-26','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapatilla deportiva blanca','Importado','Deportivo','38','Blanco','48.5','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','6','291.0','Liquidacion 20%','20','58.2','34.92','267.72','92','86','Salida','Venta factura 1026','No','','','','No','','',''),('104','1026','2026-06-26','Mayorista','2110000025','Carolina','Chavez','0930000025','carolina.chavez@gmail.com','Loja','1992-02-26','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapatilla running azul','Importado','Deportivo','40','Azul','55.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','3','165.0','Liquidacion 20%','20','33.0','19.8','151.8','95','92','Salida','Venta factura 1026','No','','','','No','','',''),('105','1027','2026-06-27','Minorista','2210000026','David','Romero','0930000026','david.romero@gmail.com','Imbabura','1993-03-27','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Sandalia casual mujer','Nacional','Sandalias','36','Beige','28.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','2','56.0','Cyber Monday 18%','18','10.08','6.89','52.81','112','110','Salida','Venta factura 1027','No','','','','No','','',''),('106','1027','2026-06-27','Minorista','2210000026','David','Romero','0930000026','david.romero@gmail.com','Imbabura','1993-03-27','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Sandalia playera hombre','Nacional','Sandalias','41','Negro','25.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','1','25.0','Cyber Monday 18%','18','4.5','3.07','23.57','111','110','Salida','Venta factura 1027','No','','','','No','','',''),('107','1027','2026-06-27','Minorista','2210000026','David','Romero','0930000026','david.romero@gmail.com','Imbabura','1993-03-27','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Zapato formal hombre','Nacional','Formal','40','Negro','60.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','3','180.0','Cyber Monday 18%','18','32.4','22.14','169.74','111','108','Salida','Venta factura 1027','No','','','','No','','',''),('108','1027','2026-06-27','Minorista','2210000026','David','Romero','0930000026','david.romero@gmail.com','Imbabura','1993-03-27','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Zapato formal mujer','Importado','Formal','37','Rojo','62.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','1','62.0','Cyber Monday 18%','18','11.16','7.63','58.47','109','108','Salida','Venta factura 1027','No','','','','No','','',''),('109','1028','2026-06-28','Minorista','2310000027','Monica','Cruz','0930000027','monica.cruz@gmail.com','El Oro','1994-04-01','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Botin cuero cafe','Nacional','Botas','41','Cafe','75.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','2','150.0','Descuento mayorista 10%','10','15.0','20.25','155.25','111','109','Salida','Venta factura 1028','No','','','','No','','',''),('110','1028','2026-06-28','Minorista','2310000027','Monica','Cruz','0930000027','monica.cruz@gmail.com','El Oro','1994-04-01','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Bota industrial punta acero','Nacional','Industrial','42','Negro','85.0','Seguridad Total Shoes','Ecuador','Nacional','022345005','contacto@seguridadtotal.com','1','85.0','Descuento mayorista 10%','10','8.5','11.47','87.97','111','110','Salida','Venta factura 1028','No','','','','No','','',''),('111','1028','2026-06-28','Minorista','2310000027','Monica','Cruz','0930000027','monica.cruz@gmail.com','El Oro','1994-04-01','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Mocasin hombre','Importado','Formal','40','Azul','58.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','3','174.0','Descuento mayorista 10%','10','17.4','23.49','180.09','110','107','Salida','Venta factura 1028','No','','','','No','','',''),('112','1028','2026-06-28','Minorista','2310000027','Monica','Cruz','0930000027','monica.cruz@gmail.com','El Oro','1994-04-01','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Tacon negro','Importado','Formal','36','Negro','65.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','3','195.0','Descuento mayorista 10%','10','19.5','26.32','201.82','112','109','Salida','Venta factura 1028','No','','','','No','','',''),('113','1029','2026-06-29','Minorista','1710000028','Cristian','Espinoza','0930000028','cristian.espinoza@gmail.com','Cotopaxi','1995-05-02','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Botin mujer beige','Importado','Botas','37','Beige','72.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','3','216.0','Promocion sandalias 7%','7','15.12','30.13','231.01','112','109','Salida','Venta factura 1029','No','','','','No','','',''),('114','1029','2026-06-29','Minorista','1710000028','Cristian','Espinoza','0930000028','cristian.espinoza@gmail.com','Cotopaxi','1995-05-02','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Zapato casual urbano','Nacional','Casual','39','Gris','45.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','2','90.0','Promocion sandalias 7%','7','6.3','12.55','96.25','111','109','Salida','Venta factura 1029','No','','','','No','','',''),('115','1029','2026-06-29','Minorista','1710000028','Cristian','Espinoza','0930000028','cristian.espinoza@gmail.com','Cotopaxi','1995-05-02','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Tenis juvenil rojo','Importado','Deportivo','38','Rojo','50.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','1','50.0','Promocion sandalias 7%','7','3.5','6.97','53.47','108','107','Salida','Venta factura 1029','No','','','','No','','',''),('116','1029','2026-06-29','Minorista','1710000028','Cristian','Espinoza','0930000028','cristian.espinoza@gmail.com','Cotopaxi','1995-05-02','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Zapato infantil luces','Importado','Infantil','30','Azul','42.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','1','42.0','Promocion sandalias 7%','7','2.94','5.86','44.92','110','109','Salida','Venta factura 1029','No','','','','No','','',''),('117','1030','2026-06-30','Minorista','1810000029','Alejandra','Aguilar','0930000029','alejandra.aguilar@gmail.com','Chimborazo','1996-06-03','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Bota lluvia nino','Nacional','Infantil','31','Amarillo','32.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','1','32.0','Temporada formal 5%','5','1.6','4.56','34.96','110','109','Salida','Venta factura 1030','No','','','','No','','',''),('118','1030','2026-06-30','Minorista','1810000029','Alejandra','Aguilar','0930000029','alejandra.aguilar@gmail.com','Chimborazo','1996-06-03','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Alpargata tradicional','Nacional','Casual','39','Blanco','26.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','3','78.0','Temporada formal 5%','5','3.9','11.11','85.21','108','105','Salida','Venta factura 1030','No','','','','No','','',''),('119','1030','2026-06-30','Minorista','1810000029','Alejandra','Aguilar','0930000029','alejandra.aguilar@gmail.com','Chimborazo','1996-06-03','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Zapato ejecutivo cuero','Nacional','Formal','42','Cafe','90.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','2','180.0','Temporada formal 5%','5','9.0','25.65','196.65','111','109','Salida','Venta factura 1030','No','','','','No','','',''),('120','1030','2026-06-30','Minorista','1810000029','Alejandra','Aguilar','0930000029','alejandra.aguilar@gmail.com','Chimborazo','1996-06-03','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Zapatilla training negra','Importado','Deportivo','41','Negro','59.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','1','59.0','Temporada formal 5%','5','2.95','8.41','64.46','112','111','Salida','Venta factura 1030','No','','','','No','','',''),('121','1031','2026-06-01','Mayorista','1710000000','Juan','Perez','0930000000','juan.perez@gmail.com','Pichincha','1985-01-01','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapato escolar negro','Nacional','Escolar','36','Negro','35.0','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','8','280.0','Sin promocion','0','0.0','42.0','322.0','85','77','Salida','Venta factura 1031','No','','','','No','','',''),('122','1031','2026-06-01','Mayorista','1710000000','Juan','Perez','0930000000','juan.perez@gmail.com','Pichincha','1985-01-01','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapato escolar cafe','Nacional','Escolar','37','Cafe','36.5','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','7','255.5','Sin promocion','0','0.0','38.32','293.82','93','86','Salida','Venta factura 1031','No','','','','No','','',''),('123','1031','2026-06-01','Mayorista','1710000000','Juan','Perez','0930000000','juan.perez@gmail.com','Pichincha','1985-01-01','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapatilla deportiva blanca','Importado','Deportivo','38','Blanco','48.5','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','8','388.0','Sin promocion','0','0.0','58.2','446.2','86','78','Salida','Venta factura 1031','No','','','','No','','',''),('124','1031','2026-06-01','Mayorista','1710000000','Juan','Perez','0930000000','juan.perez@gmail.com','Pichincha','1985-01-01','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapatilla running azul','Importado','Deportivo','40','Azul','55.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','6','330.0','Sin promocion','0','0.0','49.5','379.5','92','86','Salida','Venta factura 1031','No','','','','No','','',''),('125','1032','2026-06-02','Minorista','1810000001','Maria','Lopez','0930000001','maria.lopez@gmail.com','Guayas','1986-02-02','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Sandalia casual mujer','Nacional','Sandalias','36','Beige','28.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','3','84.0','Escolar 10%','10','8.4','11.34','86.94','110','107','Salida','Venta factura 1032','No','','','','No','','',''),('126','1032','2026-06-02','Minorista','1810000001','Maria','Lopez','0930000001','maria.lopez@gmail.com','Guayas','1986-02-02','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Sandalia playera hombre','Nacional','Sandalias','41','Negro','25.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','2','50.0','Escolar 10%','10','5.0','6.75','51.75','110','108','Salida','Venta factura 1032','No','','','','No','','',''),('127','1032','2026-06-02','Minorista','1810000001','Maria','Lopez','0930000001','maria.lopez@gmail.com','Guayas','1986-02-02','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Zapato formal hombre','Nacional','Formal','40','Negro','60.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','1','60.0','Escolar 10%','10','6.0','8.1','62.1','108','107','Salida','Venta factura 1032','No','','','','No','','',''),('128','1032','2026-06-02','Minorista','1810000001','Maria','Lopez','0930000001','maria.lopez@gmail.com','Guayas','1986-02-02','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Zapato formal mujer','Importado','Formal','37','Rojo','62.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','1','62.0','Escolar 10%','10','6.2','8.37','64.17','108','107','Salida','Venta factura 1032','No','','','','No','','',''),('129','1033','2026-06-03','Minorista','1910000002','Carlos','Andrade','0930000002','carlos.andrade@gmail.com','Azuay','1987-03-03','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Botin cuero cafe','Nacional','Botas','41','Cafe','75.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','2','150.0','Black Friday 15%','15','22.5','19.12','146.62','109','107','Salida','Venta factura 1033','No','','','','No','','',''),('130','1033','2026-06-03','Minorista','1910000002','Carlos','Andrade','0930000002','carlos.andrade@gmail.com','Azuay','1987-03-03','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Bota industrial punta acero','Nacional','Industrial','42','Negro','85.0','Seguridad Total Shoes','Ecuador','Nacional','022345005','contacto@seguridadtotal.com','1','85.0','Black Friday 15%','15','12.75','10.84','83.09','110','109','Salida','Venta factura 1033','No','','','','No','','',''),('131','1033','2026-06-03','Minorista','1910000002','Carlos','Andrade','0930000002','carlos.andrade@gmail.com','Azuay','1987-03-03','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Mocasin hombre','Importado','Formal','40','Azul','58.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','2','116.0','Black Friday 15%','15','17.4','14.79','113.39','107','105','Salida','Venta factura 1033','No','','','','No','','',''),('132','1033','2026-06-03','Minorista','1910000002','Carlos','Andrade','0930000002','carlos.andrade@gmail.com','Azuay','1987-03-03','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Tacon negro','Importado','Formal','36','Negro','65.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','1','65.0','Black Friday 15%','15','9.75','8.29','63.54','109','108','Salida','Venta factura 1033','No','','','','No','','',''),('133','1034','2026-06-04','Minorista','2010000003','Ana','Torres','0930000003','ana.torres@gmail.com','Manabi','1988-04-04','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Botin mujer beige','Importado','Botas','37','Beige','72.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','1','72.0','Cliente frecuente 8%','8','5.76','9.94','76.18','109','108','Salida','Venta factura 1034','No','','','','No','','',''),('134','1034','2026-06-04','Minorista','2010000003','Ana','Torres','0930000003','ana.torres@gmail.com','Manabi','1988-04-04','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Zapato casual urbano','Nacional','Casual','39','Gris','45.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','1','45.0','Cliente frecuente 8%','8','3.6','6.21','47.61','109','108','Salida','Venta factura 1034','No','','','','No','','',''),('135','1034','2026-06-04','Minorista','2010000003','Ana','Torres','0930000003','ana.torres@gmail.com','Manabi','1988-04-04','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Tenis juvenil rojo','Importado','Deportivo','38','Rojo','50.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','3','150.0','Cliente frecuente 8%','8','12.0','20.7','158.7','107','104','Salida','Venta factura 1034','No','','','','No','','',''),('136','1034','2026-06-04','Minorista','2010000003','Ana','Torres','0930000003','ana.torres@gmail.com','Manabi','1988-04-04','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Zapato infantil luces','Importado','Infantil','30','Azul','42.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','3','126.0','Cliente frecuente 8%','8','10.08','17.39','133.31','109','106','Salida','Venta factura 1034','No','','','','No','','',''),('137','1035','2026-06-05','Minorista','2110000004','Luis','Zambrano','0930000004','luis.zambrano@gmail.com','Tungurahua','1989-05-05','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Bota lluvia nino','Nacional','Infantil','31','Amarillo','32.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','1','32.0','Promocion deportiva 12%','12','3.84','4.22','32.38','109','108','Salida','Venta factura 1035','No','','','','No','','',''),('138','1035','2026-06-05','Minorista','2110000004','Luis','Zambrano','0930000004','luis.zambrano@gmail.com','Tungurahua','1989-05-05','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Alpargata tradicional','Nacional','Casual','39','Blanco','26.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','3','78.0','Promocion deportiva 12%','12','9.36','10.3','78.94','105','102','Salida','Venta factura 1035','No','','','','No','','',''),('139','1035','2026-06-05','Minorista','2110000004','Luis','Zambrano','0930000004','luis.zambrano@gmail.com','Tungurahua','1989-05-05','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Zapato ejecutivo cuero','Nacional','Formal','42','Cafe','90.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','1','90.0','Promocion deportiva 12%','12','10.8','11.88','91.08','109','108','Salida','Venta factura 1035','No','','','','No','','',''),('140','1035','2026-06-05','Minorista','2110000004','Luis','Zambrano','0930000004','luis.zambrano@gmail.com','Tungurahua','1989-05-05','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Zapatilla training negra','Importado','Deportivo','41','Negro','59.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','1','59.0','Promocion deportiva 12%','12','7.08','7.79','59.71','111','110','Salida','Venta factura 1035','No','','','','No','','',''),('141','1036','2026-06-06','Mayorista','2210000005','Andrea','Salazar','0930000005','andrea.salazar@gmail.com','Loja','1990-06-06','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapato escolar negro','Nacional','Escolar','36','Negro','35.0','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','5','175.0','Liquidacion 20%','20','35.0','21.0','161.0','77','72','Salida','Venta factura 1036','No','','','','No','','',''),('142','1036','2026-06-06','Mayorista','2210000005','Andrea','Salazar','0930000005','andrea.salazar@gmail.com','Loja','1990-06-06','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapato escolar cafe','Nacional','Escolar','37','Cafe','36.5','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','5','182.5','Liquidacion 20%','20','36.5','21.9','167.9','86','81','Salida','Venta factura 1036','No','','','','No','','',''),('143','1036','2026-06-06','Mayorista','2210000005','Andrea','Salazar','0930000005','andrea.salazar@gmail.com','Loja','1990-06-06','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapatilla deportiva blanca','Importado','Deportivo','38','Blanco','48.5','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','5','242.5','Liquidacion 20%','20','48.5','29.1','223.1','78','73','Salida','Venta factura 1036','No','','','','No','','',''),('144','1036','2026-06-06','Mayorista','2210000005','Andrea','Salazar','0930000005','andrea.salazar@gmail.com','Loja','1990-06-06','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapatilla running azul','Importado','Deportivo','40','Azul','55.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','3','165.0','Liquidacion 20%','20','33.0','19.8','151.8','86','83','Salida','Venta factura 1036','No','','','','No','','',''),('145','1037','2026-06-07','Minorista','2310000006','Pedro','Mena','0930000006','pedro.mena@gmail.com','Imbabura','1991-07-07','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Sandalia casual mujer','Nacional','Sandalias','36','Beige','28.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','1','28.0','Cyber Monday 18%','18','5.04','3.44','26.4','107','106','Salida','Venta factura 1037','No','','','','No','','',''),('146','1037','2026-06-07','Minorista','2310000006','Pedro','Mena','0930000006','pedro.mena@gmail.com','Imbabura','1991-07-07','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Sandalia playera hombre','Nacional','Sandalias','41','Negro','25.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','2','50.0','Cyber Monday 18%','18','9.0','6.15','47.15','108','106','Salida','Venta factura 1037','No','','','','No','','',''),('147','1037','2026-06-07','Minorista','2310000006','Pedro','Mena','0930000006','pedro.mena@gmail.com','Imbabura','1991-07-07','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Zapato formal hombre','Nacional','Formal','40','Negro','60.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','1','60.0','Cyber Monday 18%','18','10.8','7.38','56.58','107','106','Salida','Venta factura 1037','No','','','','No','','',''),('148','1037','2026-06-07','Minorista','2310000006','Pedro','Mena','0930000006','pedro.mena@gmail.com','Imbabura','1991-07-07','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Zapato formal mujer','Importado','Formal','37','Rojo','62.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','1','62.0','Cyber Monday 18%','18','11.16','7.63','58.47','107','106','Salida','Venta factura 1037','No','','','','No','','',''),('149','1038','2026-06-08','Minorista','1710000007','Camila','Vera','0930000007','camila.vera@gmail.com','El Oro','1992-08-08','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Botin cuero cafe','Nacional','Botas','41','Cafe','75.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','2','150.0','Descuento mayorista 10%','10','15.0','20.25','155.25','107','105','Salida','Venta factura 1038','No','','','','No','','',''),('150','1038','2026-06-08','Minorista','1710000007','Camila','Vera','0930000007','camila.vera@gmail.com','El Oro','1992-08-08','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Bota industrial punta acero','Nacional','Industrial','42','Negro','85.0','Seguridad Total Shoes','Ecuador','Nacional','022345005','contacto@seguridadtotal.com','1','85.0','Descuento mayorista 10%','10','8.5','11.47','87.97','109','108','Salida','Venta factura 1038','No','','','','No','','',''),('151','1038','2026-06-08','Minorista','1710000007','Camila','Vera','0930000007','camila.vera@gmail.com','El Oro','1992-08-08','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Mocasin hombre','Importado','Formal','40','Azul','58.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','3','174.0','Descuento mayorista 10%','10','17.4','23.49','180.09','105','102','Salida','Venta factura 1038','No','','','','No','','',''),('152','1038','2026-06-08','Minorista','1710000007','Camila','Vera','0930000007','camila.vera@gmail.com','El Oro','1992-08-08','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Tacon negro','Importado','Formal','36','Negro','65.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','2','130.0','Descuento mayorista 10%','10','13.0','17.55','134.55','108','106','Salida','Venta factura 1038','No','','','','No','','',''),('153','1039','2026-06-09','Minorista','1810000008','Jose','Cedeno','0930000008','jose.cedeno@gmail.com','Cotopaxi','1993-09-09','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Botin mujer beige','Importado','Botas','37','Beige','72.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','2','144.0','Promocion sandalias 7%','7','10.08','20.09','154.01','108','106','Salida','Venta factura 1039','No','','','','No','','',''),('154','1039','2026-06-09','Minorista','1810000008','Jose','Cedeno','0930000008','jose.cedeno@gmail.com','Cotopaxi','1993-09-09','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Zapato casual urbano','Nacional','Casual','39','Gris','45.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','3','135.0','Promocion sandalias 7%','7','9.45','18.83','144.38','108','105','Salida','Venta factura 1039','No','','','','No','','',''),('155','1039','2026-06-09','Minorista','1810000008','Jose','Cedeno','0930000008','jose.cedeno@gmail.com','Cotopaxi','1993-09-09','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Tenis juvenil rojo','Importado','Deportivo','38','Rojo','50.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','2','100.0','Promocion sandalias 7%','7','7.0','13.95','106.95','104','102','Salida','Venta factura 1039','No','','','','No','','',''),('156','1039','2026-06-09','Minorista','1810000008','Jose','Cedeno','0930000008','jose.cedeno@gmail.com','Cotopaxi','1993-09-09','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Zapato infantil luces','Importado','Infantil','30','Azul','42.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','2','84.0','Promocion sandalias 7%','7','5.88','11.72','89.84','106','104','Salida','Venta factura 1039','No','','','','No','','',''),('157','1040','2026-06-10','Minorista','1910000009','Daniela','Paredes','0930000009','daniela.paredes@gmail.com','Chimborazo','1994-10-10','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Bota lluvia nino','Nacional','Infantil','31','Amarillo','32.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','2','64.0','Temporada formal 5%','5','3.2','9.12','69.92','108','106','Salida','Venta factura 1040','No','','','','No','','',''),('158','1040','2026-06-10','Minorista','1910000009','Daniela','Paredes','0930000009','daniela.paredes@gmail.com','Chimborazo','1994-10-10','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Alpargata tradicional','Nacional','Casual','39','Blanco','26.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','2','52.0','Temporada formal 5%','5','2.6','7.41','56.81','102','100','Salida','Venta factura 1040','No','','','','No','','',''),('159','1040','2026-06-10','Minorista','1910000009','Daniela','Paredes','0930000009','daniela.paredes@gmail.com','Chimborazo','1994-10-10','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Zapato ejecutivo cuero','Nacional','Formal','42','Cafe','90.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','2','180.0','Temporada formal 5%','5','9.0','25.65','196.65','108','106','Salida','Venta factura 1040','No','','','','No','','',''),('160','1040','2026-06-10','Minorista','1910000009','Daniela','Paredes','0930000009','daniela.paredes@gmail.com','Chimborazo','1994-10-10','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Zapatilla training negra','Importado','Deportivo','41','Negro','59.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','1','59.0','Temporada formal 5%','5','2.95','8.41','64.46','110','109','Salida','Venta factura 1040','No','','','','No','','',''),('161','1041','2026-06-11','Mayorista','2010000010','Miguel','Gomez','0930000010','miguel.gomez@gmail.com','Pichincha','1995-11-11','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapato escolar negro','Nacional','Escolar','36','Negro','35.0','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','8','280.0','Sin promocion','0','0.0','42.0','322.0','72','64','Salida','Venta factura 1041','No','','','','No','','',''),('162','1041','2026-06-11','Mayorista','2010000010','Miguel','Gomez','0930000010','miguel.gomez@gmail.com','Pichincha','1995-11-11','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapato escolar cafe','Nacional','Escolar','37','Cafe','36.5','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','3','109.5','Sin promocion','0','0.0','16.43','125.93','81','78','Salida','Venta factura 1041','No','','','','No','','',''),('163','1041','2026-06-11','Mayorista','2010000010','Miguel','Gomez','0930000010','miguel.gomez@gmail.com','Pichincha','1995-11-11','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapatilla deportiva blanca','Importado','Deportivo','38','Blanco','48.5','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','8','388.0','Sin promocion','0','0.0','58.2','446.2','73','65','Salida','Venta factura 1041','No','','','','No','','',''),('164','1041','2026-06-11','Mayorista','2010000010','Miguel','Gomez','0930000010','miguel.gomez@gmail.com','Pichincha','1995-11-11','1710000001','Carlos','Mena','Vendedor','Vendedor','0991000001','carlos.mena@calzadotoapanta.com','Zapatilla running azul','Importado','Deportivo','40','Azul','55.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','4','220.0','Sin promocion','0','0.0','33.0','253.0','83','79','Salida','Venta factura 1041','No','','','','No','','',''),('165','1042','2026-06-12','Minorista','2110000011','Sofia','Castro','0930000011','sofia.castro@gmail.com','Guayas','1996-12-12','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Sandalia casual mujer','Nacional','Sandalias','36','Beige','28.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','3','84.0','Escolar 10%','10','8.4','11.34','86.94','106','103','Salida','Venta factura 1042','No','','','','No','','',''),('166','1042','2026-06-12','Minorista','2110000011','Sofia','Castro','0930000011','sofia.castro@gmail.com','Guayas','1996-12-12','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Sandalia playera hombre','Nacional','Sandalias','41','Negro','25.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','3','75.0','Escolar 10%','10','7.5','10.12','77.62','106','103','Salida','Venta factura 1042','No','','','','No','','',''),('167','1042','2026-06-12','Minorista','2110000011','Sofia','Castro','0930000011','sofia.castro@gmail.com','Guayas','1996-12-12','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Zapato formal hombre','Nacional','Formal','40','Negro','60.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','1','60.0','Escolar 10%','10','6.0','8.1','62.1','106','105','Salida','Venta factura 1042','No','','','','No','','',''),('168','1042','2026-06-12','Minorista','2110000011','Sofia','Castro','0930000011','sofia.castro@gmail.com','Guayas','1996-12-12','1710000002','Ana','Torres','Cajera','Cajero','0991000002','ana.torres@calzadotoapanta.com','Zapato formal mujer','Importado','Formal','37','Rojo','62.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','3','186.0','Escolar 10%','10','18.6','25.11','192.51','106','103','Salida','Venta factura 1042','No','','','','No','','',''),('169','1043','2026-06-13','Minorista','2210000012','Jorge','Morales','0930000012','jorge.morales@gmail.com','Azuay','1997-01-13','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Botin cuero cafe','Nacional','Botas','41','Cafe','75.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','2','150.0','Black Friday 15%','15','22.5','19.12','146.62','105','103','Salida','Venta factura 1043','No','','','','No','','',''),('170','1043','2026-06-13','Minorista','2210000012','Jorge','Morales','0930000012','jorge.morales@gmail.com','Azuay','1997-01-13','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Bota industrial punta acero','Nacional','Industrial','42','Negro','85.0','Seguridad Total Shoes','Ecuador','Nacional','022345005','contacto@seguridadtotal.com','1','85.0','Black Friday 15%','15','12.75','10.84','83.09','108','107','Salida','Venta factura 1043','No','','','','No','','',''),('171','1043','2026-06-13','Minorista','2210000012','Jorge','Morales','0930000012','jorge.morales@gmail.com','Azuay','1997-01-13','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Mocasin hombre','Importado','Formal','40','Azul','58.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','1','58.0','Black Friday 15%','15','8.7','7.39','56.69','102','101','Salida','Venta factura 1043','No','','','','No','','',''),('172','1043','2026-06-13','Minorista','2210000012','Jorge','Morales','0930000012','jorge.morales@gmail.com','Azuay','1997-01-13','1710000003','Andrea','Salazar','Gerente Comercial','Gerente','0991000003','andrea.salazar@calzadotoapanta.com','Tacon negro','Importado','Formal','36','Negro','65.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','1','65.0','Black Friday 15%','15','9.75','8.29','63.54','106','105','Salida','Venta factura 1043','No','','','','No','','',''),('173','1044','2026-06-14','Minorista','2310000013','Valeria','Herrera','0930000013','valeria.herrera@gmail.com','Manabi','1998-02-14','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Botin mujer beige','Importado','Botas','37','Beige','72.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','1','72.0','Cliente frecuente 8%','8','5.76','9.94','76.18','106','105','Salida','Venta factura 1044','No','','','','No','','',''),('174','1044','2026-06-14','Minorista','2310000013','Valeria','Herrera','0930000013','valeria.herrera@gmail.com','Manabi','1998-02-14','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Zapato casual urbano','Nacional','Casual','39','Gris','45.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','1','45.0','Cliente frecuente 8%','8','3.6','6.21','47.61','105','104','Salida','Venta factura 1044','No','','','','No','','',''),('175','1044','2026-06-14','Minorista','2310000013','Valeria','Herrera','0930000013','valeria.herrera@gmail.com','Manabi','1998-02-14','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Tenis juvenil rojo','Importado','Deportivo','38','Rojo','50.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','1','50.0','Cliente frecuente 8%','8','4.0','6.9','52.9','102','101','Salida','Venta factura 1044','No','','','','No','','',''),('176','1044','2026-06-14','Minorista','2310000013','Valeria','Herrera','0930000013','valeria.herrera@gmail.com','Manabi','1998-02-14','1710000004','Luis','Vera','Vendedor','Vendedor','0991000004','luis.vera@calzadotoapanta.com','Zapato infantil luces','Importado','Infantil','30','Azul','42.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','2','84.0','Cliente frecuente 8%','8','6.72','11.59','88.87','104','102','Salida','Venta factura 1044','No','','','','No','','',''),('177','1045','2026-06-15','Minorista','1710000014','Diego','Jimenez','0930000014','diego.jimenez@gmail.com','Tungurahua','1999-03-15','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Bota lluvia nino','Nacional','Infantil','31','Amarillo','32.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','2','64.0','Promocion deportiva 12%','12','7.68','8.45','64.77','106','104','Salida','Venta factura 1045','No','','','','No','','',''),('178','1045','2026-06-15','Minorista','1710000014','Diego','Jimenez','0930000014','diego.jimenez@gmail.com','Tungurahua','1999-03-15','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Alpargata tradicional','Nacional','Casual','39','Blanco','26.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','3','78.0','Promocion deportiva 12%','12','9.36','10.3','78.94','100','97','Salida','Venta factura 1045','No','','','','No','','',''),('179','1045','2026-06-15','Minorista','1710000014','Diego','Jimenez','0930000014','diego.jimenez@gmail.com','Tungurahua','1999-03-15','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Zapato ejecutivo cuero','Nacional','Formal','42','Cafe','90.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','2','180.0','Promocion deportiva 12%','12','21.6','23.76','182.16','106','104','Salida','Venta factura 1045','No','','','','No','','',''),('180','1045','2026-06-15','Minorista','1710000014','Diego','Jimenez','0930000014','diego.jimenez@gmail.com','Tungurahua','1999-03-15','1710000005','Mateo','Paredes','Vendedor','Vendedor','0991000005','mateo.paredes@calzadotoapanta.com','Zapatilla training negra','Importado','Deportivo','41','Negro','59.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','3','177.0','Promocion deportiva 12%','12','21.24','23.36','179.12','109','106','Salida','Venta factura 1045','No','','','','No','','',''),('181','1046','2026-06-16','Mayorista','1810000015','Gabriela','Guerrero','0930000015','gabriela.guerrero@gmail.com','Loja','2000-04-16','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapato escolar negro','Nacional','Escolar','36','Negro','35.0','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','3','105.0','Liquidacion 20%','20','21.0','12.6','96.6','64','61','Salida','Venta factura 1046','No','','','','No','','',''),('182','1046','2026-06-16','Mayorista','1810000015','Gabriela','Guerrero','0930000015','gabriela.guerrero@gmail.com','Loja','2000-04-16','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapato escolar cafe','Nacional','Escolar','37','Cafe','36.5','Calzado Andino S.A.','Ecuador','Nacional','022345001','ventas@calzadoandino.com','5','182.5','Liquidacion 20%','20','36.5','21.9','167.9','78','73','Salida','Venta factura 1046','No','','','','No','','',''),('183','1046','2026-06-16','Mayorista','1810000015','Gabriela','Guerrero','0930000015','gabriela.guerrero@gmail.com','Loja','2000-04-16','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapatilla deportiva blanca','Importado','Deportivo','38','Blanco','48.5','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','8','388.0','Liquidacion 20%','20','77.6','46.56','356.96','65','57','Salida','Venta factura 1046','No','','','','No','','',''),('184','1046','2026-06-16','Mayorista','1810000015','Gabriela','Guerrero','0930000015','gabriela.guerrero@gmail.com','Loja','2000-04-16','1710000006','Gabriela','Guerrero','Cajera','Cajero','0991000006','gabriela.guerrero@calzadotoapanta.com','Zapatilla running azul','Importado','Deportivo','40','Azul','55.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','3','165.0','Liquidacion 20%','20','33.0','19.8','151.8','79','76','Salida','Venta factura 1046','No','','','','No','','',''),('185','1047','2026-06-17','Minorista','1910000016','Ricardo','Ortega','0930000016','ricardo.ortega@gmail.com','Imbabura','2001-05-17','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Sandalia casual mujer','Nacional','Sandalias','36','Beige','28.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','3','84.0','Cyber Monday 18%','18','15.12','10.33','79.21','103','100','Salida','Venta factura 1047','No','','','','No','','',''),('186','1047','2026-06-17','Minorista','1910000016','Ricardo','Ortega','0930000016','ricardo.ortega@gmail.com','Imbabura','2001-05-17','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Sandalia playera hombre','Nacional','Sandalias','41','Negro','25.0','Sandalias Costa Ecuador','Ecuador','Nacional','022345010','info@sandaliascosta.com','3','75.0','Cyber Monday 18%','18','13.5','9.22','70.72','103','100','Salida','Venta factura 1047','No','','','','No','','',''),('187','1047','2026-06-17','Minorista','1910000016','Ricardo','Ortega','0930000016','ricardo.ortega@gmail.com','Imbabura','2001-05-17','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Zapato formal hombre','Nacional','Formal','40','Negro','60.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','2','120.0','Cyber Monday 18%','18','21.6','14.76','113.16','105','103','Salida','Venta factura 1047','No','','','','No','','',''),('188','1047','2026-06-17','Minorista','1910000016','Ricardo','Ortega','0930000016','ricardo.ortega@gmail.com','Imbabura','2001-05-17','1710000007','Ricardo','Castro','Administrador','Administrador','0991000007','ricardo.castro@calzadotoapanta.com','Zapato formal mujer','Importado','Formal','37','Rojo','62.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','3','186.0','Cyber Monday 18%','18','33.48','22.88','175.4','103','100','Salida','Venta factura 1047','No','','','','No','','',''),('189','1048','2026-06-18','Minorista','2010000017','Paula','Reyes','0930000017','paula.reyes@gmail.com','El Oro','2002-06-18','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Botin cuero cafe','Nacional','Botas','41','Cafe','75.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','3','225.0','Descuento mayorista 10%','10','22.5','30.38','232.88','103','100','Salida','Venta factura 1048','No','','','','No','','',''),('190','1048','2026-06-18','Minorista','2010000017','Paula','Reyes','0930000017','paula.reyes@gmail.com','El Oro','2002-06-18','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Bota industrial punta acero','Nacional','Industrial','42','Negro','85.0','Seguridad Total Shoes','Ecuador','Nacional','022345005','contacto@seguridadtotal.com','2','170.0','Descuento mayorista 10%','10','17.0','22.95','175.95','107','105','Salida','Venta factura 1048','No','','','','No','','',''),('191','1048','2026-06-18','Minorista','2010000017','Paula','Reyes','0930000017','paula.reyes@gmail.com','El Oro','2002-06-18','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Mocasin hombre','Importado','Formal','40','Azul','58.0','Formal Shoes Premium','Brasil','Internacional','022345009','ventas@formalpremium.com','2','116.0','Descuento mayorista 10%','10','11.6','15.66','120.06','101','99','Salida','Venta factura 1048','No','','','','No','','',''),('192','1048','2026-06-18','Minorista','2010000017','Paula','Reyes','0930000017','paula.reyes@gmail.com','El Oro','2002-06-18','1710000008','Paula','Reyes','Auditor Interno','Auditor','0991000008','paula.reyes@calzadotoapanta.com','Tacon negro','Importado','Formal','36','Negro','65.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','1','65.0','Descuento mayorista 10%','10','6.5','8.78','67.28','105','104','Salida','Venta factura 1048','No','','','','No','','',''),('193','1049','2026-06-19','Minorista','2110000018','Mateo','Toapanta','0930000018','mateo.toapanta@gmail.com','Cotopaxi','1985-07-19','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Botin mujer beige','Importado','Botas','37','Beige','72.0','Moda Latina Calzado','Colombia','Internacional','022345006','ventas@modalatina.com','3','216.0','Promocion sandalias 7%','7','15.12','30.13','231.01','105','102','Salida','Venta factura 1049','No','','','','No','','',''),('194','1049','2026-06-19','Minorista','2110000018','Mateo','Toapanta','0930000018','mateo.toapanta@gmail.com','Cotopaxi','1985-07-19','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Zapato casual urbano','Nacional','Casual','39','Gris','45.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','3','135.0','Promocion sandalias 7%','7','9.45','18.83','144.38','104','101','Salida','Venta factura 1049','No','','','','No','','',''),('195','1049','2026-06-19','Minorista','2110000018','Mateo','Toapanta','0930000018','mateo.toapanta@gmail.com','Cotopaxi','1985-07-19','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Tenis juvenil rojo','Importado','Deportivo','38','Rojo','50.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','2','100.0','Promocion sandalias 7%','7','7.0','13.95','106.95','101','99','Salida','Venta factura 1049','No','','','','No','','',''),('196','1049','2026-06-19','Minorista','2110000018','Mateo','Toapanta','0930000018','mateo.toapanta@gmail.com','Cotopaxi','1985-07-19','1710000009','Diego','Herrera','Encargado de Inventario','Administrador','0991000009','diego.herrera@calzadotoapanta.com','Zapato infantil luces','Importado','Infantil','30','Azul','42.0','Importadora Oriental Shoes','China','Internacional','022345002','contacto@orientalshoes.com','2','84.0','Promocion sandalias 7%','7','5.88','11.72','89.84','102','100','Salida','Venta factura 1049','No','','','','No','','',''),('197','1050','2026-06-20','Minorista','2210000019','Diana','Nunez','0930000019','diana.nunez@gmail.com','Chimborazo','1986-08-20','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Bota lluvia nino','Nacional','Infantil','31','Amarillo','32.0','Botas Sierra Norte','Ecuador','Nacional','022345007','info@botassierranorte.com','1','32.0','Temporada formal 5%','5','1.6','4.56','34.96','104','103','Salida','Venta factura 1050','No','','','','No','','',''),('198','1050','2026-06-20','Minorista','2210000019','Diana','Nunez','0930000019','diana.nunez@gmail.com','Chimborazo','1986-08-20','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Alpargata tradicional','Nacional','Casual','39','Blanco','26.0','Distribuidora Guayaquil Shoes','Ecuador','Nacional','022345004','ventas@guayaquilshoes.com','3','78.0','Temporada formal 5%','5','3.9','11.11','85.21','97','94','Salida','Venta factura 1050','No','','','','No','','',''),('199','1050','2026-06-20','Minorista','2210000019','Diana','Nunez','0930000019','diana.nunez@gmail.com','Chimborazo','1986-08-20','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Zapato ejecutivo cuero','Nacional','Formal','42','Cafe','90.0','Cuero Ecuador Cia. Ltda.','Ecuador','Nacional','022345003','info@cueroecuador.com','3','270.0','Temporada formal 5%','5','13.5','38.48','294.98','104','101','Salida','Venta factura 1050','No','','','','No','','',''),('200','1050','2026-06-20','Minorista','2210000019','Diana','Nunez','0930000019','diana.nunez@gmail.com','Chimborazo','1986-08-20','1710000010','Lucia','Morales','Vendedora','Vendedor','0991000010','lucia.morales@calzadotoapanta.com','Zapatilla training negra','Importado','Deportivo','41','Negro','59.0','SportStep Import','Peru','Internacional','022345008','contacto@sportstep.com','3','177.0','Temporada formal 5%','5','8.85','25.22','193.37','106','103','Salida','Venta factura 1050','No','','','','No','','','');
/*!40000 ALTER TABLE `ventas_historicas_bruto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_clientes_frecuentes`
--

DROP TABLE IF EXISTS `vista_clientes_frecuentes`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes_frecuentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes_frecuentes` AS SELECT 
 1 AS `IdCliente`,
 1 AS `Nombres`,
 1 AS `Apellidos`,
 1 AS `Provincia`,
 1 AS `TotalCompras`,
 1 AS `MontoAcumulado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_desempeno_vendedores`
--

DROP TABLE IF EXISTS `vista_desempeno_vendedores`;
/*!50001 DROP VIEW IF EXISTS `vista_desempeno_vendedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_desempeno_vendedores` AS SELECT 
 1 AS `IdEmpleado`,
 1 AS `NombreEmpleado`,
 1 AS `TotalVentas`,
 1 AS `MontoGenerado`,
 1 AS `TotalDevoluciones`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_devoluciones`
--

DROP TABLE IF EXISTS `vista_devoluciones`;
/*!50001 DROP VIEW IF EXISTS `vista_devoluciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_devoluciones` AS SELECT 
 1 AS `IdDevolucion`,
 1 AS `Fecha`,
 1 AS `Cliente`,
 1 AS `Producto`,
 1 AS `Cantidad`,
 1 AS `Motivo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_bajo_stock`
--

DROP TABLE IF EXISTS `vista_productos_bajo_stock`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_bajo_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_bajo_stock` AS SELECT 
 1 AS `IdProducto`,
 1 AS `NombreProducto`,
 1 AS `Categoria`,
 1 AS `StockActual`,
 1 AS `StockMinimo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_promociones_aplicadas`
--

DROP TABLE IF EXISTS `vista_promociones_aplicadas`;
/*!50001 DROP VIEW IF EXISTS `vista_promociones_aplicadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_promociones_aplicadas` AS SELECT 
 1 AS `IdVenta`,
 1 AS `Cliente`,
 1 AS `Promocion`,
 1 AS `DescuentoAplicado`,
 1 AS `FechaVenta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventas_consolidadas`
--

DROP TABLE IF EXISTS `vista_ventas_consolidadas`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_consolidadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_consolidadas` AS SELECT 
 1 AS `IdVenta`,
 1 AS `FechaVenta`,
 1 AS `Cliente`,
 1 AS `Vendedor`,
 1 AS `TipoVenta`,
 1 AS `Subtotal`,
 1 AS `Descuento`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'calzado_toapanta'
--

--
-- Dumping routines for database 'calzado_toapanta'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_calcular_comision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calcular_comision`(p_id_empleado INT, p_porcentaje DECIMAL(5,2)) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE total_ventas DECIMAL(10,2);
    DECLARE comision DECIMAL(10,2);

    -- Sumamos todas las ventas del empleado
    SELECT COALESCE(SUM(total), 0) INTO total_ventas
    FROM ventas
    WHERE id_empleado = p_id_empleado;

    -- Calculamos la comisión
    SET comision = total_ventas * (p_porcentaje / 100);
    
    RETURN comision;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calcular_descuento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calcular_descuento`(monto DECIMAL(10,2), porcentaje DECIMAL(5,2)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    RETURN monto * (porcentaje / 100);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calcular_edad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calcular_edad`(fecha_nacimiento DATE) RETURNS int
    DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calcular_iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calcular_iva`(monto DECIMAL(10,2)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    RETURN monto * 0.15;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_es_cliente_frecuente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_es_cliente_frecuente`(p_id_cliente INT) RETURNS varchar(3) CHARSET utf8mb4 COLLATE utf8mb4_spanish_ci
    READS SQL DATA
BEGIN
    DECLARE total_compras INT;

    -- Contar las compras del cliente
    SELECT COUNT(*) INTO total_compras
    FROM ventas
    WHERE id_cliente = p_id_cliente;

    -- Si tiene más de 2 compras, se considera frecuente
    IF total_compras > 2 THEN
        RETURN 'Sí';
    ELSE
        RETURN 'No';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_productos_bajo_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_productos_bajo_stock`() RETURNS int
    READS SQL DATA
BEGIN
    DECLARE total_bajo_stock INT;

    SELECT COUNT(*) INTO total_bajo_stock
    FROM productos p
    INNER JOIN inventario i ON p.id_producto = i.id_producto
    WHERE i.stock_actual < i.stock_minimo;

    RETURN total_bajo_stock;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_inventario`(
    IN p_id_producto INT, IN p_tipo_movimiento VARCHAR(50), 
    IN p_cantidad INT, IN p_motivo VARCHAR(200), IN p_id_empleado INT
)
BEGIN
    -- 1. Dejar huella del movimiento
    INSERT INTO movimientos_inventario (id_producto, tipo_movimiento, cantidad, fecha_movimiento, motivo, id_empleado)
    VALUES (p_id_producto, p_tipo_movimiento, p_cantidad, CURDATE(), p_motivo, p_id_empleado);
    
    -- 2. Ajustar stock según el tipo
    IF p_tipo_movimiento IN ('Entrada', 'Devolucion') THEN
        UPDATE inventario SET stock_actual = stock_actual + p_cantidad WHERE id_producto = p_id_producto;
    ELSEIF p_tipo_movimiento IN ('Salida', 'Ajuste') THEN
        UPDATE inventario SET stock_actual = stock_actual - p_cantidad WHERE id_producto = p_id_producto;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_aplicar_promocion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_aplicar_promocion`(
    IN p_id_venta INT, IN p_id_promocion INT
)
BEGIN
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_porcentaje DECIMAL(5,2);
    DECLARE v_descuento DECIMAL(10,2);
    
    SELECT subtotal INTO v_subtotal FROM ventas WHERE id_venta = p_id_venta;
    SELECT porcentaje_descuento INTO v_porcentaje FROM promociones WHERE id_promocion = p_id_promocion AND estado = 'Activa';
    
    SET v_descuento = v_subtotal * (v_porcentaje / 100);
    
    -- Actualizar factura
    UPDATE ventas 
    SET descuento = v_descuento, 
        id_promocion = p_id_promocion, 
        iva = (subtotal - v_descuento) * 0.15, 
        total = (subtotal - v_descuento) * 1.15
    WHERE id_venta = p_id_venta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_calcular_ventas_mensuales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_calcular_ventas_mensuales`(IN p_anio INT)
BEGIN
    SELECT 
        MONTH(fecha_venta) AS Mes, 
        SUM(total) AS TotalVentas
    FROM ventas
    WHERE YEAR(fecha_venta) = p_anio
    GROUP BY MONTH(fecha_venta)
    ORDER BY Mes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_auditoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_auditoria`(
    IN p_accion VARCHAR(100), IN p_usuario VARCHAR(100), IN p_tabla VARCHAR(100)
)
BEGIN
    INSERT INTO auditoria (accion, usuario, tabla_afectada)
    VALUES (p_accion, p_usuario, p_tabla);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_cliente`(
    IN p_cedula VARCHAR(10), IN p_nombres VARCHAR(100), IN p_apellidos VARCHAR(100),
    IN p_telefono VARCHAR(10), IN p_correo VARCHAR(150), IN p_provincia VARCHAR(100),
    IN p_fecha_nacimiento DATE
)
BEGIN
    -- Validar si ya existe
    IF EXISTS(SELECT 1 FROM clientes WHERE cedula = p_cedula OR correo = p_correo) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El cliente ya existe (cédula o correo duplicado).';
    ELSE
        INSERT INTO clientes (cedula, nombres, apellidos, telefono, correo, provincia, fecha_nacimiento)
        VALUES (p_cedula, p_nombres, p_apellidos, p_telefono, p_correo, p_provincia, p_fecha_nacimiento);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_devolucion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_devolucion`(
    IN p_id_venta INT, IN p_id_producto INT, IN p_cantidad INT, IN p_motivo VARCHAR(200)
)
BEGIN
    -- Crear registro de devolución
    INSERT INTO devoluciones (id_venta, id_producto, fecha_devolucion, cantidad, motivo)
    VALUES (p_id_venta, p_id_producto, CURDATE(), p_cantidad, p_motivo);
    
    -- Devolver stock a la bodega
    UPDATE inventario SET stock_actual = stock_actual + p_cantidad WHERE id_producto = p_id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_producto`(
    IN p_nombre VARCHAR(150), IN p_tipo VARCHAR(50), IN p_talla VARCHAR(20),
    IN p_color VARCHAR(50), IN p_precio DECIMAL(10,2), IN p_id_categoria INT,
    IN p_id_proveedor INT, IN p_stock_inicial INT, IN p_stock_minimo INT, IN p_ubicacion VARCHAR(100)
)
BEGIN
    DECLARE v_id_producto INT;
    
    IF p_tipo NOT IN ('Nacional', 'Importado') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Tipo debe ser "Nacional" o "Importado".';
    ELSE
        -- 1. Registrar el producto
        INSERT INTO productos (nombre_producto, tipo_producto, talla, color, precio, id_categoria, id_proveedor)
        VALUES (p_nombre, p_tipo, p_talla, p_color, p_precio, p_id_categoria, p_id_proveedor);
        
        SET v_id_producto = LAST_INSERT_ID();
        
        -- 2. Registrar su inventario
        INSERT INTO inventario (id_producto, stock_actual, stock_minimo, ubicacion)
        VALUES (v_id_producto, p_stock_inicial, p_stock_minimo, p_ubicacion);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_proveedor`(
    IN p_nombre VARCHAR(150), IN p_pais VARCHAR(100), IN p_tipo VARCHAR(50), 
    IN p_telefono VARCHAR(20), IN p_correo VARCHAR(150)
)
BEGIN
    IF p_tipo NOT IN ('Nacional', 'Internacional') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Tipo debe ser Nacional o Internacional.';
    ELSE
        INSERT INTO proveedores (nombre_proveedor, pais, tipo_proveedor, telefono, correo)
        VALUES (p_nombre, p_pais, p_tipo, p_telefono, p_correo);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_queja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_queja`(
    IN p_id_cliente INT, IN p_tipo VARCHAR(50), IN p_descripcion TEXT
)
BEGIN
    IF p_tipo NOT IN ('Reclamo', 'Sugerencia', 'Otro') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El tipo debe ser Reclamo, Sugerencia u Otro.';
    ELSE
        INSERT INTO quejas (id_cliente, fecha_queja, tipo_queja, descripcion)
        VALUES (p_id_cliente, CURDATE(), p_tipo, p_descripcion);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_venta`(
    IN p_nro_factura VARCHAR(20), IN p_tipo_venta VARCHAR(50), 
    IN p_id_cliente INT, IN p_id_empleado INT, IN p_id_producto INT, 
    IN p_cantidad INT, IN p_id_promocion INT
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_descuento DECIMAL(10,2) DEFAULT 0;
    DECLARE v_iva DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_porcentaje_desc DECIMAL(5,2) DEFAULT 0;
    DECLARE v_id_venta INT;
    
    -- Obtener precio base
    SELECT precio INTO v_precio FROM productos WHERE id_producto = p_id_producto;
    SET v_subtotal = v_precio * p_cantidad;
    
    -- Aplicar promoción si existe y está activa
    IF p_id_promocion IS NOT NULL THEN
        SELECT porcentaje_descuento INTO v_porcentaje_desc 
        FROM promociones 
        WHERE id_promocion = p_id_promocion AND estado = 'Activa' AND CURDATE() BETWEEN fecha_inicio AND fecha_fin;
        
        SET v_descuento = v_subtotal * (v_porcentaje_desc / 100);
    END IF;
    
    -- Calcular totales
    SET v_iva = (v_subtotal - v_descuento) * 0.15;
    SET v_total = (v_subtotal - v_descuento) + v_iva;
    
    -- Insertar Cabecera de Venta
    INSERT INTO ventas (nro_factura, fecha_venta, tipo_venta, subtotal, descuento, iva, total, id_cliente, id_empleado, id_promocion)
    VALUES (p_nro_factura, CURDATE(), p_tipo_venta, v_subtotal, v_descuento, v_iva, v_total, p_id_cliente, p_id_empleado, p_id_promocion);
    
    SET v_id_venta = LAST_INSERT_ID();
    
    -- Insertar Detalle
    INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario, subtotal)
    VALUES (v_id_venta, p_id_producto, p_cantidad, v_precio, v_subtotal);
    
    -- Descontar del inventario
    UPDATE inventario SET stock_actual = stock_actual - p_cantidad WHERE id_producto = p_id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tx_actualizacion_masiva_inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tx_actualizacion_masiva_inventario`()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la Actualización Masiva. Se ejecutó ROLLBACK.';
    END;

    START TRANSACTION;

    -- Ejemplo: Incrementa en un 10% el stock mínimo de todos los productos activos 
    -- asegurando que la operación masiva ocurra completamente o no ocurra en absoluto.
    UPDATE inventario i
    INNER JOIN productos p ON i.id_producto = p.id_producto
    SET i.stock_minimo = CEIL(i.stock_minimo * 1.10)
    WHERE p.estado = 'Activo';

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tx_compra_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tx_compra_proveedor`(
    IN p_id_producto INT, 
    IN p_cantidad INT, 
    IN p_id_empleado INT, 
    IN p_motivo VARCHAR(200)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la Compra a Proveedor. Se ejecutó ROLLBACK.';
    END;

    START TRANSACTION;

    -- 1. Registrar el movimiento de entrada en el inventario
    INSERT INTO movimientos_inventario (id_producto, tipo_movimiento, cantidad, fecha_movimiento, motivo, id_empleado)
    VALUES (p_id_producto, 'Entrada', p_cantidad, CURDATE(), p_motivo, p_id_empleado);
    
    -- 2. Actualizar el stock actual sumando la nueva mercadería
    UPDATE inventario 
    SET stock_actual = stock_actual + p_cantidad 
    WHERE id_producto = p_id_producto;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tx_devolucion_completa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tx_devolucion_completa`(
    IN p_id_venta INT, 
    IN p_id_producto INT, 
    IN p_cantidad INT, 
    IN p_motivo VARCHAR(200)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la Devolución Completa. Se ejecutó ROLLBACK.';
    END;

    START TRANSACTION;

    -- 1. Registrar la devolución
    INSERT INTO devoluciones (id_venta, id_producto, fecha_devolucion, cantidad, motivo, estado)
    VALUES (p_id_venta, p_id_producto, CURDATE(), p_cantidad, p_motivo, 'Procesada');
    
    -- 2. Incrementar de vuelta el stock en el inventario
    UPDATE inventario 
    SET stock_actual = stock_actual + p_cantidad 
    WHERE id_producto = p_id_producto;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tx_venta_completa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tx_venta_completa`(
    IN p_nro_factura VARCHAR(20), 
    IN p_tipo_venta VARCHAR(50), 
    IN p_id_cliente INT, 
    IN p_id_empleado INT, 
    IN p_id_producto INT, 
    IN p_cantidad INT, 
    IN p_id_promocion INT
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_descuento DECIMAL(10,2) DEFAULT 0;
    DECLARE v_porcentaje_desc DECIMAL(5,2) DEFAULT 0;
    DECLARE v_iva DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_id_venta INT;
    
    -- Manejador de errores para asegurar COMMIT o ROLLBACK
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la Venta Completa. Se ejecutó ROLLBACK.';
    END;

    START TRANSACTION;

    -- 1. Obtener precio unitario del producto
    SELECT precio INTO v_precio FROM productos WHERE id_producto = p_id_producto;
    SET v_subtotal = v_precio * p_cantidad;
    
    -- 2. Validar y calcular descuento si se incluye una promoción activa
    IF p_id_promocion IS NOT NULL THEN
        SELECT porcentaje_descuento INTO v_porcentaje_desc 
        FROM promociones 
        WHERE id_promocion = p_id_promocion AND estado = 'Activa' AND CURDATE() BETWEEN fecha_inicio AND fecha_fin;
        
        SET v_descuento = v_subtotal * (v_porcentaje_desc / 100);
    END IF;
    
    -- 3. Calcular IVA (15%) y Total
    SET v_iva = (v_subtotal - v_descuento) * 0.15;
    SET v_total = (v_subtotal - v_descuento) + v_iva;

    -- 4. Insertar cabecera de venta
    INSERT INTO ventas (nro_factura, fecha_venta, tipo_venta, subtotal, descuento, iva, total, id_cliente, id_empleado, id_promocion)
    VALUES (p_nro_factura, CURDATE(), p_tipo_venta, v_subtotal, v_descuento, v_iva, v_total, p_id_cliente, p_id_empleado, p_id_promocion);
    
    SET v_id_venta = LAST_INSERT_ID();
    
    -- 5. Insertar detalle de venta
    INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario, subtotal)
    VALUES (v_id_venta, p_id_producto, p_cantidad, v_precio, v_subtotal);
    
    -- 6. Actualizar inventario (descontar stock actual)
    UPDATE inventario 
    SET stock_actual = stock_actual - p_cantidad 
    WHERE id_producto = p_id_producto;

    -- Todo correcto, guardamos cambios de forma permanente
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `calzado_toapanta`
--

USE `calzado_toapanta`;

--
-- Final view structure for view `vista_clientes_frecuentes`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes_frecuentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes_frecuentes` AS select `c`.`id_cliente` AS `IdCliente`,`c`.`nombres` AS `Nombres`,`c`.`apellidos` AS `Apellidos`,`c`.`provincia` AS `Provincia`,count(`v`.`id_venta`) AS `TotalCompras`,coalesce(sum(`v`.`total`),0) AS `MontoAcumulado` from (`clientes` `c` left join `ventas` `v` on((`c`.`id_cliente` = `v`.`id_cliente`))) group by `c`.`id_cliente`,`c`.`nombres`,`c`.`apellidos`,`c`.`provincia` order by `MontoAcumulado` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_desempeno_vendedores`
--

/*!50001 DROP VIEW IF EXISTS `vista_desempeno_vendedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_desempeno_vendedores` AS select `e`.`id_empleado` AS `IdEmpleado`,concat(`e`.`nombres`,' ',`e`.`apellidos`) AS `NombreEmpleado`,coalesce(`vt`.`TotalVentas`,0) AS `TotalVentas`,coalesce(`vt`.`MontoGenerado`,0) AS `MontoGenerado`,coalesce(`dt`.`TotalDevoluciones`,0) AS `TotalDevoluciones` from ((`empleados` `e` left join (select `ventas`.`id_empleado` AS `id_empleado`,count(`ventas`.`id_venta`) AS `TotalVentas`,sum(`ventas`.`total`) AS `MontoGenerado` from `ventas` group by `ventas`.`id_empleado`) `vt` on((`e`.`id_empleado` = `vt`.`id_empleado`))) left join (select `v`.`id_empleado` AS `id_empleado`,count(`d`.`id_devolucion`) AS `TotalDevoluciones` from (`devoluciones` `d` join `ventas` `v` on((`d`.`id_venta` = `v`.`id_venta`))) group by `v`.`id_empleado`) `dt` on((`e`.`id_empleado` = `dt`.`id_empleado`))) where (`e`.`rol` in ('Vendedor','Administrador','Gerente')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_devoluciones`
--

/*!50001 DROP VIEW IF EXISTS `vista_devoluciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_devoluciones` AS select `d`.`id_devolucion` AS `IdDevolucion`,`d`.`fecha_devolucion` AS `Fecha`,concat(`c`.`nombres`,' ',`c`.`apellidos`) AS `Cliente`,`p`.`nombre_producto` AS `Producto`,`d`.`cantidad` AS `Cantidad`,`d`.`motivo` AS `Motivo` from (((`devoluciones` `d` join `ventas` `v` on((`d`.`id_venta` = `v`.`id_venta`))) join `clientes` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) join `productos` `p` on((`d`.`id_producto` = `p`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_bajo_stock`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_bajo_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_bajo_stock` AS select `p`.`id_producto` AS `IdProducto`,`p`.`nombre_producto` AS `NombreProducto`,`cat`.`nombre_categoria` AS `Categoria`,`i`.`stock_actual` AS `StockActual`,`i`.`stock_minimo` AS `StockMinimo` from ((`productos` `p` join `inventario` `i` on((`p`.`id_producto` = `i`.`id_producto`))) join `categorias` `cat` on((`p`.`id_categoria` = `cat`.`id_categoria`))) where (`i`.`stock_actual` <= `i`.`stock_minimo`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_promociones_aplicadas`
--

/*!50001 DROP VIEW IF EXISTS `vista_promociones_aplicadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_promociones_aplicadas` AS select `v`.`id_venta` AS `IdVenta`,concat(`c`.`nombres`,' ',`c`.`apellidos`) AS `Cliente`,`p`.`nombre_promocion` AS `Promocion`,`v`.`descuento` AS `DescuentoAplicado`,`v`.`fecha_venta` AS `FechaVenta` from ((`ventas` `v` join `clientes` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) join `promociones` `p` on((`v`.`id_promocion` = `p`.`id_promocion`))) where (`v`.`id_promocion` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_consolidadas`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_consolidadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_consolidadas` AS select `v`.`id_venta` AS `IdVenta`,`v`.`fecha_venta` AS `FechaVenta`,concat(`c`.`nombres`,' ',`c`.`apellidos`) AS `Cliente`,concat(`e`.`nombres`,' ',`e`.`apellidos`) AS `Vendedor`,`v`.`tipo_venta` AS `TipoVenta`,`v`.`subtotal` AS `Subtotal`,`v`.`descuento` AS `Descuento`,`v`.`total` AS `Total` from ((`ventas` `v` join `clientes` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) join `empleados` `e` on((`v`.`id_empleado` = `e`.`id_empleado`))) */;
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

-- Dump completed on 2026-07-22 21:54:31
