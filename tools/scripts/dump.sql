-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: pimcore_migdev
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
INSERT INTO `assets` VALUES (1,0,'folder','','/',NULL,1441887342,1441887342,1,1,NULL,0);
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
INSERT INTO `cache` VALUES ('pimcore_asset_1','O:26:\"Pimcore\\Model\\Asset\\Folder\":17:{s:4:\"type\";s:6:\"folder\";s:2:\"id\";i:1;s:8:\"parentId\";i:0;s:8:\"filename\";s:0:\"\";s:4:\"path\";s:1:\"/\";s:8:\"mimetype\";N;s:12:\"creationDate\";i:1441887342;s:16:\"modificationDate\";i:1441887342;s:9:\"userOwner\";s:1:\"1\";s:16:\"userModification\";s:1:\"1\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:0:{}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1441887406,1444306606),('pimcore_document_1','O:27:\"Pimcore\\Model\\Document\\Page\":27:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:8:\"metaData\";N;s:4:\"type\";s:4:\"page\";s:9:\"prettyUrl\";N;s:3:\"css\";N;s:8:\"personas\";s:0:\"\";s:6:\"module\";N;s:10:\"controller\";s:0:\"\";s:6:\"action\";s:0:\"\";s:8:\"template\";s:0:\"\";s:8:\"elements\";a:0:{}s:23:\"contentMasterDocumentId\";N;s:2:\"id\";i:1;s:8:\"parentId\";i:0;s:3:\"key\";s:0:\"\";s:4:\"path\";s:1:\"/\";s:5:\"index\";i:999999;s:9:\"published\";b:1;s:12:\"creationDate\";i:1441887342;s:16:\"modificationDate\";i:1441887342;s:9:\"userOwner\";i:1;s:16:\"userModification\";i:1;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1441887406,1444306606),('pimcore_object_1','O:27:\"Pimcore\\Model\\Object\\Folder\":14:{s:6:\"o_type\";s:6:\"folder\";s:4:\"o_id\";i:1;s:10:\"o_parentId\";i:0;s:5:\"o_key\";s:0:\"\";s:6:\"o_path\";s:1:\"/\";s:7:\"o_index\";i:999999;s:14:\"o_creationDate\";i:1441887342;s:18:\"o_modificationDate\";i:1441887342;s:11:\"o_userOwner\";i:1;s:18:\"o_userModification\";i:1;s:10:\"o_siblings\";N;s:13:\"o_hasSiblings\";N;s:8:\"o_locked\";N;s:19:\"o_elementAdminStyle\";O:32:\"Pimcore\\Model\\Element\\AdminStyle\":3:{s:18:\"\0*\0elementCssClass\";N;s:14:\"\0*\0elementIcon\";N;s:19:\"\0*\0elementIconClass\";s:19:\"pimcore_icon_folder\";}}',1441887406,1444306606),('pimcore_system_supported_locales_en','a:740:{s:2:\"aa\";s:4:\"Afar\";s:5:\"aa_DJ\";s:15:\"Afar (Djibouti)\";s:5:\"aa_ER\";s:14:\"Afar (Eritrea)\";s:5:\"aa_ET\";s:15:\"Afar (Ethiopia)\";s:2:\"af\";s:9:\"Afrikaans\";s:5:\"af_NA\";s:19:\"Afrikaans (Namibia)\";s:5:\"af_ZA\";s:24:\"Afrikaans (South Africa)\";s:3:\"agq\";s:5:\"Aghem\";s:6:\"agq_CM\";s:16:\"Aghem (Cameroon)\";s:2:\"ak\";s:4:\"Akan\";s:5:\"ak_GH\";s:12:\"Akan (Ghana)\";s:2:\"sq\";s:8:\"Albanian\";s:5:\"sq_AL\";s:18:\"Albanian (Albania)\";s:5:\"sq_XK\";s:17:\"Albanian (Kosovo)\";s:5:\"sq_MK\";s:20:\"Albanian (Macedonia)\";s:5:\"en_US\";s:16:\"American English\";s:2:\"am\";s:7:\"Amharic\";s:5:\"am_ET\";s:18:\"Amharic (Ethiopia)\";s:2:\"ar\";s:6:\"Arabic\";s:5:\"ar_DZ\";s:16:\"Arabic (Algeria)\";s:5:\"ar_BH\";s:16:\"Arabic (Bahrain)\";s:5:\"ar_TD\";s:13:\"Arabic (Chad)\";s:5:\"ar_KM\";s:16:\"Arabic (Comoros)\";s:5:\"ar_DJ\";s:17:\"Arabic (Djibouti)\";s:5:\"ar_EG\";s:14:\"Arabic (Egypt)\";s:5:\"ar_ER\";s:16:\"Arabic (Eritrea)\";s:5:\"ar_IQ\";s:13:\"Arabic (Iraq)\";s:5:\"ar_IL\";s:15:\"Arabic (Israel)\";s:5:\"ar_JO\";s:15:\"Arabic (Jordan)\";s:5:\"ar_KW\";s:15:\"Arabic (Kuwait)\";s:5:\"ar_LB\";s:16:\"Arabic (Lebanon)\";s:5:\"ar_LY\";s:14:\"Arabic (Libya)\";s:5:\"ar_MR\";s:19:\"Arabic (Mauritania)\";s:5:\"ar_MA\";s:16:\"Arabic (Morocco)\";s:5:\"ar_OM\";s:13:\"Arabic (Oman)\";s:5:\"ar_PS\";s:32:\"Arabic (Palestinian Territories)\";s:5:\"ar_QA\";s:14:\"Arabic (Qatar)\";s:5:\"ar_SA\";s:21:\"Arabic (Saudi Arabia)\";s:5:\"ar_SO\";s:16:\"Arabic (Somalia)\";s:5:\"ar_SS\";s:20:\"Arabic (South Sudan)\";s:5:\"ar_SD\";s:14:\"Arabic (Sudan)\";s:5:\"ar_SY\";s:14:\"Arabic (Syria)\";s:5:\"ar_TN\";s:16:\"Arabic (Tunisia)\";s:5:\"ar_AE\";s:29:\"Arabic (United Arab Emirates)\";s:5:\"ar_EH\";s:23:\"Arabic (Western Sahara)\";s:5:\"ar_YE\";s:14:\"Arabic (Yemen)\";s:2:\"hy\";s:8:\"Armenian\";s:5:\"hy_AM\";s:18:\"Armenian (Armenia)\";s:2:\"as\";s:8:\"Assamese\";s:5:\"as_IN\";s:16:\"Assamese (India)\";s:3:\"ast\";s:8:\"Asturian\";s:6:\"ast_ES\";s:16:\"Asturian (Spain)\";s:3:\"asa\";s:3:\"Asu\";s:6:\"asa_TZ\";s:14:\"Asu (Tanzania)\";s:5:\"en_AU\";s:18:\"Australian English\";s:5:\"de_AT\";s:15:\"Austrian German\";s:2:\"az\";s:11:\"Azerbaijani\";s:5:\"az_AZ\";s:24:\"Azerbaijani (Azerbaijan)\";s:10:\"az_Cyrl_AZ\";s:24:\"Azerbaijani (Azerbaijan)\";s:10:\"az_Latn_AZ\";s:24:\"Azerbaijani (Azerbaijan)\";s:3:\"ksf\";s:5:\"Bafia\";s:6:\"ksf_CM\";s:16:\"Bafia (Cameroon)\";s:2:\"bm\";s:7:\"Bambara\";s:5:\"bm_ML\";s:14:\"Bambara (Mali)\";s:3:\"bas\";s:5:\"Basaa\";s:6:\"bas_CM\";s:16:\"Basaa (Cameroon)\";s:2:\"eu\";s:6:\"Basque\";s:5:\"eu_ES\";s:14:\"Basque (Spain)\";s:2:\"be\";s:10:\"Belarusian\";s:5:\"be_BY\";s:20:\"Belarusian (Belarus)\";s:3:\"bem\";s:5:\"Bemba\";s:6:\"bem_ZM\";s:14:\"Bemba (Zambia)\";s:3:\"bez\";s:4:\"Bena\";s:6:\"bez_TZ\";s:15:\"Bena (Tanzania)\";s:2:\"bn\";s:7:\"Bengali\";s:5:\"bn_BD\";s:20:\"Bengali (Bangladesh)\";s:5:\"bn_IN\";s:15:\"Bengali (India)\";s:3:\"byn\";s:4:\"Blin\";s:6:\"byn_ER\";s:14:\"Blin (Eritrea)\";s:3:\"brx\";s:4:\"Bodo\";s:6:\"brx_IN\";s:12:\"Bodo (India)\";s:2:\"bs\";s:7:\"Bosnian\";s:5:\"bs_BA\";s:32:\"Bosnian (Bosnia and Herzegovina)\";s:10:\"bs_Cyrl_BA\";s:32:\"Bosnian (Bosnia and Herzegovina)\";s:10:\"bs_Latn_BA\";s:32:\"Bosnian (Bosnia and Herzegovina)\";s:5:\"pt_BR\";s:20:\"Brazilian Portuguese\";s:2:\"br\";s:6:\"Breton\";s:5:\"br_FR\";s:15:\"Breton (France)\";s:5:\"en_GB\";s:15:\"British English\";s:2:\"bg\";s:9:\"Bulgarian\";s:5:\"bg_BG\";s:20:\"Bulgarian (Bulgaria)\";s:2:\"my\";s:7:\"Burmese\";s:5:\"my_MM\";s:25:\"Burmese (Myanmar (Burma))\";s:5:\"en_CA\";s:16:\"Canadian English\";s:5:\"fr_CA\";s:15:\"Canadian French\";s:2:\"ca\";s:7:\"Catalan\";s:5:\"ca_AD\";s:17:\"Catalan (Andorra)\";s:5:\"ca_FR\";s:16:\"Catalan (France)\";s:5:\"ca_IT\";s:15:\"Catalan (Italy)\";s:5:\"ca_ES\";s:15:\"Catalan (Spain)\";s:14:\"ca_ES_VALENCIA\";s:15:\"Catalan (Spain)\";s:3:\"tzm\";s:23:\"Central Atlas Tamazight\";s:11:\"tzm_Latn_MA\";s:33:\"Central Atlas Tamazight (Morocco)\";s:6:\"tzm_MA\";s:33:\"Central Atlas Tamazight (Morocco)\";s:3:\"chr\";s:8:\"Cherokee\";s:6:\"chr_US\";s:24:\"Cherokee (United States)\";s:3:\"cgg\";s:5:\"Chiga\";s:6:\"cgg_UG\";s:14:\"Chiga (Uganda)\";s:2:\"zh\";s:7:\"Chinese\";s:10:\"zh_Hans_CN\";s:15:\"Chinese (China)\";s:5:\"zh_CN\";s:15:\"Chinese (China)\";s:10:\"zh_Hans_HK\";s:29:\"Chinese (Hong Kong SAR China)\";s:10:\"zh_Hant_HK\";s:29:\"Chinese (Hong Kong SAR China)\";s:5:\"zh_HK\";s:29:\"Chinese (Hong Kong SAR China)\";s:10:\"zh_Hant_MO\";s:25:\"Chinese (Macau SAR China)\";s:5:\"zh_MO\";s:25:\"Chinese (Macau SAR China)\";s:10:\"zh_Hans_MO\";s:25:\"Chinese (Macau SAR China)\";s:10:\"zh_Hans_SG\";s:19:\"Chinese (Singapore)\";s:5:\"zh_SG\";s:19:\"Chinese (Singapore)\";s:5:\"zh_TW\";s:16:\"Chinese (Taiwan)\";s:10:\"zh_Hant_TW\";s:16:\"Chinese (Taiwan)\";s:3:\"ksh\";s:9:\"Colognian\";s:6:\"ksh_DE\";s:19:\"Colognian (Germany)\";s:3:\"swc\";s:13:\"Congo Swahili\";s:6:\"swc_CD\";s:32:\"Congo Swahili (Congo - Kinshasa)\";s:2:\"kw\";s:7:\"Cornish\";s:5:\"kw_GB\";s:24:\"Cornish (United Kingdom)\";s:2:\"hr\";s:8:\"Croatian\";s:5:\"hr_BA\";s:33:\"Croatian (Bosnia and Herzegovina)\";s:5:\"hr_HR\";s:18:\"Croatian (Croatia)\";s:2:\"cs\";s:5:\"Czech\";s:5:\"cs_CZ\";s:22:\"Czech (Czech Republic)\";s:2:\"da\";s:6:\"Danish\";s:5:\"da_DK\";s:16:\"Danish (Denmark)\";s:5:\"da_GL\";s:18:\"Danish (Greenland)\";s:3:\"dua\";s:5:\"Duala\";s:6:\"dua_CM\";s:16:\"Duala (Cameroon)\";s:2:\"nl\";s:5:\"Dutch\";s:5:\"nl_AW\";s:13:\"Dutch (Aruba)\";s:5:\"nl_BQ\";s:29:\"Dutch (Caribbean Netherlands)\";s:5:\"nl_CW\";s:16:\"Dutch (Curaçao)\";s:5:\"nl_NL\";s:19:\"Dutch (Netherlands)\";s:5:\"nl_SX\";s:20:\"Dutch (Sint Maarten)\";s:5:\"nl_SR\";s:16:\"Dutch (Suriname)\";s:2:\"dz\";s:8:\"Dzongkha\";s:5:\"dz_BT\";s:17:\"Dzongkha (Bhutan)\";s:3:\"ebu\";s:4:\"Embu\";s:6:\"ebu_KE\";s:12:\"Embu (Kenya)\";s:2:\"en\";s:7:\"English\";s:5:\"en_AS\";s:24:\"English (American Samoa)\";s:5:\"en_AI\";s:18:\"English (Anguilla)\";s:5:\"en_AG\";s:29:\"English (Antigua and Barbuda)\";s:5:\"en_BS\";s:17:\"English (Bahamas)\";s:5:\"en_BB\";s:18:\"English (Barbados)\";s:5:\"en_BE\";s:17:\"English (Belgium)\";s:5:\"en_BZ\";s:16:\"English (Belize)\";s:5:\"en_BM\";s:17:\"English (Bermuda)\";s:5:\"en_BW\";s:18:\"English (Botswana)\";s:5:\"en_IO\";s:40:\"English (British Indian Ocean Territory)\";s:5:\"en_VG\";s:32:\"English (British Virgin Islands)\";s:5:\"en_CM\";s:18:\"English (Cameroon)\";s:5:\"en_KY\";s:24:\"English (Cayman Islands)\";s:5:\"en_CX\";s:26:\"English (Christmas Island)\";s:5:\"en_CC\";s:33:\"English (Cocos (Keeling) Islands)\";s:5:\"en_CK\";s:22:\"English (Cook Islands)\";s:5:\"en_DG\";s:22:\"English (Diego Garcia)\";s:5:\"en_DM\";s:18:\"English (Dominica)\";s:5:\"en_ER\";s:17:\"English (Eritrea)\";s:6:\"en_150\";s:16:\"English (Europe)\";s:5:\"en_FK\";s:26:\"English (Falkland Islands)\";s:5:\"en_FJ\";s:14:\"English (Fiji)\";s:5:\"en_GM\";s:16:\"English (Gambia)\";s:5:\"en_GH\";s:15:\"English (Ghana)\";s:5:\"en_GI\";s:19:\"English (Gibraltar)\";s:5:\"en_GD\";s:17:\"English (Grenada)\";s:5:\"en_GU\";s:14:\"English (Guam)\";s:5:\"en_GG\";s:18:\"English (Guernsey)\";s:5:\"en_GY\";s:16:\"English (Guyana)\";s:5:\"en_HK\";s:29:\"English (Hong Kong SAR China)\";s:5:\"en_IN\";s:15:\"English (India)\";s:5:\"en_IE\";s:17:\"English (Ireland)\";s:5:\"en_IM\";s:21:\"English (Isle of Man)\";s:5:\"en_JM\";s:17:\"English (Jamaica)\";s:5:\"en_JE\";s:16:\"English (Jersey)\";s:5:\"en_KE\";s:15:\"English (Kenya)\";s:5:\"en_KI\";s:18:\"English (Kiribati)\";s:5:\"en_LS\";s:17:\"English (Lesotho)\";s:5:\"en_LR\";s:17:\"English (Liberia)\";s:5:\"en_MO\";s:25:\"English (Macau SAR China)\";s:5:\"en_MG\";s:20:\"English (Madagascar)\";s:5:\"en_MW\";s:16:\"English (Malawi)\";s:5:\"en_MT\";s:15:\"English (Malta)\";s:5:\"en_MH\";s:26:\"English (Marshall Islands)\";s:5:\"en_MU\";s:19:\"English (Mauritius)\";s:5:\"en_FM\";s:20:\"English (Micronesia)\";s:5:\"en_MS\";s:20:\"English (Montserrat)\";s:5:\"en_NA\";s:17:\"English (Namibia)\";s:5:\"en_NR\";s:15:\"English (Nauru)\";s:5:\"en_NZ\";s:21:\"English (New Zealand)\";s:5:\"en_NG\";s:17:\"English (Nigeria)\";s:5:\"en_NU\";s:14:\"English (Niue)\";s:5:\"en_NF\";s:24:\"English (Norfolk Island)\";s:5:\"en_MP\";s:34:\"English (Northern Mariana Islands)\";s:5:\"en_PK\";s:18:\"English (Pakistan)\";s:5:\"en_PW\";s:15:\"English (Palau)\";s:5:\"en_PG\";s:26:\"English (Papua New Guinea)\";s:5:\"en_PH\";s:21:\"English (Philippines)\";s:5:\"en_PN\";s:26:\"English (Pitcairn Islands)\";s:5:\"en_PR\";s:21:\"English (Puerto Rico)\";s:5:\"en_RW\";s:16:\"English (Rwanda)\";s:5:\"en_SH\";s:22:\"English (Saint Helena)\";s:5:\"en_KN\";s:31:\"English (Saint Kitts and Nevis)\";s:5:\"en_LC\";s:21:\"English (Saint Lucia)\";s:5:\"en_WS\";s:15:\"English (Samoa)\";s:5:\"en_SC\";s:20:\"English (Seychelles)\";s:5:\"en_SL\";s:22:\"English (Sierra Leone)\";s:5:\"en_SG\";s:19:\"English (Singapore)\";s:5:\"en_SX\";s:22:\"English (Sint Maarten)\";s:5:\"en_SB\";s:25:\"English (Solomon Islands)\";s:5:\"en_ZA\";s:22:\"English (South Africa)\";s:5:\"en_SS\";s:21:\"English (South Sudan)\";s:5:\"en_VC\";s:34:\"English (St. Vincent & Grenadines)\";s:5:\"en_SD\";s:15:\"English (Sudan)\";s:5:\"en_SZ\";s:19:\"English (Swaziland)\";s:5:\"en_TZ\";s:18:\"English (Tanzania)\";s:5:\"en_TK\";s:17:\"English (Tokelau)\";s:5:\"en_TO\";s:15:\"English (Tonga)\";s:5:\"en_TT\";s:29:\"English (Trinidad and Tobago)\";s:5:\"en_TC\";s:34:\"English (Turks and Caicos Islands)\";s:5:\"en_TV\";s:16:\"English (Tuvalu)\";s:5:\"en_UM\";s:31:\"English (U.S. Outlying Islands)\";s:5:\"en_VI\";s:29:\"English (U.S. Virgin Islands)\";s:5:\"en_UG\";s:16:\"English (Uganda)\";s:10:\"en_Dsrt_US\";s:23:\"English (United States)\";s:11:\"en_US_POSIX\";s:23:\"English (United States)\";s:5:\"en_VU\";s:17:\"English (Vanuatu)\";s:6:\"en_001\";s:15:\"English (World)\";s:5:\"en_ZM\";s:16:\"English (Zambia)\";s:5:\"en_ZW\";s:18:\"English (Zimbabwe)\";s:2:\"eo\";s:9:\"Esperanto\";s:6:\"eo_001\";s:17:\"Esperanto (World)\";s:2:\"et\";s:8:\"Estonian\";s:5:\"et_EE\";s:18:\"Estonian (Estonia)\";s:5:\"pt_PT\";s:19:\"European Portuguese\";s:5:\"es_ES\";s:16:\"European Spanish\";s:2:\"ee\";s:3:\"Ewe\";s:5:\"ee_GH\";s:11:\"Ewe (Ghana)\";s:5:\"ee_TG\";s:10:\"Ewe (Togo)\";s:3:\"ewo\";s:6:\"Ewondo\";s:6:\"ewo_CM\";s:17:\"Ewondo (Cameroon)\";s:2:\"fo\";s:7:\"Faroese\";s:5:\"fo_FO\";s:23:\"Faroese (Faroe Islands)\";s:3:\"fil\";s:8:\"Filipino\";s:6:\"fil_PH\";s:22:\"Filipino (Philippines)\";s:2:\"fi\";s:7:\"Finnish\";s:5:\"fi_FI\";s:17:\"Finnish (Finland)\";s:5:\"nl_BE\";s:7:\"Flemish\";s:2:\"fr\";s:6:\"French\";s:5:\"fr_DZ\";s:16:\"French (Algeria)\";s:5:\"fr_BE\";s:16:\"French (Belgium)\";s:5:\"fr_BJ\";s:14:\"French (Benin)\";s:5:\"fr_BF\";s:21:\"French (Burkina Faso)\";s:5:\"fr_BI\";s:16:\"French (Burundi)\";s:5:\"fr_CM\";s:17:\"French (Cameroon)\";s:5:\"fr_CF\";s:33:\"French (Central African Republic)\";s:5:\"fr_TD\";s:13:\"French (Chad)\";s:5:\"fr_KM\";s:16:\"French (Comoros)\";s:5:\"fr_CG\";s:28:\"French (Congo - Brazzaville)\";s:5:\"fr_CD\";s:25:\"French (Congo - Kinshasa)\";s:5:\"fr_CI\";s:25:\"French (Côte d’Ivoire)\";s:5:\"fr_DJ\";s:17:\"French (Djibouti)\";s:5:\"fr_GQ\";s:26:\"French (Equatorial Guinea)\";s:5:\"fr_FR\";s:15:\"French (France)\";s:5:\"fr_GF\";s:22:\"French (French Guiana)\";s:5:\"fr_PF\";s:25:\"French (French Polynesia)\";s:5:\"fr_GA\";s:14:\"French (Gabon)\";s:5:\"fr_GP\";s:19:\"French (Guadeloupe)\";s:5:\"fr_GN\";s:15:\"French (Guinea)\";s:5:\"fr_HT\";s:14:\"French (Haiti)\";s:5:\"fr_LU\";s:19:\"French (Luxembourg)\";s:5:\"fr_MG\";s:19:\"French (Madagascar)\";s:5:\"fr_ML\";s:13:\"French (Mali)\";s:5:\"fr_MQ\";s:19:\"French (Martinique)\";s:5:\"fr_MR\";s:19:\"French (Mauritania)\";s:5:\"fr_MU\";s:18:\"French (Mauritius)\";s:5:\"fr_YT\";s:16:\"French (Mayotte)\";s:5:\"fr_MC\";s:15:\"French (Monaco)\";s:5:\"fr_MA\";s:16:\"French (Morocco)\";s:5:\"fr_NC\";s:22:\"French (New Caledonia)\";s:5:\"fr_NE\";s:14:\"French (Niger)\";s:5:\"fr_RW\";s:15:\"French (Rwanda)\";s:5:\"fr_RE\";s:17:\"French (Réunion)\";s:5:\"fr_BL\";s:26:\"French (Saint Barthélemy)\";s:5:\"fr_MF\";s:21:\"French (Saint Martin)\";s:5:\"fr_PM\";s:34:\"French (Saint Pierre and Miquelon)\";s:5:\"fr_SN\";s:16:\"French (Senegal)\";s:5:\"fr_SC\";s:19:\"French (Seychelles)\";s:5:\"fr_SY\";s:14:\"French (Syria)\";s:5:\"fr_TG\";s:13:\"French (Togo)\";s:5:\"fr_TN\";s:16:\"French (Tunisia)\";s:5:\"fr_VU\";s:16:\"French (Vanuatu)\";s:5:\"fr_WF\";s:26:\"French (Wallis and Futuna)\";s:3:\"fur\";s:8:\"Friulian\";s:6:\"fur_IT\";s:16:\"Friulian (Italy)\";s:2:\"ff\";s:5:\"Fulah\";s:5:\"ff_CM\";s:16:\"Fulah (Cameroon)\";s:5:\"ff_GN\";s:14:\"Fulah (Guinea)\";s:5:\"ff_MR\";s:18:\"Fulah (Mauritania)\";s:5:\"ff_SN\";s:15:\"Fulah (Senegal)\";s:2:\"gl\";s:8:\"Galician\";s:5:\"gl_ES\";s:16:\"Galician (Spain)\";s:2:\"lg\";s:5:\"Ganda\";s:5:\"lg_UG\";s:14:\"Ganda (Uganda)\";s:2:\"ka\";s:8:\"Georgian\";s:5:\"ka_GE\";s:18:\"Georgian (Georgia)\";s:2:\"de\";s:6:\"German\";s:5:\"de_BE\";s:16:\"German (Belgium)\";s:5:\"de_DE\";s:16:\"German (Germany)\";s:5:\"de_LI\";s:22:\"German (Liechtenstein)\";s:5:\"de_LU\";s:19:\"German (Luxembourg)\";s:2:\"el\";s:5:\"Greek\";s:5:\"el_CY\";s:14:\"Greek (Cyprus)\";s:5:\"el_GR\";s:14:\"Greek (Greece)\";s:2:\"gu\";s:8:\"Gujarati\";s:5:\"gu_IN\";s:16:\"Gujarati (India)\";s:3:\"guz\";s:5:\"Gusii\";s:6:\"guz_KE\";s:13:\"Gusii (Kenya)\";s:2:\"ha\";s:5:\"Hausa\";s:10:\"ha_Latn_GH\";s:13:\"Hausa (Ghana)\";s:5:\"ha_GH\";s:13:\"Hausa (Ghana)\";s:5:\"ha_NE\";s:13:\"Hausa (Niger)\";s:10:\"ha_Latn_NE\";s:13:\"Hausa (Niger)\";s:10:\"ha_Latn_NG\";s:15:\"Hausa (Nigeria)\";s:5:\"ha_NG\";s:15:\"Hausa (Nigeria)\";s:3:\"haw\";s:8:\"Hawaiian\";s:6:\"haw_US\";s:24:\"Hawaiian (United States)\";s:2:\"he\";s:6:\"Hebrew\";s:5:\"he_IL\";s:15:\"Hebrew (Israel)\";s:2:\"hi\";s:5:\"Hindi\";s:5:\"hi_IN\";s:13:\"Hindi (India)\";s:2:\"hu\";s:9:\"Hungarian\";s:5:\"hu_HU\";s:19:\"Hungarian (Hungary)\";s:2:\"is\";s:9:\"Icelandic\";s:5:\"is_IS\";s:19:\"Icelandic (Iceland)\";s:2:\"ig\";s:4:\"Igbo\";s:5:\"ig_NG\";s:14:\"Igbo (Nigeria)\";s:2:\"id\";s:10:\"Indonesian\";s:5:\"id_ID\";s:22:\"Indonesian (Indonesia)\";s:2:\"ia\";s:11:\"Interlingua\";s:5:\"ia_FR\";s:20:\"Interlingua (France)\";s:2:\"ga\";s:5:\"Irish\";s:5:\"ga_IE\";s:15:\"Irish (Ireland)\";s:2:\"it\";s:7:\"Italian\";s:5:\"it_IT\";s:15:\"Italian (Italy)\";s:5:\"it_SM\";s:20:\"Italian (San Marino)\";s:5:\"it_CH\";s:21:\"Italian (Switzerland)\";s:2:\"ja\";s:8:\"Japanese\";s:5:\"ja_JP\";s:16:\"Japanese (Japan)\";s:3:\"dyo\";s:10:\"Jola-Fonyi\";s:6:\"dyo_SN\";s:20:\"Jola-Fonyi (Senegal)\";s:3:\"kea\";s:12:\"Kabuverdianu\";s:6:\"kea_CV\";s:25:\"Kabuverdianu (Cape Verde)\";s:3:\"kab\";s:6:\"Kabyle\";s:6:\"kab_DZ\";s:16:\"Kabyle (Algeria)\";s:3:\"kkj\";s:4:\"Kako\";s:6:\"kkj_CM\";s:15:\"Kako (Cameroon)\";s:2:\"kl\";s:11:\"Kalaallisut\";s:5:\"kl_GL\";s:23:\"Kalaallisut (Greenland)\";s:3:\"kln\";s:8:\"Kalenjin\";s:6:\"kln_KE\";s:16:\"Kalenjin (Kenya)\";s:3:\"kam\";s:5:\"Kamba\";s:6:\"kam_KE\";s:13:\"Kamba (Kenya)\";s:2:\"kn\";s:7:\"Kannada\";s:5:\"kn_IN\";s:15:\"Kannada (India)\";s:2:\"ks\";s:8:\"Kashmiri\";s:5:\"ks_IN\";s:16:\"Kashmiri (India)\";s:10:\"ks_Arab_IN\";s:16:\"Kashmiri (India)\";s:2:\"kk\";s:6:\"Kazakh\";s:5:\"kk_KZ\";s:19:\"Kazakh (Kazakhstan)\";s:10:\"kk_Cyrl_KZ\";s:19:\"Kazakh (Kazakhstan)\";s:2:\"km\";s:5:\"Khmer\";s:5:\"km_KH\";s:16:\"Khmer (Cambodia)\";s:2:\"ki\";s:6:\"Kikuyu\";s:5:\"ki_KE\";s:14:\"Kikuyu (Kenya)\";s:2:\"rw\";s:11:\"Kinyarwanda\";s:5:\"rw_RW\";s:20:\"Kinyarwanda (Rwanda)\";s:3:\"kok\";s:7:\"Konkani\";s:6:\"kok_IN\";s:15:\"Konkani (India)\";s:2:\"ko\";s:6:\"Korean\";s:5:\"ko_KP\";s:20:\"Korean (North Korea)\";s:5:\"ko_KR\";s:20:\"Korean (South Korea)\";s:3:\"khq\";s:12:\"Koyra Chiini\";s:6:\"khq_ML\";s:19:\"Koyra Chiini (Mali)\";s:3:\"ses\";s:15:\"Koyraboro Senni\";s:6:\"ses_ML\";s:22:\"Koyraboro Senni (Mali)\";s:3:\"nmg\";s:6:\"Kwasio\";s:6:\"nmg_CM\";s:17:\"Kwasio (Cameroon)\";s:2:\"ky\";s:6:\"Kyrgyz\";s:3:\"lkt\";s:6:\"Lakota\";s:6:\"lkt_US\";s:22:\"Lakota (United States)\";s:3:\"lag\";s:5:\"Langi\";s:6:\"lag_TZ\";s:16:\"Langi (Tanzania)\";s:2:\"lo\";s:3:\"Lao\";s:5:\"lo_LA\";s:10:\"Lao (Laos)\";s:6:\"es_419\";s:22:\"Latin American Spanish\";s:2:\"lv\";s:7:\"Latvian\";s:5:\"lv_LV\";s:16:\"Latvian (Latvia)\";s:2:\"ln\";s:7:\"Lingala\";s:5:\"ln_AO\";s:16:\"Lingala (Angola)\";s:5:\"ln_CF\";s:34:\"Lingala (Central African Republic)\";s:5:\"ln_CG\";s:29:\"Lingala (Congo - Brazzaville)\";s:5:\"ln_CD\";s:26:\"Lingala (Congo - Kinshasa)\";s:2:\"lt\";s:10:\"Lithuanian\";s:5:\"lt_LT\";s:22:\"Lithuanian (Lithuania)\";s:2:\"lu\";s:12:\"Luba-Katanga\";s:5:\"lu_CD\";s:31:\"Luba-Katanga (Congo - Kinshasa)\";s:3:\"luo\";s:3:\"Luo\";s:6:\"luo_KE\";s:11:\"Luo (Kenya)\";s:3:\"luy\";s:5:\"Luyia\";s:6:\"luy_KE\";s:13:\"Luyia (Kenya)\";s:2:\"mk\";s:10:\"Macedonian\";s:5:\"mk_MK\";s:22:\"Macedonian (Macedonia)\";s:3:\"jmc\";s:7:\"Machame\";s:6:\"jmc_TZ\";s:18:\"Machame (Tanzania)\";s:3:\"mgh\";s:14:\"Makhuwa-Meetto\";s:6:\"mgh_MZ\";s:27:\"Makhuwa-Meetto (Mozambique)\";s:3:\"kde\";s:7:\"Makonde\";s:6:\"kde_TZ\";s:18:\"Makonde (Tanzania)\";s:2:\"mg\";s:8:\"Malagasy\";s:5:\"mg_MG\";s:21:\"Malagasy (Madagascar)\";s:2:\"ms\";s:5:\"Malay\";s:10:\"ms_Latn_BN\";s:14:\"Malay (Brunei)\";s:5:\"ms_BN\";s:14:\"Malay (Brunei)\";s:5:\"ms_MY\";s:16:\"Malay (Malaysia)\";s:10:\"ms_Latn_MY\";s:16:\"Malay (Malaysia)\";s:10:\"ms_Latn_SG\";s:17:\"Malay (Singapore)\";s:5:\"ms_SG\";s:17:\"Malay (Singapore)\";s:2:\"ml\";s:9:\"Malayalam\";s:5:\"ml_IN\";s:17:\"Malayalam (India)\";s:2:\"mt\";s:7:\"Maltese\";s:5:\"mt_MT\";s:15:\"Maltese (Malta)\";s:2:\"gv\";s:4:\"Manx\";s:5:\"gv_IM\";s:18:\"Manx (Isle of Man)\";s:2:\"mr\";s:7:\"Marathi\";s:5:\"mr_IN\";s:15:\"Marathi (India)\";s:3:\"mas\";s:5:\"Masai\";s:6:\"mas_KE\";s:13:\"Masai (Kenya)\";s:6:\"mas_TZ\";s:16:\"Masai (Tanzania)\";s:3:\"mer\";s:4:\"Meru\";s:6:\"mer_KE\";s:12:\"Meru (Kenya)\";s:3:\"mgo\";s:5:\"Meta\'\";s:6:\"mgo_CM\";s:16:\"Meta\' (Cameroon)\";s:5:\"es_MX\";s:15:\"Mexican Spanish\";s:6:\"ar_001\";s:22:\"Modern Standard Arabic\";s:5:\"ro_MD\";s:9:\"Moldavian\";s:2:\"mn\";s:9:\"Mongolian\";s:10:\"mn_Cyrl_MN\";s:20:\"Mongolian (Mongolia)\";s:5:\"mn_MN\";s:20:\"Mongolian (Mongolia)\";s:3:\"mfe\";s:8:\"Morisyen\";s:6:\"mfe_MU\";s:20:\"Morisyen (Mauritius)\";s:3:\"mua\";s:7:\"Mundang\";s:6:\"mua_CM\";s:18:\"Mundang (Cameroon)\";s:3:\"naq\";s:4:\"Nama\";s:6:\"naq_NA\";s:14:\"Nama (Namibia)\";s:2:\"ne\";s:6:\"Nepali\";s:5:\"ne_IN\";s:14:\"Nepali (India)\";s:5:\"ne_NP\";s:14:\"Nepali (Nepal)\";s:3:\"nnh\";s:9:\"Ngiemboon\";s:6:\"nnh_CM\";s:20:\"Ngiemboon (Cameroon)\";s:3:\"jgo\";s:6:\"Ngomba\";s:6:\"jgo_CM\";s:17:\"Ngomba (Cameroon)\";s:2:\"nd\";s:13:\"North Ndebele\";s:5:\"nd_ZW\";s:24:\"North Ndebele (Zimbabwe)\";s:2:\"se\";s:13:\"Northern Sami\";s:5:\"se_FI\";s:23:\"Northern Sami (Finland)\";s:5:\"se_NO\";s:22:\"Northern Sami (Norway)\";s:3:\"nso\";s:14:\"Northern Sotho\";s:6:\"nso_ZA\";s:29:\"Northern Sotho (South Africa)\";s:2:\"nb\";s:17:\"Norwegian Bokmål\";s:5:\"nb_NO\";s:26:\"Norwegian Bokmål (Norway)\";s:5:\"nb_SJ\";s:42:\"Norwegian Bokmål (Svalbard and Jan Mayen)\";s:2:\"nn\";s:17:\"Norwegian Nynorsk\";s:5:\"nn_NO\";s:26:\"Norwegian Nynorsk (Norway)\";s:3:\"nus\";s:4:\"Nuer\";s:6:\"nus_SD\";s:12:\"Nuer (Sudan)\";s:3:\"nyn\";s:8:\"Nyankole\";s:6:\"nyn_UG\";s:17:\"Nyankole (Uganda)\";s:2:\"or\";s:5:\"Oriya\";s:5:\"or_IN\";s:13:\"Oriya (India)\";s:2:\"om\";s:5:\"Oromo\";s:5:\"om_ET\";s:16:\"Oromo (Ethiopia)\";s:5:\"om_KE\";s:13:\"Oromo (Kenya)\";s:2:\"os\";s:7:\"Ossetic\";s:5:\"os_GE\";s:17:\"Ossetic (Georgia)\";s:5:\"os_RU\";s:16:\"Ossetic (Russia)\";s:2:\"ps\";s:6:\"Pashto\";s:5:\"ps_AF\";s:20:\"Pashto (Afghanistan)\";s:2:\"fa\";s:7:\"Persian\";s:5:\"fa_AF\";s:21:\"Persian (Afghanistan)\";s:5:\"fa_IR\";s:14:\"Persian (Iran)\";s:2:\"pl\";s:6:\"Polish\";s:5:\"pl_PL\";s:15:\"Polish (Poland)\";s:2:\"pt\";s:10:\"Portuguese\";s:5:\"pt_AO\";s:19:\"Portuguese (Angola)\";s:5:\"pt_CV\";s:23:\"Portuguese (Cape Verde)\";s:5:\"pt_GW\";s:26:\"Portuguese (Guinea-Bissau)\";s:5:\"pt_MO\";s:28:\"Portuguese (Macau SAR China)\";s:5:\"pt_MZ\";s:23:\"Portuguese (Mozambique)\";s:5:\"pt_ST\";s:37:\"Portuguese (São Tomé and Príncipe)\";s:5:\"pt_TL\";s:24:\"Portuguese (Timor-Leste)\";s:2:\"pa\";s:7:\"Punjabi\";s:10:\"pa_Guru_IN\";s:15:\"Punjabi (India)\";s:5:\"pa_IN\";s:15:\"Punjabi (India)\";s:5:\"pa_PK\";s:18:\"Punjabi (Pakistan)\";s:10:\"pa_Arab_PK\";s:18:\"Punjabi (Pakistan)\";s:2:\"ro\";s:8:\"Romanian\";s:5:\"ro_RO\";s:18:\"Romanian (Romania)\";s:2:\"rm\";s:7:\"Romansh\";s:5:\"rm_CH\";s:21:\"Romansh (Switzerland)\";s:3:\"rof\";s:5:\"Rombo\";s:6:\"rof_TZ\";s:16:\"Rombo (Tanzania)\";s:2:\"rn\";s:5:\"Rundi\";s:5:\"rn_BI\";s:15:\"Rundi (Burundi)\";s:2:\"ru\";s:7:\"Russian\";s:5:\"ru_BY\";s:17:\"Russian (Belarus)\";s:5:\"ru_KZ\";s:20:\"Russian (Kazakhstan)\";s:5:\"ru_KG\";s:20:\"Russian (Kyrgyzstan)\";s:5:\"ru_MD\";s:17:\"Russian (Moldova)\";s:5:\"ru_RU\";s:16:\"Russian (Russia)\";s:5:\"ru_UA\";s:17:\"Russian (Ukraine)\";s:3:\"rwk\";s:3:\"Rwa\";s:6:\"rwk_TZ\";s:14:\"Rwa (Tanzania)\";s:3:\"ssy\";s:4:\"Saho\";s:6:\"ssy_ER\";s:14:\"Saho (Eritrea)\";s:3:\"sah\";s:5:\"Sakha\";s:6:\"sah_RU\";s:14:\"Sakha (Russia)\";s:3:\"saq\";s:7:\"Samburu\";s:6:\"saq_KE\";s:15:\"Samburu (Kenya)\";s:2:\"sg\";s:5:\"Sango\";s:5:\"sg_CF\";s:32:\"Sango (Central African Republic)\";s:3:\"sbp\";s:5:\"Sangu\";s:6:\"sbp_TZ\";s:16:\"Sangu (Tanzania)\";s:2:\"gd\";s:15:\"Scottish Gaelic\";s:5:\"gd_GB\";s:32:\"Scottish Gaelic (United Kingdom)\";s:3:\"seh\";s:4:\"Sena\";s:6:\"seh_MZ\";s:17:\"Sena (Mozambique)\";s:2:\"sr\";s:7:\"Serbian\";s:5:\"sr_BA\";s:32:\"Serbian (Bosnia and Herzegovina)\";s:10:\"sr_Latn_BA\";s:32:\"Serbian (Bosnia and Herzegovina)\";s:10:\"sr_Cyrl_BA\";s:32:\"Serbian (Bosnia and Herzegovina)\";s:10:\"sr_Latn_XK\";s:16:\"Serbian (Kosovo)\";s:10:\"sr_Cyrl_XK\";s:16:\"Serbian (Kosovo)\";s:5:\"sr_XK\";s:16:\"Serbian (Kosovo)\";s:10:\"sr_Cyrl_ME\";s:20:\"Serbian (Montenegro)\";s:10:\"sr_Latn_ME\";s:20:\"Serbian (Montenegro)\";s:5:\"sr_ME\";s:20:\"Serbian (Montenegro)\";s:5:\"sr_RS\";s:16:\"Serbian (Serbia)\";s:10:\"sr_Cyrl_RS\";s:16:\"Serbian (Serbia)\";s:10:\"sr_Latn_RS\";s:16:\"Serbian (Serbia)\";s:3:\"ksb\";s:8:\"Shambala\";s:6:\"ksb_TZ\";s:19:\"Shambala (Tanzania)\";s:2:\"sn\";s:5:\"Shona\";s:5:\"sn_ZW\";s:16:\"Shona (Zimbabwe)\";s:2:\"ii\";s:10:\"Sichuan Yi\";s:5:\"ii_CN\";s:18:\"Sichuan Yi (China)\";s:7:\"zh_Hans\";s:18:\"Simplified Chinese\";s:2:\"si\";s:7:\"Sinhala\";s:5:\"si_LK\";s:19:\"Sinhala (Sri Lanka)\";s:2:\"sk\";s:6:\"Slovak\";s:5:\"sk_SK\";s:17:\"Slovak (Slovakia)\";s:2:\"sl\";s:9:\"Slovenian\";s:5:\"sl_SI\";s:20:\"Slovenian (Slovenia)\";s:3:\"xog\";s:4:\"Soga\";s:6:\"xog_UG\";s:13:\"Soga (Uganda)\";s:2:\"so\";s:6:\"Somali\";s:5:\"so_DJ\";s:17:\"Somali (Djibouti)\";s:5:\"so_ET\";s:17:\"Somali (Ethiopia)\";s:5:\"so_KE\";s:14:\"Somali (Kenya)\";s:5:\"so_SO\";s:16:\"Somali (Somalia)\";s:2:\"nr\";s:13:\"South Ndebele\";s:5:\"nr_ZA\";s:28:\"South Ndebele (South Africa)\";s:2:\"st\";s:14:\"Southern Sotho\";s:5:\"st_LS\";s:24:\"Southern Sotho (Lesotho)\";s:5:\"st_ZA\";s:29:\"Southern Sotho (South Africa)\";s:2:\"es\";s:7:\"Spanish\";s:5:\"es_AR\";s:19:\"Spanish (Argentina)\";s:5:\"es_BO\";s:17:\"Spanish (Bolivia)\";s:5:\"es_IC\";s:24:\"Spanish (Canary Islands)\";s:5:\"es_EA\";s:27:\"Spanish (Ceuta and Melilla)\";s:5:\"es_CL\";s:15:\"Spanish (Chile)\";s:5:\"es_CO\";s:18:\"Spanish (Colombia)\";s:5:\"es_CR\";s:20:\"Spanish (Costa Rica)\";s:5:\"es_CU\";s:14:\"Spanish (Cuba)\";s:5:\"es_DO\";s:28:\"Spanish (Dominican Republic)\";s:5:\"es_EC\";s:17:\"Spanish (Ecuador)\";s:5:\"es_SV\";s:21:\"Spanish (El Salvador)\";s:5:\"es_GQ\";s:27:\"Spanish (Equatorial Guinea)\";s:5:\"es_GT\";s:19:\"Spanish (Guatemala)\";s:5:\"es_HN\";s:18:\"Spanish (Honduras)\";s:5:\"es_NI\";s:19:\"Spanish (Nicaragua)\";s:5:\"es_PA\";s:16:\"Spanish (Panama)\";s:5:\"es_PY\";s:18:\"Spanish (Paraguay)\";s:5:\"es_PE\";s:14:\"Spanish (Peru)\";s:5:\"es_PH\";s:21:\"Spanish (Philippines)\";s:5:\"es_PR\";s:21:\"Spanish (Puerto Rico)\";s:5:\"es_US\";s:23:\"Spanish (United States)\";s:5:\"es_UY\";s:17:\"Spanish (Uruguay)\";s:5:\"es_VE\";s:19:\"Spanish (Venezuela)\";s:3:\"zgh\";s:27:\"Standard Moroccan Tamazight\";s:6:\"zgh_MA\";s:37:\"Standard Moroccan Tamazight (Morocco)\";s:2:\"sw\";s:7:\"Swahili\";s:5:\"sw_KE\";s:15:\"Swahili (Kenya)\";s:5:\"sw_TZ\";s:18:\"Swahili (Tanzania)\";s:5:\"sw_UG\";s:16:\"Swahili (Uganda)\";s:2:\"ss\";s:5:\"Swati\";s:5:\"ss_ZA\";s:20:\"Swati (South Africa)\";s:5:\"ss_SZ\";s:17:\"Swati (Swaziland)\";s:2:\"sv\";s:7:\"Swedish\";s:5:\"sv_FI\";s:17:\"Swedish (Finland)\";s:5:\"sv_SE\";s:16:\"Swedish (Sweden)\";s:5:\"sv_AX\";s:24:\"Swedish (Åland Islands)\";s:5:\"fr_CH\";s:12:\"Swiss French\";s:3:\"gsw\";s:12:\"Swiss German\";s:6:\"gsw_LI\";s:28:\"Swiss German (Liechtenstein)\";s:6:\"gsw_CH\";s:26:\"Swiss German (Switzerland)\";s:5:\"de_CH\";s:17:\"Swiss High German\";s:3:\"shi\";s:9:\"Tachelhit\";s:6:\"shi_MA\";s:19:\"Tachelhit (Morocco)\";s:11:\"shi_Latn_MA\";s:19:\"Tachelhit (Morocco)\";s:11:\"shi_Tfng_MA\";s:19:\"Tachelhit (Morocco)\";s:3:\"dav\";s:5:\"Taita\";s:6:\"dav_KE\";s:13:\"Taita (Kenya)\";s:2:\"tg\";s:5:\"Tajik\";s:5:\"tg_TJ\";s:18:\"Tajik (Tajikistan)\";s:10:\"tg_Cyrl_TJ\";s:18:\"Tajik (Tajikistan)\";s:2:\"ta\";s:5:\"Tamil\";s:5:\"ta_IN\";s:13:\"Tamil (India)\";s:5:\"ta_MY\";s:16:\"Tamil (Malaysia)\";s:5:\"ta_SG\";s:17:\"Tamil (Singapore)\";s:5:\"ta_LK\";s:17:\"Tamil (Sri Lanka)\";s:3:\"twq\";s:7:\"Tasawaq\";s:6:\"twq_NE\";s:15:\"Tasawaq (Niger)\";s:2:\"te\";s:6:\"Telugu\";s:5:\"te_IN\";s:14:\"Telugu (India)\";s:3:\"teo\";s:4:\"Teso\";s:6:\"teo_KE\";s:12:\"Teso (Kenya)\";s:6:\"teo_UG\";s:13:\"Teso (Uganda)\";s:2:\"th\";s:4:\"Thai\";s:5:\"th_TH\";s:15:\"Thai (Thailand)\";s:2:\"bo\";s:7:\"Tibetan\";s:5:\"bo_CN\";s:15:\"Tibetan (China)\";s:5:\"bo_IN\";s:15:\"Tibetan (India)\";s:3:\"tig\";s:5:\"Tigre\";s:6:\"tig_ER\";s:15:\"Tigre (Eritrea)\";s:2:\"ti\";s:8:\"Tigrinya\";s:5:\"ti_ER\";s:18:\"Tigrinya (Eritrea)\";s:5:\"ti_ET\";s:19:\"Tigrinya (Ethiopia)\";s:2:\"to\";s:6:\"Tongan\";s:5:\"to_TO\";s:14:\"Tongan (Tonga)\";s:7:\"zh_Hant\";s:19:\"Traditional Chinese\";s:2:\"ts\";s:6:\"Tsonga\";s:5:\"ts_ZA\";s:21:\"Tsonga (South Africa)\";s:2:\"tn\";s:6:\"Tswana\";s:5:\"tn_BW\";s:17:\"Tswana (Botswana)\";s:5:\"tn_ZA\";s:21:\"Tswana (South Africa)\";s:2:\"tr\";s:7:\"Turkish\";s:5:\"tr_CY\";s:16:\"Turkish (Cyprus)\";s:5:\"tr_TR\";s:16:\"Turkish (Turkey)\";s:2:\"uk\";s:9:\"Ukrainian\";s:5:\"uk_UA\";s:19:\"Ukrainian (Ukraine)\";s:2:\"ur\";s:4:\"Urdu\";s:5:\"ur_IN\";s:12:\"Urdu (India)\";s:5:\"ur_PK\";s:15:\"Urdu (Pakistan)\";s:2:\"ug\";s:6:\"Uyghur\";s:2:\"uz\";s:5:\"Uzbek\";s:5:\"uz_AF\";s:19:\"Uzbek (Afghanistan)\";s:10:\"uz_Arab_AF\";s:19:\"Uzbek (Afghanistan)\";s:5:\"uz_UZ\";s:18:\"Uzbek (Uzbekistan)\";s:10:\"uz_Cyrl_UZ\";s:18:\"Uzbek (Uzbekistan)\";s:10:\"uz_Latn_UZ\";s:18:\"Uzbek (Uzbekistan)\";s:3:\"vai\";s:3:\"Vai\";s:6:\"vai_LR\";s:13:\"Vai (Liberia)\";s:11:\"vai_Vaii_LR\";s:13:\"Vai (Liberia)\";s:11:\"vai_Latn_LR\";s:13:\"Vai (Liberia)\";s:2:\"ve\";s:5:\"Venda\";s:5:\"ve_ZA\";s:20:\"Venda (South Africa)\";s:2:\"vi\";s:10:\"Vietnamese\";s:5:\"vi_VN\";s:20:\"Vietnamese (Vietnam)\";s:2:\"vo\";s:8:\"Volapük\";s:6:\"vo_001\";s:16:\"Volapük (World)\";s:3:\"vun\";s:5:\"Vunjo\";s:6:\"vun_TZ\";s:16:\"Vunjo (Tanzania)\";s:3:\"wae\";s:6:\"Walser\";s:6:\"wae_CH\";s:20:\"Walser (Switzerland)\";s:2:\"cy\";s:5:\"Welsh\";s:5:\"cy_GB\";s:22:\"Welsh (United Kingdom)\";s:2:\"fy\";s:15:\"Western Frisian\";s:5:\"fy_NL\";s:29:\"Western Frisian (Netherlands)\";s:3:\"wal\";s:8:\"Wolaytta\";s:6:\"wal_ET\";s:19:\"Wolaytta (Ethiopia)\";s:2:\"xh\";s:5:\"Xhosa\";s:5:\"xh_ZA\";s:20:\"Xhosa (South Africa)\";s:3:\"yav\";s:7:\"Yangben\";s:6:\"yav_CM\";s:18:\"Yangben (Cameroon)\";s:2:\"yo\";s:6:\"Yoruba\";s:5:\"yo_BJ\";s:14:\"Yoruba (Benin)\";s:5:\"yo_NG\";s:16:\"Yoruba (Nigeria)\";s:3:\"dje\";s:5:\"Zarma\";s:6:\"dje_NE\";s:13:\"Zarma (Niger)\";s:2:\"zu\";s:4:\"Zulu\";s:5:\"zu_ZA\";s:19:\"Zulu (South Africa)\";s:7:\"az_Cyrl\";s:7:\"az_Cyrl\";s:7:\"az_Latn\";s:7:\"az_Latn\";s:7:\"bs_Cyrl\";s:7:\"bs_Cyrl\";s:7:\"bs_Latn\";s:7:\"bs_Latn\";s:7:\"en_Dsrt\";s:7:\"en_Dsrt\";s:7:\"ha_Latn\";s:7:\"ha_Latn\";s:7:\"kk_Cyrl\";s:7:\"kk_Cyrl\";s:7:\"ks_Arab\";s:7:\"ks_Arab\";s:7:\"ky_Cyrl\";s:7:\"ky_Cyrl\";s:10:\"ky_Cyrl_KG\";s:10:\"ky_Cyrl_KG\";s:7:\"mn_Cyrl\";s:7:\"mn_Cyrl\";s:7:\"ms_Latn\";s:7:\"ms_Latn\";s:8:\"ordinals\";s:8:\"ordinals\";s:7:\"pa_Arab\";s:7:\"pa_Arab\";s:7:\"pa_Guru\";s:7:\"pa_Guru\";s:7:\"plurals\";s:7:\"plurals\";s:8:\"shi_Latn\";s:8:\"shi_Latn\";s:8:\"shi_Tfng\";s:8:\"shi_Tfng\";s:7:\"sr_Cyrl\";s:7:\"sr_Cyrl\";s:7:\"sr_Latn\";s:7:\"sr_Latn\";s:7:\"tg_Cyrl\";s:7:\"tg_Cyrl\";s:8:\"tzm_Latn\";s:8:\"tzm_Latn\";s:7:\"ug_Arab\";s:7:\"ug_Arab\";s:10:\"ug_Arab_CN\";s:10:\"ug_Arab_CN\";s:7:\"uz_Arab\";s:7:\"uz_Arab\";s:7:\"uz_Cyrl\";s:7:\"uz_Cyrl\";s:7:\"uz_Latn\";s:7:\"uz_Latn\";s:8:\"vai_Latn\";s:8:\"vai_Latn\";s:8:\"vai_Vaii\";s:8:\"vai_Vaii\";}',1441887404,1444306604),('pimcore_translations_admin_data','a:0:{}',1441887392,1441888391),('Zend_LocaleC_en_language_aa','s:11:\"s:4:\"Afar\";\";',1441887392,1444306592),('Zend_LocaleC_en_language_aa_DJ','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_aa_ER','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_aa_ET','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_af','s:16:\"s:9:\"Afrikaans\";\";',1441887392,1444306592),('Zend_LocaleC_en_language_af_NA','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_af_ZA','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_agq','s:12:\"s:5:\"Aghem\";\";',1441887392,1444306592),('Zend_LocaleC_en_language_agq_CM','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_ak','s:11:\"s:4:\"Akan\";\";',1441887392,1444306592),('Zend_LocaleC_en_language_ak_GH','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_am','s:14:\"s:7:\"Amharic\";\";',1441887392,1444306592),('Zend_LocaleC_en_language_am_ET','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar','s:13:\"s:6:\"Arabic\";\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar_001','s:30:\"s:22:\"Modern Standard Arabic\";\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar_AE','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar_BH','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar_DJ','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar_DZ','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar_EG','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar_EH','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar_ER','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar_IL','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar_IQ','s:4:\"b:0;\";',1441887392,1444306592),('Zend_LocaleC_en_language_ar_JO','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_KM','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_KW','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_LB','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_LY','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_MA','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_MR','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_OM','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_PS','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_QA','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_SA','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_SD','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_SO','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_SS','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_SY','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_TD','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_TN','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ar_YE','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_as','s:15:\"s:8:\"Assamese\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_asa','s:10:\"s:3:\"Asu\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_asa_TZ','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_ast','s:15:\"s:8:\"Asturian\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_ast_ES','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_as_IN','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_az','s:19:\"s:11:\"Azerbaijani\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_az_AZ','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_az_Cyrl','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_az_Cyrl_AZ','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_az_Latn','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_az_Latn_AZ','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_bas','s:12:\"s:5:\"Basaa\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_bas_CM','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_be','s:18:\"s:10:\"Belarusian\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_bem','s:12:\"s:5:\"Bemba\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_bem_ZM','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_bez','s:11:\"s:4:\"Bena\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_bez_TZ','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_be_BY','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_bg','s:16:\"s:9:\"Bulgarian\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_bg_BG','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_bm','s:14:\"s:7:\"Bambara\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_bm_ML','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_bn','s:14:\"s:7:\"Bengali\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_bn_BD','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_bn_IN','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_bo','s:14:\"s:7:\"Tibetan\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_bo_CN','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_bo_IN','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_br','s:13:\"s:6:\"Breton\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_brx','s:11:\"s:4:\"Bodo\";\";',1441887393,1444306593),('Zend_LocaleC_en_language_brx_IN','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_br_FR','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_language_bs','s:14:\"s:7:\"Bosnian\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_bs_BA','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_bs_Cyrl','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_bs_Cyrl_BA','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_bs_Latn','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_bs_Latn_BA','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_byn','s:11:\"s:4:\"Blin\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_byn_ER','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_ca','s:14:\"s:7:\"Catalan\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_ca_AD','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_ca_ES','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_ca_ES_VALENCIA','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_ca_FR','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_ca_IT','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_cgg','s:12:\"s:5:\"Chiga\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_cgg_UG','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_chr','s:15:\"s:8:\"Cherokee\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_chr_US','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_cs','s:12:\"s:5:\"Czech\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_cs_CZ','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_cy','s:12:\"s:5:\"Welsh\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_cy_GB','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_da','s:13:\"s:6:\"Danish\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_dav','s:12:\"s:5:\"Taita\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_dav_KE','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_da_DK','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_da_GL','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_de','s:13:\"s:6:\"German\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_de_AT','s:23:\"s:15:\"Austrian German\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_de_BE','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_de_CH','s:25:\"s:17:\"Swiss High German\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_de_DE','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_de_LI','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_de_LU','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_dje','s:12:\"s:5:\"Zarma\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_dje_NE','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_dua','s:12:\"s:5:\"Duala\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_dua_CM','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_dyo','s:18:\"s:10:\"Jola-Fonyi\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_dyo_SN','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_dz','s:15:\"s:8:\"Dzongkha\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_dz_BT','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_ebu','s:11:\"s:4:\"Embu\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_ebu_KE','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_ee','s:10:\"s:3:\"Ewe\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_ee_GH','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_ee_TG','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_el','s:12:\"s:5:\"Greek\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_el_CY','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_el_GR','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_en','s:14:\"s:7:\"English\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_en_001','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_en_150','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_en_AG','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_en_AI','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_en_AS','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_en_AU','s:26:\"s:18:\"Australian English\";\";',1441887394,1444306594),('Zend_LocaleC_en_language_en_BB','s:4:\"b:0;\";',1441887394,1444306594),('Zend_LocaleC_en_language_en_BE','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_BM','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_BS','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_BW','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_BZ','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_CA','s:24:\"s:16:\"Canadian English\";\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_CC','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_CK','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_CM','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_CX','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_DG','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_DM','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_Dsrt','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_Dsrt_US','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_ER','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_FJ','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_FK','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_FM','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_GB','s:23:\"s:15:\"British English\";\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_GD','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_GG','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_GH','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_GI','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_GM','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_GU','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_GY','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_HK','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_IE','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_IM','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_IN','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_IO','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_JE','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_JM','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_KE','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_KI','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_KN','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_KY','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_LC','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_LR','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_LS','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_MG','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_MH','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_MO','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_MP','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_MS','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_MT','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_MU','s:4:\"b:0;\";',1441887395,1444306595),('Zend_LocaleC_en_language_en_MW','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_NA','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_NF','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_NG','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_NR','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_NU','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_NZ','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_PG','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_PH','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_PK','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_PN','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_PR','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_PW','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_RW','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_SB','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_SC','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_SD','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_SG','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_SH','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_SL','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_SS','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_SX','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_SZ','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_TC','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_TK','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_TO','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_TT','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_TV','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_TZ','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_UG','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_UM','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_US','s:24:\"s:16:\"American English\";\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_US_POSIX','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_VC','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_VG','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_VI','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_VU','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_WS','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_ZA','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_ZM','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_en_ZW','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_eo','s:16:\"s:9:\"Esperanto\";\";',1441887396,1444306596),('Zend_LocaleC_en_language_eo_001','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_es','s:14:\"s:7:\"Spanish\";\";',1441887396,1444306596),('Zend_LocaleC_en_language_es_419','s:30:\"s:22:\"Latin American Spanish\";\";',1441887396,1444306596),('Zend_LocaleC_en_language_es_AR','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_es_BO','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_es_CL','s:4:\"b:0;\";',1441887396,1444306596),('Zend_LocaleC_en_language_es_CO','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_CR','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_CU','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_DO','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_EA','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_EC','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_ES','s:24:\"s:16:\"European Spanish\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_GQ','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_GT','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_HN','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_IC','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_MX','s:23:\"s:15:\"Mexican Spanish\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_NI','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_PA','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_PE','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_PH','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_PR','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_PY','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_SV','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_US','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_UY','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_es_VE','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_et','s:15:\"s:8:\"Estonian\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_et_EE','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_eu','s:13:\"s:6:\"Basque\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_eu_ES','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_ewo','s:13:\"s:6:\"Ewondo\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_ewo_CM','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fa','s:14:\"s:7:\"Persian\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_fa_AF','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fa_IR','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_ff','s:12:\"s:5:\"Fulah\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_ff_CM','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_ff_GN','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_ff_MR','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_ff_SN','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fi','s:14:\"s:7:\"Finnish\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_fil','s:15:\"s:8:\"Filipino\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_fil_PH','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fi_FI','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fo','s:14:\"s:7:\"Faroese\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_fo_FO','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr','s:13:\"s:6:\"French\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr_BE','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr_BF','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr_BI','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr_BJ','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr_BL','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr_CA','s:23:\"s:15:\"Canadian French\";\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr_CD','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr_CF','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr_CG','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_CH','s:20:\"s:12:\"Swiss French\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_CI','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_CM','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_DJ','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_DZ','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_FR','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_GA','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_GF','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_GN','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_GP','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_GQ','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_HT','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_KM','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_LU','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_MA','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_MC','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_MF','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_MG','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_ML','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_MQ','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_MR','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_MU','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_NC','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_NE','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_PF','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_PM','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr_RE','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_RW','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_SC','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_SN','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_SY','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_TD','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_TG','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_TN','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_VU','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fr_WF','s:4:\"b:0;\";',1441887397,1444306597),('Zend_LocaleC_en_language_fr_YT','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fur','s:15:\"s:8:\"Friulian\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_fur_IT','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_fy','s:23:\"s:15:\"Western Frisian\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_fy_NL','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_ga','s:12:\"s:5:\"Irish\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_ga_IE','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_gd','s:23:\"s:15:\"Scottish Gaelic\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_gd_GB','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_gl','s:15:\"s:8:\"Galician\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_gl_ES','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_gsw','s:20:\"s:12:\"Swiss German\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_gsw_CH','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_gsw_LI','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_gu','s:15:\"s:8:\"Gujarati\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_guz','s:12:\"s:5:\"Gusii\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_guz_KE','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_gu_IN','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_gv','s:11:\"s:4:\"Manx\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_gv_IM','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_ha','s:12:\"s:5:\"Hausa\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_haw','s:15:\"s:8:\"Hawaiian\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_haw_US','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_ha_GH','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_ha_Latn','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_ha_Latn_GH','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_ha_Latn_NE','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_ha_Latn_NG','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_ha_NE','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_ha_NG','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_he','s:13:\"s:6:\"Hebrew\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_he_IL','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_hi','s:12:\"s:5:\"Hindi\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_hi_IN','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_hr','s:15:\"s:8:\"Croatian\";\";',1441887398,1444306598),('Zend_LocaleC_en_language_hr_BA','s:4:\"b:0;\";',1441887398,1444306598),('Zend_LocaleC_en_language_hr_HR','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_hu','s:16:\"s:9:\"Hungarian\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_hu_HU','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_hy','s:15:\"s:8:\"Armenian\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_hy_AM','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ia','s:19:\"s:11:\"Interlingua\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_ia_FR','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_id','s:18:\"s:10:\"Indonesian\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_id_ID','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ig','s:11:\"s:4:\"Igbo\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_ig_NG','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ii','s:18:\"s:10:\"Sichuan Yi\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_ii_CN','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_is','s:16:\"s:9:\"Icelandic\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_is_IS','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_it','s:14:\"s:7:\"Italian\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_it_CH','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_it_IT','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_it_SM','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ja','s:15:\"s:8:\"Japanese\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_ja_JP','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_jgo','s:13:\"s:6:\"Ngomba\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_jgo_CM','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_jmc','s:14:\"s:7:\"Machame\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_jmc_TZ','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ka','s:15:\"s:8:\"Georgian\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kab','s:13:\"s:6:\"Kabyle\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kab_DZ','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_kam','s:12:\"s:5:\"Kamba\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kam_KE','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ka_GE','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_kde','s:14:\"s:7:\"Makonde\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kde_TZ','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_kea','s:20:\"s:12:\"Kabuverdianu\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kea_CV','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_khq','s:20:\"s:12:\"Koyra Chiini\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_khq_ML','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ki','s:13:\"s:6:\"Kikuyu\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_ki_KE','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_kk','s:13:\"s:6:\"Kazakh\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kkj','s:11:\"s:4:\"Kako\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kkj_CM','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_kk_Cyrl','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_kk_Cyrl_KZ','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_kk_KZ','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_kl','s:19:\"s:11:\"Kalaallisut\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kln','s:15:\"s:8:\"Kalenjin\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kln_KE','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_kl_GL','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_km','s:12:\"s:5:\"Khmer\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_km_KH','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_kn','s:14:\"s:7:\"Kannada\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kn_IN','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ko','s:13:\"s:6:\"Korean\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kok','s:14:\"s:7:\"Konkani\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kok_IN','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ko_KP','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ko_KR','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ks','s:15:\"s:8:\"Kashmiri\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_ksb','s:15:\"s:8:\"Shambala\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_ksb_TZ','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ksf','s:12:\"s:5:\"Bafia\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_ksf_CM','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ksh','s:16:\"s:9:\"Colognian\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_ksh_DE','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ks_Arab','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ks_Arab_IN','s:4:\"b:0;\";',1441887399,1444306599),('Zend_LocaleC_en_language_ks_IN','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_kw','s:14:\"s:7:\"Cornish\";\";',1441887399,1444306599),('Zend_LocaleC_en_language_kw_GB','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ky','s:13:\"s:6:\"Kyrgyz\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_ky_Cyrl','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ky_Cyrl_KG','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_lag','s:12:\"s:5:\"Langi\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_lag_TZ','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_lg','s:12:\"s:5:\"Ganda\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_lg_UG','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_lkt','s:13:\"s:6:\"Lakota\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_lkt_US','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ln','s:14:\"s:7:\"Lingala\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_ln_AO','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ln_CD','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ln_CF','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ln_CG','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_lo','s:10:\"s:3:\"Lao\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_lo_LA','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_lt','s:18:\"s:10:\"Lithuanian\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_lt_LT','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_lu','s:20:\"s:12:\"Luba-Katanga\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_luo','s:10:\"s:3:\"Luo\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_luo_KE','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_luy','s:12:\"s:5:\"Luyia\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_luy_KE','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_lu_CD','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_lv','s:14:\"s:7:\"Latvian\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_lv_LV','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mas','s:12:\"s:5:\"Masai\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_mas_KE','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mas_TZ','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mer','s:11:\"s:4:\"Meru\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_mer_KE','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mfe','s:15:\"s:8:\"Morisyen\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_mfe_MU','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mg','s:15:\"s:8:\"Malagasy\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_mgh','s:22:\"s:14:\"Makhuwa-Meetto\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_mgh_MZ','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mgo','s:12:\"s:5:\"Meta\'\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_mgo_CM','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mg_MG','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mk','s:18:\"s:10:\"Macedonian\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_mk_MK','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ml','s:16:\"s:9:\"Malayalam\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_ml_IN','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mn','s:16:\"s:9:\"Mongolian\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_mn_Cyrl','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mn_Cyrl_MN','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mn_MN','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_mr','s:14:\"s:7:\"Marathi\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_mr_IN','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ms','s:12:\"s:5:\"Malay\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_ms_BN','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_ms_Latn','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ms_Latn_BN','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ms_Latn_MY','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ms_Latn_SG','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ms_MY','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_ms_SG','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_mt','s:14:\"s:7:\"Maltese\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_mt_MT','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_mua','s:14:\"s:7:\"Mundang\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_mua_CM','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_my','s:14:\"s:7:\"Burmese\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_my_MM','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_naq','s:11:\"s:4:\"Nama\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_naq_NA','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_nb','s:25:\"s:17:\"Norwegian Bokmål\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_nb_NO','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_nb_SJ','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_nd','s:21:\"s:13:\"North Ndebele\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_nd_ZW','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ne','s:13:\"s:6:\"Nepali\";\";',1441887400,1444306600),('Zend_LocaleC_en_language_ne_IN','s:4:\"b:0;\";',1441887400,1444306600),('Zend_LocaleC_en_language_ne_NP','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nl','s:12:\"s:5:\"Dutch\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_nl_AW','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nl_BE','s:14:\"s:7:\"Flemish\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_nl_BQ','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nl_CW','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nl_NL','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nl_SR','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nl_SX','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nmg','s:13:\"s:6:\"Kwasio\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_nmg_CM','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nn','s:25:\"s:17:\"Norwegian Nynorsk\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_nnh','s:16:\"s:9:\"Ngiemboon\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_nnh_CM','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nn_NO','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nr','s:21:\"s:13:\"South Ndebele\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_nr_ZA','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nso','s:22:\"s:14:\"Northern Sotho\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_nso_ZA','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nus','s:11:\"s:4:\"Nuer\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_nus_SD','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_nyn','s:15:\"s:8:\"Nyankole\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_nyn_UG','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_om','s:12:\"s:5:\"Oromo\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_om_ET','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_om_KE','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_or','s:12:\"s:5:\"Oriya\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_ordinals','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_or_IN','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_os','s:14:\"s:7:\"Ossetic\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_os_GE','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_os_RU','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pa','s:14:\"s:7:\"Punjabi\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_pa_Arab','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pa_Arab_PK','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pa_Guru','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pa_Guru_IN','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pa_IN','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_pa_PK','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_pl','s:13:\"s:6:\"Polish\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_plurals','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pl_PL','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_ps','s:13:\"s:6:\"Pashto\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_ps_AF','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pt','s:18:\"s:10:\"Portuguese\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_pt_AO','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pt_BR','s:28:\"s:20:\"Brazilian Portuguese\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_pt_CV','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pt_GW','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pt_MO','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pt_MZ','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pt_PT','s:27:\"s:19:\"European Portuguese\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_pt_ST','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_pt_TL','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_rm','s:14:\"s:7:\"Romansh\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_rm_CH','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_rn','s:12:\"s:5:\"Rundi\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_rn_BI','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_ro','s:15:\"s:8:\"Romanian\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_rof','s:12:\"s:5:\"Rombo\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_rof_TZ','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_root','s:11:\"s:4:\"Root\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_ro_MD','s:16:\"s:9:\"Moldavian\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_ro_RO','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_ru','s:14:\"s:7:\"Russian\";\";',1441887401,1444306601),('Zend_LocaleC_en_language_ru_BY','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_ru_KG','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_ru_KZ','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_ru_MD','s:4:\"b:0;\";',1441887401,1444306601),('Zend_LocaleC_en_language_ru_RU','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_ru_UA','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_rw','s:19:\"s:11:\"Kinyarwanda\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_rwk','s:10:\"s:3:\"Rwa\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_rwk_TZ','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_rw_RW','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sah','s:12:\"s:5:\"Sakha\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_sah_RU','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_saq','s:14:\"s:7:\"Samburu\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_saq_KE','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sbp','s:12:\"s:5:\"Sangu\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_sbp_TZ','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_se','s:21:\"s:13:\"Northern Sami\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_seh','s:11:\"s:4:\"Sena\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_seh_MZ','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_ses','s:23:\"s:15:\"Koyraboro Senni\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_ses_ML','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_se_FI','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_se_NO','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sg','s:12:\"s:5:\"Sango\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_sg_CF','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_shi','s:16:\"s:9:\"Tachelhit\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_shi_Latn','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_shi_Latn_MA','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_shi_MA','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_shi_Tfng','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_shi_Tfng_MA','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_si','s:14:\"s:7:\"Sinhala\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_si_LK','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sk','s:13:\"s:6:\"Slovak\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_sk_SK','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sl','s:16:\"s:9:\"Slovenian\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_sl_SI','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sn','s:12:\"s:5:\"Shona\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_sn_ZW','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_so','s:13:\"s:6:\"Somali\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_so_DJ','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_so_ET','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_so_KE','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_so_SO','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sq','s:15:\"s:8:\"Albanian\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_sq_AL','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sq_MK','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sq_XK','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr','s:14:\"s:7:\"Serbian\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr_BA','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_sr_Cyrl','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr_Cyrl_BA','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr_Cyrl_ME','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr_Cyrl_RS','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr_Cyrl_XK','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr_Latn','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr_Latn_BA','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr_Latn_ME','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr_Latn_RS','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr_Latn_XK','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sr_ME','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_sr_RS','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_sr_XK','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_ss','s:12:\"s:5:\"Swati\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_ssy','s:11:\"s:4:\"Saho\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_ssy_ER','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_ss_SZ','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_ss_ZA','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_st','s:22:\"s:14:\"Southern Sotho\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_st_LS','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_st_ZA','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sv','s:14:\"s:7:\"Swedish\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_sv_AX','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sv_FI','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sv_SE','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sw','s:14:\"s:7:\"Swahili\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_swc','s:21:\"s:13:\"Congo Swahili\";\";',1441887402,1444306602),('Zend_LocaleC_en_language_swc_CD','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_sw_KE','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sw_TZ','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_sw_UG','s:4:\"b:0;\";',1441887402,1444306602),('Zend_LocaleC_en_language_ta','s:12:\"s:5:\"Tamil\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_ta_IN','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_ta_LK','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_ta_MY','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_ta_SG','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_te','s:13:\"s:6:\"Telugu\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_teo','s:11:\"s:4:\"Teso\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_teo_KE','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_teo_UG','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_te_IN','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_tg','s:12:\"s:5:\"Tajik\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_tg_Cyrl','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_tg_Cyrl_TJ','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_tg_TJ','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_th','s:11:\"s:4:\"Thai\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_th_TH','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_ti','s:15:\"s:8:\"Tigrinya\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_tig','s:12:\"s:5:\"Tigre\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_tig_ER','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_ti_ER','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_ti_ET','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_tn','s:13:\"s:6:\"Tswana\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_tn_BW','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_tn_ZA','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_to','s:13:\"s:6:\"Tongan\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_to_TO','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_tr','s:14:\"s:7:\"Turkish\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_tr_CY','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_tr_TR','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_ts','s:13:\"s:6:\"Tsonga\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_ts_ZA','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_twq','s:14:\"s:7:\"Tasawaq\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_twq_NE','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_tzm','s:31:\"s:23:\"Central Atlas Tamazight\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_tzm_Latn','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_tzm_Latn_MA','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_tzm_MA','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_ug','s:13:\"s:6:\"Uyghur\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_ug_Arab','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_ug_Arab_CN','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_uk','s:16:\"s:9:\"Ukrainian\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_uk_UA','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_ur','s:11:\"s:4:\"Urdu\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_ur_IN','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_ur_PK','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_uz','s:12:\"s:5:\"Uzbek\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_uz_AF','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_uz_Arab','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_uz_Arab_AF','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_uz_Cyrl','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_uz_Cyrl_UZ','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_uz_Latn','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_uz_Latn_UZ','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_uz_UZ','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_vai','s:10:\"s:3:\"Vai\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_vai_Latn','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_vai_Latn_LR','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_vai_LR','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_vai_Vaii','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_vai_Vaii_LR','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_ve','s:12:\"s:5:\"Venda\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_ve_ZA','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_vi','s:18:\"s:10:\"Vietnamese\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_vi_VN','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_vo','s:15:\"s:8:\"Volapük\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_vo_001','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_vun','s:12:\"s:5:\"Vunjo\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_vun_TZ','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_wae','s:13:\"s:6:\"Walser\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_wae_CH','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_wal','s:15:\"s:8:\"Wolaytta\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_wal_ET','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_xh','s:12:\"s:5:\"Xhosa\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_xh_ZA','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_xog','s:11:\"s:4:\"Soga\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_xog_UG','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_yav','s:14:\"s:7:\"Yangben\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_yav_CM','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_yo','s:13:\"s:6:\"Yoruba\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_yo_BJ','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_yo_NG','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_zgh','s:35:\"s:27:\"Standard Moroccan Tamazight\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_zgh_MA','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_zh','s:14:\"s:7:\"Chinese\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_zh_CN','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_zh_Hans','s:26:\"s:18:\"Simplified Chinese\";\";',1441887403,1444306603),('Zend_LocaleC_en_language_zh_Hans_CN','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_zh_Hans_HK','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_zh_Hans_MO','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_zh_Hans_SG','s:4:\"b:0;\";',1441887403,1444306603),('Zend_LocaleC_en_language_zh_Hant','s:27:\"s:19:\"Traditional Chinese\";\";',1441887404,1444306604),('Zend_LocaleC_en_language_zh_Hant_HK','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_zh_Hant_MO','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_zh_Hant_TW','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_zh_HK','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_zh_MO','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_zh_SG','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_zh_TW','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_language_zu','s:11:\"s:4:\"Zulu\";\";',1441887404,1444306604),('Zend_LocaleC_en_language_zu_ZA','s:4:\"b:0;\";',1441887404,1444306604),('Zend_LocaleC_en_territory_','s:4:\"b:0;\";',1441887393,1444306593),('Zend_LocaleC_en_territory_001','s:12:\"s:5:\"World\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_150','s:13:\"s:6:\"Europe\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_AD','s:14:\"s:7:\"Andorra\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_AE','s:28:\"s:20:\"United Arab Emirates\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_AF','s:19:\"s:11:\"Afghanistan\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_AG','s:27:\"s:19:\"Antigua and Barbuda\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_AI','s:15:\"s:8:\"Anguilla\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_AL','s:14:\"s:7:\"Albania\";\";',1441887402,1444306602),('Zend_LocaleC_en_territory_AM','s:14:\"s:7:\"Armenia\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_AO','s:13:\"s:6:\"Angola\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_AR','s:16:\"s:9:\"Argentina\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_AS','s:22:\"s:14:\"American Samoa\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_AW','s:12:\"s:5:\"Aruba\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_AX','s:22:\"s:14:\"Åland Islands\";\";',1441887402,1444306602),('Zend_LocaleC_en_territory_AZ','s:18:\"s:10:\"Azerbaijan\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_BA','s:30:\"s:22:\"Bosnia and Herzegovina\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_BB','s:15:\"s:8:\"Barbados\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_BD','s:18:\"s:10:\"Bangladesh\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_BE','s:14:\"s:7:\"Belgium\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_BF','s:20:\"s:12:\"Burkina Faso\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_BG','s:15:\"s:8:\"Bulgaria\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_BH','s:14:\"s:7:\"Bahrain\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_BI','s:14:\"s:7:\"Burundi\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_BJ','s:12:\"s:5:\"Benin\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_BL','s:25:\"s:17:\"Saint Barthélemy\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_BM','s:14:\"s:7:\"Bermuda\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_BN','s:13:\"s:6:\"Brunei\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_BO','s:14:\"s:7:\"Bolivia\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_BQ','s:29:\"s:21:\"Caribbean Netherlands\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_BS','s:14:\"s:7:\"Bahamas\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_BT','s:13:\"s:6:\"Bhutan\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_BW','s:15:\"s:8:\"Botswana\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_BY','s:14:\"s:7:\"Belarus\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_BZ','s:13:\"s:6:\"Belize\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_CC','s:31:\"s:23:\"Cocos (Keeling) Islands\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_CD','s:24:\"s:16:\"Congo - Kinshasa\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_CF','s:32:\"s:24:\"Central African Republic\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_CG','s:27:\"s:19:\"Congo - Brazzaville\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_CH','s:19:\"s:11:\"Switzerland\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_CI','s:24:\"s:16:\"Côte d’Ivoire\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_CK','s:20:\"s:12:\"Cook Islands\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_CL','s:12:\"s:5:\"Chile\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_CM','s:15:\"s:8:\"Cameroon\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_CN','s:12:\"s:5:\"China\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_CO','s:15:\"s:8:\"Colombia\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_CR','s:18:\"s:10:\"Costa Rica\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_CU','s:11:\"s:4:\"Cuba\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_CV','s:18:\"s:10:\"Cape Verde\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_CW','s:15:\"s:8:\"Curaçao\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_CX','s:24:\"s:16:\"Christmas Island\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_CY','s:13:\"s:6:\"Cyprus\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_CZ','s:22:\"s:14:\"Czech Republic\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_DE','s:14:\"s:7:\"Germany\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_DG','s:20:\"s:12:\"Diego Garcia\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_DJ','s:15:\"s:8:\"Djibouti\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_DK','s:14:\"s:7:\"Denmark\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_DM','s:15:\"s:8:\"Dominica\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_DO','s:26:\"s:18:\"Dominican Republic\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_DZ','s:14:\"s:7:\"Algeria\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_EA','s:25:\"s:17:\"Ceuta and Melilla\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_EC','s:14:\"s:7:\"Ecuador\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_EE','s:14:\"s:7:\"Estonia\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_EG','s:12:\"s:5:\"Egypt\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_EH','s:22:\"s:14:\"Western Sahara\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_ER','s:14:\"s:7:\"Eritrea\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_ES','s:12:\"s:5:\"Spain\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_ET','s:15:\"s:8:\"Ethiopia\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_FI','s:14:\"s:7:\"Finland\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_FJ','s:11:\"s:4:\"Fiji\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_FK','s:24:\"s:16:\"Falkland Islands\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_FM','s:18:\"s:10:\"Micronesia\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_FO','s:21:\"s:13:\"Faroe Islands\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_FR','s:13:\"s:6:\"France\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_GA','s:12:\"s:5:\"Gabon\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_GB','s:22:\"s:14:\"United Kingdom\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_GD','s:14:\"s:7:\"Grenada\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_GE','s:14:\"s:7:\"Georgia\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_GF','s:21:\"s:13:\"French Guiana\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_GG','s:15:\"s:8:\"Guernsey\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_GH','s:12:\"s:5:\"Ghana\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_GI','s:16:\"s:9:\"Gibraltar\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_GL','s:16:\"s:9:\"Greenland\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_GM','s:13:\"s:6:\"Gambia\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_GN','s:13:\"s:6:\"Guinea\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_GP','s:18:\"s:10:\"Guadeloupe\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_GQ','s:25:\"s:17:\"Equatorial Guinea\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_GR','s:13:\"s:6:\"Greece\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_GT','s:16:\"s:9:\"Guatemala\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_GU','s:11:\"s:4:\"Guam\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_GW','s:21:\"s:13:\"Guinea-Bissau\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_GY','s:13:\"s:6:\"Guyana\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_HK','s:27:\"s:19:\"Hong Kong SAR China\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_HN','s:15:\"s:8:\"Honduras\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_HR','s:14:\"s:7:\"Croatia\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_HT','s:12:\"s:5:\"Haiti\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_HU','s:14:\"s:7:\"Hungary\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_IC','s:22:\"s:14:\"Canary Islands\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_ID','s:16:\"s:9:\"Indonesia\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_IE','s:14:\"s:7:\"Ireland\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_IL','s:13:\"s:6:\"Israel\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_IM','s:19:\"s:11:\"Isle of Man\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_IN','s:12:\"s:5:\"India\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_IO','s:38:\"s:30:\"British Indian Ocean Territory\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_IQ','s:11:\"s:4:\"Iraq\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_IR','s:11:\"s:4:\"Iran\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_IS','s:14:\"s:7:\"Iceland\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_IT','s:12:\"s:5:\"Italy\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_JE','s:13:\"s:6:\"Jersey\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_JM','s:14:\"s:7:\"Jamaica\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_JO','s:13:\"s:6:\"Jordan\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_JP','s:12:\"s:5:\"Japan\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_KE','s:12:\"s:5:\"Kenya\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_KG','s:18:\"s:10:\"Kyrgyzstan\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_KH','s:15:\"s:8:\"Cambodia\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_KI','s:15:\"s:8:\"Kiribati\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_KM','s:14:\"s:7:\"Comoros\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_KN','s:29:\"s:21:\"Saint Kitts and Nevis\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_KP','s:19:\"s:11:\"North Korea\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_KR','s:19:\"s:11:\"South Korea\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_KW','s:13:\"s:6:\"Kuwait\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_KY','s:22:\"s:14:\"Cayman Islands\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_KZ','s:18:\"s:10:\"Kazakhstan\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_LA','s:11:\"s:4:\"Laos\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_LB','s:14:\"s:7:\"Lebanon\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_LC','s:19:\"s:11:\"Saint Lucia\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_LI','s:21:\"s:13:\"Liechtenstein\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_LK','s:16:\"s:9:\"Sri Lanka\";\";',1441887402,1444306602),('Zend_LocaleC_en_territory_LR','s:14:\"s:7:\"Liberia\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_LS','s:14:\"s:7:\"Lesotho\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_LT','s:16:\"s:9:\"Lithuania\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_LU','s:18:\"s:10:\"Luxembourg\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_LV','s:13:\"s:6:\"Latvia\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_LY','s:12:\"s:5:\"Libya\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_MA','s:14:\"s:7:\"Morocco\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_MC','s:13:\"s:6:\"Monaco\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_MD','s:14:\"s:7:\"Moldova\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_ME','s:18:\"s:10:\"Montenegro\";\";',1441887402,1444306602),('Zend_LocaleC_en_territory_MF','s:20:\"s:12:\"Saint Martin\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_MG','s:18:\"s:10:\"Madagascar\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_MH','s:24:\"s:16:\"Marshall Islands\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_MK','s:16:\"s:9:\"Macedonia\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_ML','s:11:\"s:4:\"Mali\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_MM','s:23:\"s:15:\"Myanmar (Burma)\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_MN','s:15:\"s:8:\"Mongolia\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_MO','s:23:\"s:15:\"Macau SAR China\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_MP','s:32:\"s:24:\"Northern Mariana Islands\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_MQ','s:18:\"s:10:\"Martinique\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_MR','s:18:\"s:10:\"Mauritania\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_MS','s:18:\"s:10:\"Montserrat\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_MT','s:12:\"s:5:\"Malta\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_MU','s:16:\"s:9:\"Mauritius\";\";',1441887395,1444306595),('Zend_LocaleC_en_territory_MW','s:13:\"s:6:\"Malawi\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_MY','s:15:\"s:8:\"Malaysia\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_MZ','s:18:\"s:10:\"Mozambique\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_NA','s:14:\"s:7:\"Namibia\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_NC','s:21:\"s:13:\"New Caledonia\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_NE','s:12:\"s:5:\"Niger\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_NF','s:22:\"s:14:\"Norfolk Island\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_NG','s:14:\"s:7:\"Nigeria\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_NI','s:16:\"s:9:\"Nicaragua\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_NL','s:19:\"s:11:\"Netherlands\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_NO','s:13:\"s:6:\"Norway\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_NP','s:12:\"s:5:\"Nepal\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_NR','s:12:\"s:5:\"Nauru\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_NU','s:11:\"s:4:\"Niue\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_NZ','s:19:\"s:11:\"New Zealand\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_OM','s:11:\"s:4:\"Oman\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_PA','s:13:\"s:6:\"Panama\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_PE','s:11:\"s:4:\"Peru\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_PF','s:24:\"s:16:\"French Polynesia\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_PG','s:24:\"s:16:\"Papua New Guinea\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_PH','s:19:\"s:11:\"Philippines\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_PK','s:15:\"s:8:\"Pakistan\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_PL','s:13:\"s:6:\"Poland\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_PM','s:33:\"s:25:\"Saint Pierre and Miquelon\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_PN','s:24:\"s:16:\"Pitcairn Islands\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_PR','s:19:\"s:11:\"Puerto Rico\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_PS','s:31:\"s:23:\"Palestinian Territories\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_PW','s:12:\"s:5:\"Palau\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_PY','s:15:\"s:8:\"Paraguay\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_QA','s:12:\"s:5:\"Qatar\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_RE','s:15:\"s:8:\"Réunion\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_RO','s:14:\"s:7:\"Romania\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_RS','s:13:\"s:6:\"Serbia\";\";',1441887402,1444306602),('Zend_LocaleC_en_territory_RU','s:13:\"s:6:\"Russia\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_RW','s:13:\"s:6:\"Rwanda\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_SA','s:20:\"s:12:\"Saudi Arabia\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_SB','s:23:\"s:15:\"Solomon Islands\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_SC','s:18:\"s:10:\"Seychelles\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_SD','s:12:\"s:5:\"Sudan\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_SE','s:13:\"s:6:\"Sweden\";\";',1441887402,1444306602),('Zend_LocaleC_en_territory_SG','s:16:\"s:9:\"Singapore\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_SH','s:20:\"s:12:\"Saint Helena\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_SI','s:15:\"s:8:\"Slovenia\";\";',1441887402,1444306602),('Zend_LocaleC_en_territory_SJ','s:30:\"s:22:\"Svalbard and Jan Mayen\";\";',1441887400,1444306600),('Zend_LocaleC_en_territory_SK','s:15:\"s:8:\"Slovakia\";\";',1441887402,1444306602),('Zend_LocaleC_en_territory_SL','s:20:\"s:12:\"Sierra Leone\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_SM','s:18:\"s:10:\"San Marino\";\";',1441887399,1444306599),('Zend_LocaleC_en_territory_SN','s:14:\"s:7:\"Senegal\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_SO','s:14:\"s:7:\"Somalia\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_SR','s:15:\"s:8:\"Suriname\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_SS','s:19:\"s:11:\"South Sudan\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_ST','s:32:\"s:24:\"São Tomé and Príncipe\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_SV','s:19:\"s:11:\"El Salvador\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_SX','s:20:\"s:12:\"Sint Maarten\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_SY','s:12:\"s:5:\"Syria\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_SZ','s:16:\"s:9:\"Swaziland\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_TC','s:32:\"s:24:\"Turks and Caicos Islands\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_TD','s:11:\"s:4:\"Chad\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_TG','s:11:\"s:4:\"Togo\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_TH','s:15:\"s:8:\"Thailand\";\";',1441887403,1444306603),('Zend_LocaleC_en_territory_TJ','s:18:\"s:10:\"Tajikistan\";\";',1441887403,1444306603),('Zend_LocaleC_en_territory_TK','s:14:\"s:7:\"Tokelau\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_TL','s:19:\"s:11:\"Timor-Leste\";\";',1441887401,1444306601),('Zend_LocaleC_en_territory_TN','s:14:\"s:7:\"Tunisia\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_TO','s:12:\"s:5:\"Tonga\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_TR','s:13:\"s:6:\"Turkey\";\";',1441887403,1444306603),('Zend_LocaleC_en_territory_TT','s:27:\"s:19:\"Trinidad and Tobago\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_TV','s:13:\"s:6:\"Tuvalu\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_TW','s:13:\"s:6:\"Taiwan\";\";',1441887404,1444306604),('Zend_LocaleC_en_territory_TZ','s:15:\"s:8:\"Tanzania\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_UA','s:14:\"s:7:\"Ukraine\";\";',1441887402,1444306602),('Zend_LocaleC_en_territory_UG','s:13:\"s:6:\"Uganda\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_UM','s:29:\"s:21:\"U.S. Outlying Islands\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_US','s:21:\"s:13:\"United States\";\";',1441887394,1444306594),('Zend_LocaleC_en_territory_UY','s:14:\"s:7:\"Uruguay\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_UZ','s:18:\"s:10:\"Uzbekistan\";\";',1441887403,1444306603),('Zend_LocaleC_en_territory_VC','s:32:\"s:24:\"St. Vincent & Grenadines\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_VE','s:16:\"s:9:\"Venezuela\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_VG','s:30:\"s:22:\"British Virgin Islands\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_VI','s:27:\"s:19:\"U.S. Virgin Islands\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_VN','s:14:\"s:7:\"Vietnam\";\";',1441887403,1444306603),('Zend_LocaleC_en_territory_VU','s:14:\"s:7:\"Vanuatu\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_WF','s:25:\"s:17:\"Wallis and Futuna\";\";',1441887397,1444306597),('Zend_LocaleC_en_territory_WS','s:12:\"s:5:\"Samoa\";\";',1441887396,1444306596),('Zend_LocaleC_en_territory_XK','s:13:\"s:6:\"Kosovo\";\";',1441887402,1444306602),('Zend_LocaleC_en_territory_YE','s:12:\"s:5:\"Yemen\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_YT','s:14:\"s:7:\"Mayotte\";\";',1441887398,1444306598),('Zend_LocaleC_en_territory_ZA','s:20:\"s:12:\"South Africa\";\";',1441887392,1444306592),('Zend_LocaleC_en_territory_ZM','s:13:\"s:6:\"Zambia\";\";',1441887393,1444306593),('Zend_LocaleC_en_territory_ZW','s:15:\"s:8:\"Zimbabwe\";\";',1441887396,1444306596);
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
INSERT INTO `cache_tags` VALUES ('Zend_LocaleC_en_language_aa','Zend_Locale'),('Zend_LocaleC_en_language_aa_DJ','Zend_Locale'),('Zend_LocaleC_en_territory_DJ','Zend_Locale'),('Zend_LocaleC_en_language_aa_ER','Zend_Locale'),('pimcore_translations_admin_data','translator'),('Zend_LocaleC_en_territory_ER','Zend_Locale'),('pimcore_translations_admin_data','translate'),('pimcore_translations_admin_data','translations_admin_data'),('Zend_LocaleC_en_language_aa_ET','Zend_Locale'),('Zend_LocaleC_en_territory_ET','Zend_Locale'),('Zend_LocaleC_en_language_af','Zend_Locale'),('Zend_LocaleC_en_language_af_NA','Zend_Locale'),('Zend_LocaleC_en_territory_NA','Zend_Locale'),('Zend_LocaleC_en_language_af_ZA','Zend_Locale'),('Zend_LocaleC_en_territory_ZA','Zend_Locale'),('Zend_LocaleC_en_language_agq','Zend_Locale'),('Zend_LocaleC_en_language_agq_CM','Zend_Locale'),('Zend_LocaleC_en_territory_CM','Zend_Locale'),('Zend_LocaleC_en_language_ak','Zend_Locale'),('Zend_LocaleC_en_language_ak_GH','Zend_Locale'),('Zend_LocaleC_en_territory_GH','Zend_Locale'),('Zend_LocaleC_en_language_am','Zend_Locale'),('Zend_LocaleC_en_language_am_ET','Zend_Locale'),('Zend_LocaleC_en_language_ar','Zend_Locale'),('Zend_LocaleC_en_language_ar_001','Zend_Locale'),('Zend_LocaleC_en_language_ar_AE','Zend_Locale'),('Zend_LocaleC_en_territory_AE','Zend_Locale'),('Zend_LocaleC_en_language_ar_BH','Zend_Locale'),('Zend_LocaleC_en_territory_BH','Zend_Locale'),('Zend_LocaleC_en_language_ar_DJ','Zend_Locale'),('Zend_LocaleC_en_language_ar_DZ','Zend_Locale'),('Zend_LocaleC_en_territory_DZ','Zend_Locale'),('Zend_LocaleC_en_language_ar_EG','Zend_Locale'),('Zend_LocaleC_en_territory_EG','Zend_Locale'),('Zend_LocaleC_en_language_ar_EH','Zend_Locale'),('Zend_LocaleC_en_territory_EH','Zend_Locale'),('Zend_LocaleC_en_language_ar_ER','Zend_Locale'),('Zend_LocaleC_en_language_ar_IL','Zend_Locale'),('Zend_LocaleC_en_territory_IL','Zend_Locale'),('Zend_LocaleC_en_language_ar_IQ','Zend_Locale'),('Zend_LocaleC_en_territory_IQ','Zend_Locale'),('Zend_LocaleC_en_language_ar_JO','Zend_Locale'),('Zend_LocaleC_en_territory_JO','Zend_Locale'),('Zend_LocaleC_en_language_ar_KM','Zend_Locale'),('Zend_LocaleC_en_territory_KM','Zend_Locale'),('Zend_LocaleC_en_language_ar_KW','Zend_Locale'),('Zend_LocaleC_en_territory_KW','Zend_Locale'),('Zend_LocaleC_en_language_ar_LB','Zend_Locale'),('Zend_LocaleC_en_territory_LB','Zend_Locale'),('Zend_LocaleC_en_language_ar_LY','Zend_Locale'),('Zend_LocaleC_en_territory_LY','Zend_Locale'),('Zend_LocaleC_en_language_ar_MA','Zend_Locale'),('Zend_LocaleC_en_territory_MA','Zend_Locale'),('Zend_LocaleC_en_language_ar_MR','Zend_Locale'),('Zend_LocaleC_en_territory_MR','Zend_Locale'),('Zend_LocaleC_en_language_ar_OM','Zend_Locale'),('Zend_LocaleC_en_territory_OM','Zend_Locale'),('Zend_LocaleC_en_language_ar_PS','Zend_Locale'),('Zend_LocaleC_en_territory_PS','Zend_Locale'),('Zend_LocaleC_en_language_ar_QA','Zend_Locale'),('Zend_LocaleC_en_territory_QA','Zend_Locale'),('Zend_LocaleC_en_language_ar_SA','Zend_Locale'),('Zend_LocaleC_en_territory_SA','Zend_Locale'),('Zend_LocaleC_en_language_ar_SD','Zend_Locale'),('Zend_LocaleC_en_territory_SD','Zend_Locale'),('Zend_LocaleC_en_language_ar_SO','Zend_Locale'),('Zend_LocaleC_en_territory_SO','Zend_Locale'),('Zend_LocaleC_en_language_ar_SS','Zend_Locale'),('Zend_LocaleC_en_territory_SS','Zend_Locale'),('Zend_LocaleC_en_language_ar_SY','Zend_Locale'),('Zend_LocaleC_en_territory_SY','Zend_Locale'),('Zend_LocaleC_en_language_ar_TD','Zend_Locale'),('Zend_LocaleC_en_territory_TD','Zend_Locale'),('Zend_LocaleC_en_language_ar_TN','Zend_Locale'),('Zend_LocaleC_en_territory_TN','Zend_Locale'),('Zend_LocaleC_en_language_ar_YE','Zend_Locale'),('Zend_LocaleC_en_territory_YE','Zend_Locale'),('Zend_LocaleC_en_language_as','Zend_Locale'),('Zend_LocaleC_en_language_as_IN','Zend_Locale'),('Zend_LocaleC_en_territory_IN','Zend_Locale'),('Zend_LocaleC_en_language_asa','Zend_Locale'),('Zend_LocaleC_en_language_asa_TZ','Zend_Locale'),('Zend_LocaleC_en_territory_TZ','Zend_Locale'),('Zend_LocaleC_en_language_ast','Zend_Locale'),('Zend_LocaleC_en_language_ast_ES','Zend_Locale'),('Zend_LocaleC_en_territory_ES','Zend_Locale'),('Zend_LocaleC_en_language_az','Zend_Locale'),('Zend_LocaleC_en_language_az_Cyrl','Zend_Locale'),('Zend_LocaleC_en_territory_','Zend_Locale'),('Zend_LocaleC_en_language_az_Cyrl_AZ','Zend_Locale'),('Zend_LocaleC_en_territory_AZ','Zend_Locale'),('Zend_LocaleC_en_language_az_Latn','Zend_Locale'),('Zend_LocaleC_en_language_az_Latn_AZ','Zend_Locale'),('Zend_LocaleC_en_language_bas','Zend_Locale'),('Zend_LocaleC_en_language_bas_CM','Zend_Locale'),('Zend_LocaleC_en_language_be','Zend_Locale'),('Zend_LocaleC_en_language_be_BY','Zend_Locale'),('Zend_LocaleC_en_territory_BY','Zend_Locale'),('Zend_LocaleC_en_language_bem','Zend_Locale'),('Zend_LocaleC_en_language_bem_ZM','Zend_Locale'),('Zend_LocaleC_en_territory_ZM','Zend_Locale'),('Zend_LocaleC_en_language_bez','Zend_Locale'),('Zend_LocaleC_en_language_bez_TZ','Zend_Locale'),('Zend_LocaleC_en_language_bg','Zend_Locale'),('Zend_LocaleC_en_language_bg_BG','Zend_Locale'),('Zend_LocaleC_en_territory_BG','Zend_Locale'),('Zend_LocaleC_en_language_bm','Zend_Locale'),('Zend_LocaleC_en_language_bm_ML','Zend_Locale'),('Zend_LocaleC_en_territory_ML','Zend_Locale'),('Zend_LocaleC_en_language_bn','Zend_Locale'),('Zend_LocaleC_en_language_bn_BD','Zend_Locale'),('Zend_LocaleC_en_territory_BD','Zend_Locale'),('Zend_LocaleC_en_language_bn_IN','Zend_Locale'),('Zend_LocaleC_en_language_bo','Zend_Locale'),('Zend_LocaleC_en_language_bo_CN','Zend_Locale'),('Zend_LocaleC_en_territory_CN','Zend_Locale'),('Zend_LocaleC_en_language_bo_IN','Zend_Locale'),('Zend_LocaleC_en_language_br','Zend_Locale'),('Zend_LocaleC_en_language_br_FR','Zend_Locale'),('Zend_LocaleC_en_territory_FR','Zend_Locale'),('Zend_LocaleC_en_language_brx','Zend_Locale'),('Zend_LocaleC_en_language_brx_IN','Zend_Locale'),('Zend_LocaleC_en_language_bs','Zend_Locale'),('Zend_LocaleC_en_language_bs_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_bs_Cyrl_BA','Zend_Locale'),('Zend_LocaleC_en_territory_BA','Zend_Locale'),('Zend_LocaleC_en_language_bs_Latn','Zend_Locale'),('Zend_LocaleC_en_language_bs_Latn_BA','Zend_Locale'),('Zend_LocaleC_en_language_byn','Zend_Locale'),('Zend_LocaleC_en_language_byn_ER','Zend_Locale'),('Zend_LocaleC_en_language_ca','Zend_Locale'),('Zend_LocaleC_en_language_ca_AD','Zend_Locale'),('Zend_LocaleC_en_territory_AD','Zend_Locale'),('Zend_LocaleC_en_language_ca_ES','Zend_Locale'),('Zend_LocaleC_en_language_ca_ES_VALENCIA','Zend_Locale'),('Zend_LocaleC_en_language_ca_FR','Zend_Locale'),('Zend_LocaleC_en_language_ca_IT','Zend_Locale'),('Zend_LocaleC_en_territory_IT','Zend_Locale'),('Zend_LocaleC_en_language_cgg','Zend_Locale'),('Zend_LocaleC_en_language_cgg_UG','Zend_Locale'),('Zend_LocaleC_en_territory_UG','Zend_Locale'),('Zend_LocaleC_en_language_chr','Zend_Locale'),('Zend_LocaleC_en_language_chr_US','Zend_Locale'),('Zend_LocaleC_en_territory_US','Zend_Locale'),('Zend_LocaleC_en_language_cs','Zend_Locale'),('Zend_LocaleC_en_language_cs_CZ','Zend_Locale'),('Zend_LocaleC_en_territory_CZ','Zend_Locale'),('Zend_LocaleC_en_language_cy','Zend_Locale'),('Zend_LocaleC_en_language_cy_GB','Zend_Locale'),('Zend_LocaleC_en_territory_GB','Zend_Locale'),('Zend_LocaleC_en_language_da','Zend_Locale'),('Zend_LocaleC_en_language_da_DK','Zend_Locale'),('Zend_LocaleC_en_territory_DK','Zend_Locale'),('Zend_LocaleC_en_language_da_GL','Zend_Locale'),('Zend_LocaleC_en_territory_GL','Zend_Locale'),('Zend_LocaleC_en_language_dav','Zend_Locale'),('Zend_LocaleC_en_language_dav_KE','Zend_Locale'),('Zend_LocaleC_en_territory_KE','Zend_Locale'),('Zend_LocaleC_en_language_de','Zend_Locale'),('Zend_LocaleC_en_language_de_AT','Zend_Locale'),('Zend_LocaleC_en_language_de_BE','Zend_Locale'),('Zend_LocaleC_en_territory_BE','Zend_Locale'),('Zend_LocaleC_en_language_de_CH','Zend_Locale'),('Zend_LocaleC_en_language_de_DE','Zend_Locale'),('Zend_LocaleC_en_territory_DE','Zend_Locale'),('Zend_LocaleC_en_language_de_LI','Zend_Locale'),('Zend_LocaleC_en_territory_LI','Zend_Locale'),('Zend_LocaleC_en_language_de_LU','Zend_Locale'),('Zend_LocaleC_en_territory_LU','Zend_Locale'),('Zend_LocaleC_en_language_dje','Zend_Locale'),('Zend_LocaleC_en_language_dje_NE','Zend_Locale'),('Zend_LocaleC_en_territory_NE','Zend_Locale'),('Zend_LocaleC_en_language_dua','Zend_Locale'),('Zend_LocaleC_en_language_dua_CM','Zend_Locale'),('Zend_LocaleC_en_language_dyo','Zend_Locale'),('Zend_LocaleC_en_language_dyo_SN','Zend_Locale'),('Zend_LocaleC_en_territory_SN','Zend_Locale'),('Zend_LocaleC_en_language_dz','Zend_Locale'),('Zend_LocaleC_en_language_dz_BT','Zend_Locale'),('Zend_LocaleC_en_territory_BT','Zend_Locale'),('Zend_LocaleC_en_language_ebu','Zend_Locale'),('Zend_LocaleC_en_language_ebu_KE','Zend_Locale'),('Zend_LocaleC_en_language_ee','Zend_Locale'),('Zend_LocaleC_en_language_ee_GH','Zend_Locale'),('Zend_LocaleC_en_language_ee_TG','Zend_Locale'),('Zend_LocaleC_en_territory_TG','Zend_Locale'),('Zend_LocaleC_en_language_el','Zend_Locale'),('Zend_LocaleC_en_language_el_CY','Zend_Locale'),('Zend_LocaleC_en_territory_CY','Zend_Locale'),('Zend_LocaleC_en_language_el_GR','Zend_Locale'),('Zend_LocaleC_en_territory_GR','Zend_Locale'),('Zend_LocaleC_en_language_en','Zend_Locale'),('Zend_LocaleC_en_language_en_001','Zend_Locale'),('Zend_LocaleC_en_territory_001','Zend_Locale'),('Zend_LocaleC_en_language_en_150','Zend_Locale'),('Zend_LocaleC_en_territory_150','Zend_Locale'),('Zend_LocaleC_en_language_en_AG','Zend_Locale'),('Zend_LocaleC_en_territory_AG','Zend_Locale'),('Zend_LocaleC_en_language_en_AI','Zend_Locale'),('Zend_LocaleC_en_territory_AI','Zend_Locale'),('Zend_LocaleC_en_language_en_AS','Zend_Locale'),('Zend_LocaleC_en_territory_AS','Zend_Locale'),('Zend_LocaleC_en_language_en_AU','Zend_Locale'),('Zend_LocaleC_en_language_en_BB','Zend_Locale'),('Zend_LocaleC_en_territory_BB','Zend_Locale'),('Zend_LocaleC_en_language_en_BE','Zend_Locale'),('Zend_LocaleC_en_language_en_BM','Zend_Locale'),('Zend_LocaleC_en_territory_BM','Zend_Locale'),('Zend_LocaleC_en_language_en_BS','Zend_Locale'),('Zend_LocaleC_en_territory_BS','Zend_Locale'),('Zend_LocaleC_en_language_en_BW','Zend_Locale'),('Zend_LocaleC_en_territory_BW','Zend_Locale'),('Zend_LocaleC_en_language_en_BZ','Zend_Locale'),('Zend_LocaleC_en_territory_BZ','Zend_Locale'),('Zend_LocaleC_en_language_en_CA','Zend_Locale'),('Zend_LocaleC_en_language_en_CC','Zend_Locale'),('Zend_LocaleC_en_territory_CC','Zend_Locale'),('Zend_LocaleC_en_language_en_CK','Zend_Locale'),('Zend_LocaleC_en_territory_CK','Zend_Locale'),('Zend_LocaleC_en_language_en_CM','Zend_Locale'),('Zend_LocaleC_en_language_en_CX','Zend_Locale'),('Zend_LocaleC_en_territory_CX','Zend_Locale'),('Zend_LocaleC_en_language_en_DG','Zend_Locale'),('Zend_LocaleC_en_territory_DG','Zend_Locale'),('Zend_LocaleC_en_language_en_DM','Zend_Locale'),('Zend_LocaleC_en_territory_DM','Zend_Locale'),('Zend_LocaleC_en_language_en_Dsrt','Zend_Locale'),('Zend_LocaleC_en_language_en_Dsrt_US','Zend_Locale'),('Zend_LocaleC_en_language_en_ER','Zend_Locale'),('Zend_LocaleC_en_language_en_FJ','Zend_Locale'),('Zend_LocaleC_en_territory_FJ','Zend_Locale'),('Zend_LocaleC_en_language_en_FK','Zend_Locale'),('Zend_LocaleC_en_territory_FK','Zend_Locale'),('Zend_LocaleC_en_language_en_FM','Zend_Locale'),('Zend_LocaleC_en_territory_FM','Zend_Locale'),('Zend_LocaleC_en_language_en_GB','Zend_Locale'),('Zend_LocaleC_en_language_en_GD','Zend_Locale'),('Zend_LocaleC_en_territory_GD','Zend_Locale'),('Zend_LocaleC_en_language_en_GG','Zend_Locale'),('Zend_LocaleC_en_territory_GG','Zend_Locale'),('Zend_LocaleC_en_language_en_GH','Zend_Locale'),('Zend_LocaleC_en_language_en_GI','Zend_Locale'),('Zend_LocaleC_en_territory_GI','Zend_Locale'),('Zend_LocaleC_en_language_en_GM','Zend_Locale'),('Zend_LocaleC_en_territory_GM','Zend_Locale'),('Zend_LocaleC_en_language_en_GU','Zend_Locale'),('Zend_LocaleC_en_territory_GU','Zend_Locale'),('Zend_LocaleC_en_language_en_GY','Zend_Locale'),('Zend_LocaleC_en_territory_GY','Zend_Locale'),('Zend_LocaleC_en_language_en_HK','Zend_Locale'),('Zend_LocaleC_en_territory_HK','Zend_Locale'),('Zend_LocaleC_en_language_en_IE','Zend_Locale'),('Zend_LocaleC_en_territory_IE','Zend_Locale'),('Zend_LocaleC_en_language_en_IM','Zend_Locale'),('Zend_LocaleC_en_territory_IM','Zend_Locale'),('Zend_LocaleC_en_language_en_IN','Zend_Locale'),('Zend_LocaleC_en_language_en_IO','Zend_Locale'),('Zend_LocaleC_en_territory_IO','Zend_Locale'),('Zend_LocaleC_en_language_en_JE','Zend_Locale'),('Zend_LocaleC_en_territory_JE','Zend_Locale'),('Zend_LocaleC_en_language_en_JM','Zend_Locale'),('Zend_LocaleC_en_territory_JM','Zend_Locale'),('Zend_LocaleC_en_language_en_KE','Zend_Locale'),('Zend_LocaleC_en_language_en_KI','Zend_Locale'),('Zend_LocaleC_en_territory_KI','Zend_Locale'),('Zend_LocaleC_en_language_en_KN','Zend_Locale'),('Zend_LocaleC_en_territory_KN','Zend_Locale'),('Zend_LocaleC_en_language_en_KY','Zend_Locale'),('Zend_LocaleC_en_territory_KY','Zend_Locale'),('Zend_LocaleC_en_language_en_LC','Zend_Locale'),('Zend_LocaleC_en_territory_LC','Zend_Locale'),('Zend_LocaleC_en_language_en_LR','Zend_Locale'),('Zend_LocaleC_en_territory_LR','Zend_Locale'),('Zend_LocaleC_en_language_en_LS','Zend_Locale'),('Zend_LocaleC_en_territory_LS','Zend_Locale'),('Zend_LocaleC_en_language_en_MG','Zend_Locale'),('Zend_LocaleC_en_territory_MG','Zend_Locale'),('Zend_LocaleC_en_language_en_MH','Zend_Locale'),('Zend_LocaleC_en_territory_MH','Zend_Locale'),('Zend_LocaleC_en_language_en_MO','Zend_Locale'),('Zend_LocaleC_en_territory_MO','Zend_Locale'),('Zend_LocaleC_en_language_en_MP','Zend_Locale'),('Zend_LocaleC_en_territory_MP','Zend_Locale'),('Zend_LocaleC_en_language_en_MS','Zend_Locale'),('Zend_LocaleC_en_territory_MS','Zend_Locale'),('Zend_LocaleC_en_language_en_MT','Zend_Locale'),('Zend_LocaleC_en_territory_MT','Zend_Locale'),('Zend_LocaleC_en_language_en_MU','Zend_Locale'),('Zend_LocaleC_en_territory_MU','Zend_Locale'),('Zend_LocaleC_en_language_en_MW','Zend_Locale'),('Zend_LocaleC_en_territory_MW','Zend_Locale'),('Zend_LocaleC_en_language_en_NA','Zend_Locale'),('Zend_LocaleC_en_language_en_NF','Zend_Locale'),('Zend_LocaleC_en_territory_NF','Zend_Locale'),('Zend_LocaleC_en_language_en_NG','Zend_Locale'),('Zend_LocaleC_en_territory_NG','Zend_Locale'),('Zend_LocaleC_en_language_en_NR','Zend_Locale'),('Zend_LocaleC_en_territory_NR','Zend_Locale'),('Zend_LocaleC_en_language_en_NU','Zend_Locale'),('Zend_LocaleC_en_territory_NU','Zend_Locale'),('Zend_LocaleC_en_language_en_NZ','Zend_Locale'),('Zend_LocaleC_en_territory_NZ','Zend_Locale'),('Zend_LocaleC_en_language_en_PG','Zend_Locale'),('Zend_LocaleC_en_territory_PG','Zend_Locale'),('Zend_LocaleC_en_language_en_PH','Zend_Locale'),('Zend_LocaleC_en_territory_PH','Zend_Locale'),('Zend_LocaleC_en_language_en_PK','Zend_Locale'),('Zend_LocaleC_en_territory_PK','Zend_Locale'),('Zend_LocaleC_en_language_en_PN','Zend_Locale'),('Zend_LocaleC_en_territory_PN','Zend_Locale'),('Zend_LocaleC_en_language_en_PR','Zend_Locale'),('Zend_LocaleC_en_territory_PR','Zend_Locale'),('Zend_LocaleC_en_language_en_PW','Zend_Locale'),('Zend_LocaleC_en_territory_PW','Zend_Locale'),('Zend_LocaleC_en_language_en_RW','Zend_Locale'),('Zend_LocaleC_en_territory_RW','Zend_Locale'),('Zend_LocaleC_en_language_en_SB','Zend_Locale'),('Zend_LocaleC_en_territory_SB','Zend_Locale'),('Zend_LocaleC_en_language_en_SC','Zend_Locale'),('Zend_LocaleC_en_territory_SC','Zend_Locale'),('Zend_LocaleC_en_language_en_SD','Zend_Locale'),('Zend_LocaleC_en_language_en_SG','Zend_Locale'),('Zend_LocaleC_en_territory_SG','Zend_Locale'),('Zend_LocaleC_en_language_en_SH','Zend_Locale'),('Zend_LocaleC_en_territory_SH','Zend_Locale'),('Zend_LocaleC_en_language_en_SL','Zend_Locale'),('Zend_LocaleC_en_territory_SL','Zend_Locale'),('Zend_LocaleC_en_language_en_SS','Zend_Locale'),('Zend_LocaleC_en_language_en_SX','Zend_Locale'),('Zend_LocaleC_en_territory_SX','Zend_Locale'),('Zend_LocaleC_en_language_en_SZ','Zend_Locale'),('Zend_LocaleC_en_territory_SZ','Zend_Locale'),('Zend_LocaleC_en_language_en_TC','Zend_Locale'),('Zend_LocaleC_en_territory_TC','Zend_Locale'),('Zend_LocaleC_en_language_en_TK','Zend_Locale'),('Zend_LocaleC_en_territory_TK','Zend_Locale'),('Zend_LocaleC_en_language_en_TO','Zend_Locale'),('Zend_LocaleC_en_territory_TO','Zend_Locale'),('Zend_LocaleC_en_language_en_TT','Zend_Locale'),('Zend_LocaleC_en_territory_TT','Zend_Locale'),('Zend_LocaleC_en_language_en_TV','Zend_Locale'),('Zend_LocaleC_en_territory_TV','Zend_Locale'),('Zend_LocaleC_en_language_en_TZ','Zend_Locale'),('Zend_LocaleC_en_language_en_UG','Zend_Locale'),('Zend_LocaleC_en_language_en_UM','Zend_Locale'),('Zend_LocaleC_en_territory_UM','Zend_Locale'),('Zend_LocaleC_en_language_en_US','Zend_Locale'),('Zend_LocaleC_en_language_en_US_POSIX','Zend_Locale'),('Zend_LocaleC_en_language_en_VC','Zend_Locale'),('Zend_LocaleC_en_territory_VC','Zend_Locale'),('Zend_LocaleC_en_language_en_VG','Zend_Locale'),('Zend_LocaleC_en_territory_VG','Zend_Locale'),('Zend_LocaleC_en_language_en_VI','Zend_Locale'),('Zend_LocaleC_en_territory_VI','Zend_Locale'),('Zend_LocaleC_en_language_en_VU','Zend_Locale'),('Zend_LocaleC_en_territory_VU','Zend_Locale'),('Zend_LocaleC_en_language_en_WS','Zend_Locale'),('Zend_LocaleC_en_territory_WS','Zend_Locale'),('Zend_LocaleC_en_language_en_ZA','Zend_Locale'),('Zend_LocaleC_en_language_en_ZM','Zend_Locale'),('Zend_LocaleC_en_language_en_ZW','Zend_Locale'),('Zend_LocaleC_en_territory_ZW','Zend_Locale'),('Zend_LocaleC_en_language_eo','Zend_Locale'),('Zend_LocaleC_en_language_eo_001','Zend_Locale'),('Zend_LocaleC_en_language_es','Zend_Locale'),('Zend_LocaleC_en_language_es_419','Zend_Locale'),('Zend_LocaleC_en_language_es_AR','Zend_Locale'),('Zend_LocaleC_en_territory_AR','Zend_Locale'),('Zend_LocaleC_en_language_es_BO','Zend_Locale'),('Zend_LocaleC_en_territory_BO','Zend_Locale'),('Zend_LocaleC_en_language_es_CL','Zend_Locale'),('Zend_LocaleC_en_territory_CL','Zend_Locale'),('Zend_LocaleC_en_language_es_CO','Zend_Locale'),('Zend_LocaleC_en_territory_CO','Zend_Locale'),('Zend_LocaleC_en_language_es_CR','Zend_Locale'),('Zend_LocaleC_en_territory_CR','Zend_Locale'),('Zend_LocaleC_en_language_es_CU','Zend_Locale'),('Zend_LocaleC_en_territory_CU','Zend_Locale'),('Zend_LocaleC_en_language_es_DO','Zend_Locale'),('Zend_LocaleC_en_territory_DO','Zend_Locale'),('Zend_LocaleC_en_language_es_EA','Zend_Locale'),('Zend_LocaleC_en_territory_EA','Zend_Locale'),('Zend_LocaleC_en_language_es_EC','Zend_Locale'),('Zend_LocaleC_en_territory_EC','Zend_Locale'),('Zend_LocaleC_en_language_es_ES','Zend_Locale'),('Zend_LocaleC_en_language_es_GQ','Zend_Locale'),('Zend_LocaleC_en_territory_GQ','Zend_Locale'),('Zend_LocaleC_en_language_es_GT','Zend_Locale'),('Zend_LocaleC_en_territory_GT','Zend_Locale'),('Zend_LocaleC_en_language_es_HN','Zend_Locale'),('Zend_LocaleC_en_territory_HN','Zend_Locale'),('Zend_LocaleC_en_language_es_IC','Zend_Locale'),('Zend_LocaleC_en_territory_IC','Zend_Locale'),('Zend_LocaleC_en_language_es_MX','Zend_Locale'),('Zend_LocaleC_en_language_es_NI','Zend_Locale'),('Zend_LocaleC_en_territory_NI','Zend_Locale'),('Zend_LocaleC_en_language_es_PA','Zend_Locale'),('Zend_LocaleC_en_territory_PA','Zend_Locale'),('Zend_LocaleC_en_language_es_PE','Zend_Locale'),('Zend_LocaleC_en_territory_PE','Zend_Locale'),('Zend_LocaleC_en_language_es_PH','Zend_Locale'),('Zend_LocaleC_en_language_es_PR','Zend_Locale'),('Zend_LocaleC_en_language_es_PY','Zend_Locale'),('Zend_LocaleC_en_territory_PY','Zend_Locale'),('Zend_LocaleC_en_language_es_SV','Zend_Locale'),('Zend_LocaleC_en_territory_SV','Zend_Locale'),('Zend_LocaleC_en_language_es_US','Zend_Locale'),('Zend_LocaleC_en_language_es_UY','Zend_Locale'),('Zend_LocaleC_en_territory_UY','Zend_Locale'),('Zend_LocaleC_en_language_es_VE','Zend_Locale'),('Zend_LocaleC_en_territory_VE','Zend_Locale'),('Zend_LocaleC_en_language_et','Zend_Locale'),('Zend_LocaleC_en_language_et_EE','Zend_Locale'),('Zend_LocaleC_en_territory_EE','Zend_Locale'),('Zend_LocaleC_en_language_eu','Zend_Locale'),('Zend_LocaleC_en_language_eu_ES','Zend_Locale'),('Zend_LocaleC_en_language_ewo','Zend_Locale'),('Zend_LocaleC_en_language_ewo_CM','Zend_Locale'),('Zend_LocaleC_en_language_fa','Zend_Locale'),('Zend_LocaleC_en_language_fa_AF','Zend_Locale'),('Zend_LocaleC_en_territory_AF','Zend_Locale'),('Zend_LocaleC_en_language_fa_IR','Zend_Locale'),('Zend_LocaleC_en_territory_IR','Zend_Locale'),('Zend_LocaleC_en_language_ff','Zend_Locale'),('Zend_LocaleC_en_language_ff_CM','Zend_Locale'),('Zend_LocaleC_en_language_ff_GN','Zend_Locale'),('Zend_LocaleC_en_territory_GN','Zend_Locale'),('Zend_LocaleC_en_language_ff_MR','Zend_Locale'),('Zend_LocaleC_en_language_fr_PM','Zend_Locale'),('Zend_LocaleC_en_language_fr','Zend_Locale'),('Zend_LocaleC_en_territory_PM','Zend_Locale'),('Zend_LocaleC_en_language_ff_SN','Zend_Locale'),('Zend_LocaleC_en_language_fr_WF','Zend_Locale'),('Zend_LocaleC_en_territory_WF','Zend_Locale'),('Zend_LocaleC_en_language_fi','Zend_Locale'),('Zend_LocaleC_en_language_fi_FI','Zend_Locale'),('Zend_LocaleC_en_territory_FI','Zend_Locale'),('Zend_LocaleC_en_language_fil','Zend_Locale'),('Zend_LocaleC_en_language_fil_PH','Zend_Locale'),('Zend_LocaleC_en_language_fo','Zend_Locale'),('Zend_LocaleC_en_language_fo_FO','Zend_Locale'),('Zend_LocaleC_en_territory_FO','Zend_Locale'),('Zend_LocaleC_en_language_fr_BE','Zend_Locale'),('Zend_LocaleC_en_language_fr_BF','Zend_Locale'),('Zend_LocaleC_en_territory_BF','Zend_Locale'),('Zend_LocaleC_en_language_fr_BI','Zend_Locale'),('Zend_LocaleC_en_territory_BI','Zend_Locale'),('Zend_LocaleC_en_language_fr_BJ','Zend_Locale'),('Zend_LocaleC_en_territory_BJ','Zend_Locale'),('Zend_LocaleC_en_language_fr_BL','Zend_Locale'),('Zend_LocaleC_en_territory_BL','Zend_Locale'),('Zend_LocaleC_en_language_fr_CA','Zend_Locale'),('Zend_LocaleC_en_language_fr_CD','Zend_Locale'),('Zend_LocaleC_en_territory_CD','Zend_Locale'),('Zend_LocaleC_en_language_fr_CF','Zend_Locale'),('Zend_LocaleC_en_territory_CF','Zend_Locale'),('Zend_LocaleC_en_language_fr_CG','Zend_Locale'),('Zend_LocaleC_en_territory_CG','Zend_Locale'),('Zend_LocaleC_en_language_fr_CH','Zend_Locale'),('Zend_LocaleC_en_language_fr_CI','Zend_Locale'),('Zend_LocaleC_en_territory_CI','Zend_Locale'),('Zend_LocaleC_en_language_fr_CM','Zend_Locale'),('Zend_LocaleC_en_language_fr_DJ','Zend_Locale'),('Zend_LocaleC_en_language_fr_DZ','Zend_Locale'),('Zend_LocaleC_en_language_fr_FR','Zend_Locale'),('Zend_LocaleC_en_language_fr_GA','Zend_Locale'),('Zend_LocaleC_en_territory_GA','Zend_Locale'),('Zend_LocaleC_en_language_fr_GF','Zend_Locale'),('Zend_LocaleC_en_territory_GF','Zend_Locale'),('Zend_LocaleC_en_language_fr_GN','Zend_Locale'),('Zend_LocaleC_en_language_fr_GP','Zend_Locale'),('Zend_LocaleC_en_territory_GP','Zend_Locale'),('Zend_LocaleC_en_language_fr_GQ','Zend_Locale'),('Zend_LocaleC_en_language_fr_HT','Zend_Locale'),('Zend_LocaleC_en_territory_HT','Zend_Locale'),('Zend_LocaleC_en_language_fr_KM','Zend_Locale'),('Zend_LocaleC_en_language_fr_LU','Zend_Locale'),('Zend_LocaleC_en_language_fr_MA','Zend_Locale'),('Zend_LocaleC_en_language_fr_MC','Zend_Locale'),('Zend_LocaleC_en_territory_MC','Zend_Locale'),('Zend_LocaleC_en_language_fr_MF','Zend_Locale'),('Zend_LocaleC_en_territory_MF','Zend_Locale'),('Zend_LocaleC_en_language_fr_MG','Zend_Locale'),('Zend_LocaleC_en_language_fr_ML','Zend_Locale'),('Zend_LocaleC_en_language_fr_MQ','Zend_Locale'),('Zend_LocaleC_en_territory_MQ','Zend_Locale'),('Zend_LocaleC_en_language_fr_MR','Zend_Locale'),('Zend_LocaleC_en_language_fr_MU','Zend_Locale'),('Zend_LocaleC_en_language_fr_NC','Zend_Locale'),('Zend_LocaleC_en_territory_NC','Zend_Locale'),('Zend_LocaleC_en_language_fr_NE','Zend_Locale'),('Zend_LocaleC_en_language_fr_PF','Zend_Locale'),('Zend_LocaleC_en_territory_PF','Zend_Locale'),('Zend_LocaleC_en_language_fr_RE','Zend_Locale'),('Zend_LocaleC_en_territory_RE','Zend_Locale'),('Zend_LocaleC_en_language_fr_RW','Zend_Locale'),('Zend_LocaleC_en_language_fr_SC','Zend_Locale'),('Zend_LocaleC_en_language_fr_SN','Zend_Locale'),('Zend_LocaleC_en_language_fr_SY','Zend_Locale'),('Zend_LocaleC_en_language_fr_TD','Zend_Locale'),('Zend_LocaleC_en_language_fr_TG','Zend_Locale'),('Zend_LocaleC_en_language_fr_TN','Zend_Locale'),('Zend_LocaleC_en_language_fr_VU','Zend_Locale'),('Zend_LocaleC_en_language_fr_YT','Zend_Locale'),('Zend_LocaleC_en_territory_YT','Zend_Locale'),('Zend_LocaleC_en_language_fur','Zend_Locale'),('Zend_LocaleC_en_language_fur_IT','Zend_Locale'),('Zend_LocaleC_en_language_fy','Zend_Locale'),('Zend_LocaleC_en_language_fy_NL','Zend_Locale'),('Zend_LocaleC_en_territory_NL','Zend_Locale'),('Zend_LocaleC_en_language_ga','Zend_Locale'),('Zend_LocaleC_en_language_ga_IE','Zend_Locale'),('Zend_LocaleC_en_language_gd','Zend_Locale'),('Zend_LocaleC_en_language_gd_GB','Zend_Locale'),('Zend_LocaleC_en_language_gl','Zend_Locale'),('Zend_LocaleC_en_language_gl_ES','Zend_Locale'),('Zend_LocaleC_en_language_gsw','Zend_Locale'),('Zend_LocaleC_en_language_gsw_CH','Zend_Locale'),('Zend_LocaleC_en_territory_CH','Zend_Locale'),('Zend_LocaleC_en_language_gsw_LI','Zend_Locale'),('Zend_LocaleC_en_language_gu','Zend_Locale'),('Zend_LocaleC_en_language_gu_IN','Zend_Locale'),('Zend_LocaleC_en_language_guz','Zend_Locale'),('Zend_LocaleC_en_language_guz_KE','Zend_Locale'),('Zend_LocaleC_en_language_gv','Zend_Locale'),('Zend_LocaleC_en_language_gv_IM','Zend_Locale'),('Zend_LocaleC_en_language_ha','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn_GH','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn_NE','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn_NG','Zend_Locale'),('Zend_LocaleC_en_language_haw','Zend_Locale'),('Zend_LocaleC_en_language_haw_US','Zend_Locale'),('Zend_LocaleC_en_language_he','Zend_Locale'),('Zend_LocaleC_en_language_he_IL','Zend_Locale'),('Zend_LocaleC_en_language_hi','Zend_Locale'),('Zend_LocaleC_en_language_hi_IN','Zend_Locale'),('Zend_LocaleC_en_language_hr','Zend_Locale'),('Zend_LocaleC_en_language_hr_BA','Zend_Locale'),('Zend_LocaleC_en_language_hr_HR','Zend_Locale'),('Zend_LocaleC_en_territory_HR','Zend_Locale'),('Zend_LocaleC_en_language_hu','Zend_Locale'),('Zend_LocaleC_en_language_hu_HU','Zend_Locale'),('Zend_LocaleC_en_territory_HU','Zend_Locale'),('Zend_LocaleC_en_language_hy','Zend_Locale'),('Zend_LocaleC_en_language_hy_AM','Zend_Locale'),('Zend_LocaleC_en_territory_AM','Zend_Locale'),('Zend_LocaleC_en_language_ia','Zend_Locale'),('Zend_LocaleC_en_language_ia_FR','Zend_Locale'),('Zend_LocaleC_en_language_id','Zend_Locale'),('Zend_LocaleC_en_language_id_ID','Zend_Locale'),('Zend_LocaleC_en_territory_ID','Zend_Locale'),('Zend_LocaleC_en_language_ig','Zend_Locale'),('Zend_LocaleC_en_language_ig_NG','Zend_Locale'),('Zend_LocaleC_en_language_ii','Zend_Locale'),('Zend_LocaleC_en_language_ii_CN','Zend_Locale'),('Zend_LocaleC_en_language_is','Zend_Locale'),('Zend_LocaleC_en_language_is_IS','Zend_Locale'),('Zend_LocaleC_en_territory_IS','Zend_Locale'),('Zend_LocaleC_en_language_it','Zend_Locale'),('Zend_LocaleC_en_language_it_CH','Zend_Locale'),('Zend_LocaleC_en_language_it_IT','Zend_Locale'),('Zend_LocaleC_en_language_it_SM','Zend_Locale'),('Zend_LocaleC_en_territory_SM','Zend_Locale'),('Zend_LocaleC_en_language_ja','Zend_Locale'),('Zend_LocaleC_en_language_ja_JP','Zend_Locale'),('Zend_LocaleC_en_territory_JP','Zend_Locale'),('Zend_LocaleC_en_language_jgo','Zend_Locale'),('Zend_LocaleC_en_language_jgo_CM','Zend_Locale'),('Zend_LocaleC_en_language_jmc','Zend_Locale'),('Zend_LocaleC_en_language_jmc_TZ','Zend_Locale'),('Zend_LocaleC_en_language_ka','Zend_Locale'),('Zend_LocaleC_en_language_ka_GE','Zend_Locale'),('Zend_LocaleC_en_territory_GE','Zend_Locale'),('Zend_LocaleC_en_language_kab','Zend_Locale'),('Zend_LocaleC_en_language_kab_DZ','Zend_Locale'),('Zend_LocaleC_en_language_kam','Zend_Locale'),('Zend_LocaleC_en_language_kam_KE','Zend_Locale'),('Zend_LocaleC_en_language_kde','Zend_Locale'),('Zend_LocaleC_en_language_kde_TZ','Zend_Locale'),('Zend_LocaleC_en_language_kea','Zend_Locale'),('Zend_LocaleC_en_language_kea_CV','Zend_Locale'),('Zend_LocaleC_en_territory_CV','Zend_Locale'),('Zend_LocaleC_en_language_khq','Zend_Locale'),('Zend_LocaleC_en_language_khq_ML','Zend_Locale'),('Zend_LocaleC_en_language_ki','Zend_Locale'),('Zend_LocaleC_en_language_ki_KE','Zend_Locale'),('Zend_LocaleC_en_language_kk','Zend_Locale'),('Zend_LocaleC_en_language_kk_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_kk_Cyrl_KZ','Zend_Locale'),('Zend_LocaleC_en_territory_KZ','Zend_Locale'),('Zend_LocaleC_en_language_kkj','Zend_Locale'),('Zend_LocaleC_en_language_kkj_CM','Zend_Locale'),('Zend_LocaleC_en_language_kl','Zend_Locale'),('Zend_LocaleC_en_language_kl_GL','Zend_Locale'),('Zend_LocaleC_en_language_kln','Zend_Locale'),('Zend_LocaleC_en_language_kln_KE','Zend_Locale'),('Zend_LocaleC_en_language_km','Zend_Locale'),('Zend_LocaleC_en_language_km_KH','Zend_Locale'),('Zend_LocaleC_en_territory_KH','Zend_Locale'),('Zend_LocaleC_en_language_kn','Zend_Locale'),('Zend_LocaleC_en_language_kn_IN','Zend_Locale'),('Zend_LocaleC_en_language_ko','Zend_Locale'),('Zend_LocaleC_en_language_ko_KP','Zend_Locale'),('Zend_LocaleC_en_territory_KP','Zend_Locale'),('Zend_LocaleC_en_language_ko_KR','Zend_Locale'),('Zend_LocaleC_en_territory_KR','Zend_Locale'),('Zend_LocaleC_en_language_kok','Zend_Locale'),('Zend_LocaleC_en_language_kok_IN','Zend_Locale'),('Zend_LocaleC_en_language_ks','Zend_Locale'),('Zend_LocaleC_en_language_ks_Arab','Zend_Locale'),('Zend_LocaleC_en_language_ks_Arab_IN','Zend_Locale'),('Zend_LocaleC_en_language_ksb','Zend_Locale'),('Zend_LocaleC_en_language_ksb_TZ','Zend_Locale'),('Zend_LocaleC_en_language_ksf','Zend_Locale'),('Zend_LocaleC_en_language_ksf_CM','Zend_Locale'),('Zend_LocaleC_en_language_ksh','Zend_Locale'),('Zend_LocaleC_en_language_ksh_DE','Zend_Locale'),('Zend_LocaleC_en_language_kw','Zend_Locale'),('Zend_LocaleC_en_language_kw_GB','Zend_Locale'),('Zend_LocaleC_en_language_ky','Zend_Locale'),('Zend_LocaleC_en_language_ky_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_ky_Cyrl_KG','Zend_Locale'),('Zend_LocaleC_en_language_lag','Zend_Locale'),('Zend_LocaleC_en_language_lag_TZ','Zend_Locale'),('Zend_LocaleC_en_language_lg','Zend_Locale'),('Zend_LocaleC_en_language_lg_UG','Zend_Locale'),('Zend_LocaleC_en_language_lkt','Zend_Locale'),('Zend_LocaleC_en_language_lkt_US','Zend_Locale'),('Zend_LocaleC_en_language_ln','Zend_Locale'),('Zend_LocaleC_en_language_ln_AO','Zend_Locale'),('Zend_LocaleC_en_territory_AO','Zend_Locale'),('Zend_LocaleC_en_language_ln_CD','Zend_Locale'),('Zend_LocaleC_en_language_ln_CF','Zend_Locale'),('Zend_LocaleC_en_language_ln_CG','Zend_Locale'),('Zend_LocaleC_en_language_lo','Zend_Locale'),('Zend_LocaleC_en_language_lo_LA','Zend_Locale'),('Zend_LocaleC_en_territory_LA','Zend_Locale'),('Zend_LocaleC_en_language_lt','Zend_Locale'),('Zend_LocaleC_en_language_lt_LT','Zend_Locale'),('Zend_LocaleC_en_territory_LT','Zend_Locale'),('Zend_LocaleC_en_language_lu','Zend_Locale'),('Zend_LocaleC_en_language_lu_CD','Zend_Locale'),('Zend_LocaleC_en_language_luo','Zend_Locale'),('Zend_LocaleC_en_language_luo_KE','Zend_Locale'),('Zend_LocaleC_en_language_luy','Zend_Locale'),('Zend_LocaleC_en_language_luy_KE','Zend_Locale'),('Zend_LocaleC_en_language_lv','Zend_Locale'),('Zend_LocaleC_en_language_lv_LV','Zend_Locale'),('Zend_LocaleC_en_territory_LV','Zend_Locale'),('Zend_LocaleC_en_language_mas','Zend_Locale'),('Zend_LocaleC_en_language_mas_KE','Zend_Locale'),('Zend_LocaleC_en_language_mas_TZ','Zend_Locale'),('Zend_LocaleC_en_language_mer','Zend_Locale'),('Zend_LocaleC_en_language_mer_KE','Zend_Locale'),('Zend_LocaleC_en_language_mfe','Zend_Locale'),('Zend_LocaleC_en_language_mfe_MU','Zend_Locale'),('Zend_LocaleC_en_language_mg','Zend_Locale'),('Zend_LocaleC_en_language_mg_MG','Zend_Locale'),('Zend_LocaleC_en_language_mgh','Zend_Locale'),('Zend_LocaleC_en_language_mgh_MZ','Zend_Locale'),('Zend_LocaleC_en_territory_MZ','Zend_Locale'),('Zend_LocaleC_en_language_mgo','Zend_Locale'),('Zend_LocaleC_en_language_mgo_CM','Zend_Locale'),('Zend_LocaleC_en_language_mk','Zend_Locale'),('Zend_LocaleC_en_language_mk_MK','Zend_Locale'),('Zend_LocaleC_en_territory_MK','Zend_Locale'),('Zend_LocaleC_en_language_ml','Zend_Locale'),('Zend_LocaleC_en_language_ml_IN','Zend_Locale'),('Zend_LocaleC_en_language_mn','Zend_Locale'),('Zend_LocaleC_en_language_mn_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_mn_Cyrl_MN','Zend_Locale'),('Zend_LocaleC_en_territory_MN','Zend_Locale'),('Zend_LocaleC_en_language_mr','Zend_Locale'),('Zend_LocaleC_en_language_mr_IN','Zend_Locale'),('Zend_LocaleC_en_language_ms','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn_BN','Zend_Locale'),('Zend_LocaleC_en_territory_BN','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn_MY','Zend_Locale'),('Zend_LocaleC_en_territory_MY','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn_SG','Zend_Locale'),('Zend_LocaleC_en_language_mt','Zend_Locale'),('Zend_LocaleC_en_language_mt_MT','Zend_Locale'),('Zend_LocaleC_en_language_mua','Zend_Locale'),('Zend_LocaleC_en_language_mua_CM','Zend_Locale'),('Zend_LocaleC_en_language_my','Zend_Locale'),('Zend_LocaleC_en_language_my_MM','Zend_Locale'),('Zend_LocaleC_en_territory_MM','Zend_Locale'),('Zend_LocaleC_en_language_naq','Zend_Locale'),('Zend_LocaleC_en_language_naq_NA','Zend_Locale'),('Zend_LocaleC_en_language_nb','Zend_Locale'),('Zend_LocaleC_en_language_nb_NO','Zend_Locale'),('Zend_LocaleC_en_territory_NO','Zend_Locale'),('Zend_LocaleC_en_language_nb_SJ','Zend_Locale'),('Zend_LocaleC_en_territory_SJ','Zend_Locale'),('Zend_LocaleC_en_language_nd','Zend_Locale'),('Zend_LocaleC_en_language_nd_ZW','Zend_Locale'),('Zend_LocaleC_en_language_ne','Zend_Locale'),('Zend_LocaleC_en_language_ne_IN','Zend_Locale'),('Zend_LocaleC_en_language_ne_NP','Zend_Locale'),('Zend_LocaleC_en_territory_NP','Zend_Locale'),('Zend_LocaleC_en_language_nl','Zend_Locale'),('Zend_LocaleC_en_language_nl_AW','Zend_Locale'),('Zend_LocaleC_en_territory_AW','Zend_Locale'),('Zend_LocaleC_en_language_nl_BE','Zend_Locale'),('Zend_LocaleC_en_language_nl_BQ','Zend_Locale'),('Zend_LocaleC_en_territory_BQ','Zend_Locale'),('Zend_LocaleC_en_language_nl_CW','Zend_Locale'),('Zend_LocaleC_en_territory_CW','Zend_Locale'),('Zend_LocaleC_en_language_nl_NL','Zend_Locale'),('Zend_LocaleC_en_language_nl_SR','Zend_Locale'),('Zend_LocaleC_en_territory_SR','Zend_Locale'),('Zend_LocaleC_en_language_nl_SX','Zend_Locale'),('Zend_LocaleC_en_language_nmg','Zend_Locale'),('Zend_LocaleC_en_language_nmg_CM','Zend_Locale'),('Zend_LocaleC_en_language_nn','Zend_Locale'),('Zend_LocaleC_en_language_nn_NO','Zend_Locale'),('Zend_LocaleC_en_language_nnh','Zend_Locale'),('Zend_LocaleC_en_language_nnh_CM','Zend_Locale'),('Zend_LocaleC_en_language_nr','Zend_Locale'),('Zend_LocaleC_en_language_nr_ZA','Zend_Locale'),('Zend_LocaleC_en_language_nso','Zend_Locale'),('Zend_LocaleC_en_language_nso_ZA','Zend_Locale'),('Zend_LocaleC_en_language_nus','Zend_Locale'),('Zend_LocaleC_en_language_nus_SD','Zend_Locale'),('Zend_LocaleC_en_language_nyn','Zend_Locale'),('Zend_LocaleC_en_language_nyn_UG','Zend_Locale'),('Zend_LocaleC_en_language_om','Zend_Locale'),('Zend_LocaleC_en_language_om_ET','Zend_Locale'),('Zend_LocaleC_en_language_om_KE','Zend_Locale'),('Zend_LocaleC_en_language_or','Zend_Locale'),('Zend_LocaleC_en_language_or_IN','Zend_Locale'),('Zend_LocaleC_en_language_ordinals','Zend_Locale'),('Zend_LocaleC_en_language_root','Zend_Locale'),('Zend_LocaleC_en_language_os','Zend_Locale'),('Zend_LocaleC_en_language_os_GE','Zend_Locale'),('Zend_LocaleC_en_language_os_RU','Zend_Locale'),('Zend_LocaleC_en_territory_RU','Zend_Locale'),('Zend_LocaleC_en_language_pa','Zend_Locale'),('Zend_LocaleC_en_language_pa_Arab','Zend_Locale'),('Zend_LocaleC_en_language_pa_Arab_PK','Zend_Locale'),('Zend_LocaleC_en_language_pa_Guru','Zend_Locale'),('Zend_LocaleC_en_language_pa_Guru_IN','Zend_Locale'),('Zend_LocaleC_en_language_pl','Zend_Locale'),('Zend_LocaleC_en_language_pl_PL','Zend_Locale'),('Zend_LocaleC_en_territory_PL','Zend_Locale'),('Zend_LocaleC_en_language_plurals','Zend_Locale'),('Zend_LocaleC_en_language_ps','Zend_Locale'),('Zend_LocaleC_en_language_ps_AF','Zend_Locale'),('Zend_LocaleC_en_language_pt','Zend_Locale'),('Zend_LocaleC_en_language_pt_AO','Zend_Locale'),('Zend_LocaleC_en_language_pt_BR','Zend_Locale'),('Zend_LocaleC_en_language_pt_CV','Zend_Locale'),('Zend_LocaleC_en_language_pt_GW','Zend_Locale'),('Zend_LocaleC_en_territory_GW','Zend_Locale'),('Zend_LocaleC_en_language_pt_MO','Zend_Locale'),('Zend_LocaleC_en_language_pt_MZ','Zend_Locale'),('Zend_LocaleC_en_language_pt_PT','Zend_Locale'),('Zend_LocaleC_en_language_pt_ST','Zend_Locale'),('Zend_LocaleC_en_territory_ST','Zend_Locale'),('Zend_LocaleC_en_language_pt_TL','Zend_Locale'),('Zend_LocaleC_en_territory_TL','Zend_Locale'),('Zend_LocaleC_en_language_rm','Zend_Locale'),('Zend_LocaleC_en_language_rm_CH','Zend_Locale'),('Zend_LocaleC_en_language_rn','Zend_Locale'),('Zend_LocaleC_en_language_rn_BI','Zend_Locale'),('Zend_LocaleC_en_language_ro','Zend_Locale'),('Zend_LocaleC_en_language_ro_MD','Zend_Locale'),('Zend_LocaleC_en_language_ro_RO','Zend_Locale'),('Zend_LocaleC_en_territory_RO','Zend_Locale'),('Zend_LocaleC_en_language_rof','Zend_Locale'),('Zend_LocaleC_en_language_rof_TZ','Zend_Locale'),('Zend_LocaleC_en_language_ru','Zend_Locale'),('Zend_LocaleC_en_language_ru_BY','Zend_Locale'),('Zend_LocaleC_en_language_ru_KG','Zend_Locale'),('Zend_LocaleC_en_territory_KG','Zend_Locale'),('Zend_LocaleC_en_language_ru_KZ','Zend_Locale'),('Zend_LocaleC_en_language_ru_MD','Zend_Locale'),('Zend_LocaleC_en_territory_MD','Zend_Locale'),('Zend_LocaleC_en_language_ru_RU','Zend_Locale'),('Zend_LocaleC_en_language_ru_UA','Zend_Locale'),('Zend_LocaleC_en_territory_UA','Zend_Locale'),('Zend_LocaleC_en_language_rw','Zend_Locale'),('Zend_LocaleC_en_language_rw_RW','Zend_Locale'),('Zend_LocaleC_en_language_rwk','Zend_Locale'),('Zend_LocaleC_en_language_rwk_TZ','Zend_Locale'),('Zend_LocaleC_en_language_sah','Zend_Locale'),('Zend_LocaleC_en_language_sah_RU','Zend_Locale'),('Zend_LocaleC_en_language_saq','Zend_Locale'),('Zend_LocaleC_en_language_saq_KE','Zend_Locale'),('Zend_LocaleC_en_language_sbp','Zend_Locale'),('Zend_LocaleC_en_language_sbp_TZ','Zend_Locale'),('Zend_LocaleC_en_language_se','Zend_Locale'),('Zend_LocaleC_en_language_se_FI','Zend_Locale'),('Zend_LocaleC_en_language_se_NO','Zend_Locale'),('Zend_LocaleC_en_language_seh','Zend_Locale'),('Zend_LocaleC_en_language_seh_MZ','Zend_Locale'),('Zend_LocaleC_en_language_ses','Zend_Locale'),('Zend_LocaleC_en_language_ses_ML','Zend_Locale'),('Zend_LocaleC_en_language_sg','Zend_Locale'),('Zend_LocaleC_en_language_sg_CF','Zend_Locale'),('Zend_LocaleC_en_language_shi','Zend_Locale'),('Zend_LocaleC_en_language_shi_Latn','Zend_Locale'),('Zend_LocaleC_en_language_shi_Latn_MA','Zend_Locale'),('Zend_LocaleC_en_language_shi_Tfng','Zend_Locale'),('Zend_LocaleC_en_language_shi_Tfng_MA','Zend_Locale'),('Zend_LocaleC_en_language_si','Zend_Locale'),('Zend_LocaleC_en_language_si_LK','Zend_Locale'),('Zend_LocaleC_en_territory_LK','Zend_Locale'),('Zend_LocaleC_en_language_sk','Zend_Locale'),('Zend_LocaleC_en_language_sk_SK','Zend_Locale'),('Zend_LocaleC_en_territory_SK','Zend_Locale'),('Zend_LocaleC_en_language_sl','Zend_Locale'),('Zend_LocaleC_en_language_sl_SI','Zend_Locale'),('Zend_LocaleC_en_territory_SI','Zend_Locale'),('Zend_LocaleC_en_language_sn','Zend_Locale'),('Zend_LocaleC_en_language_sn_ZW','Zend_Locale'),('Zend_LocaleC_en_language_so','Zend_Locale'),('Zend_LocaleC_en_language_so_DJ','Zend_Locale'),('Zend_LocaleC_en_language_so_ET','Zend_Locale'),('Zend_LocaleC_en_language_so_KE','Zend_Locale'),('Zend_LocaleC_en_language_so_SO','Zend_Locale'),('Zend_LocaleC_en_language_sq','Zend_Locale'),('Zend_LocaleC_en_language_sq_AL','Zend_Locale'),('Zend_LocaleC_en_territory_AL','Zend_Locale'),('Zend_LocaleC_en_language_sq_MK','Zend_Locale'),('Zend_LocaleC_en_language_sq_XK','Zend_Locale'),('Zend_LocaleC_en_territory_XK','Zend_Locale'),('Zend_LocaleC_en_language_sr','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_BA','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_ME','Zend_Locale'),('Zend_LocaleC_en_territory_ME','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_RS','Zend_Locale'),('Zend_LocaleC_en_territory_RS','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_XK','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_BA','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_ME','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_RS','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_XK','Zend_Locale'),('Zend_LocaleC_en_language_ss','Zend_Locale'),('Zend_LocaleC_en_language_ss_SZ','Zend_Locale'),('Zend_LocaleC_en_language_ss_ZA','Zend_Locale'),('Zend_LocaleC_en_language_ssy','Zend_Locale'),('Zend_LocaleC_en_language_ssy_ER','Zend_Locale'),('Zend_LocaleC_en_language_st','Zend_Locale'),('Zend_LocaleC_en_language_st_LS','Zend_Locale'),('Zend_LocaleC_en_language_st_ZA','Zend_Locale'),('Zend_LocaleC_en_language_sv','Zend_Locale'),('Zend_LocaleC_en_language_sv_AX','Zend_Locale'),('Zend_LocaleC_en_territory_AX','Zend_Locale'),('Zend_LocaleC_en_language_sv_FI','Zend_Locale'),('Zend_LocaleC_en_language_sv_SE','Zend_Locale'),('Zend_LocaleC_en_territory_SE','Zend_Locale'),('Zend_LocaleC_en_language_sw','Zend_Locale'),('Zend_LocaleC_en_language_sw_KE','Zend_Locale'),('Zend_LocaleC_en_language_sw_TZ','Zend_Locale'),('Zend_LocaleC_en_language_sw_UG','Zend_Locale'),('Zend_LocaleC_en_language_swc','Zend_Locale'),('Zend_LocaleC_en_language_swc_CD','Zend_Locale'),('Zend_LocaleC_en_language_ta','Zend_Locale'),('Zend_LocaleC_en_language_ta_IN','Zend_Locale'),('Zend_LocaleC_en_language_ta_LK','Zend_Locale'),('Zend_LocaleC_en_language_ta_MY','Zend_Locale'),('Zend_LocaleC_en_language_ta_SG','Zend_Locale'),('Zend_LocaleC_en_language_te','Zend_Locale'),('Zend_LocaleC_en_language_te_IN','Zend_Locale'),('Zend_LocaleC_en_language_teo','Zend_Locale'),('Zend_LocaleC_en_language_teo_KE','Zend_Locale'),('Zend_LocaleC_en_language_teo_UG','Zend_Locale'),('Zend_LocaleC_en_language_tg','Zend_Locale'),('Zend_LocaleC_en_language_tg_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_tg_Cyrl_TJ','Zend_Locale'),('Zend_LocaleC_en_territory_TJ','Zend_Locale'),('Zend_LocaleC_en_language_th','Zend_Locale'),('Zend_LocaleC_en_language_th_TH','Zend_Locale'),('Zend_LocaleC_en_territory_TH','Zend_Locale'),('Zend_LocaleC_en_language_ti','Zend_Locale'),('Zend_LocaleC_en_language_ti_ER','Zend_Locale'),('Zend_LocaleC_en_language_ti_ET','Zend_Locale'),('Zend_LocaleC_en_language_tig','Zend_Locale'),('Zend_LocaleC_en_language_tig_ER','Zend_Locale'),('Zend_LocaleC_en_language_tn','Zend_Locale'),('Zend_LocaleC_en_language_tn_BW','Zend_Locale'),('Zend_LocaleC_en_language_tn_ZA','Zend_Locale'),('Zend_LocaleC_en_language_to','Zend_Locale'),('Zend_LocaleC_en_language_to_TO','Zend_Locale'),('Zend_LocaleC_en_language_tr','Zend_Locale'),('Zend_LocaleC_en_language_tr_CY','Zend_Locale'),('Zend_LocaleC_en_language_tr_TR','Zend_Locale'),('Zend_LocaleC_en_territory_TR','Zend_Locale'),('Zend_LocaleC_en_language_ts','Zend_Locale'),('Zend_LocaleC_en_language_ts_ZA','Zend_Locale'),('Zend_LocaleC_en_language_twq','Zend_Locale'),('Zend_LocaleC_en_language_twq_NE','Zend_Locale'),('Zend_LocaleC_en_language_tzm','Zend_Locale'),('Zend_LocaleC_en_language_tzm_Latn','Zend_Locale'),('Zend_LocaleC_en_language_tzm_Latn_MA','Zend_Locale'),('Zend_LocaleC_en_language_ug','Zend_Locale'),('Zend_LocaleC_en_language_ug_Arab','Zend_Locale'),('Zend_LocaleC_en_language_ug_Arab_CN','Zend_Locale'),('Zend_LocaleC_en_language_uk','Zend_Locale'),('Zend_LocaleC_en_language_uk_UA','Zend_Locale'),('Zend_LocaleC_en_language_ur','Zend_Locale'),('Zend_LocaleC_en_language_ur_IN','Zend_Locale'),('Zend_LocaleC_en_language_ur_PK','Zend_Locale'),('Zend_LocaleC_en_language_uz','Zend_Locale'),('Zend_LocaleC_en_language_uz_Arab','Zend_Locale'),('Zend_LocaleC_en_language_uz_Arab_AF','Zend_Locale'),('Zend_LocaleC_en_language_uz_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_uz_Cyrl_UZ','Zend_Locale'),('Zend_LocaleC_en_territory_UZ','Zend_Locale'),('Zend_LocaleC_en_language_uz_Latn','Zend_Locale'),('Zend_LocaleC_en_language_uz_Latn_UZ','Zend_Locale'),('Zend_LocaleC_en_language_vai','Zend_Locale'),('Zend_LocaleC_en_language_vai_Latn','Zend_Locale'),('Zend_LocaleC_en_language_vai_Latn_LR','Zend_Locale'),('Zend_LocaleC_en_language_vai_Vaii','Zend_Locale'),('Zend_LocaleC_en_language_vai_Vaii_LR','Zend_Locale'),('Zend_LocaleC_en_language_ve','Zend_Locale'),('Zend_LocaleC_en_language_ve_ZA','Zend_Locale'),('Zend_LocaleC_en_language_vi','Zend_Locale'),('Zend_LocaleC_en_language_vi_VN','Zend_Locale'),('Zend_LocaleC_en_territory_VN','Zend_Locale'),('Zend_LocaleC_en_language_vo','Zend_Locale'),('Zend_LocaleC_en_language_vo_001','Zend_Locale'),('Zend_LocaleC_en_language_vun','Zend_Locale'),('Zend_LocaleC_en_language_vun_TZ','Zend_Locale'),('Zend_LocaleC_en_language_wae','Zend_Locale'),('Zend_LocaleC_en_language_wae_CH','Zend_Locale'),('Zend_LocaleC_en_language_wal','Zend_Locale'),('Zend_LocaleC_en_language_wal_ET','Zend_Locale'),('Zend_LocaleC_en_language_xh','Zend_Locale'),('Zend_LocaleC_en_language_xh_ZA','Zend_Locale'),('Zend_LocaleC_en_language_xog','Zend_Locale'),('Zend_LocaleC_en_language_xog_UG','Zend_Locale'),('Zend_LocaleC_en_language_yav','Zend_Locale'),('Zend_LocaleC_en_language_yav_CM','Zend_Locale'),('Zend_LocaleC_en_language_yo','Zend_Locale'),('Zend_LocaleC_en_language_yo_BJ','Zend_Locale'),('Zend_LocaleC_en_language_yo_NG','Zend_Locale'),('Zend_LocaleC_en_language_zgh','Zend_Locale'),('Zend_LocaleC_en_language_zgh_MA','Zend_Locale'),('Zend_LocaleC_en_language_zh','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_CN','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_HK','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_MO','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_SG','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant_HK','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant_MO','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant_TW','Zend_Locale'),('Zend_LocaleC_en_territory_TW','Zend_Locale'),('Zend_LocaleC_en_language_zu','Zend_Locale'),('Zend_LocaleC_en_language_zu_ZA','Zend_Locale'),('Zend_LocaleC_en_language_az_AZ','Zend_Locale'),('Zend_LocaleC_en_language_bs_BA','Zend_Locale'),('Zend_LocaleC_en_language_ha_GH','Zend_Locale'),('Zend_LocaleC_en_language_ha_NE','Zend_Locale'),('Zend_LocaleC_en_language_ha_NG','Zend_Locale'),('Zend_LocaleC_en_language_kk_KZ','Zend_Locale'),('Zend_LocaleC_en_language_ks_IN','Zend_Locale'),('Zend_LocaleC_en_language_mn_MN','Zend_Locale'),('Zend_LocaleC_en_language_ms_BN','Zend_Locale'),('Zend_LocaleC_en_language_ms_MY','Zend_Locale'),('Zend_LocaleC_en_language_ms_SG','Zend_Locale'),('Zend_LocaleC_en_language_pa_IN','Zend_Locale'),('Zend_LocaleC_en_language_pa_PK','Zend_Locale'),('Zend_LocaleC_en_language_shi_MA','Zend_Locale'),('Zend_LocaleC_en_language_sr_BA','Zend_Locale'),('Zend_LocaleC_en_language_sr_ME','Zend_Locale'),('Zend_LocaleC_en_language_sr_RS','Zend_Locale'),('Zend_LocaleC_en_language_sr_XK','Zend_Locale'),('Zend_LocaleC_en_language_tg_TJ','Zend_Locale'),('Zend_LocaleC_en_language_tzm_MA','Zend_Locale'),('Zend_LocaleC_en_language_uz_AF','Zend_Locale'),('Zend_LocaleC_en_language_uz_UZ','Zend_Locale'),('Zend_LocaleC_en_language_vai_LR','Zend_Locale'),('Zend_LocaleC_en_language_zh_CN','Zend_Locale'),('Zend_LocaleC_en_language_zh_HK','Zend_Locale'),('Zend_LocaleC_en_language_zh_MO','Zend_Locale'),('Zend_LocaleC_en_language_zh_SG','Zend_Locale'),('Zend_LocaleC_en_language_zh_TW','Zend_Locale'),('pimcore_system_supported_locales_en','system'),('pimcore_system_supported_locales_en','system_supported_locales_en'),('pimcore_document_1','document_1'),('pimcore_object_1','object_1'),('pimcore_asset_1','asset_1');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
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
INSERT INTO `documents` VALUES (1,0,'page','','/',999999,1,1441887342,1441887342,1,1);
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
INSERT INTO `objects` VALUES (1,0,'folder','','/',999999,1,1441887342,1441887342,1,1,NULL,NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
INSERT INTO `users` VALUES (0,0,'user','system',NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,0,'user','admin','$2y$10$h7K6dqt0stfW8kggJy0zeeTGHuaZWBGomWVeTSxDGVOI8dZDAayVy',NULL,NULL,NULL,'en',1,1,'','',0,1,1,'','',NULL);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-10 14:19:31
