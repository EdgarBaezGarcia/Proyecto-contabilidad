-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_para_coca
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `mano_obra`
--

DROP TABLE IF EXISTS `mano_obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mano_obra` (
  `id_mano_obra` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `actividad` varchar(100) NOT NULL,
  `horas` double NOT NULL,
  `tasa_hora` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_mano_obra`),
  KEY `id_orden` (`id_orden`),
  CONSTRAINT `mano_obra_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mano_obra`
--

LOCK TABLES `mano_obra` WRITE;
/*!40000 ALTER TABLE `mano_obra` DISABLE KEYS */;
INSERT INTO `mano_obra` VALUES (1,1,'Mezclado',2,85,170),(2,1,'Llenado',3,90,270),(3,1,'Empaque',2,80,160),(4,2,'empaque',2,80,160),(5,2,'mezclado',2,85,170),(6,2,'llenado',3,90,270),(7,3,'Mezclado',2,85,170),(8,3,'llenado',3,90,270),(9,3,'empaquetado',2,80,160);
/*!40000 ALTER TABLE `mano_obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiales`
--

DROP TABLE IF EXISTS `materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiales` (
  `id_material` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `concepto` varchar(100) NOT NULL,
  `cantidad` double NOT NULL,
  `unidad_medida` varchar(30) NOT NULL,
  `costo_unitario` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_material`),
  KEY `id_orden` (`id_orden`),
  CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales`
--

LOCK TABLES `materiales` WRITE;
/*!40000 ALTER TABLE `materiales` DISABLE KEYS */;
INSERT INTO `materiales` VALUES (1,1,'Agua',828,'litros',0.03,24.84),(2,1,'Concentrado',12,'litros',85,1020),(3,1,'Edulcorante',35,'kg',18,630),(4,1,'CO2',8,'kg',14,112),(5,1,'Botella PET 600 ml',1000,'pzas',1.85,1850),(6,1,'Tapa',1000,'pzas',0.22,220),(7,1,'Etiqueta',1000,'pzas',0.18,180),(8,1,'Empaque secundario',1000,'pzas',0.25,250),(9,2,'Agua',828,'litros',0.03,24.84),(10,2,'concentrado',12,'litros',85,1020),(11,2,'endulcorante',35,'kilos',18,630),(12,2,'CO2',8,'kilos',14,112),(13,2,'Botella PET 600ml',1000,'pzas',0.22,220),(14,2,'etiqueta',1000,'pzas',0.18,180),(15,2,'empaque secundario',1000,'pzas',0.25,250),(16,3,'Agua',828,'Litros',0.03,24.84),(17,3,'Concentrado',12,'litros',85,1020),(18,3,'Edulcorante',35,'Kg',18,630),(19,3,'CO2',35,'Kg',14,490),(20,3,'Botella PET 600 ml',1000,'pzas',1.85,1850),(21,3,'Tapa',1000,'pzas',0.22,220),(22,3,'etiquetas',1000,'pzas',0.18,180);
/*!40000 ALTER TABLE `materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `id_orden` int NOT NULL,
  `id_producto` int NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `supervisor` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_terminacion` date NOT NULL,
  `unidades_producidas` int NOT NULL,
  `porcentaje_cif` double NOT NULL,
  `estado` varchar(30) NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (1,1,'Coca-Cola FEMSA','Supervisor de producción','2026-03-17','2026-03-17',1000,150,'ACTIVA'),(2,1,'Coca-Cola FEMSA','Supervisor de producción','2026-03-17','2026-05-25',1000,150,'TERMINADA'),(3,1,'Coca-Cola FEMSA','Supervisor de producción','2026-03-17','2026-05-27',1000,150,'PENDIENTE'),(4,1,'Coca-Cola FEMSA','Supervisor de producción','2026-03-17','2026-05-27',1000,150,'PENDIENTE');
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `presentacion` varchar(50) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Coca-Cola Original','600 ml PET','ACTIVO'),(2,'Coca-Cola Original','1 litro PET','DISPONIBLE FUTURO'),(3,'Coca-Cola Original','3 litros PET','DISPONIBLE FUTURO');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sistema_para_coca'
--

--
-- Dumping routines for database 'sistema_para_coca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-09 18:56:29
