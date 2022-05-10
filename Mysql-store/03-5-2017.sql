/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.21-MariaDB : Database - mine_craft_mods
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mine_craft_mods` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mine_craft_mods`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `account` */

insert  into `account`(`account_id`,`username`,`password`,`role`) values (1,'khoavin','af3033b84abc0a74b0a4f1527104e391',1),(2,'admin','e10adc3949ba59abbe56e057f20f883e',2);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(40) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`) values (1,'Adventure'),(2,'Creation'),(3,'CTM'),(4,'Custom Terrain'),(5,'MiniGame'),(6,'Parkour'),(7,'Puzzle'),(8,'PvP'),(9,'RedStone'),(10,'RollerCoaster'),(11,'Survival'),(12,'None');

/*Table structure for table `error_code` */

DROP TABLE IF EXISTS `error_code`;

CREATE TABLE `error_code` (
  `response_code` varchar(20) NOT NULL,
  `meaning` text,
  PRIMARY KEY (`response_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `error_code` */

insert  into `error_code`(`response_code`,`meaning`) values ('200','Success!'),('201','Duplicate Insert Row'),('202','Unlike Success!'),('203','Like Success!'),('204','\r\nLogin success!'),('205','Login Failed!'),('206','Exist Item!'),('207','SQL Exception!'),('208','Item was verified!'),('209','Upload item was verified or not exist!'),('210','User has registerd!'),('211','Spin success'),('212','Need more time to spin next turn'),('213','User_id doen\'t exist in reward list or already set information!'),('214','Spin status : YES'),('215','Spin status : NO');

/*Table structure for table `event_constant` */

DROP TABLE IF EXISTS `event_constant`;

