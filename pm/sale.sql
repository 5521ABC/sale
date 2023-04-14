/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.5.40 : Database - sale
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sale` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sale`;

/*Table structure for table `ylrc_account` */

DROP TABLE IF EXISTS `ylrc_account`;

CREATE TABLE `ylrc_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `balance` decimal(19,2) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `pw_pwd` varchar(32) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  `credit_score` int(2) NOT NULL,
  `address` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_aihhboidd3kwbhu1k1v5nli8b` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_account` */

insert  into `ylrc_account`(`id`,`create_time`,`update_time`,`balance`,`email`,`head_pic`,`mobile`,`password`,`pw_pwd`,`sex`,`status`,`username`,`credit_score`,`address`) values 
(1,'2023-01-27 18:12:51','2023-01-27 18:12:51',211100.00,'account1@qq.com','20210408/1617876141824.png','13823918026','123456',NULL,1,1,'刘佳成',100,'北京'),
(3,'2023-02-01 12:33:53','2023-02-01 12:33:53',0.00,'liujiacheng@smartbi.com.cn',NULL,'13279269385','123456',NULL,0,1,'测试数据',100,NULL),
(4,'2023-02-01 12:50:31','2023-02-01 12:50:31',0.00,'liu1018423804@163.com',NULL,'13279269385','123456',NULL,0,1,'18091378001',100,NULL),
(5,'2023-02-01 13:02:38','2023-02-01 13:02:38',0.00,'liujiacheng@smartbi.com.cn',NULL,'13279269385','123456',NULL,0,1,'测试用户',100,NULL),
(6,'2023-02-01 13:04:17','2023-02-01 13:04:17',0.00,'liu1018423804@163.com',NULL,'13279269385','123456',NULL,0,1,'ssadasd',100,NULL),
(7,'2023-02-01 13:10:33','2023-02-01 13:10:33',0.00,'liu1018423804@163.com',NULL,'13279269385','123456',NULL,0,1,'测试用户103',100,NULL),
(8,'2023-02-01 13:12:39','2023-02-01 13:12:39',0.00,'liu1018423804@163.com',NULL,'13279269385','123456',NULL,0,1,'admin221',100,NULL),
(9,'2023-02-01 13:13:13','2023-02-01 13:13:13',0.00,'liu1018423804@163.com',NULL,'13279269385','123456',NULL,0,1,'1313',100,NULL),
(10,'2023-02-01 13:15:42','2023-02-01 13:15:42',0.00,'liujiacheng@smartbi.com.cn',NULL,'13279269385','123456',NULL,0,1,'sadsad',100,NULL),
(11,'2023-02-01 13:17:48','2023-02-01 13:17:48',0.00,'liu1018423804@163.com',NULL,'13279269385','123456',NULL,0,1,'asdasd',100,NULL),
(12,'2023-02-01 13:21:47','2023-02-01 13:21:47',0.00,'liujiacheng@smartbi.com.cn',NULL,'13279269385','123456',NULL,0,1,'asdadffff',100,NULL);

/*Table structure for table `ylrc_bidd_project` */

DROP TABLE IF EXISTS `ylrc_bidd_project`;

CREATE TABLE `ylrc_bidd_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `address` varchar(32) NOT NULL,
  `applicants_number` int(11) DEFAULT NULL,
  `auction_times` int(11) DEFAULT NULL,
  `bidding_end_time` datetime DEFAULT NULL,
  `biddind_start_time` datetime DEFAULT NULL,
  `credit` int(5) DEFAULT NULL,
  `describes` longtext,
  `end_time` datetime DEFAULT NULL,
  `name` varchar(18) NOT NULL,
  `payment_method` varchar(10) DEFAULT NULL,
  `picture` varchar(512) NOT NULL,
  `project_number` varchar(255) DEFAULT NULL,
  `project_status` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `start_price` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `transaction_price` int(11) DEFAULT NULL,
  `home_account_id` bigint(20) DEFAULT NULL,
  `organization` bigint(20) DEFAULT NULL,
  `home_project_category` bigint(20) DEFAULT NULL,
  `reason` varchar(32) DEFAULT NULL,
  `rate` double(3,1) DEFAULT NULL,
  `views_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKskoukp93c447w04x2fx52enyg` (`home_account_id`) USING BTREE,
  KEY `FK5l0imkehnbgnbhgiir2hnmh97` (`organization`) USING BTREE,
  KEY `FK3jqrd0uu1una55o7vl84r98n2` (`home_project_category`) USING BTREE,
  CONSTRAINT `FK3jqrd0uu1una55o7vl84r98n2` FOREIGN KEY (`home_project_category`) REFERENCES `ylrc_project_category` (`id`),
  CONSTRAINT `FK5l0imkehnbgnbhgiir2hnmh97` FOREIGN KEY (`organization`) REFERENCES `ylrc_organization` (`id`),
  CONSTRAINT `FKskoukp93c447w04x2fx52enyg` FOREIGN KEY (`home_account_id`) REFERENCES `ylrc_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_bidd_project` */

