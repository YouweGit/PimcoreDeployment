-- MySQL dump 10.13  Distrib 5.6.26, for osx10.8 (x86_64)
--
-- Host: localhost    Database: pimcore_migdev
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Current Database: `pimcore_migdev`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pimcore_migdev` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pimcore_migdev`;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `filename` varchar(255) DEFAULT '',
  `path` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `mimetype` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `customSettings` text,
  `hasMetaData` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`filename`),
  KEY `parentId` (`parentId`),
  KEY `filename` (`filename`),
  KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,0,'folder','','/',NULL,1441893344,1441893344,1,1,NULL,0);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_metadata`
--

DROP TABLE IF EXISTS `assets_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_metadata` (
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `type` enum('input','textarea','asset','document','object','date','select','checkbox') DEFAULT NULL,
  `data` text,
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_metadata`
--

LOCK TABLES `assets_metadata` WRITE;
/*!40000 ALTER TABLE `assets_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_metadata_predefined`
--

DROP TABLE IF EXISTS `assets_metadata_predefined`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_metadata_predefined` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `language` varchar(255) DEFAULT NULL,
  `type` enum('input','textarea','asset','document','object','date','select','checkbox') DEFAULT NULL,
  `data` text,
  `targetSubtype` enum('image','text','audio','video','document','archive','unknown') DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  `config` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `id` (`id`),
  KEY `type` (`type`),
  KEY `language` (`language`),
  KEY `targetSubtype` (`targetSubtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_metadata_predefined`
--

LOCK TABLES `assets_metadata_predefined` WRITE;
/*!40000 ALTER TABLE `assets_metadata_predefined` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_metadata_predefined` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `id` varchar(165) NOT NULL DEFAULT '',
  `data` longtext,
  `mtime` bigint(20) DEFAULT NULL,
  `expire` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('pimcore_asset_1','O:26:\"Pimcore\\Model\\Asset\\Folder\":17:{s:4:\"type\";s:6:\"folder\";s:2:\"id\";i:1;s:8:\"parentId\";i:0;s:8:\"filename\";s:0:\"\";s:4:\"path\";s:1:\"/\";s:8:\"mimetype\";N;s:12:\"creationDate\";i:1441893344;s:16:\"modificationDate\";i:1441893344;s:9:\"userOwner\";s:1:\"1\";s:16:\"userModification\";s:1:\"1\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:0:{}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1441893351,1444312551),('pimcore_document_1','O:27:\"Pimcore\\Model\\Document\\Page\":27:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:8:\"metaData\";N;s:4:\"type\";s:4:\"page\";s:9:\"prettyUrl\";N;s:3:\"css\";N;s:8:\"personas\";s:0:\"\";s:6:\"module\";N;s:10:\"controller\";s:0:\"\";s:6:\"action\";s:0:\"\";s:8:\"template\";s:0:\"\";s:8:\"elements\";a:0:{}s:23:\"contentMasterDocumentId\";N;s:2:\"id\";i:1;s:8:\"parentId\";i:0;s:3:\"key\";s:0:\"\";s:4:\"path\";s:1:\"/\";s:5:\"index\";i:999999;s:9:\"published\";b:1;s:12:\"creationDate\";i:1441893344;s:16:\"modificationDate\";i:1441893344;s:9:\"userOwner\";i:1;s:16:\"userModification\";i:1;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1441893351,1444312551),('pimcore_object_1','O:27:\"Pimcore\\Model\\Object\\Folder\":14:{s:6:\"o_type\";s:6:\"folder\";s:4:\"o_id\";i:1;s:10:\"o_parentId\";i:0;s:5:\"o_key\";s:0:\"\";s:6:\"o_path\";s:1:\"/\";s:7:\"o_index\";i:999999;s:14:\"o_creationDate\";i:1441893344;s:18:\"o_modificationDate\";i:1441893344;s:11:\"o_userOwner\";i:1;s:18:\"o_userModification\";i:1;s:10:\"o_siblings\";N;s:13:\"o_hasSiblings\";N;s:8:\"o_locked\";N;s:19:\"o_elementAdminStyle\";O:32:\"Pimcore\\Model\\Element\\AdminStyle\":3:{s:18:\"\0*\0elementCssClass\";N;s:14:\"\0*\0elementIcon\";N;s:19:\"\0*\0elementIconClass\";s:19:\"pimcore_icon_folder\";}}',1441893351,1444312551),('Zend_LocaleC_en_language_aa','s:11:\"s:4:\"Afar\";\";',1441893345,1444312545),('Zend_LocaleC_en_language_aa_DJ','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_aa_ER','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_aa_ET','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_af','s:16:\"s:9:\"Afrikaans\";\";',1441893345,1444312545),('Zend_LocaleC_en_language_af_NA','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_af_ZA','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_agq','s:12:\"s:5:\"Aghem\";\";',1441893345,1444312545),('Zend_LocaleC_en_language_agq_CM','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ak','s:11:\"s:4:\"Akan\";\";',1441893345,1444312545),('Zend_LocaleC_en_language_ak_GH','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_am','s:14:\"s:7:\"Amharic\";\";',1441893345,1444312545),('Zend_LocaleC_en_language_am_ET','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar','s:13:\"s:6:\"Arabic\";\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_001','s:30:\"s:22:\"Modern Standard Arabic\";\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_AE','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_BH','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_DJ','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_DZ','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_EG','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_EH','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_ER','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_IL','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_IQ','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_JO','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_KM','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_KW','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_LB','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_LY','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_MA','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_MR','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_OM','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_PS','s:4:\"b:0;\";',1441893345,1444312545),('Zend_LocaleC_en_language_ar_QA','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ar_SA','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ar_SD','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ar_SO','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ar_SS','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ar_SY','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ar_TD','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ar_TN','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ar_YE','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_as','s:15:\"s:8:\"Assamese\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_asa','s:10:\"s:3:\"Asu\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_asa_TZ','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ast','s:15:\"s:8:\"Asturian\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_ast_ES','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_as_IN','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_az','s:19:\"s:11:\"Azerbaijani\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_az_AZ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_az_Cyrl','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_az_Cyrl_AZ','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_az_Latn','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_az_Latn_AZ','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bas','s:12:\"s:5:\"Basaa\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_bas_CM','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_be','s:18:\"s:10:\"Belarusian\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_bem','s:12:\"s:5:\"Bemba\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_bem_ZM','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bez','s:11:\"s:4:\"Bena\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_bez_TZ','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_be_BY','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bg','s:16:\"s:9:\"Bulgarian\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_bg_BG','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bm','s:14:\"s:7:\"Bambara\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_bm_ML','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bn','s:14:\"s:7:\"Bengali\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_bn_BD','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bn_IN','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bo','s:14:\"s:7:\"Tibetan\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_bo_CN','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bo_IN','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_br','s:13:\"s:6:\"Breton\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_brx','s:11:\"s:4:\"Bodo\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_brx_IN','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_br_FR','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bs','s:14:\"s:7:\"Bosnian\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_bs_BA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_bs_Cyrl','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bs_Cyrl_BA','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bs_Latn','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_bs_Latn_BA','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_byn','s:11:\"s:4:\"Blin\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_byn_ER','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ca','s:14:\"s:7:\"Catalan\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_ca_AD','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ca_ES','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ca_ES_VALENCIA','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ca_FR','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ca_IT','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_cgg','s:12:\"s:5:\"Chiga\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_cgg_UG','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_chr','s:15:\"s:8:\"Cherokee\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_chr_US','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_cs','s:12:\"s:5:\"Czech\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_cs_CZ','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_cy','s:12:\"s:5:\"Welsh\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_cy_GB','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_da','s:13:\"s:6:\"Danish\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_dav','s:12:\"s:5:\"Taita\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_dav_KE','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_da_DK','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_da_GL','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_de','s:13:\"s:6:\"German\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_de_AT','s:23:\"s:15:\"Austrian German\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_de_BE','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_de_CH','s:25:\"s:17:\"Swiss High German\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_de_DE','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_de_LI','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_de_LU','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_dje','s:12:\"s:5:\"Zarma\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_dje_NE','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_dua','s:12:\"s:5:\"Duala\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_dua_CM','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_dyo','s:18:\"s:10:\"Jola-Fonyi\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_dyo_SN','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_dz','s:15:\"s:8:\"Dzongkha\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_dz_BT','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ebu','s:11:\"s:4:\"Embu\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_ebu_KE','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ee','s:10:\"s:3:\"Ewe\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_ee_GH','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_ee_TG','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_el','s:12:\"s:5:\"Greek\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_el_CY','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_el_GR','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en','s:14:\"s:7:\"English\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_001','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_150','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_AG','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_AI','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_AS','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_AU','s:26:\"s:18:\"Australian English\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_BB','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_BE','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_BM','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_BS','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_BW','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_BZ','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_CA','s:24:\"s:16:\"Canadian English\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_CC','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_CK','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_CM','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_CX','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_DG','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_DM','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_Dsrt','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_Dsrt_US','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_ER','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_FJ','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_FK','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_FM','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_GB','s:23:\"s:15:\"British English\";\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_GD','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_GG','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_GH','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_GI','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_GM','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_GU','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_language_en_GY','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_HK','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_IE','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_IM','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_IN','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_IO','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_JE','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_JM','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_KE','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_KI','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_KN','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_KY','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_LC','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_LR','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_LS','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_MG','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_MH','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_MO','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_MP','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_MS','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_MT','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_MU','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_MW','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_NA','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_NF','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_NG','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_NR','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_NU','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_NZ','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_PG','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_PH','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_PK','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_PN','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_PR','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_PW','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_RW','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_SB','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_SC','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_SD','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_SG','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_SH','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_SL','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_SS','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_SX','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_SZ','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_TC','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_TK','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_TO','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_TT','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_TV','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_TZ','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_UG','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_UM','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_US','s:24:\"s:16:\"American English\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_US_POSIX','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_VC','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_VG','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_VI','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_VU','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_WS','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_ZA','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_ZM','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_en_ZW','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_eo','s:16:\"s:9:\"Esperanto\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_eo_001','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es','s:14:\"s:7:\"Spanish\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_419','s:30:\"s:22:\"Latin American Spanish\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_AR','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_BO','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_CL','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_CO','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_CR','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_CU','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_DO','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_EA','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_EC','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_ES','s:24:\"s:16:\"European Spanish\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_GQ','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_GT','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_HN','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_IC','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_MX','s:23:\"s:15:\"Mexican Spanish\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_NI','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_PA','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_PE','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_PH','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_PR','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_PY','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_SV','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_US','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_UY','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_es_VE','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_et','s:15:\"s:8:\"Estonian\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_et_EE','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_eu','s:13:\"s:6:\"Basque\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_eu_ES','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_ewo','s:13:\"s:6:\"Ewondo\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_ewo_CM','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_fa','s:14:\"s:7:\"Persian\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_fa_AF','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_fa_IR','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_ff','s:12:\"s:5:\"Fulah\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_ff_CM','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_ff_GN','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_ff_MR','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_ff_SN','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_fi','s:14:\"s:7:\"Finnish\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_fil','s:15:\"s:8:\"Filipino\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_fil_PH','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fi_FI','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_fo','s:14:\"s:7:\"Faroese\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_fo_FO','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr','s:13:\"s:6:\"French\";\";',1441893347,1444312547),('Zend_LocaleC_en_language_fr_BE','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_BF','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_BI','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_BJ','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_BL','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_CA','s:23:\"s:15:\"Canadian French\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_CD','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_CF','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_CG','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_CH','s:20:\"s:12:\"Swiss French\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_CI','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_CM','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_DJ','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_DZ','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_FR','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_GA','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_GF','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_GN','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_GP','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_GQ','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_HT','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_KM','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_LU','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_MA','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_MC','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_MF','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_MG','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_ML','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_MQ','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_MR','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_MU','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_NC','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_NE','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_PF','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_PM','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_fr_RE','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_RW','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_SC','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_SN','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_SY','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_TD','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_TG','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_TN','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_VU','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fr_WF','s:4:\"b:0;\";',1441893347,1444312547),('Zend_LocaleC_en_language_fr_YT','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fur','s:15:\"s:8:\"Friulian\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_fur_IT','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_fy','s:23:\"s:15:\"Western Frisian\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_fy_NL','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ga','s:12:\"s:5:\"Irish\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_ga_IE','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_gd','s:23:\"s:15:\"Scottish Gaelic\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_gd_GB','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_gl','s:15:\"s:8:\"Galician\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_gl_ES','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_gsw','s:20:\"s:12:\"Swiss German\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_gsw_CH','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_gsw_LI','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_gu','s:15:\"s:8:\"Gujarati\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_guz','s:12:\"s:5:\"Gusii\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_guz_KE','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_gu_IN','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_gv','s:11:\"s:4:\"Manx\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_gv_IM','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ha','s:12:\"s:5:\"Hausa\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_haw','s:15:\"s:8:\"Hawaiian\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_haw_US','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ha_GH','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ha_Latn','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ha_Latn_GH','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ha_Latn_NE','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ha_Latn_NG','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ha_NE','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ha_NG','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_he','s:13:\"s:6:\"Hebrew\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_he_IL','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_hi','s:12:\"s:5:\"Hindi\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_hi_IN','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_hr','s:15:\"s:8:\"Croatian\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_hr_BA','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_hr_HR','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_hu','s:16:\"s:9:\"Hungarian\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_hu_HU','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_hy','s:15:\"s:8:\"Armenian\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_hy_AM','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ia','s:19:\"s:11:\"Interlingua\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_ia_FR','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_id','s:18:\"s:10:\"Indonesian\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_id_ID','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ig','s:11:\"s:4:\"Igbo\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_ig_NG','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ii','s:18:\"s:10:\"Sichuan Yi\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_ii_CN','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_is','s:16:\"s:9:\"Icelandic\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_is_IS','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_it','s:14:\"s:7:\"Italian\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_it_CH','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_it_IT','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_it_SM','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ja','s:15:\"s:8:\"Japanese\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_ja_JP','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_jgo','s:13:\"s:6:\"Ngomba\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_jgo_CM','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_jmc','s:14:\"s:7:\"Machame\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_jmc_TZ','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ka','s:15:\"s:8:\"Georgian\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kab','s:13:\"s:6:\"Kabyle\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kab_DZ','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_kam','s:12:\"s:5:\"Kamba\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kam_KE','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ka_GE','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_kde','s:14:\"s:7:\"Makonde\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kde_TZ','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_kea','s:20:\"s:12:\"Kabuverdianu\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kea_CV','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_khq','s:20:\"s:12:\"Koyra Chiini\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_khq_ML','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ki','s:13:\"s:6:\"Kikuyu\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_ki_KE','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_kk','s:13:\"s:6:\"Kazakh\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kkj','s:11:\"s:4:\"Kako\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kkj_CM','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_kk_Cyrl','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_kk_Cyrl_KZ','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_kk_KZ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_kl','s:19:\"s:11:\"Kalaallisut\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kln','s:15:\"s:8:\"Kalenjin\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kln_KE','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_kl_GL','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_km','s:12:\"s:5:\"Khmer\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_km_KH','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_kn','s:14:\"s:7:\"Kannada\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kn_IN','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ko','s:13:\"s:6:\"Korean\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kok','s:14:\"s:7:\"Konkani\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kok_IN','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ko_KP','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ko_KR','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ks','s:15:\"s:8:\"Kashmiri\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_ksb','s:15:\"s:8:\"Shambala\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_ksb_TZ','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ksf','s:12:\"s:5:\"Bafia\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_ksf_CM','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ksh','s:16:\"s:9:\"Colognian\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_ksh_DE','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ks_Arab','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ks_Arab_IN','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ks_IN','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_kw','s:14:\"s:7:\"Cornish\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_kw_GB','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ky','s:13:\"s:6:\"Kyrgyz\";\";',1441893348,1444312548),('Zend_LocaleC_en_language_ky_Cyrl','s:4:\"b:0;\";',1441893348,1444312548),('Zend_LocaleC_en_language_ky_Cyrl_KG','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_lag','s:12:\"s:5:\"Langi\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_lag_TZ','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_lg','s:12:\"s:5:\"Ganda\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_lg_UG','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_lkt','s:13:\"s:6:\"Lakota\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_lkt_US','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ln','s:14:\"s:7:\"Lingala\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_ln_AO','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ln_CD','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ln_CF','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ln_CG','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_lo','s:10:\"s:3:\"Lao\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_lo_LA','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_lt','s:18:\"s:10:\"Lithuanian\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_lt_LT','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_lu','s:20:\"s:12:\"Luba-Katanga\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_luo','s:10:\"s:3:\"Luo\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_luo_KE','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_luy','s:12:\"s:5:\"Luyia\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_luy_KE','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_lu_CD','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_lv','s:14:\"s:7:\"Latvian\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_lv_LV','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mas','s:12:\"s:5:\"Masai\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_mas_KE','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mas_TZ','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mer','s:11:\"s:4:\"Meru\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_mer_KE','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mfe','s:15:\"s:8:\"Morisyen\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_mfe_MU','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mg','s:15:\"s:8:\"Malagasy\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_mgh','s:22:\"s:14:\"Makhuwa-Meetto\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_mgh_MZ','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mgo','s:12:\"s:5:\"Meta\'\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_mgo_CM','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mg_MG','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mk','s:18:\"s:10:\"Macedonian\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_mk_MK','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ml','s:16:\"s:9:\"Malayalam\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_ml_IN','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mn','s:16:\"s:9:\"Mongolian\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_mn_Cyrl','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mn_Cyrl_MN','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mn_MN','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_mr','s:14:\"s:7:\"Marathi\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_mr_IN','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ms','s:12:\"s:5:\"Malay\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_ms_BN','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ms_Latn','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ms_Latn_BN','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ms_Latn_MY','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ms_Latn_SG','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ms_MY','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ms_SG','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_mt','s:14:\"s:7:\"Maltese\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_mt_MT','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_mua','s:14:\"s:7:\"Mundang\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_mua_CM','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_my','s:14:\"s:7:\"Burmese\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_my_MM','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_naq','s:11:\"s:4:\"Nama\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_naq_NA','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nb','s:25:\"s:17:\"Norwegian Bokmål\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_nb_NO','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nb_SJ','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nd','s:21:\"s:13:\"North Ndebele\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_nd_ZW','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ne','s:13:\"s:6:\"Nepali\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_ne_IN','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ne_NP','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nl','s:12:\"s:5:\"Dutch\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_nl_AW','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nl_BE','s:14:\"s:7:\"Flemish\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_nl_BQ','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nl_CW','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nl_NL','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nl_SR','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nl_SX','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nmg','s:13:\"s:6:\"Kwasio\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_nmg_CM','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nn','s:25:\"s:17:\"Norwegian Nynorsk\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_nnh','s:16:\"s:9:\"Ngiemboon\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_nnh_CM','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nn_NO','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nr','s:21:\"s:13:\"South Ndebele\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_nr_ZA','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nso','s:22:\"s:14:\"Northern Sotho\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_nso_ZA','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nus','s:11:\"s:4:\"Nuer\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_nus_SD','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_nyn','s:15:\"s:8:\"Nyankole\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_nyn_UG','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_om','s:12:\"s:5:\"Oromo\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_om_ET','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_om_KE','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_or','s:12:\"s:5:\"Oriya\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_ordinals','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_or_IN','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_os','s:14:\"s:7:\"Ossetic\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_os_GE','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_os_RU','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pa','s:14:\"s:7:\"Punjabi\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_pa_Arab','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pa_Arab_PK','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pa_Guru','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pa_Guru_IN','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pa_IN','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_pa_PK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_pl','s:13:\"s:6:\"Polish\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_plurals','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pl_PL','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ps','s:13:\"s:6:\"Pashto\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_ps_AF','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pt','s:18:\"s:10:\"Portuguese\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_pt_AO','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pt_BR','s:28:\"s:20:\"Brazilian Portuguese\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_pt_CV','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pt_GW','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pt_MO','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pt_MZ','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pt_PT','s:27:\"s:19:\"European Portuguese\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_pt_ST','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_pt_TL','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_rm','s:14:\"s:7:\"Romansh\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_rm_CH','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_rn','s:12:\"s:5:\"Rundi\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_rn_BI','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ro','s:15:\"s:8:\"Romanian\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_rof','s:12:\"s:5:\"Rombo\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_rof_TZ','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_root','s:11:\"s:4:\"Root\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_ro_MD','s:16:\"s:9:\"Moldavian\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_ro_RO','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ru','s:14:\"s:7:\"Russian\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_ru_BY','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ru_KG','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ru_KZ','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ru_MD','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ru_RU','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ru_UA','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_rw','s:19:\"s:11:\"Kinyarwanda\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_rwk','s:10:\"s:3:\"Rwa\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_rwk_TZ','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_rw_RW','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_sah','s:12:\"s:5:\"Sakha\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_sah_RU','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_saq','s:14:\"s:7:\"Samburu\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_saq_KE','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_sbp','s:12:\"s:5:\"Sangu\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_sbp_TZ','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_se','s:21:\"s:13:\"Northern Sami\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_seh','s:11:\"s:4:\"Sena\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_seh_MZ','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_ses','s:23:\"s:15:\"Koyraboro Senni\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_ses_ML','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_se_FI','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_se_NO','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_sg','s:12:\"s:5:\"Sango\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_sg_CF','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_shi','s:16:\"s:9:\"Tachelhit\";\";',1441893349,1444312549),('Zend_LocaleC_en_language_shi_Latn','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_shi_Latn_MA','s:4:\"b:0;\";',1441893349,1444312549),('Zend_LocaleC_en_language_shi_MA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_shi_Tfng','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_shi_Tfng_MA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_si','s:14:\"s:7:\"Sinhala\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_si_LK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sk','s:13:\"s:6:\"Slovak\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_sk_SK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sl','s:16:\"s:9:\"Slovenian\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_sl_SI','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sn','s:12:\"s:5:\"Shona\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_sn_ZW','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_so','s:13:\"s:6:\"Somali\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_so_DJ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_so_ET','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_so_KE','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_so_SO','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sq','s:15:\"s:8:\"Albanian\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_sq_AL','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sq_MK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sq_XK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr','s:14:\"s:7:\"Serbian\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_BA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_Cyrl','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_Cyrl_BA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_Cyrl_ME','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_Cyrl_RS','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_Cyrl_XK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_Latn','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_Latn_BA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_Latn_ME','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_Latn_RS','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_Latn_XK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_ME','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_RS','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sr_XK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ss','s:12:\"s:5:\"Swati\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_ssy','s:11:\"s:4:\"Saho\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_ssy_ER','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ss_SZ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ss_ZA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_st','s:22:\"s:14:\"Southern Sotho\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_st_LS','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_st_ZA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sv','s:14:\"s:7:\"Swedish\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_sv_AX','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sv_FI','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sv_SE','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sw','s:14:\"s:7:\"Swahili\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_swc','s:21:\"s:13:\"Congo Swahili\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_swc_CD','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sw_KE','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sw_TZ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_sw_UG','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ta','s:12:\"s:5:\"Tamil\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_ta_IN','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ta_LK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ta_MY','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ta_SG','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_te','s:13:\"s:6:\"Telugu\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_teo','s:11:\"s:4:\"Teso\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_teo_KE','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_teo_UG','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_te_IN','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_tg','s:12:\"s:5:\"Tajik\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_tg_Cyrl','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_tg_Cyrl_TJ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_tg_TJ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_th','s:11:\"s:4:\"Thai\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_th_TH','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ti','s:15:\"s:8:\"Tigrinya\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_tig','s:12:\"s:5:\"Tigre\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_tig_ER','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ti_ER','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ti_ET','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_tn','s:13:\"s:6:\"Tswana\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_tn_BW','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_tn_ZA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_to','s:13:\"s:6:\"Tongan\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_to_TO','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_tr','s:14:\"s:7:\"Turkish\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_tr_CY','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_tr_TR','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ts','s:13:\"s:6:\"Tsonga\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_ts_ZA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_twq','s:14:\"s:7:\"Tasawaq\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_twq_NE','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_tzm','s:31:\"s:23:\"Central Atlas Tamazight\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_tzm_Latn','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_tzm_Latn_MA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_tzm_MA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ug','s:13:\"s:6:\"Uyghur\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_ug_Arab','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ug_Arab_CN','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_uk','s:16:\"s:9:\"Ukrainian\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_uk_UA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ur','s:11:\"s:4:\"Urdu\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_ur_IN','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ur_PK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_uz','s:12:\"s:5:\"Uzbek\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_uz_AF','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_uz_Arab','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_uz_Arab_AF','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_uz_Cyrl','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_uz_Cyrl_UZ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_uz_Latn','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_uz_Latn_UZ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_uz_UZ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_vai','s:10:\"s:3:\"Vai\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_vai_Latn','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_vai_Latn_LR','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_vai_LR','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_vai_Vaii','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_vai_Vaii_LR','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_ve','s:12:\"s:5:\"Venda\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_ve_ZA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_vi','s:18:\"s:10:\"Vietnamese\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_vi_VN','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_vo','s:15:\"s:8:\"Volapük\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_vo_001','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_vun','s:12:\"s:5:\"Vunjo\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_vun_TZ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_wae','s:13:\"s:6:\"Walser\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_wae_CH','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_wal','s:15:\"s:8:\"Wolaytta\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_wal_ET','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_xh','s:12:\"s:5:\"Xhosa\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_xh_ZA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_xog','s:11:\"s:4:\"Soga\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_xog_UG','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_yav','s:14:\"s:7:\"Yangben\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_yav_CM','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_yo','s:13:\"s:6:\"Yoruba\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_yo_BJ','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_yo_NG','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_zgh','s:35:\"s:27:\"Standard Moroccan Tamazight\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_zgh_MA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_zh','s:14:\"s:7:\"Chinese\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_zh_CN','s:4:\"b:0;\";',1441893351,1444312551),('Zend_LocaleC_en_language_zh_Hans','s:26:\"s:18:\"Simplified Chinese\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_zh_Hans_CN','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_zh_Hans_HK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_zh_Hans_MO','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_zh_Hans_SG','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_zh_Hant','s:27:\"s:19:\"Traditional Chinese\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_zh_Hant_HK','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_zh_Hant_MO','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_zh_Hant_TW','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_language_zh_HK','s:4:\"b:0;\";',1441893351,1444312551),('Zend_LocaleC_en_language_zh_MO','s:4:\"b:0;\";',1441893351,1444312551),('Zend_LocaleC_en_language_zh_SG','s:4:\"b:0;\";',1441893351,1444312551),('Zend_LocaleC_en_language_zh_TW','s:4:\"b:0;\";',1441893351,1444312551),('Zend_LocaleC_en_language_zu','s:11:\"s:4:\"Zulu\";\";',1441893350,1444312550),('Zend_LocaleC_en_language_zu_ZA','s:4:\"b:0;\";',1441893350,1444312550),('Zend_LocaleC_en_territory_','s:4:\"b:0;\";',1441893346,1444312546),('Zend_LocaleC_en_territory_001','s:12:\"s:5:\"World\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_150','s:13:\"s:6:\"Europe\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_AD','s:14:\"s:7:\"Andorra\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_AE','s:28:\"s:20:\"United Arab Emirates\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_AF','s:19:\"s:11:\"Afghanistan\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_AG','s:27:\"s:19:\"Antigua and Barbuda\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_AI','s:15:\"s:8:\"Anguilla\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_AL','s:14:\"s:7:\"Albania\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_AM','s:14:\"s:7:\"Armenia\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_AO','s:13:\"s:6:\"Angola\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_AR','s:16:\"s:9:\"Argentina\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_AS','s:22:\"s:14:\"American Samoa\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_AW','s:12:\"s:5:\"Aruba\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_AX','s:22:\"s:14:\"Åland Islands\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_AZ','s:18:\"s:10:\"Azerbaijan\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_BA','s:30:\"s:22:\"Bosnia and Herzegovina\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_BB','s:15:\"s:8:\"Barbados\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_BD','s:18:\"s:10:\"Bangladesh\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_BE','s:14:\"s:7:\"Belgium\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_BF','s:20:\"s:12:\"Burkina Faso\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_BG','s:15:\"s:8:\"Bulgaria\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_BH','s:14:\"s:7:\"Bahrain\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_BI','s:14:\"s:7:\"Burundi\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_BJ','s:12:\"s:5:\"Benin\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_BL','s:25:\"s:17:\"Saint Barthélemy\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_BM','s:14:\"s:7:\"Bermuda\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_BN','s:13:\"s:6:\"Brunei\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_BO','s:14:\"s:7:\"Bolivia\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_BQ','s:29:\"s:21:\"Caribbean Netherlands\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_BS','s:14:\"s:7:\"Bahamas\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_BT','s:13:\"s:6:\"Bhutan\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_BW','s:15:\"s:8:\"Botswana\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_BY','s:14:\"s:7:\"Belarus\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_BZ','s:13:\"s:6:\"Belize\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_CC','s:31:\"s:23:\"Cocos (Keeling) Islands\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_CD','s:24:\"s:16:\"Congo - Kinshasa\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_CF','s:32:\"s:24:\"Central African Republic\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_CG','s:27:\"s:19:\"Congo - Brazzaville\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_CH','s:19:\"s:11:\"Switzerland\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_CI','s:24:\"s:16:\"Côte d’Ivoire\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_CK','s:20:\"s:12:\"Cook Islands\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_CL','s:12:\"s:5:\"Chile\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_CM','s:15:\"s:8:\"Cameroon\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_CN','s:12:\"s:5:\"China\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_CO','s:15:\"s:8:\"Colombia\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_CR','s:18:\"s:10:\"Costa Rica\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_CU','s:11:\"s:4:\"Cuba\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_CV','s:18:\"s:10:\"Cape Verde\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_CW','s:15:\"s:8:\"Curaçao\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_CX','s:24:\"s:16:\"Christmas Island\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_CY','s:13:\"s:6:\"Cyprus\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_CZ','s:22:\"s:14:\"Czech Republic\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_DE','s:14:\"s:7:\"Germany\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_DG','s:20:\"s:12:\"Diego Garcia\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_DJ','s:15:\"s:8:\"Djibouti\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_DK','s:14:\"s:7:\"Denmark\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_DM','s:15:\"s:8:\"Dominica\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_DO','s:26:\"s:18:\"Dominican Republic\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_DZ','s:14:\"s:7:\"Algeria\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_EA','s:25:\"s:17:\"Ceuta and Melilla\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_EC','s:14:\"s:7:\"Ecuador\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_EE','s:14:\"s:7:\"Estonia\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_EG','s:12:\"s:5:\"Egypt\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_EH','s:22:\"s:14:\"Western Sahara\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_ER','s:14:\"s:7:\"Eritrea\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_ES','s:12:\"s:5:\"Spain\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_ET','s:15:\"s:8:\"Ethiopia\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_FI','s:14:\"s:7:\"Finland\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_FJ','s:11:\"s:4:\"Fiji\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_FK','s:24:\"s:16:\"Falkland Islands\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_FM','s:18:\"s:10:\"Micronesia\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_FO','s:21:\"s:13:\"Faroe Islands\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_FR','s:13:\"s:6:\"France\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_GA','s:12:\"s:5:\"Gabon\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_GB','s:22:\"s:14:\"United Kingdom\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_GD','s:14:\"s:7:\"Grenada\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_GE','s:14:\"s:7:\"Georgia\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_GF','s:21:\"s:13:\"French Guiana\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_GG','s:15:\"s:8:\"Guernsey\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_GH','s:12:\"s:5:\"Ghana\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_GI','s:16:\"s:9:\"Gibraltar\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_GL','s:16:\"s:9:\"Greenland\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_GM','s:13:\"s:6:\"Gambia\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_GN','s:13:\"s:6:\"Guinea\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_GP','s:18:\"s:10:\"Guadeloupe\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_GQ','s:25:\"s:17:\"Equatorial Guinea\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_GR','s:13:\"s:6:\"Greece\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_GT','s:16:\"s:9:\"Guatemala\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_GU','s:11:\"s:4:\"Guam\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_GW','s:21:\"s:13:\"Guinea-Bissau\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_GY','s:13:\"s:6:\"Guyana\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_HK','s:27:\"s:19:\"Hong Kong SAR China\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_HN','s:15:\"s:8:\"Honduras\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_HR','s:14:\"s:7:\"Croatia\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_HT','s:12:\"s:5:\"Haiti\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_HU','s:14:\"s:7:\"Hungary\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_IC','s:22:\"s:14:\"Canary Islands\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_ID','s:16:\"s:9:\"Indonesia\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_IE','s:14:\"s:7:\"Ireland\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_IL','s:13:\"s:6:\"Israel\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_IM','s:19:\"s:11:\"Isle of Man\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_IN','s:12:\"s:5:\"India\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_IO','s:38:\"s:30:\"British Indian Ocean Territory\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_IQ','s:11:\"s:4:\"Iraq\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_IR','s:11:\"s:4:\"Iran\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_IS','s:14:\"s:7:\"Iceland\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_IT','s:12:\"s:5:\"Italy\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_JE','s:13:\"s:6:\"Jersey\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_JM','s:14:\"s:7:\"Jamaica\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_JO','s:13:\"s:6:\"Jordan\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_JP','s:12:\"s:5:\"Japan\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_KE','s:12:\"s:5:\"Kenya\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_KG','s:18:\"s:10:\"Kyrgyzstan\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_KH','s:15:\"s:8:\"Cambodia\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_KI','s:15:\"s:8:\"Kiribati\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_KM','s:14:\"s:7:\"Comoros\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_KN','s:29:\"s:21:\"Saint Kitts and Nevis\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_KP','s:19:\"s:11:\"North Korea\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_KR','s:19:\"s:11:\"South Korea\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_KW','s:13:\"s:6:\"Kuwait\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_KY','s:22:\"s:14:\"Cayman Islands\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_KZ','s:18:\"s:10:\"Kazakhstan\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_LA','s:11:\"s:4:\"Laos\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_LB','s:14:\"s:7:\"Lebanon\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_LC','s:19:\"s:11:\"Saint Lucia\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_LI','s:21:\"s:13:\"Liechtenstein\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_LK','s:16:\"s:9:\"Sri Lanka\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_LR','s:14:\"s:7:\"Liberia\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_LS','s:14:\"s:7:\"Lesotho\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_LT','s:16:\"s:9:\"Lithuania\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_LU','s:18:\"s:10:\"Luxembourg\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_LV','s:13:\"s:6:\"Latvia\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_LY','s:12:\"s:5:\"Libya\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_MA','s:14:\"s:7:\"Morocco\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_MC','s:13:\"s:6:\"Monaco\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_MD','s:14:\"s:7:\"Moldova\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_ME','s:18:\"s:10:\"Montenegro\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_MF','s:20:\"s:12:\"Saint Martin\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_MG','s:18:\"s:10:\"Madagascar\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_MH','s:24:\"s:16:\"Marshall Islands\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_MK','s:16:\"s:9:\"Macedonia\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_ML','s:11:\"s:4:\"Mali\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_MM','s:23:\"s:15:\"Myanmar (Burma)\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_MN','s:15:\"s:8:\"Mongolia\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_MO','s:23:\"s:15:\"Macau SAR China\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_MP','s:32:\"s:24:\"Northern Mariana Islands\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_MQ','s:18:\"s:10:\"Martinique\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_MR','s:18:\"s:10:\"Mauritania\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_MS','s:18:\"s:10:\"Montserrat\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_MT','s:12:\"s:5:\"Malta\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_MU','s:16:\"s:9:\"Mauritius\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_MW','s:13:\"s:6:\"Malawi\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_MY','s:15:\"s:8:\"Malaysia\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_MZ','s:18:\"s:10:\"Mozambique\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_NA','s:14:\"s:7:\"Namibia\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_NC','s:21:\"s:13:\"New Caledonia\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_NE','s:12:\"s:5:\"Niger\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_NF','s:22:\"s:14:\"Norfolk Island\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_NG','s:14:\"s:7:\"Nigeria\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_NI','s:16:\"s:9:\"Nicaragua\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_NL','s:19:\"s:11:\"Netherlands\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_NO','s:13:\"s:6:\"Norway\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_NP','s:12:\"s:5:\"Nepal\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_NR','s:12:\"s:5:\"Nauru\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_NU','s:11:\"s:4:\"Niue\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_NZ','s:19:\"s:11:\"New Zealand\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_OM','s:11:\"s:4:\"Oman\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_PA','s:13:\"s:6:\"Panama\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_PE','s:11:\"s:4:\"Peru\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_PF','s:24:\"s:16:\"French Polynesia\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_PG','s:24:\"s:16:\"Papua New Guinea\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_PH','s:19:\"s:11:\"Philippines\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_PK','s:15:\"s:8:\"Pakistan\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_PL','s:13:\"s:6:\"Poland\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_PM','s:33:\"s:25:\"Saint Pierre and Miquelon\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_PN','s:24:\"s:16:\"Pitcairn Islands\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_PR','s:19:\"s:11:\"Puerto Rico\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_PS','s:31:\"s:23:\"Palestinian Territories\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_PW','s:12:\"s:5:\"Palau\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_PY','s:15:\"s:8:\"Paraguay\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_QA','s:12:\"s:5:\"Qatar\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_RE','s:15:\"s:8:\"Réunion\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_RO','s:14:\"s:7:\"Romania\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_RS','s:13:\"s:6:\"Serbia\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_RU','s:13:\"s:6:\"Russia\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_RW','s:13:\"s:6:\"Rwanda\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_SA','s:20:\"s:12:\"Saudi Arabia\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_SB','s:23:\"s:15:\"Solomon Islands\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_SC','s:18:\"s:10:\"Seychelles\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_SD','s:12:\"s:5:\"Sudan\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_SE','s:13:\"s:6:\"Sweden\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_SG','s:16:\"s:9:\"Singapore\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_SH','s:20:\"s:12:\"Saint Helena\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_SI','s:15:\"s:8:\"Slovenia\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_SJ','s:30:\"s:22:\"Svalbard and Jan Mayen\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_SK','s:15:\"s:8:\"Slovakia\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_SL','s:20:\"s:12:\"Sierra Leone\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_SM','s:18:\"s:10:\"San Marino\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_SN','s:14:\"s:7:\"Senegal\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_SO','s:14:\"s:7:\"Somalia\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_SR','s:15:\"s:8:\"Suriname\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_SS','s:19:\"s:11:\"South Sudan\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_ST','s:32:\"s:24:\"São Tomé and Príncipe\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_SV','s:19:\"s:11:\"El Salvador\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_SX','s:20:\"s:12:\"Sint Maarten\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_SY','s:12:\"s:5:\"Syria\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_SZ','s:16:\"s:9:\"Swaziland\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_TC','s:32:\"s:24:\"Turks and Caicos Islands\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_TD','s:11:\"s:4:\"Chad\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_TG','s:11:\"s:4:\"Togo\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_TH','s:15:\"s:8:\"Thailand\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_TJ','s:18:\"s:10:\"Tajikistan\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_TK','s:14:\"s:7:\"Tokelau\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_TL','s:19:\"s:11:\"Timor-Leste\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_TN','s:14:\"s:7:\"Tunisia\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_TO','s:12:\"s:5:\"Tonga\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_TR','s:13:\"s:6:\"Turkey\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_TT','s:27:\"s:19:\"Trinidad and Tobago\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_TV','s:13:\"s:6:\"Tuvalu\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_TW','s:13:\"s:6:\"Taiwan\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_TZ','s:15:\"s:8:\"Tanzania\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_UA','s:14:\"s:7:\"Ukraine\";\";',1441893349,1444312549),('Zend_LocaleC_en_territory_UG','s:13:\"s:6:\"Uganda\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_UM','s:29:\"s:21:\"U.S. Outlying Islands\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_US','s:21:\"s:13:\"United States\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_UY','s:14:\"s:7:\"Uruguay\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_UZ','s:18:\"s:10:\"Uzbekistan\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_VC','s:32:\"s:24:\"St. Vincent & Grenadines\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_VE','s:16:\"s:9:\"Venezuela\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_VG','s:30:\"s:22:\"British Virgin Islands\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_VI','s:27:\"s:19:\"U.S. Virgin Islands\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_VN','s:14:\"s:7:\"Vietnam\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_VU','s:14:\"s:7:\"Vanuatu\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_WF','s:25:\"s:17:\"Wallis and Futuna\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_WS','s:12:\"s:5:\"Samoa\";\";',1441893347,1444312547),('Zend_LocaleC_en_territory_XK','s:13:\"s:6:\"Kosovo\";\";',1441893350,1444312550),('Zend_LocaleC_en_territory_YE','s:12:\"s:5:\"Yemen\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_YT','s:14:\"s:7:\"Mayotte\";\";',1441893348,1444312548),('Zend_LocaleC_en_territory_ZA','s:20:\"s:12:\"South Africa\";\";',1441893345,1444312545),('Zend_LocaleC_en_territory_ZM','s:13:\"s:6:\"Zambia\";\";',1441893346,1444312546),('Zend_LocaleC_en_territory_ZW','s:15:\"s:8:\"Zimbabwe\";\";',1441893347,1444312547);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_tags`
--

DROP TABLE IF EXISTS `cache_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_tags` (
  `id` varchar(165) NOT NULL DEFAULT '',
  `tag` varchar(165) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tag`),
  KEY `id` (`id`),
  KEY `tag` (`tag`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_tags`
--

LOCK TABLES `cache_tags` WRITE;
/*!40000 ALTER TABLE `cache_tags` DISABLE KEYS */;
INSERT INTO `cache_tags` VALUES ('Zend_LocaleC_en_language_aa','Zend_Locale'),('Zend_LocaleC_en_language_aa_DJ','Zend_Locale'),('Zend_LocaleC_en_territory_DJ','Zend_Locale'),('Zend_LocaleC_en_language_aa_ER','Zend_Locale'),('Zend_LocaleC_en_territory_ER','Zend_Locale'),('Zend_LocaleC_en_language_aa_ET','Zend_Locale'),('Zend_LocaleC_en_territory_ET','Zend_Locale'),('Zend_LocaleC_en_language_af','Zend_Locale'),('Zend_LocaleC_en_language_af_NA','Zend_Locale'),('Zend_LocaleC_en_territory_NA','Zend_Locale'),('Zend_LocaleC_en_language_af_ZA','Zend_Locale'),('Zend_LocaleC_en_territory_ZA','Zend_Locale'),('Zend_LocaleC_en_language_agq','Zend_Locale'),('Zend_LocaleC_en_language_agq_CM','Zend_Locale'),('Zend_LocaleC_en_territory_CM','Zend_Locale'),('Zend_LocaleC_en_language_ak','Zend_Locale'),('Zend_LocaleC_en_language_ak_GH','Zend_Locale'),('Zend_LocaleC_en_territory_GH','Zend_Locale'),('Zend_LocaleC_en_language_am','Zend_Locale'),('Zend_LocaleC_en_language_am_ET','Zend_Locale'),('Zend_LocaleC_en_language_ar','Zend_Locale'),('Zend_LocaleC_en_language_ar_001','Zend_Locale'),('Zend_LocaleC_en_language_ar_AE','Zend_Locale'),('Zend_LocaleC_en_territory_AE','Zend_Locale'),('Zend_LocaleC_en_language_ar_BH','Zend_Locale'),('Zend_LocaleC_en_territory_BH','Zend_Locale'),('Zend_LocaleC_en_language_ar_DJ','Zend_Locale'),('Zend_LocaleC_en_language_ar_DZ','Zend_Locale'),('Zend_LocaleC_en_territory_DZ','Zend_Locale'),('Zend_LocaleC_en_language_ar_EG','Zend_Locale'),('Zend_LocaleC_en_territory_EG','Zend_Locale'),('Zend_LocaleC_en_language_ar_EH','Zend_Locale'),('Zend_LocaleC_en_territory_EH','Zend_Locale'),('Zend_LocaleC_en_language_ar_ER','Zend_Locale'),('Zend_LocaleC_en_language_ar_IL','Zend_Locale'),('Zend_LocaleC_en_territory_IL','Zend_Locale'),('Zend_LocaleC_en_language_ar_IQ','Zend_Locale'),('Zend_LocaleC_en_territory_IQ','Zend_Locale'),('Zend_LocaleC_en_language_ar_JO','Zend_Locale'),('Zend_LocaleC_en_territory_JO','Zend_Locale'),('Zend_LocaleC_en_language_ar_KM','Zend_Locale'),('Zend_LocaleC_en_territory_KM','Zend_Locale'),('Zend_LocaleC_en_language_ar_KW','Zend_Locale'),('Zend_LocaleC_en_territory_KW','Zend_Locale'),('Zend_LocaleC_en_language_ar_LB','Zend_Locale'),('Zend_LocaleC_en_territory_LB','Zend_Locale'),('Zend_LocaleC_en_language_ar_LY','Zend_Locale'),('Zend_LocaleC_en_territory_LY','Zend_Locale'),('Zend_LocaleC_en_language_ar_MA','Zend_Locale'),('Zend_LocaleC_en_territory_MA','Zend_Locale'),('Zend_LocaleC_en_language_ar_MR','Zend_Locale'),('Zend_LocaleC_en_territory_MR','Zend_Locale'),('Zend_LocaleC_en_language_ar_OM','Zend_Locale'),('Zend_LocaleC_en_territory_OM','Zend_Locale'),('Zend_LocaleC_en_language_ar_PS','Zend_Locale'),('Zend_LocaleC_en_territory_PS','Zend_Locale'),('Zend_LocaleC_en_language_ar_QA','Zend_Locale'),('Zend_LocaleC_en_territory_QA','Zend_Locale'),('Zend_LocaleC_en_language_ar_SA','Zend_Locale'),('Zend_LocaleC_en_territory_SA','Zend_Locale'),('Zend_LocaleC_en_language_ar_SD','Zend_Locale'),('Zend_LocaleC_en_territory_SD','Zend_Locale'),('Zend_LocaleC_en_language_ar_SO','Zend_Locale'),('Zend_LocaleC_en_territory_SO','Zend_Locale'),('Zend_LocaleC_en_language_ar_SS','Zend_Locale'),('Zend_LocaleC_en_territory_SS','Zend_Locale'),('Zend_LocaleC_en_language_ar_SY','Zend_Locale'),('Zend_LocaleC_en_territory_SY','Zend_Locale'),('Zend_LocaleC_en_language_ar_TD','Zend_Locale'),('Zend_LocaleC_en_territory_TD','Zend_Locale'),('Zend_LocaleC_en_language_ar_TN','Zend_Locale'),('Zend_LocaleC_en_territory_TN','Zend_Locale'),('Zend_LocaleC_en_language_ar_YE','Zend_Locale'),('Zend_LocaleC_en_territory_YE','Zend_Locale'),('Zend_LocaleC_en_language_as','Zend_Locale'),('Zend_LocaleC_en_language_as_IN','Zend_Locale'),('Zend_LocaleC_en_territory_IN','Zend_Locale'),('Zend_LocaleC_en_language_asa','Zend_Locale'),('Zend_LocaleC_en_language_asa_TZ','Zend_Locale'),('Zend_LocaleC_en_territory_TZ','Zend_Locale'),('Zend_LocaleC_en_language_ast','Zend_Locale'),('Zend_LocaleC_en_language_ast_ES','Zend_Locale'),('Zend_LocaleC_en_territory_ES','Zend_Locale'),('Zend_LocaleC_en_language_az','Zend_Locale'),('Zend_LocaleC_en_language_az_Cyrl','Zend_Locale'),('Zend_LocaleC_en_territory_','Zend_Locale'),('Zend_LocaleC_en_language_az_Cyrl_AZ','Zend_Locale'),('Zend_LocaleC_en_territory_AZ','Zend_Locale'),('Zend_LocaleC_en_language_az_Latn','Zend_Locale'),('Zend_LocaleC_en_language_az_Latn_AZ','Zend_Locale'),('Zend_LocaleC_en_language_bas','Zend_Locale'),('Zend_LocaleC_en_language_bas_CM','Zend_Locale'),('Zend_LocaleC_en_language_be','Zend_Locale'),('Zend_LocaleC_en_language_be_BY','Zend_Locale'),('Zend_LocaleC_en_territory_BY','Zend_Locale'),('Zend_LocaleC_en_language_bem','Zend_Locale'),('Zend_LocaleC_en_language_bem_ZM','Zend_Locale'),('Zend_LocaleC_en_territory_ZM','Zend_Locale'),('Zend_LocaleC_en_language_bez','Zend_Locale'),('Zend_LocaleC_en_language_bez_TZ','Zend_Locale'),('Zend_LocaleC_en_language_bg','Zend_Locale'),('Zend_LocaleC_en_language_bg_BG','Zend_Locale'),('Zend_LocaleC_en_territory_BG','Zend_Locale'),('Zend_LocaleC_en_language_bm','Zend_Locale'),('Zend_LocaleC_en_language_bm_ML','Zend_Locale'),('Zend_LocaleC_en_territory_ML','Zend_Locale'),('Zend_LocaleC_en_language_bn','Zend_Locale'),('Zend_LocaleC_en_language_bn_BD','Zend_Locale'),('Zend_LocaleC_en_territory_BD','Zend_Locale'),('Zend_LocaleC_en_language_bn_IN','Zend_Locale'),('Zend_LocaleC_en_language_bo','Zend_Locale'),('Zend_LocaleC_en_language_bo_CN','Zend_Locale'),('Zend_LocaleC_en_territory_CN','Zend_Locale'),('Zend_LocaleC_en_language_bo_IN','Zend_Locale'),('Zend_LocaleC_en_language_br','Zend_Locale'),('Zend_LocaleC_en_language_br_FR','Zend_Locale'),('Zend_LocaleC_en_territory_FR','Zend_Locale'),('Zend_LocaleC_en_language_brx','Zend_Locale'),('Zend_LocaleC_en_language_brx_IN','Zend_Locale'),('Zend_LocaleC_en_language_bs','Zend_Locale'),('Zend_LocaleC_en_language_bs_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_bs_Cyrl_BA','Zend_Locale'),('Zend_LocaleC_en_territory_BA','Zend_Locale'),('Zend_LocaleC_en_language_bs_Latn','Zend_Locale'),('Zend_LocaleC_en_language_bs_Latn_BA','Zend_Locale'),('Zend_LocaleC_en_language_byn','Zend_Locale'),('Zend_LocaleC_en_language_byn_ER','Zend_Locale'),('Zend_LocaleC_en_language_ca','Zend_Locale'),('Zend_LocaleC_en_language_ca_AD','Zend_Locale'),('Zend_LocaleC_en_territory_AD','Zend_Locale'),('Zend_LocaleC_en_language_ca_ES','Zend_Locale'),('Zend_LocaleC_en_language_ca_ES_VALENCIA','Zend_Locale'),('Zend_LocaleC_en_language_ca_FR','Zend_Locale'),('Zend_LocaleC_en_language_ca_IT','Zend_Locale'),('Zend_LocaleC_en_territory_IT','Zend_Locale'),('Zend_LocaleC_en_language_cgg','Zend_Locale'),('Zend_LocaleC_en_language_cgg_UG','Zend_Locale'),('Zend_LocaleC_en_territory_UG','Zend_Locale'),('Zend_LocaleC_en_language_chr','Zend_Locale'),('Zend_LocaleC_en_language_chr_US','Zend_Locale'),('Zend_LocaleC_en_territory_US','Zend_Locale'),('Zend_LocaleC_en_language_cs','Zend_Locale'),('Zend_LocaleC_en_language_cs_CZ','Zend_Locale'),('Zend_LocaleC_en_territory_CZ','Zend_Locale'),('Zend_LocaleC_en_language_cy','Zend_Locale'),('Zend_LocaleC_en_language_cy_GB','Zend_Locale'),('Zend_LocaleC_en_territory_GB','Zend_Locale'),('Zend_LocaleC_en_language_da','Zend_Locale'),('Zend_LocaleC_en_language_da_DK','Zend_Locale'),('Zend_LocaleC_en_territory_DK','Zend_Locale'),('Zend_LocaleC_en_language_da_GL','Zend_Locale'),('Zend_LocaleC_en_territory_GL','Zend_Locale'),('Zend_LocaleC_en_language_dav','Zend_Locale'),('Zend_LocaleC_en_language_dav_KE','Zend_Locale'),('Zend_LocaleC_en_territory_KE','Zend_Locale'),('Zend_LocaleC_en_language_de','Zend_Locale'),('Zend_LocaleC_en_language_de_AT','Zend_Locale'),('Zend_LocaleC_en_language_de_BE','Zend_Locale'),('Zend_LocaleC_en_territory_BE','Zend_Locale'),('Zend_LocaleC_en_language_de_CH','Zend_Locale'),('Zend_LocaleC_en_language_de_DE','Zend_Locale'),('Zend_LocaleC_en_territory_DE','Zend_Locale'),('Zend_LocaleC_en_language_de_LI','Zend_Locale'),('Zend_LocaleC_en_territory_LI','Zend_Locale'),('Zend_LocaleC_en_language_de_LU','Zend_Locale'),('Zend_LocaleC_en_territory_LU','Zend_Locale'),('Zend_LocaleC_en_language_dje','Zend_Locale'),('Zend_LocaleC_en_language_dje_NE','Zend_Locale'),('Zend_LocaleC_en_territory_NE','Zend_Locale'),('Zend_LocaleC_en_language_dua','Zend_Locale'),('Zend_LocaleC_en_language_dua_CM','Zend_Locale'),('Zend_LocaleC_en_language_dyo','Zend_Locale'),('Zend_LocaleC_en_language_dyo_SN','Zend_Locale'),('Zend_LocaleC_en_territory_SN','Zend_Locale'),('Zend_LocaleC_en_language_dz','Zend_Locale'),('Zend_LocaleC_en_language_dz_BT','Zend_Locale'),('Zend_LocaleC_en_territory_BT','Zend_Locale'),('Zend_LocaleC_en_language_ebu','Zend_Locale'),('Zend_LocaleC_en_language_ebu_KE','Zend_Locale'),('Zend_LocaleC_en_language_ee','Zend_Locale'),('Zend_LocaleC_en_language_ee_GH','Zend_Locale'),('Zend_LocaleC_en_language_ee_TG','Zend_Locale'),('Zend_LocaleC_en_territory_TG','Zend_Locale'),('Zend_LocaleC_en_language_el','Zend_Locale'),('Zend_LocaleC_en_language_el_CY','Zend_Locale'),('Zend_LocaleC_en_territory_CY','Zend_Locale'),('Zend_LocaleC_en_language_el_GR','Zend_Locale'),('Zend_LocaleC_en_territory_GR','Zend_Locale'),('Zend_LocaleC_en_language_en','Zend_Locale'),('Zend_LocaleC_en_language_en_001','Zend_Locale'),('Zend_LocaleC_en_territory_001','Zend_Locale'),('Zend_LocaleC_en_language_en_150','Zend_Locale'),('Zend_LocaleC_en_territory_150','Zend_Locale'),('Zend_LocaleC_en_language_en_AG','Zend_Locale'),('Zend_LocaleC_en_territory_AG','Zend_Locale'),('Zend_LocaleC_en_language_en_AI','Zend_Locale'),('Zend_LocaleC_en_territory_AI','Zend_Locale'),('Zend_LocaleC_en_language_en_AS','Zend_Locale'),('Zend_LocaleC_en_territory_AS','Zend_Locale'),('Zend_LocaleC_en_language_en_AU','Zend_Locale'),('Zend_LocaleC_en_language_en_BB','Zend_Locale'),('Zend_LocaleC_en_territory_BB','Zend_Locale'),('Zend_LocaleC_en_language_en_BE','Zend_Locale'),('Zend_LocaleC_en_language_en_BM','Zend_Locale'),('Zend_LocaleC_en_territory_BM','Zend_Locale'),('Zend_LocaleC_en_language_en_BS','Zend_Locale'),('Zend_LocaleC_en_territory_BS','Zend_Locale'),('Zend_LocaleC_en_language_en_BW','Zend_Locale'),('Zend_LocaleC_en_territory_BW','Zend_Locale'),('Zend_LocaleC_en_language_en_BZ','Zend_Locale'),('Zend_LocaleC_en_territory_BZ','Zend_Locale'),('Zend_LocaleC_en_language_en_CA','Zend_Locale'),('Zend_LocaleC_en_language_en_CC','Zend_Locale'),('Zend_LocaleC_en_territory_CC','Zend_Locale'),('Zend_LocaleC_en_language_en_CK','Zend_Locale'),('Zend_LocaleC_en_territory_CK','Zend_Locale'),('Zend_LocaleC_en_language_en_CM','Zend_Locale'),('Zend_LocaleC_en_language_en_CX','Zend_Locale'),('Zend_LocaleC_en_territory_CX','Zend_Locale'),('Zend_LocaleC_en_language_en_DG','Zend_Locale'),('Zend_LocaleC_en_territory_DG','Zend_Locale'),('Zend_LocaleC_en_language_en_DM','Zend_Locale'),('Zend_LocaleC_en_territory_DM','Zend_Locale'),('Zend_LocaleC_en_language_en_Dsrt','Zend_Locale'),('Zend_LocaleC_en_language_en_Dsrt_US','Zend_Locale'),('Zend_LocaleC_en_language_en_ER','Zend_Locale'),('Zend_LocaleC_en_language_en_FJ','Zend_Locale'),('Zend_LocaleC_en_territory_FJ','Zend_Locale'),('Zend_LocaleC_en_language_en_FK','Zend_Locale'),('Zend_LocaleC_en_territory_FK','Zend_Locale'),('Zend_LocaleC_en_language_en_FM','Zend_Locale'),('Zend_LocaleC_en_territory_FM','Zend_Locale'),('Zend_LocaleC_en_language_en_GB','Zend_Locale'),('Zend_LocaleC_en_language_en_GD','Zend_Locale'),('Zend_LocaleC_en_territory_GD','Zend_Locale'),('Zend_LocaleC_en_language_en_GG','Zend_Locale'),('Zend_LocaleC_en_territory_GG','Zend_Locale'),('Zend_LocaleC_en_language_en_GH','Zend_Locale'),('Zend_LocaleC_en_language_en_GI','Zend_Locale'),('Zend_LocaleC_en_territory_GI','Zend_Locale'),('Zend_LocaleC_en_language_en_GM','Zend_Locale'),('Zend_LocaleC_en_territory_GM','Zend_Locale'),('Zend_LocaleC_en_language_en_GU','Zend_Locale'),('Zend_LocaleC_en_territory_GU','Zend_Locale'),('Zend_LocaleC_en_language_en_GY','Zend_Locale'),('Zend_LocaleC_en_territory_GY','Zend_Locale'),('Zend_LocaleC_en_language_en_HK','Zend_Locale'),('Zend_LocaleC_en_territory_HK','Zend_Locale'),('Zend_LocaleC_en_language_en_IE','Zend_Locale'),('Zend_LocaleC_en_territory_IE','Zend_Locale'),('Zend_LocaleC_en_language_en_IM','Zend_Locale'),('Zend_LocaleC_en_territory_IM','Zend_Locale'),('Zend_LocaleC_en_language_en_IN','Zend_Locale'),('Zend_LocaleC_en_language_en_IO','Zend_Locale'),('Zend_LocaleC_en_territory_IO','Zend_Locale'),('Zend_LocaleC_en_language_en_JE','Zend_Locale'),('Zend_LocaleC_en_territory_JE','Zend_Locale'),('Zend_LocaleC_en_language_en_JM','Zend_Locale'),('Zend_LocaleC_en_territory_JM','Zend_Locale'),('Zend_LocaleC_en_language_en_KE','Zend_Locale'),('Zend_LocaleC_en_language_en_KI','Zend_Locale'),('Zend_LocaleC_en_territory_KI','Zend_Locale'),('Zend_LocaleC_en_language_en_KN','Zend_Locale'),('Zend_LocaleC_en_territory_KN','Zend_Locale'),('Zend_LocaleC_en_language_en_KY','Zend_Locale'),('Zend_LocaleC_en_territory_KY','Zend_Locale'),('Zend_LocaleC_en_language_en_LC','Zend_Locale'),('Zend_LocaleC_en_territory_LC','Zend_Locale'),('Zend_LocaleC_en_language_en_LR','Zend_Locale'),('Zend_LocaleC_en_territory_LR','Zend_Locale'),('Zend_LocaleC_en_language_en_LS','Zend_Locale'),('Zend_LocaleC_en_territory_LS','Zend_Locale'),('Zend_LocaleC_en_language_en_MG','Zend_Locale'),('Zend_LocaleC_en_territory_MG','Zend_Locale'),('Zend_LocaleC_en_language_en_MH','Zend_Locale'),('Zend_LocaleC_en_territory_MH','Zend_Locale'),('Zend_LocaleC_en_language_en_MO','Zend_Locale'),('Zend_LocaleC_en_territory_MO','Zend_Locale'),('Zend_LocaleC_en_language_en_MP','Zend_Locale'),('Zend_LocaleC_en_territory_MP','Zend_Locale'),('Zend_LocaleC_en_language_en_MS','Zend_Locale'),('Zend_LocaleC_en_territory_MS','Zend_Locale'),('Zend_LocaleC_en_language_en_MT','Zend_Locale'),('Zend_LocaleC_en_territory_MT','Zend_Locale'),('Zend_LocaleC_en_language_en_MU','Zend_Locale'),('Zend_LocaleC_en_territory_MU','Zend_Locale'),('Zend_LocaleC_en_language_en_MW','Zend_Locale'),('Zend_LocaleC_en_territory_MW','Zend_Locale'),('Zend_LocaleC_en_language_en_NA','Zend_Locale'),('Zend_LocaleC_en_language_en_NF','Zend_Locale'),('Zend_LocaleC_en_territory_NF','Zend_Locale'),('Zend_LocaleC_en_language_en_NG','Zend_Locale'),('Zend_LocaleC_en_territory_NG','Zend_Locale'),('Zend_LocaleC_en_language_en_NR','Zend_Locale'),('Zend_LocaleC_en_territory_NR','Zend_Locale'),('Zend_LocaleC_en_language_en_NU','Zend_Locale'),('Zend_LocaleC_en_territory_NU','Zend_Locale'),('Zend_LocaleC_en_language_en_NZ','Zend_Locale'),('Zend_LocaleC_en_territory_NZ','Zend_Locale'),('Zend_LocaleC_en_language_en_PG','Zend_Locale'),('Zend_LocaleC_en_territory_PG','Zend_Locale'),('Zend_LocaleC_en_language_en_PH','Zend_Locale'),('Zend_LocaleC_en_territory_PH','Zend_Locale'),('Zend_LocaleC_en_language_en_PK','Zend_Locale'),('Zend_LocaleC_en_territory_PK','Zend_Locale'),('Zend_LocaleC_en_language_en_PN','Zend_Locale'),('Zend_LocaleC_en_territory_PN','Zend_Locale'),('Zend_LocaleC_en_language_en_PR','Zend_Locale'),('Zend_LocaleC_en_territory_PR','Zend_Locale'),('Zend_LocaleC_en_language_en_PW','Zend_Locale'),('Zend_LocaleC_en_territory_PW','Zend_Locale'),('Zend_LocaleC_en_language_en_RW','Zend_Locale'),('Zend_LocaleC_en_territory_RW','Zend_Locale'),('Zend_LocaleC_en_language_en_SB','Zend_Locale'),('Zend_LocaleC_en_territory_SB','Zend_Locale'),('Zend_LocaleC_en_language_en_SC','Zend_Locale'),('Zend_LocaleC_en_territory_SC','Zend_Locale'),('Zend_LocaleC_en_language_en_SD','Zend_Locale'),('Zend_LocaleC_en_language_en_SG','Zend_Locale'),('Zend_LocaleC_en_territory_SG','Zend_Locale'),('Zend_LocaleC_en_language_en_SH','Zend_Locale'),('Zend_LocaleC_en_territory_SH','Zend_Locale'),('Zend_LocaleC_en_language_en_SL','Zend_Locale'),('Zend_LocaleC_en_territory_SL','Zend_Locale'),('Zend_LocaleC_en_language_en_SS','Zend_Locale'),('Zend_LocaleC_en_language_en_SX','Zend_Locale'),('Zend_LocaleC_en_territory_SX','Zend_Locale'),('Zend_LocaleC_en_language_en_SZ','Zend_Locale'),('Zend_LocaleC_en_territory_SZ','Zend_Locale'),('Zend_LocaleC_en_language_en_TC','Zend_Locale'),('Zend_LocaleC_en_territory_TC','Zend_Locale'),('Zend_LocaleC_en_language_en_TK','Zend_Locale'),('Zend_LocaleC_en_territory_TK','Zend_Locale'),('Zend_LocaleC_en_language_en_TO','Zend_Locale'),('Zend_LocaleC_en_territory_TO','Zend_Locale'),('Zend_LocaleC_en_language_en_TT','Zend_Locale'),('Zend_LocaleC_en_territory_TT','Zend_Locale'),('Zend_LocaleC_en_language_en_TV','Zend_Locale'),('Zend_LocaleC_en_territory_TV','Zend_Locale'),('Zend_LocaleC_en_language_en_TZ','Zend_Locale'),('Zend_LocaleC_en_language_en_UG','Zend_Locale'),('Zend_LocaleC_en_language_en_UM','Zend_Locale'),('Zend_LocaleC_en_territory_UM','Zend_Locale'),('Zend_LocaleC_en_language_en_US','Zend_Locale'),('Zend_LocaleC_en_language_en_US_POSIX','Zend_Locale'),('Zend_LocaleC_en_language_en_VC','Zend_Locale'),('Zend_LocaleC_en_territory_VC','Zend_Locale'),('Zend_LocaleC_en_language_en_VG','Zend_Locale'),('Zend_LocaleC_en_territory_VG','Zend_Locale'),('Zend_LocaleC_en_language_en_VI','Zend_Locale'),('Zend_LocaleC_en_territory_VI','Zend_Locale'),('Zend_LocaleC_en_language_en_VU','Zend_Locale'),('Zend_LocaleC_en_territory_VU','Zend_Locale'),('Zend_LocaleC_en_language_en_WS','Zend_Locale'),('Zend_LocaleC_en_territory_WS','Zend_Locale'),('Zend_LocaleC_en_language_en_ZA','Zend_Locale'),('Zend_LocaleC_en_language_en_ZM','Zend_Locale'),('Zend_LocaleC_en_language_en_ZW','Zend_Locale'),('Zend_LocaleC_en_territory_ZW','Zend_Locale'),('Zend_LocaleC_en_language_eo','Zend_Locale'),('Zend_LocaleC_en_language_eo_001','Zend_Locale'),('Zend_LocaleC_en_language_es','Zend_Locale'),('Zend_LocaleC_en_language_es_419','Zend_Locale'),('Zend_LocaleC_en_language_es_AR','Zend_Locale'),('Zend_LocaleC_en_territory_AR','Zend_Locale'),('Zend_LocaleC_en_language_es_BO','Zend_Locale'),('Zend_LocaleC_en_territory_BO','Zend_Locale'),('Zend_LocaleC_en_language_es_CL','Zend_Locale'),('Zend_LocaleC_en_territory_CL','Zend_Locale'),('Zend_LocaleC_en_language_es_CO','Zend_Locale'),('Zend_LocaleC_en_territory_CO','Zend_Locale'),('Zend_LocaleC_en_language_es_CR','Zend_Locale'),('Zend_LocaleC_en_territory_CR','Zend_Locale'),('Zend_LocaleC_en_language_es_CU','Zend_Locale'),('Zend_LocaleC_en_territory_CU','Zend_Locale'),('Zend_LocaleC_en_language_es_DO','Zend_Locale'),('Zend_LocaleC_en_territory_DO','Zend_Locale'),('Zend_LocaleC_en_language_es_EA','Zend_Locale'),('Zend_LocaleC_en_territory_EA','Zend_Locale'),('Zend_LocaleC_en_language_es_EC','Zend_Locale'),('Zend_LocaleC_en_territory_EC','Zend_Locale'),('Zend_LocaleC_en_language_es_ES','Zend_Locale'),('Zend_LocaleC_en_language_es_GQ','Zend_Locale'),('Zend_LocaleC_en_territory_GQ','Zend_Locale'),('Zend_LocaleC_en_language_es_GT','Zend_Locale'),('Zend_LocaleC_en_territory_GT','Zend_Locale'),('Zend_LocaleC_en_language_es_HN','Zend_Locale'),('Zend_LocaleC_en_territory_HN','Zend_Locale'),('Zend_LocaleC_en_language_es_IC','Zend_Locale'),('Zend_LocaleC_en_territory_IC','Zend_Locale'),('Zend_LocaleC_en_language_es_MX','Zend_Locale'),('Zend_LocaleC_en_language_es_NI','Zend_Locale'),('Zend_LocaleC_en_territory_NI','Zend_Locale'),('Zend_LocaleC_en_language_es_PA','Zend_Locale'),('Zend_LocaleC_en_territory_PA','Zend_Locale'),('Zend_LocaleC_en_language_es_PE','Zend_Locale'),('Zend_LocaleC_en_territory_PE','Zend_Locale'),('Zend_LocaleC_en_language_es_PH','Zend_Locale'),('Zend_LocaleC_en_language_es_PR','Zend_Locale'),('Zend_LocaleC_en_language_es_PY','Zend_Locale'),('Zend_LocaleC_en_territory_PY','Zend_Locale'),('Zend_LocaleC_en_language_es_SV','Zend_Locale'),('Zend_LocaleC_en_territory_SV','Zend_Locale'),('Zend_LocaleC_en_language_es_US','Zend_Locale'),('Zend_LocaleC_en_language_es_UY','Zend_Locale'),('Zend_LocaleC_en_territory_UY','Zend_Locale'),('Zend_LocaleC_en_language_es_VE','Zend_Locale'),('Zend_LocaleC_en_territory_VE','Zend_Locale'),('Zend_LocaleC_en_language_et','Zend_Locale'),('Zend_LocaleC_en_language_et_EE','Zend_Locale'),('Zend_LocaleC_en_territory_EE','Zend_Locale'),('Zend_LocaleC_en_language_eu','Zend_Locale'),('Zend_LocaleC_en_language_eu_ES','Zend_Locale'),('Zend_LocaleC_en_language_ewo','Zend_Locale'),('Zend_LocaleC_en_language_ewo_CM','Zend_Locale'),('Zend_LocaleC_en_language_fa','Zend_Locale'),('Zend_LocaleC_en_language_fa_AF','Zend_Locale'),('Zend_LocaleC_en_territory_AF','Zend_Locale'),('Zend_LocaleC_en_language_fa_IR','Zend_Locale'),('Zend_LocaleC_en_territory_IR','Zend_Locale'),('Zend_LocaleC_en_language_ff','Zend_Locale'),('Zend_LocaleC_en_language_ff_CM','Zend_Locale'),('Zend_LocaleC_en_language_ff_GN','Zend_Locale'),('Zend_LocaleC_en_territory_GN','Zend_Locale'),('Zend_LocaleC_en_language_ff_MR','Zend_Locale'),('Zend_LocaleC_en_language_fr_PM','Zend_Locale'),('Zend_LocaleC_en_language_fr','Zend_Locale'),('Zend_LocaleC_en_territory_PM','Zend_Locale'),('Zend_LocaleC_en_language_ff_SN','Zend_Locale'),('Zend_LocaleC_en_language_fr_WF','Zend_Locale'),('Zend_LocaleC_en_territory_WF','Zend_Locale'),('Zend_LocaleC_en_language_fi','Zend_Locale'),('Zend_LocaleC_en_language_fi_FI','Zend_Locale'),('Zend_LocaleC_en_territory_FI','Zend_Locale'),('Zend_LocaleC_en_language_fil','Zend_Locale'),('Zend_LocaleC_en_language_fil_PH','Zend_Locale'),('Zend_LocaleC_en_language_fo','Zend_Locale'),('Zend_LocaleC_en_language_fo_FO','Zend_Locale'),('Zend_LocaleC_en_territory_FO','Zend_Locale'),('Zend_LocaleC_en_language_fr_BE','Zend_Locale'),('Zend_LocaleC_en_language_fr_BF','Zend_Locale'),('Zend_LocaleC_en_territory_BF','Zend_Locale'),('Zend_LocaleC_en_language_fr_BI','Zend_Locale'),('Zend_LocaleC_en_territory_BI','Zend_Locale'),('Zend_LocaleC_en_language_fr_BJ','Zend_Locale'),('Zend_LocaleC_en_territory_BJ','Zend_Locale'),('Zend_LocaleC_en_language_fr_BL','Zend_Locale'),('Zend_LocaleC_en_territory_BL','Zend_Locale'),('Zend_LocaleC_en_language_fr_CA','Zend_Locale'),('Zend_LocaleC_en_language_fr_CD','Zend_Locale'),('Zend_LocaleC_en_territory_CD','Zend_Locale'),('Zend_LocaleC_en_language_fr_CF','Zend_Locale'),('Zend_LocaleC_en_territory_CF','Zend_Locale'),('Zend_LocaleC_en_language_fr_CG','Zend_Locale'),('Zend_LocaleC_en_territory_CG','Zend_Locale'),('Zend_LocaleC_en_language_fr_CH','Zend_Locale'),('Zend_LocaleC_en_language_fr_CI','Zend_Locale'),('Zend_LocaleC_en_territory_CI','Zend_Locale'),('Zend_LocaleC_en_language_fr_CM','Zend_Locale'),('Zend_LocaleC_en_language_fr_DJ','Zend_Locale'),('Zend_LocaleC_en_language_fr_DZ','Zend_Locale'),('Zend_LocaleC_en_language_fr_FR','Zend_Locale'),('Zend_LocaleC_en_language_fr_GA','Zend_Locale'),('Zend_LocaleC_en_territory_GA','Zend_Locale'),('Zend_LocaleC_en_language_fr_GF','Zend_Locale'),('Zend_LocaleC_en_territory_GF','Zend_Locale'),('Zend_LocaleC_en_language_fr_GN','Zend_Locale'),('Zend_LocaleC_en_language_fr_GP','Zend_Locale'),('Zend_LocaleC_en_territory_GP','Zend_Locale'),('Zend_LocaleC_en_language_fr_GQ','Zend_Locale'),('Zend_LocaleC_en_language_fr_HT','Zend_Locale'),('Zend_LocaleC_en_territory_HT','Zend_Locale'),('Zend_LocaleC_en_language_fr_KM','Zend_Locale'),('Zend_LocaleC_en_language_fr_LU','Zend_Locale'),('Zend_LocaleC_en_language_fr_MA','Zend_Locale'),('Zend_LocaleC_en_language_fr_MC','Zend_Locale'),('Zend_LocaleC_en_territory_MC','Zend_Locale'),('Zend_LocaleC_en_language_fr_MF','Zend_Locale'),('Zend_LocaleC_en_territory_MF','Zend_Locale'),('Zend_LocaleC_en_language_fr_MG','Zend_Locale'),('Zend_LocaleC_en_language_fr_ML','Zend_Locale'),('Zend_LocaleC_en_language_fr_MQ','Zend_Locale'),('Zend_LocaleC_en_territory_MQ','Zend_Locale'),('Zend_LocaleC_en_language_fr_MR','Zend_Locale'),('Zend_LocaleC_en_language_fr_MU','Zend_Locale'),('Zend_LocaleC_en_language_fr_NC','Zend_Locale'),('Zend_LocaleC_en_territory_NC','Zend_Locale'),('Zend_LocaleC_en_language_fr_NE','Zend_Locale'),('Zend_LocaleC_en_language_fr_PF','Zend_Locale'),('Zend_LocaleC_en_territory_PF','Zend_Locale'),('Zend_LocaleC_en_language_fr_RE','Zend_Locale'),('Zend_LocaleC_en_territory_RE','Zend_Locale'),('Zend_LocaleC_en_language_fr_RW','Zend_Locale'),('Zend_LocaleC_en_language_fr_SC','Zend_Locale'),('Zend_LocaleC_en_language_fr_SN','Zend_Locale'),('Zend_LocaleC_en_language_fr_SY','Zend_Locale'),('Zend_LocaleC_en_language_fr_TD','Zend_Locale'),('Zend_LocaleC_en_language_fr_TG','Zend_Locale'),('Zend_LocaleC_en_language_fr_TN','Zend_Locale'),('Zend_LocaleC_en_language_fr_VU','Zend_Locale'),('Zend_LocaleC_en_language_fr_YT','Zend_Locale'),('Zend_LocaleC_en_territory_YT','Zend_Locale'),('Zend_LocaleC_en_language_fur','Zend_Locale'),('Zend_LocaleC_en_language_fur_IT','Zend_Locale'),('Zend_LocaleC_en_language_fy','Zend_Locale'),('Zend_LocaleC_en_language_fy_NL','Zend_Locale'),('Zend_LocaleC_en_territory_NL','Zend_Locale'),('Zend_LocaleC_en_language_ga','Zend_Locale'),('Zend_LocaleC_en_language_ga_IE','Zend_Locale'),('Zend_LocaleC_en_language_gd','Zend_Locale'),('Zend_LocaleC_en_language_gd_GB','Zend_Locale'),('Zend_LocaleC_en_language_gl','Zend_Locale'),('Zend_LocaleC_en_language_gl_ES','Zend_Locale'),('Zend_LocaleC_en_language_gsw','Zend_Locale'),('Zend_LocaleC_en_language_gsw_CH','Zend_Locale'),('Zend_LocaleC_en_territory_CH','Zend_Locale'),('Zend_LocaleC_en_language_gsw_LI','Zend_Locale'),('Zend_LocaleC_en_language_gu','Zend_Locale'),('Zend_LocaleC_en_language_gu_IN','Zend_Locale'),('Zend_LocaleC_en_language_guz','Zend_Locale'),('Zend_LocaleC_en_language_guz_KE','Zend_Locale'),('Zend_LocaleC_en_language_gv','Zend_Locale'),('Zend_LocaleC_en_language_gv_IM','Zend_Locale'),('Zend_LocaleC_en_language_ha','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn_GH','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn_NE','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn_NG','Zend_Locale'),('Zend_LocaleC_en_language_haw','Zend_Locale'),('Zend_LocaleC_en_language_haw_US','Zend_Locale'),('Zend_LocaleC_en_language_he','Zend_Locale'),('Zend_LocaleC_en_language_he_IL','Zend_Locale'),('Zend_LocaleC_en_language_hi','Zend_Locale'),('Zend_LocaleC_en_language_hi_IN','Zend_Locale'),('Zend_LocaleC_en_language_hr','Zend_Locale'),('Zend_LocaleC_en_language_hr_BA','Zend_Locale'),('Zend_LocaleC_en_language_hr_HR','Zend_Locale'),('Zend_LocaleC_en_territory_HR','Zend_Locale'),('Zend_LocaleC_en_language_hu','Zend_Locale'),('Zend_LocaleC_en_language_hu_HU','Zend_Locale'),('Zend_LocaleC_en_territory_HU','Zend_Locale'),('Zend_LocaleC_en_language_hy','Zend_Locale'),('Zend_LocaleC_en_language_hy_AM','Zend_Locale'),('Zend_LocaleC_en_territory_AM','Zend_Locale'),('Zend_LocaleC_en_language_ia','Zend_Locale'),('Zend_LocaleC_en_language_ia_FR','Zend_Locale'),('Zend_LocaleC_en_language_id','Zend_Locale'),('Zend_LocaleC_en_language_id_ID','Zend_Locale'),('Zend_LocaleC_en_territory_ID','Zend_Locale'),('Zend_LocaleC_en_language_ig','Zend_Locale'),('Zend_LocaleC_en_language_ig_NG','Zend_Locale'),('Zend_LocaleC_en_language_ii','Zend_Locale'),('Zend_LocaleC_en_language_ii_CN','Zend_Locale'),('Zend_LocaleC_en_language_is','Zend_Locale'),('Zend_LocaleC_en_language_is_IS','Zend_Locale'),('Zend_LocaleC_en_territory_IS','Zend_Locale'),('Zend_LocaleC_en_language_it','Zend_Locale'),('Zend_LocaleC_en_language_it_CH','Zend_Locale'),('Zend_LocaleC_en_language_it_IT','Zend_Locale'),('Zend_LocaleC_en_language_it_SM','Zend_Locale'),('Zend_LocaleC_en_territory_SM','Zend_Locale'),('Zend_LocaleC_en_language_ja','Zend_Locale'),('Zend_LocaleC_en_language_ja_JP','Zend_Locale'),('Zend_LocaleC_en_territory_JP','Zend_Locale'),('Zend_LocaleC_en_language_jgo','Zend_Locale'),('Zend_LocaleC_en_language_jgo_CM','Zend_Locale'),('Zend_LocaleC_en_language_jmc','Zend_Locale'),('Zend_LocaleC_en_language_jmc_TZ','Zend_Locale'),('Zend_LocaleC_en_language_ka','Zend_Locale'),('Zend_LocaleC_en_language_ka_GE','Zend_Locale'),('Zend_LocaleC_en_territory_GE','Zend_Locale'),('Zend_LocaleC_en_language_kab','Zend_Locale'),('Zend_LocaleC_en_language_kab_DZ','Zend_Locale'),('Zend_LocaleC_en_language_kam','Zend_Locale'),('Zend_LocaleC_en_language_kam_KE','Zend_Locale'),('Zend_LocaleC_en_language_kde','Zend_Locale'),('Zend_LocaleC_en_language_kde_TZ','Zend_Locale'),('Zend_LocaleC_en_language_kea','Zend_Locale'),('Zend_LocaleC_en_language_kea_CV','Zend_Locale'),('Zend_LocaleC_en_territory_CV','Zend_Locale'),('Zend_LocaleC_en_language_khq','Zend_Locale'),('Zend_LocaleC_en_language_khq_ML','Zend_Locale'),('Zend_LocaleC_en_language_ki','Zend_Locale'),('Zend_LocaleC_en_language_ki_KE','Zend_Locale'),('Zend_LocaleC_en_language_kk','Zend_Locale'),('Zend_LocaleC_en_language_kk_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_kk_Cyrl_KZ','Zend_Locale'),('Zend_LocaleC_en_territory_KZ','Zend_Locale'),('Zend_LocaleC_en_language_kkj','Zend_Locale'),('Zend_LocaleC_en_language_kkj_CM','Zend_Locale'),('Zend_LocaleC_en_language_kl','Zend_Locale'),('Zend_LocaleC_en_language_kl_GL','Zend_Locale'),('Zend_LocaleC_en_language_kln','Zend_Locale'),('Zend_LocaleC_en_language_kln_KE','Zend_Locale'),('Zend_LocaleC_en_language_km','Zend_Locale'),('Zend_LocaleC_en_language_km_KH','Zend_Locale'),('Zend_LocaleC_en_territory_KH','Zend_Locale'),('Zend_LocaleC_en_language_kn','Zend_Locale'),('Zend_LocaleC_en_language_kn_IN','Zend_Locale'),('Zend_LocaleC_en_language_ko','Zend_Locale'),('Zend_LocaleC_en_language_ko_KP','Zend_Locale'),('Zend_LocaleC_en_territory_KP','Zend_Locale'),('Zend_LocaleC_en_language_ko_KR','Zend_Locale'),('Zend_LocaleC_en_territory_KR','Zend_Locale'),('Zend_LocaleC_en_language_kok','Zend_Locale'),('Zend_LocaleC_en_language_kok_IN','Zend_Locale'),('Zend_LocaleC_en_language_ks','Zend_Locale'),('Zend_LocaleC_en_language_ks_Arab','Zend_Locale'),('Zend_LocaleC_en_language_ks_Arab_IN','Zend_Locale'),('Zend_LocaleC_en_language_ksb','Zend_Locale'),('Zend_LocaleC_en_language_ksb_TZ','Zend_Locale'),('Zend_LocaleC_en_language_ksf','Zend_Locale'),('Zend_LocaleC_en_language_ksf_CM','Zend_Locale'),('Zend_LocaleC_en_language_ksh','Zend_Locale'),('Zend_LocaleC_en_language_ksh_DE','Zend_Locale'),('Zend_LocaleC_en_language_kw','Zend_Locale'),('Zend_LocaleC_en_language_kw_GB','Zend_Locale'),('Zend_LocaleC_en_language_ky','Zend_Locale'),('Zend_LocaleC_en_language_ky_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_ky_Cyrl_KG','Zend_Locale'),('Zend_LocaleC_en_language_lag','Zend_Locale'),('Zend_LocaleC_en_language_lag_TZ','Zend_Locale'),('Zend_LocaleC_en_language_lg','Zend_Locale'),('Zend_LocaleC_en_language_lg_UG','Zend_Locale'),('Zend_LocaleC_en_language_lkt','Zend_Locale'),('Zend_LocaleC_en_language_lkt_US','Zend_Locale'),('Zend_LocaleC_en_language_ln','Zend_Locale'),('Zend_LocaleC_en_language_ln_AO','Zend_Locale'),('Zend_LocaleC_en_territory_AO','Zend_Locale'),('Zend_LocaleC_en_language_ln_CD','Zend_Locale'),('Zend_LocaleC_en_language_ln_CF','Zend_Locale'),('Zend_LocaleC_en_language_ln_CG','Zend_Locale'),('Zend_LocaleC_en_language_lo','Zend_Locale'),('Zend_LocaleC_en_language_lo_LA','Zend_Locale'),('Zend_LocaleC_en_territory_LA','Zend_Locale'),('Zend_LocaleC_en_language_lt','Zend_Locale'),('Zend_LocaleC_en_language_lt_LT','Zend_Locale'),('Zend_LocaleC_en_territory_LT','Zend_Locale'),('Zend_LocaleC_en_language_lu','Zend_Locale'),('Zend_LocaleC_en_language_lu_CD','Zend_Locale'),('Zend_LocaleC_en_language_luo','Zend_Locale'),('Zend_LocaleC_en_language_luo_KE','Zend_Locale'),('Zend_LocaleC_en_language_luy','Zend_Locale'),('Zend_LocaleC_en_language_luy_KE','Zend_Locale'),('Zend_LocaleC_en_language_lv','Zend_Locale'),('Zend_LocaleC_en_language_lv_LV','Zend_Locale'),('Zend_LocaleC_en_territory_LV','Zend_Locale'),('Zend_LocaleC_en_language_mas','Zend_Locale'),('Zend_LocaleC_en_language_mas_KE','Zend_Locale'),('Zend_LocaleC_en_language_mas_TZ','Zend_Locale'),('Zend_LocaleC_en_language_mer','Zend_Locale'),('Zend_LocaleC_en_language_mer_KE','Zend_Locale'),('Zend_LocaleC_en_language_mfe','Zend_Locale'),('Zend_LocaleC_en_language_mfe_MU','Zend_Locale'),('Zend_LocaleC_en_language_mg','Zend_Locale'),('Zend_LocaleC_en_language_mg_MG','Zend_Locale'),('Zend_LocaleC_en_language_mgh','Zend_Locale'),('Zend_LocaleC_en_language_mgh_MZ','Zend_Locale'),('Zend_LocaleC_en_territory_MZ','Zend_Locale'),('Zend_LocaleC_en_language_mgo','Zend_Locale'),('Zend_LocaleC_en_language_mgo_CM','Zend_Locale'),('Zend_LocaleC_en_language_mk','Zend_Locale'),('Zend_LocaleC_en_language_mk_MK','Zend_Locale'),('Zend_LocaleC_en_territory_MK','Zend_Locale'),('Zend_LocaleC_en_language_ml','Zend_Locale'),('Zend_LocaleC_en_language_ml_IN','Zend_Locale'),('Zend_LocaleC_en_language_mn','Zend_Locale'),('Zend_LocaleC_en_language_mn_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_mn_Cyrl_MN','Zend_Locale'),('Zend_LocaleC_en_territory_MN','Zend_Locale'),('Zend_LocaleC_en_language_mr','Zend_Locale'),('Zend_LocaleC_en_language_mr_IN','Zend_Locale'),('Zend_LocaleC_en_language_ms','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn_BN','Zend_Locale'),('Zend_LocaleC_en_territory_BN','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn_MY','Zend_Locale'),('Zend_LocaleC_en_territory_MY','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn_SG','Zend_Locale'),('Zend_LocaleC_en_language_mt','Zend_Locale'),('Zend_LocaleC_en_language_mt_MT','Zend_Locale'),('Zend_LocaleC_en_language_mua','Zend_Locale'),('Zend_LocaleC_en_language_mua_CM','Zend_Locale'),('Zend_LocaleC_en_language_my','Zend_Locale'),('Zend_LocaleC_en_language_my_MM','Zend_Locale'),('Zend_LocaleC_en_territory_MM','Zend_Locale'),('Zend_LocaleC_en_language_naq','Zend_Locale'),('Zend_LocaleC_en_language_naq_NA','Zend_Locale'),('Zend_LocaleC_en_language_nb','Zend_Locale'),('Zend_LocaleC_en_language_nb_NO','Zend_Locale'),('Zend_LocaleC_en_territory_NO','Zend_Locale'),('Zend_LocaleC_en_language_nb_SJ','Zend_Locale'),('Zend_LocaleC_en_territory_SJ','Zend_Locale'),('Zend_LocaleC_en_language_nd','Zend_Locale'),('Zend_LocaleC_en_language_nd_ZW','Zend_Locale'),('Zend_LocaleC_en_language_ne','Zend_Locale'),('Zend_LocaleC_en_language_ne_IN','Zend_Locale'),('Zend_LocaleC_en_language_ne_NP','Zend_Locale'),('Zend_LocaleC_en_territory_NP','Zend_Locale'),('Zend_LocaleC_en_language_nl','Zend_Locale'),('Zend_LocaleC_en_language_nl_AW','Zend_Locale'),('Zend_LocaleC_en_territory_AW','Zend_Locale'),('Zend_LocaleC_en_language_nl_BE','Zend_Locale'),('Zend_LocaleC_en_language_nl_BQ','Zend_Locale'),('Zend_LocaleC_en_territory_BQ','Zend_Locale'),('Zend_LocaleC_en_language_nl_CW','Zend_Locale'),('Zend_LocaleC_en_territory_CW','Zend_Locale'),('Zend_LocaleC_en_language_nl_NL','Zend_Locale'),('Zend_LocaleC_en_language_nl_SR','Zend_Locale'),('Zend_LocaleC_en_territory_SR','Zend_Locale'),('Zend_LocaleC_en_language_nl_SX','Zend_Locale'),('Zend_LocaleC_en_language_nmg','Zend_Locale'),('Zend_LocaleC_en_language_nmg_CM','Zend_Locale'),('Zend_LocaleC_en_language_nn','Zend_Locale'),('Zend_LocaleC_en_language_nn_NO','Zend_Locale'),('Zend_LocaleC_en_language_nnh','Zend_Locale'),('Zend_LocaleC_en_language_nnh_CM','Zend_Locale'),('Zend_LocaleC_en_language_nr','Zend_Locale'),('Zend_LocaleC_en_language_nr_ZA','Zend_Locale'),('Zend_LocaleC_en_language_nso','Zend_Locale'),('Zend_LocaleC_en_language_nso_ZA','Zend_Locale'),('Zend_LocaleC_en_language_nus','Zend_Locale'),('Zend_LocaleC_en_language_nus_SD','Zend_Locale'),('Zend_LocaleC_en_language_nyn','Zend_Locale'),('Zend_LocaleC_en_language_nyn_UG','Zend_Locale'),('Zend_LocaleC_en_language_om','Zend_Locale'),('Zend_LocaleC_en_language_om_ET','Zend_Locale'),('Zend_LocaleC_en_language_om_KE','Zend_Locale'),('Zend_LocaleC_en_language_or','Zend_Locale'),('Zend_LocaleC_en_language_or_IN','Zend_Locale'),('Zend_LocaleC_en_language_ordinals','Zend_Locale'),('Zend_LocaleC_en_language_root','Zend_Locale'),('Zend_LocaleC_en_language_os','Zend_Locale'),('Zend_LocaleC_en_language_os_GE','Zend_Locale'),('Zend_LocaleC_en_language_os_RU','Zend_Locale'),('Zend_LocaleC_en_territory_RU','Zend_Locale'),('Zend_LocaleC_en_language_pa','Zend_Locale'),('Zend_LocaleC_en_language_pa_Arab','Zend_Locale'),('Zend_LocaleC_en_language_pa_Arab_PK','Zend_Locale'),('Zend_LocaleC_en_language_pa_Guru','Zend_Locale'),('Zend_LocaleC_en_language_pa_Guru_IN','Zend_Locale'),('Zend_LocaleC_en_language_pl','Zend_Locale'),('Zend_LocaleC_en_language_pl_PL','Zend_Locale'),('Zend_LocaleC_en_territory_PL','Zend_Locale'),('Zend_LocaleC_en_language_plurals','Zend_Locale'),('Zend_LocaleC_en_language_ps','Zend_Locale'),('Zend_LocaleC_en_language_ps_AF','Zend_Locale'),('Zend_LocaleC_en_language_pt','Zend_Locale'),('Zend_LocaleC_en_language_pt_AO','Zend_Locale'),('Zend_LocaleC_en_language_pt_BR','Zend_Locale'),('Zend_LocaleC_en_language_pt_CV','Zend_Locale'),('Zend_LocaleC_en_language_pt_GW','Zend_Locale'),('Zend_LocaleC_en_territory_GW','Zend_Locale'),('Zend_LocaleC_en_language_pt_MO','Zend_Locale'),('Zend_LocaleC_en_language_pt_MZ','Zend_Locale'),('Zend_LocaleC_en_language_pt_PT','Zend_Locale'),('Zend_LocaleC_en_language_pt_ST','Zend_Locale'),('Zend_LocaleC_en_territory_ST','Zend_Locale'),('Zend_LocaleC_en_language_pt_TL','Zend_Locale'),('Zend_LocaleC_en_territory_TL','Zend_Locale'),('Zend_LocaleC_en_language_rm','Zend_Locale'),('Zend_LocaleC_en_language_rm_CH','Zend_Locale'),('Zend_LocaleC_en_language_rn','Zend_Locale'),('Zend_LocaleC_en_language_rn_BI','Zend_Locale'),('Zend_LocaleC_en_language_ro','Zend_Locale'),('Zend_LocaleC_en_language_ro_MD','Zend_Locale'),('Zend_LocaleC_en_language_ro_RO','Zend_Locale'),('Zend_LocaleC_en_territory_RO','Zend_Locale'),('Zend_LocaleC_en_language_rof','Zend_Locale'),('Zend_LocaleC_en_language_rof_TZ','Zend_Locale'),('Zend_LocaleC_en_language_ru','Zend_Locale'),('Zend_LocaleC_en_language_ru_BY','Zend_Locale'),('Zend_LocaleC_en_language_ru_KG','Zend_Locale'),('Zend_LocaleC_en_territory_KG','Zend_Locale'),('Zend_LocaleC_en_language_ru_KZ','Zend_Locale'),('Zend_LocaleC_en_language_ru_MD','Zend_Locale'),('Zend_LocaleC_en_territory_MD','Zend_Locale'),('Zend_LocaleC_en_language_ru_RU','Zend_Locale'),('Zend_LocaleC_en_language_ru_UA','Zend_Locale'),('Zend_LocaleC_en_territory_UA','Zend_Locale'),('Zend_LocaleC_en_language_rw','Zend_Locale'),('Zend_LocaleC_en_language_rw_RW','Zend_Locale'),('Zend_LocaleC_en_language_rwk','Zend_Locale'),('Zend_LocaleC_en_language_rwk_TZ','Zend_Locale'),('Zend_LocaleC_en_language_sah','Zend_Locale'),('Zend_LocaleC_en_language_sah_RU','Zend_Locale'),('Zend_LocaleC_en_language_saq','Zend_Locale'),('Zend_LocaleC_en_language_saq_KE','Zend_Locale'),('Zend_LocaleC_en_language_sbp','Zend_Locale'),('Zend_LocaleC_en_language_sbp_TZ','Zend_Locale'),('Zend_LocaleC_en_language_se','Zend_Locale'),('Zend_LocaleC_en_language_se_FI','Zend_Locale'),('Zend_LocaleC_en_language_se_NO','Zend_Locale'),('Zend_LocaleC_en_language_seh','Zend_Locale'),('Zend_LocaleC_en_language_seh_MZ','Zend_Locale'),('Zend_LocaleC_en_language_ses','Zend_Locale'),('Zend_LocaleC_en_language_ses_ML','Zend_Locale'),('Zend_LocaleC_en_language_sg','Zend_Locale'),('Zend_LocaleC_en_language_sg_CF','Zend_Locale'),('Zend_LocaleC_en_language_shi','Zend_Locale'),('Zend_LocaleC_en_language_shi_Latn','Zend_Locale'),('Zend_LocaleC_en_language_shi_Latn_MA','Zend_Locale'),('Zend_LocaleC_en_language_shi_Tfng','Zend_Locale'),('Zend_LocaleC_en_language_shi_Tfng_MA','Zend_Locale'),('Zend_LocaleC_en_language_si','Zend_Locale'),('Zend_LocaleC_en_language_si_LK','Zend_Locale'),('Zend_LocaleC_en_territory_LK','Zend_Locale'),('Zend_LocaleC_en_language_sk','Zend_Locale'),('Zend_LocaleC_en_language_sk_SK','Zend_Locale'),('Zend_LocaleC_en_territory_SK','Zend_Locale'),('Zend_LocaleC_en_language_sl','Zend_Locale'),('Zend_LocaleC_en_language_sl_SI','Zend_Locale'),('Zend_LocaleC_en_territory_SI','Zend_Locale'),('Zend_LocaleC_en_language_sn','Zend_Locale'),('Zend_LocaleC_en_language_sn_ZW','Zend_Locale'),('Zend_LocaleC_en_language_so','Zend_Locale'),('Zend_LocaleC_en_language_so_DJ','Zend_Locale'),('Zend_LocaleC_en_language_so_ET','Zend_Locale'),('Zend_LocaleC_en_language_so_KE','Zend_Locale'),('Zend_LocaleC_en_language_so_SO','Zend_Locale'),('Zend_LocaleC_en_language_sq','Zend_Locale'),('Zend_LocaleC_en_language_sq_AL','Zend_Locale'),('Zend_LocaleC_en_territory_AL','Zend_Locale'),('Zend_LocaleC_en_language_sq_MK','Zend_Locale'),('Zend_LocaleC_en_language_sq_XK','Zend_Locale'),('Zend_LocaleC_en_territory_XK','Zend_Locale'),('Zend_LocaleC_en_language_sr','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_BA','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_ME','Zend_Locale'),('Zend_LocaleC_en_territory_ME','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_RS','Zend_Locale'),('Zend_LocaleC_en_territory_RS','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_XK','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_BA','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_ME','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_RS','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_XK','Zend_Locale'),('Zend_LocaleC_en_language_ss','Zend_Locale'),('Zend_LocaleC_en_language_ss_SZ','Zend_Locale'),('Zend_LocaleC_en_language_ss_ZA','Zend_Locale'),('Zend_LocaleC_en_language_ssy','Zend_Locale'),('Zend_LocaleC_en_language_ssy_ER','Zend_Locale'),('Zend_LocaleC_en_language_st','Zend_Locale'),('Zend_LocaleC_en_language_st_LS','Zend_Locale'),('Zend_LocaleC_en_language_st_ZA','Zend_Locale'),('Zend_LocaleC_en_language_sv','Zend_Locale'),('Zend_LocaleC_en_language_sv_AX','Zend_Locale'),('Zend_LocaleC_en_territory_AX','Zend_Locale'),('Zend_LocaleC_en_language_sv_FI','Zend_Locale'),('Zend_LocaleC_en_language_sv_SE','Zend_Locale'),('Zend_LocaleC_en_territory_SE','Zend_Locale'),('Zend_LocaleC_en_language_sw','Zend_Locale'),('Zend_LocaleC_en_language_sw_KE','Zend_Locale'),('Zend_LocaleC_en_language_sw_TZ','Zend_Locale'),('Zend_LocaleC_en_language_sw_UG','Zend_Locale'),('Zend_LocaleC_en_language_swc','Zend_Locale'),('Zend_LocaleC_en_language_swc_CD','Zend_Locale'),('Zend_LocaleC_en_language_ta','Zend_Locale'),('Zend_LocaleC_en_language_ta_IN','Zend_Locale'),('Zend_LocaleC_en_language_ta_LK','Zend_Locale'),('Zend_LocaleC_en_language_ta_MY','Zend_Locale'),('Zend_LocaleC_en_language_ta_SG','Zend_Locale'),('Zend_LocaleC_en_language_te','Zend_Locale'),('Zend_LocaleC_en_language_te_IN','Zend_Locale'),('Zend_LocaleC_en_language_teo','Zend_Locale'),('Zend_LocaleC_en_language_teo_KE','Zend_Locale'),('Zend_LocaleC_en_language_teo_UG','Zend_Locale'),('Zend_LocaleC_en_language_tg','Zend_Locale'),('Zend_LocaleC_en_language_tg_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_tg_Cyrl_TJ','Zend_Locale'),('Zend_LocaleC_en_territory_TJ','Zend_Locale'),('Zend_LocaleC_en_language_th','Zend_Locale'),('Zend_LocaleC_en_language_th_TH','Zend_Locale'),('Zend_LocaleC_en_territory_TH','Zend_Locale'),('Zend_LocaleC_en_language_ti','Zend_Locale'),('Zend_LocaleC_en_language_ti_ER','Zend_Locale'),('Zend_LocaleC_en_language_ti_ET','Zend_Locale'),('Zend_LocaleC_en_language_tig','Zend_Locale'),('Zend_LocaleC_en_language_tig_ER','Zend_Locale'),('Zend_LocaleC_en_language_tn','Zend_Locale'),('Zend_LocaleC_en_language_tn_BW','Zend_Locale'),('Zend_LocaleC_en_language_tn_ZA','Zend_Locale'),('Zend_LocaleC_en_language_to','Zend_Locale'),('Zend_LocaleC_en_language_to_TO','Zend_Locale'),('Zend_LocaleC_en_language_tr','Zend_Locale'),('Zend_LocaleC_en_language_tr_CY','Zend_Locale'),('Zend_LocaleC_en_language_tr_TR','Zend_Locale'),('Zend_LocaleC_en_territory_TR','Zend_Locale'),('Zend_LocaleC_en_language_ts','Zend_Locale'),('Zend_LocaleC_en_language_ts_ZA','Zend_Locale'),('Zend_LocaleC_en_language_twq','Zend_Locale'),('Zend_LocaleC_en_language_twq_NE','Zend_Locale'),('Zend_LocaleC_en_language_tzm','Zend_Locale'),('Zend_LocaleC_en_language_tzm_Latn','Zend_Locale'),('Zend_LocaleC_en_language_tzm_Latn_MA','Zend_Locale'),('Zend_LocaleC_en_language_ug','Zend_Locale'),('Zend_LocaleC_en_language_ug_Arab','Zend_Locale'),('Zend_LocaleC_en_language_ug_Arab_CN','Zend_Locale'),('Zend_LocaleC_en_language_uk','Zend_Locale'),('Zend_LocaleC_en_language_uk_UA','Zend_Locale'),('Zend_LocaleC_en_language_ur','Zend_Locale'),('Zend_LocaleC_en_language_ur_IN','Zend_Locale'),('Zend_LocaleC_en_language_ur_PK','Zend_Locale'),('Zend_LocaleC_en_language_uz','Zend_Locale'),('Zend_LocaleC_en_language_uz_Arab','Zend_Locale'),('Zend_LocaleC_en_language_uz_Arab_AF','Zend_Locale'),('Zend_LocaleC_en_language_uz_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_uz_Cyrl_UZ','Zend_Locale'),('Zend_LocaleC_en_territory_UZ','Zend_Locale'),('Zend_LocaleC_en_language_uz_Latn','Zend_Locale'),('Zend_LocaleC_en_language_uz_Latn_UZ','Zend_Locale'),('Zend_LocaleC_en_language_vai','Zend_Locale'),('Zend_LocaleC_en_language_vai_Latn','Zend_Locale'),('Zend_LocaleC_en_language_vai_Latn_LR','Zend_Locale'),('Zend_LocaleC_en_language_vai_Vaii','Zend_Locale'),('Zend_LocaleC_en_language_vai_Vaii_LR','Zend_Locale'),('Zend_LocaleC_en_language_ve','Zend_Locale'),('Zend_LocaleC_en_language_ve_ZA','Zend_Locale'),('Zend_LocaleC_en_language_vi','Zend_Locale'),('Zend_LocaleC_en_language_vi_VN','Zend_Locale'),('Zend_LocaleC_en_territory_VN','Zend_Locale'),('Zend_LocaleC_en_language_vo','Zend_Locale'),('Zend_LocaleC_en_language_vo_001','Zend_Locale'),('Zend_LocaleC_en_language_vun','Zend_Locale'),('Zend_LocaleC_en_language_vun_TZ','Zend_Locale'),('Zend_LocaleC_en_language_wae','Zend_Locale'),('Zend_LocaleC_en_language_wae_CH','Zend_Locale'),('Zend_LocaleC_en_language_wal','Zend_Locale'),('Zend_LocaleC_en_language_wal_ET','Zend_Locale'),('Zend_LocaleC_en_language_xh','Zend_Locale'),('Zend_LocaleC_en_language_xh_ZA','Zend_Locale'),('Zend_LocaleC_en_language_xog','Zend_Locale'),('Zend_LocaleC_en_language_xog_UG','Zend_Locale'),('Zend_LocaleC_en_language_yav','Zend_Locale'),('Zend_LocaleC_en_language_yav_CM','Zend_Locale'),('Zend_LocaleC_en_language_yo','Zend_Locale'),('Zend_LocaleC_en_language_yo_BJ','Zend_Locale'),('Zend_LocaleC_en_language_yo_NG','Zend_Locale'),('Zend_LocaleC_en_language_zgh','Zend_Locale'),('Zend_LocaleC_en_language_zgh_MA','Zend_Locale'),('Zend_LocaleC_en_language_zh','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_CN','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_HK','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_MO','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_SG','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant_HK','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant_MO','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant_TW','Zend_Locale'),('Zend_LocaleC_en_territory_TW','Zend_Locale'),('Zend_LocaleC_en_language_zu','Zend_Locale'),('Zend_LocaleC_en_language_zu_ZA','Zend_Locale'),('Zend_LocaleC_en_language_az_AZ','Zend_Locale'),('Zend_LocaleC_en_language_bs_BA','Zend_Locale'),('Zend_LocaleC_en_language_ha_GH','Zend_Locale'),('Zend_LocaleC_en_language_ha_NE','Zend_Locale'),('Zend_LocaleC_en_language_ha_NG','Zend_Locale'),('Zend_LocaleC_en_language_kk_KZ','Zend_Locale'),('Zend_LocaleC_en_language_ks_IN','Zend_Locale'),('Zend_LocaleC_en_language_mn_MN','Zend_Locale'),('Zend_LocaleC_en_language_ms_BN','Zend_Locale'),('Zend_LocaleC_en_language_ms_MY','Zend_Locale'),('Zend_LocaleC_en_language_ms_SG','Zend_Locale'),('Zend_LocaleC_en_language_pa_IN','Zend_Locale'),('Zend_LocaleC_en_language_pa_PK','Zend_Locale'),('Zend_LocaleC_en_language_shi_MA','Zend_Locale'),('Zend_LocaleC_en_language_sr_BA','Zend_Locale'),('Zend_LocaleC_en_language_sr_ME','Zend_Locale'),('Zend_LocaleC_en_language_sr_RS','Zend_Locale'),('Zend_LocaleC_en_language_sr_XK','Zend_Locale'),('Zend_LocaleC_en_language_tg_TJ','Zend_Locale'),('Zend_LocaleC_en_language_tzm_MA','Zend_Locale'),('Zend_LocaleC_en_language_uz_AF','Zend_Locale'),('Zend_LocaleC_en_language_uz_UZ','Zend_Locale'),('Zend_LocaleC_en_language_vai_LR','Zend_Locale'),('Zend_LocaleC_en_language_zh_CN','Zend_Locale'),('Zend_LocaleC_en_language_zh_HK','Zend_Locale'),('Zend_LocaleC_en_language_zh_MO','Zend_Locale'),('Zend_LocaleC_en_language_zh_SG','Zend_Locale'),('Zend_LocaleC_en_language_zh_TW','Zend_Locale'),('pimcore_document_1','document_1'),('pimcore_asset_1','asset_1'),('pimcore_object_1','object_1');
/*!40000 ALTER TABLE `cache_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `allowInherit` tinyint(1) unsigned DEFAULT '0',
  `allowVariants` tinyint(1) unsigned DEFAULT '0',
  `parentClass` varchar(255) DEFAULT NULL,
  `useTraits` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `propertyVisibility` text,
  `showVariants` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'person','',1441893361,1441893414,2,2,0,0,'','','','','a:2:{s:4:\"grid\";a:5:{s:2:\"id\";b:1;s:4:\"path\";b:1;s:9:\"published\";b:1;s:16:\"modificationDate\";b:1;s:12:\"creationDate\";b:1;}s:6:\"search\";a:5:{s:2:\"id\";b:1;s:4:\"path\";b:1;s:9:\"published\";b:1;s:16:\"modificationDate\";b:1;s:12:\"creationDate\";b:1;}}',0);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_layouts`
--

DROP TABLE IF EXISTS `custom_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_layouts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classId` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `default` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_layouts`
--

LOCK TABLES `custom_layouts` WRITE;
/*!40000 ALTER TABLE `custom_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS `dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencies` (
  `sourcetype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `sourceid` int(11) unsigned NOT NULL DEFAULT '0',
  `targettype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `targetid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sourcetype`,`sourceid`,`targetid`,`targettype`),
  KEY `sourceid` (`sourceid`),
  KEY `targetid` (`targetid`),
  KEY `sourcetype` (`sourcetype`),
  KEY `targettype` (`targettype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencies`
--

LOCK TABLES `dependencies` WRITE;
/*!40000 ALTER TABLE `dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` enum('page','link','snippet','folder','hardlink','email') DEFAULT NULL,
  `key` varchar(255) DEFAULT '',
  `path` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `index` int(11) unsigned DEFAULT '0',
  `published` tinyint(1) unsigned DEFAULT '1',
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`key`),
  KEY `parentId` (`parentId`),
  KEY `key` (`key`),
  KEY `path` (`path`),
  KEY `published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,0,'page','','/',999999,1,1441893344,1441893344,1,1);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_doctypes`
--

DROP TABLE IF EXISTS `documents_doctypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_doctypes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `type` enum('page','snippet','email') DEFAULT NULL,
  `priority` int(3) DEFAULT '0',
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_doctypes`
--

LOCK TABLES `documents_doctypes` WRITE;
/*!40000 ALTER TABLE `documents_doctypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_doctypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_elements`
--

DROP TABLE IF EXISTS `documents_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_elements` (
  `documentId` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`documentId`,`name`),
  KEY `documentId` (`documentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_elements`
--

LOCK TABLES `documents_elements` WRITE;
/*!40000 ALTER TABLE `documents_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_email`
--

DROP TABLE IF EXISTS `documents_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_email` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_email`
--

LOCK TABLES `documents_email` WRITE;
/*!40000 ALTER TABLE `documents_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_hardlink`
--

DROP TABLE IF EXISTS `documents_hardlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_hardlink` (
  `id` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `propertiesFromSource` tinyint(1) DEFAULT NULL,
  `childsFromSource` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_hardlink`
--

LOCK TABLES `documents_hardlink` WRITE;
/*!40000 ALTER TABLE `documents_hardlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_hardlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_link`
--

DROP TABLE IF EXISTS `documents_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_link` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `internalType` enum('document','asset') DEFAULT NULL,
  `internal` int(11) unsigned DEFAULT NULL,
  `direct` varchar(1000) DEFAULT NULL,
  `linktype` enum('direct','internal') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_link`
--

LOCK TABLES `documents_link` WRITE;
/*!40000 ALTER TABLE `documents_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_page`
--

DROP TABLE IF EXISTS `documents_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_page` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `metaData` text,
  `prettyUrl` varchar(255) DEFAULT NULL,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  `css` longtext,
  `personas` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prettyUrl` (`prettyUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_page`
--

LOCK TABLES `documents_page` WRITE;
/*!40000 ALTER TABLE `documents_page` DISABLE KEYS */;
INSERT INTO `documents_page` VALUES (1,NULL,'','','','','','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `documents_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_snippet`
--

DROP TABLE IF EXISTS `documents_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_snippet` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_snippet`
--

LOCK TABLES `documents_snippet` WRITE;
/*!40000 ALTER TABLE `documents_snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_lock`
--

DROP TABLE IF EXISTS `edit_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit_lock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `sessionId` varchar(255) DEFAULT NULL,
  `date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `cidtype` (`cid`,`ctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_lock`
--

LOCK TABLES `edit_lock` WRITE;
/*!40000 ALTER TABLE `edit_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_blacklist`
--

DROP TABLE IF EXISTS `email_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_blacklist` (
  `address` varchar(255) NOT NULL DEFAULT '',
  `creationDate` int(11) unsigned DEFAULT NULL,
  `modificationDate` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_blacklist`
--

LOCK TABLES `email_blacklist` WRITE;
/*!40000 ALTER TABLE `email_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentId` int(11) DEFAULT NULL,
  `requestUri` varchar(500) DEFAULT NULL,
  `params` text,
  `from` varchar(500) DEFAULT NULL,
  `to` longtext,
  `cc` longtext,
  `bcc` longtext,
  `sentDate` bigint(20) DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary`
--

DROP TABLE IF EXISTS `glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(10) DEFAULT NULL,
  `casesensitive` tinyint(1) DEFAULT NULL,
  `exactmatch` tinyint(1) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `site` int(11) unsigned DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `language` (`language`),
  KEY `site` (`site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary`
--

LOCK TABLES `glossary` WRITE;
/*!40000 ALTER TABLE `glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `http_error_log`
--

DROP TABLE IF EXISTS `http_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `http_error_log` (
  `uri` varchar(3000) CHARACTER SET ascii DEFAULT NULL,
  `code` int(3) DEFAULT NULL,
  `parametersGet` longtext,
  `parametersPost` longtext,
  `cookies` longtext,
  `serverVars` longtext,
  `date` bigint(20) DEFAULT NULL,
  `count` bigint(20) DEFAULT NULL,
  KEY `uri` (`uri`(765)),
  KEY `code` (`code`),
  KEY `date` (`date`),
  KEY `count` (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `http_error_log`
--

LOCK TABLES `http_error_log` WRITE;
/*!40000 ALTER TABLE `http_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `http_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyvalue_groups`
--

DROP TABLE IF EXISTS `keyvalue_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyvalue_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyvalue_groups`
--

LOCK TABLES `keyvalue_groups` WRITE;
/*!40000 ALTER TABLE `keyvalue_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyvalue_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyvalue_keys`
--

DROP TABLE IF EXISTS `keyvalue_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyvalue_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `type` enum('bool','number','select','text','translated','translatedSelect','range') DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `possiblevalues` text,
  `group` int(11) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  `translator` int(11) DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  CONSTRAINT `keyvalue_keys_ibfk_1` FOREIGN KEY (`group`) REFERENCES `keyvalue_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyvalue_keys`
--

LOCK TABLES `keyvalue_keys` WRITE;
/*!40000 ALTER TABLE `keyvalue_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyvalue_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyvalue_translator_configuration`
--

DROP TABLE IF EXISTS `keyvalue_translator_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyvalue_translator_configuration` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `translator` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyvalue_translator_configuration`
--

LOCK TABLES `keyvalue_translator_configuration` WRITE;
/*!40000 ALTER TABLE `keyvalue_translator_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyvalue_translator_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locks` (
  `id` varchar(150) NOT NULL DEFAULT '',
  `date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locks`
--

LOCK TABLES `locks` WRITE;
/*!40000 ALTER TABLE `locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `ctype` enum('asset','document','object') DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_data`
--

DROP TABLE IF EXISTS `notes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes_data` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `type` enum('text','date','document','asset','object','bool') DEFAULT NULL,
  `data` text,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_data`
--

LOCK TABLES `notes_data` WRITE;
/*!40000 ALTER TABLE `notes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `object_1`
--

DROP TABLE IF EXISTS `object_1`;
/*!50001 DROP VIEW IF EXISTS `object_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `object_1` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `object_query_1`
--

DROP TABLE IF EXISTS `object_query_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_query_1` (
  `oo_id` int(11) NOT NULL DEFAULT '0',
  `oo_classId` int(11) DEFAULT '1',
  `oo_className` varchar(255) DEFAULT 'person',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_1`
--

LOCK TABLES `object_query_1` WRITE;
/*!40000 ALTER TABLE `object_query_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_query_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_1`
--

DROP TABLE IF EXISTS `object_relations_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_relations_1` (
  `src_id` int(11) NOT NULL DEFAULT '0',
  `dest_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int(11) unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`src_id`,`dest_id`,`ownertype`,`ownername`,`fieldname`,`type`,`position`),
  KEY `index` (`index`),
  KEY `src_id` (`src_id`),
  KEY `dest_id` (`dest_id`),
  KEY `fieldname` (`fieldname`),
  KEY `position` (`position`),
  KEY `ownertype` (`ownertype`),
  KEY `type` (`type`),
  KEY `ownername` (`ownername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_1`
--

LOCK TABLES `object_relations_1` WRITE;
/*!40000 ALTER TABLE `object_relations_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_1`
--

DROP TABLE IF EXISTS `object_store_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_store_1` (
  `oo_id` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_1`
--

LOCK TABLES `object_store_1` WRITE;
/*!40000 ALTER TABLE `object_store_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_store_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objects` (
  `o_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `o_parentId` int(11) unsigned DEFAULT NULL,
  `o_type` enum('object','folder','variant') DEFAULT NULL,
  `o_key` varchar(255) DEFAULT '',
  `o_path` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `o_index` int(11) unsigned DEFAULT '0',
  `o_published` tinyint(1) unsigned DEFAULT '1',
  `o_creationDate` bigint(20) unsigned DEFAULT NULL,
  `o_modificationDate` bigint(20) unsigned DEFAULT NULL,
  `o_userOwner` int(11) unsigned DEFAULT NULL,
  `o_userModification` int(11) unsigned DEFAULT NULL,
  `o_classId` int(11) unsigned DEFAULT NULL,
  `o_className` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  UNIQUE KEY `fullpath` (`o_path`,`o_key`),
  KEY `key` (`o_key`),
  KEY `path` (`o_path`),
  KEY `published` (`o_published`),
  KEY `parentId` (`o_parentId`),
  KEY `type` (`o_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,0,'folder','','/',999999,1,1441893344,1441893344,1,1,NULL,NULL);
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` enum('text','date','document','asset','object','bool','select') DEFAULT NULL,
  `data` text,
  `inheritable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`cid`,`ctype`,`name`),
  KEY `cpath` (`cpath`),
  KEY `inheritable` (`inheritable`),
  KEY `ctype` (`ctype`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties_predefined`
--

DROP TABLE IF EXISTS `properties_predefined`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties_predefined` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `description` text,
  `key` varchar(255) DEFAULT NULL,
  `type` enum('text','document','asset','bool','select','object') DEFAULT NULL,
  `data` text,
  `config` text,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `inheritable` tinyint(1) unsigned DEFAULT '0',
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `id` (`id`),
  KEY `key` (`key`),
  KEY `type` (`type`),
  KEY `ctype` (`ctype`),
  KEY `inheritable` (`inheritable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties_predefined`
--

LOCK TABLES `properties_predefined` WRITE;
/*!40000 ALTER TABLE `properties_predefined` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties_predefined` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recyclebin`
--

DROP TABLE IF EXISTS `recyclebin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recyclebin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `path` varchar(765) DEFAULT NULL,
  `amount` int(3) DEFAULT NULL,
  `date` bigint(20) DEFAULT NULL,
  `deletedby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recyclebin`
--

LOCK TABLES `recyclebin` WRITE;
/*!40000 ALTER TABLE `recyclebin` DISABLE KEYS */;
/*!40000 ALTER TABLE `recyclebin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirects`
--

DROP TABLE IF EXISTS `redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `sourceEntireUrl` tinyint(1) DEFAULT NULL,
  `sourceSite` int(11) DEFAULT NULL,
  `passThroughParameters` tinyint(1) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `targetSite` int(11) DEFAULT NULL,
  `statusCode` varchar(3) DEFAULT NULL,
  `priority` int(2) DEFAULT '0',
  `expiry` bigint(20) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirects`
--

LOCK TABLES `redirects` WRITE;
/*!40000 ALTER TABLE `redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanitycheck`
--

DROP TABLE IF EXISTS `sanitycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanitycheck` (
  `id` int(11) unsigned NOT NULL,
  `type` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanitycheck`
--

LOCK TABLES `sanitycheck` WRITE;
/*!40000 ALTER TABLE `sanitycheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanitycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_tasks`
--

DROP TABLE IF EXISTS `schedule_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_tasks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `date` bigint(20) unsigned DEFAULT NULL,
  `action` enum('publish','unpublish','delete','publish-version') DEFAULT NULL,
  `version` bigint(20) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_tasks`
--

LOCK TABLES `schedule_tasks` WRITE;
/*!40000 ALTER TABLE `schedule_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_backend_data`
--

DROP TABLE IF EXISTS `search_backend_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_backend_data` (
  `id` int(11) NOT NULL,
  `fullpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `maintype` varchar(8) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(255) DEFAULT NULL,
  `published` bigint(20) DEFAULT NULL,
  `creationDate` bigint(20) DEFAULT NULL,
  `modificationDate` bigint(20) DEFAULT NULL,
  `userOwner` int(11) DEFAULT NULL,
  `userModification` int(11) DEFAULT NULL,
  `data` longtext,
  `properties` text,
  PRIMARY KEY (`id`,`maintype`),
  KEY `id` (`id`),
  KEY `fullpath` (`fullpath`),
  KEY `maintype` (`maintype`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`),
  KEY `published` (`published`),
  FULLTEXT KEY `data` (`data`),
  FULLTEXT KEY `properties` (`properties`),
  FULLTEXT KEY `fulltext` (`data`,`properties`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_backend_data`
--

LOCK TABLES `search_backend_data` WRITE;
/*!40000 ALTER TABLE `search_backend_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_backend_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mainDomain` varchar(255) DEFAULT NULL,
  `domains` text,
  `rootId` int(11) unsigned DEFAULT NULL,
  `errorDocument` varchar(255) DEFAULT NULL,
  `redirectToMainDomain` tinyint(1) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rootId` (`rootId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staticroutes`
--

DROP TABLE IF EXISTS `staticroutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staticroutes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  `reverse` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `variables` varchar(255) DEFAULT NULL,
  `defaults` varchar(255) DEFAULT NULL,
  `siteId` int(11) DEFAULT NULL,
  `priority` int(3) DEFAULT '0',
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staticroutes`
--

LOCK TABLES `staticroutes` WRITE;
/*!40000 ALTER TABLE `staticroutes` DISABLE KEYS */;
/*!40000 ALTER TABLE `staticroutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_personas`
--

DROP TABLE IF EXISTS `targeting_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targeting_personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `conditions` longtext,
  `threshold` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_personas`
--

LOCK TABLES `targeting_personas` WRITE;
/*!40000 ALTER TABLE `targeting_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_rules`
--

DROP TABLE IF EXISTS `targeting_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targeting_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `scope` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `conditions` longtext,
  `actions` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_rules`
--

LOCK TABLES `targeting_rules` WRITE;
/*!40000 ALTER TABLE `targeting_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_store`
--

DROP TABLE IF EXISTS `tmp_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_store` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `tag` varchar(255) DEFAULT NULL,
  `data` longtext,
  `serialized` tinyint(2) NOT NULL DEFAULT '0',
  `date` int(10) DEFAULT NULL,
  `expiryDate` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`),
  KEY `date` (`date`),
  KEY `expiryDate` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_store`
--

LOCK TABLES `tmp_store` WRITE;
/*!40000 ALTER TABLE `tmp_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_events`
--

DROP TABLE IF EXISTS `tracking_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) unsigned DEFAULT NULL,
  `year` int(5) unsigned DEFAULT NULL,
  `month` int(2) unsigned DEFAULT NULL,
  `day` int(2) unsigned DEFAULT NULL,
  `dayOfWeek` int(1) unsigned DEFAULT NULL,
  `dayOfYear` int(3) unsigned DEFAULT NULL,
  `weekOfYear` int(2) unsigned DEFAULT NULL,
  `hour` int(2) unsigned DEFAULT NULL,
  `minute` int(2) unsigned DEFAULT NULL,
  `second` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `day` (`day`),
  KEY `dayOfWeek` (`dayOfWeek`),
  KEY `dayOfYear` (`dayOfYear`),
  KEY `weekOfYear` (`weekOfYear`),
  KEY `hour` (`hour`),
  KEY `minute` (`minute`),
  KEY `second` (`second`),
  KEY `category` (`category`),
  KEY `action` (`action`),
  KEY `label` (`label`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_events`
--

LOCK TABLES `tracking_events` WRITE;
/*!40000 ALTER TABLE `tracking_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_admin`
--

DROP TABLE IF EXISTS `translations_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations_admin` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_admin`
--

LOCK TABLES `translations_admin` WRITE;
/*!40000 ALTER TABLE `translations_admin` DISABLE KEYS */;
INSERT INTO `translations_admin` VALUES ('person','en','',1441893381,1441893381);
/*!40000 ALTER TABLE `translations_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_website`
--

DROP TABLE IF EXISTS `translations_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations_website` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_website`
--

LOCK TABLES `translations_website` WRITE;
/*!40000 ALTER TABLE `translations_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_locks`
--

DROP TABLE IF EXISTS `tree_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tree_locks` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` enum('asset','document','object') NOT NULL DEFAULT 'asset',
  `locked` enum('self','propagate') DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `id` (`id`),
  KEY `type` (`type`),
  KEY `locked` (`locked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_locks`
--

LOCK TABLES `tree_locks` WRITE;
/*!40000 ALTER TABLE `tree_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tree_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` enum('user','userfolder','role','rolefolder') NOT NULL DEFAULT 'user',
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `admin` tinyint(1) unsigned DEFAULT '0',
  `active` tinyint(1) unsigned DEFAULT '1',
  `permissions` varchar(1000) DEFAULT NULL,
  `roles` varchar(1000) DEFAULT NULL,
  `welcomescreen` tinyint(1) DEFAULT NULL,
  `closeWarning` tinyint(1) DEFAULT NULL,
  `memorizeTabs` tinyint(1) DEFAULT NULL,
  `docTypes` varchar(255) DEFAULT NULL,
  `classes` varchar(255) DEFAULT NULL,
  `apiKey` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type`,`name`),
  KEY `parentId` (`parentId`),
  KEY `name` (`name`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,0,'user','system',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,0,'user','admin','$2y$10$5vdTQbzU7bHA.hV9IeabJ.UGslkjNSvdSRhfmwvv6jeRIcczUlHFu',NULL,NULL,NULL,'en',1,1,'','',0,1,1,'','',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_permission_definitions`
--

DROP TABLE IF EXISTS `users_permission_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_permission_definitions` (
  `key` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_permission_definitions`
--

LOCK TABLES `users_permission_definitions` WRITE;
/*!40000 ALTER TABLE `users_permission_definitions` DISABLE KEYS */;
INSERT INTO `users_permission_definitions` VALUES ('assets'),('backup'),('classes'),('clear_cache'),('clear_temp_files'),('dashboards'),('documents'),('document_style_editor'),('document_types'),('emails'),('glossary'),('http_errors'),('newsletter'),('notes_events'),('objects'),('plugins'),('predefined_properties'),('qr_codes'),('recyclebin'),('redirects'),('reports'),('robots.txt'),('routes'),('seemode'),('sent_emails'),('seo_document_editor'),('system_settings'),('tag_snippet_management'),('targeting'),('thumbnails'),('translations'),('users'),('website_settings');
/*!40000 ALTER TABLE `users_permission_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_asset`
--

DROP TABLE IF EXISTS `users_workspaces_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_workspaces_asset` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `list` tinyint(1) DEFAULT '0',
  `view` tinyint(1) DEFAULT '0',
  `publish` tinyint(1) DEFAULT '0',
  `delete` tinyint(1) DEFAULT '0',
  `rename` tinyint(1) DEFAULT '0',
  `create` tinyint(1) DEFAULT '0',
  `settings` tinyint(1) DEFAULT '0',
  `versions` tinyint(1) DEFAULT '0',
  `properties` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_asset`
--

LOCK TABLES `users_workspaces_asset` WRITE;
/*!40000 ALTER TABLE `users_workspaces_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_document`
--

DROP TABLE IF EXISTS `users_workspaces_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_workspaces_document` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `list` tinyint(1) unsigned DEFAULT '0',
  `view` tinyint(1) unsigned DEFAULT '0',
  `save` tinyint(1) unsigned DEFAULT '0',
  `publish` tinyint(1) unsigned DEFAULT '0',
  `unpublish` tinyint(1) unsigned DEFAULT '0',
  `delete` tinyint(1) unsigned DEFAULT '0',
  `rename` tinyint(1) unsigned DEFAULT '0',
  `create` tinyint(1) unsigned DEFAULT '0',
  `settings` tinyint(1) unsigned DEFAULT '0',
  `versions` tinyint(1) unsigned DEFAULT '0',
  `properties` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_document`
--

LOCK TABLES `users_workspaces_document` WRITE;
/*!40000 ALTER TABLE `users_workspaces_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_object`
--

DROP TABLE IF EXISTS `users_workspaces_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_workspaces_object` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `list` tinyint(1) unsigned DEFAULT '0',
  `view` tinyint(1) unsigned DEFAULT '0',
  `save` tinyint(1) unsigned DEFAULT '0',
  `publish` tinyint(1) unsigned DEFAULT '0',
  `unpublish` tinyint(1) unsigned DEFAULT '0',
  `delete` tinyint(1) unsigned DEFAULT '0',
  `rename` tinyint(1) unsigned DEFAULT '0',
  `create` tinyint(1) unsigned DEFAULT '0',
  `settings` tinyint(1) unsigned DEFAULT '0',
  `versions` tinyint(1) unsigned DEFAULT '0',
  `properties` tinyint(1) unsigned DEFAULT '0',
  `lEdit` text,
  `lView` text,
  `layouts` text,
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_object`
--

LOCK TABLES `users_workspaces_object` WRITE;
/*!40000 ALTER TABLE `users_workspaces_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uuids`
--

DROP TABLE IF EXISTS `uuids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uuids` (
  `uuid` char(36) NOT NULL,
  `itemId` bigint(20) unsigned NOT NULL,
  `type` varchar(25) NOT NULL,
  `instanceIdentifier` varchar(50) NOT NULL,
  UNIQUE KEY `itemId_type_uuid` (`itemId`,`type`,`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uuids`
--

LOCK TABLES `uuids` WRITE;
/*!40000 ALTER TABLE `uuids` DISABLE KEYS */;
/*!40000 ALTER TABLE `uuids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int(11) unsigned DEFAULT NULL,
  `note` text,
  `date` bigint(1) unsigned DEFAULT NULL,
  `public` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `serialized` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_settings`
--

DROP TABLE IF EXISTS `website_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` enum('text','document','asset','object','bool') DEFAULT NULL,
  `data` text,
  `siteId` int(11) unsigned DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `siteId` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_settings`
--

LOCK TABLES `website_settings` WRITE;
/*!40000 ALTER TABLE `website_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `pimcore_migdev`
--

USE `pimcore_migdev`;

--
-- Final view structure for view `object_1`
--

/*!50001 DROP VIEW IF EXISTS `object_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `object_1` AS select `object_query_1`.`oo_id` AS `oo_id`,`object_query_1`.`oo_classId` AS `oo_classId`,`object_query_1`.`oo_className` AS `oo_className`,`object_query_1`.`first_name` AS `first_name`,`object_query_1`.`last_name` AS `last_name`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className` from (`object_query_1` join `objects` on((`objects`.`o_id` = `object_query_1`.`oo_id`))) */;
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

-- Dump completed on 2015-09-10 16:06:39
