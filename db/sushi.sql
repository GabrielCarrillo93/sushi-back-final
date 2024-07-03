-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: sushi
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `idcarrito` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idcarrito`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,'2024-06-26 20:49:46'),(2,'2024-06-27 19:00:22'),(3,'2024-06-27 19:00:57'),(5,'2024-06-27 21:26:38'),(6,'2024-06-27 21:28:26');
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `Categoria_ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Categoria_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Entrada'),(2,'Roll vegetariano'),(3,'Roll caliente'),(4,'Onigiri'),(5,'Ramen'),(6,'Salsa');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_de_productos`
--

DROP TABLE IF EXISTS `lista_de_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_de_productos` (
  `idlista_de_productos` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT '1',
  `id_carrito` int DEFAULT NULL,
  `id_catalogo` int DEFAULT NULL,
  PRIMARY KEY (`idlista_de_productos`),
  KEY `idcarrito_idx` (`id_carrito`),
  KEY `id_catalogo_idx` (`id_catalogo`),
  CONSTRAINT `id_catalogo` FOREIGN KEY (`id_catalogo`) REFERENCES `productosushi` (`ID_Producto`),
  CONSTRAINT `idcarrito` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`idcarrito`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_de_productos`
--

LOCK TABLES `lista_de_productos` WRITE;
/*!40000 ALTER TABLE `lista_de_productos` DISABLE KEYS */;
INSERT INTO `lista_de_productos` VALUES (9,25,1,3),(10,3,1,2),(21,15,1,4),(22,9,1,1),(23,3,1,5),(25,4,2,1),(26,9,2,5),(27,16,3,3),(29,9,3,5),(54,1,3,1),(61,1,3,2);
/*!40000 ALTER TABLE `lista_de_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productosushi`
--

DROP TABLE IF EXISTS `productosushi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productosushi` (
  `ID_Producto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  `Precio` decimal(10,2) NOT NULL,
  `Categoria_ID` varchar(50) DEFAULT NULL,
  `Ingredientes` text,
  `Disponible` tinyint(1) DEFAULT '1',
  `Fecha_Creación` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualización` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productosushi`
--

LOCK TABLES `productosushi` WRITE;
/*!40000 ALTER TABLE `productosushi` DISABLE KEYS */;
INSERT INTO `productosushi` VALUES (1,'Arrollados primavera','Crujientes arrollados rellenos de vegetales frescos.',6000.00,'1','Repollo, Zanahoria, Fideos de Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(2,'Rukkora-Yasai (Roll Vegano)','Rollo vegano con rúcula y vegetales frescos.',8500.00,'2','Rúcula, Pepino, Zanahoria, Aguacate, Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(3,'Rabas','Calamares rebozados y fritos.',12000.00,'1','Calamar, Harina, Limón',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(4,'Dumplings','Empanadillas rellenas de carne de cerdo.',7500.00,'1','Carne de Cerdo, Jengibre, Cebolla Verde, Salsa de Soja',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(5,'California Tako-Roll','Rollo de sushi con pulpo y aguacate.',10000.00,'3','Pulpo, Aguacate, Pepino, Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(6,'Mango Sushi-Roll','Rollo de sushi con mango fresco y salmón.',11000.00,'3','Mango, Salmón, Aguacate, Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(7,'California Chizu-Roll','Rollo de sushi con queso crema y aguacate.',9500.00,'3','Queso Crema, Aguacate, Pepino, Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(8,'California Crispy-Roll','Rollo de sushi crujiente con cangrejo y pepino.',11500.00,'3','Cangrejo, Pepino, Mayonesa, Arroz, Alga, Tempura',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(9,'Dragon Roll (Avocado Sushi)','Rollo de sushi con anguila y aguacate.',13000.00,'3','Anguila, Aguacate, Pepino, Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(10,'Salmón Roll','Rollo de sushi con salmón fresco.',10000.00,'3','Salmón, Aguacate, Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(11,'Pepino Roll','Rollo de sushi simple con pepino.',7000.00,'2','Pepino, Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(12,'Toki Maki-Roll','Rollo de sushi especial con tempura de camarón.',14000.00,'3','Tempura de Camarón, Aguacate, Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(13,'Sashimi Salmon','Láminas finas de salmón fresco.',15000.00,'1','Salmón',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(14,'Osaka Ebi-Roll','Rollo de sushi con camarones tempura y aguacate.',12000.00,'3','Camarones Tempura, Aguacate, Pepino, Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(15,'Ramen de Cerdo','Ramen tradicional con carne de cerdo.',13500.00,'5','Cerdo, Fideos Ramen, Huevo, Caldo de Cerdo, Cebolla Verde',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(16,'Temaki Roll','Cono de sushi con pescado fresco y vegetales.',9000.00,'3','Atún, Aguacate, Pepino, Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(17,'Onigiri Relleno de Camarones','Bola de arroz rellena de camarones.',5500.00,'4','Arroz, Camarones, Alga, Sésamo',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(18,'Plátano Roll','Rollo de sushi dulce con plátano y crema.',8000.00,'2','Plátano, Crema, Arroz, Alga',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(19,'Kit de Salsas','Selección de salsas para acompañar.',3000.00,'6','Wasabi, Salsa de Soja, Salsa Teriyaki',1,'2024-07-03 05:54:43','2024-07-03 05:54:43'),(20,'Nombre',NULL,7500.00,NULL,'Carne de Cerdo, Jengibre, Cebolla Verde, Salsa de Soja',1,'2024-07-03 06:32:33','2024-07-03 06:32:33');
/*!40000 ALTER TABLE `productosushi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `dni_ID` int NOT NULL,
  `Nombre` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Apellido` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Correo` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `Contrasena` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `id_carrito` int DEFAULT NULL,
  PRIMARY KEY (`dni_ID`),
  KEY `id_carrito_idx` (`id_carrito`),
  CONSTRAINT `id_carrito` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`idcarrito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (23432112,'Jesus','Petrolino','Petromil@hotmai','32455r356',NULL),(45432567,'Antonio','Pirata','Onepice@gmail.c','mEldesrorta123',NULL),(45678565,'Papelon','Conlimon','limon@gmail.com','limonciro123',NULL),(45678566,'Mercedes','Amg','mercedes@gmail.','mercedesita123',NULL),(78698760,'Tusita','Canagia','tsi@gmail.com','23455677',NULL),(86954765,'Luis','Gutierrez','luis@hotmail.co','1233456yt',NULL),(96453232,'Maria','Penitrnci','maria@hotmail.c','2345634r',NULL),(96789654,'Pietro','Parolin','Pepitoyariyagua','1234567',NULL),(98654342,'Pedro','Solomon','PepeSolo@gmail.','1234568',NULL),(98977699,'Papa','Noel','noelo@hotmail.c','234567654',NULL);
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