insert  into `ylrc_bidd_project`(`id`,`create_time`,`update_time`,`address`,`applicants_number`,`auction_times`,`bidding_end_time`,`biddind_start_time`,`credit`,`describes`,`end_time`,`name`,`payment_method`,`picture`,`project_number`,`project_status`,`quantity`,`start_price`,`start_time`,`transaction_price`,`home_account_id`,`organization`,`home_project_category`,`reason`,`rate`,`views_number`) values 
(1,'2023-01-27 18:21:43','2023-02-01 12:12:06','上海市浦东新区康桥',1,0,'2023-12-14 15:55:00','2023-03-08 14:55:00',90,'<p>\r\n	品牌：小王保修：店铺保修品牌产地：中国价格范围：100-200材质：其他 茶壶（英文：teapot），是一种泡茶和<atarget=\"_blank\"href=\"https:baike.baidu.com=\" \"item=\"\" %e6%96%9f%e8%8c%b6=\"\" 9149914\"=\"\">斟茶用的带嘴器皿。它是<atarget=\"_blank\"href=\"https:baike.baidu.com=\" \"item=\"\" %e8%8c%b6%e5%85%b7=\"\" 631\"=\"\">茶具的一种，主要用来<atarget=\"_blank\"href=\"https:baike.baidu.com=\" \"item=\"\" %e6%b3%a1%e8%8c%b6=\"\" 1680983\"=\"\">泡茶。</atarget=\"_blank\"href=\"https:baike.baidu.com=\"></atarget=\"_blank\"href=\"https:baike.baidu.com=\"></atarget=\"_blank\"href=\"https:baike.baidu.com=\">\r\n</p>','2023-02-01 18:55:00','老式茶壶','线下交易','20210401/1617247419267.jpg','xmAA3C1CC1139E4EB8',1,1,150,'2023-02-01 14:25:00',0,NULL,1,4,'',0.0,4),
(6,'2023-01-27 18:26:55','2023-02-01 12:12:03','广东泰国',1,0,'2023-12-06 10:50:00','2023-02-22 18:30:00',80,'<p>\r\n	<span>品牌:&nbsp;GEEKWEI/极客微型号:&nbsp;HW156FGTB屏幕尺寸:&nbsp;13.3英寸&nbsp;15英寸</span>屏幕比例:&nbsp;16:9接口类型:&nbsp;HDMI面板类型:&nbsp;IPS平均亮度:&nbsp;300cd/㎡分辨率:&nbsp;1920x1080颜色分类:&nbsp;无线触控便携幕&nbsp;新款15.6英寸无线触控全屏幕是否触摸屏:&nbsp;触摸屏附加功能:&nbsp;内置音箱&nbsp;HDR&nbsp;无线投屏&nbsp;可壁挂刷新率:&nbsp;60Hz是否内置电池:&nbsp;内置电池\r\n</p>\r\n<p>\r\n	<imgsrc=\"photo=\" \"view?filename=\"/20210401/1617272801131.jpg\" \"alt=\"\"></imgsrc=\"photo=\">\r\n</p>','2023-02-18 15:55:00','极客微无线显示器','支付宝','20210401/1617272664693.jpg;20210401/1617272669235.jpg;20210401/1617272671809.jpg','xm0D3B18E3C1344848',1,10,1500,'2023-02-10 11:55:00',0,NULL,1,2,'',0.0,12),
(7,'2023-01-27 18:50:22','2023-02-01 12:11:59','上海市浦东新区',1,6,'2023-12-06 10:50:00','2023-02-16 18:50:00',100,'<p>\r\n	产品名称：MLOONG/名龙堂IntelZ37...品牌:&nbsp;MLOONG/名龙堂内存容量:&nbsp;16GB硬盘容量:&nbsp;配置一电源功率:&nbsp;600W显存容量:&nbsp;11GB主板结构:&nbsp;Mini-ITX光驱类型:&nbsp;无光驱生产企业:&nbsp;名龙堂电源80PLUS认证:&nbsp;金牌显卡系列:&nbsp;RTX2080Ti散热方式:&nbsp;水冷硬盘类型:&nbsp;固态硬盘(SSD)CPU系列:&nbsp;Intel/英特尔酷睿i9主板芯片组类型:&nbsp;IntelZ370保修期:&nbsp;36个月CPU型号:&nbsp;i9-9900K显卡芯片品牌:&nbsp;NVIDIA/英伟达\r\n</p>\r\n<p>\r\n	<imgsrc=\"photo=\" \"view?filename=\"/20210401/1617274221511.jpg\" \"alt=\"\"></imgsrc=\"photo=\">\r\n</p>','2023-02-16 18:35:00','空天母舰电脑','支付宝','20210401/1617274053620.jpg;20210401/1617274055452.jpg;20210401/1617274058041.jpg','xmB4F37801DF754DA0',1,0,5000,'2023-02-16 15:55:00',0,NULL,1,2,'',5.0,232),
(8,'2023-01-27 09:52:15','2023-02-01 12:02:01','上海市浦东新区',1,2,'2023-12-06 14:30:00','2023-08-10 15:55:00',100,'<p>\r\n	内饰设计以饱满的结构，丰富的细节，呈现出十足科技感。以驾驶者为中心的沉浸式驾驶舱设计，带来如同跑车般的驾驶感受。基于第三代i-GMP平台的车身布局展现出超越级别的宽敞空间，更大的后备箱空间，保证了驾乘的舒适性和实用性。<strong>Hyundai</strong>SmartSense智心合一安全系统，集成多达23项安全/辅助配置，以领先的智能科技确保驾乘人员出行更加轻松、安全。\r\n</p>\r\n<p>\r\n	<imgsrc=\" photo=\"\" view?filename=\"/20210412/1618192331114.png&quot;\" alt=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</imgsrc=\">\r\n</p>','2023-08-10 15:35:00','北京现代新伊兰特','线下交易','20210412/1618192119455.png','xm0004A95CE5C742CD',8,2,50000,'2023-02-03 07:35:00',0,NULL,1,3,NULL,5.0,199),
(10,'2023-01-27 12:12:49','2023-02-01 12:12:10','上海市浦东新区',0,0,'2023-04-06 15:50:00','2023-02-03 07:35:00',100,'精品奶牛<img src=\"/photo/view?filename=/20210412/1618240332565.jpeg\" alt=\"\" />','2023-02-03 06:30:00','母牛','私下交易','20210412/1618240262751.jpeg','xmB969EA2E28C343EA',1,1,5000,'2023-02-02 10:30:00',0,NULL,1,4,'',0.0,1);

