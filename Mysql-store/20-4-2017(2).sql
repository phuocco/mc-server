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

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(40) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`) values (1,'Adventure'),(2,'Creation'),(3,'CTM'),(4,'Custom Terrain'),(5,'MiniGame'),(6,'Parkour'),(7,'Puzzle'),(8,'PvP'),(9,'RedStone'),(10,'RollerCoaster'),(11,'Survival');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `comment_message` text NOT NULL,
  `create_time` datetime NOT NULL,
  `like_count` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `comment` */

insert  into `comment`(`comment_id`,`item_id`,`user_id`,`comment_message`,`create_time`,`like_count`) values (2,0,'1','gasgsafasf','2017-04-19 13:43:37',100);

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
  `is_verify` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `category_id` (`category_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `item_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `item` */

insert  into `item`(`item_id`,`type_id`,`category_id`,`item_name`,`file_url`,`image_url`,`thumb_url`,`author_name`,`version`,`size`,`description`,`short_description`,`hot_priority`,`download_count`,`is_verify`,`create_time`) values (1,1,2,'Castle Adventure','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/CastleAdventureV2.zip','https://dl.dropboxusercontent.com/u/26776365/mcpemaps/images/adventure/CastleAdventureV2.jpg','https://dl.dropboxusercontent.com/u/26776365/mcpemaps/images/adventure/CastleAdventureV2.jpg','MattH44','1.0.6',NULL,'Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.\\\\nStoryline\\\\nYouve long ruled your kingdom but recently someone overthrew you! He is an evil man and your people is now being ruled by a complete maniac. You need to find a way to destroy him and take back your lost kingdom. To do this youll need a couple of different tools','Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.',4,1005,0,'2017-04-20 13:27:33'),(2,2,1,'Theme Park','http://azminecraftskins.com/mcpe/mcpemaps/files/creation/ThemePark.zip','https://dl.dropboxusercontent.com/u/26776365/mcpemaps/images/creation/ThemePark.jpg','https://dl.dropboxusercontent.com/u/26776365/mcpemaps/images/creation/ThemePark.jpg','BlockMaster_203','1.0.6',NULL,'Thorpe Park is a theme park in England which now has been recreated in Minecraft Pocket Edition. There are more than 40 different attractions (and that includes everything from roller coasters to water rides). However, it should be noticed that its not a 1:1 scale recreation and some attractions have been moved or changed to make everything fit nicely together.','Thorpe Park is a theme park in England which now has been recreated in Minecraft Pocket Edition.',3,1025,0,'2017-04-20 13:29:44');

/*Table structure for table `item_type` */

DROP TABLE IF EXISTS `item_type`;

CREATE TABLE `item_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(40) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `item_type` */

insert  into `item_type`(`type_id`,`type_name`) values (1,'AddOn'),(2,'Mod'),(3,'Map'),(4,'Skin'),(5,'Texture'),(6,'Seed');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` text NOT NULL,
  `news_thumb_url` text NOT NULL,
  `news_content_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `news` */

insert  into `news`(`news_id`,`news_title`,`news_thumb_url`,`news_content_id`) values (1,'My Title','http://www.gettyimages.in/gi-resources/images/Homepage/Hero/US/MAR2016/prestige-587705839_full.jpg',1),(2,'Haha','http://beebom.com/wp-content/uploads/2016/01/Reverse-Image-Search-Engines-Apps-And-Its-Uses-2016.jpg',1),(3,'Keke','http://1.bp.blogspot.com/-SzGp9N3s138/UzBFiIOyonI/AAAAAAAAKkE/YzOOFiW61DI/s1600/Beautiful+Indian+Girls+Wallpapers+for+Desktop+Image+12.jpg',1);

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
	SELECT * FROM items;
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

/* Procedure structure for procedure `get_all_item_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_item_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_item_comment`(
		IN p_item_id VARCHAR(40)
)
BEGIN		
	SELECT * FROM mine_craft_mods.`comment` where `item_id`= p_item_id;
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
