-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: imagenes
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Teclados'),(2,'Notebooks'),(3,'Componentes de pc'),(4,'Accesorios de celular'),(5,'Mouses'),(6,'Celulares');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(70) NOT NULL,
  `precio_producto` float NOT NULL,
  `descripcion_producto` varchar(200) NOT NULL,
  `cantidad_producto` int NOT NULL,
  `categoria_producto` int NOT NULL,
  `imagen_producto` varchar(200) NOT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `categoriaproducto_idx` (`categoria_producto`),
  CONSTRAINT `categoriaproducto` FOREIGN KEY (`categoria_producto`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (96,'Auriculares Inalambricos',32609,'Auriculares inalambricos xiaomi redmi buds 3 lite color negro',20,4,'D_NQ_NP_820272-MLA52223523474_102022-O20240411113855.webp'),(97,'Celular Samsung',189999,'Celular samsung galaxy a04 128gb color negro',40,6,'D_NQ_NP_990969-MLA53225323327_012023-O20240411114144.webp'),(98,'Disco Sólido Interno Kingston',94999,'Disco sólido interno kingston sa400s37/960g sata 960gb negro',60,3,'D_NQ_NP_904375-MLA72445223422_102023-O20240411115217.webp'),(99,'Mouse Inalámbrico Xiaomi',16800,'Mouse inalámbrico xiaomi wireless mouse lite color negro',100,5,'D_NQ_NP_628595-MLA44435414382_122020-O20240411115447.webp'),(100,'Notebook Asus',1054000,'Notebook asus x515ea slate grey 15.6\", intel core i7 1165g7 40gb de ram 1 tb ssd, intel iris xe graphics 60 hz 1920x1080px freedos',10,2,'D_NQ_NP_950078-MLA71208111400_082023-O20240411115650.webp'),(101,'Teclado Logitech',12429,'Teclado logitech k120 qwerty español color negro',50,1,'D_NQ_NP_667854-MLA74781181215_022024-O20240411115900.webp');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idroles` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idroles`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'administrador'),(2,'usuario');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesiones` (
  `idsesiones` int NOT NULL AUTO_INCREMENT,
  `usuario_sesion` int NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime DEFAULT NULL,
  PRIMARY KEY (`idsesiones`),
  KEY `id_usuario_idx` (`usuario_sesion`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`usuario_sesion`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
INSERT INTO `sesiones` VALUES (7,3,'2024-04-29 20:46:47','2024-04-29 20:46:50'),(9,17,'2023-05-13 00:54:58','2023-07-11 03:26:50'),(10,24,'2023-05-13 00:54:58','2023-07-11 03:26:50'),(11,22,'2024-02-10 22:17:35','2024-05-01 04:50:41'),(12,22,'2024-05-04 08:03:00','2024-11-01 20:29:34'),(13,33,'2024-02-14 20:35:21','2023-12-05 15:00:39'),(14,33,'2023-07-07 19:50:40','2024-06-25 14:54:23'),(15,32,'2024-04-01 20:40:21','2023-10-25 20:43:10'),(16,17,'2023-10-31 15:30:19','2023-12-27 18:31:00'),(17,32,'2024-03-19 18:15:13','2024-03-08 04:25:38'),(18,24,'2023-06-16 13:02:53','2024-01-18 10:18:09'),(19,33,'2024-06-11 02:26:51','2024-09-01 04:53:23'),(20,32,'2023-08-05 08:32:15','2024-10-20 23:29:43'),(21,32,'2023-08-19 16:15:57','2024-11-15 19:27:55'),(22,32,'2023-11-29 07:02:36','2024-12-30 09:18:02'),(23,33,'2024-07-04 18:26:00','2023-11-27 03:38:44'),(24,33,'2024-01-13 21:21:19','2024-07-05 05:19:12'),(25,32,'2024-07-10 02:30:30','2024-09-13 02:19:55'),(26,33,'2024-03-15 01:50:39','2023-12-10 19:49:26'),(27,33,'2023-10-11 06:40:40','2024-01-22 07:21:26'),(28,32,'2023-08-08 09:42:50','2023-04-30 19:03:01'),(29,33,'2024-01-12 08:47:35','2023-05-13 22:19:06'),(30,32,'2024-07-30 18:59:52','2024-07-09 18:51:56'),(31,33,'2023-07-25 18:18:56','2024-07-14 18:31:17'),(32,32,'2024-07-26 08:43:57','2023-11-23 04:16:26'),(33,33,'2024-04-30 00:25:43','2023-10-16 03:32:42'),(34,32,'2023-07-27 18:48:55','2024-05-02 11:46:41'),(35,32,'2024-07-21 13:55:23','2025-02-10 01:30:23'),(36,27,'2023-12-25 18:29:40','2025-01-11 09:31:28'),(37,27,'2023-05-22 01:13:41','2023-11-24 05:15:17'),(38,27,'2023-11-21 14:12:06','2024-09-07 11:57:02'),(39,32,'2024-05-08 04:14:40','2024-06-10 00:46:09'),(40,3,'2024-05-01 21:19:36','2024-05-01 21:28:13'),(41,3,'2024-05-01 21:29:31','2024-05-01 21:45:41'),(42,3,'2024-05-01 22:26:25','2024-05-01 22:42:40');
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre_per` varchar(50) NOT NULL,
  `apellido_per` varchar(50) NOT NULL,
  `nombre_usuario` varchar(90) NOT NULL,
  `pass_usuario` varchar(200) NOT NULL,
  `rol` int NOT NULL,
  `correo_usuario` varchar(100) NOT NULL,
  `verificacion` int NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `nombre_usuario_UNIQUE` (`nombre_usuario`),
  UNIQUE KEY `correo_usuario_UNIQUE` (`correo_usuario`),
  KEY `id_rol_idx` (`rol`),
  CONSTRAINT `id_rol` FOREIGN KEY (`rol`) REFERENCES `roles` (`idroles`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (3,'tomas ramon','gomez','sofipro1','scrypt:32768:8:1$tIvadPdzGannkQ1a$9c558e3525d95c566beb0523f21cdc64c7c58f67fde6d1318b24cbe98885402d8d4d3fddb8cd9b760fc7fce64c5c2c4c43dec55aa2195cfa726fb0484777e4bd',1,'juliansmurf55@gmail.com',0),(17,'esteban','veisaga','esteban3','scrypt:32768:8:1$dcNl186SOoTzTtjv$fad33497a439e2059693ec55a789b352d3a452ec81d3e0c5cefc7b6a1972301045caa1c6984789b86078db26ef9fccf721bf7348162490ee27b38d586b8c1410',2,'tomigamer1@gmail.com',0),(22,'julian','perez','julian1','scrypt:32768:8:1$J98nz2oWYlxBCkRU$ae46137f2ba5af1f98c1b9eaf6bdaedab591c4e308e0da3e46bb0c9f10159f7ee1ff911abaaf16f4fd14de02976b00ac37c8edf3205690149eaadc424cd7026c',1,'juliangaldamez11@gmail.com',0),(24,'sofi','pro','ramon542','scrypt:32768:8:1$TyonlWefa3Ms32yc$1ed3d86a3dcef2dddb4bc43aa70ac72a39023a862e5c724dcdbf6ba7e23377c9319336de5dc090fbdbbc38afb4f4f725ff1ee43ff7ff882db74b7815b08ea81e',2,'sofisandobal10@gmail.com',0),(27,'toma','game','tomasgamer123','scrypt:32768:8:1$RgLVB2whZ0l5rxRe$ae3fc1e0663d89032ca5806fa94a68249fb7dc235f2bd3730af0333b889e105be5ad75857ae125ef40861c7e10599bba901df9108ed9e8e8dc89d6bced8bc5a2',1,'1tomilopez@gmail.com',0),(32,'julian','102395u23','luis33','scrypt:32768:8:1$SsOuLJfpl4qvaLhv$97518daed0f19619d318dbc34c1921ddefe16db9e6cbcea8d71e1c252dc6513fd8671db525bd45b206df63966685d403efb34efd2f16a0b2288ea84b32a95838',2,'juliangaldamez0@gmail.com',1),(33,'david','veisaga','david1','scrypt:32768:8:1$9Rlhh72KFwpRgH8c$48f5f06b7afc00d7d4fe399fe9ed4707453b1fd61614f90199dc79e54f8e50b2e6224da4d3d00be2569a23f1d33e643897c4cd381336522184fd3454c822633e',2,'davidveisaga@gmail.com',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-01 22:43:30
