DROP DATABASE gbd;
CREATE DATABASE gbd;

USE gbd;

-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: VendaLoja
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `idCliente` int(10) NOT NULL AUTO_INCREMENT,
  `rg` int(10) NOT NULL,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (110,22763931,'Jorge'),(130,30078900,'Edmar'),(157,30046500,'Paulo'),(180,30225900,'Lívio'),(200,30077500,'Beth'),(222,30126830,'Lúcia'),(234,30225900,'José'),(260,25679300,'Susana'),(290,30077500,'Renato'),(390,30046500,'Sebastião'),(410,25679300,'Rodolfo'),(720,24358310,'Ana'),(830,30079300,'Maurício'),(870,22763931,'Flávio');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemVenda`
--

DROP TABLE IF EXISTS `itemVenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemVenda` (
  `codvenda` int(10) unsigned NOT NULL ,
  `codProduto` int(10) unsigned NOT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codvenda`,`codProduto`),
  KEY `codProduto` (`codProduto`),
  CONSTRAINT `itemVenda_ibfk_1` FOREIGN KEY (`codvenda`) REFERENCES `venda` (`codvenda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `itemVenda_ibfk_2` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemVenda`
--

LOCK TABLES `itemVenda` WRITE;
/*!40000 ALTER TABLE `itemVenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemVenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `codProduto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (13,'Ouro',150),(22,'Linho',500),(25,'Queijo',200),(30,'Açúcar',2000),(31,'Chocolate',500),(45,'Madeira',2300),(53,'Linha',1500),(77,'Papel',10000),(78,'Vinho',400),(87,'Cano',3200);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `codvenda` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idCliente` int(10) NOT NULL,
  `dataVenda` date NOT NULL,
  PRIMARY KEY (`codvenda`),
  KEY `fk_venda_Cliente1_idx` (`idCliente`),
  CONSTRAINT `fk_venda_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-28 11:37:35


-- Cliente
-- procedure: INSERT 

DROP PROCEDURE IF EXISTS inserir_cliente;

DELIMITER $$
CREATE PROCEDURE inserir_cliente(IN rg INT(10), IN nome VARCHAR(60))
BEGIN
	IF(rg != "")AND(nome != "")THEN
		INSERT INTO cliente(rg, nome) VALUES(rg, nome);
	ELSE 
		SELECT "Você deve inserir um valor!" AS msg;
	END IF;
END $$
DELIMITER ;

--procedure: SELECT
DROP PROCEDURE IF EXISTS select_cliente;

DELIMITER $$
CREATE PROCEDURE select_cliente()
BEGIN
	SELECT * FROM cliente;
END $$
DELIMITER ;

-- procedure: DELETAR 

DROP PROCEDURE IF EXISTS deletar_cliente;

DELIMITER $$
CREATE PROCEDURE deletar_cliente(IN id INT(10))
BEGIN
	DELETE FROM cliente WHERE idCliente = id;
END $$
DELIMITER ;

-- procedure: POR ID
DROP PROCEDURE IF EXISTS pegar_por_id_os_clientes;
DELIMITER $$
CREATE PROCEDURE pegar_por_id_os_clientes(IN id INT(10))
BEGIN
	SELECT * FROM cliente WHERE idCliente=id;
END $$
DELIMITER ;

-- procedure: UPDATE

DROP PROCEDURE IF EXISTS editar_cliente;

DELIMITER $$
CREATE PROCEDURE editar_cliente(IN id INT(10), rg INT(10), nome VARCHAR(60))
BEGIN
	UPDATE cliente SET rg=rg, nome=nome WHERE idCliente=id;
END $$
DELIMITER ;



-- Venda
-- procedure: INSERT 

DROP PROCEDURE IF EXISTS inserir_venda;

DELIMITER $$
CREATE PROCEDURE inserir_venda(IN idCliente int(10), IN datavenda date)
BEGIN
	IF(idCliente != 0)AND( datavenda != "")THEN
		INSERT INTO venda(idCliente, datavenda) VALUES(idCliente, datavenda);
	ELSE 
		SELECT "Você deve inserir um valor!" AS msg;
	END IF;
END $$
DELIMITER ;

--procedure: SELECT
DROP PROCEDURE IF EXISTS select_vendas;

DELIMITER $$
CREATE PROCEDURE select_vendas()
BEGIN
	SELECT * FROM venda;
END $$
DELIMITER ;

-- procedure: DELETAR 

DROP PROCEDURE IF EXISTS deletar_venda;

DELIMITER $$
CREATE PROCEDURE deletar_venda(IN id INT(10))
BEGIN
	DELETE FROM venda WHERE id=codvenda;
END $$
DELIMITER ;

-- procedure: POR ID
DROP PROCEDURE IF EXISTS pegar_por_id_as_vendas;
DELIMITER $$
CREATE PROCEDURE pegar_por_id_as_vendas(IN id INT(10))
BEGIN
	SELECT * FROM venda WHERE id=codvenda;
END $$
DELIMITER ;

-- procedure: UPDATE

DROP PROCEDURE IF EXISTS editar_venda;

DELIMITER $$
CREATE PROCEDURE editar_venda(IN codvenda int(10), IN datavenda date, IN cod int(10))
BEGIN
	UPDATE cliente SET datavenda=datavenda WHERE codvenda=id and codCliente=cod;
END $$
DELIMITER ;


