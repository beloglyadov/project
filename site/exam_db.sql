-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!50606 SET @OLD_INNODB_STATS_AUTO_RECALC=@@INNODB_STATS_AUTO_RECALC */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=OFF */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Position to start replication or point-in-time recovery from
--

CHANGE MASTER TO MASTER_LOG_FILE='binlog.000001', MASTER_LOG_POS=490456;

--
-- Current Database: `joomla`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `joomla` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `joomla`;

--
-- Table structure for table `exam_action_log_config`
--

DROP TABLE IF EXISTS `exam_action_log_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_action_log_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_action_log_config`
--

LOCK TABLES `exam_action_log_config` WRITE;
/*!40000 ALTER TABLE `exam_action_log_config` DISABLE KEYS */;
INSERT INTO `exam_action_log_config` VALUES (1,'article','com_content.article','id','title','#__content','PLG_ACTIONLOG_JOOMLA'),(2,'article','com_content.form','id','title','#__content','PLG_ACTIONLOG_JOOMLA'),(3,'banner','com_banners.banner','id','name','#__banners','PLG_ACTIONLOG_JOOMLA'),(4,'user_note','com_users.note','id','subject','#__user_notes','PLG_ACTIONLOG_JOOMLA'),(5,'media','com_media.file','','name','','PLG_ACTIONLOG_JOOMLA'),(6,'category','com_categories.category','id','title','#__categories','PLG_ACTIONLOG_JOOMLA'),(7,'menu','com_menus.menu','id','title','#__menu_types','PLG_ACTIONLOG_JOOMLA'),(8,'menu_item','com_menus.item','id','title','#__menu','PLG_ACTIONLOG_JOOMLA'),(9,'newsfeed','com_newsfeeds.newsfeed','id','name','#__newsfeeds','PLG_ACTIONLOG_JOOMLA'),(10,'link','com_redirect.link','id','old_url','#__redirect_links','PLG_ACTIONLOG_JOOMLA'),(11,'tag','com_tags.tag','id','title','#__tags','PLG_ACTIONLOG_JOOMLA'),(12,'style','com_templates.style','id','title','#__template_styles','PLG_ACTIONLOG_JOOMLA'),(13,'plugin','com_plugins.plugin','extension_id','name','#__extensions','PLG_ACTIONLOG_JOOMLA'),(14,'component_config','com_config.component','extension_id','name','','PLG_ACTIONLOG_JOOMLA'),(15,'contact','com_contact.contact','id','name','#__contact_details','PLG_ACTIONLOG_JOOMLA'),(16,'module','com_modules.module','id','title','#__modules','PLG_ACTIONLOG_JOOMLA'),(17,'access_level','com_users.level','id','title','#__viewlevels','PLG_ACTIONLOG_JOOMLA'),(18,'banner_client','com_banners.client','id','name','#__banner_clients','PLG_ACTIONLOG_JOOMLA'),(19,'application_config','com_config.application','','name','','PLG_ACTIONLOG_JOOMLA');
/*!40000 ALTER TABLE `exam_action_log_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_action_logs`
--

DROP TABLE IF EXISTS `exam_action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_action_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_language_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  KEY `idx_user_id_extension` (`user_id`,`extension`),
  KEY `idx_extension_item_id` (`extension`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_action_logs`
--

LOCK TABLES `exam_action_logs` WRITE;
/*!40000 ALTER TABLE `exam_action_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_action_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_action_logs_extensions`
--

DROP TABLE IF EXISTS `exam_action_logs_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_action_logs_extensions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_action_logs_extensions`
--

LOCK TABLES `exam_action_logs_extensions` WRITE;
/*!40000 ALTER TABLE `exam_action_logs_extensions` DISABLE KEYS */;
INSERT INTO `exam_action_logs_extensions` VALUES (1,'com_banners'),(2,'com_cache'),(3,'com_categories'),(4,'com_config'),(5,'com_contact'),(6,'com_content'),(7,'com_installer'),(8,'com_media'),(9,'com_menus'),(10,'com_messages'),(11,'com_modules'),(12,'com_newsfeeds'),(13,'com_plugins'),(14,'com_redirect'),(15,'com_tags'),(16,'com_templates'),(17,'com_users'),(18,'com_checkin');
/*!40000 ALTER TABLE `exam_action_logs_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_action_logs_users`
--

DROP TABLE IF EXISTS `exam_action_logs_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_action_logs_users` (
  `user_id` int unsigned NOT NULL,
  `notify` tinyint unsigned NOT NULL,
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_notify` (`notify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_action_logs_users`
--

LOCK TABLES `exam_action_logs_users` WRITE;
/*!40000 ALTER TABLE `exam_action_logs_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_action_logs_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_assets`
--

DROP TABLE IF EXISTS `exam_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_assets`
--

LOCK TABLES `exam_assets` WRITE;
/*!40000 ALTER TABLE `exam_assets` DISABLE KEYS */;
INSERT INTO `exam_assets` VALUES (1,0,0,95,0,'root.1','Root Asset','{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),(2,1,1,2,1,'com_admin','com_admin','{}'),(3,1,3,6,1,'com_banners','com_banners','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(4,1,7,8,1,'com_cache','com_cache','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(5,1,9,10,1,'com_checkin','com_checkin','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(6,1,11,12,1,'com_config','com_config','{}'),(7,1,13,16,1,'com_contact','com_contact','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(8,1,17,28,1,'com_content','com_content','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1}}'),(9,1,29,30,1,'com_cpanel','com_cpanel','{}'),(10,1,31,32,1,'com_installer','com_installer','{\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),(11,1,33,34,1,'com_languages','com_languages','{\"core.admin\":{\"7\":1}}'),(12,1,35,36,1,'com_login','com_login','{}'),(13,1,37,38,1,'com_mailto','com_mailto','{}'),(14,1,39,40,1,'com_massmail','com_massmail','{}'),(15,1,41,42,1,'com_media','com_media','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),(16,1,43,44,1,'com_menus','com_menus','{\"core.admin\":{\"7\":1}}'),(17,1,45,46,1,'com_messages','com_messages','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(18,1,47,60,1,'com_modules','com_modules','{\"core.admin\":{\"7\":1}}'),(19,1,61,64,1,'com_newsfeeds','com_newsfeeds','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(20,1,65,66,1,'com_plugins','com_plugins','{\"core.admin\":{\"7\":1}}'),(21,1,67,68,1,'com_redirect','com_redirect','{\"core.admin\":{\"7\":1}}'),(22,1,69,70,1,'com_search','com_search','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(23,1,71,72,1,'com_templates','com_templates','{\"core.admin\":{\"7\":1}}'),(24,1,73,76,1,'com_users','com_users','{\"core.admin\":{\"7\":1},\"core.edit.own\":{\"6\":1}}'),(26,1,77,78,1,'com_wrapper','com_wrapper','{}'),(27,8,18,23,2,'com_content.category.2','Uncategorised','{}'),(28,3,4,5,2,'com_banners.category.3','Uncategorised','{}'),(29,7,14,15,2,'com_contact.category.4','Uncategorised','{}'),(30,19,62,63,2,'com_newsfeeds.category.5','Uncategorised','{}'),(32,24,74,75,2,'com_users.category.7','Uncategorised','{}'),(33,1,79,80,1,'com_finder','com_finder','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(35,27,19,20,3,'com_content.article.2','About Us','{}'),(36,8,24,27,2,'com_content.category.8','News','{}'),(37,36,25,26,3,'com_content.article.3','Article 1 Title','{}'),(40,27,21,22,3,'com_content.article.6','Creating Your Site','{}'),(41,1,81,82,1,'com_joomlaupdate','com_joomlaupdate','{}'),(42,1,83,84,1,'com_tags','com_tags','{\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(43,1,85,86,1,'com_contenthistory','com_contenthistory','{}'),(44,1,87,88,1,'com_ajax','com_ajax','{}'),(47,1,89,90,1,'com_postinstall','com_postinstall','{}'),(48,18,48,49,2,'com_modules.module.10','Logged-in Users','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(49,18,50,51,2,'com_modules.module.3','Popular Articles','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(50,18,52,53,2,'com_modules.module.4','Recently Added Articles','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(51,18,54,55,2,'com_modules.module.89','Site Information','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(52,18,56,57,2,'com_modules.module.88','Image','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(53,18,58,59,2,'com_modules.module.90','Release News','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(54,1,91,92,1,'com_privacy','com_privacy','{\"core.admin\":{\"7\":1}}'),(55,1,93,94,1,'com_actionlogs','com_actionlogs','{\"core.admin\":{\"7\":1}}');
/*!40000 ALTER TABLE `exam_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_associations`
--

DROP TABLE IF EXISTS `exam_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_associations` (
  `id` int NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_associations`
--

LOCK TABLES `exam_associations` WRITE;
/*!40000 ALTER TABLE `exam_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_banner_clients`
--

DROP TABLE IF EXISTS `exam_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_banner_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_banner_clients`
--

LOCK TABLES `exam_banner_clients` WRITE;
/*!40000 ALTER TABLE `exam_banner_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_banner_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_banner_tracks`
--

DROP TABLE IF EXISTS `exam_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int unsigned NOT NULL,
  `banner_id` int unsigned NOT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_banner_tracks`
--

LOCK TABLES `exam_banner_tracks` WRITE;
/*!40000 ALTER TABLE `exam_banner_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_banner_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_banners`
--

DROP TABLE IF EXISTS `exam_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_banners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int NOT NULL DEFAULT '0',
  `impmade` int NOT NULL DEFAULT '0',
  `clicks` int NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint unsigned NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `version` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_banners`
--

LOCK TABLES `exam_banners` WRITE;
/*!40000 ALTER TABLE `exam_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_categories`
--

DROP TABLE IF EXISTS `exam_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_categories`
--

LOCK TABLES `exam_categories` WRITE;
/*!40000 ALTER TABLE `exam_categories` DISABLE KEYS */;
INSERT INTO `exam_categories` VALUES (1,0,0,0,13,0,'','system','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'{}','','','',580,'2021-03-28 20:58:21',0,'0000-00-00 00:00:00',0,'*',1),(2,27,1,1,2,1,'uncategorised','com_content','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',580,'2021-03-28 20:58:21',0,'0000-00-00 00:00:00',0,'*',1),(3,28,1,3,4,1,'uncategorised','com_banners','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\",\"foobar\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',580,'2021-03-28 20:58:21',0,'0000-00-00 00:00:00',0,'*',1),(4,29,1,5,6,1,'uncategorised','com_contact','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',580,'2021-03-28 20:58:21',0,'0000-00-00 00:00:00',0,'*',1),(5,30,1,7,8,1,'uncategorised','com_newsfeeds','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',580,'2021-03-28 20:58:21',0,'0000-00-00 00:00:00',0,'*',1),(7,32,1,9,10,1,'uncategorised','com_users','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',580,'2021-03-28 20:58:21',0,'0000-00-00 00:00:00',0,'*',1),(8,36,1,11,12,1,'news','com_content','News','news','','<p>This is the latest news from us.</p><p>You can edit this description in the Content Category Manager.</p><p>This will show the most recent article. You can easily change it to show more if you wish.</p>',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',580,'2021-03-28 20:58:21',0,'0000-00-00 00:00:00',0,'*',1);
/*!40000 ALTER TABLE `exam_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_contact_details`
--

DROP TABLE IF EXISTS `exam_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_contact_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `catid` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_contact_details`
--

LOCK TABLES `exam_contact_details` WRITE;
/*!40000 ALTER TABLE `exam_contact_details` DISABLE KEYS */;
INSERT INTO `exam_contact_details` VALUES (1,'Your Name','your-name','','This is a contact form which you can edit in the contact manager. Put your address or other information here. This can be a good place to put things like business hours too. Don\'t forget to put a real email address. You also may want to enable Captcha in the global configuration to prevent spam submissions of contact forms. ','','','','','','','','','email@example.com',0,1,0,'0000-00-00 00:00:00',1,'{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":\"\",\"linkb_name\":\"\",\"linkb\":\"\",\"linkc_name\":\"\",\"linkc\":\"\",\"linkd_name\":\"\",\"linkd\":\"\",\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}',0,4,1,'','','','','','*','2021-03-28 20:58:21',580,'Joomla','0000-00-00 00:00:00',0,'','','{\"robots\":\"\",\"rights\":\"\"}',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',1,1);
/*!40000 ALTER TABLE `exam_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_content`
--

DROP TABLE IF EXISTS `exam_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`),
  KEY `idx_alias` (`alias`(191))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_content`
--

LOCK TABLES `exam_content` WRITE;
/*!40000 ALTER TABLE `exam_content` DISABLE KEYS */;
INSERT INTO `exam_content` VALUES (2,35,'About Us','about-us','<p>Put more information on this page.</p>','',1,2,'2021-03-28 20:58:21',580,'Joomla','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2021-03-28 20:58:21','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',1,1,'','',1,8,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*','',''),(3,37,'Article 1 Title','article-1-title','<p>Here is a news article.</p>','',1,8,'2021-03-28 20:58:21',580,'Joomla','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2021-03-28 20:58:21','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',1,0,'','',1,0,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*','',''),(6,40,'Creating Your Site','creating-your-site','<p>Joomla! is all about allowing you to create a site that matches your vision. The possibilities are limitless; this sample site will get you started.</p><p>There are a few things you should know to get you started.</p><p>Every Joomla! website has two parts: the Site (which is what your site visitors see) and the Administrator (which is where you will do a lot of the site management). You need to log in to the Administrator separately with the same username and password. There is a link to the administrator on the top menu that you will see when you log in.</p><p>You can edit articles in the Site by clicking on the edit icon. You can create a new article by clicking on the Create Article link in the top menu.</p><p>To do basic changes to the appearance your site click Home, Site Settings and Home, Template Settings.</p><p>To do more advanced things, like edit the contact form, manage users, or install a new template or extension, login to the Administrator.</p><p>Some quick tips for working in the Administrator</p><ul><li>To change the image on all the pages: Go to the Module Manager and click on Image Module.</li><li>To edit the Side Module: Go to Extensions, Module Manager and click on Side Module.</li><li>To edit the Contact Form: Go to Components, Contacts. Click on Your Name.</li></ul><p>Once you have your basic site you may want to install your own template (that controls the overall design of your site) and then, perhaps additional extensions.</p><p>There is a lot of help available for Joomla!. You can visit the <a href=\"https://forum.joomla.org/\">Joomla! forums</a> and the<a href=\"https://docs.joomla.org/\" target=\"_blank\"> Joomla! documentation site</a> to get started.</p>','',1,2,'2021-03-28 20:58:21',580,'Joomla','2021-03-28 20:58:21',580,0,'0000-00-00 00:00:00','2021-03-28 20:58:21','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":null,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":null,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":null,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"0\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',8,0,'','',1,166,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*','','');
/*!40000 ALTER TABLE `exam_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_content_frontpage`
--

DROP TABLE IF EXISTS `exam_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_content_frontpage` (
  `content_id` int NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_content_frontpage`
--

LOCK TABLES `exam_content_frontpage` WRITE;
/*!40000 ALTER TABLE `exam_content_frontpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_content_frontpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_content_rating`
--

DROP TABLE IF EXISTS `exam_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_content_rating` (
  `content_id` int NOT NULL DEFAULT '0',
  `rating_sum` int unsigned NOT NULL DEFAULT '0',
  `rating_count` int unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_content_rating`
--

LOCK TABLES `exam_content_rating` WRITE;
/*!40000 ALTER TABLE `exam_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_content_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_content_types`
--

DROP TABLE IF EXISTS `exam_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_content_types` (
  `type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_content_types`
--

LOCK TABLES `exam_content_types` WRITE;
/*!40000 ALTER TABLE `exam_content_types` DISABLE KEYS */;
INSERT INTO `exam_content_types` VALUES (1,'Article','com_content.article','{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\", \"note\":\"note\"}, \"special\":{\"fulltext\":\"fulltext\"}}','ContentHelperRoute::getArticleRoute','{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(2,'Contact','com_contact.contact','{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}','ContactHelperRoute::getContactRoute','{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),(3,'Newsfeed','com_newsfeeds.newsfeed','{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}','NewsfeedsHelperRoute::getNewsfeedRoute','{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(4,'User','com_users.user','{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}','UsersHelperRoute::getUserRoute',''),(5,'Article Category','com_content.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContentHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(6,'Contact Category','com_contact.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContactHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(7,'Newsfeeds Category','com_newsfeeds.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','NewsfeedsHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(8,'Tag','com_tags.tag','{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}','TagsHelperRoute::getTagRoute','{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),(9,'Banner','com_banners.banner','{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}','','{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(10,'Banners Category','com_banners.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(11,'Banner Client','com_banners.client','{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),(12,'User Notes','com_users.note','{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),(13,'User Notes Category','com_users.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
/*!40000 ALTER TABLE `exam_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_contentitem_tag_map`
--

DROP TABLE IF EXISTS `exam_contentitem_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_contentitem_tag_map`
--

LOCK TABLES `exam_contentitem_tag_map` WRITE;
/*!40000 ALTER TABLE `exam_contentitem_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_contentitem_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_core_log_searches`
--

DROP TABLE IF EXISTS `exam_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_core_log_searches`
--

LOCK TABLES `exam_core_log_searches` WRITE;
/*!40000 ALTER TABLE `exam_core_log_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_core_log_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_extensions`
--

DROP TABLE IF EXISTS `exam_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_extensions` (
  `extension_id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '1',
  `protected` tinyint NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int DEFAULT '0',
  `state` int DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_extensions`
--

LOCK TABLES `exam_extensions` WRITE;
/*!40000 ALTER TABLE `exam_extensions` DISABLE KEYS */;
INSERT INTO `exam_extensions` VALUES (1,0,'com_mailto','component','com_mailto','',0,1,1,1,'{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mailto\"}','','','',0,'0000-00-00 00:00:00',0,0),(2,0,'com_wrapper','component','com_wrapper','',0,1,1,1,'{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}','','','',0,'0000-00-00 00:00:00',0,0),(3,0,'com_admin','component','com_admin','',1,1,1,1,'{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(4,0,'com_banners','component','com_banners','',1,1,1,0,'{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}','{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}','','',0,'0000-00-00 00:00:00',0,0),(5,0,'com_cache','component','com_cache','',1,1,1,1,'{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(6,0,'com_categories','component','com_categories','',1,1,1,1,'{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(7,0,'com_checkin','component','com_checkin','',1,1,1,1,'{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(8,0,'com_contact','component','com_contact','',1,1,1,0,'{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_tags\":\"1\",\"show_info\":\"1\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_image\":\"1\",\"show_misc\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"articles_display_num\":\"10\",\"show_profile\":\"0\",\"show_user_custom_fields\":[\"-1\"],\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_subcat_desc\":\"1\",\"show_empty_categories\":\"0\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_subcat_desc_cat\":\"1\",\"show_empty_categories_cat\":\"0\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_headings\":\"1\",\"show_image_heading\":\"0\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"0\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\",\"sef_advanced\":0,\"sef_ids\":0,\"custom_fields_enable\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(9,0,'com_cpanel','component','com_cpanel','',1,1,1,1,'{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10,0,'com_installer','component','com_installer','',1,1,1,1,'{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_jed_info\":\"1\",\"cachetimeout\":\"6\",\"minimum_stability\":\"4\"}','','',0,'0000-00-00 00:00:00',0,0),(11,0,'com_languages','component','com_languages','',1,1,1,1,'{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}','{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}','','',0,'0000-00-00 00:00:00',0,0),(12,0,'com_login','component','com_login','',1,1,1,1,'{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(13,0,'com_media','component','com_media','',1,1,0,1,'{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}','{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}','','',0,'0000-00-00 00:00:00',0,0),(14,0,'com_menus','component','com_menus','',1,1,1,1,'{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}','{\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(15,0,'com_messages','component','com_messages','',1,1,1,1,'{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(16,0,'com_modules','component','com_modules','',1,1,1,1,'{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(17,0,'com_newsfeeds','component','com_newsfeeds','',1,1,1,0,'{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(18,0,'com_plugins','component','com_plugins','',1,1,1,1,'{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(19,0,'com_search','component','com_search','',1,1,1,0,'{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}','{\"enabled\":\"0\",\"search_phrases\":\"1\",\"search_areas\":\"1\",\"show_date\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(20,0,'com_templates','component','com_templates','',1,1,1,1,'{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}','{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css,scss,sass\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}','','',0,'0000-00-00 00:00:00',0,0),(22,0,'com_content','component','com_content','',1,1,0,1,'{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"0\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(23,0,'com_config','component','com_config','',1,1,0,1,'{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}','{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"10\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"12\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}','','',0,'0000-00-00 00:00:00',0,0),(24,0,'com_redirect','component','com_redirect','',1,1,0,1,'{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(25,0,'com_users','component','com_users','',1,1,0,1,'{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}','{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"0\",\"useractivation\":\"2\",\"mail_to_admin\":\"1\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(27,0,'com_finder','component','com_finder','',1,1,0,0,'{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}','{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(28,0,'com_joomlaupdate','component','com_joomlaupdate','',1,1,0,1,'{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.2\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{\"updatesource\":\"default\",\"customurl\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(29,0,'com_tags','component','com_tags','',1,1,1,1,'{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_description\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(30,0,'com_contenthistory','component','com_contenthistory','',1,1,1,0,'{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}','','','',0,'0000-00-00 00:00:00',0,0),(31,0,'com_ajax','component','com_ajax','',1,1,1,1,'{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}','','','',0,'0000-00-00 00:00:00',0,0),(32,0,'com_postinstall','component','com_postinstall','',1,1,1,1,'{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(33,0,'com_fields','component','com_fields','',1,1,1,0,'{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}','','','',0,'0000-00-00 00:00:00',0,0),(34,0,'com_associations','component','com_associations','',1,1,1,0,'{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"January 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(35,0,'com_privacy','component','com_privacy','',1,1,1,1,'{\"name\":\"com_privacy\",\"type\":\"component\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}','','','',0,'0000-00-00 00:00:00',0,0),(36,0,'com_actionlogs','component','com_actionlogs','',1,1,1,1,'{\"name\":\"com_actionlogs\",\"type\":\"component\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\"}','{\"ip_logging\":0,\"csv_delimiter\":\",\",\"loggable_extensions\":[\"com_banners\",\"com_cache\",\"com_categories\",\"com_checkin\",\"com_config\",\"com_contact\",\"com_content\",\"com_installer\",\"com_media\",\"com_menus\",\"com_messages\",\"com_modules\",\"com_newsfeeds\",\"com_plugins\",\"com_redirect\",\"com_tags\",\"com_templates\",\"com_users\"]}','','',0,'0000-00-00 00:00:00',0,0),(102,0,'LIB_PHPUTF8','library','phputf8','',0,1,1,1,'{\"name\":\"LIB_PHPUTF8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phputf8\"}','','','',0,'0000-00-00 00:00:00',0,0),(103,0,'LIB_JOOMLA','library','joomla','',0,1,1,1,'{\"name\":\"LIB_JOOMLA\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{\"mediaversion\":\"8af0eb394c7b646fd8085e96bd12bea7\"}','','',0,'0000-00-00 00:00:00',0,0),(104,0,'LIB_IDNA','library','idna_convert','',0,1,1,1,'{\"name\":\"LIB_IDNA\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"idna_convert\"}','','','',0,'0000-00-00 00:00:00',0,0),(105,0,'FOF','library','fof','',0,1,1,1,'{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2015-04-22 13:15:32\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2015 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.3\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}','','','',0,'0000-00-00 00:00:00',0,0),(106,0,'LIB_PHPASS','library','phpass','',0,1,1,1,'{\"name\":\"LIB_PHPASS\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}','','','',0,'0000-00-00 00:00:00',0,0),(200,0,'mod_articles_archive','module','mod_articles_archive','',0,1,1,0,'{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}','','','',0,'0000-00-00 00:00:00',0,0),(201,0,'mod_articles_latest','module','mod_articles_latest','',0,1,1,0,'{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(202,0,'mod_articles_popular','module','mod_articles_popular','',0,1,1,0,'{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}','','','',0,'0000-00-00 00:00:00',0,0),(203,0,'mod_banners','module','mod_banners','',0,1,1,0,'{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}','','','',0,'0000-00-00 00:00:00',0,0),(204,0,'mod_breadcrumbs','module','mod_breadcrumbs','',0,1,1,1,'{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}','','','',0,'0000-00-00 00:00:00',0,0),(205,0,'mod_custom','module','mod_custom','',0,1,1,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}','','','',0,'0000-00-00 00:00:00',0,0),(206,0,'mod_feed','module','mod_feed','',0,1,1,0,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}','','','',0,'0000-00-00 00:00:00',0,0),(207,0,'mod_footer','module','mod_footer','',0,1,1,0,'{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}','','','',0,'0000-00-00 00:00:00',0,0),(208,0,'mod_login','module','mod_login','',0,1,1,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}','','','',0,'0000-00-00 00:00:00',0,0),(209,0,'mod_menu','module','mod_menu','',0,1,1,1,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}','','','',0,'0000-00-00 00:00:00',0,0),(210,0,'mod_articles_news','module','mod_articles_news','',0,1,1,0,'{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}','','','',0,'0000-00-00 00:00:00',0,0),(211,0,'mod_random_image','module','mod_random_image','',0,1,1,0,'{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}','','','',0,'0000-00-00 00:00:00',0,0),(212,0,'mod_related_items','module','mod_related_items','',0,1,1,0,'{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}','','','',0,'0000-00-00 00:00:00',0,0),(213,0,'mod_search','module','mod_search','',0,1,1,0,'{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}','','','',0,'0000-00-00 00:00:00',0,0),(214,0,'mod_stats','module','mod_stats','',0,1,1,0,'{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}','','','',0,'0000-00-00 00:00:00',0,0),(215,0,'mod_syndicate','module','mod_syndicate','',0,1,1,1,'{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}','','','',0,'0000-00-00 00:00:00',0,0),(216,0,'mod_users_latest','module','mod_users_latest','',0,1,1,0,'{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(218,0,'mod_whosonline','module','mod_whosonline','',0,1,1,0,'{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}','','','',0,'0000-00-00 00:00:00',0,0),(219,0,'mod_wrapper','module','mod_wrapper','',0,1,1,0,'{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}','','','',0,'0000-00-00 00:00:00',0,0),(220,0,'mod_articles_category','module','mod_articles_category','',0,1,1,0,'{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}','','','',0,'0000-00-00 00:00:00',0,0),(221,0,'mod_articles_categories','module','mod_articles_categories','',0,1,1,0,'{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}','','','',0,'0000-00-00 00:00:00',0,0),(222,0,'mod_languages','module','mod_languages','',0,1,1,1,'{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}','','','',0,'0000-00-00 00:00:00',0,0),(223,0,'mod_finder','module','mod_finder','',0,1,0,0,'{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}','','','',0,'0000-00-00 00:00:00',0,0),(300,0,'mod_custom','module','mod_custom','',1,1,1,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}','','','',0,'0000-00-00 00:00:00',0,0),(301,0,'mod_feed','module','mod_feed','',1,1,1,0,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}','','','',0,'0000-00-00 00:00:00',0,0),(302,0,'mod_latest','module','mod_latest','',1,1,1,0,'{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(303,0,'mod_logged','module','mod_logged','',1,1,1,0,'{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}','','','',0,'0000-00-00 00:00:00',0,0),(304,0,'mod_login','module','mod_login','',1,1,1,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}','','','',0,'0000-00-00 00:00:00',0,0),(305,0,'mod_menu','module','mod_menu','',1,1,1,0,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}','','','',0,'0000-00-00 00:00:00',0,0),(307,0,'mod_popular','module','mod_popular','',1,1,1,0,'{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}','','','',0,'0000-00-00 00:00:00',0,0),(308,0,'mod_quickicon','module','mod_quickicon','',1,1,1,1,'{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}','','','',0,'0000-00-00 00:00:00',0,0),(309,0,'mod_status','module','mod_status','',1,1,1,0,'{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_status\"}','','','',0,'0000-00-00 00:00:00',0,0),(310,0,'mod_submenu','module','mod_submenu','',1,1,1,0,'{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}','','','',0,'0000-00-00 00:00:00',0,0),(311,0,'mod_title','module','mod_title','',1,1,1,0,'{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}','','','',0,'0000-00-00 00:00:00',0,0),(312,0,'mod_toolbar','module','mod_toolbar','',1,1,1,1,'{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}','','','',0,'0000-00-00 00:00:00',0,0),(313,0,'mod_multilangstatus','module','mod_multilangstatus','',1,1,1,0,'{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}','{\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(314,0,'mod_version','module','mod_version','',1,1,1,0,'{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}','{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(315,0,'mod_stats_admin','module','mod_stats_admin','',1,1,1,0,'{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}','{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}','','',0,'0000-00-00 00:00:00',0,0),(316,0,'mod_tags_popular','module','mod_tags_popular','',0,1,1,0,'{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}','{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(317,0,'mod_tags_similar','module','mod_tags_similar','',0,1,1,0,'{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}','{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(318,0,'mod_sampledata','module','mod_sampledata','',1,1,1,0,'{\"name\":\"mod_sampledata\",\"type\":\"module\",\"creationDate\":\"July 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"MOD_SAMPLEDATA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_sampledata\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(319,0,'mod_latestactions','module','mod_latestactions','',1,1,1,0,'{\"name\":\"mod_latestactions\",\"type\":\"module\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_LATESTACTIONS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latestactions\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(320,0,'mod_privacy_dashboard','module','mod_privacy_dashboard','',1,1,1,0,'{\"name\":\"mod_privacy_dashboard\",\"type\":\"module\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_privacy_dashboard\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(400,0,'plg_authentication_gmail','plugin','gmail','authentication',0,0,1,0,'{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"gmail\"}','{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}','','',0,'0000-00-00 00:00:00',1,0),(401,0,'plg_authentication_joomla','plugin','joomla','authentication',0,1,1,1,'{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',0,0),(402,0,'plg_authentication_ldap','plugin','ldap','authentication',0,0,1,0,'{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}','{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}','','',0,'0000-00-00 00:00:00',3,0),(403,0,'plg_content_contact','plugin','contact','content',0,1,1,0,'{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','','','',0,'0000-00-00 00:00:00',1,0),(404,0,'plg_content_emailcloak','plugin','emailcloak','content',0,1,1,0,'{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}','{\"mode\":\"1\"}','','',0,'0000-00-00 00:00:00',1,0),(406,0,'plg_content_loadmodule','plugin','loadmodule','content',0,1,1,0,'{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}','{\"style\":\"xhtml\"}','','',0,'2011-09-18 15:22:50',0,0),(407,0,'plg_content_pagebreak','plugin','pagebreak','content',0,1,1,0,'{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}','{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}','','',0,'0000-00-00 00:00:00',4,0),(408,0,'plg_content_pagenavigation','plugin','pagenavigation','content',0,1,1,0,'{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}','{\"position\":\"1\"}','','',0,'0000-00-00 00:00:00',5,0),(409,0,'plg_content_vote','plugin','vote','content',0,0,1,0,'{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}','','','',0,'0000-00-00 00:00:00',6,0),(410,0,'plg_editors_codemirror','plugin','codemirror','editors',0,1,1,1,'{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2017 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"http:\\/\\/codemirror.net\\/\",\"version\":\"5.40.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}','{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}','','',0,'0000-00-00 00:00:00',1,0),(411,0,'plg_editors_none','plugin','none','editors',0,1,1,1,'{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"September 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}','','','',0,'0000-00-00 00:00:00',2,0),(412,0,'plg_editors_tinymce','plugin','tinymce','editors',0,1,1,0,'{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2018\",\"author\":\"Ephox Corporation\",\"copyright\":\"Ephox Corporation\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"http:\\/\\/www.tinymce.com\",\"version\":\"4.5.9\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}','{\"configuration\":{\"toolbars\":{\"2\":{\"toolbar1\":[\"bold\",\"underline\",\"strikethrough\",\"|\",\"undo\",\"redo\",\"|\",\"bullist\",\"numlist\",\"|\",\"pastetext\"]},\"1\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"formatselect\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"code\",\"|\",\"hr\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"pastetext\",\"preview\"]},\"0\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"styleselect\",\"|\",\"formatselect\",\"fontselect\",\"fontsizeselect\",\"|\",\"searchreplace\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"image\",\"|\",\"code\",\"|\",\"forecolor\",\"backcolor\",\"|\",\"fullscreen\",\"|\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"emoticons\",\"media\",\"hr\",\"ltr\",\"rtl\",\"|\",\"cut\",\"copy\",\"paste\",\"pastetext\",\"|\",\"visualchars\",\"visualblocks\",\"nonbreaking\",\"blockquote\",\"template\",\"|\",\"print\",\"preview\",\"codesample\",\"insertdatetime\",\"removeformat\"]}},\"setoptions\":{\"2\":{\"access\":[\"1\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"1\":{\"access\":[\"6\",\"2\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"0\":{\"access\":[\"7\",\"4\",\"8\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}}},\"sets_amount\":3,\"html_height\":\"550\",\"html_width\":\"750\"}','','',0,'0000-00-00 00:00:00',3,0),(413,0,'plg_editors-xtd_article','plugin','article','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}','','','',0,'0000-00-00 00:00:00',1,0),(414,0,'plg_editors-xtd_image','plugin','image','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}','','','',0,'0000-00-00 00:00:00',2,0),(415,0,'plg_editors-xtd_pagebreak','plugin','pagebreak','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}','','','',0,'0000-00-00 00:00:00',3,0),(416,0,'plg_editors-xtd_readmore','plugin','readmore','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}','','','',0,'0000-00-00 00:00:00',4,0),(417,0,'plg_search_categories','plugin','categories','search',0,1,1,0,'{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(418,0,'plg_search_contacts','plugin','contacts','search',0,1,1,0,'{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(419,0,'plg_search_content','plugin','content','search',0,1,1,0,'{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(420,0,'plg_search_newsfeeds','plugin','newsfeeds','search',0,1,1,0,'{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(422,0,'plg_system_languagefilter','plugin','languagefilter','system',0,0,1,1,'{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}','','','',0,'0000-00-00 00:00:00',1,0),(423,0,'plg_system_p3p','plugin','p3p','system',0,0,1,0,'{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"p3p\"}','{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}','','',0,'0000-00-00 00:00:00',2,0),(424,0,'plg_system_cache','plugin','cache','system',0,0,1,1,'{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}','{\"browsercache\":\"0\",\"cachetime\":\"15\"}','','',0,'0000-00-00 00:00:00',9,0),(425,0,'plg_system_debug','plugin','debug','system',0,1,1,0,'{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}','{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}','','',0,'0000-00-00 00:00:00',4,0),(426,0,'plg_system_log','plugin','log','system',0,1,1,1,'{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}','','','',0,'0000-00-00 00:00:00',5,0),(427,0,'plg_system_redirect','plugin','redirect','system',0,0,1,1,'{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}','','','',0,'0000-00-00 00:00:00',3,0),(428,0,'plg_system_remember','plugin','remember','system',0,1,1,1,'{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}','','','',0,'0000-00-00 00:00:00',7,0),(429,0,'plg_system_sef','plugin','sef','system',0,1,1,0,'{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}','','','',0,'0000-00-00 00:00:00',8,0),(430,0,'plg_system_logout','plugin','logout','system',0,1,1,1,'{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}','','','',0,'0000-00-00 00:00:00',6,0),(431,0,'plg_user_contactcreator','plugin','contactcreator','user',0,0,1,0,'{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}','{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}','','',0,'0000-00-00 00:00:00',1,0),(432,0,'plg_user_joomla','plugin','joomla','user',0,1,1,0,'{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}','','',0,'0000-00-00 00:00:00',2,0),(433,0,'plg_user_profile','plugin','profile','user',0,0,1,0,'{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}','{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(434,0,'plg_extension_joomla','plugin','joomla','extension',0,1,1,1,'{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',1,0),(435,0,'plg_content_joomla','plugin','joomla','content',0,1,1,0,'{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',0,0),(436,0,'plg_system_languagecode','plugin','languagecode','system',0,0,1,0,'{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}','','','',0,'0000-00-00 00:00:00',10,0),(437,0,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}','','','',0,'0000-00-00 00:00:00',0,0),(438,0,'plg_quickicon_extensionupdate','plugin','extensionupdate','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}','','','',0,'0000-00-00 00:00:00',0,0),(439,0,'plg_captcha_recaptcha','plugin','recaptcha','captcha',0,0,1,0,'{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}','{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}','','',0,'0000-00-00 00:00:00',0,0),(440,0,'plg_system_highlight','plugin','highlight','system',0,1,1,0,'{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}','','','',0,'0000-00-00 00:00:00',7,0),(441,0,'plg_content_finder','plugin','finder','content',0,0,1,0,'{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}','','','',0,'0000-00-00 00:00:00',0,0),(442,0,'plg_finder_categories','plugin','categories','finder',0,1,1,0,'{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}','','','',0,'0000-00-00 00:00:00',1,0),(443,0,'plg_finder_contacts','plugin','contacts','finder',0,1,1,0,'{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}','','','',0,'0000-00-00 00:00:00',2,0),(444,0,'plg_finder_content','plugin','content','finder',0,1,1,0,'{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','','','',0,'0000-00-00 00:00:00',3,0),(445,0,'plg_finder_newsfeeds','plugin','newsfeeds','finder',0,1,1,0,'{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','','','',0,'0000-00-00 00:00:00',4,0),(447,0,'plg_finder_tags','plugin','tags','finder',0,1,1,0,'{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','','','',0,'0000-00-00 00:00:00',0,0),(448,0,'plg_twofactorauth_totp','plugin','totp','twofactorauth',0,0,1,0,'{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}','','','',0,'0000-00-00 00:00:00',0,0),(449,0,'plg_authentication_cookie','plugin','cookie','authentication',0,1,1,0,'{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}','','','',0,'0000-00-00 00:00:00',0,0),(450,0,'plg_twofactorauth_yubikey','plugin','yubikey','twofactorauth',0,0,1,0,'{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}','','','',0,'0000-00-00 00:00:00',0,0),(451,0,'plg_search_tags','plugin','tags','search',0,1,1,0,'{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(452,0,'plg_system_updatenotification','plugin','updatenotification','system',0,1,1,0,'{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"May 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}','{\"lastrun\":1616965109}','','',0,'0000-00-00 00:00:00',0,0),(453,0,'plg_editors-xtd_module','plugin','module','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"October 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}','','','',0,'0000-00-00 00:00:00',0,0),(454,0,'plg_system_stats','plugin','stats','system',0,1,1,0,'{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"November 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}','','','',0,'0000-00-00 00:00:00',0,0),(455,0,'plg_installer_packageinstaller','plugin','packageinstaller','installer',0,1,1,1,'{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}','','','',0,'0000-00-00 00:00:00',1,0),(456,0,'PLG_INSTALLER_FOLDERINSTALLER','plugin','folderinstaller','installer',0,1,1,1,'{\"name\":\"PLG_INSTALLER_FOLDERINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}','','','',0,'0000-00-00 00:00:00',2,0),(457,0,'PLG_INSTALLER_URLINSTALLER','plugin','urlinstaller','installer',0,1,1,1,'{\"name\":\"PLG_INSTALLER_URLINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}','','','',0,'0000-00-00 00:00:00',3,0),(458,0,'plg_quickicon_phpversioncheck','plugin','phpversioncheck','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpversioncheck\"}','','','',0,'0000-00-00 00:00:00',0,0),(459,0,'plg_editors-xtd_menu','plugin','menu','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menu\"}','','','',0,'0000-00-00 00:00:00',0,0),(460,0,'plg_editors-xtd_contact','plugin','contact','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"October 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','','','',0,'0000-00-00 00:00:00',0,0),(461,0,'plg_system_fields','plugin','fields','system',0,1,1,0,'{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}','','','',0,'0000-00-00 00:00:00',0,0),(462,0,'plg_fields_calendar','plugin','calendar','fields',0,1,1,0,'{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"calendar\"}','','','',0,'0000-00-00 00:00:00',0,0),(463,0,'plg_fields_checkboxes','plugin','checkboxes','fields',0,1,1,0,'{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkboxes\"}','','','',0,'0000-00-00 00:00:00',0,0),(464,0,'plg_fields_color','plugin','color','fields',0,1,1,0,'{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"color\"}','','','',0,'0000-00-00 00:00:00',0,0),(465,0,'plg_fields_editor','plugin','editor','fields',0,1,1,0,'{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"editor\"}','','','',0,'0000-00-00 00:00:00',0,0),(466,0,'plg_fields_imagelist','plugin','imagelist','fields',0,1,1,0,'{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"imagelist\"}','','','',0,'0000-00-00 00:00:00',0,0),(467,0,'plg_fields_integer','plugin','integer','fields',0,1,1,0,'{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"integer\"}','{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(468,0,'plg_fields_list','plugin','list','fields',0,1,1,0,'{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"list\"}','','','',0,'0000-00-00 00:00:00',0,0),(469,0,'plg_fields_media','plugin','media','fields',0,1,1,0,'{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}','','','',0,'0000-00-00 00:00:00',0,0),(470,0,'plg_fields_radio','plugin','radio','fields',0,1,1,0,'{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"radio\"}','','','',0,'0000-00-00 00:00:00',0,0),(471,0,'plg_fields_sql','plugin','sql','fields',0,1,1,0,'{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sql\"}','','','',0,'0000-00-00 00:00:00',0,0),(472,0,'plg_fields_text','plugin','text','fields',0,1,1,0,'{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"text\"}','','','',0,'0000-00-00 00:00:00',0,0),(473,0,'plg_fields_textarea','plugin','textarea','fields',0,1,1,0,'{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"textarea\"}','','','',0,'0000-00-00 00:00:00',0,0),(474,0,'plg_fields_url','plugin','url','fields',0,1,1,0,'{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"url\"}','','','',0,'0000-00-00 00:00:00',0,0),(475,0,'plg_fields_user','plugin','user','fields',0,1,1,0,'{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}','','','',0,'0000-00-00 00:00:00',0,0),(476,0,'plg_fields_usergrouplist','plugin','usergrouplist','fields',0,1,1,0,'{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"usergrouplist\"}','','','',0,'0000-00-00 00:00:00',0,0),(477,0,'plg_content_fields','plugin','fields','content',0,1,1,0,'{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}','','','',0,'0000-00-00 00:00:00',0,0),(478,0,'plg_editors-xtd_fields','plugin','fields','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}','','','',0,'0000-00-00 00:00:00',0,0),(479,0,'plg_sampledata_blog','plugin','blog','sampledata',0,1,1,0,'{\"name\":\"plg_sampledata_blog\",\"type\":\"plugin\",\"creationDate\":\"July 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"blog\"}','','','',0,'0000-00-00 00:00:00',0,0),(480,0,'plg_system_sessiongc','plugin','sessiongc','system',0,1,1,0,'{\"name\":\"plg_system_sessiongc\",\"type\":\"plugin\",\"creationDate\":\"February 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.6\",\"description\":\"PLG_SYSTEM_SESSIONGC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sessiongc\"}','','','',0,'0000-00-00 00:00:00',0,0),(481,0,'plg_fields_repeatable','plugin','repeatable','fields',0,1,1,0,'{\"name\":\"plg_fields_repeatable\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_FIELDS_REPEATABLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"repeatable\"}','','','',0,'0000-00-00 00:00:00',0,0),(482,0,'plg_content_confirmconsent','plugin','confirmconsent','content',0,0,1,0,'{\"name\":\"plg_content_confirmconsent\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"confirmconsent\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(483,0,'PLG_SYSTEM_ACTIONLOGS','plugin','actionlogs','system',0,1,1,0,'{\"name\":\"PLG_SYSTEM_ACTIONLOGS\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(484,0,'PLG_ACTIONLOG_JOOMLA','plugin','joomla','actionlog',0,1,1,0,'{\"name\":\"PLG_ACTIONLOG_JOOMLA\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(485,0,'plg_system_privacyconsent','plugin','privacyconsent','system',0,0,1,0,'{\"name\":\"plg_system_privacyconsent\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacyconsent\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(486,0,'plg_system_logrotation','plugin','logrotation','system',0,1,1,0,'{\"name\":\"plg_system_logrotation\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_LOGROTATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logrotation\"}','{\"lastrun\":1616965109}','','',0,'0000-00-00 00:00:00',0,0),(487,0,'plg_privacy_user','plugin','user','privacy',0,1,1,0,'{\"name\":\"plg_privacy_user\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(488,0,'plg_quickicon_privacycheck','plugin','privacycheck','quickicon',0,1,1,0,'{\"name\":\"plg_quickicon_privacycheck\",\"type\":\"plugin\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacycheck\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(489,0,'plg_user_terms','plugin','terms','user',0,0,1,0,'{\"name\":\"plg_user_terms\",\"type\":\"plugin\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TERMS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"terms\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(490,0,'plg_privacy_contact','plugin','contact','privacy',0,1,1,0,'{\"name\":\"plg_privacy_contact\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(491,0,'plg_privacy_content','plugin','content','privacy',0,1,1,0,'{\"name\":\"plg_privacy_content\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(492,0,'plg_privacy_message','plugin','message','privacy',0,1,1,0,'{\"name\":\"plg_privacy_message\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"message\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(493,0,'plg_privacy_actionlogs','plugin','actionlogs','privacy',0,1,1,0,'{\"name\":\"plg_privacy_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(494,0,'plg_captcha_recaptcha_invisible','plugin','recaptcha_invisible','captcha',0,0,1,0,'{\"name\":\"plg_captcha_recaptcha_invisible\",\"type\":\"plugin\",\"creationDate\":\"November 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_INVISIBLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha_invisible\"}','{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}','','',0,'0000-00-00 00:00:00',0,0),(495,0,'plg_privacy_consents','plugin','consents','privacy',0,1,1,0,'{\"name\":\"plg_privacy_consents\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"consents\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(503,0,'beez3','template','beez3','',0,1,1,0,'{\"name\":\"beez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}','','',0,'0000-00-00 00:00:00',0,0),(504,0,'hathor','template','hathor','',1,1,1,0,'{\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"3.0.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(506,0,'protostar','template','protostar','',0,1,1,0,'{\"name\":\"protostar\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(507,0,'isis','template','isis','',1,1,1,0,'{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"templateColor\":\"\",\"logoFile\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(600,802,'English (en-GB)','language','en-GB','',0,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"February 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.3\",\"description\":\"en-GB site language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(601,802,'English (en-GB)','language','en-GB','',1,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"February 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.3\",\"description\":\"en-GB administrator language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(700,0,'files_joomla','file','joomla','',0,1,1,1,'{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"February 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.3\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(802,0,'English (en-GB) Language Pack','package','pkg_en-GB','',0,1,1,1,'{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"February 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.3.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}','','','',0,'0000-00-00 00:00:00',0,0);
/*!40000 ALTER TABLE `exam_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_fields`
--

DROP TABLE IF EXISTS `exam_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_fields`
--

LOCK TABLES `exam_fields` WRITE;
/*!40000 ALTER TABLE `exam_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_fields_categories`
--

DROP TABLE IF EXISTS `exam_fields_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_fields_categories` (
  `field_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_fields_categories`
--

LOCK TABLES `exam_fields_categories` WRITE;
/*!40000 ALTER TABLE `exam_fields_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_fields_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_fields_groups`
--

DROP TABLE IF EXISTS `exam_fields_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_fields_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_fields_groups`
--

LOCK TABLES `exam_fields_groups` WRITE;
/*!40000 ALTER TABLE `exam_fields_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_fields_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_fields_values`
--

DROP TABLE IF EXISTS `exam_fields_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_fields_values` (
  `field_id` int unsigned NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_fields_values`
--

LOCK TABLES `exam_fields_values` WRITE;
/*!40000 ALTER TABLE `exam_fields_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_fields_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_filters`
--

DROP TABLE IF EXISTS `exam_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_filters` (
  `filter_id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL,
  `created_by_alias` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_general_ci NOT NULL,
  `params` mediumtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_filters`
--

LOCK TABLES `exam_finder_filters` WRITE;
/*!40000 ALTER TABLE `exam_finder_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links`
--

DROP TABLE IF EXISTS `exam_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int DEFAULT '1',
  `access` int DEFAULT '0',
  `language` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links`
--

LOCK TABLES `exam_finder_links` WRITE;
/*!40000 ALTER TABLE `exam_finder_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_terms0`
--

DROP TABLE IF EXISTS `exam_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_terms0` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_terms0`
--

LOCK TABLES `exam_finder_links_terms0` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_terms0` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_terms0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_terms1`
--

DROP TABLE IF EXISTS `exam_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_terms1` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_terms1`
--

LOCK TABLES `exam_finder_links_terms1` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_terms1` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_terms1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_terms2`
--

DROP TABLE IF EXISTS `exam_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_terms2` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_terms2`
--

LOCK TABLES `exam_finder_links_terms2` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_terms2` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_terms2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_terms3`
--

DROP TABLE IF EXISTS `exam_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_terms3` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_terms3`
--

LOCK TABLES `exam_finder_links_terms3` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_terms3` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_terms3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_terms4`
--

DROP TABLE IF EXISTS `exam_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_terms4` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_terms4`
--

LOCK TABLES `exam_finder_links_terms4` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_terms4` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_terms4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_terms5`
--

DROP TABLE IF EXISTS `exam_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_terms5` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_terms5`
--

LOCK TABLES `exam_finder_links_terms5` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_terms5` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_terms5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_terms6`
--

DROP TABLE IF EXISTS `exam_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_terms6` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_terms6`
--

LOCK TABLES `exam_finder_links_terms6` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_terms6` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_terms6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_terms7`
--

DROP TABLE IF EXISTS `exam_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_terms7` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_terms7`
--

LOCK TABLES `exam_finder_links_terms7` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_terms7` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_terms7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_terms8`
--

DROP TABLE IF EXISTS `exam_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_terms8` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_terms8`
--

LOCK TABLES `exam_finder_links_terms8` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_terms8` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_terms8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_terms9`
--

DROP TABLE IF EXISTS `exam_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_terms9` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_terms9`
--

LOCK TABLES `exam_finder_links_terms9` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_terms9` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_terms9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_termsa`
--

DROP TABLE IF EXISTS `exam_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_termsa` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_termsa`
--

LOCK TABLES `exam_finder_links_termsa` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_termsa` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_termsa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_termsb`
--

DROP TABLE IF EXISTS `exam_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_termsb` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_termsb`
--

LOCK TABLES `exam_finder_links_termsb` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_termsb` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_termsb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_termsc`
--

DROP TABLE IF EXISTS `exam_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_termsc` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_termsc`
--

LOCK TABLES `exam_finder_links_termsc` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_termsc` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_termsc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_termsd`
--

DROP TABLE IF EXISTS `exam_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_termsd` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_termsd`
--

LOCK TABLES `exam_finder_links_termsd` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_termsd` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_termsd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_termse`
--

DROP TABLE IF EXISTS `exam_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_termse` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_termse`
--

LOCK TABLES `exam_finder_links_termse` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_termse` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_termse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_links_termsf`
--

DROP TABLE IF EXISTS `exam_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_links_termsf` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_links_termsf`
--

LOCK TABLES `exam_finder_links_termsf` WRITE;
/*!40000 ALTER TABLE `exam_finder_links_termsf` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_links_termsf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_taxonomy`
--

DROP TABLE IF EXISTS `exam_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_taxonomy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `access` tinyint unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_taxonomy`
--

LOCK TABLES `exam_finder_taxonomy` WRITE;
/*!40000 ALTER TABLE `exam_finder_taxonomy` DISABLE KEYS */;
INSERT INTO `exam_finder_taxonomy` VALUES (1,0,'ROOT',0,0,0);
/*!40000 ALTER TABLE `exam_finder_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `exam_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_taxonomy_map` (
  `link_id` int unsigned NOT NULL,
  `node_id` int unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_taxonomy_map`
--

LOCK TABLES `exam_finder_taxonomy_map` WRITE;
/*!40000 ALTER TABLE `exam_finder_taxonomy_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_taxonomy_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_terms`
--

DROP TABLE IF EXISTS `exam_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_terms` (
  `term_id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `stem` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `links` int NOT NULL DEFAULT '0',
  `language` char(3) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_terms`
--

LOCK TABLES `exam_finder_terms` WRITE;
/*!40000 ALTER TABLE `exam_finder_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_terms_common`
--

DROP TABLE IF EXISTS `exam_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_terms_common` (
  `term` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `language` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_terms_common`
--

LOCK TABLES `exam_finder_terms_common` WRITE;
/*!40000 ALTER TABLE `exam_finder_terms_common` DISABLE KEYS */;
INSERT INTO `exam_finder_terms_common` VALUES ('a','en'),('about','en'),('after','en'),('ago','en'),('all','en'),('am','en'),('an','en'),('and','en'),('any','en'),('are','en'),('aren\'t','en'),('as','en'),('at','en'),('be','en'),('but','en'),('by','en'),('for','en'),('from','en'),('get','en'),('go','en'),('how','en'),('if','en'),('in','en'),('into','en'),('is','en'),('isn\'t','en'),('it','en'),('its','en'),('me','en'),('more','en'),('most','en'),('must','en'),('my','en'),('new','en'),('no','en'),('none','en'),('not','en'),('nothing','en'),('of','en'),('off','en'),('often','en'),('old','en'),('on','en'),('onc','en'),('once','en'),('only','en'),('or','en'),('other','en'),('our','en'),('ours','en'),('out','en'),('over','en'),('page','en'),('she','en'),('should','en'),('small','en'),('so','en'),('some','en'),('than','en'),('thank','en'),('that','en'),('the','en'),('their','en'),('theirs','en'),('them','en'),('then','en'),('there','en'),('these','en'),('they','en'),('this','en'),('those','en'),('thus','en'),('time','en'),('times','en'),('to','en'),('too','en'),('true','en'),('under','en'),('until','en'),('up','en'),('upon','en'),('use','en'),('user','en'),('users','en'),('version','en'),('very','en'),('via','en'),('want','en'),('was','en'),('way','en'),('were','en'),('what','en'),('when','en'),('where','en'),('which','en'),('who','en'),('whom','en'),('whose','en'),('why','en'),('wide','en'),('will','en'),('with','en'),('within','en'),('without','en'),('would','en'),('yes','en'),('yet','en'),('you','en'),('your','en'),('yours','en');
/*!40000 ALTER TABLE `exam_finder_terms_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_tokens`
--

DROP TABLE IF EXISTS `exam_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_tokens` (
  `term` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `stem` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `language` char(3) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_tokens`
--

LOCK TABLES `exam_finder_tokens` WRITE;
/*!40000 ALTER TABLE `exam_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `exam_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_tokens_aggregate` (
  `term_id` int unsigned NOT NULL,
  `map_suffix` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `term` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `stem` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_tokens_aggregate`
--

LOCK TABLES `exam_finder_tokens_aggregate` WRITE;
/*!40000 ALTER TABLE `exam_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_tokens_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_finder_types`
--

DROP TABLE IF EXISTS `exam_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_finder_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `mime` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_finder_types`
--

LOCK TABLES `exam_finder_types` WRITE;
/*!40000 ALTER TABLE `exam_finder_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_finder_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_languages`
--

DROP TABLE IF EXISTS `exam_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_languages`
--

LOCK TABLES `exam_languages` WRITE;
/*!40000 ALTER TABLE `exam_languages` DISABLE KEYS */;
INSERT INTO `exam_languages` VALUES (1,0,'en-GB','English (en-GB)','English (United Kingdom)','en','en_gb','','','','',1,1,1);
/*!40000 ALTER TABLE `exam_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_menu`
--

DROP TABLE IF EXISTS `exam_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_menu`
--

LOCK TABLES `exam_menu` WRITE;
/*!40000 ALTER TABLE `exam_menu` DISABLE KEYS */;
INSERT INTO `exam_menu` VALUES (1,'','Menu_Item_Root','root','','','','',1,0,0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,61,0,'*',0),(2,'main','com_banners','Banners','','Banners','index.php?option=com_banners','component',1,1,1,4,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',1,10,0,'*',1),(3,'main','com_banners','Banners','','Banners/Banners','index.php?option=com_banners','component',1,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',2,3,0,'*',1),(4,'main','com_banners_categories','Categories','','Banners/Categories','index.php?option=com_categories&extension=com_banners','component',1,2,2,6,0,'0000-00-00 00:00:00',0,0,'class:banners-cat',0,'',4,5,0,'*',1),(5,'main','com_banners_clients','Clients','','Banners/Clients','index.php?option=com_banners&view=clients','component',1,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners-clients',0,'',6,7,0,'*',1),(6,'main','com_banners_tracks','Tracks','','Banners/Tracks','index.php?option=com_banners&view=tracks','component',1,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners-tracks',0,'',8,9,0,'*',1),(7,'main','com_contact','Contacts','','Contacts','index.php?option=com_contact','component',1,1,1,8,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',21,26,0,'*',1),(8,'main','com_contact_contacts','Contacts','','Contacts/Contacts','index.php?option=com_contact','component',1,7,2,8,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',22,23,0,'*',1),(9,'main','com_contact_categories','Categories','','Contacts/Categories','index.php?option=com_categories&extension=com_contact','component',1,7,2,6,0,'0000-00-00 00:00:00',0,0,'class:contact-cat',0,'',24,25,0,'*',1),(10,'main','com_messages','Messaging','','Messaging','index.php?option=com_messages','component',1,1,1,15,0,'0000-00-00 00:00:00',0,0,'class:messages',0,'',33,36,0,'*',1),(11,'main','com_messages_add','New Private Message','','Messaging/New Private Message','index.php?option=com_messages&task=message.add','component',1,10,2,15,0,'0000-00-00 00:00:00',0,0,'class:messages-add',0,'',34,35,0,'*',1),(13,'main','com_newsfeeds','News Feeds','','News Feeds','index.php?option=com_newsfeeds','component',1,1,1,17,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',39,44,0,'*',1),(14,'main','com_newsfeeds_feeds','Feeds','','News Feeds/Feeds','index.php?option=com_newsfeeds','component',1,13,2,17,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',40,41,0,'*',1),(15,'main','com_newsfeeds_categories','Categories','','News Feeds/Categories','index.php?option=com_categories&extension=com_newsfeeds','component',1,13,2,6,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds-cat',0,'',42,43,0,'*',1),(16,'main','com_redirect','Redirect','','Redirect','index.php?option=com_redirect','component',1,1,1,24,0,'0000-00-00 00:00:00',0,0,'class:redirect',0,'',45,46,0,'*',1),(17,'main','com_search','Basic Search','','Basic Search','index.php?option=com_search','component',1,1,1,19,0,'0000-00-00 00:00:00',0,0,'class:search',0,'',47,48,0,'*',1),(18,'main','com_finder','Smart Search','','Smart Search','index.php?option=com_finder','component',1,1,1,27,0,'0000-00-00 00:00:00',0,0,'class:finder',0,'',49,50,0,'*',1),(19,'main','com_joomlaupdate','Joomla! Update','','Joomla! Update','index.php?option=com_joomlaupdate','component',1,1,1,28,0,'0000-00-00 00:00:00',0,0,'class:joomlaupdate',0,'',51,52,0,'*',1),(20,'main','com_tags','Tags','','Tags','index.php?option=com_tags','component',1,1,1,29,0,'0000-00-00 00:00:00',0,1,'class:tags',0,'',53,54,0,'',1),(21,'main','com_postinstall','Post-installation messages','','Post-installation messages','index.php?option=com_postinstall','component',1,1,1,32,0,'0000-00-00 00:00:00',0,1,'class:postinstall',0,'',55,56,0,'*',1),(22,'main','com_associations','Multilingual Associations','','Multilingual Associations','index.php?option=com_associations','component',1,1,1,34,0,'0000-00-00 00:00:00',0,0,'class:associations',0,'',57,58,0,'*',1),(101,'mainmenu','Home','home','','home','index.php?option=com_content&view=article&id=6','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"0\",\"show_vote\":\"\",\"show_tags\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',11,16,1,'*',0),(102,'mainmenu','About Us','about-us','','about-us','index.php?option=com_content&view=article&id=2','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"0\",\"show_category\":\"0\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"0\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"0\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',17,18,0,'*',0),(103,'mainmenu','News','news','','news','index.php?option=com_content&view=category&layout=blog&id=8','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"layout_type\":\"blog\",\"show_category_title\":\"\",\"show_description\":\"1\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"0\",\"num_columns\":\"1\",\"num_links\":\"3\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"published\",\"show_pagination\":\"0\",\"show_pagination_results\":\"0\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"0\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"info_bloc_position\":\"0\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"0\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',19,20,0,'*',0),(104,'mainmenu','Login','login','','login','index.php?option=com_users&view=login','component',1,1,1,25,0,'0000-00-00 00:00:00',0,4,'',0,'{\"login_redirect_url\":\"\",\"logindescription_show\":\"1\",\"login_description\":\"\",\"login_image\":\"\",\"logout_redirect_url\":\"\",\"logoutdescription_show\":\"1\",\"logout_description\":\"\",\"logout_image\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',29,30,0,'*',0),(105,'mainmenu','Edit Profile','edit-profile','','edit-profile','index.php?option=com_users&view=profile&layout=edit','component',1,1,1,25,0,'0000-00-00 00:00:00',0,2,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',31,32,0,'*',0),(106,'mainmenu','Contact Us','contact-us','','contact-us','index.php?option=com_contact&view=contact&id=1','component',1,1,1,8,0,'0000-00-00 00:00:00',0,1,'',0,'{\"presentation_style\":\"\",\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',27,28,0,'*',0),(107,'mainmenu','Administrator','2012-01-04-04-05-24','','2012-01-04-04-05-24','administrator','url',1,1,1,0,0,'0000-00-00 00:00:00',1,3,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',59,60,0,'*',0),(109,'mainmenu','Create an Article','create-an-article','','create-an-article','index.php?option=com_content&view=form&layout=edit','component',1,1,1,22,0,'0000-00-00 00:00:00',0,3,'',0,'{\"enable_category\":\"0\",\"catid\":\"2\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',37,38,0,'*',0),(112,'mainmenu','Site Settings','site-settings','','home/site-settings','index.php?option=com_config&view=config&controller=config.display.config','component',1,101,2,23,0,'0000-00-00 00:00:00',0,6,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',12,13,0,'*',0),(113,'mainmenu','Template Settings','template-settings','','home/template-settings','index.php?option=com_config&view=templates&controller=config.display.templates','component',1,101,2,23,0,'0000-00-00 00:00:00',0,6,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',14,15,0,'*',0);
/*!40000 ALTER TABLE `exam_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_menu_types`
--

DROP TABLE IF EXISTS `exam_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_menu_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_menu_types`
--

LOCK TABLES `exam_menu_types` WRITE;
/*!40000 ALTER TABLE `exam_menu_types` DISABLE KEYS */;
INSERT INTO `exam_menu_types` VALUES (1,0,'mainmenu','Main Menu','The main menu for the site',0);
/*!40000 ALTER TABLE `exam_menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_messages`
--

DROP TABLE IF EXISTS `exam_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_messages` (
  `message_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int unsigned NOT NULL DEFAULT '0',
  `user_id_to` int unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_messages`
--

LOCK TABLES `exam_messages` WRITE;
/*!40000 ALTER TABLE `exam_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_messages_cfg`
--

DROP TABLE IF EXISTS `exam_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_messages_cfg` (
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_messages_cfg`
--

LOCK TABLES `exam_messages_cfg` WRITE;
/*!40000 ALTER TABLE `exam_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_messages_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_modules`
--

DROP TABLE IF EXISTS `exam_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint unsigned NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_modules`
--

LOCK TABLES `exam_modules` WRITE;
/*!40000 ALTER TABLE `exam_modules` DISABLE KEYS */;
INSERT INTO `exam_modules` VALUES (1,0,'Main Menu','','',1,'position-1',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,1,'{\"menutype\":\"mainmenu\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\" nav-pills\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(2,0,'Login','','',1,'login',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'',1,'*'),(3,49,'Popular Articles','','',2,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_popular',3,1,'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"6\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',1,'*'),(4,50,'Recently Added Articles','','',1,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_latest',3,1,'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"6\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',1,'*'),(8,0,'Toolbar','','',1,'toolbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_toolbar',3,1,'',1,'*'),(9,0,'Quick Icons','','',1,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_quickicon',3,1,'',1,'*'),(10,48,'Logged-in Users','','',3,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_logged',3,1,'{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"6\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',1,'*'),(12,0,'Admin Menu','','',1,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',3,1,'{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}',1,'*'),(13,0,'Admin Submenu','','',1,'submenu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_submenu',3,1,'',1,'*'),(14,0,'User Status','','',2,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_status',3,1,'',1,'*'),(15,0,'Title','','',1,'title',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_title',3,1,'',1,'*'),(16,0,'Login Form','','',2,'position-7',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'{\"pretext\":\"\",\"posttext\":\"\",\"login\":\"\",\"logout\":\"\",\"greeting\":\"1\",\"name\":\"0\",\"usesecure\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(17,0,'Breadcrumbs','','',1,'position-2',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_breadcrumbs',1,1,'{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"0\",\"cache_time\":\"0\",\"cachemode\":\"itemid\"}',0,'*'),(79,0,'Multilanguage status','','',1,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_multilangstatus',3,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(80,0,'Search','','',-2,'position-0',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_search',1,0,'{\"label\":\"\",\"width\":\"20\",\"text\":\"\",\"button\":\"\",\"button_pos\":\"right\",\"imagebutton\":\"\",\"button_text\":\"\",\"opensearch\":\"1\",\"opensearch_title\":\"\",\"set_itemid\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(82,0,'News Flash','','',1,'',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_articles_news',1,1,'{\"catid\":[\"8\"],\"image\":\"0\",\"item_title\":\"1\",\"link_titles\":\"1\",\"item_heading\":\"h4\",\"showLastSeparator\":\"0\",\"readmore\":\"0\",\"count\":\"5\",\"ordering\":\"a.publish_up\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(83,0,'Side Module','','<p>This is a module where you might want to add some more information or an image,  a link to your social media presence, or whatever makes sense for your site.  </p><p>You can edit this module in the module manager. Look for the Side Module.</p>',1,'position-7',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(86,0,'Joomla Version','','',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_version',3,1,'{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(87,0,'Footer','','',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_footer',1,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(88,52,'Image','','<p><img src=\"images/headers/windows.jpg\" alt=\"\" /></p>',1,'position-3',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(89,51,'Site Information','','',4,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_stats_admin',6,1,'{\"serverinfo\":\"1\",\"siteinfo\":\"1\",\"counter\":\"1\",\"increase\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"6\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',1,'*'),(90,53,'Release News','','',0,'postinstall',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_feed',1,1,'{\"rssurl\":\"https:\\/\\/www.joomla.org\\/announcements\\/release-news.feed\",\"rssrtl\":\"0\",\"rsstitle\":\"1\",\"rssdesc\":\"1\",\"rssimage\":\"1\",\"rssitems\":\"3\",\"rssitemdesc\":\"1\",\"word_count\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',1,'*'),(91,54,'Latest Actions','','',0,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_latestactions',6,1,'{}',1,'*');
/*!40000 ALTER TABLE `exam_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_modules_menu`
--

DROP TABLE IF EXISTS `exam_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_modules_menu` (
  `moduleid` int NOT NULL DEFAULT '0',
  `menuid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_modules_menu`
--

LOCK TABLES `exam_modules_menu` WRITE;
/*!40000 ALTER TABLE `exam_modules_menu` DISABLE KEYS */;
INSERT INTO `exam_modules_menu` VALUES (1,0),(2,0),(3,0),(4,0),(6,0),(7,0),(8,0),(9,0),(10,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(79,0),(80,0),(83,0),(85,0),(86,0),(88,0),(91,0);
/*!40000 ALTER TABLE `exam_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_newsfeeds`
--

DROP TABLE IF EXISTS `exam_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_newsfeeds` (
  `catid` int NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int unsigned NOT NULL DEFAULT '1',
  `cache_time` int unsigned NOT NULL DEFAULT '3600',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int NOT NULL DEFAULT '0',
  `rtl` tinyint NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_newsfeeds`
--

LOCK TABLES `exam_newsfeeds` WRITE;
/*!40000 ALTER TABLE `exam_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_newsfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_overrider`
--

DROP TABLE IF EXISTS `exam_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_overrider` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_overrider`
--

LOCK TABLES `exam_overrider` WRITE;
/*!40000 ALTER TABLE `exam_overrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_overrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_postinstall_messages`
--

DROP TABLE IF EXISTS `exam_postinstall_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_postinstall_messages` (
  `postinstall_message_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_postinstall_messages`
--

LOCK TABLES `exam_postinstall_messages` WRITE;
/*!40000 ALTER TABLE `exam_postinstall_messages` DISABLE KEYS */;
INSERT INTO `exam_postinstall_messages` VALUES (1,700,'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE','PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY','PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION','plg_twofactorauth_totp',1,'action','site://plugins/twofactorauth/totp/postinstall/actions.php','twofactorauth_postinstall_action','site://plugins/twofactorauth/totp/postinstall/actions.php','twofactorauth_postinstall_condition','3.2.0',1),(2,700,'COM_CPANEL_WELCOME_BEGINNERS_TITLE','COM_CPANEL_WELCOME_BEGINNERS_MESSAGE','','com_cpanel',1,'message','','','','','3.2.0',1),(3,700,'COM_CPANEL_MSG_STATS_COLLECTION_TITLE','COM_CPANEL_MSG_STATS_COLLECTION_BODY','','com_cpanel',1,'message','','','admin://components/com_admin/postinstall/statscollection.php','admin_postinstall_statscollection_condition','3.5.0',1),(4,700,'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME','PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY','PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION','plg_system_updatenotification',1,'action','site://plugins/system/updatenotification/postinstall/updatecachetime.php','updatecachetime_postinstall_action','site://plugins/system/updatenotification/postinstall/updatecachetime.php','updatecachetime_postinstall_condition','3.6.3',1),(5,700,'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_TITLE','COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_BODY','','com_cpanel',1,'message','','','admin://components/com_admin/postinstall/joomla40checks.php','admin_postinstall_joomla40checks_condition','3.7.0',1),(6,700,'TPL_HATHOR_MESSAGE_POSTINSTALL_TITLE','TPL_HATHOR_MESSAGE_POSTINSTALL_BODY','TPL_HATHOR_MESSAGE_POSTINSTALL_ACTION','tpl_hathor',1,'action','admin://templates/hathor/postinstall/hathormessage.php','hathormessage_postinstall_action','admin://templates/hathor/postinstall/hathormessage.php','hathormessage_postinstall_condition','3.7.0',1),(7,700,'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_TITLE','PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_BODY','PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_ACTION','plg_captcha_recaptcha',1,'action','site://plugins/captcha/recaptcha/postinstall/actions.php','recaptcha_postinstall_action','site://plugins/captcha/recaptcha/postinstall/actions.php','recaptcha_postinstall_condition','3.8.6',1),(8,700,'COM_ACTIONLOGS_POSTINSTALL_TITLE','COM_ACTIONLOGS_POSTINSTALL_BODY','','com_actionlogs',1,'message','','','','','3.9.0',1),(9,700,'COM_PRIVACY_POSTINSTALL_TITLE','COM_PRIVACY_POSTINSTALL_BODY','','com_privacy',1,'message','','','','','3.9.0',1);
/*!40000 ALTER TABLE `exam_postinstall_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_privacy_consents`
--

DROP TABLE IF EXISTS `exam_privacy_consents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_privacy_consents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint NOT NULL DEFAULT '0',
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_privacy_consents`
--

LOCK TABLES `exam_privacy_consents` WRITE;
/*!40000 ALTER TABLE `exam_privacy_consents` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_privacy_consents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_privacy_requests`
--

DROP TABLE IF EXISTS `exam_privacy_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_privacy_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint NOT NULL DEFAULT '0',
  `request_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_privacy_requests`
--

LOCK TABLES `exam_privacy_requests` WRITE;
/*!40000 ALTER TABLE `exam_privacy_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_privacy_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_redirect_links`
--

DROP TABLE IF EXISTS `exam_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_redirect_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_redirect_links`
--

LOCK TABLES `exam_redirect_links` WRITE;
/*!40000 ALTER TABLE `exam_redirect_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_redirect_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_schemas`
--

DROP TABLE IF EXISTS `exam_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_schemas` (
  `extension_id` int NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_schemas`
--

LOCK TABLES `exam_schemas` WRITE;
/*!40000 ALTER TABLE `exam_schemas` DISABLE KEYS */;
INSERT INTO `exam_schemas` VALUES (700,'3.9.3-2019-02-07');
/*!40000 ALTER TABLE `exam_schemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_session`
--

DROP TABLE IF EXISTS `exam_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint unsigned DEFAULT NULL,
  `guest` tinyint unsigned DEFAULT '1',
  `time` int NOT NULL DEFAULT '0',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_session`
--

LOCK TABLES `exam_session` WRITE;
/*!40000 ALTER TABLE `exam_session` DISABLE KEYS */;
INSERT INTO `exam_session` VALUES (_binary '7qipctk5b2mcethm9705furfeb',0,1,1616965122,'joomla|s:1340:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTo5O3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTYxNjk2NTExMDtzOjQ6Imxhc3QiO2k6MTYxNjk2NTEyMTtzOjM6Im5vdyI7aToxNjE2OTY1MTIyO31zOjU6InRva2VuIjtzOjMyOiJkMnZmWFR2ZEQ2Zzk5MVVoZXM1enpialhCM3Q4R2FXMiI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjoyOntzOjU6InVzZXJzIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6ImxvZ2luIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImZvcm0iO086ODoic3RkQ2xhc3MiOjI6e3M6NjoicmV0dXJuIjtzOjI3OiJodHRwOi8vMTkyLjE2OC4wLjIxL2pvb21sYS8iO3M6NDoiZGF0YSI7YTo1OntzOjY6InJldHVybiI7czoyNzoiaHR0cDovLzE5Mi4xNjguMC4yMS9qb29tbGEvIjtzOjg6InVzZXJuYW1lIjtzOjA6IiI7czo4OiJwYXNzd29yZCI7czowOiIiO3M6OToic2VjcmV0a2V5IjtzOjA6IiI7czo4OiJyZW1lbWJlciI7aTowO319fX1zOjExOiJjb21fY29udGFjdCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjb250YWN0IjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImRhdGEiO2E6MTp7czo1OiJjYXRpZCI7czoxOiI0Ijt9fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO31zOjExOiJhcHBsaWNhdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJxdWV1ZSI7YTowOnt9fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9\";',0,''),(_binary 'kf3dlvdb2h22j7nj54u950ulos',0,1,1616965110,'joomla|s:860:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTYxNjk2NTEwOTtzOjQ6Imxhc3QiO2k6MTYxNjk2NTEwOTtzOjM6Im5vdyI7aToxNjE2OTY1MTA5O31zOjU6InRva2VuIjtzOjMyOiJaRUJ3ZVdxZm1CQWdzeUhqVXgxZnlxdlJvZlhYNmtXZiI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjoxOntzOjEzOiJjb21faW5zdGFsbGVyIjtPOjg6InN0ZENsYXNzIjoyOntzOjc6Im1lc3NhZ2UiO3M6MDoiIjtzOjE3OiJleHRlbnNpb25fbWVzc2FnZSI7czowOiIiO319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";',0,'');
/*!40000 ALTER TABLE `exam_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_tags`
--

DROP TABLE IF EXISTS `exam_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_tags`
--

LOCK TABLES `exam_tags` WRITE;
/*!40000 ALTER TABLE `exam_tags` DISABLE KEYS */;
INSERT INTO `exam_tags` VALUES (1,0,0,1,0,'','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'','','','',580,'2021-03-28 20:58:21','',0,'0000-00-00 00:00:00','','',0,'*',1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `exam_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_template_styles`
--

DROP TABLE IF EXISTS `exam_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_template_styles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_template_styles`
--

LOCK TABLES `exam_template_styles` WRITE;
/*!40000 ALTER TABLE `exam_template_styles` DISABLE KEYS */;
INSERT INTO `exam_template_styles` VALUES (4,'beez3',0,'0','Beez3 - Default','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.png\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}'),(5,'hathor',1,'0','Hathor - Default','{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}'),(7,'protostar',0,'1','My Default Style (Protostar)','{\"templateColor\":\"#696969\",\"templateBackgroundColor\":\"#E3E3E3\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}'),(8,'isis',1,'1','isis - Default','{\"templateColor\":\"#000000\",\"logoFile\":\"\",\"admin_menus\":1,\"displayHeader\":1,\"statusFixed\":1,\"stickyToolbar\":1}');
/*!40000 ALTER TABLE `exam_template_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_ucm_base`
--

DROP TABLE IF EXISTS `exam_ucm_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_ucm_base` (
  `ucm_id` int unsigned NOT NULL,
  `ucm_item_id` int NOT NULL,
  `ucm_type_id` int NOT NULL,
  `ucm_language_id` int NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_ucm_base`
--

LOCK TABLES `exam_ucm_base` WRITE;
/*!40000 ALTER TABLE `exam_ucm_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_ucm_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_ucm_content`
--

DROP TABLE IF EXISTS `exam_ucm_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_ucm_content` (
  `core_content_id` int unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int unsigned NOT NULL DEFAULT '0',
  `core_access` int unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int unsigned NOT NULL DEFAULT '0',
  `core_version` int unsigned NOT NULL DEFAULT '1',
  `core_ordering` int NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_ucm_content`
--

LOCK TABLES `exam_ucm_content` WRITE;
/*!40000 ALTER TABLE `exam_ucm_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_ucm_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_ucm_history`
--

DROP TABLE IF EXISTS `exam_ucm_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_ucm_history` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int unsigned NOT NULL,
  `ucm_type_id` int unsigned NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int unsigned NOT NULL DEFAULT '0',
  `character_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_ucm_history`
--

LOCK TABLES `exam_ucm_history` WRITE;
/*!40000 ALTER TABLE `exam_ucm_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_ucm_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_update_sites`
--

DROP TABLE IF EXISTS `exam_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_update_sites` (
  `update_site_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int DEFAULT '0',
  `last_check_timestamp` bigint DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_update_sites`
--

LOCK TABLES `exam_update_sites` WRITE;
/*!40000 ALTER TABLE `exam_update_sites` DISABLE KEYS */;
INSERT INTO `exam_update_sites` VALUES (1,'Joomla! Core','collection','https://update.joomla.org/core/list.xml',1,1616965109,''),(2,'Accredited Joomla! Translations','collection','https://update.joomla.org/language/translationlist_3.xml',1,0,''),(3,'Joomla! Update Component Update Site','extension','https://update.joomla.org/core/extensions/com_joomlaupdate.xml',1,0,'');
/*!40000 ALTER TABLE `exam_update_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_update_sites_extensions`
--

DROP TABLE IF EXISTS `exam_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_update_sites_extensions` (
  `update_site_id` int NOT NULL DEFAULT '0',
  `extension_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_update_sites_extensions`
--

LOCK TABLES `exam_update_sites_extensions` WRITE;
/*!40000 ALTER TABLE `exam_update_sites_extensions` DISABLE KEYS */;
INSERT INTO `exam_update_sites_extensions` VALUES (1,700),(2,802),(3,28);
/*!40000 ALTER TABLE `exam_update_sites_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_updates`
--

DROP TABLE IF EXISTS `exam_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_updates` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `update_site_id` int DEFAULT '0',
  `extension_id` int DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_updates`
--

LOCK TABLES `exam_updates` WRITE;
/*!40000 ALTER TABLE `exam_updates` DISABLE KEYS */;
INSERT INTO `exam_updates` VALUES (1,1,700,'Joomla','','joomla','file','',0,'3.9.25','','https://update.joomla.org/core/sts/extension_sts.xml','','');
/*!40000 ALTER TABLE `exam_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_user_keys`
--

DROP TABLE IF EXISTS `exam_user_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_user_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_user_keys`
--

LOCK TABLES `exam_user_keys` WRITE;
/*!40000 ALTER TABLE `exam_user_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_user_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_user_notes`
--

DROP TABLE IF EXISTS `exam_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_user_notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_user_notes`
--

LOCK TABLES `exam_user_notes` WRITE;
/*!40000 ALTER TABLE `exam_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_user_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_user_profiles`
--

DROP TABLE IF EXISTS `exam_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_user_profiles` (
  `user_id` int NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_user_profiles`
--

LOCK TABLES `exam_user_profiles` WRITE;
/*!40000 ALTER TABLE `exam_user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_user_usergroup_map`
--

DROP TABLE IF EXISTS `exam_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_user_usergroup_map` (
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_user_usergroup_map`
--

LOCK TABLES `exam_user_usergroup_map` WRITE;
/*!40000 ALTER TABLE `exam_user_usergroup_map` DISABLE KEYS */;
INSERT INTO `exam_user_usergroup_map` VALUES (580,8);
/*!40000 ALTER TABLE `exam_user_usergroup_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_usergroups`
--

DROP TABLE IF EXISTS `exam_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_usergroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_usergroups`
--

LOCK TABLES `exam_usergroups` WRITE;
/*!40000 ALTER TABLE `exam_usergroups` DISABLE KEYS */;
INSERT INTO `exam_usergroups` VALUES (1,0,1,18,'Public'),(2,1,8,15,'Registered'),(3,2,9,14,'Author'),(4,3,10,13,'Editor'),(5,4,11,12,'Publisher'),(6,1,4,7,'Manager'),(7,6,5,6,'Administrator'),(8,1,16,17,'Super Users'),(9,1,2,3,'Guest');
/*!40000 ALTER TABLE `exam_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_users`
--

DROP TABLE IF EXISTS `exam_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint NOT NULL DEFAULT '0',
  `sendEmail` tinyint DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_users`
--

LOCK TABLES `exam_users` WRITE;
/*!40000 ALTER TABLE `exam_users` DISABLE KEYS */;
INSERT INTO `exam_users` VALUES (580,'Super User','admin','s.beloglyadov@gmail.com','$2y$10$xSxE.uxd520wSRS5sz/rjueyukoSTV3EixgDxrOVwATqmrL2zP5kG',0,1,'2021-03-28 20:58:21','0000-00-00 00:00:00','0','','0000-00-00 00:00:00',0,'','',0);
/*!40000 ALTER TABLE `exam_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_utf8_conversion`
--

DROP TABLE IF EXISTS `exam_utf8_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_utf8_conversion` (
  `converted` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_utf8_conversion`
--

LOCK TABLES `exam_utf8_conversion` WRITE;
/*!40000 ALTER TABLE `exam_utf8_conversion` DISABLE KEYS */;
INSERT INTO `exam_utf8_conversion` VALUES (2);
/*!40000 ALTER TABLE `exam_utf8_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_viewlevels`
--

DROP TABLE IF EXISTS `exam_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_viewlevels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_viewlevels`
--

LOCK TABLES `exam_viewlevels` WRITE;
/*!40000 ALTER TABLE `exam_viewlevels` DISABLE KEYS */;
INSERT INTO `exam_viewlevels` VALUES (1,'Public',0,'[1]'),(2,'Registered',2,'[6,2,8]'),(3,'Special',3,'[6,3,8]'),(5,'Guest',1,'[9]'),(6,'Super Users',4,'[8]');
/*!40000 ALTER TABLE `exam_viewlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'joomla'
--

--
-- Dumping routines for database 'joomla'
--

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `columns_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `component_id` int unsigned NOT NULL AUTO_INCREMENT,
  `component_group_id` int unsigned NOT NULL,
  `component_urn` text NOT NULL,
  PRIMARY KEY (`component_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Components';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('localhost','joomla','juser','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','performance_schema','mysql.session','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N'),('localhost','sys','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_roles`
--

DROP TABLE IF EXISTS `default_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_roles` (
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `DEFAULT_ROLE_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '%',
  `DEFAULT_ROLE_USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`HOST`,`USER`,`DEFAULT_ROLE_HOST`,`DEFAULT_ROLE_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Default roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_roles`
--

LOCK TABLES `default_roles` WRITE;
/*!40000 ALTER TABLE `default_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine_cost`
--

DROP TABLE IF EXISTS `engine_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine_cost` (
  `engine_name` varchar(64) NOT NULL,
  `device_type` int NOT NULL,
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'io_block_read_cost' then 1.0 when _utf8mb3'memory_block_read_cost' then 0.25 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`,`engine_name`,`device_type`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine_cost`
--

LOCK TABLES `engine_cost` WRITE;
/*!40000 ALTER TABLE `engine_cost` DISABLE KEYS */;
INSERT INTO `engine_cost` (`engine_name`, `device_type`, `cost_name`, `cost_value`, `last_update`, `comment`) VALUES ('default',0,'io_block_read_cost',NULL,'2021-03-28 19:26:21',NULL),('default',0,'memory_block_read_cost',NULL,'2021-03-28 19:26:21',NULL);
/*!40000 ALTER TABLE `engine_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_grants`
--

DROP TABLE IF EXISTS `global_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_grants` (
  `USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `PRIV` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `WITH_GRANT_OPTION` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER`,`HOST`,`PRIV`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Extended global grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_grants`
--

LOCK TABLES `global_grants` WRITE;
/*!40000 ALTER TABLE `global_grants` DISABLE KEYS */;
INSERT INTO `global_grants` VALUES ('mysql.session','localhost','BACKUP_ADMIN','N'),('mysql.session','localhost','CLONE_ADMIN','N'),('mysql.session','localhost','CONNECTION_ADMIN','N'),('mysql.session','localhost','PERSIST_RO_VARIABLES_ADMIN','N'),('mysql.session','localhost','SESSION_VARIABLES_ADMIN','N'),('mysql.session','localhost','SYSTEM_USER','N'),('mysql.session','localhost','SYSTEM_VARIABLES_ADMIN','N'),('root','localhost','APPLICATION_PASSWORD_ADMIN','Y'),('root','localhost','AUDIT_ADMIN','Y'),('root','localhost','BACKUP_ADMIN','Y'),('root','localhost','BINLOG_ADMIN','Y'),('root','localhost','BINLOG_ENCRYPTION_ADMIN','Y'),('root','localhost','CLONE_ADMIN','Y'),('root','localhost','CONNECTION_ADMIN','Y'),('root','localhost','ENCRYPTION_KEY_ADMIN','Y'),('root','localhost','GROUP_REPLICATION_ADMIN','Y'),('root','localhost','INNODB_REDO_LOG_ARCHIVE','Y'),('root','localhost','INNODB_REDO_LOG_ENABLE','Y'),('root','localhost','PERSIST_RO_VARIABLES_ADMIN','Y'),('root','localhost','REPLICATION_APPLIER','Y'),('root','localhost','REPLICATION_SLAVE_ADMIN','Y'),('root','localhost','RESOURCE_GROUP_ADMIN','Y'),('root','localhost','RESOURCE_GROUP_USER','Y'),('root','localhost','ROLE_ADMIN','Y'),('root','localhost','SERVICE_CONNECTION_ADMIN','Y'),('root','localhost','SESSION_VARIABLES_ADMIN','Y'),('root','localhost','SET_USER_ID','Y'),('root','localhost','SHOW_ROUTINE','Y'),('root','localhost','SYSTEM_USER','Y'),('root','localhost','SYSTEM_VARIABLES_ADMIN','Y'),('root','localhost','TABLE_ENCRYPTION_ADMIN','Y'),('root','localhost','XA_RECOVER_ADMIN','Y');
/*!40000 ALTER TABLE `global_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtid_executed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `gtid_executed` (
  `source_uuid` char(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` bigint NOT NULL COMMENT 'First number of interval.',
  `interval_end` bigint NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (`source_uuid`,`interval_start`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` VALUES (0,'Contents',0,''),(1,'Help Metadata',0,''),(2,'Data Types',0,''),(3,'Administration',0,''),(4,'Language Structure',0,''),(5,'Geographic Features',0,''),(6,'MBR',5,''),(7,'WKT',5,''),(8,'Functions',0,''),(9,'Comparison Operators',8,''),(10,'Logical Operators',8,''),(11,'Control Flow Functions',8,''),(12,'Numeric Functions',8,''),(13,'Date and Time Functions',8,''),(14,'String Functions',8,''),(15,'Bit Functions',8,''),(16,'Encryption Functions',8,''),(17,'Locking Functions',8,''),(18,'Information Functions',8,''),(19,'Spatial Functions',8,''),(20,'WKT Functions',19,''),(21,'WKB Functions',19,''),(22,'Geometry Constructors',19,''),(23,'Geometry Property Functions',19,''),(24,'Point Property Functions',19,''),(25,'LineString Property Functions',19,''),(26,'Polygon Property Functions',19,''),(27,'GeometryCollection Property Functions',19,''),(28,'Geometry Relation Functions',19,''),(29,'MBR Functions',19,''),(30,'GROUP BY Functions and Modifiers',8,''),(31,'Performance Schema Functions',8,''),(32,'Miscellaneous Functions',8,''),(33,'Data Definition',0,''),(34,'Data Manipulation',0,''),(35,'Transactions',0,''),(36,'Compound Statements',0,''),(37,'Account Management',0,''),(38,'Table Maintenance',0,''),(39,'User-Defined Functions',0,''),(40,'Components',0,''),(41,'Plugins',0,''),(42,'Utility',0,''),(43,'Storage Engines',0,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (226,'(JSON'),(227,'->'),(229,'->>'),(46,'<>'),(637,'ACCOUNT'),(439,'ACTION'),(40,'ADD'),(663,'ADMIN'),(108,'AES_DECRYPT'),(109,'AES_ENCRYPT'),(358,'AFTER'),(95,'AGAINST'),(684,'AGGREGATE'),(359,'ALGORITHM'),(502,'ALL'),(41,'ALTER'),(360,'ANALYZE'),(47,'AND'),(313,'ANY_VALUE'),(440,'ARCHIVE'),(102,'ARRAY'),(503,'AS'),(261,'ASC'),(421,'AT'),(638,'ATTRIBUTE'),(526,'AUTOCOMMIT'),(462,'AUTOEXTEND_SIZE'),(361,'AUTO_INCREMENT'),(362,'AVG_ROW_LENGTH'),(538,'BACKUP'),(552,'BEFORE'),(527,'BEGIN'),(48,'BETWEEN'),(59,'BIGINT'),(104,'BINARY'),(342,'BINLOG'),(314,'BIN_TO_UUID'),(8,'BOOL'),(9,'BOOLEAN'),(85,'BOTH'),(425,'BTREE'),(262,'BY'),(33,'BYTE'),(720,'CACHE'),(470,'CALL'),(285,'CAN_ACCESS_COLUMN'),(286,'CAN_ACCESS_DATABASE'),(287,'CAN_ACCESS_TABLE'),(288,'CAN_ACCESS_VIEW'),(441,'CASCADE'),(53,'CASE'),(617,'CATALOG_NAME'),(62,'CEIL'),(63,'CEILING'),(528,'CHAIN'),(363,'CHANGE'),(343,'CHANNEL'),(34,'CHAR'),(30,'CHARACTER'),(696,'CHARSET'),(364,'CHECK'),(365,'CHECKSUM'),(639,'CIPHER'),(618,'CLASS_ORIGIN'),(664,'CLIENT'),(692,'CLONE'),(476,'CLOSE'),(366,'COALESCE'),(715,'CODE'),(321,'COLLATE'),(698,'COLLATION'),(367,'COLUMN'),(368,'COLUMNS'),(619,'COLUMN_NAME'),(328,'COMMENT'),(529,'COMMIT'),(541,'COMMITTED'),(442,'COMPACT'),(329,'COMPLETION'),(688,'COMPONENT'),(443,'COMPRESSED'),(369,'COMPRESSION'),(489,'CONCURRENT'),(614,'CONDITION'),(370,'CONNECTION'),(530,'CONSISTENT'),(371,'CONSTRAINT'),(620,'CONSTRAINT_CATALOG'),(621,'CONSTRAINT_NAME'),(622,'CONSTRAINT_SCHEMA'),(615,'CONTINUE'),(103,'CONVERT'),(260,'COUNT'),(42,'CREATE'),(258,'CREATE_DH_PARAMETERS'),(519,'CROSS'),(444,'CSV'),(270,'CUME_DIST'),(640,'CURRENT'),(116,'CURRENT_ROLE'),(330,'CURRENT_USER'),(612,'CURSOR'),(623,'CURSOR_NAME'),(372,'DATA'),(322,'DATABASE'),(699,'DATABASES'),(414,'DATAFILE'),(27,'DATE'),(105,'DATETIME'),(66,'DATE_ADD'),(67,'DATE_SUB'),(68,'DAY'),(69,'DAY_HOUR'),(70,'DAY_MINUTE'),(71,'DAY_SECOND'),(602,'DEALLOCATE'),(19,'DEC'),(22,'DECIMAL'),(603,'DECLARE'),(2,'DEFAULT'),(593,'DEFAULT_AUTH'),(331,'DEFINER'),(432,'DEFINITION'),(482,'DELAYED'),(373,'DELAY_KEY_WRITE'),(445,'DELETE'),(271,'DENSE_RANK'),(263,'DESC'),(731,'DESCRIBE'),(433,'DESCRIPTION'),(624,'DIAGNOSTICS'),(374,'DIRECTORY'),(332,'DISABLE'),(375,'DISCARD'),(259,'DISTINCT'),(504,'DISTINCTROW'),(333,'DO'),(376,'DROP'),(518,'DUAL'),(505,'DUMPFILE'),(483,'DUPLICATE'),(446,'DYNAMIC'),(54,'ELSE'),(604,'ELSEIF'),(334,'ENABLE'),(490,'ENCLOSED'),(323,'ENCRYPTION'),(55,'END'),(422,'ENDS'),(377,'ENGINE'),(700,'ENGINES'),(344,'ERROR'),(701,'ERRORS'),(89,'ESCAPE'),(491,'ESCAPED'),(335,'EVENT'),(713,'EVENTS'),(423,'EVERY'),(675,'EXCEPT'),(378,'EXCHANGE'),(601,'EXECUTE'),(420,'EXISTS'),(616,'EXIT'),(96,'EXPANSION'),(641,'EXPIRE'),(732,'EXPLAIN'),(721,'EXPORT'),(682,'EXTENDED'),(463,'EXTENT_SIZE'),(228,'EXTRACTION)'),(642,'FAILED_LOGIN_ATTEMPTS'),(6,'FALSE'),(680,'FAST'),(447,'FEDERATED'),(613,'FETCH'),(492,'FIELDS'),(665,'FILE'),(464,'FILE_BLOCK_SIZE'),(584,'FILTER'),(379,'FIRST'),(272,'FIRST_VALUE'),(20,'FIXED'),(23,'FLOAT4'),(24,'FLOAT8'),(60,'FLOOR'),(722,'FLUSH'),(345,'FOR'),(520,'FORCE'),(380,'FOREIGN'),(733,'FORMAT'),(281,'FORMAT_BYTES'),(282,'FORMAT_PICO_TIME'),(86,'FROM'),(448,'FULL'),(381,'FULLTEXT'),(341,'FUNCTION'),(723,'GENERAL'),(149,'GEOMCOLLECTION'),(150,'GEOMETRYCOLLECTION'),(625,'GET'),(289,'GET_DD_COLUMN_PRIVILEGES'),(290,'GET_DD_CREATE_OPTIONS'),(291,'GET_DD_INDEX_SUB_PART_LENGTH'),(542,'GLOBAL'),(666,'GRANT'),(702,'GRANTS'),(353,'GROUP'),(315,'GROUPING'),(477,'HANDLER'),(506,'HAVING'),(449,'HEAP'),(5,'HELP'),(0,'HELP_DATE'),(1,'HELP_VERSION'),(484,'HIGH_PRIORITY'),(643,'HISTORY'),(426,'HOST'),(703,'HOSTS'),(72,'HOUR'),(73,'HOUR_MINUTE'),(74,'HOUR_SECOND'),(117,'ICU_VERSION'),(500,'IDENTIFIED'),(58,'IF'),(485,'IGNORE'),(557,'IGNORE_SERVER_IDS'),(382,'IMPORT'),(97,'IN'),(43,'INDEX'),(704,'INDEXES'),(493,'INFILE'),(415,'INITIAL_SIZE'),(230,'INLINE'),(521,'INNER'),(346,'INNODB'),(82,'INSERT'),(383,'INSERT_METHOD'),(689,'INSTALL'),(347,'INSTANCE'),(10,'INT1'),(13,'INT2'),(14,'INT3'),(16,'INT4'),(18,'INT8'),(17,'INTEGER'),(292,'INTERNAL_AUTO_INCREMENT'),(293,'INTERNAL_AVG_ROW_LENGTH'),(295,'INTERNAL_CHECKSUM'),(294,'INTERNAL_CHECK_TIME'),(296,'INTERNAL_DATA_FREE'),(297,'INTERNAL_DATA_LENGTH'),(298,'INTERNAL_DD_CHAR_LENGTH'),(299,'INTERNAL_GET_COMMENT_OR_ERROR'),(300,'INTERNAL_GET_ENABLED_ROLE_JSON'),(301,'INTERNAL_GET_HOSTNAME'),(302,'INTERNAL_GET_USERNAME'),(303,'INTERNAL_GET_VIEW_WARNING_OR_ERROR'),(304,'INTERNAL_INDEX_COLUMN_CARDINALITY'),(305,'INTERNAL_INDEX_LENGTH'),(306,'INTERNAL_IS_ENABLED_ROLE'),(307,'INTERNAL_IS_MANDATORY_ROLE'),(308,'INTERNAL_KEYS_DISABLED'),(309,'INTERNAL_MAX_DATA_LENGTH'),(310,'INTERNAL_TABLE_ROWS'),(311,'INTERNAL_UPDATE_TIME'),(75,'INTERVAL'),(486,'INTO'),(384,'INVISIBLE'),(594,'IO_THREAD'),(49,'IS'),(543,'ISOLATION'),(644,'ISSUER'),(316,'IS_UUID'),(312,'IS_VISIBLE_DD_OBJECT'),(605,'ITERATE'),(507,'JOIN'),(106,'JSON'),(220,'JSON_ARRAY'),(266,'JSON_ARRAYAGG'),(238,'JSON_ARRAY_APPEND'),(239,'JSON_ARRAY_INSERT'),(223,'JSON_CONTAINS'),(224,'JSON_CONTAINS_PATH'),(248,'JSON_DEPTH'),(225,'JSON_EXTRACT'),(240,'JSON_INSERT'),(232,'JSON_KEYS'),(249,'JSON_LENGTH'),(241,'JSON_MERGE'),(242,'JSON_MERGE_PATCH'),(243,'JSON_MERGE_PRESERVE'),(221,'JSON_OBJECT'),(267,'JSON_OBJECTAGG'),(233,'JSON_OVERLAPS'),(255,'JSON_PRETTY'),(222,'JSON_QUOTE'),(244,'JSON_REMOVE'),(245,'JSON_REPLACE'),(253,'JSON_SCHEMA_VALID'),(254,'JSON_SCHEMA_VALIDATION_REPORT'),(234,'JSON_SEARCH'),(246,'JSON_SET'),(256,'JSON_STORAGE_FREE'),(257,'JSON_STORAGE_SIZE'),(252,'JSON_TABLE'),(250,'JSON_TYPE'),(247,'JSON_UNQUOTE'),(251,'JSON_VALID'),(235,'JSON_VALUE'),(44,'KEY'),(385,'KEYS'),(386,'KEY_BLOCK_SIZE'),(728,'KILL'),(273,'LAG'),(478,'LAST'),(274,'LAST_VALUE'),(275,'LEAD'),(87,'LEADING'),(606,'LEAVE'),(729,'LEAVES'),(522,'LEFT'),(544,'LEVEL'),(83,'LIKE'),(471,'LIMIT'),(494,'LINES'),(151,'LINESTRING'),(495,'LOAD'),(496,'LOCAL'),(387,'LOCK'),(354,'LOGFILE'),(553,'LOGS'),(38,'LONG'),(39,'LONGBINARY'),(607,'LOOP'),(472,'LOW_PRIORITY'),(348,'MASTER'),(558,'MASTER_AUTO_POSITION'),(559,'MASTER_BIND'),(560,'MASTER_COMPRESSION_ALGORITHMS'),(561,'MASTER_CONNECT_RETRY'),(562,'MASTER_HEARTBEAT_PERIOD'),(563,'MASTER_HOST'),(564,'MASTER_LOG_FILE'),(565,'MASTER_LOG_POS'),(566,'MASTER_PASSWORD'),(567,'MASTER_PORT'),(568,'MASTER_RETRY_COUNT'),(569,'MASTER_SSL'),(570,'MASTER_SSL_CA'),(571,'MASTER_SSL_CERT'),(572,'MASTER_SSL_CIPHER'),(573,'MASTER_SSL_CRL'),(574,'MASTER_SSL_CRLPATH'),(575,'MASTER_SSL_KEY'),(576,'MASTER_SSL_VERIFY_SERVER_CERT'),(577,'MASTER_TLS_CIPHERSUITES'),(578,'MASTER_TLS_VERSION'),(579,'MASTER_USER'),(580,'MASTER_ZSTD_COMPRESSION_LEVEL'),(98,'MATCH'),(645,'MAX_CONNECTIONS_PER_HOUR'),(646,'MAX_QUERIES_PER_HOUR'),(388,'MAX_ROWS'),(465,'MAX_SIZE'),(647,'MAX_UPDATES_PER_HOUR'),(648,'MAX_USER_CONNECTIONS'),(203,'MBRCONTAINS'),(204,'MBRDISJOINT'),(205,'MBRINTERSECTS'),(206,'MBROVERLAPS'),(207,'MBRTOUCHES'),(208,'MBRWITHIN'),(681,'MEDIUM'),(236,'MEMBER'),(508,'MEMORY'),(450,'MERGE'),(626,'MESSAGE_TEXT'),(15,'MIDDLEINT'),(76,'MINUTE'),(77,'MINUTE_SECOND'),(389,'MIN_ROWS'),(61,'MOD'),(99,'MODE'),(390,'MODIFY'),(78,'MONTH'),(451,'MRG_MYISAM'),(152,'MULTILINESTRING'),(153,'MULTIPOINT'),(154,'MULTIPOLYGON'),(705,'MUTEX'),(452,'MYISAM'),(627,'MYSQL_ERRNO'),(434,'NAME'),(697,'NAMES'),(31,'NATIONAL'),(523,'NATURAL'),(32,'NCHAR'),(453,'NDB'),(454,'NDBCLUSTER'),(649,'NEVER'),(479,'NEXT'),(349,'NO'),(466,'NODEGROUP'),(650,'NONE'),(50,'NOT'),(679,'NO_WRITE_TO_BINLOG'),(276,'NTH_VALUE'),(277,'NTILE'),(51,'NULL'),(628,'NUMBER'),(21,'NUMERIC'),(35,'NVARCHAR'),(237,'OF'),(509,'OFFSET'),(651,'OLD'),(336,'ON'),(324,'ONLY'),(480,'OPEN'),(391,'OPTIMIZE'),(724,'OPTIMIZER_COSTS'),(667,'OPTION'),(652,'OPTIONAL'),(497,'OPTIONALLY'),(356,'OPTIONS'),(52,'OR'),(264,'ORDER'),(435,'ORGANIZATION'),(524,'OUTER'),(510,'OUTFILE'),(427,'OWNER'),(392,'PACK_KEYS'),(393,'PARSER'),(455,'PARTIAL'),(394,'PARTITION'),(395,'PARTITIONING'),(396,'PASSWORD'),(653,'PASSWORD_LOCK_TIME'),(231,'PATH)'),(278,'PERCENT_RANK'),(693,'PERSIST'),(694,'PERSIST_ONLY'),(690,'PLUGIN'),(716,'PLUGINS'),(595,'PLUGIN_DIR'),(155,'POINT'),(156,'POLYGON'),(428,'PORT'),(64,'POW'),(65,'POWER'),(25,'PRECISION'),(549,'PREPARE'),(337,'PRESERVE'),(481,'PREV'),(397,'PRIMARY'),(668,'PRIVILEGES'),(581,'PRIVILEGE_CHECKS_USER'),(355,'PROCEDURE'),(669,'PROCESS'),(706,'PROCESSLIST'),(717,'PROFILE'),(718,'PROFILES'),(673,'PROXY'),(283,'PS_CURRENT_THREAD_ID'),(284,'PS_THREAD_ID'),(554,'PURGE'),(100,'QUERY'),(473,'QUICK'),(654,'RANDOM'),(110,'RANDOM_BYTES'),(279,'RANK'),(325,'READ'),(26,'REAL'),(398,'REBUILD'),(550,'RECOVER'),(456,'REDUNDANT'),(436,'REFERENCE'),(457,'REFERENCES'),(91,'REGEXP_INSTR'),(92,'REGEXP_LIKE'),(93,'REGEXP_REPLACE'),(94,'REGEXP_SUBSTR'),(725,'RELAY'),(719,'RELAYLOG'),(582,'RELAY_LOG_FILE'),(583,'RELAY_LOG_POS'),(531,'RELEASE'),(350,'RELOAD'),(399,'REMOVE'),(338,'RENAME'),(400,'REORGANIZE'),(401,'REPAIR'),(608,'REPEAT'),(545,'REPEATABLE'),(437,'REPLACE'),(585,'REPLICATE_DO_DB'),(586,'REPLICATE_DO_TABLE'),(587,'REPLICATE_IGNORE_DB'),(588,'REPLICATE_IGNORE_TABLE'),(589,'REPLICATE_REWRITE_DB'),(590,'REPLICATE_WILD_DO_TABLE'),(591,'REPLICATE_WILD_IGNORE_TABLE'),(592,'REPLICATION'),(655,'REQUIRE'),(555,'RESET'),(634,'RESIGNAL'),(676,'RESOURCE'),(730,'RESTART'),(460,'RESTRICT'),(656,'RETAIN'),(610,'RETURN'),(629,'RETURNED_SQLSTATE'),(685,'RETURNS'),(657,'REUSE'),(674,'REVOKE'),(525,'RIGHT'),(90,'RLIKE'),(658,'ROLE'),(118,'ROLES_GRAPHML'),(351,'ROLLBACK'),(487,'ROW'),(501,'ROWS'),(630,'ROW_COUNT'),(402,'ROW_FORMAT'),(280,'ROW_NUMBER'),(537,'SAVEPOINT'),(339,'SCHEDULE'),(326,'SCHEMA'),(707,'SCHEMAS'),(631,'SCHEMA_NAME'),(79,'SECOND'),(488,'SELECT'),(265,'SEPARATOR'),(3,'SERIAL'),(546,'SERIALIZABLE'),(357,'SERVER'),(547,'SESSION'),(327,'SET'),(111,'SHA'),(112,'SHA1'),(113,'SHA2'),(511,'SHARE'),(708,'SHOW'),(670,'SHUTDOWN'),(636,'SIGNAL'),(107,'SIGNED'),(340,'SLAVE'),(726,'SLOW'),(532,'SNAPSHOT'),(429,'SOCKET'),(686,'SONAME'),(84,'SOUNDS'),(403,'SPATIAL'),(635,'SQLSTATE'),(596,'SQL_AFTER_GTIDS'),(597,'SQL_AFTER_MTS_GAPS'),(598,'SQL_BEFORE_GTIDS'),(512,'SQL_BIG_RESULT'),(513,'SQL_BUFFER_RESULT'),(514,'SQL_CALC_FOUND_ROWS'),(556,'SQL_LOG_BIN'),(515,'SQL_NO_CACHE'),(516,'SQL_SMALL_RESULT'),(599,'SQL_THREAD'),(659,'SSL'),(533,'START'),(498,'STARTING'),(424,'STARTS'),(114,'STATEMENT_DIGEST'),(115,'STATEMENT_DIGEST_TEXT'),(404,'STATS_AUTO_RECALC'),(405,'STATS_PERSISTENT'),(406,'STATS_SAMPLE_PAGES'),(709,'STATUS'),(268,'STD'),(269,'STDDEV'),(600,'STOP'),(714,'STORAGE'),(458,'STORED'),(517,'STRAIGHT_JOIN'),(687,'STRING'),(178,'ST_AREA'),(157,'ST_ASBINARY'),(213,'ST_ASGEOJSON'),(159,'ST_ASTEXT'),(158,'ST_ASWKB'),(160,'ST_ASWKT'),(186,'ST_BUFFER'),(187,'ST_BUFFER_STRATEGY'),(179,'ST_CENTROID'),(194,'ST_CONTAINS'),(188,'ST_CONVEXHULL'),(195,'ST_CROSSES'),(189,'ST_DIFFERENCE'),(162,'ST_DIMENSION'),(196,'ST_DISJOINT'),(197,'ST_DISTANCE'),(215,'ST_DISTANCE_SPHERE'),(172,'ST_ENDPOINT'),(163,'ST_ENVELOPE'),(198,'ST_EQUALS'),(180,'ST_EXTERIORRING'),(209,'ST_GEOHASH'),(119,'ST_GEOMCOLLFROMTEXT'),(134,'ST_GEOMCOLLFROMWKB'),(120,'ST_GEOMETRYCOLLECTIONFROMTEXT'),(135,'ST_GEOMETRYCOLLECTIONFROMWKB'),(121,'ST_GEOMETRYFROMTEXT'),(136,'ST_GEOMETRYFROMWKB'),(184,'ST_GEOMETRYN'),(164,'ST_GEOMETRYTYPE'),(214,'ST_GEOMFROMGEOJSON'),(122,'ST_GEOMFROMTEXT'),(137,'ST_GEOMFROMWKB'),(181,'ST_INTERIORRINGN'),(190,'ST_INTERSECTION'),(199,'ST_INTERSECTS'),(173,'ST_ISCLOSED'),(165,'ST_ISEMPTY'),(166,'ST_ISSIMPLE'),(216,'ST_ISVALID'),(210,'ST_LATFROMGEOHASH'),(168,'ST_LATITUDE'),(174,'ST_LENGTH'),(123,'ST_LINEFROMTEXT'),(138,'ST_LINEFROMWKB'),(124,'ST_LINESTRINGFROMTEXT'),(139,'ST_LINESTRINGFROMWKB'),(211,'ST_LONGFROMGEOHASH'),(169,'ST_LONGITUDE'),(217,'ST_MAKEENVELOPE'),(125,'ST_MLINEFROMTEXT'),(140,'ST_MLINEFROMWKB'),(127,'ST_MPOINTFROMTEXT'),(142,'ST_MPOINTFROMWKB'),(129,'ST_MPOLYFROMTEXT'),(144,'ST_MPOLYFROMWKB'),(126,'ST_MULTILINESTRINGFROMTEXT'),(141,'ST_MULTILINESTRINGFROMWKB'),(128,'ST_MULTIPOINTFROMTEXT'),(143,'ST_MULTIPOINTFROMWKB'),(130,'ST_MULTIPOLYGONFROMTEXT'),(145,'ST_MULTIPOLYGONFROMWKB'),(185,'ST_NUMGEOMETRIES'),(182,'ST_NUMINTERIORRING'),(183,'ST_NUMINTERIORRINGS'),(175,'ST_NUMPOINTS'),(200,'ST_OVERLAPS'),(212,'ST_POINTFROMGEOHASH'),(131,'ST_POINTFROMTEXT'),(146,'ST_POINTFROMWKB'),(176,'ST_POINTN'),(132,'ST_POLYFROMTEXT'),(147,'ST_POLYFROMWKB'),(133,'ST_POLYGONFROMTEXT'),(148,'ST_POLYGONFROMWKB'),(218,'ST_SIMPLIFY'),(167,'ST_SRID'),(177,'ST_STARTPOINT'),(161,'ST_SWAPXY'),(191,'ST_SYMDIFFERENCE'),(201,'ST_TOUCHES'),(192,'ST_TRANSFORM'),(193,'ST_UNION'),(219,'ST_VALIDATE'),(202,'ST_WITHIN'),(170,'ST_X'),(171,'ST_Y'),(632,'SUBCLASS_ORIGIN'),(660,'SUBJECT'),(671,'SUPER'),(438,'SYSTEM'),(45,'TABLE'),(540,'TABLES'),(407,'TABLESPACE'),(633,'TABLE_NAME'),(469,'TEMPORARY'),(499,'TERMINATED'),(56,'THEN'),(677,'THREAD_PRIORITY'),(29,'TIME'),(28,'TIMESTAMP'),(352,'TLS'),(416,'TO'),(734,'TRADITIONAL'),(88,'TRAILING'),(534,'TRANSACTION'),(735,'TREE'),(468,'TRIGGER'),(710,'TRIGGERS'),(7,'TRUE'),(408,'TRUNCATE'),(409,'TYPE'),(661,'UNBOUNDED'),(548,'UNCOMMITTED'),(417,'UNDO'),(691,'UNINSTALL'),(410,'UNION'),(411,'UNIQUE'),(539,'UNLOCK'),(11,'UNSIGNED'),(609,'UNTIL'),(461,'UPDATE'),(412,'UPGRADE'),(672,'USAGE'),(467,'USE'),(430,'USER'),(727,'USER_RESOURCES'),(683,'USE_FRM'),(474,'USING'),(317,'UUID'),(318,'UUID_SHORT'),(319,'UUID_TO_BIN'),(4,'VALUE'),(320,'VALUES'),(36,'VARCHARACTER'),(695,'VARIABLE'),(711,'VARIABLES'),(37,'VARYING'),(678,'VCPU'),(419,'VIEW'),(459,'VIRTUAL'),(413,'VISIBLE'),(418,'WAIT'),(712,'WARNINGS'),(57,'WHEN'),(475,'WHERE'),(611,'WHILE'),(101,'WITH'),(535,'WORK'),(431,'WRAPPER'),(536,'WRITE'),(662,'X509'),(551,'XA'),(80,'YEAR'),(81,'YEAR_MONTH'),(12,'ZEROFILL');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int unsigned NOT NULL,
  `help_keyword_id` int unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` VALUES (0,0),(1,1),(2,2),(494,2),(495,2),(502,2),(505,2),(506,2),(514,2),(515,2),(538,2),(543,2),(577,2),(595,2),(597,2),(603,2),(605,2),(2,3),(514,3),(2,4),(538,4),(543,4),(593,4),(594,4),(3,5),(683,5),(4,6),(5,6),(4,7),(5,7),(7,8),(8,8),(7,9),(231,9),(7,10),(7,11),(11,11),(13,11),(14,11),(16,11),(17,11),(234,11),(7,12),(11,12),(13,12),(14,12),(16,12),(17,12),(9,13),(10,14),(10,15),(11,16),(11,17),(234,17),(615,17),(13,18),(14,19),(14,20),(514,20),(14,21),(15,22),(234,22),(615,22),(16,23),(17,24),(17,25),(17,26),(615,26),(19,27),(120,27),(122,27),(234,27),(21,28),(156,28),(22,29),(154,29),(234,29),(24,30),(26,30),(494,30),(495,30),(502,30),(505,30),(506,30),(514,30),(541,30),(542,30),(544,30),(623,30),(624,30),(626,30),(630,30),(24,31),(26,31),(24,32),(25,33),(25,34),(234,34),(26,35),(26,36),(26,37),(35,38),(35,39),(44,40),(502,40),(503,40),(516,40),(44,41),(494,41),(495,41),(496,41),(497,41),(498,41),(499,41),(500,41),(501,41),(502,41),(503,41),(504,41),(595,41),(600,41),(606,41),(44,42),(505,42),(506,42),(507,42),(508,42),(509,42),(510,42),(511,42),(512,42),(513,42),(514,42),(516,42),(517,42),(518,42),(596,42),(597,42),(607,42),(615,42),(626,42),(634,42),(635,42),(636,42),(637,42),(638,42),(639,42),(641,42),(44,43),(502,43),(508,43),(514,43),(522,43),(546,43),(626,43),(652,43),(672,43),(675,43),(44,44),(502,44),(514,44),(515,44),(538,44),(44,45),(502,45),(514,45),(527,45),(531,45),(532,45),(537,45),(539,45),(548,45),(610,45),(611,45),(612,45),(613,45),(614,45),(626,45),(639,45),(666,45),(47,46),(52,47),(66,47),(52,48),(59,49),(60,49),(61,49),(62,49),(60,50),(62,50),(65,50),(505,50),(506,50),(507,50),(513,50),(596,50),(597,50),(61,51),(62,51),(515,51),(67,52),(513,52),(71,53),(578,53),(71,54),(578,54),(71,55),(561,55),(575,55),(578,55),(579,55),(582,55),(583,55),(585,55),(71,56),(578,56),(579,56),(71,57),(578,57),(72,58),(505,58),(506,58),(507,58),(513,58),(519,58),(520,58),(521,58),(525,58),(526,58),(527,58),(530,58),(579,58),(595,58),(596,58),(597,58),(598,58),(599,58),(677,58),(80,59),(80,60),(81,61),(100,61),(87,62),(88,63),(102,64),(103,65),(122,66),(122,67),(122,68),(595,68),(597,68),(122,69),(122,70),(122,71),(122,72),(122,73),(122,74),(122,75),(507,75),(595,75),(597,75),(122,76),(122,77),(122,78),(122,79),(122,80),(122,81),(187,82),(538,82),(539,82),(540,82),(211,83),(626,83),(632,83),(633,83),(211,84),(217,85),(217,86),(534,86),(537,86),(544,86),(626,86),(629,86),(632,86),(633,86),(652,86),(662,86),(217,87),(217,88),(222,89),(226,90),(227,91),(228,92),(229,93),(230,94),(231,95),(231,96),(231,97),(544,97),(629,97),(632,97),(633,97),(652,97),(662,97),(231,98),(231,99),(544,99),(231,100),(674,100),(231,101),(502,101),(508,101),(514,101),(595,101),(597,101),(600,101),(673,101),(233,102),(233,103),(234,103),(234,104),(562,104),(563,104),(627,104),(628,104),(673,104),(234,105),(234,106),(680,106),(681,106),(682,106),(234,107),(244,108),(245,109),(248,110),(249,111),(249,112),(250,113),(251,114),(252,115),(266,116),(270,117),(272,118),(279,119),(279,120),(280,121),(280,122),(281,123),(281,124),(282,125),(282,126),(283,127),(283,128),(284,129),(284,130),(285,131),(286,132),(286,133),(287,134),(287,135),(288,136),(288,137),(289,138),(289,139),(290,140),(290,141),(291,142),(291,143),(292,144),(292,145),(293,146),(294,147),(294,148),(295,149),(296,150),(297,151),(298,152),(299,153),(300,154),(301,155),(302,156),(303,157),(303,158),(304,159),(304,160),(305,161),(306,162),(307,163),(308,164),(309,165),(310,166),(311,167),(312,168),(313,169),(314,170),(315,171),(316,172),(317,173),(318,174),(319,175),(320,176),(321,177),(322,178),(323,179),(324,180),(325,181),(326,182),(326,183),(327,184),(328,185),(329,186),(330,187),(331,188),(332,189),(333,190),(334,191),(335,192),(336,193),(337,194),(338,195),(339,196),(340,197),(341,198),(342,199),(343,200),(344,201),(345,202),(346,203),(349,204),(351,205),(352,206),(353,207),(354,208),(355,209),(356,210),(357,211),(358,212),(359,213),(360,214),(361,215),(362,216),(363,217),(364,218),(365,219),(366,220),(367,221),(368,222),(369,223),(370,224),(371,225),(372,226),(373,226),(372,227),(372,228),(373,229),(373,230),(373,231),(374,232),(375,233),(376,234),(377,235),(378,236),(378,237),(379,238),(380,239),(381,240),(382,241),(383,242),(384,243),(385,244),(386,245),(387,246),(388,247),(389,248),(390,249),(391,250),(392,251),(393,252),(394,253),(395,254),(396,255),(397,256),(398,257),(410,258),(412,259),(417,259),(418,259),(421,259),(422,259),(427,259),(544,259),(547,259),(417,260),(647,260),(670,260),(418,261),(544,261),(418,262),(502,262),(514,262),(534,262),(541,262),(542,262),(544,262),(549,262),(595,262),(597,262),(418,263),(544,263),(680,263),(681,263),(682,263),(418,264),(502,264),(534,264),(544,264),(548,264),(549,264),(550,264),(418,265),(419,266),(420,267),(423,268),(424,269),(431,270),(432,271),(433,272),(434,273),(435,274),(436,275),(437,276),(438,277),(439,278),(440,279),(441,280),(442,281),(443,282),(444,283),(445,284),(446,285),(447,286),(448,287),(449,288),(450,289),(451,290),(452,291),(453,292),(454,293),(455,294),(456,295),(457,296),(458,297),(459,298),(460,299),(461,300),(462,301),(463,302),(464,303),(465,304),(466,305),(467,306),(468,307),(469,308),(470,309),(471,310),(472,311),(473,312),(474,313),(475,314),(477,315),(486,316),(490,317),(491,318),(492,319),(493,320),(538,320),(543,320),(550,320),(494,321),(495,321),(502,321),(505,321),(506,321),(514,321),(494,322),(495,322),(505,322),(506,322),(512,322),(519,322),(520,322),(626,322),(634,322),(635,322),(494,323),(495,323),(502,323),(505,323),(506,323),(514,323),(494,324),(495,324),(551,324),(552,324),(553,324),(554,324),(560,324),(561,324),(494,325),(495,325),(536,325),(551,325),(552,325),(553,325),(554,325),(559,325),(560,325),(561,325),(673,325),(494,326),(495,326),(505,326),(506,326),(519,326),(520,326),(626,326),(634,326),(635,326),(494,327),(495,327),(502,327),(505,327),(506,327),(514,327),(515,327),(538,327),(541,327),(542,327),(543,327),(544,327),(549,327),(551,327),(552,327),(553,327),(554,327),(565,327),(593,327),(594,327),(603,327),(604,327),(605,327),(609,327),(622,327),(623,327),(624,327),(625,327),(626,327),(630,327),(496,328),(502,328),(507,328),(508,328),(514,328),(516,328),(595,328),(597,328),(496,329),(507,329),(496,330),(507,330),(496,331),(507,331),(496,332),(502,332),(507,332),(606,332),(607,332),(496,333),(507,333),(535,333),(585,333),(496,334),(502,334),(507,334),(606,334),(607,334),(496,335),(507,335),(521,335),(636,335),(496,336),(498,336),(507,336),(515,336),(546,336),(496,337),(507,337),(496,338),(502,338),(503,338),(531,338),(601,338),(496,339),(507,339),(496,340),(507,340),(568,340),(569,340),(570,340),(663,340),(664,340),(676,340),(497,341),(510,341),(511,341),(523,341),(524,341),(615,341),(616,341),(626,341),(637,341),(649,341),(650,341),(498,342),(629,342),(671,342),(498,343),(566,343),(568,343),(569,343),(570,343),(662,343),(664,343),(673,343),(498,344),(673,344),(498,345),(544,345),(566,345),(568,345),(569,345),(570,345),(587,345),(590,345),(591,345),(604,345),(609,345),(626,345),(662,345),(664,345),(673,345),(680,345),(681,345),(682,345),(498,346),(514,346),(626,346),(498,347),(558,347),(498,348),(562,348),(563,348),(564,348),(566,348),(627,348),(628,348),(653,348),(676,348),(498,349),(514,349),(515,349),(498,350),(600,350),(498,351),(551,351),(552,351),(553,351),(554,351),(555,351),(556,351),(557,351),(561,351),(498,352),(499,353),(509,353),(516,353),(544,353),(606,353),(607,353),(608,353),(609,353),(499,354),(509,354),(516,354),(500,355),(510,355),(511,355),(523,355),(524,355),(626,355),(638,355),(657,355),(658,355),(501,356),(512,356),(501,357),(512,357),(525,357),(502,358),(502,359),(502,360),(610,360),(680,360),(681,360),(682,360),(502,361),(502,362),(514,362),(502,363),(566,363),(567,363),(502,364),(514,364),(611,364),(502,365),(514,365),(612,365),(502,366),(502,367),(502,368),(514,368),(541,368),(626,368),(632,368),(633,368),(502,369),(514,369),(502,370),(514,370),(674,370),(680,370),(681,370),(682,370),(502,371),(514,371),(502,372),(512,372),(514,372),(541,372),(502,373),(514,373),(502,374),(514,374),(502,375),(595,375),(502,376),(503,376),(519,376),(520,376),(521,376),(522,376),(523,376),(524,376),(525,376),(526,376),(527,376),(528,376),(529,376),(530,376),(573,376),(574,376),(598,376),(599,376),(608,376),(616,376),(502,377),(503,377),(514,377),(516,377),(528,377),(626,377),(645,377),(673,377),(502,378),(502,379),(514,379),(536,379),(502,380),(512,380),(514,380),(515,380),(502,381),(508,381),(514,381),(502,382),(537,382),(541,382),(502,383),(514,383),(502,384),(508,384),(514,384),(502,385),(626,385),(652,385),(502,386),(514,386),(502,387),(544,387),(558,387),(559,387),(595,387),(597,387),(673,387),(502,388),(514,388),(502,389),(514,389),(502,390),(502,391),(613,391),(502,392),(514,392),(502,393),(508,393),(514,393),(502,394),(514,394),(534,394),(538,394),(541,394),(543,394),(544,394),(546,394),(672,394),(675,394),(502,395),(502,396),(512,396),(569,396),(595,396),(597,396),(604,396),(502,397),(502,398),(502,399),(502,400),(502,401),(614,401),(502,402),(514,402),(502,403),(508,403),(513,403),(526,403),(502,404),(514,404),(502,405),(514,405),(502,406),(514,406),(502,407),(503,407),(516,407),(528,407),(502,408),(532,408),(502,409),(607,409),(502,410),(547,410),(502,411),(502,412),(611,412),(502,413),(508,413),(514,413),(503,414),(516,414),(503,415),(516,415),(503,416),(555,416),(556,416),(557,416),(562,416),(563,416),(566,416),(604,416),(503,417),(516,417),(528,417),(591,417),(503,418),(516,418),(504,419),(518,419),(530,419),(505,420),(506,420),(507,420),(513,420),(519,420),(520,420),(521,420),(525,420),(526,420),(527,420),(530,420),(595,420),(596,420),(597,420),(598,420),(599,420),(677,420),(507,421),(507,422),(507,423),(507,424),(508,425),(512,426),(512,427),(512,428),(512,429),(512,430),(569,430),(595,430),(597,430),(599,430),(601,430),(607,430),(641,430),(512,431),(513,432),(513,433),(513,434),(513,435),(513,436),(526,436),(513,437),(541,437),(542,437),(543,437),(595,437),(604,437),(513,438),(526,438),(607,438),(514,439),(515,439),(514,440),(514,441),(515,441),(527,441),(530,441),(514,442),(514,443),(514,444),(541,444),(514,445),(515,445),(534,445),(514,446),(514,447),(514,448),(626,448),(632,448),(633,448),(659,448),(667,448),(514,449),(514,450),(514,451),(514,452),(514,453),(514,454),(514,455),(514,456),(514,457),(515,457),(600,457),(514,458),(514,459),(515,460),(527,460),(530,460),(515,461),(538,461),(544,461),(549,461),(516,462),(516,463),(516,464),(516,465),(516,466),(516,467),(546,467),(684,467),(517,468),(529,468),(626,468),(527,469),(533,470),(534,471),(536,471),(544,471),(548,471),(549,471),(550,471),(629,471),(662,471),(534,472),(538,472),(541,472),(542,472),(543,472),(549,472),(559,472),(534,473),(611,473),(614,473),(534,474),(546,474),(572,474),(651,474),(534,475),(536,475),(549,475),(632,475),(633,475),(652,475),(536,476),(586,476),(536,477),(591,477),(536,478),(536,479),(536,480),(589,480),(626,480),(654,480),(536,481),(538,482),(540,482),(543,482),(538,483),(538,484),(544,484),(538,485),(541,485),(542,485),(544,485),(546,485),(549,485),(675,485),(538,486),(543,486),(544,486),(675,486),(538,487),(550,487),(538,488),(539,488),(543,488),(544,488),(680,488),(681,488),(682,488),(541,489),(542,489),(541,490),(541,491),(541,492),(626,492),(632,492),(633,492),(541,493),(542,493),(541,494),(542,494),(541,495),(675,495),(541,496),(542,496),(559,496),(610,496),(613,496),(614,496),(673,496),(541,497),(541,498),(541,499),(542,500),(595,500),(597,500),(542,501),(544,502),(547,502),(568,502),(595,502),(600,502),(602,502),(603,502),(605,502),(672,502),(675,502),(544,503),(546,503),(559,503),(595,503),(597,503),(600,503),(544,504),(544,505),(544,506),(544,507),(546,507),(544,508),(544,509),(544,510),(544,511),(544,512),(544,513),(544,514),(544,515),(544,516),(544,517),(546,517),(545,518),(546,519),(546,520),(606,520),(608,520),(546,521),(546,522),(546,523),(546,524),(546,525),(551,526),(552,526),(553,526),(554,526),(551,527),(552,527),(553,527),(554,527),(561,527),(575,527),(551,528),(552,528),(553,528),(554,528),(551,529),(552,529),(553,529),(554,529),(561,529),(551,530),(552,530),(553,530),(554,530),(561,530),(551,531),(552,531),(553,531),(554,531),(555,531),(556,531),(557,531),(561,531),(551,532),(552,532),(553,532),(554,532),(561,532),(551,533),(552,533),(553,533),(554,533),(561,533),(569,533),(551,534),(552,534),(553,534),(554,534),(560,534),(551,535),(552,535),(553,535),(554,535),(551,536),(552,536),(553,536),(554,536),(559,536),(560,536),(561,536),(555,537),(556,537),(557,537),(558,538),(558,539),(559,539),(595,539),(597,539),(559,540),(626,540),(654,540),(667,540),(673,540),(560,541),(560,542),(622,542),(665,542),(669,542),(560,543),(560,544),(560,545),(560,546),(560,547),(622,547),(665,547),(669,547),(560,548),(561,549),(571,549),(573,549),(574,549),(561,550),(561,551),(562,552),(563,552),(562,553),(563,553),(626,553),(627,553),(628,553),(673,553),(562,554),(563,554),(564,555),(568,555),(676,555),(677,555),(565,556),(566,557),(566,558),(566,559),(566,560),(566,561),(566,562),(566,563),(566,564),(566,565),(566,566),(566,567),(566,568),(566,569),(566,570),(566,571),(566,572),(566,573),(566,574),(566,575),(566,576),(566,577),(566,578),(566,579),(566,580),(566,581),(566,582),(566,583),(567,584),(567,585),(567,586),(567,587),(567,588),(567,589),(567,590),(567,591),(567,592),(600,592),(569,593),(569,594),(570,594),(569,595),(569,596),(569,597),(569,598),(569,599),(570,599),(570,600),(572,601),(600,601),(573,602),(574,602),(577,603),(587,603),(590,603),(591,603),(579,604),(580,605),(581,606),(582,607),(583,608),(583,609),(584,610),(585,611),(587,612),(588,613),(590,614),(591,615),(591,616),(592,617),(593,617),(594,617),(592,618),(593,618),(594,618),(592,619),(593,619),(594,619),(592,620),(593,620),(594,620),(592,621),(593,621),(594,621),(592,622),(593,622),(594,622),(592,623),(593,623),(594,623),(592,624),(592,625),(592,626),(593,626),(594,626),(592,627),(593,627),(594,627),(592,628),(592,629),(592,630),(592,631),(593,631),(594,631),(592,632),(593,632),(594,632),(592,633),(593,633),(594,633),(593,634),(593,635),(594,635),(594,636),(595,637),(597,637),(595,638),(597,638),(595,639),(597,639),(595,640),(597,640),(604,640),(595,641),(597,641),(595,642),(597,642),(595,643),(597,643),(595,644),(597,644),(595,645),(597,645),(595,646),(597,646),(595,647),(597,647),(595,648),(597,648),(595,649),(597,649),(595,650),(600,650),(603,650),(605,650),(595,651),(595,652),(597,652),(595,653),(597,653),(595,654),(597,654),(604,654),(595,655),(597,655),(595,656),(604,656),(595,657),(597,657),(595,658),(596,658),(597,658),(598,658),(600,658),(603,658),(605,658),(595,659),(597,659),(595,660),(597,660),(595,661),(597,661),(595,662),(597,662),(600,663),(600,664),(600,665),(600,666),(602,666),(600,667),(602,667),(600,668),(602,668),(656,668),(673,668),(600,669),(600,670),(679,670),(600,671),(600,672),(602,673),(602,674),(605,675),(606,676),(607,676),(608,676),(609,676),(606,677),(607,677),(606,678),(607,678),(610,679),(613,679),(614,679),(673,679),(611,680),(611,681),(614,682),(632,682),(633,682),(652,682),(667,682),(614,683),(615,684),(615,685),(615,686),(615,687),(617,688),(619,688),(617,689),(618,689),(618,690),(620,690),(626,690),(619,691),(620,691),(621,692),(622,693),(677,693),(622,694),(622,695),(623,696),(624,696),(625,697),(626,698),(631,698),(626,699),(643,699),(644,699),(626,700),(646,700),(626,701),(647,701),(626,702),(651,702),(626,703),(663,703),(673,703),(626,704),(626,705),(645,705),(626,706),(659,706),(626,707),(643,707),(644,707),(626,708),(627,708),(628,708),(629,708),(630,708),(631,708),(632,708),(633,708),(634,708),(635,708),(636,708),(637,708),(638,708),(639,708),(641,708),(643,708),(644,708),(645,708),(646,708),(647,708),(648,708),(649,708),(650,708),(651,708),(652,708),(653,708),(654,708),(655,708),(656,708),(657,708),(658,708),(659,708),(660,708),(661,708),(662,708),(663,708),(664,708),(665,708),(666,708),(667,708),(668,708),(669,708),(670,708),(626,709),(645,709),(650,709),(653,709),(658,709),(664,709),(665,709),(666,709),(673,709),(626,710),(668,710),(626,711),(669,711),(626,712),(670,712),(629,713),(648,713),(662,713),(646,714),(649,715),(657,715),(655,716),(660,717),(661,718),(662,719),(672,720),(675,720),(673,721),(673,722),(673,723),(673,724),(673,725),(673,726),(673,727),(674,728),(675,729),(678,730),(680,731),(681,731),(682,731),(680,732),(681,732),(682,732),(680,733),(681,733),(682,733),(680,734),(681,734),(682,734),(680,735),(681,735),(682,735);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `innodb_index_stats`
--

/*!40000 ALTER TABLE `innodb_index_stats` DISABLE KEYS */;
INSERT  IGNORE INTO `innodb_index_stats` VALUES ('joomla','exam_action_log_config','PRIMARY','2021-03-28 20:58:21','n_diff_pfx01',19,1,'id'),('joomla','exam_action_log_config','PRIMARY','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_action_log_config','PRIMARY','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('joomla','exam_action_logs','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'id'),('joomla','exam_action_logs','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_action_logs','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_action_logs','idx_extension_item_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'extension'),('joomla','exam_action_logs','idx_extension_item_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'extension,item_id'),('joomla','exam_action_logs','idx_extension_item_id','2021-03-28 20:58:19','n_diff_pfx03',0,1,'extension,item_id,id'),('joomla','exam_action_logs','idx_extension_item_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_action_logs','idx_extension_item_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_action_logs','idx_user_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'user_id'),('joomla','exam_action_logs','idx_user_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'user_id,id'),('joomla','exam_action_logs','idx_user_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_action_logs','idx_user_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_action_logs','idx_user_id_extension','2021-03-28 20:58:19','n_diff_pfx01',0,1,'user_id'),('joomla','exam_action_logs','idx_user_id_extension','2021-03-28 20:58:19','n_diff_pfx02',0,1,'user_id,extension'),('joomla','exam_action_logs','idx_user_id_extension','2021-03-28 20:58:19','n_diff_pfx03',0,1,'user_id,extension,id'),('joomla','exam_action_logs','idx_user_id_extension','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_action_logs','idx_user_id_extension','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_action_logs','idx_user_id_logdate','2021-03-28 20:58:19','n_diff_pfx01',0,1,'user_id'),('joomla','exam_action_logs','idx_user_id_logdate','2021-03-28 20:58:19','n_diff_pfx02',0,1,'user_id,log_date'),('joomla','exam_action_logs','idx_user_id_logdate','2021-03-28 20:58:19','n_diff_pfx03',0,1,'user_id,log_date,id'),('joomla','exam_action_logs','idx_user_id_logdate','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_action_logs','idx_user_id_logdate','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_action_logs_extensions','PRIMARY','2021-03-28 20:58:21','n_diff_pfx01',18,1,'id'),('joomla','exam_action_logs_extensions','PRIMARY','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_action_logs_extensions','PRIMARY','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('joomla','exam_action_logs_users','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'user_id'),('joomla','exam_action_logs_users','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_action_logs_users','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_action_logs_users','idx_notify','2021-03-28 20:58:19','n_diff_pfx01',0,1,'notify'),('joomla','exam_action_logs_users','idx_notify','2021-03-28 20:58:19','n_diff_pfx02',0,1,'notify,user_id'),('joomla','exam_action_logs_users','idx_notify','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_action_logs_users','idx_notify','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_assets','PRIMARY','2021-03-28 20:58:30','n_diff_pfx01',48,1,'id'),('joomla','exam_assets','PRIMARY','2021-03-28 20:58:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_assets','PRIMARY','2021-03-28 20:58:30','size',1,NULL,'Number of pages in the index'),('joomla','exam_assets','idx_asset_name','2021-03-28 20:58:30','n_diff_pfx01',48,1,'name'),('joomla','exam_assets','idx_asset_name','2021-03-28 20:58:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_assets','idx_asset_name','2021-03-28 20:58:30','size',1,NULL,'Number of pages in the index'),('joomla','exam_assets','idx_lft_rgt','2021-03-28 20:58:30','n_diff_pfx01',48,1,'lft'),('joomla','exam_assets','idx_lft_rgt','2021-03-28 20:58:30','n_diff_pfx02',48,1,'lft,rgt'),('joomla','exam_assets','idx_lft_rgt','2021-03-28 20:58:30','n_diff_pfx03',48,1,'lft,rgt,id'),('joomla','exam_assets','idx_lft_rgt','2021-03-28 20:58:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_assets','idx_lft_rgt','2021-03-28 20:58:30','size',1,NULL,'Number of pages in the index'),('joomla','exam_assets','idx_parent_id','2021-03-28 20:58:30','n_diff_pfx01',10,1,'parent_id'),('joomla','exam_assets','idx_parent_id','2021-03-28 20:58:30','n_diff_pfx02',48,1,'parent_id,id'),('joomla','exam_assets','idx_parent_id','2021-03-28 20:58:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_assets','idx_parent_id','2021-03-28 20:58:30','size',1,NULL,'Number of pages in the index'),('joomla','exam_associations','PRIMARY','2021-03-28 20:58:16','n_diff_pfx01',0,1,'context'),('joomla','exam_associations','PRIMARY','2021-03-28 20:58:16','n_diff_pfx02',0,1,'context,id'),('joomla','exam_associations','PRIMARY','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_associations','PRIMARY','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_associations','idx_key','2021-03-28 20:58:16','n_diff_pfx01',0,1,'key'),('joomla','exam_associations','idx_key','2021-03-28 20:58:16','n_diff_pfx02',0,1,'key,context'),('joomla','exam_associations','idx_key','2021-03-28 20:58:16','n_diff_pfx03',0,1,'key,context,id'),('joomla','exam_associations','idx_key','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_associations','idx_key','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banner_clients','PRIMARY','2021-03-28 20:58:16','n_diff_pfx01',0,1,'id'),('joomla','exam_banner_clients','PRIMARY','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banner_clients','PRIMARY','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banner_clients','idx_metakey_prefix','2021-03-28 20:58:16','n_diff_pfx01',0,1,'metakey_prefix'),('joomla','exam_banner_clients','idx_metakey_prefix','2021-03-28 20:58:16','n_diff_pfx02',0,1,'metakey_prefix,id'),('joomla','exam_banner_clients','idx_metakey_prefix','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banner_clients','idx_metakey_prefix','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banner_clients','idx_own_prefix','2021-03-28 20:58:16','n_diff_pfx01',0,1,'own_prefix'),('joomla','exam_banner_clients','idx_own_prefix','2021-03-28 20:58:16','n_diff_pfx02',0,1,'own_prefix,id'),('joomla','exam_banner_clients','idx_own_prefix','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banner_clients','idx_own_prefix','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banner_tracks','PRIMARY','2021-03-28 20:58:16','n_diff_pfx01',0,1,'track_date'),('joomla','exam_banner_tracks','PRIMARY','2021-03-28 20:58:16','n_diff_pfx02',0,1,'track_date,track_type'),('joomla','exam_banner_tracks','PRIMARY','2021-03-28 20:58:16','n_diff_pfx03',0,1,'track_date,track_type,banner_id'),('joomla','exam_banner_tracks','PRIMARY','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banner_tracks','PRIMARY','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banner_tracks','idx_banner_id','2021-03-28 20:58:16','n_diff_pfx01',0,1,'banner_id'),('joomla','exam_banner_tracks','idx_banner_id','2021-03-28 20:58:16','n_diff_pfx02',0,1,'banner_id,track_date'),('joomla','exam_banner_tracks','idx_banner_id','2021-03-28 20:58:16','n_diff_pfx03',0,1,'banner_id,track_date,track_type'),('joomla','exam_banner_tracks','idx_banner_id','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banner_tracks','idx_banner_id','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banner_tracks','idx_track_date','2021-03-28 20:58:16','n_diff_pfx01',0,1,'track_date'),('joomla','exam_banner_tracks','idx_track_date','2021-03-28 20:58:16','n_diff_pfx02',0,1,'track_date,track_type'),('joomla','exam_banner_tracks','idx_track_date','2021-03-28 20:58:16','n_diff_pfx03',0,1,'track_date,track_type,banner_id'),('joomla','exam_banner_tracks','idx_track_date','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banner_tracks','idx_track_date','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banner_tracks','idx_track_type','2021-03-28 20:58:16','n_diff_pfx01',0,1,'track_type'),('joomla','exam_banner_tracks','idx_track_type','2021-03-28 20:58:16','n_diff_pfx02',0,1,'track_type,track_date'),('joomla','exam_banner_tracks','idx_track_type','2021-03-28 20:58:16','n_diff_pfx03',0,1,'track_type,track_date,banner_id'),('joomla','exam_banner_tracks','idx_track_type','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banner_tracks','idx_track_type','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banners','PRIMARY','2021-03-28 20:58:16','n_diff_pfx01',0,1,'id'),('joomla','exam_banners','PRIMARY','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banners','PRIMARY','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banners','idx_banner_catid','2021-03-28 20:58:16','n_diff_pfx01',0,1,'catid'),('joomla','exam_banners','idx_banner_catid','2021-03-28 20:58:16','n_diff_pfx02',0,1,'catid,id'),('joomla','exam_banners','idx_banner_catid','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banners','idx_banner_catid','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banners','idx_language','2021-03-28 20:58:16','n_diff_pfx01',0,1,'language'),('joomla','exam_banners','idx_language','2021-03-28 20:58:16','n_diff_pfx02',0,1,'language,id'),('joomla','exam_banners','idx_language','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banners','idx_language','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banners','idx_metakey_prefix','2021-03-28 20:58:16','n_diff_pfx01',0,1,'metakey_prefix'),('joomla','exam_banners','idx_metakey_prefix','2021-03-28 20:58:16','n_diff_pfx02',0,1,'metakey_prefix,id'),('joomla','exam_banners','idx_metakey_prefix','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banners','idx_metakey_prefix','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banners','idx_own_prefix','2021-03-28 20:58:16','n_diff_pfx01',0,1,'own_prefix'),('joomla','exam_banners','idx_own_prefix','2021-03-28 20:58:16','n_diff_pfx02',0,1,'own_prefix,id'),('joomla','exam_banners','idx_own_prefix','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banners','idx_own_prefix','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_banners','idx_state','2021-03-28 20:58:16','n_diff_pfx01',0,1,'state'),('joomla','exam_banners','idx_state','2021-03-28 20:58:16','n_diff_pfx02',0,1,'state,id'),('joomla','exam_banners','idx_state','2021-03-28 20:58:16','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_banners','idx_state','2021-03-28 20:58:16','size',1,NULL,'Number of pages in the index'),('joomla','exam_categories','PRIMARY','2021-03-28 20:58:40','n_diff_pfx01',7,1,'id'),('joomla','exam_categories','PRIMARY','2021-03-28 20:58:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_categories','PRIMARY','2021-03-28 20:58:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_categories','cat_idx','2021-03-28 20:58:40','n_diff_pfx01',6,1,'extension'),('joomla','exam_categories','cat_idx','2021-03-28 20:58:40','n_diff_pfx02',6,1,'extension,published'),('joomla','exam_categories','cat_idx','2021-03-28 20:58:40','n_diff_pfx03',6,1,'extension,published,access'),('joomla','exam_categories','cat_idx','2021-03-28 20:58:40','n_diff_pfx04',7,1,'extension,published,access,id'),('joomla','exam_categories','cat_idx','2021-03-28 20:58:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_categories','cat_idx','2021-03-28 20:58:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_categories','idx_access','2021-03-28 20:58:40','n_diff_pfx01',1,1,'access'),('joomla','exam_categories','idx_access','2021-03-28 20:58:40','n_diff_pfx02',7,1,'access,id'),('joomla','exam_categories','idx_access','2021-03-28 20:58:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_categories','idx_access','2021-03-28 20:58:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_categories','idx_alias','2021-03-28 20:58:40','n_diff_pfx01',3,1,'alias'),('joomla','exam_categories','idx_alias','2021-03-28 20:58:40','n_diff_pfx02',7,1,'alias,id'),('joomla','exam_categories','idx_alias','2021-03-28 20:58:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_categories','idx_alias','2021-03-28 20:58:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_categories','idx_checkout','2021-03-28 20:58:40','n_diff_pfx01',1,1,'checked_out'),('joomla','exam_categories','idx_checkout','2021-03-28 20:58:40','n_diff_pfx02',7,1,'checked_out,id'),('joomla','exam_categories','idx_checkout','2021-03-28 20:58:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_categories','idx_checkout','2021-03-28 20:58:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_categories','idx_language','2021-03-28 20:58:40','n_diff_pfx01',1,1,'language'),('joomla','exam_categories','idx_language','2021-03-28 20:58:40','n_diff_pfx02',7,1,'language,id'),('joomla','exam_categories','idx_language','2021-03-28 20:58:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_categories','idx_language','2021-03-28 20:58:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_categories','idx_left_right','2021-03-28 20:58:40','n_diff_pfx01',7,1,'lft'),('joomla','exam_categories','idx_left_right','2021-03-28 20:58:40','n_diff_pfx02',7,1,'lft,rgt'),('joomla','exam_categories','idx_left_right','2021-03-28 20:58:40','n_diff_pfx03',7,1,'lft,rgt,id'),('joomla','exam_categories','idx_left_right','2021-03-28 20:58:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_categories','idx_left_right','2021-03-28 20:58:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_categories','idx_path','2021-03-28 20:58:40','n_diff_pfx01',3,1,'path'),('joomla','exam_categories','idx_path','2021-03-28 20:58:40','n_diff_pfx02',7,1,'path,id'),('joomla','exam_categories','idx_path','2021-03-28 20:58:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_categories','idx_path','2021-03-28 20:58:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_contact_details','PRIMARY','2021-03-28 20:59:40','n_diff_pfx01',1,1,'id'),('joomla','exam_contact_details','PRIMARY','2021-03-28 20:59:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contact_details','PRIMARY','2021-03-28 20:59:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_contact_details','idx_access','2021-03-28 20:59:40','n_diff_pfx01',1,1,'access'),('joomla','exam_contact_details','idx_access','2021-03-28 20:59:40','n_diff_pfx02',1,1,'access,id'),('joomla','exam_contact_details','idx_access','2021-03-28 20:59:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contact_details','idx_access','2021-03-28 20:59:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_contact_details','idx_catid','2021-03-28 20:59:40','n_diff_pfx01',1,1,'catid'),('joomla','exam_contact_details','idx_catid','2021-03-28 20:59:40','n_diff_pfx02',1,1,'catid,id'),('joomla','exam_contact_details','idx_catid','2021-03-28 20:59:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contact_details','idx_catid','2021-03-28 20:59:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_contact_details','idx_checkout','2021-03-28 20:59:40','n_diff_pfx01',1,1,'checked_out'),('joomla','exam_contact_details','idx_checkout','2021-03-28 20:59:40','n_diff_pfx02',1,1,'checked_out,id'),('joomla','exam_contact_details','idx_checkout','2021-03-28 20:59:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contact_details','idx_checkout','2021-03-28 20:59:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_contact_details','idx_createdby','2021-03-28 20:59:40','n_diff_pfx01',1,1,'created_by'),('joomla','exam_contact_details','idx_createdby','2021-03-28 20:59:40','n_diff_pfx02',1,1,'created_by,id'),('joomla','exam_contact_details','idx_createdby','2021-03-28 20:59:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contact_details','idx_createdby','2021-03-28 20:59:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_contact_details','idx_featured_catid','2021-03-28 20:59:40','n_diff_pfx01',1,1,'featured'),('joomla','exam_contact_details','idx_featured_catid','2021-03-28 20:59:40','n_diff_pfx02',1,1,'featured,catid'),('joomla','exam_contact_details','idx_featured_catid','2021-03-28 20:59:40','n_diff_pfx03',1,1,'featured,catid,id'),('joomla','exam_contact_details','idx_featured_catid','2021-03-28 20:59:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contact_details','idx_featured_catid','2021-03-28 20:59:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_contact_details','idx_language','2021-03-28 20:59:40','n_diff_pfx01',1,1,'language'),('joomla','exam_contact_details','idx_language','2021-03-28 20:59:40','n_diff_pfx02',1,1,'language,id'),('joomla','exam_contact_details','idx_language','2021-03-28 20:59:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contact_details','idx_language','2021-03-28 20:59:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_contact_details','idx_state','2021-03-28 20:59:40','n_diff_pfx01',1,1,'published'),('joomla','exam_contact_details','idx_state','2021-03-28 20:59:40','n_diff_pfx02',1,1,'published,id'),('joomla','exam_contact_details','idx_state','2021-03-28 20:59:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contact_details','idx_state','2021-03-28 20:59:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_contact_details','idx_xreference','2021-03-28 20:59:40','n_diff_pfx01',1,1,'xreference'),('joomla','exam_contact_details','idx_xreference','2021-03-28 20:59:40','n_diff_pfx02',1,1,'xreference,id'),('joomla','exam_contact_details','idx_xreference','2021-03-28 20:59:40','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contact_details','idx_xreference','2021-03-28 20:59:40','size',1,NULL,'Number of pages in the index'),('joomla','exam_content','PRIMARY','2021-03-28 20:58:50','n_diff_pfx01',3,1,'id'),('joomla','exam_content','PRIMARY','2021-03-28 20:58:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content','PRIMARY','2021-03-28 20:58:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_content','idx_access','2021-03-28 20:58:50','n_diff_pfx01',1,1,'access'),('joomla','exam_content','idx_access','2021-03-28 20:58:50','n_diff_pfx02',3,1,'access,id'),('joomla','exam_content','idx_access','2021-03-28 20:58:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content','idx_access','2021-03-28 20:58:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_content','idx_alias','2021-03-28 20:58:50','n_diff_pfx01',3,1,'alias'),('joomla','exam_content','idx_alias','2021-03-28 20:58:50','n_diff_pfx02',3,1,'alias,id'),('joomla','exam_content','idx_alias','2021-03-28 20:58:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content','idx_alias','2021-03-28 20:58:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_content','idx_catid','2021-03-28 20:58:50','n_diff_pfx01',2,1,'catid'),('joomla','exam_content','idx_catid','2021-03-28 20:58:50','n_diff_pfx02',3,1,'catid,id'),('joomla','exam_content','idx_catid','2021-03-28 20:58:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content','idx_catid','2021-03-28 20:58:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_content','idx_checkout','2021-03-28 20:58:50','n_diff_pfx01',1,1,'checked_out'),('joomla','exam_content','idx_checkout','2021-03-28 20:58:50','n_diff_pfx02',3,1,'checked_out,id'),('joomla','exam_content','idx_checkout','2021-03-28 20:58:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content','idx_checkout','2021-03-28 20:58:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_content','idx_createdby','2021-03-28 20:58:50','n_diff_pfx01',1,1,'created_by'),('joomla','exam_content','idx_createdby','2021-03-28 20:58:50','n_diff_pfx02',3,1,'created_by,id'),('joomla','exam_content','idx_createdby','2021-03-28 20:58:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content','idx_createdby','2021-03-28 20:58:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_content','idx_featured_catid','2021-03-28 20:58:50','n_diff_pfx01',1,1,'featured'),('joomla','exam_content','idx_featured_catid','2021-03-28 20:58:50','n_diff_pfx02',2,1,'featured,catid'),('joomla','exam_content','idx_featured_catid','2021-03-28 20:58:50','n_diff_pfx03',3,1,'featured,catid,id'),('joomla','exam_content','idx_featured_catid','2021-03-28 20:58:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content','idx_featured_catid','2021-03-28 20:58:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_content','idx_language','2021-03-28 20:58:50','n_diff_pfx01',1,1,'language'),('joomla','exam_content','idx_language','2021-03-28 20:58:50','n_diff_pfx02',3,1,'language,id'),('joomla','exam_content','idx_language','2021-03-28 20:58:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content','idx_language','2021-03-28 20:58:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_content','idx_state','2021-03-28 20:58:50','n_diff_pfx01',1,1,'state'),('joomla','exam_content','idx_state','2021-03-28 20:58:50','n_diff_pfx02',3,1,'state,id'),('joomla','exam_content','idx_state','2021-03-28 20:58:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content','idx_state','2021-03-28 20:58:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_content','idx_xreference','2021-03-28 20:58:50','n_diff_pfx01',1,1,'xreference'),('joomla','exam_content','idx_xreference','2021-03-28 20:58:50','n_diff_pfx02',3,1,'xreference,id'),('joomla','exam_content','idx_xreference','2021-03-28 20:58:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content','idx_xreference','2021-03-28 20:58:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_content_frontpage','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'content_id'),('joomla','exam_content_frontpage','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content_frontpage','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_content_rating','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'content_id'),('joomla','exam_content_rating','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content_rating','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_content_types','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',13,2,'type_id'),('joomla','exam_content_types','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',2,NULL,'Number of leaf pages in the index'),('joomla','exam_content_types','PRIMARY','2021-03-28 20:58:18','size',3,NULL,'Number of pages in the index'),('joomla','exam_content_types','idx_alias','2021-03-28 20:58:18','n_diff_pfx01',13,1,'type_alias'),('joomla','exam_content_types','idx_alias','2021-03-28 20:58:18','n_diff_pfx02',13,1,'type_alias,type_id'),('joomla','exam_content_types','idx_alias','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_content_types','idx_alias','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_contentitem_tag_map','idx_core_content_id','2021-03-28 20:58:17','n_diff_pfx01',0,1,'core_content_id'),('joomla','exam_contentitem_tag_map','idx_core_content_id','2021-03-28 20:58:17','n_diff_pfx02',0,1,'core_content_id,type_id'),('joomla','exam_contentitem_tag_map','idx_core_content_id','2021-03-28 20:58:17','n_diff_pfx03',0,1,'core_content_id,type_id,content_item_id'),('joomla','exam_contentitem_tag_map','idx_core_content_id','2021-03-28 20:58:17','n_diff_pfx04',0,1,'core_content_id,type_id,content_item_id,tag_id'),('joomla','exam_contentitem_tag_map','idx_core_content_id','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contentitem_tag_map','idx_core_content_id','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_contentitem_tag_map','idx_date_id','2021-03-28 20:58:17','n_diff_pfx01',0,1,'tag_date'),('joomla','exam_contentitem_tag_map','idx_date_id','2021-03-28 20:58:17','n_diff_pfx02',0,1,'tag_date,tag_id'),('joomla','exam_contentitem_tag_map','idx_date_id','2021-03-28 20:58:17','n_diff_pfx03',0,1,'tag_date,tag_id,type_id'),('joomla','exam_contentitem_tag_map','idx_date_id','2021-03-28 20:58:17','n_diff_pfx04',0,1,'tag_date,tag_id,type_id,content_item_id'),('joomla','exam_contentitem_tag_map','idx_date_id','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contentitem_tag_map','idx_date_id','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_contentitem_tag_map','idx_tag_type','2021-03-28 20:58:17','n_diff_pfx01',0,1,'tag_id'),('joomla','exam_contentitem_tag_map','idx_tag_type','2021-03-28 20:58:17','n_diff_pfx02',0,1,'tag_id,type_id'),('joomla','exam_contentitem_tag_map','idx_tag_type','2021-03-28 20:58:17','n_diff_pfx03',0,1,'tag_id,type_id,content_item_id'),('joomla','exam_contentitem_tag_map','idx_tag_type','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contentitem_tag_map','idx_tag_type','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_contentitem_tag_map','uc_ItemnameTagid','2021-03-28 20:58:17','n_diff_pfx01',0,1,'type_id'),('joomla','exam_contentitem_tag_map','uc_ItemnameTagid','2021-03-28 20:58:17','n_diff_pfx02',0,1,'type_id,content_item_id'),('joomla','exam_contentitem_tag_map','uc_ItemnameTagid','2021-03-28 20:58:17','n_diff_pfx03',0,1,'type_id,content_item_id,tag_id'),('joomla','exam_contentitem_tag_map','uc_ItemnameTagid','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_contentitem_tag_map','uc_ItemnameTagid','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_core_log_searches','GEN_CLUST_INDEX','2021-03-28 20:58:17','n_diff_pfx01',0,1,'DB_ROW_ID'),('joomla','exam_core_log_searches','GEN_CLUST_INDEX','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_core_log_searches','GEN_CLUST_INDEX','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_extensions','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',183,3,'extension_id'),('joomla','exam_extensions','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',3,NULL,'Number of leaf pages in the index'),('joomla','exam_extensions','PRIMARY','2021-03-28 20:58:18','size',4,NULL,'Number of pages in the index'),('joomla','exam_extensions','element_clientid','2021-03-28 20:58:18','n_diff_pfx01',159,1,'element'),('joomla','exam_extensions','element_clientid','2021-03-28 20:58:18','n_diff_pfx02',164,1,'element,client_id'),('joomla','exam_extensions','element_clientid','2021-03-28 20:58:18','n_diff_pfx03',183,1,'element,client_id,extension_id'),('joomla','exam_extensions','element_clientid','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_extensions','element_clientid','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_extensions','element_folder_clientid','2021-03-28 20:58:18','n_diff_pfx01',159,1,'element'),('joomla','exam_extensions','element_folder_clientid','2021-03-28 20:58:18','n_diff_pfx02',177,1,'element,folder'),('joomla','exam_extensions','element_folder_clientid','2021-03-28 20:58:18','n_diff_pfx03',182,1,'element,folder,client_id'),('joomla','exam_extensions','element_folder_clientid','2021-03-28 20:58:18','n_diff_pfx04',183,1,'element,folder,client_id,extension_id'),('joomla','exam_extensions','element_folder_clientid','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_extensions','element_folder_clientid','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_extensions','extension','2021-03-28 20:58:18','n_diff_pfx01',8,1,'type'),('joomla','exam_extensions','extension','2021-03-28 20:58:18','n_diff_pfx02',161,1,'type,element'),('joomla','exam_extensions','extension','2021-03-28 20:58:18','n_diff_pfx03',178,1,'type,element,folder'),('joomla','exam_extensions','extension','2021-03-28 20:58:18','n_diff_pfx04',183,1,'type,element,folder,client_id'),('joomla','exam_extensions','extension','2021-03-28 20:58:18','n_diff_pfx05',183,1,'type,element,folder,client_id,extension_id'),('joomla','exam_extensions','extension','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_extensions','extension','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'id'),('joomla','exam_fields','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields','idx_access','2021-03-28 20:58:17','n_diff_pfx01',0,1,'access'),('joomla','exam_fields','idx_access','2021-03-28 20:58:17','n_diff_pfx02',0,1,'access,id'),('joomla','exam_fields','idx_access','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields','idx_access','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields','idx_checkout','2021-03-28 20:58:17','n_diff_pfx01',0,1,'checked_out'),('joomla','exam_fields','idx_checkout','2021-03-28 20:58:17','n_diff_pfx02',0,1,'checked_out,id'),('joomla','exam_fields','idx_checkout','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields','idx_checkout','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields','idx_context','2021-03-28 20:58:17','n_diff_pfx01',0,1,'context'),('joomla','exam_fields','idx_context','2021-03-28 20:58:17','n_diff_pfx02',0,1,'context,id'),('joomla','exam_fields','idx_context','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields','idx_context','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields','idx_created_user_id','2021-03-28 20:58:17','n_diff_pfx01',0,1,'created_user_id'),('joomla','exam_fields','idx_created_user_id','2021-03-28 20:58:17','n_diff_pfx02',0,1,'created_user_id,id'),('joomla','exam_fields','idx_created_user_id','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields','idx_created_user_id','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields','idx_language','2021-03-28 20:58:17','n_diff_pfx01',0,1,'language'),('joomla','exam_fields','idx_language','2021-03-28 20:58:17','n_diff_pfx02',0,1,'language,id'),('joomla','exam_fields','idx_language','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields','idx_language','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields','idx_state','2021-03-28 20:58:17','n_diff_pfx01',0,1,'state'),('joomla','exam_fields','idx_state','2021-03-28 20:58:17','n_diff_pfx02',0,1,'state,id'),('joomla','exam_fields','idx_state','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields','idx_state','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields_categories','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'field_id'),('joomla','exam_fields_categories','PRIMARY','2021-03-28 20:58:17','n_diff_pfx02',0,1,'field_id,category_id'),('joomla','exam_fields_categories','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields_categories','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields_groups','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'id'),('joomla','exam_fields_groups','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields_groups','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields_groups','idx_access','2021-03-28 20:58:17','n_diff_pfx01',0,1,'access'),('joomla','exam_fields_groups','idx_access','2021-03-28 20:58:17','n_diff_pfx02',0,1,'access,id'),('joomla','exam_fields_groups','idx_access','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields_groups','idx_access','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields_groups','idx_checkout','2021-03-28 20:58:17','n_diff_pfx01',0,1,'checked_out'),('joomla','exam_fields_groups','idx_checkout','2021-03-28 20:58:17','n_diff_pfx02',0,1,'checked_out,id'),('joomla','exam_fields_groups','idx_checkout','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields_groups','idx_checkout','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields_groups','idx_context','2021-03-28 20:58:17','n_diff_pfx01',0,1,'context'),('joomla','exam_fields_groups','idx_context','2021-03-28 20:58:17','n_diff_pfx02',0,1,'context,id'),('joomla','exam_fields_groups','idx_context','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields_groups','idx_context','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields_groups','idx_created_by','2021-03-28 20:58:17','n_diff_pfx01',0,1,'created_by'),('joomla','exam_fields_groups','idx_created_by','2021-03-28 20:58:17','n_diff_pfx02',0,1,'created_by,id'),('joomla','exam_fields_groups','idx_created_by','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields_groups','idx_created_by','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields_groups','idx_language','2021-03-28 20:58:17','n_diff_pfx01',0,1,'language'),('joomla','exam_fields_groups','idx_language','2021-03-28 20:58:17','n_diff_pfx02',0,1,'language,id'),('joomla','exam_fields_groups','idx_language','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields_groups','idx_language','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields_groups','idx_state','2021-03-28 20:58:17','n_diff_pfx01',0,1,'state'),('joomla','exam_fields_groups','idx_state','2021-03-28 20:58:17','n_diff_pfx02',0,1,'state,id'),('joomla','exam_fields_groups','idx_state','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields_groups','idx_state','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields_values','GEN_CLUST_INDEX','2021-03-28 20:58:17','n_diff_pfx01',0,1,'DB_ROW_ID'),('joomla','exam_fields_values','GEN_CLUST_INDEX','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields_values','GEN_CLUST_INDEX','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields_values','idx_field_id','2021-03-28 20:58:17','n_diff_pfx01',0,1,'field_id'),('joomla','exam_fields_values','idx_field_id','2021-03-28 20:58:17','n_diff_pfx02',0,1,'field_id,DB_ROW_ID'),('joomla','exam_fields_values','idx_field_id','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields_values','idx_field_id','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_fields_values','idx_item_id','2021-03-28 20:58:17','n_diff_pfx01',0,1,'item_id'),('joomla','exam_fields_values','idx_item_id','2021-03-28 20:58:17','n_diff_pfx02',0,1,'item_id,DB_ROW_ID'),('joomla','exam_fields_values','idx_item_id','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_fields_values','idx_item_id','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_filters','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'filter_id'),('joomla','exam_finder_filters','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_filters','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links','idx_md5','2021-03-28 20:58:17','n_diff_pfx01',0,1,'md5sum'),('joomla','exam_finder_links','idx_md5','2021-03-28 20:58:17','n_diff_pfx02',0,1,'md5sum,link_id'),('joomla','exam_finder_links','idx_md5','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links','idx_md5','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links','idx_published_list','2021-03-28 20:58:17','n_diff_pfx01',0,1,'published'),('joomla','exam_finder_links','idx_published_list','2021-03-28 20:58:17','n_diff_pfx02',0,1,'published,state'),('joomla','exam_finder_links','idx_published_list','2021-03-28 20:58:17','n_diff_pfx03',0,1,'published,state,access'),('joomla','exam_finder_links','idx_published_list','2021-03-28 20:58:17','n_diff_pfx04',0,1,'published,state,access,publish_start_date'),('joomla','exam_finder_links','idx_published_list','2021-03-28 20:58:17','n_diff_pfx05',0,1,'published,state,access,publish_start_date,publish_end_date'),('joomla','exam_finder_links','idx_published_list','2021-03-28 20:58:17','n_diff_pfx06',0,1,'published,state,access,publish_start_date,publish_end_date,list_price'),('joomla','exam_finder_links','idx_published_list','2021-03-28 20:58:17','n_diff_pfx07',0,1,'published,state,access,publish_start_date,publish_end_date,list_price,link_id'),('joomla','exam_finder_links','idx_published_list','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links','idx_published_list','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links','idx_published_sale','2021-03-28 20:58:17','n_diff_pfx01',0,1,'published'),('joomla','exam_finder_links','idx_published_sale','2021-03-28 20:58:17','n_diff_pfx02',0,1,'published,state'),('joomla','exam_finder_links','idx_published_sale','2021-03-28 20:58:17','n_diff_pfx03',0,1,'published,state,access'),('joomla','exam_finder_links','idx_published_sale','2021-03-28 20:58:17','n_diff_pfx04',0,1,'published,state,access,publish_start_date'),('joomla','exam_finder_links','idx_published_sale','2021-03-28 20:58:17','n_diff_pfx05',0,1,'published,state,access,publish_start_date,publish_end_date'),('joomla','exam_finder_links','idx_published_sale','2021-03-28 20:58:17','n_diff_pfx06',0,1,'published,state,access,publish_start_date,publish_end_date,sale_price'),('joomla','exam_finder_links','idx_published_sale','2021-03-28 20:58:17','n_diff_pfx07',0,1,'published,state,access,publish_start_date,publish_end_date,sale_price,link_id'),('joomla','exam_finder_links','idx_published_sale','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links','idx_published_sale','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links','idx_title','2021-03-28 20:58:17','n_diff_pfx01',0,1,'title'),('joomla','exam_finder_links','idx_title','2021-03-28 20:58:17','n_diff_pfx02',0,1,'title,link_id'),('joomla','exam_finder_links','idx_title','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links','idx_title','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links','idx_type','2021-03-28 20:58:17','n_diff_pfx01',0,1,'type_id'),('joomla','exam_finder_links','idx_type','2021-03-28 20:58:17','n_diff_pfx02',0,1,'type_id,link_id'),('joomla','exam_finder_links','idx_type','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links','idx_type','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links','idx_url','2021-03-28 20:58:17','n_diff_pfx01',0,1,'url'),('joomla','exam_finder_links','idx_url','2021-03-28 20:58:17','n_diff_pfx02',0,1,'url,link_id'),('joomla','exam_finder_links','idx_url','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links','idx_url','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms0','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms0','PRIMARY','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms0','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms0','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms0','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms0','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms0','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_terms0','idx_link_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms0','idx_link_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms0','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_terms0','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_terms0','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_terms0','idx_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms0','idx_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms1','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms1','PRIMARY','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms1','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms1','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms1','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms1','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms1','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_terms1','idx_link_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms1','idx_link_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms1','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_terms1','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_terms1','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_terms1','idx_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms1','idx_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms2','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms2','PRIMARY','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms2','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms2','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms2','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms2','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms2','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_terms2','idx_link_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms2','idx_link_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms2','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_terms2','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_terms2','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_terms2','idx_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms2','idx_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms3','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms3','PRIMARY','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms3','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms3','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms3','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms3','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms3','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_terms3','idx_link_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms3','idx_link_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms3','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_terms3','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_terms3','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_terms3','idx_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms3','idx_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms4','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms4','PRIMARY','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms4','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms4','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms4','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms4','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms4','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_terms4','idx_link_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms4','idx_link_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms4','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_terms4','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_terms4','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_terms4','idx_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms4','idx_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms5','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms5','PRIMARY','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms5','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms5','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms5','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms5','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms5','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_terms5','idx_link_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms5','idx_link_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms5','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_terms5','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_terms5','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_terms5','idx_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms5','idx_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms6','PRIMARY','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms6','PRIMARY','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms6','PRIMARY','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms6','PRIMARY','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms6','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms6','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms6','idx_link_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_terms6','idx_link_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms6','idx_link_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms6','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_terms6','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_terms6','idx_term_weight','2021-03-28 20:58:17','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_terms6','idx_term_weight','2021-03-28 20:58:17','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms6','idx_term_weight','2021-03-28 20:58:17','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms7','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms7','PRIMARY','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms7','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms7','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms7','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms7','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms7','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_terms7','idx_link_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms7','idx_link_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms7','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_terms7','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_terms7','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_terms7','idx_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms7','idx_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms8','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms8','PRIMARY','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms8','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms8','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms8','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms8','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms8','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_terms8','idx_link_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms8','idx_link_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms8','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_terms8','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_terms8','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_terms8','idx_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms8','idx_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms9','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms9','PRIMARY','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms9','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms9','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms9','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_terms9','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_terms9','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_terms9','idx_link_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms9','idx_link_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_terms9','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_terms9','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_terms9','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_terms9','idx_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_terms9','idx_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsa','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termsa','PRIMARY','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termsa','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsa','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsa','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termsa','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termsa','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_termsa','idx_link_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsa','idx_link_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsa','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_termsa','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_termsa','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_termsa','idx_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsa','idx_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsb','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termsb','PRIMARY','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termsb','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsb','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsb','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termsb','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termsb','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_termsb','idx_link_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsb','idx_link_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsb','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_termsb','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_termsb','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_termsb','idx_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsb','idx_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsc','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termsc','PRIMARY','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termsc','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsc','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsc','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termsc','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termsc','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_termsc','idx_link_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsc','idx_link_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsc','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_termsc','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_termsc','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_termsc','idx_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsc','idx_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsd','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termsd','PRIMARY','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termsd','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsd','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsd','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termsd','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termsd','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_termsd','idx_link_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsd','idx_link_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsd','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_termsd','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_termsd','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_termsd','idx_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsd','idx_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termse','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termse','PRIMARY','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termse','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termse','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termse','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termse','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termse','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_termse','idx_link_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termse','idx_link_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termse','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_termse','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_termse','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_termse','idx_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termse','idx_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsf','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termsf','PRIMARY','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termsf','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsf','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsf','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_links_termsf','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,term_id'),('joomla','exam_finder_links_termsf','idx_link_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'link_id,term_id,weight'),('joomla','exam_finder_links_termsf','idx_link_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsf','idx_link_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_links_termsf','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_links_termsf','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx02',0,1,'term_id,weight'),('joomla','exam_finder_links_termsf','idx_term_weight','2021-03-28 20:58:18','n_diff_pfx03',0,1,'term_id,weight,link_id'),('joomla','exam_finder_links_termsf','idx_term_weight','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_links_termsf','idx_term_weight','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_taxonomy','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'id'),('joomla','exam_finder_taxonomy','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_taxonomy','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_taxonomy','access','2021-03-28 20:58:18','n_diff_pfx01',0,1,'access'),('joomla','exam_finder_taxonomy','access','2021-03-28 20:58:18','n_diff_pfx02',0,1,'access,id'),('joomla','exam_finder_taxonomy','access','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_taxonomy','access','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_taxonomy','idx_parent_published','2021-03-28 20:58:18','n_diff_pfx01',0,1,'parent_id'),('joomla','exam_finder_taxonomy','idx_parent_published','2021-03-28 20:58:18','n_diff_pfx02',0,1,'parent_id,state'),('joomla','exam_finder_taxonomy','idx_parent_published','2021-03-28 20:58:18','n_diff_pfx03',0,1,'parent_id,state,access'),('joomla','exam_finder_taxonomy','idx_parent_published','2021-03-28 20:58:18','n_diff_pfx04',0,1,'parent_id,state,access,id'),('joomla','exam_finder_taxonomy','idx_parent_published','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_taxonomy','idx_parent_published','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_taxonomy','ordering','2021-03-28 20:58:18','n_diff_pfx01',0,1,'ordering'),('joomla','exam_finder_taxonomy','ordering','2021-03-28 20:58:18','n_diff_pfx02',0,1,'ordering,id'),('joomla','exam_finder_taxonomy','ordering','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_taxonomy','ordering','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_taxonomy','parent_id','2021-03-28 20:58:18','n_diff_pfx01',0,1,'parent_id'),('joomla','exam_finder_taxonomy','parent_id','2021-03-28 20:58:18','n_diff_pfx02',0,1,'parent_id,id'),('joomla','exam_finder_taxonomy','parent_id','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_taxonomy','parent_id','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_taxonomy','state','2021-03-28 20:58:18','n_diff_pfx01',0,1,'state'),('joomla','exam_finder_taxonomy','state','2021-03-28 20:58:18','n_diff_pfx02',0,1,'state,id'),('joomla','exam_finder_taxonomy','state','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_taxonomy','state','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_taxonomy_map','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_taxonomy_map','PRIMARY','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,node_id'),('joomla','exam_finder_taxonomy_map','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_taxonomy_map','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_taxonomy_map','link_id','2021-03-28 20:58:18','n_diff_pfx01',0,1,'link_id'),('joomla','exam_finder_taxonomy_map','link_id','2021-03-28 20:58:18','n_diff_pfx02',0,1,'link_id,node_id'),('joomla','exam_finder_taxonomy_map','link_id','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_taxonomy_map','link_id','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_taxonomy_map','node_id','2021-03-28 20:58:18','n_diff_pfx01',0,1,'node_id'),('joomla','exam_finder_taxonomy_map','node_id','2021-03-28 20:58:18','n_diff_pfx02',0,1,'node_id,link_id'),('joomla','exam_finder_taxonomy_map','node_id','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_taxonomy_map','node_id','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_terms','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term_id'),('joomla','exam_finder_terms','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_terms','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_terms','idx_soundex_phrase','2021-03-28 20:58:18','n_diff_pfx01',0,1,'soundex'),('joomla','exam_finder_terms','idx_soundex_phrase','2021-03-28 20:58:18','n_diff_pfx02',0,1,'soundex,phrase'),('joomla','exam_finder_terms','idx_soundex_phrase','2021-03-28 20:58:18','n_diff_pfx03',0,1,'soundex,phrase,term_id'),('joomla','exam_finder_terms','idx_soundex_phrase','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_terms','idx_soundex_phrase','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_terms','idx_stem_phrase','2021-03-28 20:58:18','n_diff_pfx01',0,1,'stem'),('joomla','exam_finder_terms','idx_stem_phrase','2021-03-28 20:58:18','n_diff_pfx02',0,1,'stem,phrase'),('joomla','exam_finder_terms','idx_stem_phrase','2021-03-28 20:58:18','n_diff_pfx03',0,1,'stem,phrase,term_id'),('joomla','exam_finder_terms','idx_stem_phrase','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_terms','idx_stem_phrase','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_terms','idx_term','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term'),('joomla','exam_finder_terms','idx_term','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_terms','idx_term','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_terms','idx_term_phrase','2021-03-28 20:58:18','n_diff_pfx01',0,1,'term'),('joomla','exam_finder_terms','idx_term_phrase','2021-03-28 20:58:18','n_diff_pfx02',0,1,'term,phrase'),('joomla','exam_finder_terms','idx_term_phrase','2021-03-28 20:58:18','n_diff_pfx03',0,1,'term,phrase,term_id'),('joomla','exam_finder_terms','idx_term_phrase','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_terms','idx_term_phrase','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_terms_common','GEN_CLUST_INDEX','2021-03-28 20:58:18','n_diff_pfx01',110,1,'DB_ROW_ID'),('joomla','exam_finder_terms_common','GEN_CLUST_INDEX','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_terms_common','GEN_CLUST_INDEX','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_terms_common','idx_lang','2021-03-28 20:58:18','n_diff_pfx01',1,1,'language'),('joomla','exam_finder_terms_common','idx_lang','2021-03-28 20:58:18','n_diff_pfx02',110,1,'language,DB_ROW_ID'),('joomla','exam_finder_terms_common','idx_lang','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_terms_common','idx_lang','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_terms_common','idx_word_lang','2021-03-28 20:58:18','n_diff_pfx01',110,1,'term'),('joomla','exam_finder_terms_common','idx_word_lang','2021-03-28 20:58:18','n_diff_pfx02',110,1,'term,language'),('joomla','exam_finder_terms_common','idx_word_lang','2021-03-28 20:58:18','n_diff_pfx03',110,1,'term,language,DB_ROW_ID'),('joomla','exam_finder_terms_common','idx_word_lang','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_terms_common','idx_word_lang','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_types','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'id'),('joomla','exam_finder_types','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_types','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_finder_types','title','2021-03-28 20:58:18','n_diff_pfx01',0,1,'title'),('joomla','exam_finder_types','title','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_finder_types','title','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_languages','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'lang_id'),('joomla','exam_languages','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_languages','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_languages','idx_access','2021-03-28 20:58:18','n_diff_pfx01',0,1,'access'),('joomla','exam_languages','idx_access','2021-03-28 20:58:18','n_diff_pfx02',0,1,'access,lang_id'),('joomla','exam_languages','idx_access','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_languages','idx_access','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_languages','idx_langcode','2021-03-28 20:58:18','n_diff_pfx01',0,1,'lang_code'),('joomla','exam_languages','idx_langcode','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_languages','idx_langcode','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_languages','idx_ordering','2021-03-28 20:58:18','n_diff_pfx01',0,1,'ordering'),('joomla','exam_languages','idx_ordering','2021-03-28 20:58:18','n_diff_pfx02',0,1,'ordering,lang_id'),('joomla','exam_languages','idx_ordering','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_languages','idx_ordering','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_languages','idx_sef','2021-03-28 20:58:18','n_diff_pfx01',0,1,'sef'),('joomla','exam_languages','idx_sef','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_languages','idx_sef','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_menu','PRIMARY','2021-03-28 20:59:00','n_diff_pfx01',31,1,'id'),('joomla','exam_menu','PRIMARY','2021-03-28 20:59:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_menu','PRIMARY','2021-03-28 20:59:00','size',1,NULL,'Number of pages in the index'),('joomla','exam_menu','idx_alias','2021-03-28 20:59:00','n_diff_pfx01',27,1,'alias'),('joomla','exam_menu','idx_alias','2021-03-28 20:59:00','n_diff_pfx02',31,1,'alias,id'),('joomla','exam_menu','idx_alias','2021-03-28 20:59:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_menu','idx_alias','2021-03-28 20:59:00','size',1,NULL,'Number of pages in the index'),('joomla','exam_menu','idx_client_id_parent_id_alias_language','2021-03-28 20:59:00','n_diff_pfx01',2,1,'client_id'),('joomla','exam_menu','idx_client_id_parent_id_alias_language','2021-03-28 20:59:00','n_diff_pfx02',8,1,'client_id,parent_id'),('joomla','exam_menu','idx_client_id_parent_id_alias_language','2021-03-28 20:59:00','n_diff_pfx03',31,1,'client_id,parent_id,alias'),('joomla','exam_menu','idx_client_id_parent_id_alias_language','2021-03-28 20:59:00','n_diff_pfx04',31,1,'client_id,parent_id,alias,language'),('joomla','exam_menu','idx_client_id_parent_id_alias_language','2021-03-28 20:59:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_menu','idx_client_id_parent_id_alias_language','2021-03-28 20:59:00','size',1,NULL,'Number of pages in the index'),('joomla','exam_menu','idx_componentid','2021-03-28 20:59:00','n_diff_pfx01',16,1,'component_id'),('joomla','exam_menu','idx_componentid','2021-03-28 20:59:00','n_diff_pfx02',18,1,'component_id,menutype'),('joomla','exam_menu','idx_componentid','2021-03-28 20:59:00','n_diff_pfx03',18,1,'component_id,menutype,published'),('joomla','exam_menu','idx_componentid','2021-03-28 20:59:00','n_diff_pfx04',20,1,'component_id,menutype,published,access'),('joomla','exam_menu','idx_componentid','2021-03-28 20:59:00','n_diff_pfx05',31,1,'component_id,menutype,published,access,id'),('joomla','exam_menu','idx_componentid','2021-03-28 20:59:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_menu','idx_componentid','2021-03-28 20:59:00','size',1,NULL,'Number of pages in the index'),('joomla','exam_menu','idx_language','2021-03-28 20:59:00','n_diff_pfx01',2,1,'language'),('joomla','exam_menu','idx_language','2021-03-28 20:59:00','n_diff_pfx02',31,1,'language,id'),('joomla','exam_menu','idx_language','2021-03-28 20:59:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_menu','idx_language','2021-03-28 20:59:00','size',1,NULL,'Number of pages in the index'),('joomla','exam_menu','idx_left_right','2021-03-28 20:59:00','n_diff_pfx01',31,1,'lft'),('joomla','exam_menu','idx_left_right','2021-03-28 20:59:00','n_diff_pfx02',31,1,'lft,rgt'),('joomla','exam_menu','idx_left_right','2021-03-28 20:59:00','n_diff_pfx03',31,1,'lft,rgt,id'),('joomla','exam_menu','idx_left_right','2021-03-28 20:59:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_menu','idx_left_right','2021-03-28 20:59:00','size',1,NULL,'Number of pages in the index'),('joomla','exam_menu','idx_menutype','2021-03-28 20:59:00','n_diff_pfx01',3,1,'menutype'),('joomla','exam_menu','idx_menutype','2021-03-28 20:59:00','n_diff_pfx02',31,1,'menutype,id'),('joomla','exam_menu','idx_menutype','2021-03-28 20:59:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_menu','idx_menutype','2021-03-28 20:59:00','size',1,NULL,'Number of pages in the index'),('joomla','exam_menu','idx_path','2021-03-28 20:59:00','n_diff_pfx01',31,1,'path'),('joomla','exam_menu','idx_path','2021-03-28 20:59:00','n_diff_pfx02',31,1,'path,id'),('joomla','exam_menu','idx_path','2021-03-28 20:59:00','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_menu','idx_path','2021-03-28 20:59:00','size',1,NULL,'Number of pages in the index'),('joomla','exam_menu_types','PRIMARY','2021-03-28 20:58:21','n_diff_pfx01',0,1,'id'),('joomla','exam_menu_types','PRIMARY','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_menu_types','PRIMARY','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('joomla','exam_menu_types','idx_menutype','2021-03-28 20:58:21','n_diff_pfx01',0,1,'menutype'),('joomla','exam_menu_types','idx_menutype','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_menu_types','idx_menutype','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('joomla','exam_messages','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'message_id'),('joomla','exam_messages','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_messages','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_messages','useridto_state','2021-03-28 20:58:18','n_diff_pfx01',0,1,'user_id_to'),('joomla','exam_messages','useridto_state','2021-03-28 20:58:18','n_diff_pfx02',0,1,'user_id_to,state'),('joomla','exam_messages','useridto_state','2021-03-28 20:58:18','n_diff_pfx03',0,1,'user_id_to,state,message_id'),('joomla','exam_messages','useridto_state','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_messages','useridto_state','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_messages_cfg','idx_user_var_name','2021-03-28 20:58:18','n_diff_pfx01',0,1,'user_id'),('joomla','exam_messages_cfg','idx_user_var_name','2021-03-28 20:58:18','n_diff_pfx02',0,1,'user_id,cfg_name'),('joomla','exam_messages_cfg','idx_user_var_name','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_messages_cfg','idx_user_var_name','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_modules','PRIMARY','2021-03-28 20:59:10','n_diff_pfx01',23,1,'id'),('joomla','exam_modules','PRIMARY','2021-03-28 20:59:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_modules','PRIMARY','2021-03-28 20:59:10','size',1,NULL,'Number of pages in the index'),('joomla','exam_modules','idx_language','2021-03-28 20:59:10','n_diff_pfx01',1,1,'language'),('joomla','exam_modules','idx_language','2021-03-28 20:59:10','n_diff_pfx02',23,1,'language,id'),('joomla','exam_modules','idx_language','2021-03-28 20:59:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_modules','idx_language','2021-03-28 20:59:10','size',1,NULL,'Number of pages in the index'),('joomla','exam_modules','newsfeeds','2021-03-28 20:59:10','n_diff_pfx01',20,1,'module'),('joomla','exam_modules','newsfeeds','2021-03-28 20:59:10','n_diff_pfx02',20,1,'module,published'),('joomla','exam_modules','newsfeeds','2021-03-28 20:59:10','n_diff_pfx03',23,1,'module,published,id'),('joomla','exam_modules','newsfeeds','2021-03-28 20:59:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_modules','newsfeeds','2021-03-28 20:59:10','size',1,NULL,'Number of pages in the index'),('joomla','exam_modules','published','2021-03-28 20:59:10','n_diff_pfx01',2,1,'published'),('joomla','exam_modules','published','2021-03-28 20:59:10','n_diff_pfx02',4,1,'published,access'),('joomla','exam_modules','published','2021-03-28 20:59:10','n_diff_pfx03',23,1,'published,access,id'),('joomla','exam_modules','published','2021-03-28 20:59:10','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_modules','published','2021-03-28 20:59:10','size',1,NULL,'Number of pages in the index'),('joomla','exam_modules_menu','PRIMARY','2021-03-28 20:59:20','n_diff_pfx01',22,1,'moduleid'),('joomla','exam_modules_menu','PRIMARY','2021-03-28 20:59:20','n_diff_pfx02',22,1,'moduleid,menuid'),('joomla','exam_modules_menu','PRIMARY','2021-03-28 20:59:20','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_modules_menu','PRIMARY','2021-03-28 20:59:20','size',1,NULL,'Number of pages in the index'),('joomla','exam_newsfeeds','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'id'),('joomla','exam_newsfeeds','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_newsfeeds','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_newsfeeds','idx_access','2021-03-28 20:58:18','n_diff_pfx01',0,1,'access'),('joomla','exam_newsfeeds','idx_access','2021-03-28 20:58:18','n_diff_pfx02',0,1,'access,id'),('joomla','exam_newsfeeds','idx_access','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_newsfeeds','idx_access','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_newsfeeds','idx_catid','2021-03-28 20:58:18','n_diff_pfx01',0,1,'catid'),('joomla','exam_newsfeeds','idx_catid','2021-03-28 20:58:18','n_diff_pfx02',0,1,'catid,id'),('joomla','exam_newsfeeds','idx_catid','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_newsfeeds','idx_catid','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_newsfeeds','idx_checkout','2021-03-28 20:58:18','n_diff_pfx01',0,1,'checked_out'),('joomla','exam_newsfeeds','idx_checkout','2021-03-28 20:58:18','n_diff_pfx02',0,1,'checked_out,id'),('joomla','exam_newsfeeds','idx_checkout','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_newsfeeds','idx_checkout','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_newsfeeds','idx_createdby','2021-03-28 20:58:18','n_diff_pfx01',0,1,'created_by'),('joomla','exam_newsfeeds','idx_createdby','2021-03-28 20:58:18','n_diff_pfx02',0,1,'created_by,id'),('joomla','exam_newsfeeds','idx_createdby','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_newsfeeds','idx_createdby','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_newsfeeds','idx_language','2021-03-28 20:58:18','n_diff_pfx01',0,1,'language'),('joomla','exam_newsfeeds','idx_language','2021-03-28 20:58:18','n_diff_pfx02',0,1,'language,id'),('joomla','exam_newsfeeds','idx_language','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_newsfeeds','idx_language','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_newsfeeds','idx_state','2021-03-28 20:58:18','n_diff_pfx01',0,1,'published'),('joomla','exam_newsfeeds','idx_state','2021-03-28 20:58:18','n_diff_pfx02',0,1,'published,id'),('joomla','exam_newsfeeds','idx_state','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_newsfeeds','idx_state','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_newsfeeds','idx_xreference','2021-03-28 20:58:18','n_diff_pfx01',0,1,'xreference'),('joomla','exam_newsfeeds','idx_xreference','2021-03-28 20:58:18','n_diff_pfx02',0,1,'xreference,id'),('joomla','exam_newsfeeds','idx_xreference','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_newsfeeds','idx_xreference','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_overrider','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'id'),('joomla','exam_overrider','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_overrider','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_postinstall_messages','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',9,1,'postinstall_message_id'),('joomla','exam_postinstall_messages','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_postinstall_messages','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_privacy_consents','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'id'),('joomla','exam_privacy_consents','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_privacy_consents','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_privacy_consents','idx_user_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'user_id'),('joomla','exam_privacy_consents','idx_user_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'user_id,id'),('joomla','exam_privacy_consents','idx_user_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_privacy_consents','idx_user_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_privacy_requests','PRIMARY','2021-03-28 20:58:18','n_diff_pfx01',0,1,'id'),('joomla','exam_privacy_requests','PRIMARY','2021-03-28 20:58:18','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_privacy_requests','PRIMARY','2021-03-28 20:58:18','size',1,NULL,'Number of pages in the index'),('joomla','exam_redirect_links','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'id'),('joomla','exam_redirect_links','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_redirect_links','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_redirect_links','idx_link_modifed','2021-03-28 20:58:19','n_diff_pfx01',0,1,'modified_date'),('joomla','exam_redirect_links','idx_link_modifed','2021-03-28 20:58:19','n_diff_pfx02',0,1,'modified_date,id'),('joomla','exam_redirect_links','idx_link_modifed','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_redirect_links','idx_link_modifed','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_redirect_links','idx_old_url','2021-03-28 20:58:19','n_diff_pfx01',0,1,'old_url'),('joomla','exam_redirect_links','idx_old_url','2021-03-28 20:58:19','n_diff_pfx02',0,1,'old_url,id'),('joomla','exam_redirect_links','idx_old_url','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_redirect_links','idx_old_url','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_schemas','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'extension_id'),('joomla','exam_schemas','PRIMARY','2021-03-28 20:58:19','n_diff_pfx02',0,1,'extension_id,version_id'),('joomla','exam_schemas','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_schemas','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_session','PRIMARY','2021-03-28 20:59:50','n_diff_pfx01',2,1,'session_id'),('joomla','exam_session','PRIMARY','2021-03-28 20:59:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_session','PRIMARY','2021-03-28 20:59:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_session','time','2021-03-28 20:59:50','n_diff_pfx01',2,1,'time'),('joomla','exam_session','time','2021-03-28 20:59:50','n_diff_pfx02',2,1,'time,session_id'),('joomla','exam_session','time','2021-03-28 20:59:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_session','time','2021-03-28 20:59:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_session','userid','2021-03-28 20:59:50','n_diff_pfx01',1,1,'userid'),('joomla','exam_session','userid','2021-03-28 20:59:50','n_diff_pfx02',2,1,'userid,session_id'),('joomla','exam_session','userid','2021-03-28 20:59:50','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_session','userid','2021-03-28 20:59:50','size',1,NULL,'Number of pages in the index'),('joomla','exam_tags','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'id'),('joomla','exam_tags','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_tags','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_tags','idx_access','2021-03-28 20:58:19','n_diff_pfx01',0,1,'access'),('joomla','exam_tags','idx_access','2021-03-28 20:58:19','n_diff_pfx02',0,1,'access,id'),('joomla','exam_tags','idx_access','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_tags','idx_access','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_tags','idx_alias','2021-03-28 20:58:19','n_diff_pfx01',0,1,'alias'),('joomla','exam_tags','idx_alias','2021-03-28 20:58:19','n_diff_pfx02',0,1,'alias,id'),('joomla','exam_tags','idx_alias','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_tags','idx_alias','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_tags','idx_checkout','2021-03-28 20:58:19','n_diff_pfx01',0,1,'checked_out'),('joomla','exam_tags','idx_checkout','2021-03-28 20:58:19','n_diff_pfx02',0,1,'checked_out,id'),('joomla','exam_tags','idx_checkout','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_tags','idx_checkout','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_tags','idx_language','2021-03-28 20:58:19','n_diff_pfx01',0,1,'language'),('joomla','exam_tags','idx_language','2021-03-28 20:58:19','n_diff_pfx02',0,1,'language,id'),('joomla','exam_tags','idx_language','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_tags','idx_language','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_tags','idx_left_right','2021-03-28 20:58:19','n_diff_pfx01',0,1,'lft'),('joomla','exam_tags','idx_left_right','2021-03-28 20:58:19','n_diff_pfx02',0,1,'lft,rgt'),('joomla','exam_tags','idx_left_right','2021-03-28 20:58:19','n_diff_pfx03',0,1,'lft,rgt,id'),('joomla','exam_tags','idx_left_right','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_tags','idx_left_right','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_tags','idx_path','2021-03-28 20:58:19','n_diff_pfx01',0,1,'path'),('joomla','exam_tags','idx_path','2021-03-28 20:58:19','n_diff_pfx02',0,1,'path,id'),('joomla','exam_tags','idx_path','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_tags','idx_path','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_tags','tag_idx','2021-03-28 20:58:19','n_diff_pfx01',0,1,'published'),('joomla','exam_tags','tag_idx','2021-03-28 20:58:19','n_diff_pfx02',0,1,'published,access'),('joomla','exam_tags','tag_idx','2021-03-28 20:58:19','n_diff_pfx03',0,1,'published,access,id'),('joomla','exam_tags','tag_idx','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_tags','tag_idx','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_template_styles','PRIMARY','2021-03-28 20:59:30','n_diff_pfx01',4,1,'id'),('joomla','exam_template_styles','PRIMARY','2021-03-28 20:59:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_template_styles','PRIMARY','2021-03-28 20:59:30','size',1,NULL,'Number of pages in the index'),('joomla','exam_template_styles','idx_home','2021-03-28 20:59:30','n_diff_pfx01',2,1,'home'),('joomla','exam_template_styles','idx_home','2021-03-28 20:59:30','n_diff_pfx02',4,1,'home,id'),('joomla','exam_template_styles','idx_home','2021-03-28 20:59:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_template_styles','idx_home','2021-03-28 20:59:30','size',1,NULL,'Number of pages in the index'),('joomla','exam_template_styles','idx_template','2021-03-28 20:59:30','n_diff_pfx01',4,1,'template'),('joomla','exam_template_styles','idx_template','2021-03-28 20:59:30','n_diff_pfx02',4,1,'template,id'),('joomla','exam_template_styles','idx_template','2021-03-28 20:59:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_template_styles','idx_template','2021-03-28 20:59:30','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_base','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'ucm_id'),('joomla','exam_ucm_base','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_base','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_base','idx_ucm_item_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'ucm_item_id'),('joomla','exam_ucm_base','idx_ucm_item_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'ucm_item_id,ucm_id'),('joomla','exam_ucm_base','idx_ucm_item_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_base','idx_ucm_item_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_base','idx_ucm_language_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'ucm_language_id'),('joomla','exam_ucm_base','idx_ucm_language_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'ucm_language_id,ucm_id'),('joomla','exam_ucm_base','idx_ucm_language_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_base','idx_ucm_language_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_base','idx_ucm_type_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'ucm_type_id'),('joomla','exam_ucm_base','idx_ucm_type_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'ucm_type_id,ucm_id'),('joomla','exam_ucm_base','idx_ucm_type_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_base','idx_ucm_type_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_content_id'),('joomla','exam_ucm_content','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','idx_access','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_access'),('joomla','exam_ucm_content','idx_access','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_access,core_content_id'),('joomla','exam_ucm_content','idx_access','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','idx_access','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','idx_alias','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_alias'),('joomla','exam_ucm_content','idx_alias','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_alias,core_content_id'),('joomla','exam_ucm_content','idx_alias','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','idx_alias','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','idx_content_type','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_type_alias'),('joomla','exam_ucm_content','idx_content_type','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_type_alias,core_content_id'),('joomla','exam_ucm_content','idx_content_type','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','idx_content_type','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','idx_core_checked_out_user_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_checked_out_user_id'),('joomla','exam_ucm_content','idx_core_checked_out_user_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_checked_out_user_id,core_content_id'),('joomla','exam_ucm_content','idx_core_checked_out_user_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','idx_core_checked_out_user_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','idx_core_created_user_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_created_user_id'),('joomla','exam_ucm_content','idx_core_created_user_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_created_user_id,core_content_id'),('joomla','exam_ucm_content','idx_core_created_user_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','idx_core_created_user_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','idx_core_modified_user_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_modified_user_id'),('joomla','exam_ucm_content','idx_core_modified_user_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_modified_user_id,core_content_id'),('joomla','exam_ucm_content','idx_core_modified_user_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','idx_core_modified_user_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','idx_core_type_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_type_id'),('joomla','exam_ucm_content','idx_core_type_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_type_id,core_content_id'),('joomla','exam_ucm_content','idx_core_type_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','idx_core_type_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','idx_created_time','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_created_time'),('joomla','exam_ucm_content','idx_created_time','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_created_time,core_content_id'),('joomla','exam_ucm_content','idx_created_time','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','idx_created_time','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','idx_language','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_language'),('joomla','exam_ucm_content','idx_language','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_language,core_content_id'),('joomla','exam_ucm_content','idx_language','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','idx_language','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','idx_modified_time','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_modified_time'),('joomla','exam_ucm_content','idx_modified_time','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_modified_time,core_content_id'),('joomla','exam_ucm_content','idx_modified_time','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','idx_modified_time','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','idx_title','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_title'),('joomla','exam_ucm_content','idx_title','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_title,core_content_id'),('joomla','exam_ucm_content','idx_title','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','idx_title','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_content','tag_idx','2021-03-28 20:58:19','n_diff_pfx01',0,1,'core_state'),('joomla','exam_ucm_content','tag_idx','2021-03-28 20:58:19','n_diff_pfx02',0,1,'core_state,core_access'),('joomla','exam_ucm_content','tag_idx','2021-03-28 20:58:19','n_diff_pfx03',0,1,'core_state,core_access,core_content_id'),('joomla','exam_ucm_content','tag_idx','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_content','tag_idx','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_history','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'version_id'),('joomla','exam_ucm_history','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_history','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_history','idx_save_date','2021-03-28 20:58:19','n_diff_pfx01',0,1,'save_date'),('joomla','exam_ucm_history','idx_save_date','2021-03-28 20:58:19','n_diff_pfx02',0,1,'save_date,version_id'),('joomla','exam_ucm_history','idx_save_date','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_history','idx_save_date','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_ucm_history','idx_ucm_item_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'ucm_type_id'),('joomla','exam_ucm_history','idx_ucm_item_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'ucm_type_id,ucm_item_id'),('joomla','exam_ucm_history','idx_ucm_item_id','2021-03-28 20:58:19','n_diff_pfx03',0,1,'ucm_type_id,ucm_item_id,version_id'),('joomla','exam_ucm_history','idx_ucm_item_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_ucm_history','idx_ucm_item_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_update_sites','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',3,1,'update_site_id'),('joomla','exam_update_sites','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_update_sites','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_update_sites_extensions','PRIMARY','2021-03-28 20:58:21','n_diff_pfx01',3,1,'update_site_id'),('joomla','exam_update_sites_extensions','PRIMARY','2021-03-28 20:58:21','n_diff_pfx02',3,1,'update_site_id,extension_id'),('joomla','exam_update_sites_extensions','PRIMARY','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_update_sites_extensions','PRIMARY','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('joomla','exam_updates','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'update_id'),('joomla','exam_updates','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_updates','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_user_keys','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'id'),('joomla','exam_user_keys','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_user_keys','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_user_keys','series','2021-03-28 20:58:19','n_diff_pfx01',0,1,'series'),('joomla','exam_user_keys','series','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_user_keys','series','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_user_keys','user_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'user_id'),('joomla','exam_user_keys','user_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'user_id,id'),('joomla','exam_user_keys','user_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_user_keys','user_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_user_notes','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'id'),('joomla','exam_user_notes','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_user_notes','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_user_notes','idx_category_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'catid'),('joomla','exam_user_notes','idx_category_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'catid,id'),('joomla','exam_user_notes','idx_category_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_user_notes','idx_category_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_user_notes','idx_user_id','2021-03-28 20:58:19','n_diff_pfx01',0,1,'user_id'),('joomla','exam_user_notes','idx_user_id','2021-03-28 20:58:19','n_diff_pfx02',0,1,'user_id,id'),('joomla','exam_user_notes','idx_user_id','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_user_notes','idx_user_id','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_user_profiles','idx_user_id_profile_key','2021-03-28 20:58:19','n_diff_pfx01',0,1,'user_id'),('joomla','exam_user_profiles','idx_user_id_profile_key','2021-03-28 20:58:19','n_diff_pfx02',0,1,'user_id,profile_key'),('joomla','exam_user_profiles','idx_user_id_profile_key','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_user_profiles','idx_user_id_profile_key','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_user_usergroup_map','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'user_id'),('joomla','exam_user_usergroup_map','PRIMARY','2021-03-28 20:58:19','n_diff_pfx02',0,1,'user_id,group_id'),('joomla','exam_user_usergroup_map','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_user_usergroup_map','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_usergroups','PRIMARY','2021-03-28 20:58:21','n_diff_pfx01',9,1,'id'),('joomla','exam_usergroups','PRIMARY','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_usergroups','PRIMARY','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('joomla','exam_usergroups','idx_usergroup_adjacency_lookup','2021-03-28 20:58:21','n_diff_pfx01',6,1,'parent_id'),('joomla','exam_usergroups','idx_usergroup_adjacency_lookup','2021-03-28 20:58:21','n_diff_pfx02',9,1,'parent_id,id'),('joomla','exam_usergroups','idx_usergroup_adjacency_lookup','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_usergroups','idx_usergroup_adjacency_lookup','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('joomla','exam_usergroups','idx_usergroup_nested_set_lookup','2021-03-28 20:58:21','n_diff_pfx01',9,1,'lft'),('joomla','exam_usergroups','idx_usergroup_nested_set_lookup','2021-03-28 20:58:21','n_diff_pfx02',9,1,'lft,rgt'),('joomla','exam_usergroups','idx_usergroup_nested_set_lookup','2021-03-28 20:58:21','n_diff_pfx03',9,1,'lft,rgt,id'),('joomla','exam_usergroups','idx_usergroup_nested_set_lookup','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_usergroups','idx_usergroup_nested_set_lookup','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('joomla','exam_usergroups','idx_usergroup_parent_title_lookup','2021-03-28 20:58:21','n_diff_pfx01',6,1,'parent_id'),('joomla','exam_usergroups','idx_usergroup_parent_title_lookup','2021-03-28 20:58:21','n_diff_pfx02',9,1,'parent_id,title'),('joomla','exam_usergroups','idx_usergroup_parent_title_lookup','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_usergroups','idx_usergroup_parent_title_lookup','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('joomla','exam_usergroups','idx_usergroup_title_lookup','2021-03-28 20:58:21','n_diff_pfx01',9,1,'title'),('joomla','exam_usergroups','idx_usergroup_title_lookup','2021-03-28 20:58:21','n_diff_pfx02',9,1,'title,id'),('joomla','exam_usergroups','idx_usergroup_title_lookup','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_usergroups','idx_usergroup_title_lookup','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('joomla','exam_users','PRIMARY','2021-03-28 20:58:19','n_diff_pfx01',0,1,'id'),('joomla','exam_users','PRIMARY','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_users','PRIMARY','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_users','email','2021-03-28 20:58:19','n_diff_pfx01',0,1,'email'),('joomla','exam_users','email','2021-03-28 20:58:19','n_diff_pfx02',0,1,'email,id'),('joomla','exam_users','email','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_users','email','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_users','idx_block','2021-03-28 20:58:19','n_diff_pfx01',0,1,'block'),('joomla','exam_users','idx_block','2021-03-28 20:58:19','n_diff_pfx02',0,1,'block,id'),('joomla','exam_users','idx_block','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_users','idx_block','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_users','idx_name','2021-03-28 20:58:19','n_diff_pfx01',0,1,'name'),('joomla','exam_users','idx_name','2021-03-28 20:58:19','n_diff_pfx02',0,1,'name,id'),('joomla','exam_users','idx_name','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_users','idx_name','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_users','username','2021-03-28 20:58:19','n_diff_pfx01',0,1,'username'),('joomla','exam_users','username','2021-03-28 20:58:19','n_diff_pfx02',0,1,'username,id'),('joomla','exam_users','username','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_users','username','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_utf8_conversion','GEN_CLUST_INDEX','2021-03-28 20:58:19','n_diff_pfx01',0,1,'DB_ROW_ID'),('joomla','exam_utf8_conversion','GEN_CLUST_INDEX','2021-03-28 20:58:19','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_utf8_conversion','GEN_CLUST_INDEX','2021-03-28 20:58:19','size',1,NULL,'Number of pages in the index'),('joomla','exam_viewlevels','PRIMARY','2021-03-28 20:58:21','n_diff_pfx01',5,1,'id'),('joomla','exam_viewlevels','PRIMARY','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_viewlevels','PRIMARY','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('joomla','exam_viewlevels','idx_assetgroup_title_lookup','2021-03-28 20:58:21','n_diff_pfx01',5,1,'title'),('joomla','exam_viewlevels','idx_assetgroup_title_lookup','2021-03-28 20:58:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('joomla','exam_viewlevels','idx_assetgroup_title_lookup','2021-03-28 20:58:21','size',1,NULL,'Number of pages in the index'),('mysql','component','PRIMARY','2021-03-28 19:26:21','n_diff_pfx01',0,1,'component_id'),('mysql','component','PRIMARY','2021-03-28 19:26:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mysql','component','PRIMARY','2021-03-28 19:26:21','size',1,NULL,'Number of pages in the index'),('mysql','gtid_executed','PRIMARY','2021-03-28 19:26:21','n_diff_pfx01',0,1,'source_uuid'),('mysql','gtid_executed','PRIMARY','2021-03-28 19:26:21','n_diff_pfx02',0,1,'source_uuid,interval_start'),('mysql','gtid_executed','PRIMARY','2021-03-28 19:26:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mysql','gtid_executed','PRIMARY','2021-03-28 19:26:21','size',1,NULL,'Number of pages in the index'),('sys','sys_config','PRIMARY','2021-03-28 19:26:21','n_diff_pfx01',6,1,'variable'),('sys','sys_config','PRIMARY','2021-03-28 19:26:21','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('sys','sys_config','PRIMARY','2021-03-28 19:26:21','size',1,NULL,'Number of pages in the index');
/*!40000 ALTER TABLE `innodb_index_stats` ENABLE KEYS */;

--
-- Dumping data for table `innodb_table_stats`
--

/*!40000 ALTER TABLE `innodb_table_stats` DISABLE KEYS */;
INSERT  IGNORE INTO `innodb_table_stats` VALUES ('joomla','exam_action_log_config','2021-03-28 20:58:21',19,1,0),('joomla','exam_action_logs','2021-03-28 20:58:19',0,1,4),('joomla','exam_action_logs_extensions','2021-03-28 20:58:21',18,1,0),('joomla','exam_action_logs_users','2021-03-28 20:58:19',0,1,1),('joomla','exam_assets','2021-03-28 20:58:30',48,1,3),('joomla','exam_associations','2021-03-28 20:58:16',0,1,1),('joomla','exam_banner_clients','2021-03-28 20:58:16',0,1,2),('joomla','exam_banner_tracks','2021-03-28 20:58:16',0,1,3),('joomla','exam_banners','2021-03-28 20:58:16',0,1,5),('joomla','exam_categories','2021-03-28 20:58:40',7,1,7),('joomla','exam_contact_details','2021-03-28 20:59:40',1,1,8),('joomla','exam_content','2021-03-28 20:58:50',3,1,9),('joomla','exam_content_frontpage','2021-03-28 20:58:17',0,1,0),('joomla','exam_content_rating','2021-03-28 20:58:17',0,1,0),('joomla','exam_content_types','2021-03-28 20:58:18',13,3,1),('joomla','exam_contentitem_tag_map','2021-03-28 20:58:17',0,1,3),('joomla','exam_core_log_searches','2021-03-28 20:58:17',0,1,0),('joomla','exam_extensions','2021-03-28 20:58:18',183,4,3),('joomla','exam_fields','2021-03-28 20:58:17',0,1,6),('joomla','exam_fields_categories','2021-03-28 20:58:17',0,1,0),('joomla','exam_fields_groups','2021-03-28 20:58:17',0,1,6),('joomla','exam_fields_values','2021-03-28 20:58:17',0,1,2),('joomla','exam_finder_filters','2021-03-28 20:58:17',0,1,0),('joomla','exam_finder_links','2021-03-28 20:58:17',0,1,6),('joomla','exam_finder_links_terms0','2021-03-28 20:58:17',0,1,2),('joomla','exam_finder_links_terms1','2021-03-28 20:58:17',0,1,2),('joomla','exam_finder_links_terms2','2021-03-28 20:58:17',0,1,2),('joomla','exam_finder_links_terms3','2021-03-28 20:58:17',0,1,2),('joomla','exam_finder_links_terms4','2021-03-28 20:58:17',0,1,2),('joomla','exam_finder_links_terms5','2021-03-28 20:58:17',0,1,2),('joomla','exam_finder_links_terms6','2021-03-28 20:58:17',0,1,2),('joomla','exam_finder_links_terms7','2021-03-28 20:58:18',0,1,2),('joomla','exam_finder_links_terms8','2021-03-28 20:58:18',0,1,2),('joomla','exam_finder_links_terms9','2021-03-28 20:58:18',0,1,2),('joomla','exam_finder_links_termsa','2021-03-28 20:58:18',0,1,2),('joomla','exam_finder_links_termsb','2021-03-28 20:58:18',0,1,2),('joomla','exam_finder_links_termsc','2021-03-28 20:58:18',0,1,2),('joomla','exam_finder_links_termsd','2021-03-28 20:58:18',0,1,2),('joomla','exam_finder_links_termse','2021-03-28 20:58:18',0,1,2),('joomla','exam_finder_links_termsf','2021-03-28 20:58:18',0,1,2),('joomla','exam_finder_taxonomy','2021-03-28 20:58:18',0,1,5),('joomla','exam_finder_taxonomy_map','2021-03-28 20:58:18',0,1,2),('joomla','exam_finder_terms','2021-03-28 20:58:18',0,1,4),('joomla','exam_finder_terms_common','2021-03-28 20:58:18',110,1,2),('joomla','exam_finder_types','2021-03-28 20:58:18',0,1,1),('joomla','exam_languages','2021-03-28 20:58:18',0,1,4),('joomla','exam_menu','2021-03-28 20:59:00',31,1,7),('joomla','exam_menu_types','2021-03-28 20:58:21',0,1,1),('joomla','exam_messages','2021-03-28 20:58:18',0,1,1),('joomla','exam_messages_cfg','2021-03-28 20:58:18',0,1,0),('joomla','exam_modules','2021-03-28 20:59:10',23,1,3),('joomla','exam_modules_menu','2021-03-28 20:59:20',22,1,0),('joomla','exam_newsfeeds','2021-03-28 20:58:18',0,1,7),('joomla','exam_overrider','2021-03-28 20:58:18',0,1,0),('joomla','exam_postinstall_messages','2021-03-28 20:58:19',9,1,0),('joomla','exam_privacy_consents','2021-03-28 20:58:19',0,1,1),('joomla','exam_privacy_requests','2021-03-28 20:58:18',0,1,0),('joomla','exam_redirect_links','2021-03-28 20:58:19',0,1,2),('joomla','exam_schemas','2021-03-28 20:58:19',0,1,0),('joomla','exam_session','2021-03-28 20:59:50',2,1,2),('joomla','exam_tags','2021-03-28 20:58:19',0,1,7),('joomla','exam_template_styles','2021-03-28 20:59:30',4,1,2),('joomla','exam_ucm_base','2021-03-28 20:58:19',0,1,3),('joomla','exam_ucm_content','2021-03-28 20:58:19',0,1,12),('joomla','exam_ucm_history','2021-03-28 20:58:19',0,1,2),('joomla','exam_update_sites','2021-03-28 20:58:19',3,1,0),('joomla','exam_update_sites_extensions','2021-03-28 20:58:21',3,1,0),('joomla','exam_updates','2021-03-28 20:58:19',0,1,0),('joomla','exam_user_keys','2021-03-28 20:58:19',0,1,2),('joomla','exam_user_notes','2021-03-28 20:58:19',0,1,2),('joomla','exam_user_profiles','2021-03-28 20:58:19',0,1,0),('joomla','exam_user_usergroup_map','2021-03-28 20:58:19',0,1,0),('joomla','exam_usergroups','2021-03-28 20:58:21',9,1,4),('joomla','exam_users','2021-03-28 20:58:19',0,1,4),('joomla','exam_utf8_conversion','2021-03-28 20:58:19',0,1,0),('joomla','exam_viewlevels','2021-03-28 20:58:21',5,1,1),('mysql','component','2021-03-28 19:26:21',0,1,0),('mysql','gtid_executed','2021-03-28 19:26:21',0,1,0),('sys','sys_config','2021-03-28 19:26:21',6,1,0);
/*!40000 ALTER TABLE `innodb_table_stats` ENABLE KEYS */;

--
-- Table structure for table `password_history`
--

DROP TABLE IF EXISTS `password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_history` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `Password` text COLLATE utf8_bin,
  PRIMARY KEY (`Host`,`User`,`Password_timestamp` DESC)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Password history for user accounts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_history`
--

LOCK TABLES `password_history` WRITE;
/*!40000 ALTER TABLE `password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procs_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` varchar(288) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxies_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Proxied_user` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` varchar(288) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxies_priv`
--

LOCK TABLES `proxies_priv` WRITE;
/*!40000 ALTER TABLE `proxies_priv` DISABLE KEYS */;
INSERT INTO `proxies_priv` VALUES ('localhost','root','','',1,'boot@','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `proxies_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_edges`
--

DROP TABLE IF EXISTS `role_edges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_edges` (
  `FROM_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `FROM_USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `TO_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `TO_USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `WITH_ADMIN_OPTION` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`FROM_HOST`,`FROM_USER`,`TO_HOST`,`TO_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Role hierarchy and role grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_edges`
--

LOCK TABLES `role_edges` WRITE;
/*!40000 ALTER TABLE `role_edges` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_edges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_cost`
--

DROP TABLE IF EXISTS `server_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_cost` (
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'disk_temptable_create_cost' then 20.0 when _utf8mb3'disk_temptable_row_cost' then 0.5 when _utf8mb3'key_compare_cost' then 0.05 when _utf8mb3'memory_temptable_create_cost' then 1.0 when _utf8mb3'memory_temptable_row_cost' then 0.1 when _utf8mb3'row_evaluate_cost' then 0.1 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_cost`
--

LOCK TABLES `server_cost` WRITE;
/*!40000 ALTER TABLE `server_cost` DISABLE KEYS */;
INSERT INTO `server_cost` (`cost_name`, `cost_value`, `last_update`, `comment`) VALUES ('disk_temptable_create_cost',NULL,'2021-03-28 19:26:21',NULL),('disk_temptable_row_cost',NULL,'2021-03-28 19:26:21',NULL),('key_compare_cost',NULL,'2021-03-28 19:26:21',NULL),('memory_temptable_create_cost',NULL,'2021-03-28 19:26:21',NULL),('memory_temptable_row_cost',NULL,'2021-03-28 19:26:21',NULL),('row_evaluate_cost',NULL,'2021-03-28 19:26:21',NULL);
/*!40000 ALTER TABLE `server_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slave_master_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slave_master_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint unsigned NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'The host name of the master.',
  `User_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The password used to connect to the master.',
  `Port` int unsigned NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int unsigned NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The master server uuid.',
  `Retry_count` bigint unsigned NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Tls_version` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Tls version',
  `Public_key_path` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file containing public key of master server.',
  `Get_public_key` tinyint(1) NOT NULL COMMENT 'Preference to get public key from master.',
  `Network_namespace` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Network namespace used for communication with the master server.',
  `Master_compression_algorithm` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Compression algorithm supported for data transfer between master and slave.',
  `Master_zstd_compression_level` int unsigned NOT NULL COMMENT 'Compression level associated with zstd compression algorithm.',
  `Tls_ciphersuites` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Ciphersuites used for TLS 1.3 communication with the master server.',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Master Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_relay_log_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slave_relay_log_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int DEFAULT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int unsigned DEFAULT NULL,
  `Id` int unsigned DEFAULT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Privilege_checks_username` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Username part of PRIVILEGE_CHECKS_USER.',
  `Privilege_checks_hostname` char(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'Hostname part of PRIVILEGE_CHECKS_USER.',
  `Require_row_format` tinyint(1) NOT NULL COMMENT 'Indicates whether the channel shall only accept row based events.',
  `Require_table_primary_key_check` enum('STREAM','ON','OFF') NOT NULL DEFAULT 'STREAM' COMMENT 'Indicates what is the channel policy regarding tables having primary keys on create and alter table queries',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Relay Log Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_worker_info`
--

DROP TABLE IF EXISTS `slave_worker_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slave_worker_info` (
  `Id` int unsigned NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Relay_log_pos` bigint unsigned NOT NULL,
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_seqno` int unsigned NOT NULL,
  `Checkpoint_group_size` int unsigned NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`,`Id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Worker Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slave_worker_info`
--

LOCK TABLES `slave_worker_info` WRITE;
/*!40000 ALTER TABLE `slave_worker_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `slave_worker_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` varchar(288) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
INSERT INTO `tables_priv` VALUES ('localhost','mysql','mysql.session','user','boot@','0000-00-00 00:00:00','Select',''),('localhost','sys','mysql.sys','sys_config','root@localhost','2021-03-28 19:26:21','Select','');
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint NOT NULL,
  `Correction` int NOT NULL,
  PRIMARY KEY (`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_time` bigint NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  `Offset` int NOT NULL DEFAULT '0',
  `Is_DST` tinyint unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int unsigned NOT NULL DEFAULT '0',
  `max_updates` int unsigned NOT NULL DEFAULT '0',
  `max_connections` int unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin NOT NULL DEFAULT 'caching_sha2_password',
  `authentication_string` text COLLATE utf8_bin,
  `password_expired` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp NULL DEFAULT NULL,
  `password_lifetime` smallint unsigned DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_role_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_role_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Password_reuse_history` smallint unsigned DEFAULT NULL,
  `Password_reuse_time` smallint unsigned DEFAULT NULL,
  `Password_require_current` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `User_attributes` json DEFAULT NULL,
  PRIMARY KEY (`Host`,`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('192.168.0.17','repl','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$n 4^m.<T\rW*+**G441aws2lWFdILA55rZXJCXSdpetv0CfWkFdgAmMOegapC','N','2021-03-28 19:26:24',NULL,'N','N','N',NULL,NULL,NULL,NULL),('localhost','juser','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*FABE5482D5AADF36D028AC443D117BE1180B9725','N','2021-03-28 19:26:24',NULL,'N','N','N',NULL,NULL,NULL,NULL),('localhost','mysql.infoschema','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2021-03-28 19:26:21',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','mysql.session','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2021-03-28 19:26:21',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2021-03-28 19:26:21',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','root','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'caching_sha2_password','$A$005$Edq}a\rB|I<|jiX{fIxQ8FCRMjTlARqpP1TgNg25G09I0KEN.ocfBX8/09ny.','N','2021-03-28 19:26:24',NULL,'N','Y','Y',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mysql'
--

--
-- Dumping routines for database 'mysql'
--

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint unsigned NOT NULL,
  `server_id` int unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int NOT NULL,
  `rows_examined` int NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int NOT NULL,
  `insert_id` int NOT NULL,
  `server_id` int unsigned NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=@OLD_INNODB_STATS_AUTO_RECALC */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-29  0:02:52