/*Table structure for table `ylrc_bidd_record` */

DROP TABLE IF EXISTS `ylrc_bidd_record`;

CREATE TABLE `ylrc_bidd_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `bid` int(11) DEFAULT NULL,
  `bidding_status` int(11) DEFAULT NULL,
  `pay_status` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `bidding_project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKtk5rdmwx9onbmy5vkp2xd2isu` (`account_id`) USING BTREE,
  KEY `FK8vm9j86knj9jbons4e8qk2t2g` (`bidding_project_id`) USING BTREE,
  CONSTRAINT `FK8vm9j86knj9jbons4e8qk2t2g` FOREIGN KEY (`bidding_project_id`) REFERENCES `ylrc_bidd_project` (`id`),
  CONSTRAINT `FKtk5rdmwx9onbmy5vkp2xd2isu` FOREIGN KEY (`account_id`) REFERENCES `ylrc_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_bidd_record` */

insert  into `ylrc_bidd_record`(`id`,`create_time`,`update_time`,`bid`,`bidding_status`,`pay_status`,`quantity`,`account_id`,`bidding_project_id`) values 
(1,'2023-01-27 15:42:14','2023-01-27 15:42:14',5000,0,2,1,1,7),
(2,'2023-01-20 15:47:46','2023-01-20 15:47:46',6000,0,2,1,1,7),
(3,'2023-01-27 14:53:58','2023-01-27 14:53:58',5000,0,2,1,1,7),
(4,'2023-01-27 14:54:12','2023-01-27 14:54:12',5000,0,2,1,1,7),
(5,'2023-01-27 14:54:21','2023-01-27 14:54:21',8000,0,2,1,1,7),
(6,'2023-01-27 15:18:46','2023-01-27 15:18:46',10000,3,1,1,1,7),
(7,'2023-01-27 10:44:01','2023-01-27 10:44:01',62000,0,2,3,1,8),
(8,'2023-01-27 10:44:10','2023-01-27 10:44:10',100000,3,1,1,1,8);

/*Table structure for table `ylrc_bidding_apply` */

DROP TABLE IF EXISTS `ylrc_bidding_apply`;

CREATE TABLE `ylrc_bidding_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `bidding_project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKsiuowytk73u2mot7ph5sci5ri` (`account_id`) USING BTREE,
  KEY `FKim5s61kd19a2hbj4clm4l75eo` (`bidding_project_id`) USING BTREE,
  CONSTRAINT `FKim5s61kd19a2hbj4clm4l75eo` FOREIGN KEY (`bidding_project_id`) REFERENCES `ylrc_bidd_project` (`id`),
  CONSTRAINT `FKsiuowytk73u2mot7ph5sci5ri` FOREIGN KEY (`account_id`) REFERENCES `ylrc_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_bidding_apply` */

insert  into `ylrc_bidding_apply`(`id`,`create_time`,`update_time`,`account_id`,`bidding_project_id`) values 
(1,'2021-04-06 15:58:14','2021-04-06 15:58:14',1,7),
(2,'2021-04-08 11:43:05','2021-04-08 11:43:05',1,6),
(3,'2021-04-08 13:55:27','2021-04-08 13:55:27',1,1),
(4,'2021-04-12 10:21:02','2021-04-12 10:21:02',1,8);

/*Table structure for table `ylrc_database_bak` */

DROP TABLE IF EXISTS `ylrc_database_bak`;

