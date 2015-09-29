-- MySQL dump 10.9
--
-- Host: 192.168.1.60    Database: db_new_huachang
-- ------------------------------------------------------
-- Server version	4.1.12a-nt
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_group`
--

DROP TABLE IF EXISTS `admin_group`;
CREATE TABLE `admin_group` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(255) default NULL,
  `REMARK` text,
  `CREATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_group`
--


/*!40000 ALTER TABLE `admin_group` DISABLE KEYS */;
LOCK TABLES `admin_group` WRITE;
INSERT INTO `admin_group` VALUES (1,'һ��Ȩ�޹���Ա','һ��Ȩ�޹���Ա','����Ա','2012-04-25 17:52:10'),(2,'����Ȩ�޹���Ա','����Ȩ�޹���Ա','����Ա','2012-04-26 10:49:11');
UNLOCK TABLES;
/*!40000 ALTER TABLE `admin_group` ENABLE KEYS */;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `ID` int(11) NOT NULL auto_increment,
  `USERNAME` varchar(100) default NULL COMMENT '�û���',
  `PASSWORD` varchar(200) default NULL COMMENT '����',
  `NAME` varchar(100) default NULL COMMENT '����',
  `TYPE` int(4) default NULL COMMENT '���� 0����ͨ����Ա 1����������Ա',
  `STATUS` int(4) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  `DESCRIPTION` text COMMENT '����',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_user`
--


/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
LOCK TABLES `admin_user` WRITE;
INSERT INTO `admin_user` VALUES (1,'administrator','200ceb26807d6bf99fd6f4f0d1ca54d4','����Ա',1,0,'2012-02-18 10:00:00','2012-03-26 16:03:12','administrator','����Ա',NULL),(2,'kelvin','96e79218965eb72c92a549dd5a330112','����Ա',0,0,'2012-04-25 17:40:09','2012-04-27 14:10:47','����Ա','����Ա','����Ա');
UNLOCK TABLES;
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;

--
-- Table structure for table `admin_user_group`
--