CREATE TABLE `event_constant` (
  `constaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `constaint_meaning` text,
  `constaint_value` int(11) NOT NULL,
  PRIMARY KEY (`constaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `event_constant` */

insert  into `event_constant`(`constaint_id`,`constaint_meaning`,`constaint_value`) values (1,'Luky Number',3);

/*Table structure for table `event_param` */

DROP TABLE IF EXISTS `event_param`;

CREATE TABLE `event_param` (
  `param_id` int(11) NOT NULL AUTO_INCREMENT,
  `param_meaning` text NOT NULL,
  `param_type` int(11) NOT NULL,
  `param_value` int(11) NOT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `event_param` */

insert  into `event_param`(`param_id`,`param_meaning`,`param_type`,`param_value`) values (1,'Lucky Number',0,20000);

/*Table structure for table `html_content` */

DROP TABLE IF EXISTS `html_content`;

CREATE TABLE `html_content` (
  `html_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `html_content` text NOT NULL,
  PRIMARY KEY (`html_content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `html_content` */

insert  into `html_content`(`html_content_id`,`html_content`) values (1,'&lt;p&gt;My Title&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n&lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1&quot; /&gt; \n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.jqueryscript.net/images/Minimalist-Image-Viewer-Lightbox-Plugin-with-jQuery.jpg&quot; style=&quot;height:221px; width:300px&quot; /&gt;&lt;/p&gt;\n&lt;p&gt;&lt;iframe frameborder=&quot;0&quot; height=&quot;200&quot; src=&quot;https://www.youtube.com/embed/HQFk0pEq2bI&quot; width=&quot;300&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n');

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_name` varchar(50) NOT NULL,
  `file_url` text NOT NULL,
  `image_url` text NOT NULL,
  `thumb_url` text NOT NULL,
  `author_name` varchar(100) NOT NULL,
  `version` varchar(30) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `description` text NOT NULL,
  `short_description` text NOT NULL,
  `hot_priority` int(11) NOT NULL,
  `download_count` int(11) NOT NULL,
  `video_code` varchar(20) NOT NULL,
  `is_verify` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `category_id` (`category_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `item_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `item` */

insert  into `item`(`item_id`,`type_id`,`category_id`,`item_name`,`file_url`,`image_url`,`thumb_url`,`author_name`,`version`,`size`,`description`,`short_description`,`hot_priority`,`download_count`,`video_code`,`is_verify`,`create_time`) values (1,1,2,'Mine-Trucks Addon','http://azminecraftskins.com/mcpe/mcpemods/files/MineTrucks.addon','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/MineTrucks.jpg','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/MineTrucks.jpg','MattH44','1.0.6',NULL,'Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.\\\\nStoryline\\\\nYouve long ruled your kingdom but recently someone overthrew you! He is an evil man and your people is now being ruled by a complete maniac. You need to find a way to destroy him and take back your lost kingdom. To do this youll need a couple of different tools','Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.',4,1020,'',0,'2017-04-20 13:27:33'),(2,2,1,'Pocket Creatures Mod','http://azminecraftskins.com/mcpe/mcpemods/files/PocketCreaturesMod.zip','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/PocketCreaturesMod.jpg','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/PocketCreaturesMod.jpg','BlockMaster_203','1.0.6',NULL,'Thorpe Park is a theme park in England which now has been recreated in Minecraft Pocket Edition. There are more than 40 different attractions (and that includes everything from roller coasters to water rides). However, it should be noticed that its not a 1:1 scale recreation and some attractions have been moved or changed to make everything fit nicely together.','Thorpe Park is a theme park in England which now has been recreated in Minecraft Pocket Edition.',3,1027,'',0,'2017-04-20 13:29:44'),(3,3,1,'Castle Adventure','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/CastleAdventureV2.zip','https://dl.dropboxusercontent.com/u/26776365/mcpemaps/images/adventure/CastleAdventureV2.jpg','https://dl.dropboxusercontent.com/u/26776365/mcpemaps/thumbs/adventure/CastleAdventureV2.jpg','MattH44','1.0.6',NULL,'Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.\\\\nStoryline\\\\nYouve long ruled your kingdom but recently someone overthrew you! He is an evil man and your people is now being ruled by a complete maniac. You need to find a way to destroy him and take back your lost kingdom. To do this youll need a couple of different tools','Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.',4,1007,'',0,'2017-04-21 12:02:03'),(6,6,NULL,'Too Many Temples (And More)','http://azminecraftskins.com/mcpe/mcpeseeds/files/TooManyTemples.zip','http://azminecraftskins.com/mcpe/mcpeseeds/images/TooManyTemples.jpg','http://azminecraftskins.com/mcpe/mcpeseeds/thumbs/TooManyTemples.jpg','','','920847948','In this seed you will find yourself spawning very close to three different temples. And just within minutes of spawning you will be able to collect almost fifty gold and iron ingots! Besides the temples we will also show you how to find a village and two witch huts.\nIn front of spawn is the first temple. To find the treasures destroy the colored blocks in the center and drop down there. Avoid the pressure plate as it will trigger a deadly TNT trap. In total there are four chests.\n19 bones\n18 iron ingots\n19 gold ingots\n33 rotten flesh\nTo find the two other temples return to the spawn but this time walk in the opposite direction (just turn around) and you will find them.\n12 gold ingots\n9 iron ingots\n3 diamonds\n34 bones\n22 rotten flesh\nIn front of the temples is a river. Follow the river to the left and after a while take a turn to the left as seen in the images down below.\nPretty soon you will find a little village.\nContinue straight out into the swamp biome for a while to find the first witch hut.\nFollow the path of the water in the swamp biome to get to the second witch hut.','In this seed you will find yourself spawning very close to three different temples. And just within minutes of spawning you will be able to collect almost fifty gold and iron ingots! Besides the temples we will also show you how to find a village and two witch huts.',1,457,'',0,'2017-04-01 00:00:00'),(7,4,NULL,'Strong Gladiator','http://azminecraftskins.com/mcpe/mcpeskins/files/fantasy/StrongGladiator.png','http://azminecraftskins.com/mcpe/mcpeskins/images/fantasy/StrongGladiator.jpg','http://azminecraftskins.com/mcpe/mcpeskins/thumbs/fantasy/StrongGladiator.jpg','Irish','','','A Roman champion fighting in the gladiator games.','',1,129,'',0,'2017-04-01 00:00:00'),(8,5,1,'2101: A Minecraft Odyssey','http://azminecraftskins.com/mcpe/mcpetextures/files/2101AMinecraftOdyssey.zip','http://azminecraftskins.com/mcpe/mcpetextures/images/2101AMinecraftOdyssey.jpg','http://azminecraftskins.com/mcpe/mcpetextures/thumbs/2101AMinecraftOdyssey.jpg','keithross39','1.0.6','32x32','Creator: Mediocritus (original PC pack). This texture pack includes textures which are considered modern and futuristic. The creators main inspiration while designing the texture pack was 2001: A Space Odyssey which is a classic sci-fi movie from the 60s. Its a really useful texture pack if you are building a space station or anything similar which relates to space or the future in general.','This texture pack includes textures which are considered modern and futuristic.',1,13,'',0,'2017-04-01 00:00:00'),(9,1,NULL,'2101: A Minecraft Odyssey','http://azminecraftskins.com/mcpe/mcpetextures/files/2101AMinecraftOdyssey.zip','http://azminecraftskins.com/mcpe/mcpetextures/images/2101AMinecraftOdyssey.jpg','http://azminecraftskins.com/mcpe/mcpetextures/images/2101AMinecraftOdyssey.jpg','keithross39','1.0.6','32x32','Creator: Mediocritus (original PC pack). This texture pack includes textures which are considered modern and futuristic. The creators main inspiration while designing the texture pack was 2001: A Space Odyssey which is a classic sci-fi movie from the 60s. Its a really useful texture pack if you are building a space station or anything similar which relates to space or the future in general.','',0,2001,'',0,'2017-04-21 17:07:46'),(10,1,NULL,'Too Many Temples (And More)','http://azminecraftskins.com/mcpe/mcpemods/files/MineTrucks.addon','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/MineTrucks.jpg','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/MineTrucks.jpg','',NULL,NULL,'Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.\\\\nStoryline\\\\nYouve long ruled your kingdom but recently someone overthrew you! He is an evil man and your people is now being ruled by a complete maniac. You need to find a way to destroy him and take back your lost kingdom. To do this youll need a couple of different tools','Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.',4,399,'',NULL,'2017-04-21 17:17:03'),(22,1,12,'sssdu','http://azminecraftskins.com/mcpe/mcpemods/sssdu.addon','http://azminecraftskins.com/mcpe/mcpemods/sssdu.jpg','http://azminecraftskins.com/mcpe/mcpemods/sssdu.jpg','wdad','','','udqq','',1,0,'',1,'2017-04-27 14:36:16'),(23,1,12,'adsd','http://azminecraftskins.com/mcpe/mcpemods/adsd.addon','http://azminecraftskins.com/mcpe/mcpemods/adsd.jpg','http://azminecraftskins.com/mcpe/mcpemods/adsd.jpg','www','','','add','',0,0,'',1,'2017-04-27 14:36:17');

/*Table structure for table `item_comment` */

DROP TABLE IF EXISTS `item_comment`;

CREATE TABLE `item_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(100) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `comment_message` text NOT NULL,
  `create_time` datetime NOT NULL,
  `like_count` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

/*Data for the table `item_comment` */

insert  into `item_comment`(`comment_id`,`item_id`,`user_id`,`comment_message`,`create_time`,`like_count`) values (2,'1','1','gasgsafasf','2017-04-19 13:43:37',100),(3,'1','1','Greate Job!','2017-04-21 09:28:29',34),(4,'1','1','hehela','2017-04-21 10:42:31',0),(5,'1','1','hehela','2017-04-21 10:59:35',0),(6,'1','1','aksdhasnd.asdkjasd','2017-04-21 10:59:56',0),(7,'1','1','aksdhasnd.asdkjasd','2017-04-21 11:05:17',0),(8,'1','1','aksdhasnd.asdkjasd','2017-04-21 13:06:11',0),(9,'1','1','aksdhasnd.asdkjasd','2017-04-21 13:06:13',0),(10,'1','1','sdfdsfdsfsdfds','2017-04-21 13:23:23',0),(11,'1','1','Hello','2017-04-21 13:25:36',0),(12,'1','1','´dasdas','2017-04-21 13:27:35',0),(13,'1','1','´dasd´dasd','2017-04-21 13:27:44',0),(14,'1','1','´dasdasdasdasdasd','2017-04-21 13:27:48',0),(15,'1','1','sdfdsfdsfdsfdsf','2017-04-21 13:28:56',0),(16,'1','1','22222','2017-04-21 15:09:57',0),(17,'1','1','22222','2017-04-21 15:32:17',0),(18,'8','1','hgfhghgf','2017-04-24 09:12:33',0),(19,'2','1','fghgfhgfh','2017-04-24 09:13:52',0),(20,'3','1','dsfdsfdsfds','2017-04-24 09:17:43',0),(21,'2','1','asdsadsad','2017-04-24 09:21:27',0),(22,'2','1','sadsadsa','2017-04-24 09:21:29',0),(23,'1','1','dfdsfdsfdsf','2017-04-25 15:07:32',0),(24,'10','1','hjkhjkjhkhj','2017-04-25 15:44:14',0),(25,'10','1','xcvxcvxcv','2017-04-25 16:06:19',0),(26,'10','1','cvbvcbcvb','2017-04-25 16:07:04',0),(27,'3','1','fa','2017-04-26 11:18:26',0),(28,'10','1','o000000','2017-04-26 13:27:00',0),(29,'1','1','bnmbnmbn','2017-04-26 13:27:24',0),(30,'1','1','ghjhgjghj','2017-04-26 13:31:20',0),(31,'1','1','jghj','2017-04-26 13:34:46',0),(32,'1','1','vbbvbcvb','2017-04-26 13:35:32',0),(33,'1','1','cvbcvbcvbcv','2017-04-26 13:35:37',0),(34,'1','1','ghhfgh','2017-04-26 13:37:34',0),(35,'1','1','fghgfhgfh','2017-04-26 13:37:36',0),(36,'1','1','fghgfhgfh','2017-04-26 13:37:38',0),(37,'1','1','gfhgfh','2017-04-26 13:37:38',0),(38,'1','1','gfhgf','2017-04-26 13:37:39',0),(39,'1','1','h','2017-04-26 13:37:39',0),(40,'1','1','hgf','2017-04-26 13:37:40',0),(41,'1','1','fhgf','2017-04-26 13:37:40',0),(42,'1','1','gfhgfhgfhgfh','2017-04-26 13:37:58',0),(43,'1','1','f','2017-04-26 13:37:58',0),(44,'1','1','hf','2017-04-26 13:37:58',0),(45,'1','1','g','2017-04-26 13:37:58',0),(46,'1','1','gf','2017-04-26 13:37:59',0),(47,'1','1','hgfhg','2017-04-26 13:37:59',0),(48,'1','1','hgfhg','2017-04-26 13:38:00',0),(49,'1','1','fgfh','2017-04-26 13:38:00',0),(50,'1','1','hgf','2017-04-26 13:38:00',0),(51,'1','1','gfh','2017-04-26 13:38:01',0),(52,'1','1','gf','2017-04-26 13:38:01',0),(53,'1','1','hgf','2017-04-26 13:38:01',0),(54,'1','1','gf','2017-04-26 13:38:01',0),(55,'1','1','gf','2017-04-26 13:38:02',0),(56,'1','1','gfh','2017-04-26 13:38:02',0),(57,'1','1','gh','2017-04-26 13:38:03',0),(58,'1','1','hgf','2017-04-26 13:38:03',0),(59,'1','1','hgf','2017-04-26 13:38:03',0),(60,'1','1','hgf','2017-04-26 13:38:04',0),(61,'1','1','g','2017-04-26 13:38:04',0),(62,'1','1','h','2017-04-26 13:38:04',0),(63,'1','1','f','2017-04-26 13:38:04',0),(64,'1','1','hf','2017-04-26 13:38:05',0),(65,'1','1','h','2017-04-26 13:38:05',0),(66,'1','1','ghg','2017-04-26 13:38:05',0),(67,'1','1','hgf','2017-04-26 13:38:06',0),(68,'1','1','h','2017-04-26 13:38:06',0),(69,'1','1','fh','2017-04-26 13:38:06',0),(70,'1','1','f','2017-04-26 13:38:06',0),(71,'1','1','hfg','2017-04-26 13:38:07',0),(72,'1','1','fghfg','2017-04-26 13:38:07',0),(73,'1','1','gf','2017-04-26 13:38:08',0),(74,'1','1','hfg','2017-04-26 13:38:08',0),(75,'1','1','gfh','2017-04-26 13:38:08',0),(76,'1','1','gf','2017-04-26 13:38:09',0),(77,'1','1','gfh','2017-04-26 13:38:09',0),(78,'1','1','gf','2017-04-26 13:38:10',0),(79,'1','1','gfh','2017-04-26 13:38:10',0),(80,'1','1','hgfh','2017-04-26 13:38:10',0),(81,'1','1','f','2017-04-26 13:38:11',0),(82,'1','1','gfhgfhgfh','2017-04-26 13:38:35',0),(83,'1','1','gh','2017-04-26 13:38:35',0),(84,'1','1','hgfhf','2017-04-26 13:38:36',0),(85,'1','1','hh','2017-04-26 13:38:36',0),(86,'1','1','fh','2017-04-26 13:38:36',0),(87,'1','1','gf','2017-04-26 13:38:36',0),(88,'1','1','gfh','2017-04-26 13:38:37',0),(89,'1','1','hgf','2017-04-26 13:38:37',0),(90,'1','1','gfhg','2017-04-26 13:38:37',0),(91,'1','1','h','2017-04-26 13:38:38',0),(92,'1','1','h','2017-04-26 13:38:38',0),(93,'1','1','gfh','2017-04-26 13:38:38',0),(94,'1','1','fgf','2017-04-26 13:38:39',0),(95,'1','1','dfgdfgdfg','2017-04-26 13:51:04',0),(96,'1','1','dfgdfgfdg','2017-04-26 13:51:09',0),(97,'10','qCve4oIdHBeZdWVHFYLfDjaVWeH2','032032','2017-04-28 09:43:37',0);

/*Table structure for table `item_type` */

DROP TABLE IF EXISTS `item_type`;

CREATE TABLE `item_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(40) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `item_type` */

insert  into `item_type`(`type_id`,`type_name`) values (1,'AddOn'),(2,'Mod'),(3,'Map'),(4,'Skin'),(5,'Texture'),(6,'Seed');

/*Table structure for table `like` */

DROP TABLE IF EXISTS `like`;

CREATE TABLE `like` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  PRIMARY KEY (`like_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `like` */

insert  into `like`(`like_id`,`comment_id`,`user_id`) values (1,1,'1'),(2,1,'1'),(3,1,'1'),(4,1,'1'),(5,1,'1'),(7,1,'2'),(21,2,'1'),(23,3,'1'),(24,20,'1'),(25,1,'1'),(26,1,'2');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` text NOT NULL,
  `news_thumb_url` text NOT NULL,
  `news_content_id` int(11) NOT NULL,
  `news_create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `news` */

insert  into `news`(`news_id`,`news_title`,`news_thumb_url`,`news_content_id`,`news_create_at`) values (1,'My Title','http://www.gettyimages.in/gi-resources/images/Homepage/Hero/US/MAR2016/prestige-587705839_full.jpg',1,'2017-04-23 10:28:57'),(2,'Haha','http://beebom.com/wp-content/uploads/2016/01/Reverse-Image-Search-Engines-Apps-And-Its-Uses-2016.jpg',1,'2017-04-24 10:29:01'),(3,'Keke','http://1.bp.blogspot.com/-SzGp9N3s138/UzBFiIOyonI/AAAAAAAAKkE/YzOOFiW61DI/s1600/Beautiful+Indian+Girls+Wallpapers+for+Desktop+Image+12.jpg',1,'2017-04-21 10:29:04');

/*Table structure for table `news_comment` */

DROP TABLE IF EXISTS `news_comment`;

CREATE TABLE `news_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_message` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `news_comment` */

insert  into `news_comment`(`comment_id`,`news_id`,`user_id`,`comment_message`,`create_time`,`like_count`) values (1,0,1,'hahahassiss','2017-04-24 13:28:34',NULL),(2,0,1,'hahahassiss','2017-04-24 13:28:40',NULL),(3,1,1,'hahahassiss','2017-04-24 13:32:41',NULL),(4,1,1,'hahahassiss','2017-04-24 13:39:32',NULL),(5,1,1,'hahahassiss','2017-04-24 13:39:34',NULL),(6,1,1,'hahahassiss','2017-04-24 13:39:34',NULL),(7,1,1,'hahahassiss','2017-04-24 13:39:34',NULL),(8,1,1,'hahahassiss','2017-04-24 13:39:35',NULL),(9,3,1,'Hello','2017-04-24 13:48:08',NULL),(10,2,1,'ttdd','2017-04-25 10:05:51',NULL),(11,2,1,'ddd','2017-04-25 10:05:54',NULL),(12,2,1,'daa','2017-04-25 10:06:05',NULL),(13,1,1,'xcvxcvxcv','2017-04-25 15:50:06',NULL),(14,2,1,'dsfdsfdsf','2017-04-26 13:51:20',NULL),(15,2,1,'sdfdfdsf','2017-04-26 13:51:22',NULL),(16,2,1,'kjjklj','2017-04-26 13:52:59',NULL);

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_meaning` text NOT NULL,
  `resource_type` int(11) NOT NULL,
  `resource_value` int(11) NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `resource` */

insert  into `resource`(`resource_id`,`resource_meaning`,`resource_type`,`resource_value`) values (1,'15 USD',2,15),(2,'5 Coin',1,5),(3,'20 USD',2,20),(4,'10 Coin',1,10),(5,'5 USD',2,5),(6,'1 Coin',1,1),(7,'10 USD',2,10),(8,'3 Coin',1,3);

/*Table structure for table `reward` */

DROP TABLE IF EXISTS `reward`;

CREATE TABLE `reward` (
  `reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nation_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `reward` */

insert  into `reward`(`reward_id`,`user_id`,`resource_id`,`email`,`nation_name`) values (5,'93rGobFFrzVNk4Nku8fH2vz4hp42',5,'khoavin@gmail.com','VietNam'),(6,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'ddddd','Argentina'),(7,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'ddddd','Argentina'),(8,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'ddddd','Argentina'),(9,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'',''),(10,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'',''),(11,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'',''),(12,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'','');

/*Table structure for table `spin_list` */

DROP TABLE IF EXISTS `spin_list`;

CREATE TABLE `spin_list` (
  `spin_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `spin_datetime` datetime NOT NULL,
  PRIMARY KEY (`spin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=latin1;

/*Data for the table `spin_list` */

insert  into `spin_list`(`spin_id`,`user_id`,`resource_id`,`spin_datetime`) values (1,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-27 13:42:05'),(177,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 16:31:48'),(178,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 16:32:23'),(179,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:33:16'),(180,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',7,'2017-04-28 16:33:39'),(181,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 16:38:37'),(182,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 16:43:40'),(183,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 16:44:02'),(184,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:44:26'),(185,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',5,'2017-04-28 16:44:55'),(186,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:50:21'),(187,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:54:05'),(188,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 17:03:39'),(189,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 17:04:35'),(190,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-04-28 17:08:59'),(191,'93rGobFFrzVNk4Nku8fH2vz4hp42',2,'2017-04-28 17:17:22'),(192,'93rGobFFrzVNk4Nku8fH2vz4hp42',8,'2017-04-28 17:17:26'),(193,'93rGobFFrzVNk4Nku8fH2vz4hp42',6,'2017-04-28 17:17:30'),(194,'93rGobFFrzVNk4Nku8fH2vz4hp42',8,'2017-04-28 17:17:34'),(195,'93rGobFFrzVNk4Nku8fH2vz4hp42',5,'2017-04-28 17:17:39'),(196,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 17:20:01'),(197,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 17:20:34'),(198,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 17:21:10'),(199,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 17:21:33'),(200,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-04-28 17:21:58'),(201,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 18:10:54'),(202,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 09:47:31'),(203,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 09:47:57'),(204,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 10:20:56'),(205,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 10:54:42'),(206,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 11:11:30'),(207,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 11:12:55'),(208,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 11:13:18'),(209,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 13:41:24'),(210,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-03 13:42:01'),(211,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 13:42:16'),(212,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 13:42:36'),(213,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-03 13:42:44'),(214,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 13:42:49'),(215,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 13:43:29'),(216,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 13:59:58'),(217,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-03 14:10:02'),(218,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 14:31:58'),(219,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 14:32:40'),(220,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-03 16:33:52'),(221,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 16:42:26');

/*Table structure for table `upload_item` */

DROP TABLE IF EXISTS `upload_item`;

CREATE TABLE `upload_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `file_url` text,
  `image_url` text,
  `thumb_url` text,
  `author_name` text,
  `version` varchar(30) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `description` text,
  `short_description` text,
  `hot_priority` int(11) DEFAULT NULL,
  `download_count` int(11) DEFAULT NULL,
  `video_code` varchar(20) DEFAULT NULL,
  `is_verify` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=latin1;

/*Data for the table `upload_item` */

insert  into `upload_item`(`item_id`,`type_id`,`category_id`,`item_name`,`file_url`,`image_url`,`thumb_url`,`author_name`,`version`,`size`,`description`,`short_description`,`hot_priority`,`download_count`,`video_code`,`is_verify`,`create_time`) values (188,3,1,'SAW Horror','http://azminecraftskins.com/mcpe/mcpemods/SAW Horror.zip','http://azminecraftskins.com/mcpe/mcpemods/SAW Horror.jpg','http://azminecraftskins.com/mcpe/mcpemods/SAW Horror.jpg','ZeReaper','','','Its few maps in Minecraft which has got me scared, but this one succeeded to scare me at least two times. Youve been kidnapped by an evil psychopath who will take you through a series of challenges where none of the available options seem good, but you must make your choices quick in order to survive this house of horror. Even though parts of the story could be improved upon its definitely an enjoyable (and at times scary) gameplay experience.\n\nRules\nNo cheating\nGamemode: survival\nDont break/place blocks (unless told otherwise)\nIts best suited for one person, but you are allowed to play it in multiplayer.','',1,0,'',0,'2017-05-03 16:35:56'),(189,3,2,'Simple Starter House','http://azminecraftskins.com/mcpe/mcpemods/Simple Starter House.zip','http://azminecraftskins.com/mcpe/mcpemods/Simple Starter House.jpg','http://azminecraftskins.com/mcpe/mcpemods/Simple Starter House.jpg','DJKenleyTrack','','','Are you new to Minecraft and just want some place nice to live without having to build it yourself? If thats the case then this map is perfect for you. It spawns you at a small cottage which is situated in a plains biome. There is a river right next to the cottage which is a great spot for fishing. There are also lots of forests around the house which means youll never run out of resources such as wood.','',1,0,'',0,'2017-05-03 16:35:57'),(190,3,1,'The Experiment 1 (1.0.5+ Only!)','http://azminecraftskins.com/mcpe/mcpemods/The Experiment 1 (1.0.5+ Only!).zip','http://azminecraftskins.com/mcpe/mcpemods/The Experiment 1 (1.0.5+ Only!).jpg','http://azminecraftskins.com/mcpe/mcpemods/The Experiment 1 (1.0.5+ Only!).jpg','HeroBGamingHQ','','','Youve been kidnapped by an evil scientist and you are forced to through a series of tests to prove yourself worthy. Its unclear why you were chosen in the first place, but one thing is for certain and that is that you have to escape your captivity. This is an adventure map which should take somewhere around 20 minutes to complete. It uses redstone and command blocks to provide a seamless gameplay experience.\n\nStoryline\nYour name is Khirt. A 16 year old who was kidnapped and experimented on by the Evil Scientist, Dr Hero Randomz. Dont worry… You wont be alone!\nRules\nDont break blocks\nSurvival\nSet difficulty to normal or hard','',1,0,'',0,'2017-05-03 16:35:57'),(191,3,1,'The Stairway 1.0.5+ Only!)','http://azminecraftskins.com/mcpe/mcpemods/The Stairway 1.0.5+ Only!).zip','http://azminecraftskins.com/mcpe/mcpemods/The Stairway 1.0.5+ Only!).jpg','http://azminecraftskins.com/mcpe/mcpemods/The Stairway 1.0.5+ Only!).jpg','Cheete','','','The Stairway is a horror map in which you will be walking aimlessly in a stairway, lonely and confused and not really sure where you are going. It takes around 5 minutes to complete and there are a few surprises in the map (but none of which I will spoil here). If you are afraid of the dark then its definitely going to be scary. But I think it would have been even better with some custom horror sounds.\n\nStoryline\nThere is no where, when or why. But you are here, an endless staircase with nothing else about it. Is there even an end? No one knows.\nRules\nDont break/place blocks\nDont jump over pressure plates','',1,0,'',0,'2017-05-03 16:35:57'),(192,3,1,'Castle Adventure V2','http://azminecraftskins.com/mcpe/mcpemods/Castle Adventure V2.zip','http://azminecraftskins.com/mcpe/mcpemods/Castle Adventure V2.jpg','http://azminecraftskins.com/mcpe/mcpemods/Castle Adventure V2.jpg','MattH44','','','Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.\n\nStoryline\nYouve long ruled your kingdom but recently someone overthrew you! He is an evil man and your people is now being ruled by a complete maniac. You need to find a way to destroy him and take back your lost kingdom. To do this youll need a couple of different tools..\n\nRules\nPlay in easy\nSurvival mode\nMax 10 render distance\nDont break blocks\n\nChangelog\nThe Evil King is now the Wither Boss\nMust be played in easy difficulty\nSome tools are replaced with enchanted items\nInner castle is redesigned\nBoss fight','',1,0,'',0,'2017-05-03 16:35:57'),(193,3,1,'Subterranean Facility','http://azminecraftskins.com/mcpe/mcpemods/Subterranean Facility.zip','http://azminecraftskins.com/mcpe/mcpemods/Subterranean Facility.jpg','http://azminecraftskins.com/mcpe/mcpemods/Subterranean Facility.jpg','NXUS','','','The Subterranean Facility is a large and complex structure which you will find yourself exploring in hope to find a way out and take back your freedom. Its an epic adventure taking place in one of the most amazing structures specifically created to provide you a mind-boggling escape adventure in Minecraft.\n			\nA large majority of the map includes the great challenge of finding a way out. But to escape, you will first need to do a whole lot of exploration. There are several ways to get to the end and the total playtime is expected somewhere around 30 minutes (excluding the tutorial).','',1,0,'',0,'2017-05-03 16:35:57'),(194,3,1,'The Darkest Halls 2','http://azminecraftskins.com/mcpe/mcpemods/The Darkest Halls 2.zip','http://azminecraftskins.com/mcpe/mcpemods/The Darkest Halls 2.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Darkest Halls 2.jpg','The Obsidian Gemstone','','','This is the second map in a map series called The Darkest Halls. The only thing you know is that youve been captured by ‘X and somehow need to find a way out of his rooms of torture. The map includes several scares and creepy sounds and hopefully thats enough to send a shiver down your spine every once in a while. Beware, its a very spooky map!','',1,0,'',0,'2017-05-03 16:35:57'),(195,3,1,'Caves of Chaos','http://azminecraftskins.com/mcpe/mcpemods/Caves of Chaos.zip','http://azminecraftskins.com/mcpe/mcpemods/Caves of Chaos.jpg','http://azminecraftskins.com/mcpe/mcpemods/Caves of Chaos.jpg','PastaPanda','','','You are a knight who travels the world of Minecraft in search for new quests and challenges. Today you passed by a village which have a big problem. Most of the townspeople have been kidnapped and they want you to find and kill the kidnapper. The Cave of Chaos is mainly an adventure map but is supposed to also include some puzzles. It should take somewhere 10 : 20 minutes to complete the map.\n\nRead all of the signs which you come across in order to understand where you need to go.\n\nSometimes you will have to enter places, like caves, which are most likely filled with monsters. But as a knight you have to be brave and continue your battle for greatness.\nThe main objective is to save the townspeople and other animals which have been kidnapped. But make sure to read all the signs and dont skip through any of the quests.','',1,0,'',0,'2017-05-03 16:35:57'),(196,3,1,'Hidden Treasure','http://azminecraftskins.com/mcpe/mcpemods/Hidden Treasure.zip','http://azminecraftskins.com/mcpe/mcpemods/Hidden Treasure.jpg','http://azminecraftskins.com/mcpe/mcpemods/Hidden Treasure.jpg','Adventure Maps','','','This is a short adventure map where your abilities will be put to a test to see if youve got what it takes to obtain a sacred treasure. Its a quite fun map where you have to play through three different levels. Personally, I dont think its a difficult map and I would expect it would take on average 15-20 minutes to complete. I wont tell you about the end but its definitely something different!\n\nStoryline\nFor a long time youve been searching for treasures but you havent been successful yet. But something feels different today. Maybe it was a dream which ignited this feeling or maybe this is actually the day that you will find your first treasure..','',1,0,'',0,'2017-05-03 16:35:57'),(197,3,1,'Santa Mission','http://azminecraftskins.com/mcpe/mcpemods/Santa Mission.zip','http://azminecraftskins.com/mcpe/mcpemods/Santa Mission.jpg','http://azminecraftskins.com/mcpe/mcpemods/Santa Mission.jpg','Zad103','','','Santa has been locked up in a lab and is right now being used for experiments by some evil scientists. Christmas is at stake here and its up to you to go on an adventure to find him and release him from his imprisonment. There are still lots of presents which need to be delivered and the elves need their Santa to complete this extraordinary task!\n\nStoryline\nIt is Christmas time and Santa Claus has been delivering thousands of presents to kids all around the world. But recently some evil scientists decided to kidnap Santa and perform experiments on him and his reindeers to try to figure out why they can fly. Ultimately their goal is to implement this technology in their own rockets.\n\nRules\nPlay in survival mode\nRead all signs','',1,0,'',0,'2017-05-03 16:35:57'),(198,3,1,'Save the Christmas','http://azminecraftskins.com/mcpe/mcpemods/Save the Christmas.zip','http://azminecraftskins.com/mcpe/mcpemods/Save the Christmas.jpg','http://azminecraftskins.com/mcpe/mcpemods/Save the Christmas.jpg','MisterDabs','','','Christmas is getting closer and Santa Claus needs all the help he can get. However, last week all of his helpers got kidnapped. He tried to contact the Federal Bureau of Elfinvestigation but they couldnt help him. Give this map a try if you want to get in Christmas mood already. Play as one of Santas elves and try to escape captivity to try to save Christmas before its too late!\n\nStoryline\nAll workers of Santa Claus have been kidnapped and put in a prison and one of them are you. Its only a few days left until Christmas and Santa urgently needs his elves to help him deliver the presents. Its up to you to find a way to escape and save Christmas from this catastrophe!\n\nRules\nDont break blocks unless told otherwise\nRead all signs','',1,0,'',0,'2017-05-03 16:35:57'),(199,3,1,'The End Map (Addon and Map)','http://azminecraftskins.com/mcpe/mcpemods/The End Map (Addon and Map).zip','http://azminecraftskins.com/mcpe/mcpemods/The End Map (Addon and Map).jpg','http://azminecraftskins.com/mcpe/mcpemods/The End Map (Addon and Map).jpg','Gona','','','The End is another dimension in Minecraft which doesnt exist in the official version of Pocket Edition (until now). The End Add-on changes that as it lets you explore a world which looks very similar to The End and even includes an epic boss known as the Ender Dragon. If youve always wanted to fight the Ender Dragon then you definitely have to give this add-on a try!','',1,0,'',0,'2017-05-03 16:35:57'),(200,3,1,'Prison Break','http://azminecraftskins.com/mcpe/mcpemods/Prison Break.zip','http://azminecraftskins.com/mcpe/mcpemods/Prison Break.jpg','http://azminecraftskins.com/mcpe/mcpemods/Prison Break.jpg','BlackZero','','','Story: You are BlackZero, betting in just one night, you\'ve lost everything. Despair, you select the most dangerous road: go rob the bank, but no experience at all should have been police quickly caught.\n\nIn prison, everything around you are dirty, you want to get out of here as soon as possible. \n\nEven the guards are being forced to work very hard and get out of here, so everyone in the prison miserable that','',1,0,'',0,'2017-05-03 16:35:57'),(201,3,1,'The Darkest Halls','http://azminecraftskins.com/mcpe/mcpemods/The Darkest Halls.zip','http://azminecraftskins.com/mcpe/mcpemods/The Darkest Halls.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Darkest Halls.jpg','The Obsidian Gemstone, Cheete','','','Youve been researching a case for months and finally youve got a lead which looks very promising. Ever since that incident a while back you havent been feeling good about yourself. You cant block out the faces of that poor girls parents. Everything about it was just horrible. Perhaps this case will both help with anxiety and give you a better reputation among your colleagues.\nRules\nOnly place redstone torches on gold blocks\nSet volume to max (100%)\nTurn brightness down\nChange difficulty when told to do so\nDont break/place blocks','',1,0,'',0,'2017-05-03 16:35:57'),(202,3,1,'A Dream','http://azminecraftskins.com/mcpe/mcpemods/A Dream.zip','http://azminecraftskins.com/mcpe/mcpemods/A Dream.jpg','http://azminecraftskins.com/mcpe/mcpemods/A Dream.jpg','Amon28','','','This map is not good for anyone who gets scared easily. Its a short horror story about a girl who have just moved into a new house with her family. Its the first night shes sleeping in her new room and she cant fall asleep. Soon she (or rather you) will go through a series of scary experiences. Is all this real or just a dream? Play the map to find out!\nA Dream is the perfect map to play for Halloween. As I mentioned, its quite scary so take this into consideration before playing it.\n\nI wont post too many pictures as I dont want to spoil the scary parts.','',1,0,'',0,'2017-05-03 16:35:57'),(203,3,1,'SkyDen','http://azminecraftskins.com/mcpe/mcpemods/SkyDen.zip','http://azminecraftskins.com/mcpe/mcpemods/SkyDen.jpg','http://azminecraftskins.com/mcpe/mcpemods/SkyDen.jpg','Oskur','','','0.16.0+\nSky Den Survival was a popular adventure map in MCPE 0.7.6 and 0.8.1! If you have been playing Pocket Edition since those updates then youve probably heard of the map. \n\nUnfortunately the old worlds arent supported in the newer versions of Minecraft PE, so I decided to rebuild the adventure map (from scratch) with newer and updated features. This map is available to play on 0.16.0+(Android, iOS, and Windows 10).','',1,0,'',0,'2017-05-03 16:35:57'),(204,3,1,'The Dungeon','http://azminecraftskins.com/mcpe/mcpemods/The Dungeon.zip','http://azminecraftskins.com/mcpe/mcpemods/The Dungeon.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Dungeon.jpg','WillGui15','','','This is a map of challenges (10) \n\nMap Created by William Capricho (WillGui15)\n\nHistory Created By João Carvalho \n\nI hope you enjoy.','',1,0,'',0,'2017-05-03 16:35:57'),(205,3,1,'Best Map Adventure','http://azminecraftskins.com/mcpe/mcpemods/Best Map Adventure.zip','http://azminecraftskins.com/mcpe/mcpemods/Best Map Adventure.jpg','http://azminecraftskins.com/mcpe/mcpemods/Best Map Adventure.jpg','JohnOfGamer15','','','Hello friends hope you are the best and then today I come to Share Best Map Adventure for Minecraft PE (Pocket Edition) and if you want to know what the Map Before I Play invite you to See My Video Playing It\n\nIf you want to see more maps Epicos As Horse Racing Pigs Wipeout ETC. I invite you to see my Canal JohnOf Gamer ^^','',1,0,'',0,'2017-05-03 16:35:57'),(206,3,1,'West Craft','http://azminecraftskins.com/mcpe/mcpemods/West Craft.zip','http://azminecraftskins.com/mcpe/mcpemods/West Craft.jpg','http://azminecraftskins.com/mcpe/mcpemods/West Craft.jpg','CRAFTER-98','','','Adventure map\nThis is my new map hope you like it\ndownload now!','',1,0,'',0,'2017-05-03 16:35:57'),(207,3,1,'Maze Runner','http://azminecraftskins.com/mcpe/mcpemods/Maze Runner.zip','http://azminecraftskins.com/mcpe/mcpemods/Maze Runner.jpg','http://azminecraftskins.com/mcpe/mcpemods/Maze Runner.jpg','ThePullGamesTM','','','Maze Runner A wonderful Minigame','',1,0,'',0,'2017-05-03 16:35:57'),(208,3,1,'Sky Adventure: Chapter 1','http://azminecraftskins.com/mcpe/mcpemods/Sky Adventure: Chapter 1.zip','http://azminecraftskins.com/mcpe/mcpemods/Sky Adventure: Chapter 1.jpg','http://azminecraftskins.com/mcpe/mcpemods/Sky Adventure: Chapter 1.jpg','itzBojan','','','Sky Adventure is a parkour map combined with mob battles which all takes place high up in sky among the clouds. There is a good mix of parkour. Some which you would most likely consider quite easy and other parts which will be challenging even for the more experienced players. It offers somewhere around 15 minutes of gameplay, but it all depends obviously on your own skill level.\n\nRules\nDont break blocks\nSet render distance to low\nTurn on difficulty','',1,0,'',0,'2017-05-03 16:35:57'),(209,3,1,'Mined Prison 5: Darkest Secrets','http://azminecraftskins.com/mcpe/mcpemods/Mined Prison 5: Darkest Secrets.zip','http://azminecraftskins.com/mcpe/mcpemods/Mined Prison 5: Darkest Secrets.jpg','http://azminecraftskins.com/mcpe/mcpemods/Mined Prison 5: Darkest Secrets.jpg','The Obsidian Gemstone , Cheete','','','Mined Prison: Dark Secrets is the fifth map in a very popular adventure map series. Once again you find yourself in a bit of trouble. The group whose mission was to take down the corrupt system of the prison has been captured and everything you once had is long gone.\n\nDo you have what it takes to bring things back to order and perhaps finally get out of this mess? Well see about that as you try to complete a series of different challenges ranging from parkour to puzzles.\n\nRules\nDont break or place blocks (exception: torches, monster spawners)\nTurn volume to 100%\nCollect emeralds, they are like extra points\nSet difficulty to max','',1,0,'',0,'2017-05-03 16:35:57'),(210,3,1,'Subject 248','http://azminecraftskins.com/mcpe/mcpemods/Subject 248.zip','http://azminecraftskins.com/mcpe/mcpemods/Subject 248.jpg','http://azminecraftskins.com/mcpe/mcpemods/Subject 248.jpg','DJDiamondPlayzM','','','In this map you will be the captive of an artificial intelligence which looks to be running experiments on humans. Complete a series of levels to perhaps ultimately be released from this lab of madness. This map is fairly easy to complete as it includes just a few different levels and they are all quite easy.\n\nStoryline\nSuddenly you wake up with a slightly aching head. Your memory is blank and you have no idea where you are. After a short moment a robotic voice start speaking to you. You are given a new name: Subject 248 and a set of tasks are presented to you.\n\nRules\nDont break / place blocks\nSet difficulty to -|—- (easy)','',1,0,'',0,'2017-05-03 16:35:57'),(211,3,1,'Dimension Temple','http://azminecraftskins.com/mcpe/mcpemods/Dimension Temple.zip','http://azminecraftskins.com/mcpe/mcpemods/Dimension Temple.jpg','http://azminecraftskins.com/mcpe/mcpemods/Dimension Temple.jpg','Flame100','','','Dimension Temple is a great adventure map where you play as a great adventurer. Most recently youve traveled to a temple to find the legendary dimensional diamond. There are puzzles, parkour and other challenges which you need to complete in order to complete the map and obtain the dimensional diamond.\n\nStoryline\nYou are a world famous treasure hunter who have found lots of treasures all over the world. You are now going to the Dimension Temple which will be one of your greatest adventures ever. The mission is to find the legendary dimensional diamond.\n\nMany have gone before you but they have all died because of the dangerous traps, or been lost in all infinite due to the confusing mazes or just simply given up.\n\nThere are two ways this can turn out. Either you will become one of the riches Minecraftians in the whole universe or youll die try\n\nRules\nDont break blocks\nPlay on easy or higher','',1,0,'',0,'2017-05-03 16:35:57'),(212,3,1,'Tomb Crafter: The Legendary Pickaxe','http://azminecraftskins.com/mcpe/mcpemods/Tomb Crafter: The Legendary Pickaxe.zip','http://azminecraftskins.com/mcpe/mcpemods/Tomb Crafter: The Legendary Pickaxe.jpg','http://azminecraftskins.com/mcpe/mcpemods/Tomb Crafter: The Legendary Pickaxe.jpg','Minecraftstyler777, Kevin','','','One of the most legendary pickaxes in the Minecraftian universe has been stolen by an evil force. Anyone whove got the pickaxe have an equal power to that of God. Its an immediate threat to the world and youve been sent on a mission to take back what was stolen and restore the world order.\nIts a marvelous map with breathtaking creations and an epic adventure. Even if some parts are kind of difficult to understand its definitely fun to play and offers a great variety of challenges.\n\nStoryline\nAn evil enderman has stolen the legendary pickaxe. You are a world traveler who is known for his epic missions around the world and youve been tasked with the important mission to find the pickaxe and return it to its rightful owners.\n\nRules\nSet difficulty to max\nDont destroy blocks','',1,0,'',0,'2017-05-03 16:35:57'),(213,3,1,'Jailed','http://azminecraftskins.com/mcpe/mcpemods/Jailed.zip','http://azminecraftskins.com/mcpe/mcpemods/Jailed.jpg','http://azminecraftskins.com/mcpe/mcpemods/Jailed.jpg','InvaderStein','','','Jailed is an adventure map where you are stuck in a highly secured prison. U have to escape out as you have served 5 yrs and wish to see your family…','',1,0,'',0,'2017-05-03 16:35:57'),(214,3,1,'Redstone Smart House','http://azminecraftskins.com/mcpe/mcpemods/Redstone Smart House.zip','http://azminecraftskins.com/mcpe/mcpemods/Redstone Smart House.jpg','http://azminecraftskins.com/mcpe/mcpemods/Redstone Smart House.jpg','muhanad909','','','Super Fun and Enjoyable Redstone House World!!\n\nHouse Features:\nPiston Contraptions\nBackyard\nPool w/ Lights\nDecorations\nAnd Many More!!\n\nI built this house with my imagination only. This house replicates my dream house.','',1,0,'',0,'2017-05-03 16:35:57'),(215,3,1,'InBegIn 2: Teaser','http://azminecraftskins.com/mcpe/mcpemods/InBegIn 2: Teaser.zip','http://azminecraftskins.com/mcpe/mcpemods/InBegIn 2: Teaser.jpg','http://azminecraftskins.com/mcpe/mcpemods/InBegIn 2: Teaser.jpg','FH_Miner','','','InBegIn 2: Teaser is a teaser map for the upcoming sequel of the first map in the InBegIn map series. Its a scary map with a mysterious story. You are out looking for a friend who has gone missing and soon you start finding abandoned houses and other stuff which doesnt look good. There are multiple jumpscares in the map so its not a suitable map for someone faint-hearted.\n			\nMake sure to check all chests which you find. Sometimes you will find books and papers which will explain the story.\n\nStory\nYou and a close friend of yours one day decided to go out camping in the woods. When you woke up the next morning you noticed your friend had disappeared. As you start searching for your friend you come across some abandoned houses. Will you find your friend and find out why he went missing?\n\nRules\nSet brightness to max\nSet field of view to max\nPlay on easy\nDont break blocks unless told otherwise\nCollect all items you find\nDont sleep!','',1,0,'',0,'2017-05-03 16:35:57'),(216,3,1,'The Quest 2','http://azminecraftskins.com/mcpe/mcpemods/The Quest 2.zip','http://azminecraftskins.com/mcpe/mcpemods/The Quest 2.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Quest 2.jpg','Dr.obvio','','','Thanks  guys! Okay with you guys? Well, as you can see, I made ??a continuation of the map Challenge. It is bigger and better than ever. I hope you enjoy. Visit my channel on Youtube: Dr.Óbvio Gamer.','',1,0,'',0,'2017-05-03 16:35:57'),(217,3,1,'Frostburn Mystery','http://azminecraftskins.com/mcpe/mcpemods/Frostburn Mystery.zip','http://azminecraftskins.com/mcpe/mcpemods/Frostburn Mystery.jpg','http://azminecraftskins.com/mcpe/mcpemods/Frostburn Mystery.jpg','DestroyerWarrior, HiDudeHDG','','','Frostburn Mystery is an adventure map which takes place in a small apocalyptic city. Some unknown forces have demolished most parts of the city and its your quest to find out who did it and punish them for it. Most of the gameplay takes place during the night which means its a quite scary map to play.\n\nStoryline\nSuddenly in the middle of the night you wake up with a feeling that something is very wrong. As you look around you notice that everything in the city have been destroyed. Someone or some people must have attacked and been very quick about it.\n\nAll your stuff is gone and youve now decided to go out and find out who did this to you and your city.\n\nRules\nSet difficulty to normal or hard\nDont break blocks unless told otherwise\nDont exit the boundaries of the map','',1,0,'',0,'2017-05-03 16:35:57'),(218,3,1,'Kay\'s Sword 2','http://azminecraftskins.com/mcpe/mcpemods/Kay\'s Sword 2.zip','http://azminecraftskins.com/mcpe/mcpemods/Kay\'s Sword 2.jpg','http://azminecraftskins.com/mcpe/mcpemods/Kay\'s Sword 2.jpg','JLVNGamer123','','','Follow me in channel: JL VN Gamer\n\nDownload this map and try it!','',1,0,'',0,'2017-05-03 16:35:57'),(219,3,1,'Diminutos4','http://azminecraftskins.com/mcpe/mcpemods/Diminutos4.zip','http://azminecraftskins.com/mcpe/mcpemods/Diminutos4.jpg','http://azminecraftskins.com/mcpe/mcpemods/Diminutos4.jpg','Zazueta123','','','This version added new mobs Suscribanse to learn more when the channel is updated thesober\n\nYoutube: zazueta123','',1,0,'',0,'2017-05-03 16:35:57'),(220,3,1,'Old Labolathory','http://azminecraftskins.com/mcpe/mcpemods/Old Labolathory.zip','http://azminecraftskins.com/mcpe/mcpemods/Old Labolathory.jpg','http://azminecraftskins.com/mcpe/mcpemods/Old Labolathory.jpg','Dawid1542','','','Difficult: Normal\n\nDont break block \nhope you like my map!','',1,0,'',0,'2017-05-03 16:35:57'),(221,3,1,'Spooky','http://azminecraftskins.com/mcpe/mcpemods/Spooky.zip','http://azminecraftskins.com/mcpe/mcpemods/Spooky.jpg','http://azminecraftskins.com/mcpe/mcpemods/Spooky.jpg','Haaky','','','Spooky is one of the first really good adventure maps which uses the new redstone features in version 0.15 of Minecraft PE. There are four different challenges in the map and they include parkour, find the lever, a maze and lastly a boss battle. Its a really well designed map which lets you explore some of the new possibilities in Minecraft while having fun.\nRules\nDont break or place blocks\nPlay on peaceful','',1,0,'',0,'2017-05-03 16:35:57'),(222,3,1,'Luxury Escape','http://azminecraftskins.com/mcpe/mcpemods/Luxury Escape.zip','http://azminecraftskins.com/mcpe/mcpemods/Luxury Escape.jpg','http://azminecraftskins.com/mcpe/mcpemods/Luxury Escape.jpg','SkilletCreator','','','You must play on 0.14.99.0+ because this map have PISTONS!!!','',1,0,'',0,'2017-05-03 16:35:57'),(223,3,1,'Peirasmos Realm','http://azminecraftskins.com/mcpe/mcpemods/Peirasmos Realm.zip','http://azminecraftskins.com/mcpe/mcpemods/Peirasmos Realm.jpg','http://azminecraftskins.com/mcpe/mcpemods/Peirasmos Realm.jpg','Ezekiel','','','Peirasmos Realm is an adventure map which have been in the works for over 10 months. The result is really amazing with tens of levels to complete packed with riddles, parkour, mazes and puzzles. It got all the elements to create an intriguing, exciting and enjoyable experience. Give this map a try and see if youve got what it takes to claim the throne and become the one ruler of Peirasmos Realm!\nStoryline\nYou are the chosen one and have been sent to this realm on an ultimate test to see if you have what it takes to claim the throne of Peirasmos Realm. The only way to find out is to complete all of the challenges.\n\nRules\nDont destroy blocks unless told to do so\nSet difficulty to max\nPlay in survival mode','',1,0,'',0,'2017-05-03 16:35:57'),(224,3,1,'Desert Dungeon','http://azminecraftskins.com/mcpe/mcpemods/Desert Dungeon.zip','http://azminecraftskins.com/mcpe/mcpemods/Desert Dungeon.jpg','http://azminecraftskins.com/mcpe/mcpemods/Desert Dungeon.jpg','Luma','','','This is a custom dungeon where you have to conquer a bunch of monsters to get the treasure at the top of the highest tower. You should also break the spawners… ','',1,0,'',0,'2017-05-03 16:35:57'),(225,3,1,'Tomb Crafter 4: Illuminati','http://azminecraftskins.com/mcpe/mcpemods/Tomb Crafter 4: Illuminati.zip','http://azminecraftskins.com/mcpe/mcpemods/Tomb Crafter 4: Illuminati.jpg','http://azminecraftskins.com/mcpe/mcpemods/Tomb Crafter 4: Illuminati.jpg','minecraftstyler777','','','Tomb Crafter 4: Illuminati takes you for an adventure to the Illuminati stronghold on a quest to find some ancient magical clothes. The map includes several mob battles, parkour, traps and much more which makes it a really entertaining and interesting map. This is a series of now four maps and all of them are definitely worth playing.\nInstructions\nYou are out on a mission again but this time you are looking to find the magical Illuminatis clothes. There are 12 hidden gold treasures in the map. Each of them include a code which is needed to find a secret room. If you cant find the room then scroll down to watch the video further down on this page to find out how to do it.\nRules\nSet difficulty to max\nUse beds as checkpoints','',1,0,'sVCAq9Ba0-w',0,'2017-05-03 16:35:57'),(226,3,1,'Stampys Lovely World','http://azminecraftskins.com/mcpe/mcpemods/Stampys Lovely World.zip','http://azminecraftskins.com/mcpe/mcpemods/Stampys Lovely World.jpg','http://azminecraftskins.com/mcpe/mcpemods/Stampys Lovely World.jpg','MuffymGamer','','','0.14.0+ \nThis map has almost everything that stampy build','',1,0,'',0,'2017-05-03 16:35:57'),(227,3,1,'The Lab','http://azminecraftskins.com/mcpe/mcpemods/The Lab.zip','http://azminecraftskins.com/mcpe/mcpemods/The Lab.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Lab.jpg','SkyMonPlays','','','Versions: 0.14.0\nThe Lab is a challenging adventure, puzzle and parkour map with a very different (but funny) storyline. During an experiment to create a growth serum for pigs the scientist accidently added the wrong ingredient causing the pig to behave very angrily.\nThis wasnt noticed until the pig had grown to an enormous size and destroyed most parts of the lab and was now on its way to destroy the city as well. Who could have thought that a giant pig would be the one and most difficult threat to the survival of the human race?\nStoryline\nA scientist have for quite some time being doing experiments with pigs in several attempts to create a growth serum. In the most recently experiment the scientist accidently put the wrong ingredient in the growth serum which caused the pig to grow to incredible size but at the same time become really strong and mad.\n\nNo one took notice until it was too late and the pig has wrecked the entire lab and a big part of the city. The Minecraftian government have you put on the task to go in there, find the pig and solve the problem.\n\nRules\nDont break blocks\nSet difficulty to peaceful','',1,0,'',0,'2017-05-03 16:35:57'),(228,3,1,'Sky World Beta V1.1','http://azminecraftskins.com/mcpe/mcpemods/Sky World Beta V1.1.zip','http://azminecraftskins.com/mcpe/mcpemods/Sky World Beta V1.1.jpg','http://azminecraftskins.com/mcpe/mcpemods/Sky World Beta V1.1.jpg','allusivechunk31','','','Versions: 0.15.0\nSkyworld new map survival adventure fun with this new map created by me for ustes I enjoy it \nThe map is in beta \nSkyworld 1.1\nIn the next updates will add more things more islands more adventure more good omocion no more to say','',1,0,'',0,'2017-05-03 16:35:57'),(229,3,1,'Invenciones 1','http://azminecraftskins.com/mcpe/mcpemods/Invenciones 1.zip','http://azminecraftskins.com/mcpe/mcpemods/Invenciones 1.jpg','http://azminecraftskins.com/mcpe/mcpemods/Invenciones 1.jpg','kapiolando','','','Versions: 0.15.0\n\nWelcome to the new map \"Invention 1\".\nThat is the map?\n-The Map is inventing things\nThat will map?\nThe map will invent, search for materials, crafting, killing mobs, etc.','',1,0,'',0,'2017-05-03 16:35:57'),(230,3,1,'Redstone Elevator','http://azminecraftskins.com/mcpe/mcpemods/Redstone Elevator.zip','http://azminecraftskins.com/mcpe/mcpemods/Redstone Elevator.jpg','http://azminecraftskins.com/mcpe/mcpemods/Redstone Elevator.jpg','xXCJtheWolfXx','','','Redstone Elevator\n\nTwitter: @_the_tigovsky_','',1,0,'',0,'2017-05-03 16:35:57'),(231,3,1,'High School','http://azminecraftskins.com/mcpe/mcpemods/High School.zip','http://azminecraftskins.com/mcpe/mcpemods/High School.jpg','http://azminecraftskins.com/mcpe/mcpemods/High School.jpg','chunchopro','','','This is High school map :D\ndownload and play map!','',1,0,'',0,'2017-05-03 16:35:57'),(232,3,1,'The 8 Portals','http://azminecraftskins.com/mcpe/mcpemods/The 8 Portals.zip','http://azminecraftskins.com/mcpe/mcpemods/The 8 Portals.jpg','http://azminecraftskins.com/mcpe/mcpemods/The 8 Portals.jpg','TriiCraft','','','Hope you like my maps :D','',1,0,'',0,'2017-05-03 16:35:57'),(233,3,1,'Unexpected Map','http://azminecraftskins.com/mcpe/mcpemods/Unexpected Map.zip','http://azminecraftskins.com/mcpe/mcpemods/Unexpected Map.jpg','http://azminecraftskins.com/mcpe/mcpemods/Unexpected Map.jpg','souhail3907','','','Unexpected Map for player !!!','',1,0,'',0,'2017-05-03 16:35:57'),(234,3,1,'Framed A Short Story V2','http://azminecraftskins.com/mcpe/mcpemods/Framed A Short Story V2.zip','http://azminecraftskins.com/mcpe/mcpemods/Framed A Short Story V2.jpg','http://azminecraftskins.com/mcpe/mcpemods/Framed A Short Story V2.jpg','LordOfMythology','','','v2: Fixed problems.','',1,0,'',0,'2017-05-03 16:35:57'),(235,3,1,'Old Castle','http://azminecraftskins.com/mcpe/mcpemods/Old Castle.zip','http://azminecraftskins.com/mcpe/mcpemods/Old Castle.jpg','http://azminecraftskins.com/mcpe/mcpemods/Old Castle.jpg','VRSix','','','you are going in that castle in order to explore or find out why people are not coming often and abandoned the castle! Its your time to find out!','',1,0,'yC322ihCJ4U',0,'2017-05-03 16:35:57'),(236,3,1,'Underwater House','http://azminecraftskins.com/mcpe/mcpemods/Underwater House.zip','http://azminecraftskins.com/mcpe/mcpemods/Underwater House.jpg','http://azminecraftskins.com/mcpe/mcpemods/Underwater House.jpg','MuffymGamer','','','Underwater House\nThis map is very big','',1,0,'',0,'2017-05-03 16:35:57'),(237,3,1,'Level Adventure','http://azminecraftskins.com/mcpe/mcpemods/Level Adventure.zip','http://azminecraftskins.com/mcpe/mcpemods/Level Adventure.jpg','http://azminecraftskins.com/mcpe/mcpemods/Level Adventure.jpg','YussinLP','','','Hello Guys,\n\nThis is my first Adventure Map. I want to show it to you.\n\nPlease give me Feedback to build better Maps.\n\nGood Luck ;)','',1,0,'',0,'2017-05-03 16:35:57'),(238,3,1,'The Subject Chapter 1','http://azminecraftskins.com/mcpe/mcpemods/The Subject Chapter 1.zip','http://azminecraftskins.com/mcpe/mcpemods/The Subject Chapter 1.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Subject Chapter 1.jpg','DannyDevles','','','he subject is a adventure map combining survival, parkour, and mazes with 90+ minute of gameplay!\n\nStory: one day you woke up on grass not remembering anything that happen before but what worse you are trapped in giant wall forming a shape of a box knowing that someone using you  as a subject for an unknown experiment, can you survive?.\n\nRule:\n\nDont break block unless told so\n\nPlay on normal difficulty\n\nDont cheat or using mod\n\nHave fun','',1,0,'',0,'2017-05-03 16:35:57'),(239,3,1,'Monster Hunter 3 S','http://azminecraftskins.com/mcpe/mcpemods/Monster Hunter 3 S.zip','http://azminecraftskins.com/mcpe/mcpemods/Monster Hunter 3 S.jpg','http://azminecraftskins.com/mcpe/mcpemods/Monster Hunter 3 S.jpg','MrCatGames','','','hope you like my map, still not finished lacks much, but the first world that is almost the only Island Sea Lacks ... Even missing nine worlds to create.','',1,0,'',0,'2017-05-03 16:35:57'),(240,3,1,'Wolf Run (Remastered version)','http://azminecraftskins.com/mcpe/mcpemods/Wolf Run (Remastered version).zip','http://azminecraftskins.com/mcpe/mcpemods/Wolf Run (Remastered version).jpg','http://azminecraftskins.com/mcpe/mcpemods/Wolf Run (Remastered version).jpg','TriiCraft','','','Not enough adrenaline ? This card will give you a lot of funny experiences while youre running from irate wolves !\n\nHow to play?\nFirst, go around all the rooms , select the difficulty of the game by using the buttons , put on armor , potions and cook finally take the eggs out of the chest spawn wolves . Spawn to start one or two predators , hit them and quickly run through the tricky levels to the finish line !','',1,0,'',0,'2017-05-03 16:35:57'),(241,3,1,'The Door','http://azminecraftskins.com/mcpe/mcpemods/The Door.zip','http://azminecraftskins.com/mcpe/mcpemods/The Door.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Door.jpg','TriiCraft','','','You have to complete tasks to open the doors and make your way out can you do it this map includes redstones','',1,0,'',0,'2017-05-03 16:35:57'),(242,3,1,'Can you survive','http://azminecraftskins.com/mcpe/mcpemods/Can you survive.zip','http://azminecraftskins.com/mcpe/mcpemods/Can you survive.jpg','http://azminecraftskins.com/mcpe/mcpemods/Can you survive.jpg','MuffymGamer','','','This map is cool. It is like a cool adventure map','',1,0,'',0,'2017-05-03 16:35:57'),(243,3,1,'Area51Map','http://azminecraftskins.com/mcpe/mcpemods/Area51Map.zip','http://azminecraftskins.com/mcpe/mcpemods/Area51Map.jpg','http://azminecraftskins.com/mcpe/mcpemods/Area51Map.jpg','cristianplayrap','','','Hello everyone Today I bring you this map of Area 51','',1,0,'EEeUtFQQ984',0,'2017-05-03 16:35:57'),(244,3,1,'Resident evil 4','http://azminecraftskins.com/mcpe/mcpemods/Resident evil 4.zip','http://azminecraftskins.com/mcpe/mcpemods/Resident evil 4.jpg','http://azminecraftskins.com/mcpe/mcpemods/Resident evil 4.jpg','jorpaelminero','','','Resident evil 4 map with zombie','',1,0,'',0,'2017-05-03 16:35:57'),(245,3,1,'Adventure Boxes','http://azminecraftskins.com/mcpe/mcpemods/Adventure Boxes.zip','http://azminecraftskins.com/mcpe/mcpemods/Adventure Boxes.jpg','http://azminecraftskins.com/mcpe/mcpemods/Adventure Boxes.jpg','VRSix','','','This map has the large box with various challenges. You must find ways to overcome these challenges to go through the door and then to the other box. Map includes genres like: pakour, ingenuity, searching, simple and troll king, … I hope you will enjoy this map.Thank.','',1,0,'pfe9AzYdoJg',0,'2017-05-03 16:35:57'),(246,3,1,'Simple','http://azminecraftskins.com/mcpe/mcpemods/Simple.zip','http://azminecraftskins.com/mcpe/mcpemods/Simple.jpg','http://azminecraftskins.com/mcpe/mcpemods/Simple.jpg','DelisoJan','','','Simple is a fun adventure map with many parkour and puzzle challenges which require solving. In total there is about 25 minutes worth of gameplay. Its all set in an old castle so the environment is really fun to explore. It doesnt have much of a storyline but we suppose you could invent your own reason for going to the castle.\nRules\nSet difficulty to peaceful\nSet render distance to low or medium\nDont break blocks unless told otherwise\nDont climb trees','',1,0,'',0,'2017-05-03 16:35:57'),(247,3,0,'Turok Dimension','http://azminecraftskins.com/mcpe/mcpemods/Turok Dimension.zip','http://azminecraftskins.com/mcpe/mcpemods/Turok Dimension.jpg','http://azminecraftskins.com/mcpe/mcpemods/Turok Dimension.jpg','generalhawkins','','','Let us begin by just noting that this map includes more than fifty different types of challenges. For the most part they relate to mob battles and parkour. The reason why we decided to review this map was primarily because of the amazing amount of hours it must have taken to build this.\nThe creations in the map arent necessarily the most amazing looking but thats the part which makes it unique and fun to play. Play this map if you are looking for an adventure with lots of different challenges.\nImportant: Before starting the adventure make sure to set the map to survival mode. You can click on the edit button to the right of the world title in Minecraft PE to do this.','',1,0,NULL,0,'2017-05-03 16:35:57'),(248,3,0,'The Prision','http://azminecraftskins.com/mcpe/mcpemods/The Prision.zip','http://azminecraftskins.com/mcpe/mcpemods/The Prision.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Prision.jpg','kapiolando','','','Read before downloading. Before starting the map having the most difficulty because otherwise no good. Do not forget to leave your like and comment','',1,0,NULL,0,'2017-05-03 16:35:57'),(249,3,0,'World of keralis.','http://azminecraftskins.com/mcpe/mcpemods/World of keralis..zip','http://azminecraftskins.com/mcpe/mcpemods/World of keralis..jpg','http://azminecraftskins.com/mcpe/mcpemods/World of keralis..jpg','Kakkak','','','Hope you like this map thank','',1,0,NULL,0,'2017-05-03 16:35:57'),(250,3,0,'Map Grand Theft Auto','http://azminecraftskins.com/mcpe/mcpemods/Map Grand Theft Auto.zip','http://azminecraftskins.com/mcpe/mcpemods/Map Grand Theft Auto.jpg','http://azminecraftskins.com/mcpe/mcpemods/Map Grand Theft Auto.jpg','locapzo','','','Update map for Minecraft PE versions 0.14.0','',1,0,NULL,0,'2017-05-03 16:35:57'),(251,3,0,'Tomb Crafter 2: Egypt','http://azminecraftskins.com/mcpe/mcpemods/Tomb Crafter 2: Egypt.zip','http://azminecraftskins.com/mcpe/mcpemods/Tomb Crafter 2: Egypt.jpg','http://azminecraftskins.com/mcpe/mcpemods/Tomb Crafter 2: Egypt.jpg','minecraftstyler777, chipscz','','','Tomb Crafter 2: Egypt is an adventure map inspired by the Tomb Raider adventure games. Your mission is to venture into an old temple and obtain an ancient (and possibly magic) artifact known as Tutankhamuns helmet. Some of the challenges include parkour, a puzzle and mob battles. Be careful and watch out for the deadly traps.\nStoryline\nYouve been sent to Egypt on a mission to find and retrieve a long forgotten artifact known as Tutankhamuns helmet. Its believed to give whoever wears the helmet god-like powers and as a result you can probably imagine its worth. (Tutankhamun was actually an Egyptian pharaoh (1332-1323 BC). The story about the helmet with magic powers is fiction though, just thought Id clarify that.)\nRules\nSet difficulty to max\nGamemode must be set to survival\nThere are several traps throughout the map. Be careful, otherwise theres a good chance youll die and have to start over.\nIf you enjoyed this map make sure to check out Tomb Crafter 1. Personally, I think part 2 was better but part 1 is definitely worth playing too!','',1,0,NULL,0,'2017-05-03 16:35:57'),(252,3,0,'Temple Adventure V0.1','http://azminecraftskins.com/mcpe/mcpemods/Temple Adventure V0.1.zip','http://azminecraftskins.com/mcpe/mcpemods/Temple Adventure V0.1.jpg','http://azminecraftskins.com/mcpe/mcpemods/Temple Adventure V0.1.jpg','RieLiIcECoOl','','','Made In Indonesia\nJangan Lupa Join Grub FB Kami\nBerbagi Info MCPE Indonesia','',1,0,NULL,0,'2017-05-03 16:35:57'),(253,3,0,'Mysterious Witch V2','http://azminecraftskins.com/mcpe/mcpemods/Mysterious Witch V2.zip','http://azminecraftskins.com/mcpe/mcpemods/Mysterious Witch V2.jpg','http://azminecraftskins.com/mcpe/mcpemods/Mysterious Witch V2.jpg','GentaMCPE','','','A small family that live in a mystery forest, 1 day the mother accidently dead. From that day the father always feel upset and leave Marry behind, he went to the forest until Marry found the truth behind, the adventure begin…\n\nMap Rules:\n\n- Follow the story lines\n\n- Difficulty: Normal','',1,0,NULL,0,'2017-05-03 16:35:57'),(254,3,0,'Modern House','http://azminecraftskins.com/mcpe/mcpemods/Modern House.zip','http://azminecraftskins.com/mcpe/mcpemods/Modern House.jpg','http://azminecraftskins.com/mcpe/mcpemods/Modern House.jpg','MnabilYaser','','','Hello guys!\n\nI have made a new modern house for MCPE…\n\nThis is my second housing map so plz like it :)\n\nThis map also contains some redstones but only 4 which way different from my first one (the first 1 is redstone-themed modern house)\n\nRedstones in the map:\n\n1) Toggle Trapdoor as fence gate\n\n2) 2 doors opened when you step on the pressure plate\n\n3) Item frame door lock\n\n4) Auto-brewing station','',1,0,NULL,0,'2017-05-03 16:35:57'),(255,3,0,'Summoners Rift','http://azminecraftskins.com/mcpe/mcpemods/Summoners Rift.zip','http://azminecraftskins.com/mcpe/mcpemods/Summoners Rift.jpg','http://azminecraftskins.com/mcpe/mcpemods/Summoners Rift.jpg','Bình Thuo`ng','','','Map for fan\'s game  LoL or Dota Allstar :D','',1,0,NULL,0,'2017-05-03 16:35:57'),(256,3,0,'The AfterHand Map','http://azminecraftskins.com/mcpe/mcpemods/The AfterHand Map.zip','http://azminecraftskins.com/mcpe/mcpemods/The AfterHand Map.jpg','http://azminecraftskins.com/mcpe/mcpemods/The AfterHand Map.jpg','DiamondKing567','','','You must get out alive or stay stranded on another planet!!! Your mission is to escape. Map III infected will be the next map after this one!!! Good Luck astronauts!!!!','',1,0,NULL,0,'2017-05-03 16:35:57'),(257,3,1,'Game of Thrones: Winterfell','http://azminecraftskins.com/mcpe/mcpemods/Game of Thrones: Winterfell.zip','http://azminecraftskins.com/mcpe/mcpemods/Game of Thrones: Winterfell.jpg','http://azminecraftskins.com/mcpe/mcpemods/Game of Thrones: Winterfell.jpg','Diaboli','','','Versions: 0.14.0+ \nThe Game of Thrones: Winterfell Minecraft PE map is an awesome map. It is a remake of the glorious city from the popular TV series, perfectly replicated in Minecraft Pocket Edition. If you are a fan of the GoT series, this is a must have for your map collection!','',1,0,NULL,0,'2017-05-03 16:35:57'),(258,3,1,'The Redstone Map','http://azminecraftskins.com/mcpe/mcpemods/The Redstone Map.zip','http://azminecraftskins.com/mcpe/mcpemods/The Redstone Map.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Redstone Map.jpg','Coolman1976','','','Versions: 0.14.0+\nA awsome map that has redstone puzzles and redstone mini games','',1,0,NULL,0,'2017-05-03 16:35:57'),(259,3,1,'Village-MurderMystery','http://azminecraftskins.com/mcpe/mcpemods/Village-MurderMystery.zip','http://azminecraftskins.com/mcpe/mcpemods/Village-MurderMystery.jpg','http://azminecraftskins.com/mcpe/mcpemods/Village-MurderMystery.jpg','weidelix','','','Versions: 0.14.0+\nHello guys this is my third map that being posted and Im sorry for having just one picture being shown\nIf you want to see all map just just hit that download button and your done','',1,0,NULL,0,'2017-05-03 16:35:57'),(260,3,1,'The Robbers','http://azminecraftskins.com/mcpe/mcpemods/The Robbers.zip','http://azminecraftskins.com/mcpe/mcpemods/The Robbers.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Robbers.jpg','HeatDroid','','','Versions: 0.14.0+\n Hello guys Im HeatDroid, welcome to my new map on Mcpe called “The Robbers”','',1,0,NULL,0,'2017-05-03 16:35:57'),(261,3,1,'Karmaland2','http://azminecraftskins.com/mcpe/mcpemods/Karmaland2.zip','http://azminecraftskins.com/mcpe/mcpemods/Karmaland2.jpg','http://azminecraftskins.com/mcpe/mcpemods/Karmaland2.jpg','TheFlash2k16','','','Versions: 0.14.0+ \nHello friends I hope you like my map I take much doing it if you do please let credit review and subscribe in my channel','',1,0,NULL,0,'2017-05-03 16:35:57'),(262,3,1,'Adventure Map','http://azminecraftskins.com/mcpe/mcpemods/Adventure Map.zip','http://azminecraftskins.com/mcpe/mcpemods/Adventure Map.jpg','http://azminecraftskins.com/mcpe/mcpemods/Adventure Map.jpg','AllenGaming','','','Versions: 0.14.0+ \nThis Is A Easy Map Guys Hope You Like It  I Will Continue This Map :)','',1,0,NULL,0,'2017-05-03 16:35:57'),(263,3,1,'GTA Sand Andreas','http://azminecraftskins.com/mcpe/mcpemods/GTA Sand Andreas.zip','http://azminecraftskins.com/mcpe/mcpemods/GTA Sand Andreas.jpg','http://azminecraftskins.com/mcpe/mcpemods/GTA Sand Andreas.jpg','BEMID','','','Versions: 0.14.0+ \n\nConsoles and PC to PC now in your QSPM ... Enjoy this beautiful map of Minecraft ported to PC QSPM','',1,0,NULL,0,'2017-05-03 16:35:57'),(264,3,1,'Nablios Castle','http://azminecraftskins.com/mcpe/mcpemods/Nablios Castle.zip','http://azminecraftskins.com/mcpe/mcpemods/Nablios Castle.jpg','http://azminecraftskins.com/mcpe/mcpemods/Nablios Castle.jpg','K4zzgamer','','','Versions: 0.13.0+ \nStory : you from little town , and nablios kill all you family \n\nYou quest to revenge to your family and kill nablios','',1,0,NULL,0,'2017-05-03 16:35:57'),(265,3,1,'HATERS','http://azminecraftskins.com/mcpe/mcpemods/HATERS.zip','http://azminecraftskins.com/mcpe/mcpemods/HATERS.jpg','http://azminecraftskins.com/mcpe/mcpemods/HATERS.jpg','ferddgamer1','','','Versions: 0.14.0+ \nThis is a map for Minecraft PE ADVENTURE 0.14.0\n\nI HOPE YOU LIKE IT\n\nDiscusses the HATERS!','',1,0,NULL,0,'2017-05-03 16:35:57'),(266,3,1,'The castle of scream','http://azminecraftskins.com/mcpe/mcpemods/The castle of scream.zip','http://azminecraftskins.com/mcpe/mcpemods/The castle of scream.jpg','http://azminecraftskins.com/mcpe/mcpemods/The castle of scream.jpg','','','','Versions: 0.13.0+\nThis is map for think… You are driving car and crash in forest but you find madhouse and explore that game create niks 999 please commented. This game adventure','',1,0,NULL,0,'2017-05-03 16:35:57'),(267,3,1,'Prison Escape','http://azminecraftskins.com/mcpe/mcpemods/Prison Escape.zip','http://azminecraftskins.com/mcpe/mcpemods/Prison Escape.jpg','http://azminecraftskins.com/mcpe/mcpemods/Prison Escape.jpg','weemen','','','Versions: 0.13.0+\nThis is the updated version of Prson Escape Hope u guys will like it :D','',1,0,NULL,0,'2017-05-03 16:35:57'),(268,3,1,'Star Wars Theme Park','http://azminecraftskins.com/mcpe/mcpemods/Star Wars Theme Park.zip','http://azminecraftskins.com/mcpe/mcpemods/Star Wars Theme Park.jpg','http://azminecraftskins.com/mcpe/mcpemods/Star Wars Theme Park.jpg','YoutubeAGHQ','','','Versions: 0.13.0+\nThis beautifully designed and detailed world brings the incredible Star Wars universe to Minecraft Pocket Edition. This creation is riddled with many attractions, rides, adventures, and more!\nThe world is NOT limited to these things, for there is more to explore!','',1,0,NULL,0,'2017-05-03 16:35:57'),(269,3,1,'Biosphere PE','http://azminecraftskins.com/mcpe/mcpemods/Biosphere PE.zip','http://azminecraftskins.com/mcpe/mcpemods/Biosphere PE.jpg','http://azminecraftskins.com/mcpe/mcpemods/Biosphere PE.jpg','daiky x','','','Biosphere PE\n\nPCMOD,[Biosphere]\n\nMOD Developer[Risugami]','',1,0,NULL,0,'2017-05-03 16:35:57'),(270,3,1,'Emerald Quest','http://azminecraftskins.com/mcpe/mcpemods/Emerald Quest.zip','http://azminecraftskins.com/mcpe/mcpemods/Emerald Quest.jpg','http://azminecraftskins.com/mcpe/mcpemods/Emerald Quest.jpg','ThrillerXD','','','Versions: 0.13.0+ \n3 Block od emerald were stolen from villagers and you must get them back to their place in cave.','',1,0,NULL,0,'2017-05-03 16:35:57'),(271,3,1,'ZombieKing Boss (Short and Small map)','http://azminecraftskins.com/mcpe/mcpemods/ZombieKing Boss (Short and Small map).zip','http://azminecraftskins.com/mcpe/mcpemods/ZombieKing Boss (Short and Small map).jpg','http://azminecraftskins.com/mcpe/mcpemods/ZombieKing Boss (Short and Small map).jpg','SThitch','','','Versions: 0.13.0+ \nHey guys ST here! Uhm ive created a small boss fight map. Hope you guys Enjoy and Like!\nGame Info: You must kill the ZombieKing by hitting the 4 buttons.','',1,0,NULL,0,'2017-05-03 16:35:57'),(272,3,1,'Sky Blocks','http://azminecraftskins.com/mcpe/mcpemods/Sky Blocks.zip','http://azminecraftskins.com/mcpe/mcpemods/Sky Blocks.jpg','http://azminecraftskins.com/mcpe/mcpemods/Sky Blocks.jpg','NNN312126','','','New adventure sky map!','',1,0,NULL,0,'2017-05-03 16:35:57'),(273,3,1,'Creeper House PT 1','http://azminecraftskins.com/mcpe/mcpemods/Creeper House PT 1.zip','http://azminecraftskins.com/mcpe/mcpemods/Creeper House PT 1.jpg','http://azminecraftskins.com/mcpe/mcpemods/Creeper House PT 1.jpg','Jrmayhem','','','Versions: 0.13.0+ \nThank You for Downloading My map \n\nAnd thanks For Weidelix And Kervin\n\nFor Helping me in this map','',1,0,NULL,0,'2017-05-03 16:35:57'),(274,3,1,'Arenas Adventure','http://azminecraftskins.com/mcpe/mcpemods/Arenas Adventure.zip','http://azminecraftskins.com/mcpe/mcpemods/Arenas Adventure.jpg','http://azminecraftskins.com/mcpe/mcpemods/Arenas Adventure.jpg','alexerlebg','','','Versions: 0.13.0+\nThat is MY First map ADVENTURE.YOU WILL HAVE 4 ARENAS + 1 bonus ;) IF you are very strong in minecraft,play on difficult ! He Will HAVE OTHER ARENAS(with NETHER Monster)','',1,0,NULL,0,'2017-05-03 16:35:57'),(275,3,1,'The Name','http://azminecraftskins.com/mcpe/mcpemods/The Name.zip','http://azminecraftskins.com/mcpe/mcpemods/The Name.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Name.jpg','GentaMCPE','','','Versions: 0.13.0+ \nFollow the instructions of the map to win','',1,0,NULL,0,'2017-05-03 16:35:57'),(276,3,1,'The Simpsons Adventure','http://azminecraftskins.com/mcpe/mcpemods/The Simpsons Adventure.zip','http://azminecraftskins.com/mcpe/mcpemods/The Simpsons Adventure.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Simpsons Adventure.jpg','Mjhurtado','','','The Simpsons Adventure is a fun and scary adventure map which is based around The Simpsons and its characters. For the most part you are required to fight zombies and do a whole lot of running from one building to another as you try to find a solution for this zombie invasion. Nonetheless, its an enjoyable adventure where you get to experience the city of Springfield, meeting many famous characters from the show and fight zombies.\nRules\nRead all signs\nOnly enter buildings when signs/books advice you to\nNever break any blocks unless told to\nUse levers to open iron doors\nPlayer on a difficulty level which spawns zombies, preferably difficulty: —|\nHow to play the map?\nTo really get in tune with the adventure we highly recommend to use Homer Simpsons skin as its Homer the story is based around. As you spawn in the world you will find yourself stranded on the roof of Moes Tavern in Springfield. But things dont seem normal, there are zombies roaming the streets. Either you are just really drunk or something extremely bad must have happened.\n\nMr Burns appears to be the villain responsible for this chaos and its up to you to stop him and his army of zombies.\n\nThe download includes a text file which will act as the storyline (click here to access the book). At some places in-game there will be chests with a book and a sign. This will let you know when its time to start reading the book.\n\nMap Ending (important info) (dont read if you hate map spoilers!): After youve killed the Enderman boss the map appears to end. It seems as an abrupt ending but we havent figured out what to do next. If you do, let us know. If not, maybe thats just how its supposed to end.','',1,0,NULL,0,'2017-05-03 16:35:57'),(277,3,1,'Save Christmas','http://azminecraftskins.com/mcpe/mcpemods/Save Christmas.zip','http://azminecraftskins.com/mcpe/mcpemods/Save Christmas.jpg','http://azminecraftskins.com/mcpe/mcpemods/Save Christmas.jpg','The Order of the RedStone','','','Santa And you\'re gone around the world giving Gifts, a village only 1 km from the North Pole Missing, must finish the job ... Christmas','',1,0,NULL,0,'2017-05-03 16:35:57'),(278,3,1,'Map of the Century','http://azminecraftskins.com/mcpe/mcpemods/Map of the Century.zip','http://azminecraftskins.com/mcpe/mcpemods/Map of the Century.jpg','http://azminecraftskins.com/mcpe/mcpemods/Map of the Century.jpg','GamerGoldChance','','','Versions: 0.13.0+ \nHerobrine has stolen the Notch Apple. He wants to use it to become the most powerful player in Minecraft. You, GGC, Rob, and Brain need to get it back.\n\nKeep difficulty on!!!\n\nThis map has Parkour, TRIVIA, Fighting and Mining.','',1,0,NULL,0,'2017-05-03 16:35:57'),(279,3,1,'Arnazenia Adventures','http://azminecraftskins.com/mcpe/mcpemods/Arnazenia Adventures.zip','http://azminecraftskins.com/mcpe/mcpemods/Arnazenia Adventures.jpg','http://azminecraftskins.com/mcpe/mcpemods/Arnazenia Adventures.jpg','Rendelberry','','','Versions: 0.13.0+ \nPlease dont cheat there are too many chests scattered all over the map.The map has also shops, dungeon and small quests from villagers. Please kepp the papers with the text “chest obtained and help quest obtained” because it will serve as your score. Other instructions is on the info building . Your journey will start on the forest near the checkpoint house','',1,0,NULL,0,'2017-05-03 16:35:57'),(280,3,1,'Christmas Quest SkyBlock','http://azminecraftskins.com/mcpe/mcpemods/Christmas Quest SkyBlock.zip','http://azminecraftskins.com/mcpe/mcpemods/Christmas Quest SkyBlock.jpg','http://azminecraftskins.com/mcpe/mcpemods/Christmas Quest SkyBlock.jpg','Rtiion','','','Versions: 0.13.0+ \nChristmas Quest SkyBlock is an epic parkour adventure in the air! Quality builds, every jump is possible! Challenge your parkour skills and save christmas\n\nStory: Santa lost the presents, and blamed it on your little brother Billy. Billy was captured by santas elves and you must find all 5 presents to prove to santa that your brother did not steal them! You must save christmas.\n\nRules written on the map! Have fun and follow the rules for the ultimate challenge!!','',1,0,NULL,0,'2017-05-03 16:35:57'),(281,3,1,'Mistery School','http://azminecraftskins.com/mcpe/mcpemods/Mistery School.zip','http://azminecraftskins.com/mcpe/mcpemods/Mistery School.jpg','http://azminecraftskins.com/mcpe/mcpemods/Mistery School.jpg','MisteryDead23','','','Versions: 0.13.0+ \nRuler :\n\n1.Dont Breaking And Place Block\n\n2.Dont Mods and Cheat\n\n3.Diffuculty OFF\n\n4.Story In Maps','',1,0,NULL,0,'2017-05-03 16:35:57'),(282,3,1,'BOSS-BATTLE','http://azminecraftskins.com/mcpe/mcpemods/BOSS-BATTLE.zip','http://azminecraftskins.com/mcpe/mcpemods/BOSS-BATTLE.jpg','http://azminecraftskins.com/mcpe/mcpemods/BOSS-BATTLE.jpg','Genta MCPE','','','Boss Battle\nCreator: Genta MCPE \nType: Survival, Adventure, Parkour \nDifficult :2/5\nVersion: 0.13.X \nContent \nYou are a warrior chosen by King Steve to defeat the Giant Bosses to save everyone but with agility, you will win all Bosses!','',1,0,NULL,0,'2017-05-03 16:35:57'),(283,3,1,'OnlyOneRoom','http://azminecraftskins.com/mcpe/mcpemods/OnlyOneRoom.zip','http://azminecraftskins.com/mcpe/mcpemods/OnlyOneRoom.jpg','http://azminecraftskins.com/mcpe/mcpemods/OnlyOneRoom.jpg','xFactor123','','','Versions: 0.13.0+\nThis is an awesome MCPE map it requires atleast 0.13.0 to work.This map contains of many sections which has to be compleated to be able to reach the boss and kill him this is sort of like a CTM map but without any monuments LOL','',1,0,NULL,0,'2017-05-03 16:35:57'),(284,3,1,'Mistery Castle','http://azminecraftskins.com/mcpe/mcpemods/Mistery Castle.zip','http://azminecraftskins.com/mcpe/mcpemods/Mistery Castle.jpg','http://azminecraftskins.com/mcpe/mcpemods/Mistery Castle.jpg','MisteryDead23','','','Versions: 0.13.0+\nMistery Castle by MisteryDead23\nRuler \nNo breaking and place block\nNo cheat and mods\nDiffuculty On','',1,0,NULL,0,'2017-05-03 16:35:57'),(285,3,1,'Mistery Hotel','http://azminecraftskins.com/mcpe/mcpemods/Mistery Hotel.zip','http://azminecraftskins.com/mcpe/mcpemods/Mistery Hotel.jpg','http://azminecraftskins.com/mcpe/mcpemods/Mistery Hotel.jpg','MisteryDead23','','','Versions: 0.13.0+\nWelcome !!!!!\nMistery Hotel is Horror Map Creator byMisteryDead23\nRuler :\n- Play On Diffulty Normal\n- Dont Breaking and Place Block\n- Story in the Map','',1,0,NULL,0,'2017-05-03 16:35:57'),(286,3,1,'Mistery Stronghold','http://azminecraftskins.com/mcpe/mcpemods/Mistery Stronghold.zip','http://azminecraftskins.com/mcpe/mcpemods/Mistery Stronghold.jpg','http://azminecraftskins.com/mcpe/mcpemods/Mistery Stronghold.jpg','MisteryDead23','','','Versions: 0.13.0+\nRuler Maps :\n\n1. Dont Breaking Block\n2. Diffiulty On\n3. No Mods and Cheat','',1,0,NULL,0,'2017-05-03 16:35:57'),(287,3,1,'Laboratory Adventure','http://azminecraftskins.com/mcpe/mcpemods/Laboratory Adventure.zip','http://azminecraftskins.com/mcpe/mcpemods/Laboratory Adventure.jpg','http://azminecraftskins.com/mcpe/mcpemods/Laboratory Adventure.jpg','AssassinCrafter','','','Versions: 0.13.0+\nI hope you like this Map\n\nGood Luck','',1,0,NULL,0,'2017-05-03 16:35:57'),(288,3,1,'Mistery Village','http://azminecraftskins.com/mcpe/mcpemods/Mistery Village.zip','http://azminecraftskins.com/mcpe/mcpemods/Mistery Village.jpg','http://azminecraftskins.com/mcpe/mcpemods/Mistery Village.jpg','MisteryDead23','','','Versions: 0.13.0+ \nMistery Village By MisteryDead23\n\nRuler :\n\n1.Diffuilty ON\n2.Dont Breaking and Place Block\n3.No Mod and Cheat','',1,0,NULL,0,'2017-05-03 16:35:57'),(289,3,1,'Pandoras Box','http://azminecraftskins.com/mcpe/mcpemods/Pandoras Box.zip','http://azminecraftskins.com/mcpe/mcpemods/Pandoras Box.jpg','http://azminecraftskins.com/mcpe/mcpemods/Pandoras Box.jpg','Pandora’s Box','','','Versions: 0.13.0+\nAn adventure,survival map for explorers.','',1,0,NULL,0,'2017-05-03 16:35:57'),(290,3,1,'Save Jack','http://azminecraftskins.com/mcpe/mcpemods/Save Jack.zip','http://azminecraftskins.com/mcpe/mcpemods/Save Jack.jpg','http://azminecraftskins.com/mcpe/mcpemods/Save Jack.jpg','Mac12','','','Versions: 0.13.0+ \nYour little brother Jack has been kidnapped by Slenderman You venture down the road into Slendermans territory and discover many secrets awaits you. You have to save Jack at all cost and will do any to save him. (Spoiler: You have to find the hidden pages and the Red Key in the park with infinite blindness and slowness in the first part)','',1,0,NULL,0,'2017-05-03 16:35:57'),(291,3,1,'Lost','http://azminecraftskins.com/mcpe/mcpemods/Lost.zip','http://azminecraftskins.com/mcpe/mcpemods/Lost.jpg','http://azminecraftskins.com/mcpe/mcpemods/Lost.jpg','CreeperKiller99','','','Versions: 0.13.0+\nWelcome to Lost! An mcpe adventure map! In this map, you are lost in the middle of nowhere and you must get help to get back home! This map took three days to make, spending 10 hours and more a day. Hope you guys enjoy!','',1,0,NULL,0,'2017-05-03 16:35:57'),(292,3,1,'10WaysToDie','http://azminecraftskins.com/mcpe/mcpemods/10WaysToDie.zip','http://azminecraftskins.com/mcpe/mcpemods/10WaysToDie.jpg','http://azminecraftskins.com/mcpe/mcpemods/10WaysToDie.jpg','McpeZen','','','Are you always raging when your dying?\n\nVersions: 0.13.0\nIn this map you need to die!\n\nIf you want 20 ways to die Rate This Map :D\n\nThats only! Now go download the map and kill ur self!','',1,0,NULL,0,'2017-05-03 16:35:57'),(293,3,1,'DarknessWithin','http://azminecraftskins.com/mcpe/mcpemods/DarknessWithin.zip','http://azminecraftskins.com/mcpe/mcpemods/DarknessWithin.jpg','http://azminecraftskins.com/mcpe/mcpemods/DarknessWithin.jpg','JJLXL4','','','Versions: 0.13.0+\nYou Are Finding A Tools For Your Village Then You Saw This House.. You Shouted “Hello” But No One Responds To You.. So You Decided To Open The Door By Yourself.','',1,0,NULL,0,'2017-05-03 16:35:57'),(294,3,1,'Trolland Demo','http://azminecraftskins.com/mcpe/mcpemods/Trolland Demo.zip','http://azminecraftskins.com/mcpe/mcpemods/Trolland Demo.jpg','http://azminecraftskins.com/mcpe/mcpemods/Trolland Demo.jpg','MisakiGamer','','','Demo soon complete map\nVersions: 0.13.0+','',1,0,NULL,0,'2017-05-03 16:35:57'),(295,3,1,'FNAF Adapted','http://azminecraftskins.com/mcpe/mcpemods/FNAF Adapted.zip','http://azminecraftskins.com/mcpe/mcpemods/FNAF Adapted.jpg','http://azminecraftskins.com/mcpe/mcpemods/FNAF Adapted.jpg','MarshallLeeA','','','Update versions for Minecraft PE 0.13.X\nOriginal map by: wolfman4343','',1,0,NULL,0,'2017-05-03 16:35:57'),(296,3,1,'Apocalipsis','http://azminecraftskins.com/mcpe/mcpemods/Apocalipsis.zip','http://azminecraftskins.com/mcpe/mcpemods/Apocalipsis.jpg','http://azminecraftskins.com/mcpe/mcpemods/Apocalipsis.jpg','Gerson Gamer','','','Versions: 0.13.0+ \nThis map is about a zombie apocalypse located in two villages and a hill on this map has a very great end hopefully it descargen','',1,0,NULL,0,'2017-05-03 16:35:57'),(297,3,1,'Cake Quest:The Dream Part 1','http://azminecraftskins.com/mcpe/mcpemods/Cake Quest:The Dream Part 1.zip','http://azminecraftskins.com/mcpe/mcpemods/Cake Quest:The Dream Part 1.jpg','http://azminecraftskins.com/mcpe/mcpemods/Cake Quest:The Dream Part 1.jpg','Thegodofrock666','','','Versions: 0.12.0+ \nCake Quest: The Dream is a map where you have been trapped inside your brain. Everything seems so real, but you dont want to believe it. Every night the nightmares are getting worse. And tonight wasnt better. A voice was talking to you and it didnt seem kind. You dont want to go to bed, but you have to.. you are too tired.All this might seem confusing to you, but if you enjoy being puzzled and shuffled through multiple different experiences, then this map is suitable for you.\n-Rules:\nTurn brightness to the lowest option\nPlay on medium or hard\nRead all signs\nNever place/break blocks unless told to do so','',1,0,NULL,0,'2017-05-03 16:35:57'),(298,3,1,'JuegoMacabroV1','http://azminecraftskins.com/mcpe/mcpemods/JuegoMacabroV1.zip','http://azminecraftskins.com/mcpe/mcpemods/JuegoMacabroV1.jpg','http://azminecraftskins.com/mcpe/mcpemods/JuegoMacabroV1.jpg','GersonGamer123','','','Versions: 0.13.0+\nDownload and feel it :D','',1,0,NULL,0,'2017-05-03 16:35:57'),(299,3,1,'User Vs Herobrine','http://azminecraftskins.com/mcpe/mcpemods/User Vs Herobrine.zip','http://azminecraftskins.com/mcpe/mcpemods/User Vs Herobrine.jpg','http://azminecraftskins.com/mcpe/mcpemods/User Vs Herobrine.jpg','ChobiGamer','','','Versions: 0.12.0+\nMap Created By ChobiGamer\n\nIt is a map of Aventura','',1,0,NULL,0,'2017-05-03 16:35:57'),(300,3,1,'When Night Falls','http://azminecraftskins.com/mcpe/mcpemods/When Night Falls.zip','http://azminecraftskins.com/mcpe/mcpemods/When Night Falls.jpg','http://azminecraftskins.com/mcpe/mcpemods/When Night Falls.jpg','ChillCraftMC','','','Versions: 0.12.0+\nStrange noises have been heard every night at the old ruins how ever the ruins are locked… The mystery is yours to solve…','',1,0,NULL,0,'2017-05-03 16:35:57'),(301,3,1,'El Robo','http://azminecraftskins.com/mcpe/mcpemods/El Robo.zip','http://azminecraftskins.com/mcpe/mcpemods/El Robo.jpg','http://azminecraftskins.com/mcpe/mcpemods/El Robo.jpg','Arath16','','','Versions: 0.12.0+ \nWelcome to my new adventure map This is the fourth map of adventures','',1,0,NULL,0,'2017-05-03 16:35:57'),(302,3,1,'EL Modern House 2016','http://azminecraftskins.com/mcpe/mcpemods/EL Modern House 2016.zip','http://azminecraftskins.com/mcpe/mcpemods/EL Modern House 2016.jpg','http://azminecraftskins.com/mcpe/mcpemods/EL Modern House 2016.jpg','EaveBuilder','','','Versions: 0.12.0+ \nHello Guys. This is very big house!  Just for you!','',1,0,NULL,0,'2017-05-03 16:35:57'),(303,3,1,'The Cave','http://azminecraftskins.com/mcpe/mcpemods/The Cave.zip','http://azminecraftskins.com/mcpe/mcpemods/The Cave.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Cave.jpg','MiniCTM','','','Update for Minecraft 0.12.x','',1,0,NULL,0,'2017-05-03 16:35:57'),(304,3,1,'RetornosV1','http://azminecraftskins.com/mcpe/mcpemods/RetornosV1.zip','http://azminecraftskins.com/mcpe/mcpemods/RetornosV1.jpg','http://azminecraftskins.com/mcpe/mcpemods/RetornosV1.jpg','Cchrisplay420','','','Versions: 0.12.0+\nyou are or are researchers who infiltrated a hospital for sick and your mission is to steal information from your computer to the 4th floor, arrest those responsible for what happens in that place and not look back because patients waiting and none of the patients is friendly. for while you try to climb the floors, you will reconstruct your memory and you suffered amentia And though you do not remember you had already suffered in that hospital of El escaped several years.\n\nGoal:\n\ncollect objects and climb the 4 floors and around while you do go Rebuilding your xD memory.\n\nrules:\n\nno break blocks\n\nwithout leaving map\n\nDo everything you tell them the signs\n\nand do not kill the companion\n\nNote: You can play alone or Maximum 2 Players','',1,0,NULL,0,'2017-05-03 16:35:57'),(305,3,1,'Overtaken','http://azminecraftskins.com/mcpe/mcpemods/Overtaken.zip','http://azminecraftskins.com/mcpe/mcpemods/Overtaken.jpg','http://azminecraftskins.com/mcpe/mcpemods/Overtaken.jpg','Sheepskingames','','','Versions : 0.12.0+\nA Minecraft Pocket Edition Adventure Map','',1,0,NULL,0,'2017-05-03 16:35:57'),(306,3,1,'Save Your Family','http://azminecraftskins.com/mcpe/mcpemods/Save Your Family.zip','http://azminecraftskins.com/mcpe/mcpemods/Save Your Family.jpg','http://azminecraftskins.com/mcpe/mcpemods/Save Your Family.jpg','BESTKILLERHD','','','Versions: 0.12.0+\nRules:  \n1. Do not break any block\n2. Play on hard.\nStory:  you where out of the house and the zombies kidnapped your family and you must save your family.','',1,0,NULL,0,'2017-05-03 16:35:57'),(307,3,1,'CyllerHorrorMap2','http://azminecraftskins.com/mcpe/mcpemods/CyllerHorrorMap2.zip','http://azminecraftskins.com/mcpe/mcpemods/CyllerHorrorMap2.jpg','http://azminecraftskins.com/mcpe/mcpemods/CyllerHorrorMap2.jpg','ivanthegamer07@','','','Versions: 0.11.0+\nBit late but here you go\n\nEnjoy!','',1,0,NULL,0,'2017-05-03 16:35:57'),(308,3,1,'Reign of Fire','http://azminecraftskins.com/mcpe/mcpemods/Reign of Fire.zip','http://azminecraftskins.com/mcpe/mcpemods/Reign of Fire.jpg','http://azminecraftskins.com/mcpe/mcpemods/Reign of Fire.jpg','MapsMaker','','','Version: 0.12.0+ \n	Download and Good Luck!','',1,0,NULL,0,'2017-05-03 16:35:57'),(309,3,1,'LostInTheWoods','http://azminecraftskins.com/mcpe/mcpemods/LostInTheWoods.zip','http://azminecraftskins.com/mcpe/mcpemods/LostInTheWoods.jpg','http://azminecraftskins.com/mcpe/mcpemods/LostInTheWoods.jpg','RebelTheKid','','','Welcome To My First Map,Lost In The Woods.\n\nCreated By Me And RebelTheKid.\n\nStory:\n\nYou Just Got Home From Hunting. But The You Realized Your Mom Is Missing. Now Go On A Quest To Find Her.','',1,0,NULL,0,'2017-05-03 16:35:57'),(310,3,1,'Jurassic World Small','http://azminecraftskins.com/mcpe/mcpemods/Jurassic World Small.zip','http://azminecraftskins.com/mcpe/mcpemods/Jurassic World Small.jpg','http://azminecraftskins.com/mcpe/mcpemods/Jurassic World Small.jpg','KurtWarrior','','','Jurassic World is an adventure movie released in 2015 and the fourth sequel of the popular Jurassic Park series. The movie is about dinosaur theme on the island of Isla Nublar which for years has been functioning properly. But now some genius decided to create a genetically modified dinosaur which manages to break loose from its captivity and go berserk on the island.\nThe map features a could of the places as seen in the movie such as the enormous mosasaurus dinosaur living in water.','',1,0,NULL,0,'2017-05-03 16:35:57'),(311,3,1,'WorldofWonders3','http://azminecraftskins.com/mcpe/mcpemods/WorldofWonders3.zip','http://azminecraftskins.com/mcpe/mcpemods/WorldofWonders3.jpg','http://azminecraftskins.com/mcpe/mcpemods/WorldofWonders3.jpg','Davinether','','','The trilogy of the epic world of wonders series. Be sure to check out the improved nether, dungeon and stronghold. Enjoy','',1,0,NULL,0,'2017-05-03 16:35:57'),(312,3,1,'MountainCastle','http://azminecraftskins.com/mcpe/mcpemods/MountainCastle.zip','http://azminecraftskins.com/mcpe/mcpemods/MountainCastle.jpg','http://azminecraftskins.com/mcpe/mcpemods/MountainCastle.jpg','yeskytan','','','MOUNTAIN CASTLE VERSION 2\n\n- Added 3 new village\n\n- Added 1 Dungeon\n\n- Added Gold mine, Secret cave,Secret house,Blacksmith and more..','',1,0,NULL,0,'2017-05-03 16:35:57'),(313,3,1,'The animals rescue 2','http://azminecraftskins.com/mcpe/mcpemods/The animals rescue 2.zip','http://azminecraftskins.com/mcpe/mcpemods/The animals rescue 2.jpg','http://azminecraftskins.com/mcpe/mcpemods/The animals rescue 2.jpg','Doggie122','','','','',1,0,NULL,0,'2017-05-03 16:35:57'),(314,3,1,'S.E.A. Quest for Mr Squish','http://azminecraftskins.com/mcpe/mcpemods/S.E.A. Quest for Mr Squish.zip','http://azminecraftskins.com/mcpe/mcpemods/S.E.A. Quest for Mr Squish.jpg','http://azminecraftskins.com/mcpe/mcpemods/S.E.A. Quest for Mr Squish.jpg','KarsTimesTen','','','This is a map which includes an underwater maze, parkour levels and boss battles. Youve been brought against your will to S.E.A. which is a secret underwater lab owned by Mr. Squish who needs help finding his squid pet who has gone loose and possibly mad too.\n\nSTORY\n\nHello Steve! I know you are confused and dont know where you are, but dont worry, you are among friends! I kidnapped and brought you here to S.E.A. because I need your help urgently.\n\nFor the last couple of weeks Ive done several experiements on my pets here at S.E.A. Unfortunately, my favorite pet Diuqs has gone missing. I did do something I didnt intend to do and that was feeding her pufferpowders. Pufferpowders are poisonous which are used to kill intruders but my beloved bed obviously wasnt the target.\n\nShe hasnt been herself lately because of this and now she has gone missing. Ever since she has gone missing my otherise kind pets have turned into wild and evil beasts. I am a scientist and I love my work but I never intended to hurt the ones I love the most. I really need your help to stop them but please dont kill them, I love them too much.\n\nSteve, please help me save S.E.A. and my beloved pets!\n\nRules\nNever break/place blocks unless told so\nTurn difficulty to normal\nDont kill innocent pets\nSet brightness to half','',1,0,NULL,0,'2017-05-03 16:35:57'),(315,3,1,'EXPERIMENt275','http://azminecraftskins.com/mcpe/mcpemods/EXPERIMENt275.zip','http://azminecraftskins.com/mcpe/mcpemods/EXPERIMENt275.jpg','http://azminecraftskins.com/mcpe/mcpemods/EXPERIMENt275.jpg','CraftedPotato','','','EXPERIMENT 275 is a map combining a mysterious adventure with parkour. In the map you play as a character who is one of the few remaining survivors in the world because of a deadly disease. Apparently youve been sent to a science laboratory and will be used as a lab rat to find a cure to save mankind.\n\nSTORY\nA life-threatening disease has been released and spread to all major parts of the world. People did what they could to survive but most of them were already too fragile to survive.\n\nThe only remaining survivors were sent to a secret area called SciCorp, corporated by the still remaining governments.\n\nThe area is the base for a science laboratory where the lead manager is called Dr. Strafe. Hes attempting experiments on the survivors in hope to find a cure for the disease.\n\nSlowly you open your eyes and try to understand where you are and how you got there. Its hard because the room is completely empty..','',1,0,NULL,0,'2017-05-03 16:35:57'),(316,3,1,'The Quest to Kill the Ghost','http://azminecraftskins.com/mcpe/mcpemods/The Quest to Kill the Ghost.zip','http://azminecraftskins.com/mcpe/mcpemods/The Quest to Kill the Ghost.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Quest to Kill the Ghost.jpg','Tij_Craft','','','This is a quest map where the mission is to go on an adventure consisting of parkour and mazes to find and combine the parts of a diamond pickaxe. The pickaxe can then be used to gain entrance to the room of the ghost. When you have killed the ghost the quest is completed and so is the map.','',1,0,NULL,0,'2017-05-03 16:35:57'),(317,3,1,'Welcome to the Nether','http://azminecraftskins.com/mcpe/mcpemods/Welcome to the Nether.zip','http://azminecraftskins.com/mcpe/mcpemods/Welcome to the Nether.jpg','http://azminecraftskins.com/mcpe/mcpemods/Welcome to the Nether.jpg','RebelTheKid','','','Welcome to the Nether is a map where you will enter into the horror of the Nether. Parkours and puzzles are the two main challenges in the map. Sometimes you will also be presented with multiple different options where choosing the wrong one will lead to instant death.\nIts a fun map which makes use of alternative redstone on a few occasions. The map is easy to understand and leaves nothing to confusion. Failing a challenge can cause you to have to start all over so its definitely a difficult map.\n\nRULES\nNever break/place blocks\nSet difficulty on\nRead all signs','',1,0,NULL,0,'2017-05-03 16:35:57'),(318,3,1,'Drought','http://azminecraftskins.com/mcpe/mcpemods/Drought.zip','http://azminecraftskins.com/mcpe/mcpemods/Drought.jpg','http://azminecraftskins.com/mcpe/mcpemods/Drought.jpg','Geoman','','','Drought is a western themed adventure which starts out in the desert where you find yourself desperately in search for water but now seems to at least have found a village to escape the heat in. The next things which lay ahead consist of a full on adventure which will last for 45-60 minutes and consist of everything from puzzles, combat and parkour.\nIts set in an open-world type of environment but where the main attractions in the map always are focused and easy to find. Its definitely a unique and fun adventure worth experiencing.\n\nSTORY\nFor days youve been walking in the desert desperately in search for water. But as you could figure, the desert isnt exactly the best place to be looking for water at. Moments before you thought yourself were going to give up you can see a village further ahead and as you come closer you know that its not an optical illusion.\n\nRULES\nNever break blocks\nSet difficulty to max\nMedium render settings (recommended)','',1,0,NULL,0,'2017-05-03 16:35:57'),(319,3,1,'Mined Prison: Test Subject','http://azminecraftskins.com/mcpe/mcpemods/Mined Prison: Test Subject.zip','http://azminecraftskins.com/mcpe/mcpemods/Mined Prison: Test Subject.jpg','http://azminecraftskins.com/mcpe/mcpemods/Mined Prison: Test Subject.jpg','The Obsidian Gemstone','','','After your previous failed attempt of escaping the prison youve been put in isolation for two weeks. The old warden has been replaced by a new one. Apparently he got a new use for you inside the prison as a test subject. The adventures which lay ahead might cause you to think that isolation probably was a whole lot safer than going through all this.\nIn the map you will be put on a test through a series of the different experiments. It makes for a varying adventure with lots of different minigames to experience.\n\nSTORY\nFor two weeks youve been stuck in an isolation cell. A key twists in the keyhole and the door opens. Light lands on your face but a shadow quickly overtakes it. The first face you see isnt exactly pretty.\n\nIts the new chief warden. Chief Warden: Hows the cell mr Smith? You getting comfy in there yet?. You cant help but grin when you look up at the enormously fat warden. Not because he looks funny, but the feeling of seeing a face after such a long time is incredible. So whether its an ugly face or not, doesnt matter.\n\nThe uncontrollable grin quickly changes to a grunting and annoyed face when realizing its the chief warden. You: Who are you?!\n\nChief Warden: Im the new chief warden. The previous one got fired so I replaced him. Now, get out of the cell. Youve done your time in there. Ive got someone Id like you to meet…\n\nYou push yourself up against the wall, stumbling out of the cell.\n\nPrevious Part\nThe Beginning\nRules\nDont break/place blocks unless told so\nChange difficulty when to do so','',1,0,NULL,0,'2017-05-03 16:35:57'),(320,3,1,'Sroren','http://azminecraftskins.com/mcpe/mcpemods/Sroren.zip','http://azminecraftskins.com/mcpe/mcpemods/Sroren.jpg','http://azminecraftskins.com/mcpe/mcpemods/Sroren.jpg','SpectreX','','','Sroren is a new adventure map series where in the first chapter you have to break out of a dungeon you’ve been locked up in. It’s a magical themed map where you play as the leader of a group of people who have been fighting Koratz demons for ages. More of the story and background of yourself will be known to you as you progress through the map.\nFor a long time have you waited for this moment to come. Actually, not that long ago you were the leader of the Dorens. The group of people that got rid of the Koratz, a type of demon. In the process of killing Koratzs you were infected by their virus which led to other people’s deaths. As a result you were thrown in a dungeon, to keep you isolated.\n\nVisions came to you that your fellowship would break you out, and now it looks as if they have done that.. now you need to escape.\nRULES\nNever break blocks unless told so\nRead signs\nUse all checkpoints (beds)\nKilling is only allowed with pickaxes, swords and bows\nExplore the hidden portals\nPlay on hard mode','',1,0,NULL,0,'2017-05-03 16:35:57'),(321,3,1,'The Walking Dead','http://azminecraftskins.com/mcpe/mcpemods/The Walking Dead.zip','http://azminecraftskins.com/mcpe/mcpemods/The Walking Dead.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Walking Dead.jpg','mrchipelo','','','The Walking Dead is a popular TV series and comic. It is based in an apocalyptic world where flesh-eating zombies (also known as walkers) have come to life from the dead. In the TV series we follow a set of suvivors all with their own characteristics combining strengths and weaknesses. Together they try to survive in a world where both humans and walkers are a constant threat.The map is based on The Walking Dead and in it you will play a young child who are waking up in a world of zombies. It’s an open world adventure map with lots of areas to explore and challenges to get through.(Map name in-game: TWD vBean)','',1,0,NULL,0,'2017-05-03 16:35:57'),(322,3,1,'Lotus','http://azminecraftskins.com/mcpe/mcpemods/Lotus.zip','http://azminecraftskins.com/mcpe/mcpemods/Lotus.jpg','http://azminecraftskins.com/mcpe/mcpemods/Lotus.jpg','PartyApple','','','Lotus is an evil artificial intelligence computer which have taken control over its own life and has now started to force you into dangerous challenges which include everything from risky parkour courses to huge, confusing mazes.','',1,0,NULL,0,'2017-05-03 16:35:57'),(323,3,1,'Explorers Ruins','http://azminecraftskins.com/mcpe/mcpemods/Explorers Ruins.zip','http://azminecraftskins.com/mcpe/mcpemods/Explorers Ruins.jpg','http://azminecraftskins.com/mcpe/mcpemods/Explorers Ruins.jpg','StrangeNinjaMC','','','After traveling the world and spending countless of days searching for a legendary temple you have walked into a trap and found yourself surrounded by a huge man-made structure of stones.','',1,0,NULL,0,'2017-05-03 16:35:57'),(324,3,1,'Five Nights At Freddy Trilogy','http://azminecraftskins.com/mcpe/mcpemods/Five Nights At Freddy Trilogy.zip','http://azminecraftskins.com/mcpe/mcpemods/Five Nights At Freddy Trilogy.jpg','http://azminecraftskins.com/mcpe/mcpemods/Five Nights At Freddy Trilogy.jpg','wolfman4343','','','The map is split up in three different parts. In each part is the objective to find a hidden easter egg animatronic. Easy to understand instructions are given in the beginning of the map. Make sure to read every sign you find.','',1,0,NULL,0,'2017-05-03 16:35:57'),(325,3,1,'The Facility Horror','http://azminecraftskins.com/mcpe/mcpemods/The Facility Horror.zip','http://azminecraftskins.com/mcpe/mcpemods/The Facility Horror.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Facility Horror.jpg','Hail Goenitz','','','You are a cop which has been sent to investigate the facility. The why you were sent was because your headquarters received information that the engineers who worked at the facility have been missing for a couple of days.The last thing known about the place is that there are rumours spreading that a virus is spreading. Currently it’s thought that the virus outbreak started a couple of months before the engineers came to the facility, and soon infected them when they arrived. You’ve now arrived and are on your way into the building..(Map name in-game: HailG Adventure)','',1,0,NULL,0,'2017-05-03 16:35:57'),(326,3,1,'The Path of the Ninja','http://azminecraftskins.com/mcpe/mcpemods/The Path of the Ninja.zip','http://azminecraftskins.com/mcpe/mcpemods/The Path of the Ninja.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Path of the Ninja.jpg','wolfman4343','','','Since birth have you been trained to become a Master Ninja. Most recently your teacher told you that you are one of the chosen ones called a Master Crafter who is destined to help save the world from evil.To complete the task you need to fight your way through an evil mob army and its leader who previously was a Master Crafter but decided to use his powers for evil.It’s your task to stop the evil crafter along with his army.','',1,0,NULL,0,'2017-05-03 16:35:57'),(327,3,1,'Zombie World','http://azminecraftskins.com/mcpe/mcpemods/Zombie World.zip','http://azminecraftskins.com/mcpe/mcpemods/Zombie World.jpg','http://azminecraftskins.com/mcpe/mcpemods/Zombie World.jpg','Detrais','','','The Zombie World map is the first part of what is going to be an on-going series of maps. It’s a survival and adventure map which takes place in a doomed world where zombies have arised trying to destroy mankind. Your objective is to survive and get through the world of death and sorrow.','',1,0,NULL,0,'2017-05-03 16:35:57'),(328,3,1,'Frozen Kingdom','http://azminecraftskins.com/mcpe/mcpemods/Frozen Kingdom.zip','http://azminecraftskins.com/mcpe/mcpemods/Frozen Kingdom.jpg','http://azminecraftskins.com/mcpe/mcpemods/Frozen Kingdom.jpg','SilverSheildCrafter34','','','The Frozen Kingdom is an adventurous map mixed with problem solving and parkour. It’s a quite big map which is split up in several different sections where in the beginning it will be a parkour challenge and next a maze. To keep things interesting it follows a storyline which can be read throughout the map on different signs.','',1,0,NULL,0,'2017-05-03 16:35:57'),(329,3,1,'The Maze Runner','http://azminecraftskins.com/mcpe/mcpemods/The Maze Runner.zip','http://azminecraftskins.com/mcpe/mcpemods/The Maze Runner.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Maze Runner.jpg','KoolGhettoKid','','','The Maze Runner is a timed, hardcore, survivalist and adventure map. The map is inspired by the movie where the players have to test their skills of survival.The world itself might look quite ordinary if you were to forget about the enormous walls that surround the ordinary world. After a certain amount of time (16, 22, 28, 34 min – based on which map you download and install) the walls will fall and show the huge maze. As soon as you enter it the next question is how long will you be able to survive?','',1,0,NULL,0,'2017-05-03 16:35:57'),(330,3,1,'Defuse The Bomb','http://azminecraftskins.com/mcpe/mcpemods/Defuse The Bomb.zip','http://azminecraftskins.com/mcpe/mcpemods/Defuse The Bomb.jpg','http://azminecraftskins.com/mcpe/mcpemods/Defuse The Bomb.jpg','Wolfman4343','','','You work as an undercover agent and are currently testing the XL Jumbo aircraft which was produced by the Block Airlines. As your agency has expected this isn’t an ordinary flight. Someone appears to have planted a bomb big enough to blow up the entire airplane. You’ve been assigned to find the bomb and defuse it. You have 10 minutes to do this before everything explodes. Best of luck to you!','',1,0,NULL,0,'2017-05-03 16:35:57'),(331,3,1,'Dark Artifacts','http://azminecraftskins.com/mcpe/mcpemods/Dark Artifacts.zip','http://azminecraftskins.com/mcpe/mcpemods/Dark Artifacts.jpg','http://azminecraftskins.com/mcpe/mcpemods/Dark Artifacts.jpg','Blitz_MCPE','','','The main objective in the map is to get the dark artifacts which are worth a lot of cash. Before getting the dark artifacts you will have to adventure through the map where multiple challenges will be met that the Dark Master have created to protect his treasures. Will you finish the map or will you be lost and forgotten? The answer is up to you!','',1,0,NULL,0,'2017-05-03 16:35:57'),(332,3,1,'The Time Travel','http://azminecraftskins.com/mcpe/mcpemods/The Time Travel.zip','http://azminecraftskins.com/mcpe/mcpemods/The Time Travel.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Time Travel.jpg','CreatrixPE, DaphneElaine, MellyGlitter','','','You are an explorer and time traveler, still an amateur but you’ve successfully time traveled a few times so you know how it works, at least you thought so!One day your assistant named Jeeves explains to you that everything has gone horribly wrong. The time machine still works and can detect the missing pieces so you’ll have to travel back in time to complete the missing happenings for the time travel to be restored and complete.When we say you’ll have to travel back you’ll have to travel as far back as to the Middle Ages and to more recent happenings such as the World War II (1944).Not only will you be able to experience some amazing and differentiating architecture but you will also be able to slay vicious beasts and parachute from airplanes. As you now probably can imagine the adventure is long and the experiences many.Note from the creators: Make sure to play chapter 1 and 4 in peaceful mode.','',1,0,NULL,0,'2017-05-03 16:35:57'),(333,3,1,'Assassins Creed 2 Florence','http://azminecraftskins.com/mcpe/mcpemods/Assassins Creed 2 Florence.zip','http://azminecraftskins.com/mcpe/mcpemods/Assassins Creed 2 Florence.jpg','http://azminecraftskins.com/mcpe/mcpemods/Assassins Creed 2 Florence.jpg','EnginDenizAyata','','','Florence is a city in central Italy and also where the game takes plays in Assassin’s Creed 2 where you play as an assassin in an ancient city completeing murderous tasks for people. The Minecraft PE version of the game isn’t as violent as the quests in the game surround more friendly quests like collecting harmless feathers and finding some hidden gear.Quests: Find 25 hidden feathers.Destroy the Templar Mark.Search and find Giovanni’s gear and blade','',1,0,NULL,0,'2017-05-03 16:35:57'),(334,3,1,'Sky Sailor Roller Coaster','http://azminecraftskins.com/mcpe/mcpemods/Sky Sailor Roller Coaster.zip','http://azminecraftskins.com/mcpe/mcpemods/Sky Sailor Roller Coaster.jpg','http://azminecraftskins.com/mcpe/mcpemods/Sky Sailor Roller Coaster.jpg','Unknow','','','The largest roller coaster made out of only tree ever created in Minecraft Pocket Edition. The design is absolutely amazing and it’s definitely worth checking out if you like the high speeds and beautiful modern tree designs in Minecraft.','',1,0,NULL,0,'2017-05-03 16:35:57'),(335,3,1,'AeroSide Fall','http://azminecraftskins.com/mcpe/mcpemods/AeroSide Fall.zip','http://azminecraftskins.com/mcpe/mcpemods/AeroSide Fall.jpg','http://azminecraftskins.com/mcpe/mcpemods/AeroSide Fall.jpg','FrikiLokon','','','Aeroside Fall likely inspired by The Dropper is a map where you drop yourself down to the ground where your main priority should be to hit the little pool of water.The world you are playing in like a huge cube with four walls and everything is pretty much upside down. It’s a little confusing map because of this.It’s a fun but short map worth the download.','',1,0,NULL,0,'2017-05-03 16:35:57'),(336,3,1,'Treasure Land','http://azminecraftskins.com/mcpe/mcpemods/Treasure Land.zip','http://azminecraftskins.com/mcpe/mcpemods/Treasure Land.jpg','http://azminecraftskins.com/mcpe/mcpemods/Treasure Land.jpg','Romulous','','','The Treasure Land map has taken almost a year from start to finish. Even though he probably didn’t spend all his awake hours working on the map it still proves a lot of effort have been put into creating it.The map got loads of hidden treasures, finesse and great artistry. You will spawn in the underground and from there have to make your way up to the top through different challenges. For example, in one place of the map there is a huge trap and if you manage to get trapped because of it you simply have to start over.Throughout the map there are chests which got different loot. One chest have a wolf spawn egg and some bones which mean you can try and tame a wolf to gain some advantage.','',1,0,NULL,0,'2017-05-03 16:35:57'),(337,3,1,'The Land of the Giants','http://azminecraftskins.com/mcpe/mcpemods/The Land of the Giants.zip','http://azminecraftskins.com/mcpe/mcpemods/The Land of the Giants.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Land of the Giants.jpg','Carnivelz99','','','A little bit over a year has gone by every since the old the became known to the world you know know today. The ordinary life which you used to have before is long gone and every day you wake up you will nothing but traumatized and confused. It’s almost as if you were in a hamlet where everything is not what it appears like.The map has taken almost a year to develop, mostly because the creator have been busy with other activities but also because it is a amazing map with lots of adventures to be discovered and enjoyed.','',1,0,NULL,0,'2017-05-03 16:35:57'),(338,3,1,'The Multiple Adventure','http://azminecraftskins.com/mcpe/mcpemods/The Multiple Adventure.zip','http://azminecraftskins.com/mcpe/mcpemods/The Multiple Adventure.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Multiple Adventure.jpg','JoeyKey','','','At its finished state the map will have a total of 10 parts all included in this one map. The parts included are different kind of adventures tied together to create a mega adventure in one single map.Much of the map is focused on really epic parkour adventures but the creator has also made sure to include different gameplays like puzzles and ordinary adventures.As of writing this the map includes 4 of 10 parts so it’s not entirely done yet but still definitely worth a download!','',1,0,NULL,0,'2017-05-03 16:35:57'),(339,3,1,'Super Mario Galaxy','http://azminecraftskins.com/mcpe/mcpemods/Super Mario Galaxy.zip','http://azminecraftskins.com/mcpe/mcpemods/Super Mario Galaxy.jpg','http://azminecraftskins.com/mcpe/mcpemods/Super Mario Galaxy.jpg','GOnZO','','','Super Mario Galaxy was the third game in the Super Mario series and as its predecessors caught immediate popularity. Here we have that game implemented in Minecraft PE. Similar to the original console version we’ve got small planets with different objectives on each.Currently there is a total of 7 planets and on each a different mission you have to accomplish to get a star (or as in Minecraft PE a gold block). Once you’ve got them all the main objective is to repower the grand star.The map has been worked on for months and it is finally here and just as awesome as we hoped for. Try it out now!','',1,0,NULL,0,'2017-05-03 16:35:57'),(340,3,1,'Glowing Caverns','http://azminecraftskins.com/mcpe/mcpemods/Glowing Caverns.zip','http://azminecraftskins.com/mcpe/mcpemods/Glowing Caverns.jpg','http://azminecraftskins.com/mcpe/mcpemods/Glowing Caverns.jpg','Nick','','','You travel to the Glowing Caverns to find and acquire eight chunks of wool. The wool is needed for the building of a monument in the village you are from and you were sent to the Glowing Caverns alone to finish the task, but what you didn’t know was that there were others in the cave.. waiting for you.Alone in a chilly place you need to fight your way through mobs and such to get the wool and fast get out of there and home to your village.','',1,0,NULL,0,'2017-05-03 16:35:57'),(341,3,1,'The Pyramid Adventure','http://azminecraftskins.com/mcpe/mcpemods/The Pyramid Adventure.zip','http://azminecraftskins.com/mcpe/mcpemods/The Pyramid Adventure.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Pyramid Adventure.jpg','Apspw','','','In this map you get trapped inside a pyramid. The only way to get out is through the top of the pyramid and to get there you must first clear through a total of 17 rooms.Before beginning start by reading the signs for the rules etcetra. Once you continue through the next rooms there won’t be any instructions whatsoever. The next is completely up to you to figure out.','',1,0,NULL,0,'2017-05-03 16:35:57'),(342,3,1,'Five Nights At Freddy','http://azminecraftskins.com/mcpe/mcpemods/Five Nights At Freddy.zip','http://azminecraftskins.com/mcpe/mcpemods/Five Nights At Freddy.jpg','http://azminecraftskins.com/mcpe/mcpemods/Five Nights At Freddy.jpg','Kingbudderjr','','','In the map you play as a security guard who have to spend the night at Freddy Fazbear’s Pizza. In the pizza place there are malfunctional animals which you have to defend yourself against.Currently the map is 100% finished and the only thing left to do is the texture pack which is about half done at its current state. In the future the creator also intends to create a mod for the map.','',1,0,NULL,0,'2017-05-03 16:35:57'),(343,3,1,'PortalCraft','http://azminecraftskins.com/mcpe/mcpemods/PortalCraft.zip','http://azminecraftskins.com/mcpe/mcpemods/PortalCraft.jpg','http://azminecraftskins.com/mcpe/mcpemods/PortalCraft.jpg','MinecraftGOnZO15','','','The map includes a total of 12 levels which should be played using the Portal mod (by Desno365) and texture pack. The map is incredibly detailed and got lots of puzzling elements you would find in the original Portal game. With the mod loaded up you’ll be able to make portals with the portal guns and by creative thinking get through each one of the levels.','',1,0,NULL,0,'2017-05-03 16:35:57'),(344,3,1,'The Orphanage','http://azminecraftskins.com/mcpe/mcpemods/The Orphanage.zip','http://azminecraftskins.com/mcpe/mcpemods/The Orphanage.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Orphanage.jpg','KoolGhettoKid','','','The Orphanage is one of Minecraft’s most scary maps for PC and that’s the reason why it was ported for Minecraft PE. As redstone is not a feature in Minecraft PE as when this map was created KoolGhettoKid (the one who ported it) had to use redstone alternatives in the most clever ways to make it resemble the PC map as much as possible.As a whole this map is incredibly fun, but scary of course since it’s a horror map. The only downside we can think of is that it doesn’t feature custom sounds as in PC to set the mood in the map, but that’s only because Minecraft PE doesn’t yet support it.','',1,0,NULL,0,'2017-05-03 16:35:57'),(345,3,1,'ZeldaCraft II','http://azminecraftskins.com/mcpe/mcpemods/ZeldaCraft II.zip','http://azminecraftskins.com/mcpe/mcpemods/ZeldaCraft II.jpg','http://azminecraftskins.com/mcpe/mcpemods/ZeldaCraft II.jpg','ritrititi','','','This is the first part of ZeldaCraft II, inspired by the Zelda Nintendo games. In opposite to how Minecraft normally works the map is built in such a way to leave you with fewer options to where you are able to walk. Throughout the map there are multiple signs placed out at appropriate locations to let you follow the storyline and understand what to do in the different parts.Most of you have probably heard of Zelda and that is what this map is all about. It’s a fun adventure with more than one hour of gameplay.In total there are ten missions and from each you can get one diamond. So once you have reached ten that means you have completed the map.','',1,0,NULL,0,'2017-05-03 16:35:57'),(346,3,1,'Prison Escape 3','http://azminecraftskins.com/mcpe/mcpemods/Prison Escape 3.zip','http://azminecraftskins.com/mcpe/mcpemods/Prison Escape 3.jpg','http://azminecraftskins.com/mcpe/mcpemods/Prison Escape 3.jpg','SteffenNL','','','This is the third map in a series of prison escape maps created by SteffenNL. It is packed with adventures and mind-boggling tasks which really will put you and your mind on test.Prison Escape 3 is a sequel which is recommended to be played afterward you have played the first and second maps listed further down.','',1,0,NULL,0,'2017-05-03 16:35:57'),(347,3,1,'Quest of the Assassin','http://azminecraftskins.com/mcpe/mcpemods/Quest of the Assassin.zip','http://azminecraftskins.com/mcpe/mcpemods/Quest of the Assassin.jpg','http://azminecraftskins.com/mcpe/mcpemods/Quest of the Assassin.jpg','TargetPractice','','','This is a big map called Quest of the Assassin where you have to stop an evil criminal organization and save your mother from their ruthless hands. It’s a map filled with adventures which you are soon to forget!','',1,0,NULL,0,'2017-05-03 16:35:57'),(348,3,1,'The Dropper','http://azminecraftskins.com/mcpe/mcpemods/The Dropper.zip','http://azminecraftskins.com/mcpe/mcpemods/The Dropper.jpg','http://azminecraftskins.com/mcpe/mcpemods/The Dropper.jpg','Bigre','','','In total there is 16 levels like the ones you can see in the images. You’ll be left in free fall and your goal is to survive the fall.The only rule that applies to this map is not to break any blocks, other than that you are free to do what you want to.','',1,0,NULL,0,'2017-05-03 16:35:57'),(349,3,1,'Mansion of the Damned','http://azminecraftskins.com/mcpe/mcpemods/Mansion of the Damned.zip','http://azminecraftskins.com/mcpe/mcpemods/Mansion of the Damned.jpg','http://azminecraftskins.com/mcpe/mcpemods/Mansion of the Damned.jpg','nore','','','A map probably inspired by The Shining. At least that’s the thing that instantly came to mind when reading the story. It’s a horror map with puzzles, parkour, action and even zombies. Lets see if you got the courage to finish this map, if you do, let us know in the comments.','',1,0,NULL,0,'2017-05-03 16:35:57'),(350,3,1,'Prison Escape 2','http://azminecraftskins.com/mcpe/mcpemods/Prison Escape 2.zip','http://azminecraftskins.com/mcpe/mcpemods/Prison Escape 2.jpg','http://azminecraftskins.com/mcpe/mcpemods/Prison Escape 2.jpg','SteffenNL','','','This is the second part of the fun Prison Escape series.The second part of Prison Escape is funnier because the buildings and just the overall impression of the entire map is much better. The story is quite easy.You are stuck in a prison and want to escape.. find a way out!','',1,0,NULL,0,'2017-05-03 16:35:57'),(351,3,1,'Mini-Game Amusement Park','http://azminecraftskins.com/mcpe/mcpemods/Mini-Game Amusement Park.zip','http://azminecraftskins.com/mcpe/mcpemods/Mini-Game Amusement Park.jpg','http://azminecraftskins.com/mcpe/mcpemods/Mini-Game Amusement Park.jpg','KoolGhettoKid','','','This map was made for multiplayer purposes and is good because all the maps and minigames are combined in one world/map file. It got many cool maps and has been carefully made to include the best stuff.','',1,0,NULL,0,'2017-05-03 16:35:57');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_coint` int(11) DEFAULT NULL,
  `last_spin_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_coint`,`last_spin_datetime`) values ('93rGobFFrzVNk4Nku8fH2vz4hp42','Huynh Khoa Vin',0,'2017-04-01 11:08:03'),('qCve4oIdHBeZdWVHFYLfDjaVWeH2','Pamobile Dev04',66,'2017-05-03 16:42:26');

/* Procedure structure for procedure `add_new_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_new_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_upload_item`(
	    in p_type_id int(11),
		in p_category_id int(11),
		in p_item_name VARCHAR(50),
		in p_file_url text,
		in p_image_url text,
		in p_thumb_url text,
		in p_author_name text,
		in p_version varchar(30),
		in p_size varchar(20),
		in p_description text,
		in p_short_description text,
		in p_hot_priority int(11),
		in p_video_code varchar(20),
		in p_download_count int(11),
		in p_is_verify int(11)
    )
BEGIN
select count(*) from mine_craft_mods.`item` where item.item_name = p_item_name into @check_exist_a;
SELECT COUNT(*) FROM mine_craft_mods.`upload_item` WHERE upload_item.item_name = p_item_name INTO @check_exist_b;
if ((@check_exist_a + @check_exist_b) = 0) then
	INSERT INTO `mine_craft_mods`.`upload_item`
            (`type_id`,
             `category_id`,
             `item_name`,
             `file_url`,
             `image_url`,
             `thumb_url`,
             `author_name`,
             `version`,
             `size`,
             `description`,
             `short_description`,
             `hot_priority`,
             `download_count`,
             `video_code`,
             `is_verify`,
             `create_time`)
VALUES (p_type_id,
        p_category_id,
        p_item_name,
        p_file_url,
        p_image_url,
        p_thumb_url,
        p_author_name,
        p_version,
        p_size,
        p_description,
        p_short_description,
        p_hot_priority,
        p_download_count,
        p_video_code,
        p_is_verify,
        NOW());
        select * from error_code where error_code.`response_code` = 200;
        else
        SELECT * FROM error_code WHERE error_code.`response_code` = 206;
        end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `admin_authentication` */

/*!50003 DROP PROCEDURE IF EXISTS  `admin_authentication` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_authentication`(
		IN p_username varchar(50),
		in p_password varchar(50)
    )
BEGIN
	
	select count(*) from account where account.`username` = p_username and account.`password` = p_password into @check_login;
	if(@check_login = 1) then
		select * from error_code where response_code = 204;
	else
		select * from error_code where response_code = 205;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `check_next_spin_turn` */

/*!50003 DROP PROCEDURE IF EXISTS  `check_next_spin_turn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `check_next_spin_turn`()
BEGIN
	select timediff(ADDTIME(CURDATE() + INTERVAL 1 DAY,'00:00:00') ,now()) as Duration;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `check_spin_state` */

/*!50003 DROP PROCEDURE IF EXISTS  `check_spin_state` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `check_spin_state`(IN p_user_id VARCHAR(50)
    )
BEGIN
		--	EXCEPTION CATCH
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	
	-- check last spin date time
	
	-- variable to check spin is valid if @valid >= 1
	SELECT (DAY(NOW()) - DAY(user.`last_spin_datetime`)) FROM `user` WHERE `user`.`user_id` = p_user_id INTO @valid_spin;
	
	-- variable to save lucky number from event constaint
	SELECT `event_constant`.`constaint_value` FROM `event_constant` WHERE `event_constant`.`constaint_id` = 1 INTO @lucky_number;
	
	-- variable to save spin amount in spin list
	SELECT COUNT(`spin_list`.`spin_id`) FROM `spin_list` INTO @spin_count;
	
	-- lucky sequence of this turn
	SELECT (@spin_count % @lucky_number) INTO @lucky_sequence;
	
	-- valid spin
	IF(ABS(@valid_spin) >= 1) THEN 
	select * from error_code where error_code.`response_code` = 214;
	else
	SELECT * FROM error_code WHERE error_code.`response_code` = 215;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `create_item_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `create_item_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `create_item_comment`(
	in p_item_id int(11),
	IN p_user_id VARCHAR(50),
	in p_message TEXT
    )
BEGIN
	INSERT INTO `mine_craft_mods`.`item_comment`
            (
             `item_id`,
             `user_id`,
             `comment_message`,
             `create_time`)
VALUES (
        p_item_id,
        p_user_id,
        p_message,
        NOW());
        select * from error_code where `error_code`.`response_code`=200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `create_news_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `create_news_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `create_news_comment`(
		in p_news_id int(11),
		in p_user_id int(11),
		in p_comment_message text
    )
BEGIN
	INSERT INTO `mine_craft_mods`.`news_comment`
		    (`news_id`,
		    `user_id`,
		     `comment_message`,
		     `create_time`)
	VALUES (p_news_id,
	p_user_id,
		p_comment_message,
		NOW());
	SELECT * FROM error_code where error_code.`response_code` = 200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `delete_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `delete_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_upload_item`(
			in p_item_id int(11)
    )
BEGIN
    
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	DELETE
		
		FROM `mine_craft_mods`.`upload_item`
		WHERE `item_id` = p_item_id;
		select * from error_code where error_code.`response_code` = 200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `download_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `download_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `download_item`(
	in p_item_id int(11)
    )
BEGIN
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	select item.`download_count` from item where `item_id` = p_item_id into @download;
	UPDATE `mine_craft_mods`.`item` SET `download_count` = (@download + 1)
	WHERE `item_id` = p_item_id;
	select * from error_code where error_code.`response_code` = 200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_admin_role` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_admin_role` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_admin_role`(
		in p_user_name VARCHAR(50)
    )
BEGIN
    --	EXCEPTION CATCH
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	
	select `account`.`role` from account where account.`username` = p_user_name;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_categories` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_categories` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_categories`()
BEGIN
SELECT * FROM category;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_item`(
		IN p_amount INT(11)
)
BEGIN		
	IF (p_amount = 0) THEN
	SELECT * FROM mine_craft_mods.`item`;
	ELSE 
	SELECT * FROM item limit p_amount;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_items`(
)
BEGIN		
	SELECT * FROM item;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_items_by_category` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_items_by_category` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_items_by_category`(
		IN p_category_id INT(11),
		IN p_limit_amount int(11)
    )
BEGIN
	IF (p_limit_amount > 0) THEN
		SELECT * from item where item.`category_id` = p_category_id limit p_limit_amount;
	ELSE
		SELECT * from item where item.`category_id` = p_category_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_item_type` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_item_type` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_item_type`()
BEGIN
SELECT * FROM item_type;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `do_spin` */

/*!50003 DROP PROCEDURE IF EXISTS  `do_spin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `do_spin`(
		in p_user_id varchar(50)
    )
BEGIN
		--	EXCEPTION CATCH
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	
	-- check last spin date time
	
	-- variable to check spin is valid if @valid >= 1
	select (DAY(NOW()) - DAY(user.`last_spin_datetime`)) from `user` where `user`.`user_id` = p_user_id into @valid_spin;
	
	-- variable to save lucky number from event constaint
	select `event_constant`.`constaint_value` from `event_constant` where `event_constant`.`constaint_id` = 1 into @lucky_number;
	
	-- variable to save spin amount in spin list
	select count(`spin_list`.`spin_id`) from `spin_list` into @spin_count;
	
	-- lucky sequence of this turn
	select (@spin_count % @lucky_number) into @lucky_sequence;
	
	-- valid spin
	if(ABS(@valid_spin) >= 1) then
			SELECT NOW() INTO @spin_time;
			-- Get USD reward
		if(@lucky_sequence = (@lucky_number-1)) then
			-- get result by rand in (1,3,5,7)
			SELECT ((FLOOR(RAND()*(3-0+1))+0)*2 + 1) into @result;
			
			SELECT `resource`.`resource_value` FROM `resource` WHERE `resource`.`resource_id` = @result INTO @resource_value;
			SELECT `resource`.`resource_meaning` FROM `resource` WHERE  `resource`.`resource_id` = @result INTO @resource_meaning;
			
			INSERT INTO `mine_craft_mods`.`spin_list`
				    (`user_id`,
				     `resource_id`,
				     `spin_datetime`)
			VALUES (p_user_id,
				@result,
				@spin_time);
			-- UPDATE datetime for user
			UPDATE `mine_craft_mods`.`user`
			SET `last_spin_datetime` = @spin_time
			WHERE `user_id` = p_user_id;
			-- add user to reward board
			
			INSERT INTO `mine_craft_mods`.`reward`
				    (
				     `user_id`,
				     `resource_id`,
				     `email`,
				     `nation_name`)
			VALUES (
				p_user_id,
				@result,
				'',
				'');			
			-- return response code
			
			SELECT `error_code`.`response_code`,`error_code`.`meaning`,@result as result,@resource_meaning as resource_meaning FROM `error_code` WHERE `error_code`.`response_code` = 211;
			
			
			-- Get Coin reward
		else
			SELECT ((FLOOR(RAND()*(3-0+1))+0)*2 + 2) INTO @result;
			
			INSERT INTO `mine_craft_mods`.`spin_list`
				    (`user_id`,
				     `resource_id`,
				     `spin_datetime`)
		         VALUES (p_user_id,
				@result,
				@spin_time);
				
				-- get resource value
				select `resource`.`resource_value` from `resource` where `resource`.`resource_id` = @result into @resource_value;
				SELECT `resource`.`resource_meaning` from `resource` where  `resource`.`resource_id` = @result INTO @resource_meaning;
				
				-- get user current coin
				select `user`.`user_coint` from `user` where `user`.`user_id` = p_user_id into @current_coin;
				
				-- Update new coin for user
				UPDATE `mine_craft_mods`.`user`
				SET `user_coint` = (@current_coin + @resource_value),
				`last_spin_datetime` = @spin_time
				WHERE `user_id` = p_user_id;
				
			SELECT `error_code`.`response_code`,`error_code`.`meaning`,@result as result,@resource_meaning as resource_meaning FROM `error_code` WHERE `error_code`.`response_code` = 211;	
			
		end if;
	
	else
		SELECT `error_code`.`response_code`,`error_code`.`meaning` FROM `error_code` WHERE `error_code`.`response_code` = 212;
	
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_item_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_item_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_item_comment`(
		IN p_item_id INT(40),
		IN p_limit_amount INT(11)
)
BEGIN		
	IF (p_limit_amount > 0) THEN 
	SELECT `item_comment`.`comment_id`,`item_comment`.`item_id`,`item_comment`.`comment_message`,`item_comment`.`like_count`,TIMEDIFF(NOW(),`item_comment`.`create_time`) as duration FROM mine_craft_mods.`item_comment` where `item_id`= p_item_id order by item_comment.`create_time` desc limit p_limit_amount;
	ELSE 
	SELECT `item_comment`.`comment_id`,`item_comment`.`item_id`,`item_comment`.`comment_message`,`item_comment`.`like_count`,TIMEDIFF(NOW(),`item_comment`.`create_time`) AS duration  FROM mine_craft_mods.`item_comment` WHERE `item_id`= p_item_id ORDER BY item_comment.`create_time` DESC;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_news_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_news_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_news_items`(
			in p_limit_amount int(11)
    )
BEGIN
	if(p_limit_amount > 0) then
	select * from news order by news.`news_create_at` desc limit p_limit_amount;
	else
	SELECT * FROM news ORDER BY news.`news_create_at` DESC;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_upload_item`(
		in p_start_datetime datetime,
		in p_end_datetime datetime
)
BEGIN
	select * from upload_item where (`create_time` >= p_start_datetime) AND (`create_time`<= p_end_datetime);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_error_code` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_error_code` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_error_code`()
BEGIN
	SELECT * FROM error_code;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_home_newest_news` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_home_newest_news` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_home_newest_news`(
		IN p_amount INT(11)
	    )
BEGIN		
	if (p_amount > 0 ) THEN
	select * FROM news limit p_amount;
	ELSE
	SELECT * FROM news;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_hot_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_hot_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_hot_items`(
		IN p_item_type INT(11),
		IN p_limit_count INT(11)
	    )
BEGIN		
	if (p_limit_count >0) THEN
	SELECT * FROM item where item.`type_id` = p_item_type order by item.`hot_priority` desc LIMIT p_limit_count;
	ELSE
		SELECT * FROM item WHERE item.`type_id` = p_item_type ORDER BY item.`hot_priority` DESC;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_html_content` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_html_content` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_html_content`(
		IN p_html_content_id int(11)
    )
BEGIN
	SELECT * FROM html_content where html_content.`html_content_id` = p_html_content_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_item_by_type` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_item_by_type` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_item_by_type`(
    in p_item_type_id int(11),
    in p_limit_amount INT(11)
    )
BEGIN
    if(p_limit_amount > 0) then
	select * from item where item.`type_id` = p_item_type_id limit p_limit_amount;
	else
	select * from item where item.`type_id` = p_item_type_id;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_reward_list` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_reward_list` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_reward_list`()
BEGIN
	select user.`user_name`,`resource`.`resource_meaning`,`reward`.`nation_name` from reward, resource,`user` where `reward`.`resource_id` = `resource`.`resource_id` and reward.`user_id` = user.`user_id`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_user_info` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_user_info` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_info`(
		in p_user_id int(11)
    )
BEGIN
	--	EXCEPTION CATCH
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	
	select * from `user` where `user`.`user_id` = p_user_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_news_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_news_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_news_comment`(
		IN p_news_id INT(11),
		IN p_limit_amount INT(11)
)
BEGIN		
	IF (p_limit_amount > 0) THEN 
	SELECT `news_comment`.`comment_id`,`news_comment`.`news_id`,`news_comment`.`user_id`,`news_comment`.`comment_message`,TIMEDIFF(NOW(),`news_comment`.`create_time`) as duration FROM `news_comment` where `news_id`= p_news_id order by news_comment.`create_time` desc  limit p_limit_amount;
	ELSE 
	SELECT `news_comment`.`comment_id`,`news_comment`.`news_id`,`news_comment`.`user_id`,`news_comment`.`comment_message`,TIMEDIFF(NOW(),`news_comment`.`create_time`) AS duration FROM `news_comment` WHERE `news_id`= p_news_id ORDER BY news_comment.`create_time` DESC;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `like_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `like_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `like_comment`(
	in p_user_id VARCHAR(50),
	in p_comment_id int(11)
)
BEGIN
	SELECT  COUNT(*) FROM `mine_craft_mods`.`like` WHERE ((comment_id = p_comment_id) AND (user_id = p_user_id)) into @check_liked;
	if(@check_liked = 0) then
		INSERT INTO `mine_craft_mods`.`like`(`comment_id`,`user_id`) VALUES (p_comment_id,p_user_id);
		select * from error_code where `error_code`.`response_code` = 203;
	else
		
		DELETE  FROM `mine_craft_mods`.`like` where (`like`.`user_id`= p_user_id) and (`like`.`comment_id` = p_comment_id);
		select * from error_code where response_code = 202;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `login` */

/*!50003 DROP PROCEDURE IF EXISTS  `login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(
		in p_user_id varchar(50),
		in p_user_name varchar(50)
    )
BEGIN
		--	EXCEPTION CATCH
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	
	select count(*) from `user` where `user`.`user_id` = p_user_id into @check_user;
	if (@check_user = 0) then
	INSERT INTO `mine_craft_mods`.`user`
            (`user_id`,
	     `user_name`,
             `user_coint`,
             `last_spin_datetime`)
		VALUES (p_user_id,
		p_user_name,
		0,
		'2017-04-01 11:08:03');
		select * from error_code where error_code.`response_code` = 200;
	else 
		SELECT * FROM error_code WHERE error_code.`response_code` = 210;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `reset_spin_datetime` */

/*!50003 DROP PROCEDURE IF EXISTS  `reset_spin_datetime` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `reset_spin_datetime`(
		in p_user_id int(11)
    )
BEGIN
		UPDATE `mine_craft_mods`.`user`
		SET
		  `last_spin_datetime` = '2017-04-26 11:19:36'
		WHERE 
		  `user_id` = p_user_id;
		  select * from error_code where error_code.`response_code` = 200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `search_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `search_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `search_items`(
		IN p_search_keyword VARCHAR(50),
		IN p_limit_count INT(11)
)
BEGIN		
	if (p_limit_count >0) THEN
	SELECT * FROM `item`,`item_type`,`category` where
	(item.`author_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`item_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`category_id` = category.`category_id` AND category.`category_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`type_id` = `item_type`.`type_id` AND item_type.`type_name` LIKE CONCAT("%",p_search_keyword,"%"))
	GROUP BY item.`item_id` LIMIT p_limit_count;
	ELSE
	SELECT * FROM `item`,`item_type`,`category` WHERE
	(item.`author_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`item_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`category_id` = category.`category_id` AND category.`category_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`type_id` = `item_type`.`type_id` AND item_type.`type_name` LIKE CONCAT("%",p_search_keyword,"%"))
	GROUP BY item.`item_id`;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `search_related_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `search_related_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `search_related_items`(
		IN p_item_id INT(11),
		IN p_search_keyword VARCHAR(50),
		IN p_limit_count INT(11)
)
BEGIN		
	IF(p_limit_count > 0) THEN
	SELECT * FROM `item`,`item_type`,`category` WHERE(
	(item.`author_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`item_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`category_id` = category.`category_id` AND category.`category_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`type_id` = `item_type`.`type_id` AND item_type.`type_name` LIKE CONCAT("%",p_search_keyword,"%")))
	AND (item.`item_id` <> p_item_id)
	GROUP BY item.`item_id` LIMIT p_limit_count;
	ELSE 
	SELECT * FROM `item`,`item_type`,`category` WHERE(
	(item.`author_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`item_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`category_id` = category.`category_id` AND category.`category_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`type_id` = `item_type`.`type_id` AND item_type.`type_name` LIKE CONCAT("%",p_search_keyword,"%")))
	AND (item.`item_id` <> p_item_id)
	GROUP BY item.`item_id`;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `send_reward_info` */

/*!50003 DROP PROCEDURE IF EXISTS  `send_reward_info` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `send_reward_info`(
		in p_user_id varchar(50),
		in p_email varchar(100),
		in p_nation_name varchar(100)
)
BEGIN
    		--	EXCEPTION CATCH
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	--
	select count(*) from `reward` where `reward`.`user_id` = p_user_id and reward.`email` like '' into @check_exist;
	if(@check_exist = 1 ) THEN
		UPDATE `mine_craft_mods`.`reward`
		SET 
		  
		  `email` = p_email,
		  `nation_name` = p_nation_name
		WHERE `user_id` = p_user_id;
		select * from error_code where error_code.`response_code` = 200;
	ELSE
		SELECT * FROM error_code WHERE error_code.`response_code` = 213;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `update_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `update_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `update_upload_item`(
		in p_item_id int(11),
		IN p_type_id INT(11),
		IN p_category_id INT(11),
		IN p_item_name VARCHAR(50),
		IN p_file_url TEXT,
		IN p_image_url TEXT,
		IN p_thumb_url TEXT,
		IN p_author_name TEXT,
		IN p_version VARCHAR(30),
		IN p_size VARCHAR(20),
		IN p_description TEXT,
		IN p_short_description TEXT,
		IN p_hot_priority INT(11),
		IN p_video_code VARCHAR(20),
		IN p_download_count INT(11)
		)
BEGIN
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	
	UPDATE `mine_craft_mods`.`upload_item`
	SET `item_id` = p_item_id,
	  `type_id` = p_type_id,
	  `category_id` = p_category_id,
	  `item_name` = p_item_name,
	  `file_url` = p_file_url,
	  `image_url` = p_image_url,
	  `thumb_url` = p_thumb_url,
	  `author_name` = p_author_name,
	  `version` = p_version,
	  `size` = p_size,
	  `description` = p_description,
	  `short_description` = p_short_description,
	  `hot_priority` = p_hot_priority,
	  `download_count` = p_download_count,
	  `video_code` = p_video_code,
	  `is_verify` = 0,
	  `create_time` = now()
	WHERE `item_id` = p_item_id;
	select * from error_code where error_code.`response_code` = 200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `verify_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `verify_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `verify_upload_item`(
		in p_upload_item_id int(11)
    )
BEGIN
	DECLARE continue HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	
	-- update is verify of upload item
	select count(*) from `upload_item` where (`upload_item`.`item_id` = p_upload_item_id) into @check_upload_item;
		if (@check_upload_item = 1) 
		then	
			select count(*) from `upload_item` where ( `upload_item`.`item_id` = p_upload_item_id and `upload_item`.`is_verify` = 1) into @check;
			
			if(@check = 0) 
			then
				UPDATE `mine_craft_mods`.`upload_item`
				SET 
				  `is_verify` = 1
				WHERE `item_id` = p_upload_item_id;
				-- insert from upload item to item table
				INSERT INTO `item` (`type_id`,`category_id`,`item_name`,`file_url`,`image_url`,`thumb_url`,`author_name`,
				`version`,`size`,`description`,`short_description`,`hot_priority`,`download_count`,`video_code`,`is_verify`,`create_time`)
				SELECT
				`type_id`,`category_id`,`item_name`,`file_url`,`image_url`,`thumb_url`,`author_name`,
				`version`,`size`,`description`,`short_description`,`hot_priority`,`download_count`,`video_code`,`is_verify`,NOW()
				FROM   upload_item
				WHERE  `upload_item`.`item_id` = p_upload_item_id;
				
				-- delete from upload item  
				DELETE
				FROM `mine_craft_mods`.`upload_item`
				WHERE `item_id` = p_upload_item_id;
				-- response result of insert
				select * from error_code where error_code.`response_code` = 200;
			else
				SELECT * FROM error_code WHERE error_code.`response_code` = 208;
			end if;
		else
			select * from error_code where error_code.`response_code` = 209;
		end if;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