CREATE TABLE `ylrc_database_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filepath` varchar(500) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_database_bak` */

insert  into `ylrc_database_bak`(`id`,`create_time`,`update_time`,`filename`,`filepath`) values 
(10,'2020-03-22 19:36:47','2020-03-22 19:36:47','db_boot_base_20200322193647.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(11,'2020-03-22 19:37:54','2020-03-22 19:37:54','db_boot_base_20200322193754.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(12,'2020-03-22 19:40:04','2020-03-22 19:40:04','db_boot_base_20200322194004.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(14,'2020-03-22 19:40:14','2020-03-22 19:40:14','db_boot_base_20200322194014.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(15,'2020-03-22 19:40:19','2020-03-22 19:40:19','db_boot_base_20200322194019.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(17,'2020-03-22 19:43:34','2020-03-22 19:43:34','db_boot_base_20200322194334.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(18,'2020-03-22 19:43:39','2020-03-22 19:43:39','db_boot_base_20200322194339.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(20,'2020-03-22 19:43:49','2020-03-22 19:43:49','db_boot_base_20200322194349.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(21,'2020-03-22 19:43:54','2020-03-22 19:43:54','db_boot_base_20200322194354.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(22,'2020-03-22 19:43:59','2020-03-22 19:43:59','db_boot_base_20200322194359.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(23,'2020-03-22 19:44:04','2020-03-22 19:44:04','db_boot_base_20200322194404.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(24,'2020-03-22 19:44:09','2020-03-22 19:44:09','db_boot_base_20200322194409.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(25,'2020-03-22 19:44:14','2020-03-22 19:44:14','db_boot_base_20200322194414.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(26,'2020-03-22 19:44:19','2020-03-22 19:44:19','db_boot_base_20200322194419.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(27,'2020-03-22 19:44:24','2020-03-22 19:44:24','db_boot_base_20200322194424.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(28,'2020-03-22 19:44:29','2020-03-22 19:44:29','db_boot_base_20200322194429.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(29,'2020-03-22 19:44:34','2020-03-22 19:44:34','db_boot_base_20200322194434.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(30,'2020-03-22 19:44:39','2020-03-22 19:44:39','db_boot_base_20200322194439.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),
(31,'2020-03-23 17:46:49','2020-03-23 17:46:49','db_boot_base_20200323174649.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/');

/*Table structure for table `ylrc_evaluate` */

DROP TABLE IF EXISTS `ylrc_evaluate`;

CREATE TABLE `ylrc_evaluate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` longtext,
  `rate` int(11) DEFAULT NULL,
  `reply` longtext,
  `account_id` bigint(20) DEFAULT NULL,
  `bidding_project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKe7x5xn8mai360j2wwqmvg1ihc` (`account_id`) USING BTREE,
  KEY `FK8qsis5kr39n7mt5qei3ki4p9w` (`bidding_project_id`) USING BTREE,
  CONSTRAINT `FK8qsis5kr39n7mt5qei3ki4p9w` FOREIGN KEY (`bidding_project_id`) REFERENCES `ylrc_bidd_project` (`id`),
  CONSTRAINT `FKe7x5xn8mai360j2wwqmvg1ihc` FOREIGN KEY (`account_id`) REFERENCES `ylrc_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_evaluate` */

insert  into `ylrc_evaluate`(`id`,`create_time`,`update_time`,`content`,`rate`,`reply`,`account_id`,`bidding_project_id`) values 
(2,'2023-01-29 18:19:55','2023-01-29 18:19:55','很值！',5,'我们会加油的！',1,7),
(3,'2023-01-28 10:49:39','2023-01-28 10:49:39','很值得购买',5,NULL,1,8);

/*Table structure for table `ylrc_menu` */

DROP TABLE IF EXISTS `ylrc_menu`;

CREATE TABLE `ylrc_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_bitton` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKsbtnjocfrq29e8taxdwo21gic` (`parent_id`) USING BTREE,
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_menu` */

insert  into `ylrc_menu`(`id`,`create_time`,`update_time`,`name`,`url`,`icon`,`sort`,`parent_id`,`is_bitton`,`is_show`) values 
(2,'2020-03-14 14:26:03','2020-03-14 18:24:53','系统设置','','mdi-settings',0,NULL,'\0',''),
(3,'2020-03-14 16:58:55','2020-12-31 10:33:52','菜单管理','/admin/menu/list','mdi-view-list',1,2,'\0',''),
(5,'2020-03-14 17:04:44','2020-12-31 10:33:27','新增','/admin/menu/add','mdi-plus',2,3,'\0',''),
(7,'2020-03-14 17:07:43','2020-12-31 10:34:15','角色管理','/admin/role/list','mdi-account-settings-variant',5,2,'\0',''),
(8,'2020-03-14 18:28:48','2020-12-31 10:33:59','编辑','edit(\'/admin/menu/edit\')','mdi-grease-pencil',3,3,'',''),
(9,'2020-03-14 18:30:00','2020-12-31 10:34:07','删除','del(\'/admin/menu/delete\')','mdi-close',4,3,'',''),
(10,'2020-03-15 12:12:00','2020-12-31 10:34:25','添加','/admin/role/add','mdi-account-plus',6,7,'\0',''),
(11,'2020-03-15 12:12:36','2020-12-31 10:34:35','编辑','edit(\'/admin/role/edit\')','mdi-account-edit',7,7,'',''),
(12,'2020-03-15 12:13:19','2020-12-31 10:34:45','删除','del(\'/admin/role/delete\')','mdi-account-remove',8,7,'',''),
(13,'2020-03-15 12:14:52','2020-12-31 10:34:54','用户管理','/admin/user/list','mdi-account-multiple',9,2,'\0',''),
(14,'2020-03-15 12:15:22','2020-12-31 10:35:01','添加','/admin/user/add','mdi-account-plus',10,13,'\0',''),
(15,'2020-03-16 17:18:14','2020-12-31 10:35:10','编辑','edit(\'/admin/user/edit\')','mdi-account-edit',11,13,'',''),
(16,'2020-03-16 17:19:01','2020-12-31 10:35:19','删除','del(\'/admin/user/delete\')','mdi-account-remove',12,13,'',''),
(19,'2020-03-22 11:24:36','2020-03-22 11:26:00','上传图片','/upload/upload_photo','mdi-arrow-up-bold-circle',0,13,'\0','\0'),
(20,'2020-03-22 14:09:35','2020-03-22 14:09:47','日志管理','/system/operator_log_list','mdi-tag-multiple',13,2,'\0',''),
(21,'2020-03-22 14:11:39','2020-03-22 14:11:39','删除','del(\'/system/delete_operator_log\')','mdi-tag-remove',14,20,'',''),
(22,'2020-03-22 14:12:57','2020-03-22 14:46:55','清空日志','delAll(\'/system/delete_all_operator_log\')','mdi-delete-circle',15,20,'',''),
(27,'2021-03-29 09:21:24','2021-03-29 09:21:32','竞拍管理','','mdi-blender',20,NULL,'\0',''),
(28,'2021-03-29 09:22:48','2021-03-29 09:38:35','前台用户管理','/admin/account/list','mdi-account',21,27,'\0',''),
(29,'2021-03-29 09:23:55','2021-03-29 09:38:43','添加','/admin/account/add','mdi-plus',22,28,'\0',''),
(30,'2021-03-29 09:24:55','2021-03-29 09:38:51','编辑','edit(\'/admin/account/edit\')','mdi-minus',23,28,'',''),
(31,'2021-03-29 09:26:57','2021-03-29 09:38:58','删除','del(\'/admin/account/delete\')','mdi-close',24,28,'',''),
(32,'2021-03-29 16:21:58','2021-03-30 10:26:54','商品列表','/admin/project/list','mdi-lightbulb',25,27,'\0',''),
(33,'2021-03-29 16:22:19','2021-03-30 10:27:01','添加','/admin/project/add','mdi-plus',26,32,'\0',''),
(34,'2021-03-29 16:22:54','2021-03-30 10:27:09','编辑','edit(\'/admin/project/edit\')','mdi-minus',27,32,'',''),
(35,'2021-03-29 16:23:47','2021-03-30 10:27:18','删除','del(\'/admin/project/delete\')','mdi-close',28,32,'',''),
(36,'2021-03-29 18:46:57','2021-03-30 10:25:35','商品分类','/admin/project_category/list','mdi-credit-card-multiple',29,27,'\0',''),
(37,'2021-03-29 18:48:01','2021-03-29 18:48:10','添加','/admin/project_category/add','mdi-plus',30,36,'\0',''),
(38,'2021-03-29 18:48:45','2021-03-29 18:48:45','编辑','edit(\'/admin/project_category/edit\')','mdi-minus',31,36,'',''),
(39,'2021-03-29 18:49:22','2021-03-29 18:49:29','删除','del(\'/admin/project_category/delete\')','mdi-close',32,36,'',''),
(40,'2021-03-30 16:45:29','2021-03-30 17:08:00','拍卖者列表','/admin/organization/list','mdi-human-greeting',33,27,'\0',''),
(41,'2021-03-30 16:47:24','2021-03-30 17:20:25','更改状态','/admin/organization/examine','mdi-clock-out',34,40,'\0','\0'),
(42,'2021-03-31 09:45:51','2021-03-31 09:45:51','个人信息','/admin/organization/info','mdi-account-box-outline',36,27,'\0','\0'),
(43,'2021-04-01 11:36:04','2021-04-01 11:36:19','查看详情','viewProject(\'/admin/project/project_detail\')','mdi-message-text',37,32,'',''),
(44,'2021-04-01 14:38:46','2021-04-01 14:38:57','通过','approved(\'/admin/project/examine?type=true\')','mdi-check',38,32,'',''),
(45,'2021-04-01 14:39:48','2021-04-01 14:39:48','拒绝','approved(\'/admin/project/examine?type=false\')','mdi-window-close',39,32,'',''),
(46,'2021-04-01 15:44:37','2021-04-01 15:44:45','上下架','/admin/project/load_and_unload','mdi-cursor-pointer',40,32,'\0','\0'),
(47,'2021-04-01 16:18:00','2021-04-01 16:18:13','忘记密码','/admin/organization/forget_password','mdi-exclamation',41,40,'\0','\0'),
(48,'2021-04-09 11:43:57','2021-04-09 11:44:10','商品竞价列表','/admin/bidding_record/list','mdi-grid',42,27,'\0',''),
(49,'2021-04-09 14:17:49','2021-04-09 14:19:42','商品竞价记录列表','/admin/bidding_record/record_list','mdi-tab',43,48,'','\0'),
(50,'2021-04-09 14:55:41','2021-04-09 14:55:41','确认交易','/admin/bidding_record/transaction','mdi-check',44,48,'\0','\0'),
(51,'2021-04-09 18:48:06','2021-04-09 18:48:06','确认逾期','/admin/bidding_record/overdue','mdi-eraser-variant',46,48,'\0','\0'),
(52,'2021-04-10 18:36:25','2021-04-10 18:49:53','查看评论','viewRaty(\'/admin/project/view_raty\')','mdi-gesture-tap',47,32,'','');

/*Table structure for table `ylrc_operater_log` */

DROP TABLE IF EXISTS `ylrc_operater_log`;

CREATE TABLE `ylrc_operater_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `operator` varchar(18) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_operater_log` */

insert  into `ylrc_operater_log`(`id`,`create_time`,`update_time`,`content`,`operator`) values 
(696,'2023-02-01 12:14:59','2023-02-01 12:14:59','用户【超级管理员小刘】于【2023-02-01 12:14:59】登录系统！','超级管理员小刘'),
(697,'2023-02-01 12:21:46','2023-02-01 12:21:46','用户【超级管理员小刘】于【2023-02-01 12:21:46】登录系统！','超级管理员小刘'),
(698,'2023-02-01 12:23:58','2023-02-01 12:23:58','拍卖者【安康学院小刘小卖部】于【2023-02-01 12:23:58】登录系统！','未知(获取登录用户失败)'),
(699,'2023-02-01 12:31:21','2023-02-01 12:31:21','拍卖者【安康学院小刘小卖部】于【2023-02-01 12:31:21】登录系统！','未知(获取登录用户失败)'),
(700,'2023-02-01 12:32:10','2023-02-01 12:32:10','用户【超级管理员小刘】于【2023-02-01 12:32:10】登录系统！','超级管理员小刘'),
(701,'2023-02-01 12:32:27','2023-02-01 12:32:27','删除用户，用户ID：2','超级管理员小刘'),
(702,'2023-02-01 12:33:53','2023-02-01 12:33:53','注册用户成功，用户名：测试数据','未知(获取登录用户失败)'),
(703,'2023-02-01 12:34:22','2023-02-01 12:34:22','用户【超级管理员小刘】于【2023-02-01 12:34:22】登录系统！','超级管理员小刘'),
(704,'2023-02-01 12:36:45','2023-02-01 12:36:45','添加用户，用户名：普通管理员','超级管理员小刘'),
(705,'2023-02-01 12:37:07','2023-02-01 12:37:07','用户【普通管理员】于【2023-02-01 12:37:07】登录系统！','普通管理员'),
(706,'2023-02-01 12:37:19','2023-02-01 12:37:19','删除用户，用户ID：1','普通管理员'),
(707,'2023-02-01 12:40:30','2023-02-01 12:40:30','用户【超级普通管理员小刘】于【2023-02-01 12:40:30】登录系统！','超级普通管理员小刘'),
(708,'2023-02-01 12:42:35','2023-02-01 12:42:35','添加用户，用户名：普通管理员','超级普通管理员小刘'),
(709,'2023-02-01 12:43:13','2023-02-01 12:43:13','编辑用户，用户名：超级普通管理员小刘','超级普通管理员小刘'),
(710,'2023-02-01 12:48:23','2023-02-01 12:48:23','用户【超级管理员小刘】于【2023-02-01 12:48:22】登录系统！','超级管理员小刘'),
(711,'2023-02-01 12:49:57','2023-02-01 12:49:57','用户【超级管理员小刘】于【2023-02-01 12:49:57】登录系统！','超级管理员小刘'),
(712,'2023-02-01 12:50:31','2023-02-01 12:50:31','注册用户成功，用户名：18091378001','未知(获取登录用户失败)'),
(713,'2023-02-01 12:50:54','2023-02-01 12:50:54','用户【超级管理员小刘】于【2023-02-01 12:50:54】登录系统！','超级管理员小刘'),
(714,'2023-02-01 13:02:38','2023-02-01 13:02:38','注册用户成功，用户名：测试用户','未知(获取登录用户失败)'),
(715,'2023-02-01 13:10:04','2023-02-01 13:10:04','注册用户成功，用户名：ssadasd','未知(获取登录用户失败)'),
(716,'2023-02-01 13:10:35','2023-02-01 13:10:35','注册用户成功，用户名：测试用户103','未知(获取登录用户失败)'),
(717,'2023-02-01 13:11:21','2023-02-01 13:11:21','用户【超级管理员小刘】于【2023-02-01 13:11:01】登录系统！','超级管理员小刘'),
(718,'2023-02-01 13:13:00','2023-02-01 13:13:00','注册用户成功，用户名：admin221','未知(获取登录用户失败)'),
(719,'2023-02-01 13:15:15','2023-02-01 13:15:15','注册用户成功，用户名：1313','未知(获取登录用户失败)'),
(720,'2023-02-01 13:17:16','2023-02-01 13:17:16','注册用户成功，用户名：sadsad','未知(获取登录用户失败)'),
(721,'2023-02-01 13:21:23','2023-02-01 13:21:23','注册用户成功，用户名：asdasd','未知(获取登录用户失败)'),
(722,'2023-02-01 13:22:00','2023-02-01 13:22:00','注册用户成功，用户名：asdadffff','游客登录：asdadffff'),
(723,'2023-02-01 13:22:36','2023-02-01 13:22:36','用户【超级管理员小刘】于【2023-02-01 13:22:33】登录系统！','超级管理员小刘'),
(724,'2023-02-01 13:36:18','2023-02-01 13:36:18','用户【超级管理员小刘】于【2023-02-01 13:36:18】登录系统！','超级管理员小刘'),
(725,'2023-02-01 13:37:58','2023-02-01 13:37:58','用户【超级管理员小刘】于【2023-02-01 13:37:58】登录系统！','超级管理员小刘'),
(726,'2023-02-01 13:40:25','2023-02-01 13:40:25','用户【超级管理员小刘】于【2023-02-01 13:40:25】登录系统！','超级管理员小刘'),
(727,'2023-02-01 13:57:28','2023-02-01 13:57:28','用户【超级管理员小刘】于【2023-02-01 13:57:28】登录系统！','超级管理员小刘'),
(728,'2023-02-01 14:07:12','2023-02-01 14:07:12','用户【超级管理员小刘】于【2023-02-01 14:07:12】登录系统！','超级管理员小刘'),
(729,'2023-02-01 14:13:54','2023-02-01 14:13:54','用户【超级管理员小刘】于【2023-02-01 14:13:54】登录系统！','超级管理员小刘'),
(730,'2023-02-01 14:24:51','2023-02-01 14:24:51','拍卖者【刘佳成123】于【2023-02-01 14:24:37】登录系统！','拍卖者'),
(731,'2023-02-01 14:35:20','2023-02-01 14:35:20','拍卖者【刘佳成123】于【2023-02-01 14:35:17】登录系统！','超级管理员小刘'),
(732,'2023-02-01 14:38:54','2023-02-01 14:38:54','用户【超级管理员小刘】于【2023-02-01 14:38:47】登录系统！','超级管理员小刘');

/*Table structure for table `ylrc_order_auth` */

DROP TABLE IF EXISTS `ylrc_order_auth`;

CREATE TABLE `ylrc_order_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `mac` varchar(32) DEFAULT NULL,
  `order_sn` varchar(18) NOT NULL,
  `phone` varchar(12) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_order_auth` */

/*Table structure for table `ylrc_organization` */

DROP TABLE IF EXISTS `ylrc_organization`;

CREATE TABLE `ylrc_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `audit_status` int(11) DEFAULT NULL,
  `balance` decimal(19,2) DEFAULT NULL,
  `card_img` varchar(255) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `legal_person` varchar(255) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `name` varchar(18) NOT NULL,
  `not_pass_reason` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `trading_img` varchar(255) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `rate` double(3,0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_qsd18kti2br1mln4am3bhml92` (`name`) USING BTREE,
  KEY `FK4jtwnf0ays4f3vu5a10t56ndb` (`role_id`) USING BTREE,
  CONSTRAINT `FK4jtwnf0ays4f3vu5a10t56ndb` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_organization` */

insert  into `ylrc_organization`(`id`,`create_time`,`update_time`,`audit_status`,`balance`,`card_img`,`email`,`head_pic`,`legal_person`,`mobile`,`name`,`not_pass_reason`,`password`,`sex`,`trading_img`,`role_id`,`address`,`rate`) values 
(1,'2023-01-26 16:20:41','2023-01-26 16:20:41',3,0.00,'20210330/1617092327436.jpg;20210330/1617092329297.jpg','123456@qq.com','20210331/1617174576779.jpg','刘佳成','13823918026','安康学院小刘小卖部',NULL,'123456',1,'20210330/1617092320626.jpg',5,'上海市康桥集团',5),
(2,'2023-02-01 12:49:43','2023-02-01 14:07:33',4,0.00,'20230201/1675226976714.png;20230201/1675226982465.png','liu1018423804@163.com',NULL,'刘佳成小哥哥','13279269385','刘佳成拍卖者','','123456',0,'20230201/1675226942776.png',NULL,'安康学院',NULL),
(3,'2023-02-01 13:40:12','2023-02-01 14:07:45',4,0.00,'20230201/1675229980083.png;20230201/1675229983786.png','liu1018423874@163.com',NULL,'刘佳成小哥哥','13279269375','刘佳成拍卖者2','','123456',0,'20230201/1675229974931.png',5,'安康学院',NULL),
(4,'2023-02-01 14:12:58','2023-02-01 14:25:27',3,0.00,'20230201/1675231941675.png;20230201/1675231945014.png','liujiacheng@smarsbi.com.cn','20230201/1675232724607.png','安康学院','13201539871','刘佳成123',NULL,'123456',0,'20230201/1675231934603.png',5,'广东省/广州市',NULL);

/*Table structure for table `ylrc_project_category` */

DROP TABLE IF EXISTS `ylrc_project_category`;

CREATE TABLE `ylrc_project_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(32) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_project_category` */

insert  into `ylrc_project_category`(`id`,`create_time`,`update_time`,`name`,`status`) values 
(1,'2023-01-26 11:28:34','2021-03-30 11:34:12','首饰品',0),
(2,'2023-01-26 11:30:24','2021-03-30 11:30:24','电子产品',0),
(3,'2023-01-26 11:30:34','2021-03-30 11:30:34','车',0),
(4,'2023-01-26 11:30:46','2021-03-30 11:30:46','日用品',0),
(6,'2023-01-26 11:35:23','2021-03-30 11:35:23','电脑',0),
(7,'2023-01-26 14:17:34','2021-03-30 14:17:51','生活用品',1),
(8,'2023-01-26 10:29:34','2021-04-02 10:29:34','化妆品',0),
(9,'2023-01-26 10:29:48','2021-04-02 10:29:48','男士服装',0);

/*Table structure for table `ylrc_recharge_record` */

DROP TABLE IF EXISTS `ylrc_recharge_record`;

CREATE TABLE `ylrc_recharge_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `money` int(11) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKo495iix2cwreutrbfctkgvja4` (`account_id`) USING BTREE,
  CONSTRAINT `FKo495iix2cwreutrbfctkgvja4` FOREIGN KEY (`account_id`) REFERENCES `ylrc_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_recharge_record` */

insert  into `ylrc_recharge_record`(`id`,`create_time`,`update_time`,`money`,`account_id`) values 
(1,'2021-04-09 17:24:54','2021-04-09 17:24:54',100,1),
(5,'2021-04-09 17:49:35','2021-04-09 17:49:35',100,1),
(6,'2021-04-09 17:50:45','2021-04-09 17:50:45',100,1),
(7,'2021-04-10 16:12:03','2021-04-10 16:12:03',20000,1),
(8,'2021-04-12 10:49:18','2021-04-12 10:49:18',100000,1),
(9,'2021-10-20 11:07:06','2021-10-20 11:07:06',100,1),
(10,'2023-02-01 12:27:19','2023-02-01 12:27:19',100000,1),
(11,'2023-02-01 12:27:24','2023-02-01 12:27:24',100000,1),
(12,'2023-02-01 12:27:26','2023-02-01 12:27:26',100,1),
(13,'2023-02-01 12:27:29','2023-02-01 12:27:29',100,1),
(14,'2023-02-01 12:27:31','2023-02-01 12:27:31',100,1),
(15,'2023-02-01 12:27:32','2023-02-01 12:27:32',100,1),
(16,'2023-02-01 12:27:33','2023-02-01 12:27:33',100,1),
(17,'2023-02-01 12:27:35','2023-02-01 12:27:35',100,1),
(18,'2023-02-01 12:27:36','2023-02-01 12:27:36',100,1),
(19,'2023-02-01 12:27:38','2023-02-01 12:27:38',100,1);

/*Table structure for table `ylrc_role` */

DROP TABLE IF EXISTS `ylrc_role`;

CREATE TABLE `ylrc_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_role` */

insert  into `ylrc_role`(`id`,`create_time`,`update_time`,`name`,`remark`,`status`) values 
(1,'2023-01-24 13:16:38','2023-01-24 13:16:38','超级管理员','超级管理员拥有最高权限。',1),
(2,'2023-01-25 13:18:57','2023-01-25 13:18:57','普通管理员','普通管理员只有部分权限',1),
(5,'2023-02-09 13:35:19','2023-02-25 13:35:22','拍卖者','普通拍卖权限',1);

/*Table structure for table `ylrc_role_authorities` */

DROP TABLE IF EXISTS `ylrc_role_authorities`;

CREATE TABLE `ylrc_role_authorities` (
  `role_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  KEY `FKhj7ap1o1cjrl7enr9arf5f2qp` (`authorities_id`) USING BTREE,
  KEY `FKg3xdaexmr0x1qx8omhvjtk46d` (`role_id`) USING BTREE,
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`),
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_role_authorities` */

insert  into `ylrc_role_authorities`(`role_id`,`authorities_id`) values 
(2,2),
(2,3),
(2,5),
(2,7),
(2,11),
(2,13),
(2,16),
(1,2),
(1,3),
(1,5),
(1,8),
(1,9),
(1,7),
(1,10),
(1,11),
(1,12),
(1,13),
(1,14),
(1,15),
(1,16),
(1,19),
(1,20),
(1,21),
(1,22),
(1,23),
(1,24),
(1,25),
(1,26),
(1,27),
(1,28),
(1,29),
(1,30),
(1,31),
(1,32),
(1,43),
(1,44),
(1,45),
(1,46),
(1,36),
(1,37),
(1,38),
(1,39),
(1,40),
(1,41),
(1,47),
(5,27),
(5,32),
(5,33),
(5,34),
(5,35),
(5,46),
(5,52),
(5,42),
(5,48),
(5,49),
(5,50),
(5,51);

/*Table structure for table `ylrc_user` */

DROP TABLE IF EXISTS `ylrc_user`;

CREATE TABLE `ylrc_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_btsosjytrl4hu7fnm1intcpo8` (`username`) USING BTREE,
  KEY `FKg09b8o67eu61st68rv6nk8npj` (`role_id`) USING BTREE,
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `ylrc_user` */

insert  into `ylrc_user`(`id`,`create_time`,`update_time`,`email`,`head_pic`,`mobile`,`password`,`sex`,`status`,`username`,`role_id`) values 
(6,'2023-02-01 12:36:45','2023-02-01 12:43:13','liu1018423804@163.com','20230201/1675226590761.png','13279269385','123456',1,1,'超级管理员小刘',1),
(7,'2023-02-01 12:42:35','2023-02-01 12:42:35','liu1018423804@163.com','20230201/1675226538283.png','13279269385','123456',1,1,'普通管理员',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