DROP TABLE IF EXISTS `admin_user_group`;
CREATE TABLE `admin_user_group` (
  `ID` int(11) NOT NULL auto_increment,
  `GROUP_ID` int(11) default NULL,
  `USER_ID` int(11) default NULL,
  `CREATE_TIME` datetime default NULL,
  `CREATOR` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_user_group`
--


/*!40000 ALTER TABLE `admin_user_group` DISABLE KEYS */;
LOCK TABLES `admin_user_group` WRITE;
INSERT INTO `admin_user_group` VALUES (2,1,2,'2012-04-27 14:12:50','����Ա');
UNLOCK TABLES;
/*!40000 ALTER TABLE `admin_user_group` ENABLE KEYS */;

--
-- Table structure for table `admin_user_log`
--

DROP TABLE IF EXISTS `admin_user_log`;
CREATE TABLE `admin_user_log` (
  `ID` int(11) NOT NULL auto_increment,
  `USER_ID` int(11) default NULL,
  `ROLE_ID` int(11) default NULL,
  `CREATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_user_log`
--


/*!40000 ALTER TABLE `admin_user_log` DISABLE KEYS */;
LOCK TABLES `admin_user_log` WRITE;
INSERT INTO `admin_user_log` VALUES (1,2,1,'kelvin','2012-04-25 17:50:13'),(2,1,1,'administrator','2012-04-26 10:46:24'),(3,1,1,'administrator','2012-04-26 11:03:56'),(4,1,1,'administrator','2012-04-26 17:33:22'),(5,1,1,'administrator','2012-04-26 17:33:47'),(6,1,1,'administrator','2012-04-26 17:34:33'),(7,1,2,'administrator','2012-04-26 17:36:56'),(8,1,1,'administrator','2012-04-26 17:43:08'),(9,1,1,'administrator','2012-04-27 09:30:09'),(10,2,1,'kelvin','2012-04-27 10:38:09'),(11,1,2,'administrator','2012-04-27 14:10:49'),(12,2,1,'kelvin','2012-04-27 14:10:56'),(13,2,2,'kelvin','2012-04-27 14:10:59'),(14,1,1,'administrator','2012-04-27 14:11:10'),(15,1,2,'administrator','2012-04-27 14:11:47'),(16,2,1,'kelvin','2012-04-27 14:11:55'),(17,2,2,'kelvin','2012-04-27 14:12:16'),(18,1,1,'administrator','2012-04-27 14:12:41'),(19,1,2,'administrator','2012-04-27 14:12:52'),(20,2,1,'kelvin','2012-04-27 14:12:59'),(21,2,6,'kelvin','2012-04-27 14:13:03'),(22,2,2,'kelvin','2012-04-27 14:13:43'),(23,1,1,'administrator','2012-04-27 14:13:59'),(24,1,6,'administrator','2012-04-27 15:19:08'),(25,2,1,'kelvin','2012-04-27 15:26:56'),(26,2,2,'kelvin','2012-04-27 15:27:16'),(27,1,1,'administrator','2012-04-27 15:27:58'),(28,1,6,'administrator','2012-04-27 18:00:48'),(29,1,6,'administrator','2012-04-27 18:04:37'),(30,1,1,'administrator','2012-04-28 09:59:56'),(31,1,1,'administrator','2012-04-28 11:27:07'),(32,1,1,'administrator','2012-04-28 15:34:03'),(33,2,1,'kelvin','2012-05-02 09:40:32'),(34,2,2,'kelvin','2012-05-02 09:40:54'),(35,1,1,'administrator','2012-05-02 09:41:32'),(36,1,1,'administrator','2012-05-02 09:43:17'),(37,1,1,'administrator','2012-05-02 15:29:21'),(38,1,1,'administrator','2012-05-02 15:44:41'),(39,1,1,'administrator','2012-05-02 16:46:28'),(40,2,1,'kelvin','2012-05-02 16:47:50'),(41,2,1,'kelvin','2012-05-02 16:48:44'),(42,1,1,'administrator','2012-05-02 17:02:41'),(43,1,1,'administrator','2012-05-02 18:21:34'),(44,1,1,'administrator','2012-05-03 09:32:20'),(45,1,1,'administrator','2012-05-03 10:29:03'),(46,1,1,'administrator','2012-05-03 10:46:32'),(47,1,1,'administrator','2012-05-03 16:45:34'),(48,1,1,'administrator','2012-05-03 17:33:24'),(49,1,1,'administrator','2012-05-03 17:35:06'),(50,1,1,'administrator','2012-05-03 17:37:33'),(51,1,1,'administrator','2012-05-03 17:38:03'),(52,1,1,'administrator','2012-05-03 17:53:21'),(53,1,1,'administrator','2012-05-04 09:24:02'),(54,1,1,'administrator','2012-05-04 09:35:02'),(55,1,1,'administrator','2012-05-07 09:39:06'),(56,1,1,'administrator','2012-05-07 09:52:54'),(57,1,1,'administrator','2012-05-07 14:18:30'),(58,1,1,'administrator','2012-05-07 15:32:27'),(59,1,1,'administrator','2012-05-07 17:18:38'),(60,1,1,'administrator','2012-05-08 09:23:53'),(61,1,1,'administrator','2012-05-08 10:47:31');
UNLOCK TABLES;
/*!40000 ALTER TABLE `admin_user_log` ENABLE KEYS */;

--
-- Table structure for table `admin_user_menu`
--

DROP TABLE IF EXISTS `admin_user_menu`;
CREATE TABLE `admin_user_menu` (
  `ID` int(11) NOT NULL auto_increment,
  `USER_ID` int(11) default NULL,
  `MENU_ID` int(11) default NULL,
  `CREATOR` varchar(255) default NULL,
  `CREATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_user_menu`
--


/*!40000 ALTER TABLE `admin_user_menu` DISABLE KEYS */;
LOCK TABLES `admin_user_menu` WRITE;
INSERT INTO `admin_user_menu` VALUES (1,2,4,'����Ա','2012-04-27 14:11:45');
UNLOCK TABLES;
/*!40000 ALTER TABLE `admin_user_menu` ENABLE KEYS */;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `ID` int(11) NOT NULL auto_increment,
  `CODE` varchar(32) default NULL,
  `VALUE` varchar(64) default NULL,
  `PARENT_CODE` varchar(32) default NULL,
  `CREATE_TIME` date default NULL,
  `SEQUENCE` int(11) default NULL,
  `TYPE` int(4) default NULL,
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dictionary`
--


/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
LOCK TABLES `dictionary` WRITE;
INSERT INTO `dictionary` VALUES (1,'0','��ͨ����Ա','ADMIN_USER_TYPE','2012-02-17',0,NULL,'����Ա����'),(2,'1','��������Ա','ADMIN_USER_TYPE','2012-02-17',0,NULL,'����Ա����'),(3,'0','����','ADMIN_USER_STATUS','2012-02-17',0,NULL,'����Ա״̬'),(4,'1','ʧЧ','ADMIN_USER_STATUS','2012-02-17',0,NULL,'����Ա״̬'),(5,'0','δ���','AUDIT_STATUS','2012-02-17',0,NULL,'���״̬'),(6,'1','�����','AUDIT_STATUS','2012-02-17',0,NULL,'���״̬'),(7,'1','���Ĳ˵�','MENU_TYPE','2012-03-03',0,NULL,'�˵�����'),(8,'2','Ӣ�Ĳ˵�','MENU_TYPE','2012-03-03',0,NULL,'�˵�����'),(9,'3','���Ĳ˵�','MENU_TYPE','2012-03-03',0,NULL,'�˵�����'),(10,'1','����Ȩ��','ROLE_TYPE','2012-03-06',0,NULL,'Ȩ������'),(11,'2','Ӣ��Ȩ��','ROLE_TYPE','2012-03-06',0,NULL,'Ȩ������'),(12,'3','����Ȩ��','ROLE_TYPE','2012-03-06',0,NULL,'Ȩ������'),(13,'1','��ר','MODEL_ADVERTISE_DEGREE_TYPE','2012-04-28',0,NULL,'��Ƹ��Ϣ_ѧ��Ҫ��'),(14,'2','����','MODEL_ADVERTISE_DEGREE_TYPE','2012-04-28',0,NULL,'��Ƹ��Ϣ_ѧ��Ҫ��'),(15,'3','��ר','MODEL_ADVERTISE_DEGREE_TYPE','2012-04-28',0,NULL,'��Ƹ��Ϣ_ѧ��Ҫ��'),(16,'4','����','MODEL_ADVERTISE_DEGREE_TYPE','2012-04-28',0,NULL,'��Ƹ��Ϣ_ѧ��Ҫ��'),(17,'5','˶ʿ','MODEL_ADVERTISE_DEGREE_TYPE','2012-04-28',0,NULL,'��Ƹ��Ϣ_ѧ��Ҫ��'),(18,'6','��ʿ','MODEL_ADVERTISE_DEGREE_TYPE','2012-04-28',0,NULL,'��Ƹ��Ϣ_ѧ��Ҫ��'),(19,'1','�ڿ�','MAGAZINE_CATEGORY_TYPE','2012-05-04',0,NULL,'�ڿ�����'),(20,'2','�¿�','MAGAZINE_CATEGORY_TYPE','2012-05-04',0,NULL,'�ڿ�����'),(21,'3','��־','MAGAZINE_CATEGORY_TYPE','2012-05-04',0,NULL,'�ڿ�����'),(22,'1','����','MAGAZINE_TYPE','2012-05-04',0,NULL,'�ڿ���Ϣ����'),(23,'2','��ͼ','MAGAZINE_TYPE','2012-05-04',0,NULL,'�ڿ���Ϣ����'),(24,'3','����','MAGAZINE_TYPE','2012-05-04',0,NULL,'�ڿ���Ϣ����');
UNLOCK TABLES;
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;

--
-- Table structure for table `group_role`
--

DROP TABLE IF EXISTS `group_role`;
CREATE TABLE `group_role` (
  `ID` int(11) NOT NULL auto_increment,
  `GROUP_ID` int(11) default NULL,
  `ROLE_ID` int(11) default NULL,
  `CREATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_role`
--


/*!40000 ALTER TABLE `group_role` DISABLE KEYS */;
LOCK TABLES `group_role` WRITE;
INSERT INTO `group_role` VALUES (2,1,6,'����Ա','2012-04-26 11:04:41');
UNLOCK TABLES;
/*!40000 ALTER TABLE `group_role` ENABLE KEYS */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(255) default NULL,
  `CODE` varchar(255) default NULL,
  `TYPE` int(4) default NULL COMMENT '���ͣ� 1:���Ĳ˵� 2:Ӣ�Ĳ˵� 3:���Ĳ˵�',
  `SEQUENCE` int(11) default NULL,
  `DESCRIPTION` varchar(255) default NULL,
  `CREATE_TIME` datetime default NULL,
  `CREATOR` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--


/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
LOCK TABLES `menu` WRITE;
INSERT INTO `menu` VALUES (4,'���ŷ�������','/admin/modelNewsPage.do',1,2,'���ŷ�������','2012-04-26 14:37:32','����Ա'),(5,'�������ӹ���','/admin/modelLinkPage.do',1,3,'�������ӹ���','2012-04-27 10:46:38','����Ա'),(6,'��ϵ���ǹ���','/admin/viewModelContact.do',1,4,'��ϵ���ǹ���','2012-04-27 11:52:22','����Ա'),(7,'�ļ����ع���','/admin/modelFormDownloadPage.do',1,5,'�ļ����ع���','2012-04-27 14:35:53','����Ա'),(8,'������Ŀ����','/admin/modelContentCategoryPage.do',1,1,'������Ŀ����','2012-04-27 16:35:28','����Ա'),(9,'��Ƹ��Ϣ����','/admin/modelAdvertisePage.do',1,6,'��Ƹ��Ϣ����','2012-04-28 11:28:37','����Ա'),(10,'��Ƶ�������','/admin/modelVideoCategoryPage.do',1,7,'��Ƶ�������','2012-05-02 11:54:38','����Ա'),(11,'���ݱ��ݹ���','/admin/modelDatabaseBakPage.do',1,8,'���ݱ��ݹ���','2012-05-03 14:28:45','����Ա'),(12,'�ڿ��������','/admin/modelMagazineCategoryPage.do',1,9,'�ڿ��������','2012-05-04 11:59:36','����Ա'),(13,'�����ֲ�������','/admin/modelEhandbookCategoryPage.do',1,10,'�����ֲ�������','2012-05-07 14:20:04','����Ա'),(14,'��Ʒ�������','/admin/modelProductCategoryPage.do',1,11,'��Ʒ�������','2012-05-08 10:48:29','����Ա');
UNLOCK TABLES;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

--
-- Table structure for table `model_advertise`
--

DROP TABLE IF EXISTS `model_advertise`;
CREATE TABLE `model_advertise` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(100) default NULL COMMENT 'ְλ����',
  `AD_PERSON` varchar(255) default NULL COMMENT '��Ƹ����',
  `DEGREE` int(4) default NULL COMMENT 'ѧ��Ҫ��: 1:��ר 2:���� 3:��ר 4:���� 5:˶ʿ 6:��ʿ',
  `START_TIME` datetime default NULL COMMENT '��ʼʱ��',
  `END_TIME` datetime default NULL COMMENT '����ʱ��',
  `DESCRIPTION` text COMMENT '����',
  `REQUIRES` text COMMENT 'Ҫ��',
  `LINKMAN` varchar(50) default NULL COMMENT '��ϵ��',
  `TELEPHONE` varchar(50) default NULL COMMENT '�绰',
  `EMAIL` varchar(50) default NULL COMMENT '����',
  `TYPE` int(4) default NULL COMMENT '���ͣ�1:�²���',
  `STATUS` int(4) default NULL COMMENT '���״̬ 0:δ��� 1:�����',
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_advertise`
--


/*!40000 ALTER TABLE `model_advertise` DISABLE KEYS */;
LOCK TABLES `model_advertise` WRITE;
INSERT INTO `model_advertise` VALUES (5,'test11nn','112rnn',6,'2012-04-28 00:00:00','2012-04-30 00:00:00','<html>    <head>        <title></title>    </head>    <body>        <p>dsssssssssgngngngngng</p>    </body></html>','<html>    <head>        <title></title>    </head>    <body>        <p>eeeeeeeetestgngngngn</p>    </body></html>','test11gngngngn','1222112gngngn','12212gngngn',1,0,'����Ա','����Ա','2012-04-28 14:17:35','2012-04-28 14:26:22'),(8,'jjjjjjjjjjj','jjjjjjjjjj',NULL,'2012-04-28 00:00:00','2012-04-30 00:00:00','<html>    <head>        <title></title>    </head>    <body>        <p>jjjjjjjjjjjjj</p>    </body></html>','<html>    <head>        <title></title>    </head>    <body>        <p>jjjjjjj</p>    </body></html>','jjjjjjj','jjjjjjjjjjjjjjjjjjjj','jjjjjjjjjjjjjjjjj',1,1,'����Ա',NULL,'2012-04-28 14:50:27',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_advertise` ENABLE KEYS */;

--
-- Table structure for table `model_contact`
--

DROP TABLE IF EXISTS `model_contact`;
CREATE TABLE `model_contact` (
  `ID` int(11) NOT NULL auto_increment,
  `HOTLINE` varchar(255) default NULL COMMENT '��ҵ����',
  `EMAIL` varchar(255) default NULL COMMENT '��ϵ����',
  `FAX` varchar(255) default NULL COMMENT '����',
  `WEIBO` varchar(255) default NULL COMMENT '΢��',
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='��ϵ���Ǳ�';

--
-- Dumping data for table `model_contact`
--


/*!40000 ALTER TABLE `model_contact` DISABLE KEYS */;
LOCK TABLES `model_contact` WRITE;
INSERT INTO `model_contact` VALUES (1,'110000999','110000999','110000kkkk','110000kkkk','2012-04-27 11:55:02','2012-05-08 11:11:53','����Ա','����Ա');
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_contact` ENABLE KEYS */;

--
-- Table structure for table `model_content_category`
--

DROP TABLE IF EXISTS `model_content_category`;
CREATE TABLE `model_content_category` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(100) default NULL,
  `TYPE` int(4) default NULL,
  `STATUS` int(4) default NULL,
  `REMARK` text,
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_content_category`
--


/*!40000 ALTER TABLE `model_content_category` DISABLE KEYS */;
LOCK TABLES `model_content_category` WRITE;
INSERT INTO `model_content_category` VALUES (1,'��ҵ�Ļ�',NULL,1,'��ҵ�Ļ�','����Ա','����Ա','2012-04-27 17:04:18','2012-04-27 17:37:54'),(7,'test',NULL,0,'test','����Ա',NULL,'2012-05-03 10:27:13',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_content_category` ENABLE KEYS */;

--
-- Table structure for table `model_content_detail`
--

DROP TABLE IF EXISTS `model_content_detail`;
CREATE TABLE `model_content_detail` (
  `ID` int(11) NOT NULL auto_increment,
  `CATEGORY_ID` int(11) default NULL,
  `NAME` varchar(100) default NULL,
  `CONTENT` text,
  `SEQUENCE` int(11) default NULL,
  `PUB_TIME` datetime default NULL,
  `STATUS` int(4) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_content_detail`
--


/*!40000 ALTER TABLE `model_content_detail` DISABLE KEYS */;
LOCK TABLES `model_content_detail` WRITE;
INSERT INTO `model_content_detail` VALUES (1,1,'���Ÿ���','<html>    <head>        <title></title>    </head>    <body>        <p>���Ÿ���</p>    </body></html>',1,'2012-04-28 00:00:00',0,'2012-04-28 13:22:18',NULL,'����Ա',NULL),(2,1,'���ļ�ֵ��test1','<html>    <head>        <title></title>    </head>    <body>        <p>���ļ�ֵ��test1</p>    </body></html>',2,'2012-04-28 00:00:00',0,'2012-05-02 11:44:39','2012-05-02 11:20:43','����Ա','����Ա'),(8,7,'testq','<html>    <head>        <title></title>    </head>    <body>        <p>testq</p>    </body></html>',1,'2012-05-03 00:00:00',0,'2012-05-03 10:27:28',NULL,'����Ա',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_content_detail` ENABLE KEYS */;

--
-- Table structure for table `model_content_history`
--

DROP TABLE IF EXISTS `model_content_history`;
CREATE TABLE `model_content_history` (
  `ID` int(11) NOT NULL auto_increment,
  `CONTENT_ID` int(11) default NULL,
  `NAME` varchar(100) default NULL,
  `CONTENT` text,
  `SEQUENCE` int(11) default NULL,
  `PUB_TIME` datetime default NULL,
  `STATUS` int(4) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_content_history`
--


/*!40000 ALTER TABLE `model_content_history` DISABLE KEYS */;
LOCK TABLES `model_content_history` WRITE;
INSERT INTO `model_content_history` VALUES (1,2,'���ļ�ֵ��','<html>    <head>        <title></title>    </head>    <body>        <p>���ļ�ֵ��</p>    </body></html>',2,'2012-04-28 00:00:00',0,'2012-05-02 10:01:49','2012-04-28 14:22:03','����Ա','����Ա'),(5,2,'���ļ�ֵ��test1','<html>    <head>        <title></title>    </head>    <body>        <p>���ļ�ֵ��test1</p>    </body></html>',2,'2012-04-28 00:00:00',0,'2012-05-02 11:38:54','2012-05-02 11:20:43','����Ա','����Ա'),(7,2,'���ļ�ֵ��','<html>    <head>        <title></title>    </head>    <body>        <p>���ļ�ֵ��</p>    </body></html>',2,'2012-04-29 00:00:00',0,'2012-05-02 11:43:05','2012-04-28 14:22:03','����Ա','����Ա'),(8,2,'���ļ�ֵ��','<html>    <head>        <title></title>    </head>    <body>        <p>���ļ�ֵ��</p>    </body></html>',3,'2012-04-29 00:00:00',0,'2012-05-02 11:43:16','2012-05-02 11:43:05','����Ա','����Ա'),(9,2,'���ļ�ֵ��','<html>    <head>        <title></title>    </head>    <body>        <p>���ļ�ֵ��</p>    </body></html>',2,'2012-04-28 00:00:00',0,'2012-05-02 11:44:39','2012-04-28 14:22:03','����Ա','����Ա');
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_content_history` ENABLE KEYS */;

--
-- Table structure for table `model_database_bak`
--

DROP TABLE IF EXISTS `model_database_bak`;
CREATE TABLE `model_database_bak` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(100) default NULL,
  `PATH` varchar(100) default NULL,
  `STATUS` int(4) default NULL,
  `TYPE` int(4) default NULL,
  `CREATE_TIME` datetime default NULL,
  `CREATOR` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_database_bak`
--


/*!40000 ALTER TABLE `model_database_bak` DISABLE KEYS */;
LOCK TABLES `model_database_bak` WRITE;
INSERT INTO `model_database_bak` VALUES (5,'20120503144221bak','admin/sql/20120503144221bak.sql',0,0,'2012-05-03 14:42:21','����Ա'),(3,'20120503142231bak','admin/sql/20120503142231bak.sql',0,0,'2012-05-03 14:22:31','����Ա'),(4,'20120503142750bak','admin/sql/20120503142750bak.sql',0,0,'2012-05-03 14:27:50','����Ա'),(6,'20120503144614bak','admin/sql/20120503144614bak.sql',0,0,'2012-05-03 14:46:14','����Ա'),(7,'20120503144627bak','admin/sql/20120503144627bak.sql',0,0,'2012-05-03 14:46:27','����Ա'),(8,'20120503144706bak','admin/sql/20120503144706bak.sql',0,0,'2012-05-03 14:47:06','����Ա'),(9,'20120503144710bak','admin/sql/20120503144710bak.sql',0,0,'2012-05-03 14:47:10','����Ա'),(15,'20120503155038bak','admin/sql/20120503155038bak.sql',0,0,'2012-05-03 15:50:38','����Ա'),(17,'20120508181246bak','admin/sql/20120508181246bak.sql',0,0,'2012-05-08 18:12:46','����Ա');
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_database_bak` ENABLE KEYS */;

--
-- Table structure for table `model_ehandbook`
--

DROP TABLE IF EXISTS `model_ehandbook`;
CREATE TABLE `model_ehandbook` (
  `ID` int(11) NOT NULL auto_increment,
  `CATEGORY_ID` int(11) default NULL COMMENT '����ID',
  `CONTENT` text COMMENT '����',
  `PUB_TIME` datetime default NULL COMMENT '����ʱ��',
  `STATUS` int(4) default NULL COMMENT '״̬�� 0:δ��� 1:�����',
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_ehandbook`
--


/*!40000 ALTER TABLE `model_ehandbook` DISABLE KEYS */;
LOCK TABLES `model_ehandbook` WRITE;
INSERT INTO `model_ehandbook` VALUES (2,2,'<html>    <head>        <title></title>    </head>    <body>        <p>uuuuuuuuuuuuuuuuuuuuuuuu0000ddddddddddddd</p>    </body></html>','2012-05-07 00:00:00',0,'����Ա','����Ա','2012-05-07 16:08:01','2012-05-07 17:03:42'),(4,2,'<html>    <head>        <title></title>    </head>    <body>        <p>nnnnnnnnnnnnnnddddddddddddddddddd</p>    </body></html>','2012-05-01 00:00:00',1,'����Ա','����Ա','2012-05-07 16:51:58','2012-05-07 17:04:01');
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_ehandbook` ENABLE KEYS */;

--
-- Table structure for table `model_ehandbook_category`
--

DROP TABLE IF EXISTS `model_ehandbook_category`;
CREATE TABLE `model_ehandbook_category` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(100) default NULL COMMENT '��������',
  `PATH` varchar(100) default NULL COMMENT '�ϴ��ļ�·��(uploadMagazine)',
  `TYPE` int(4) default NULL COMMENT '���ͣ�1;�����ֲ�',
  `STATUS` int(4) default NULL COMMENT '״̬��0:δ��� 1:�����',
  `REMARK` text,
  `CREATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATOR` varchar(100) default NULL,
  `UPDATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_ehandbook_category`
--


/*!40000 ALTER TABLE `model_ehandbook_category` DISABLE KEYS */;
LOCK TABLES `model_ehandbook_category` WRITE;
INSERT INTO `model_ehandbook_category` VALUES (4,'test','admin/uploadFile/EhandbookCategory/20120507170020.txt',NULL,1,'','����Ա','2012-05-07 17:00:20',NULL,NULL),(2,'test222',NULL,NULL,0,'test222','����Ա','2012-05-07 14:55:59',NULL,NULL),(5,'ggggggggg','admin/uploadFile/EhandbookCategory/20120508095906.txt',1,0,'','����Ա','2012-05-08 09:59:06',NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_ehandbook_category` ENABLE KEYS */;

--
-- Table structure for table `model_form_download`
--

DROP TABLE IF EXISTS `model_form_download`;
CREATE TABLE `model_form_download` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(255) default NULL COMMENT '�������',
  `PATH` varchar(255) default NULL COMMENT '·��',
  `LOGO_PATH` varchar(255) default NULL,
  `TYPE` int(4) default NULL COMMENT '���ͣ� 1:����Ա�ϴ� ',
  `STATUS` int(4) default NULL,
  `LOGIN_ID` int(11) default NULL COMMENT '��Ϊ��',
  `CREATOR` varchar(255) default NULL,
  `UPDATOR` varchar(255) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_form_download`
--


/*!40000 ALTER TABLE `model_form_download` DISABLE KEYS */;
LOCK TABLES `model_form_download` WRITE;
INSERT INTO `model_form_download` VALUES (12,'���׷���','admin/uploadFile/Download/���׷���.txt',NULL,3,0,NULL,'����Ա',NULL,'2012-05-02 10:19:20',NULL),(6,'ddd','admin/uploadFile/Download/ddd.txt',NULL,3,1,NULL,'����Ա',NULL,'2012-04-28 15:37:58',NULL),(7,'sssh','admin/uploadFile/Download/sssh.doc',NULL,3,0,NULL,'����Ա','����Ա','2012-04-28 16:54:03',NULL),(8,'ddddddddd','admin/uploadFile/Download/ddddddddd.txt',NULL,3,0,NULL,'����Ա','����Ա','2012-04-28 16:54:27',NULL),(9,'ddddddd','admin/uploadFile/Download/ddddddd.txt',NULL,3,0,NULL,'����Ա',NULL,'2012-04-28 15:45:20',NULL),(10,'ddddddddd','admin/uploadFile/Download/ddddddddd.txt',NULL,3,0,NULL,'����Ա','����Ա','2012-04-28 16:59:52',NULL),(11,'���׷���','admin/uploadFile/Download/���׷���.txt',NULL,3,0,NULL,'����Ա',NULL,'2012-04-28 16:13:35',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_form_download` ENABLE KEYS */;

--
-- Table structure for table `model_link`
--

DROP TABLE IF EXISTS `model_link`;
CREATE TABLE `model_link` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(100) default NULL COMMENT '����',
  `LOGO` varchar(100) default NULL COMMENT 'LOGO',
  `LINK` varchar(100) default NULL COMMENT '����',
  `SEQUENCE` int(11) default NULL COMMENT '����(����)',
  `STATUS` int(4) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_link`
--


/*!40000 ALTER TABLE `model_link` DISABLE KEYS */;
LOCK TABLES `model_link` WRITE;
INSERT INTO `model_link` VALUES (1,'�ٶ�','admin/uploadImage/ModelLink/20120427111836.jpg','http://www.baidu.com',1,1,'2012-04-27 10:51:34','2012-04-27 11:19:03','����Ա','����Ա'),(2,'�ȸ�','admin/uploadImage/ModelLink/20120427105306.jpg','http://www.google.com.hk',2,0,'2012-04-27 10:53:06','2012-04-27 11:03:15','����Ա','����Ա');
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_link` ENABLE KEYS */;

--
-- Table structure for table `model_magazine`
--

DROP TABLE IF EXISTS `model_magazine`;
CREATE TABLE `model_magazine` (
  `ID` int(11) NOT NULL auto_increment,
  `CATEGORY_ID` int(11) default NULL COMMENT '����ID',
  `NAME` varchar(100) default NULL,
  `CONTENT` text COMMENT '����',
  `PUB_TIME` datetime default NULL COMMENT '����ʱ��',
  `TYPE` int(4) default NULL COMMENT '���ͣ�1:���� 2:��ͼ 3:����',
  `STATUS` int(4) default NULL COMMENT '״̬�� 0:δ��� 1:�����',
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_magazine`
--


/*!40000 ALTER TABLE `model_magazine` DISABLE KEYS */;
LOCK TABLES `model_magazine` WRITE;
INSERT INTO `model_magazine` VALUES (5,6,'test','test','2012-05-07 00:00:00',1,1,'����Ա',NULL,'2012-05-07 10:13:08',NULL),(2,7,'sssssssssssssss','sssssssssssssssss','2012-05-07 00:00:00',2,1,'����Ա',NULL,'2012-05-07 09:53:28',NULL),(8,8,'test','<html>    <head>        <title></title>    </head>    <body>        <p>test</p>    </body></html>','2012-05-07 00:00:00',3,1,'����Ա',NULL,'2012-05-07 10:33:41',NULL),(7,6,'test11','<html>    <head>        <title></title>    </head>    <body>        <p>test11</p>    </body></html>','2012-05-07 00:00:00',2,1,'����Ա',NULL,'2012-05-07 10:30:56',NULL),(9,6,'dddddddddddd','<html>    <head>        <title></title>    </head>    <body>        <p>ddddddddddddddd</p>    </body></html>','2012-05-07 00:00:00',3,0,'����Ա',NULL,'2012-05-07 10:35:10',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_magazine` ENABLE KEYS */;

--
-- Table structure for table `model_magazine_category`
--

DROP TABLE IF EXISTS `model_magazine_category`;
CREATE TABLE `model_magazine_category` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(100) default NULL COMMENT '��������',
  `PATH` varchar(100) default NULL COMMENT '�ϴ��ļ�·��(uploadMagazine)',
  `VOLUMN_COUNT` int(11) default NULL,
  `TYPE` int(4) default NULL COMMENT '���ͣ�1;�ڿ���2:�¿� 3:��־',
  `STATUS` int(4) default NULL COMMENT '״̬��0:δ��� 1:�����',
  `REMARK` text,
  `CREATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_magazine_category`
--


/*!40000 ALTER TABLE `model_magazine_category` DISABLE KEYS */;
LOCK TABLES `model_magazine_category` WRITE;
INSERT INTO `model_magazine_category` VALUES (4,'dddddddddd','admin/uploadFile/MagazineCategory/20120504145258.txt',2314,2,1,'dddddddddddd','����Ա','2012-05-04 14:52:58'),(5,'dddddddd','admin/uploadFile/MagazineCategory/20120504145540.txt',1,3,0,'ddddddddddd','����Ա','2012-05-04 14:55:40'),(6,'dddddddddd','admin/uploadFile/MagazineCategory/20120504145802.txt',1333,2,0,'ddddddddddddddddd','����Ա','2012-05-04 14:58:02'),(8,'test',NULL,100,1,1,'','����Ա','2012-05-07 10:33:10');
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_magazine_category` ENABLE KEYS */;

--
-- Table structure for table `model_news`
--

DROP TABLE IF EXISTS `model_news`;
CREATE TABLE `model_news` (
  `ID` int(11) NOT NULL auto_increment,
  `TITLE` varchar(255) default NULL COMMENT '����',
  `CONTENT` text COMMENT '����',
  `PATH` varchar(255) default NULL COMMENT '����ͼƬ·��',
  `SY_PATH` varchar(255) default NULL COMMENT '��ҳͼƬ��ʾ',
  `SOURCE` varchar(100) default NULL COMMENT '��Դ',
  `REPORTER` varchar(100) default NULL COMMENT 'ͨѶԱ',
  `CLICK` int(11) default NULL COMMENT '�����',
  `PUB_TIME` datetime default NULL,
  `TYPE` int(4) default NULL COMMENT '���ͣ� 1:����Ա����',
  `STATUS` int(4) default NULL COMMENT '״̬',
  `SEQUENCE` int(11) default NULL,
  `CREATOR` varchar(255) default NULL,
  `UPDATOR` varchar(255) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_news`
--


/*!40000 ALTER TABLE `model_news` DISABLE KEYS */;
LOCK TABLES `model_news` WRITE;
INSERT INTO `model_news` VALUES (1,'��֥������������������-a��','<html>    <head>        <title></title>    </head>    <body>        <p>a-2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�Ϸ����б�','admin',128,'2012-04-26 00:00:00',0,1,1,'����Ա','����Ա','2012-04-27 17:23:01','2012-04-27 14:50:32');
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_news` ENABLE KEYS */;

--
-- Table structure for table `model_news_history`
--

DROP TABLE IF EXISTS `model_news_history`;
CREATE TABLE `model_news_history` (
  `ID` int(11) NOT NULL auto_increment,
  `NEWS_ID` int(11) default NULL,
  `TITLE` varchar(255) default NULL COMMENT '����',
  `CONTENT` text COMMENT '����',
  `PATH` varchar(255) default NULL COMMENT '����ͼƬ·��',
  `SY_PATH` varchar(255) default NULL COMMENT '��ҳͼƬ��ʾ',
  `SOURCE` varchar(100) default NULL COMMENT '��Դ',
  `REPORTER` varchar(100) default NULL COMMENT 'ͨѶԱ',
  `CLICK` int(11) default NULL COMMENT '�����',
  `PUB_TIME` datetime default NULL,
  `TYPE` int(4) default NULL COMMENT '���ͣ� 1:����Ա����',
  `STATUS` int(4) default NULL COMMENT '״̬',
  `SEQUENCE` int(11) default NULL,
  `CREATOR` varchar(255) default NULL,
  `UPDATOR` varchar(255) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_news_history`
--


/*!40000 ALTER TABLE `model_news_history` DISABLE KEYS */;
LOCK TABLES `model_news_history` WRITE;
INSERT INTO `model_news_history` VALUES (2,1,'��֥������������','<html>    <head>        <title></title>    </head>    <body>        <p>2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�й����òο���','admin',128,'2012-04-26 00:00:00',0,1,1,'����Ա','����Ա','2012-04-26 14:47:49','2012-04-27 09:53:41'),(8,1,'��֥������������������-a��','<html>    <head>        <title></title>    </head>    <body>        <p>a-2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�Ϸ����б�','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-27 14:53:13','2012-04-27 14:50:32'),(4,1,'��֥�����������������ԣ�','<html>    <head>        <title></title>    </head>    <body>        <p>2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�Ϸ����б�','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-26 14:47:49','2012-04-27 11:41:25'),(7,1,'��֥�����������������ԣ�','<html>    <head>        <title></title>    </head>    <body>        <p>2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�Ϸ����б�','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-26 14:47:49','2012-04-27 14:24:42'),(9,1,'��֥������������','<html>    <head>        <title></title>    </head>    <body>        <p>2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�й����òο���','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-27 14:57:05','2012-04-27 09:53:41'),(10,1,'��֥������������-b','<html>    <head>        <title></title>    </head>    <body>        <p>b-2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�й����òο���','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-27 14:57:25','2012-04-27 14:57:05'),(11,1,'��֥������������','<html>    <head>        <title></title>    </head>    <body>        <p>2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�й����òο���','admin',128,'2012-04-26 00:00:00',0,1,1,'����Ա','����Ա','2012-04-27 14:58:49','2012-04-27 09:53:41'),(12,1,'��֥������������-b','<html>    <head>        <title></title>    </head>    <body>        <p>b-2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�й����òο���','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-27 14:59:06','2012-04-27 14:57:05'),(13,1,'��֥������������','<html>    <head>        <title></title>    </head>    <body>        <p>2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�й����òο���','admin',128,'2012-04-26 00:00:00',0,1,1,'����Ա','����Ա','2012-04-27 16:45:57','2012-04-27 09:53:41'),(14,1,'��֥������������-b','<html>    <head>        <title></title>    </head>    <body>        <p>b-2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�й����òο���','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-27 16:46:08','2012-04-27 14:57:05'),(15,1,'��֥������������-b','<html>    <head>        <title></title>    </head>    <body>        <p>b-2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�й����òο���','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-27 16:46:31','2012-04-27 14:57:05'),(16,1,'��֥������������-b','<html>    <head>        <title></title>    </head>    <body>        <p>b-2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�й����òο���','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-27 16:46:46','2012-04-27 14:57:05'),(17,1,'��֥������������','<html>    <head>        <title></title>    </head>    <body>        <p>2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�й����òο���','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-27 16:48:08','2012-04-27 09:53:41'),(18,1,'��֥������������������-a��','<html>    <head>        <title></title>    </head>    <body>        <p>a-2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�Ϸ����б�','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-27 16:48:29','2012-04-27 14:50:32'),(19,1,'��֥�����������������ԣ�','<html>    <head>        <title></title>    </head>    <body>        <p>2��20�գ��׽�˳�������������佱�����˳�����������У��㶫��֥ƾ���ѧ�Ĺ���ģʽ������ľ�Ӫ������������ӱ��������\'˳������������\'����100��Ԫ�ľ��ѽ�����</p>        <p align=\'center\'><img alt=\'\' width=\'433\' height=\'320\' src=\'/UserFiles/Image/News/pic_nw1.jpg\' /><br />        ˳��������������֥\'˳������������\'����</p>        <p>���������2011��9����������������ίԱ����֯��������������ѵ����ҵ�걨�����������ֳ�����͹���ල�����׶Σ���֥׿Խ���쵼�����˿��г�ϵͳ�������з�ϵͳ��������Դϵͳ����Ϣ����ϵͳ�ͳ�������ϵͳ��ר����������̵�ӡ������ƾ��׿Խ����������ˮƽ������ľ�Ӫ��Ч���֣����ڶ�˳��֪����ҵ����ӱ���������׽�\'˳������������\'��</p>        <p>��֥����������������ͳ������ƹ�������ҵ����ˮƽ�;�Ӫ��Ч�����Ȳ�������2011��ͻ����̷����ʴ�15PPM��������ͻ��3000��̨��ȫ���г�ռ���ʴ�26%���������ܶ��110��Ԫ�����۹�ģ����5����ҵ��һ����ҵ����������</p>    </body></html>','admin/uploadImage/News/20120426144749.jpg','admin/uploadImage/News/Sy/20120426144749.jpg','�Ϸ����б�','admin',128,'2012-04-26 00:00:00',0,0,1,'����Ա','����Ա','2012-04-27 17:23:01','2012-04-27 11:41:25'),(20,8,'hhhhhhhhhh','<html>    <head>        <title></title>    </head>    <body>        <p>hhhhhhhhhhhhhhhh</p>    </body></html>','admin/uploadImage/News/20120427180428.jpg','admin/uploadImage/News/Sy/20120427180428.jpg','hhhhhhh','hhhhhhhhh',0,'2012-04-27 00:00:00',0,1,1,'����Ա',NULL,'2012-04-27 18:04:47',NULL),(21,8,'hhhhhhhhhhhhhhhhhhhhhh','<html>    <head>        <title></title>    </head>    <body>        <p>hhhhhhhhhhhhhhhh</p>    </body></html>','admin/uploadImage/News/20120427180428.jpg','admin/uploadImage/News/Sy/20120427180428.jpg','hhhhhhh','hhhhhhhhh',0,'2012-04-27 00:00:00',0,1,1,'����Ա','����Ա','2012-04-27 18:05:11','2012-04-27 18:04:47'),(22,8,'jjjjjjjjjjjjjjjjjjjjjjjj','<html>    <head>        <title></title>    </head>    <body>        <p>mmmmmmmmmmmm</p>    </body></html>','admin/uploadImage/News/20120427180428.jpg','admin/uploadImage/News/Sy/20120427180428.jpg','hhhhhhh','hhhhhhhhh',0,'2012-04-27 00:00:00',0,1,1,'����Ա','����Ա','2012-04-27 18:05:31','2012-04-27 18:05:11');
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_news_history` ENABLE KEYS */;

--
-- Table structure for table `model_product`
--

DROP TABLE IF EXISTS `model_product`;
CREATE TABLE `model_product` (
  `ID` int(11) NOT NULL auto_increment,
  `CATEGORY_ID` int(11) default NULL,
  `NAME` varchar(100) default NULL,
  `CONTENT` text,
  `SMALL_IMAGE` varchar(100) default NULL,
  `BIG_IMAGE` varchar(100) default NULL,
  `INIT_PRICE` double default NULL,
  `NOW_PRICE` double default NULL,
  `DISCOUNT` int(4) default NULL,
  `SEQUENCE` int(11) default NULL,
  `REMARK` varchar(255) default NULL,
  `STATUS` int(4) default NULL,
  `CREATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATOR` varchar(100) default NULL,
  `UPDATE_TIME` datetime default NULL,
  `PUB_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_product`
--


/*!40000 ALTER TABLE `model_product` DISABLE KEYS */;
LOCK TABLES `model_product` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_product` ENABLE KEYS */;

--
-- Table structure for table `model_product_category`
--

DROP TABLE IF EXISTS `model_product_category`;
CREATE TABLE `model_product_category` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(100) default NULL,
  `REMARK` varchar(255) default NULL,
  `TYPE` int(4) default NULL COMMENT '����:',
  `STATUS` int(11) default NULL,
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_product_category`
--


/*!40000 ALTER TABLE `model_product_category` DISABLE KEYS */;
LOCK TABLES `model_product_category` WRITE;
INSERT INTO `model_product_category` VALUES (1,'����','������ע',NULL,1,'����Ա',NULL,'2012-05-08 11:03:16',NULL),(3,'��װ','��װ��ע',NULL,1,'����Ա',NULL,'2012-05-08 14:34:35',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_product_category` ENABLE KEYS */;

--
-- Table structure for table `model_product_history`
--

DROP TABLE IF EXISTS `model_product_history`;
CREATE TABLE `model_product_history` (
  `ID` int(11) NOT NULL default '0',
  `PRODUCT_ID` int(11) default NULL,
  `NAME` varchar(100) default NULL,
  `CONTENT` text,
  `SMALL_IMAGE` varchar(100) default NULL,
  `BIG_IMAGE` varchar(100) default NULL,
  `INIT_PRICE` double default NULL,
  `NOW_PRICE` double default NULL,
  `DISCOUNT` int(4) default NULL,
  `SEQUENCE` int(11) default NULL,
  `REMARK` varchar(255) default NULL,
  `STATUS` int(4) default NULL,
  `CREATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATOR` varchar(100) default NULL,
  `UPDATE_TIME` datetime default NULL,
  `PUB_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_product_history`
--


/*!40000 ALTER TABLE `model_product_history` DISABLE KEYS */;
LOCK TABLES `model_product_history` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_product_history` ENABLE KEYS */;

--
-- Table structure for table `model_video`
--

DROP TABLE IF EXISTS `model_video`;
CREATE TABLE `model_video` (
  `ID` int(11) NOT NULL auto_increment,
  `CATEGORY_ID` int(11) default NULL,
  `NAME` varchar(100) default NULL,
  `PATH` varchar(255) default NULL,
  `REMARK` varchar(255) default NULL,
  `STATUS` int(4) default NULL,
  `CREATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATOR` varchar(100) default NULL,
  `UPDATE_TIME` datetime default NULL,
  `PUB_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_video`
--


/*!40000 ALTER TABLE `model_video` DISABLE KEYS */;
LOCK TABLES `model_video` WRITE;
INSERT INTO `model_video` VALUES (23,13,'rrrr','admin/uploadFile/Video/20120503181144.avi','',0,'����Ա','2012-05-03 18:11:44',NULL,NULL,'2012-05-03 00:00:00'),(24,14,'test','admin/uploadFile/Video/20120503181233.avi','test',0,'����Ա','2012-05-03 18:12:33',NULL,NULL,'2012-05-03 00:00:00'),(25,14,'jjjjjjjjjjj','admin/uploadFile/Video/20120503183159.avi','ffffffffffffffffff',0,'����Ա','2012-05-03 18:32:00',NULL,NULL,'2012-05-03 00:00:00'),(22,13,'dddd','admin/uploadFile/Video/20120503181021.avi','',0,'����Ա','2012-05-03 18:10:21','����Ա','2012-05-07 09:58:04','2012-05-03 00:00:00');
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_video` ENABLE KEYS */;

--
-- Table structure for table `model_video_category`
--

DROP TABLE IF EXISTS `model_video_category`;
CREATE TABLE `model_video_category` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(100) default NULL,
  `TYPE` int(4) default NULL COMMENT '����:',
  `VOLUMN_COUNT` int(11) default NULL COMMENT '��Ƶ��',
  `REMARK` text,
  `STATUS` int(11) default NULL,
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_video_category`
--


/*!40000 ALTER TABLE `model_video_category` DISABLE KEYS */;
LOCK TABLES `model_video_category` WRITE;
INSERT INTO `model_video_category` VALUES (14,'test',NULL,19,'test',0,'����Ա','����Ա','2012-05-03 16:36:38','2012-05-04 10:05:47'),(22,'dddd-',NULL,11,'ddddd-',0,'����Ա','����Ա','2012-05-04 10:08:07','2012-05-04 10:13:07'),(13,'kkkk',NULL,11,'kkkk',1,'����Ա','����Ա','2012-05-03 15:49:28','2012-05-04 10:09:13');
UNLOCK TABLES;
/*!40000 ALTER TABLE `model_video_category` ENABLE KEYS */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL auto_increment,
  `CODE` varchar(255) default NULL,
  `NAME` varchar(255) default NULL,
  `TYPE` int(4) default NULL COMMENT '���ͣ� 1:����Ȩ�� 2:Ӣ��Ȩ�� 3:����Ȩ��',
  `SHOW_TYPE` int(4) default '0' COMMENT '��ʾ���ͣ�0��Ĭ����ʾ 1������ʾ(���½���˳�����)',
  `SEQUENCE` int(4) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  `CREATOR` varchar(100) default NULL,
  `UPDATOR` varchar(100) default NULL,
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--


/*!40000 ALTER TABLE `role` DISABLE KEYS */;
LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'/admin/adminLogin.do','��½����',1,1,0,'2012-03-23 16:27:51',NULL,'����Ա',NULL,'��½����'),(2,'/admin/adminLoginOut.do','�˳�����',1,1,0,'2012-03-23 16:27:51',NULL,'����Ա',NULL,'�˳�����'),(6,'/admin/auditModelNews.do','���������Ϣ',1,0,1,'2012-04-26 11:04:09','2012-04-27 14:09:52','����Ա','����Ա','���������Ϣ');
UNLOCK TABLES;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

