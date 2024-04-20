CREATE DATABASE  IF NOT EXISTS `db_mariosPizzaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_mariosPizzaria`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: db_mariosPizzaria
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `tbCadastroCliente`
--

DROP TABLE IF EXISTS `tbCadastroCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbCadastroCliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CPF` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco1` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco2` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CEP` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbCadastroCliente`
--

LOCK TABLES `tbCadastroCliente` WRITE;
/*!40000 ALTER TABLE `tbCadastroCliente` DISABLE KEYS */;
INSERT INTO `tbCadastroCliente` VALUES (1,'Maria Silva','123.456.789-00','Rua Principal, 123','Bairro do Centro','12345-678','(12) 3456-7890','maria@email.com'),(2,'João Oliveira','987.654.321-00','Avenida das Flores, 456','Bairro da Praia','98765-432','(98) 7654-3210','joao@email.com'),(3,'Ana Santos','456.789.123-00','Rua das Pedras, 789','Bairro do Campo','45678-912','(45) 6789-1234','ana@email.com'),(4,'Pedro Souza','321.654.987-00','Travessa das Oliveiras, 789','Bairro da Montanha','32165-498','(32) 1654-9876','pedro@email.com'),(5,'Carla Almeida','654.321.987-00','Alameda das Árvores, 654','Bairro do Lago','65432-198','(65) 4321-9876','carla@email.com'),(6,'Marcos Pereira','789.123.456-00','Praça da Paz, 321','Bairro da Serra','78912-345','(78) 9123-4567','marcos@email.com'),(7,'Juliana Costa','456.321.789-00','Avenida dos Sonhos, 987','Bairro da Floresta','45632-178','(45) 6321-7890','juliana@email.com'),(8,'Rafael Lima','789.456.123-00','Estrada do Sol, 456','Bairro da Lua','78945-612','(78) 9456-1234','rafael@email.com'),(9,'Fernanda Oliveira','123.789.456-00','Rua das Estrelas, 159','Bairro do Mar','12378-945','(12) 3789-4561','fernanda@email.com'),(10,'Gustavo Pereira','987.123.789-00','Avenida das Cores, 357','Bairro da Praia','98712-378','(98) 7123-7890','gustavo@email.com');
/*!40000 ALTER TABLE `tbCadastroCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbControlePizza`
--

DROP TABLE IF EXISTS `tbControlePizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbControlePizza` (
  `idControle` int NOT NULL AUTO_INCREMENT,
  `idPizza` int NOT NULL,
  `periodo` date NOT NULL,
  `quantidade` int NOT NULL,
  `situacao` tinyint(1) NOT NULL,
  `horarioInicio` time NOT NULL,
  `horarioFim` time NOT NULL,
  PRIMARY KEY (`idControle`),
  KEY `idPizza` (`idPizza`),
  CONSTRAINT `tbControlePizza_ibfk_1` FOREIGN KEY (`idPizza`) REFERENCES `tbPizzaCardapio` (`idPizza`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbControlePizza`
--

LOCK TABLES `tbControlePizza` WRITE;
/*!40000 ALTER TABLE `tbControlePizza` DISABLE KEYS */;
INSERT INTO `tbControlePizza` VALUES (1,1,'2024-04-15',2,1,'18:00:00','18:30:00'),(2,5,'2024-04-15',1,1,'19:00:00','19:16:00'),(3,2,'2024-04-20',3,1,'17:30:00','18:20:00'),(4,4,'2024-04-20',1,0,'18:30:00','00:00:00');
/*!40000 ALTER TABLE `tbControlePizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbEstoque`
--

DROP TABLE IF EXISTS `tbEstoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbEstoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `ingrediente` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantidade` double DEFAULT NULL,
  `insumo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbEstoque`
--

LOCK TABLES `tbEstoque` WRITE;
/*!40000 ALTER TABLE `tbEstoque` DISABLE KEYS */;
INSERT INTO `tbEstoque` VALUES (1,'Peito de Frango Desfiado','Grama',5000,1),(2,'Milho','Grama',1000,1),(3,'Catupiry','Grama',2000,1),(4,'Mussarela','Grama',4000,1),(5,'Tomate','Grama',3000,1),(6,'Parmesão','Grama',4000,1),(7,'Manjericão','Grama',1000,1),(8,'Caixa de Pizza','Unidade',50,1),(9,'Azeitona','Grama',1500,1),(10,'Molho de Tomate','Mililitro',6000,1),(11,'Bacon','Grama',5000,1),(12,'Ovo','Unidade',22,1),(13,'Atum','Grama',2500,1),(14,'Cebola','Grama',2000,1),(15,'Massa de Pizza','Grama',10000,1),(16,'Pizza Mussarela','',2,0),(17,'Pizza Caipira (Serrana)','',1,0),(18,'Pizza Marguerita','',3,0);
/*!40000 ALTER TABLE `tbEstoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbFormaPagamento`
--

DROP TABLE IF EXISTS `tbFormaPagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbFormaPagamento` (
  `idFormaPgto` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idFormaPgto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbFormaPagamento`
--

LOCK TABLES `tbFormaPagamento` WRITE;
/*!40000 ALTER TABLE `tbFormaPagamento` DISABLE KEYS */;
INSERT INTO `tbFormaPagamento` VALUES (1,'PIX','A vista'),(2,'Debito',''),(3,'Crédito','Parcela Max. 3x'),(4,'Dinheiro',''),(5,'Vale-refeição',''),(6,'Vale-alimentação','');
/*!40000 ALTER TABLE `tbFormaPagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPedido`
--

DROP TABLE IF EXISTS `tbPedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbPedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `idFormaPgto` int NOT NULL,
  `idUsuario` int NOT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idFormaPgto` (`idFormaPgto`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `tbPedido_ibfk_1` FOREIGN KEY (`idFormaPgto`) REFERENCES `tbFormaPagamento` (`idFormaPgto`),
  CONSTRAINT `tbPedido_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `tbUsuario` (`idUsuario`),
  CONSTRAINT `tbPedido_ibfk_3` FOREIGN KEY (`idCliente`) REFERENCES `tbCadastroCliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPedido`
--

LOCK TABLES `tbPedido` WRITE;
/*!40000 ALTER TABLE `tbPedido` DISABLE KEYS */;
INSERT INTO `tbPedido` VALUES (1,6,1,5,58.00,''),(2,1,2,5,54.00,'Sem Manjericão');
/*!40000 ALTER TABLE `tbPedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbPizzaCardapio`
--

DROP TABLE IF EXISTS `tbPizzaCardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbPizzaCardapio` (
  `idPizza` int NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) DEFAULT NULL,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idPizza`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbPizzaCardapio`
--

LOCK TABLES `tbPizzaCardapio` WRITE;
/*!40000 ALTER TABLE `tbPizzaCardapio` DISABLE KEYS */;
INSERT INTO `tbPizzaCardapio` VALUES (1,49.00,'MUSSARELA'),(2,54.00,'MARGUERITA'),(3,50.00,'ATUM'),(4,59.00,'BACON'),(5,58.00,'CAIPIRA (SERRANA)');
/*!40000 ALTER TABLE `tbPizzaCardapio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbReceita`
--

DROP TABLE IF EXISTS `tbReceita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbReceita` (
  `idReceita` int NOT NULL AUTO_INCREMENT,
  `idPizza` int NOT NULL,
  `idEstoque` int NOT NULL,
  `quantidade` double DEFAULT NULL,
  PRIMARY KEY (`idReceita`),
  KEY `idPizza` (`idPizza`),
  KEY `idEstoque` (`idEstoque`),
  CONSTRAINT `tbReceita_ibfk_1` FOREIGN KEY (`idPizza`) REFERENCES `tbPizzaCardapio` (`idPizza`),
  CONSTRAINT `tbReceita_ibfk_2` FOREIGN KEY (`idEstoque`) REFERENCES `tbEstoque` (`idEstoque`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbReceita`
--

LOCK TABLES `tbReceita` WRITE;
/*!40000 ALTER TABLE `tbReceita` DISABLE KEYS */;
INSERT INTO `tbReceita` VALUES (1,3,8,1),(2,3,15,250),(3,3,10,200),(4,3,13,200),(5,3,14,100),(6,4,8,1),(7,4,15,250),(8,4,11,200),(9,4,12,3),(10,4,4,250),(11,5,8,1),(12,5,15,250),(13,5,1,200),(14,5,3,150),(15,5,2,100),(16,1,8,1),(17,1,15,250),(18,1,4,250),(19,1,10,100),(20,1,9,100),(21,2,8,1),(22,2,15,250),(23,2,4,200),(24,2,5,100),(25,2,6,30),(26,2,7,10);
/*!40000 ALTER TABLE `tbReceita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbUsuario`
--

DROP TABLE IF EXISTS `tbUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbUsuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuarioLogin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cargo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `CPF` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco1` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco2` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CEP` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbUsuario`
--

LOCK TABLES `tbUsuario` WRITE;
/*!40000 ALTER TABLE `tbUsuario` DISABLE KEYS */;
INSERT INTO `tbUsuario` VALUES (1,'Admin','admin','admin','Administrador',1,'123.456.789-00','Rua Principal, 123','Bairro do Centro','12345-678','(12) 3456-7890','admin@email.com'),(2,'Joana Silva','joana.silva','joana123','Atendente',1,'987.654.321-00','Rua dos Atendentes, 456','Bairro do Atendimento','98765-432','(98) 7654-3210','joana@email.com'),(3,'Paulo Oliveira','paulo.oliveira','paulo123','Chef de Cozinha',1,'456.789.123-00','Rua dos Chefs, 789','Bairro da Cozinha','45678-912','(45) 6789-1234','paulo@email.com'),(4,'Mariana Souza','mariana.souza','mariana123','Gerente',1,'321.654.987-00','Rua das Entregas, 789','Bairro da Entrega','32165-498','(32) 1654-9876','mariana@email.com'),(5,'Lucas Almeida','lucas.almeida','lucas123','Atendente',1,'654.321.987-00','Rua dos Atendentes, 654','Bairro do Atendimento','65432-198','(65) 4321-9876','lucas@email.com');
/*!40000 ALTER TABLE `tbUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbVenda`
--

DROP TABLE IF EXISTS `tbVenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbVenda` (
  `idVenda` int NOT NULL AUTO_INCREMENT,
  `idPedido` int NOT NULL,
  `idEstoque` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idVenda`),
  KEY `idEstoque` (`idEstoque`),
  KEY `idPedido` (`idPedido`),
  CONSTRAINT `tbVenda_ibfk_1` FOREIGN KEY (`idEstoque`) REFERENCES `tbEstoque` (`idEstoque`),
  CONSTRAINT `tbVenda_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `tbPedido` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbVenda`
--

LOCK TABLES `tbVenda` WRITE;
/*!40000 ALTER TABLE `tbVenda` DISABLE KEYS */;
INSERT INTO `tbVenda` VALUES (1,1,16,1,49.00),(2,1,16,1,49.00),(3,2,18,1,54.00);
/*!40000 ALTER TABLE `tbVenda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-20  0:50:28
