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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(90) NOT NULL,
  `pass_usuario` varchar(90) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `nombre_usuario_UNIQUE` (`nombre_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'julian','123456789');
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

-- Dump completed on 2024-04-16 23:15:23
