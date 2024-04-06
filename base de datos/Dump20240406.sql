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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'teclado'),(2,'notebook');
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Real Estate Investment Trusts',86,'igonyodcri',80,2,'hgjfwqwlz.jpg'),(2,'Other Consumer Services',3,'fqchnrcqyn',85,1,'tvolhehaf.jpg'),(3,'Major Banks',85,'uiypdeluqx',10,1,'awytpixdd.jpg'),(4,'n/a',43,'tovmtrrdza',43,2,'bseitonfk.jpg'),(5,'Natural Gas Distribution',42,'htnyzuwtti',41,2,'rffrsbprk.jpg'),(6,'n/a',27,'wbmxaewwos',56,1,'otupnjiog.jpg'),(7,'Major Pharmaceuticals',83,'zqfbbyzukm',55,1,'mjlpufxra.jpg'),(8,'n/a',46,'uqzdivpgem',4,2,'tlxcmymks.jpg'),(9,'Major Banks',49,'dklxnkossx',98,1,'eitpatjxz.jpg'),(10,'Commercial Banks',50,'ienpubwmzu',86,2,'dicsfgvil.jpg'),(11,'n/a',69,'xbzfxlsvgq',49,2,'phtzcutiu.jpg'),(12,'n/a',72,'ngulxehpfp',56,1,'serfksnlq.jpg'),(13,'Major Pharmaceuticals',14,'ermtntatwt',12,2,'ttqoshtuf.jpg'),(14,'n/a',82,'fumhbhnbna',24,1,'jkkvhtrwo.jpg'),(15,'Major Banks',25,'uwuabcqaft',88,1,'erymogxxi.jpg'),(16,'Real Estate Investment Trusts',63,'advhclxxgr',56,2,'hlzdxpuii.jpg'),(17,'Telecommunications Equipment',27,'bwltbpbutt',35,1,'spztbodia.jpg'),(18,'Investment Managers',70,'qybhcvrnuh',5,1,'ugosugqxp.jpg'),(19,'n/a',10,'mouputxewc',73,1,'swivcwsmg.jpg'),(20,'Major Pharmaceuticals',70,'mkldoyyuly',68,1,'fkqogjpkg.jpg'),(21,'Life Insurance',11,'stydnxzkqg',94,2,'kvomcjcgh.jpg'),(22,'Office Equipment/Supplies/Services',19,'xiaibvyeyy',95,1,'twppqgdbj.jpg'),(23,'Electric Utilities: Central',99,'mpqhgjcdyg',87,2,'mjgwwnryq.jpg'),(24,'Other Consumer Services',34,'zpjlvirkya',18,1,'zubzaniph.jpg'),(25,'Biotechnology: Laboratory Analytical Instruments',51,'bodapewnjr',94,1,'iieovbfom.jpg'),(26,'Major Banks',75,'vkupjmcqzo',60,1,'dfepcgclv.jpg'),(27,'Electric Utilities: Central',62,'hzixfnnhwj',39,2,'xfuelbigo.jpg'),(28,'n/a',38,'ackppcyscu',31,1,'owyfjmmjk.jpg'),(29,'Computer Software: Prepackaged Software',57,'edhecxnxpv',18,1,'qerhrvquh.jpg'),(30,'n/a',42,'qtmlrqshna',68,1,'szfwowqmm.jpg'),(31,'n/a',35,'cqwfhgmnyl',46,1,'wfbjximde.jpg'),(32,'n/a',83,'uhhiajcrdn',73,2,'ctuzwhjbu.jpg'),(33,'n/a',7,'ifqysepnzv',51,2,'bjqwuziaq.jpg'),(34,'Notebook Lenovo',419999,'Notebook lenovo ideapad 1 14igl7 platinum gray 14 , intel dual core celeron 4020, 4gb de ram, 128gb ssd, windows 11 home s',100,1,'compu20240404014712.webp'),(35,'Cable Hdmi',4399,'Cable hdmi 3 metros v1.4 full hd 4k dorado led pc monitor',300,1,'hdmi20240404014917.webp'),(36,'Kit Teclado Y Mouse',29,'Kit teclado y mouse inalambrico mk235 logitech color del mouse negro color del teclado negro',899,1,'teclado20240404015347.webp'),(38,'n/a',53,'qzptuqdrng',73,2,'qmgymjexs.jpg'),(39,'n/a',58,'omwggsdjbf',95,2,'pekwzpsqt.jpg'),(40,'n/a',61,'pldzgfjcjx',96,1,'gchhgwcop.jpg'),(41,'Major Pharmaceuticals',63,'osnplvwtsf',75,1,'ntuekpazy.jpg'),(42,'Major Banks',34,'qpqrksdxxk',1,2,'kliyfkpfn.jpg'),(43,'n/a',90,'xnsnminlgh',58,1,'ywjyfsylj.jpg'),(44,'n/a',58,'ubpnasddqj',92,2,'wchjhdooj.jpg'),(45,'Major Banks',18,'qfcrcasggx',8,2,'cdremzamt.jpg'),(46,'Oil & Gas Production',74,'hkwtawaehx',55,2,'pmjxhccir.jpg'),(47,'Telecommunications Equipment',79,'qcmadzudwg',5,2,'roprdodfb.jpg'),(48,'Biotechnology: Electromedical & Electrotherapeutic Apparatus',88,'fqdlltmbzs',5,1,'kmixlhqcc.jpg'),(49,'n/a',83,'zwflrxyrli',71,2,'qbxwntymd.jpg'),(50,'Transportation Services',60,'hvdymuuleq',82,1,'hjbcdabda.jpg'),(51,'Biotechnology: Biological Products (No Diagnostic Substances)',86,'muhmnfjhni',84,2,'vztywnpev.jpg'),(52,'Real Estate Investment Trusts',11,'dkctffipwk',75,1,'zxyqwbeeu.jpg'),(53,'Real Estate',31,'eojlooyzgj',41,2,'szdqjyowe.jpg'),(54,'Mining & Quarrying of Nonmetallic Minerals (No Fuels)',3,'mooxpcpbvr',82,2,'ubpakwczo.jpg'),(55,'n/a',46,'tpbihkstlk',70,1,'oftfjdldq.jpg'),(56,'Investment Managers',37,'tfvmgjylkp',91,2,'vhrqkltgv.jpg'),(57,'Telecommunications Equipment',98,'foiyjbvsss',61,1,'tmjrobsdm.jpg'),(58,'Investment Bankers/Brokers/Service',23,'kfdkegxgbf',34,2,'ewlbgrjru.jpg'),(59,'Computer Communications Equipment',19,'bijjbnspwj',89,2,'ssnuyxzyg.jpg'),(60,'Commercial Banks',9,'aaqwhluyzy',18,2,'shbbqctzh.jpg'),(61,'Major Banks',58,'kckpjijgja',22,1,'fhzypidrh.jpg'),(62,'Real Estate',76,'giomgyqorq',6,1,'qkkftetix.jpg'),(63,'Finance Companies',9,'iisdwaxwir',94,2,'cbiumzwcv.jpg'),(64,'n/a',71,'tswnthylvt',29,2,'ahkhrdwzt.jpg'),(65,'Electric Utilities: Central',71,'qsqtqbpzqt',30,2,'zovhapuaz.jpg'),(66,'Precious Metals',56,'xyxoinssim',68,2,'fwralcprr.jpg'),(67,'Industrial Machinery/Components',97,'pcloprtido',32,2,'ksdyltrdf.jpg'),(68,'n/a',83,'rfrkqkgyjm',5,1,'yqiohgslc.jpg'),(69,'Engineering & Construction',86,'fbjlrsijgy',38,1,'xtomjsxwu.jpg'),(70,'n/a',59,'nnwsrmufln',49,2,'wltegdlrw.jpg'),(71,'Computer Software: Prepackaged Software',4,'umihzvkmtv',17,2,'yiurvmrxi.jpg'),(72,'Computer Manufacturing',42,'payvdlmftr',1,1,'qzxemomuw.jpg'),(73,'Farming/Seeds/Milling',33,'iejoeunhog',2,1,'lfjdkjdky.jpg'),(74,'Computer Software: Prepackaged Software',53,'wsxevnnbuc',48,2,'gzznwpqhn.jpg'),(75,'Semiconductors',44,'gklrpruinn',80,1,'expzfzdpm.jpg'),(76,'Environmental Services',5,'otdoqxwxlx',92,1,'vkuprulsg.jpg'),(77,'n/a',1,'nexmkfxjkg',8,1,'yweuwtgun.jpg'),(78,'Oil & Gas Production',52,'ajiejvrjyb',76,2,'nymjucwxy.jpg'),(79,'n/a',92,'sfnewpfgtd',72,2,'dqxxuzkkd.jpg'),(80,'Real Estate Investment Trusts',95,'mopmsphzre',68,1,'ygufshacj.jpg'),(81,'n/a',59,'mguwvdxudg',60,2,'iqlptgmvr.jpg'),(82,'n/a',15,'ghhvqxzios',83,2,'tehmtlmif.jpg'),(83,'Television Services',70,'pnggtqaxkt',27,1,'dbfouhrmt.jpg'),(84,'Natural Gas Distribution',83,'cehasvnqxq',5,1,'tmonmomkz.jpg'),(85,'Major Pharmaceuticals',11,'ajvcnwateu',28,1,'wixaduvhp.jpg'),(86,'Food Distributors',30,'qduogfnsgg',6,2,'lpilnohql.jpg'),(87,'Semiconductors',84,'msolvsmmoc',7,1,'euibzjhwv.jpg');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-06 16:07:50
