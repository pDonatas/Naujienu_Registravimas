-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2020 m. Bal 27 d. 11:12
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laboras`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_USERid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_USERid` (`fk_USERid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `admin`
--

INSERT INTO `admin` (`id`, `fk_USERid`) VALUES
(20, 18),
(7, 33),
(9, 42),
(4, 45),
(13, 46),
(8, 47),
(17, 57),
(10, 60),
(1, 65),
(6, 67),
(12, 68),
(19, 98),
(14, 123),
(2, 145),
(18, 145),
(16, 154),
(3, 170),
(15, 183),
(5, 185),
(11, 201);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `banned`
--

DROP TABLE IF EXISTS `banned`;
CREATE TABLE IF NOT EXISTS `banned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) DEFAULT NULL,
  `ban_date` date DEFAULT NULL,
  `ban_untill` date DEFAULT NULL,
  `fk_USERid` int(11) NOT NULL,
  `fk_ADMINid` int(3) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_USERid` (`fk_USERid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `banned`
--

INSERT INTO `banned` (`id`, `reason`, `ban_date`, `ban_untill`, `fk_USERid`, `fk_ADMINid`) VALUES
(1, 'sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus', '2019-03-27', '2019-10-20', 117, 1),
(2, 'quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum', '2019-08-12', '2020-02-09', 84, 1),
(3, 'neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl', '2019-03-29', '2019-09-21', 129, 1),
(4, 'luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at', '2019-05-30', '2019-04-30', 59, 1),
(5, 'facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque', '2019-03-26', '2019-03-17', 40, 1),
(6, 'luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui', '2019-05-19', '2019-11-11', 36, 1),
(7, 'in lectus pellentesque at nulla suspendisse potenti cras in purus', '2019-08-15', '2019-07-09', 187, 1),
(8, 'nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna', '2019-11-23', '2019-10-23', 28, 1),
(9, 'id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in', '2020-01-15', '2019-03-23', 174, 1),
(10, 'elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien', '2020-02-20', '2019-03-20', 83, 1),
(11, 'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque', '2019-06-19', '2019-11-04', 80, 1),
(12, 'eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet', '2019-11-20', '2019-04-11', 117, 1),
(13, 'odio donec vitae nisi nam ultrices libero non mattis pulvinar', '2019-07-02', '2020-02-21', 21, 1),
(14, 'erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse', '2019-07-31', '2020-01-04', 54, 1),
(15, 'turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', '2019-12-27', '2019-08-31', 85, 1),
(16, 'id nisl venenatis lacinia aenean sit amet justo morbi ut', '2019-05-04', '2019-09-19', 67, 1),
(17, 'in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet', '2019-08-16', '2019-12-14', 131, 1),
(18, 'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec', '2019-06-11', '2019-03-19', 152, 1),
(19, 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in', '2019-06-16', '2019-09-18', 135, 1),
(20, 'orci luctus et ultrices posuere cubilia curae nulla dapibus dolor', '2019-06-03', '2020-02-26', 160, 1),
(25, 'test', '2020-04-19', '2020-04-30', 3, 201);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `fk_ADMINid` int(11) DEFAULT NULL,
  `fk_NEWSid` int(11) NOT NULL,
  `fk_USERid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ADMINid` (`fk_ADMINid`),
  KEY `fk_NEWSid` (`fk_NEWSid`),
  KEY `fk_USERid` (`fk_USERid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `future_news`
--

DROP TABLE IF EXISTS `future_news`;
CREATE TABLE IF NOT EXISTS `future_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publish_date` date DEFAULT NULL,
  `fk_NEWSid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_NEWSid` (`fk_NEWSid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `future_news`
--

INSERT INTO `future_news` (`id`, `publish_date`, `fk_NEWSid`) VALUES
(21, '2020-04-29', 114);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `type` char(5) DEFAULT NULL,
  `fk_NEWSid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_NEWSid` (`fk_NEWSid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `media`
--

INSERT INTO `media` (`id`, `url`, `updated_at`, `type`, `fk_NEWSid`) VALUES
(1, 'http://dummyimage.com/123x128.bmp/ff4444/ffffff', '2020-01-18', '1', 77),
(3, 'http://dummyimage.com/225x211.png/dddddd/000000', '2019-06-02', '2', 50),
(4, 'http://dummyimage.com/134x115.jpg/cc0000/ffffff', '2019-05-05', '2', 56),
(5, 'http://dummyimage.com/134x191.png/cc0000/ffffff', '2020-02-16', '1', 15),
(6, 'http://dummyimage.com/243x170.jpg/ff4444/ffffff', '2019-12-20', '2', 37),
(7, 'http://dummyimage.com/169x219.png/cc0000/ffffff', '2019-10-11', '1', 98),
(8, 'http://dummyimage.com/103x139.jpg/ff4444/ffffff', '2020-01-24', '1', 77),
(9, 'http://dummyimage.com/101x206.bmp/ff4444/ffffff', '2019-06-10', '2', 94),
(10, 'http://dummyimage.com/198x248.bmp/5fa2dd/ffffff', '2019-10-06', '1', 36),
(11, 'http://dummyimage.com/213x206.jpg/ff4444/ffffff', '2019-09-06', '2', 78),
(13, 'http://dummyimage.com/250x110.bmp/dddddd/000000', '2020-02-24', '2', 12),
(14, 'http://dummyimage.com/212x162.bmp/cc0000/ffffff', '2020-02-11', '1', 56),
(16, 'http://dummyimage.com/241x134.bmp/ff4444/ffffff', '2020-02-06', '2', 53),
(17, 'http://dummyimage.com/165x235.bmp/dddddd/000000', '2019-04-22', '1', 59),
(18, 'http://dummyimage.com/201x202.png/dddddd/000000', '2019-06-20', '2', 73),
(19, 'http://dummyimage.com/143x241.jpg/ff4444/ffffff', '2019-10-05', '2', 90),
(20, 'http://dummyimage.com/157x175.png/5fa2dd/ffffff', '2019-12-05', '2', 48),
(27, 'img/media/7ea4e52f9f4bd3559f25df296a2b3d7e.jpg', '2020-04-25', '1', 110),
(28, 'img/media/c4205412e2c98cf74d087a2f55634712.jpg', '2020-04-25', '1', 110),
(29, 'img/media/97c0f6833c01c9235a8d3558e4152bfb.mp4', '2020-04-25', '2', 112),
(30, 'img/media/cd0a0b38f0df880a01830dd35a14bf3b.png', '2020-04-25', '1', 113);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `comment_status` tinyint(1) DEFAULT NULL,
  `status` char(7) DEFAULT NULL,
  `fk_USERid` int(11) NOT NULL,
  `fk_ADMINid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_USERid` (`fk_USERid`),
  KEY `fk_ADMINid` (`fk_ADMINid`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `created_at`, `updated_at`, `comment_status`, `status`, `fk_USERid`, `fk_ADMINid`) VALUES
(3, 'semper interdum mauris ullamcorper purus sit', 'dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate ', '2019-05-17', '2019-11-22', 0, '1', 133, 11),
(4, 'nam ultrices libero non mattis pulvinar nulla pede', 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor', '2019-12-01', '2019-08-06', 1, '1', 4, 14),
(5, 'tortor quis turpis sed ante', 'hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est ', '2020-01-26', '2019-08-13', 3, '1', 51, 13),
(7, 'ut ultrices vel augue vestibulum ante ipsum primis in', 'nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum s', '2019-05-08', '2020-02-22', 0, '1', 130, 19),
(8, 'montes nascetur ridiculus mus etiam', 'a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque', '2019-06-07', '2019-05-24', 1, '1', 143, 10),
(9, 'quis odio consequat varius integer ac', 'nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque', '2020-01-15', '2019-07-08', 1, '1', 54, 12),
(10, 'curabitur gravida nisi at nibh', 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum mo', '2019-03-19', '2020-01-21', 1, '1', 159, 17),
(12, 'amet turpis elementum ligula vehicula', 'sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti ', '2019-09-19', '2019-08-21', 0, '1', 70, 19),
(13, 'elementum nullam varius nulla facilisi cras non velit nec nisi', 'pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magn', '2019-07-09', '2019-03-14', 3, '1', 84, 17),
(14, 'diam cras pellentesque volutpat dui maecenas', 'porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris la', '2019-04-30', '2019-08-22', 2, '1', 121, 9),
(15, 'vivamus vel nulla eget eros elementum pellentesque quisque porta', 'lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat ', '2020-02-10', '2019-05-01', 0, '1', 197, 7),
(16, 'ac consequat metus sapien ut nunc vestibulum ante ipsum', 'mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsu', '2019-04-23', '2019-11-20', 0, '1', 121, 7),
(17, 'eu mi nulla ac enim in tempor turpis nec euismod', 'ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium', '2019-08-19', '2019-05-07', 0, '1', 185, 9),
(18, 'tincidunt eu felis fusce posuere felis sed', 'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac', '2020-01-02', '2019-06-21', 3, '1', 7, 20),
(19, 'varius integer ac leo pellentesque ultrices', 'platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed a', '2019-12-27', '2019-11-16', 3, '1', 184, 13),
(20, 'mauris eget massa tempor convallis nulla', 'iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan', '2019-06-23', '2019-03-03', 3, '1', 134, 14),
(21, 'risus dapibus augue vel accumsan tellus nisi eu orci mauris', 'justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est qu', '2019-03-23', '2019-12-16', 1, '1', 76, 11),
(22, 'cras mi pede malesuada in imperdiet et commodo vulputate justo', 'ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam ', '2019-10-17', '2019-07-22', 2, '1', 118, 10),
(23, 'quam sollicitudin vitae consectetuer eget rutrum at lorem integer', 'pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce', '2020-02-23', '2019-07-05', 1, '1', 133, 6),
(24, 'mattis odio donec vitae nisi nam ultrices', 'sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero', '2019-07-19', '2019-08-18', 1, '1', 72, 3),
(25, 'nibh in quis justo maecenas rhoncus aliquam lacus morbi', 'ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venen', '2019-06-17', '2019-11-27', 0, '1', 146, 7),
(26, 'ante ipsum primis in faucibus orci luctus et', 'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede ', '2019-06-30', '2019-12-04', 1, '1', 40, 17),
(27, 'praesent blandit nam nulla integer pede justo lacinia eget', 'vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum', '2019-08-24', '2020-01-06', 3, '1', 199, 10),
(28, 'quam suspendisse potenti nullam porttitor lacus at turpis donec', 'tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat', '2020-02-09', '2019-07-28', 2, '1', 182, 6),
(29, 'nam congue risus semper porta volutpat', 'et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis inte', '2019-12-07', '2019-07-04', 1, '1', 20, 12),
(30, 'a libero nam dui proin', 'semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus', '2019-04-22', '2020-02-12', 0, '1', 169, 9),
(31, 'vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis', 'varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque', '2019-05-29', '2019-11-05', 2, '1', 34, 4),
(32, 'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis', 'elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricie', '2019-03-17', '2019-06-08', 2, '1', 108, 20),
(33, 'rutrum nulla tellus in sagittis dui vel nisl duis', 'sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec', '2019-05-09', '2019-03-04', 0, '1', 120, 5),
(34, 'ultrices posuere cubilia curae nulla dapibus dolor', 'tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lec', '2019-05-16', '2019-11-16', 3, '1', 73, 16),
(35, 'vitae mattis nibh ligula nec sem duis aliquam convallis', 'viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesq', '2019-07-13', '2019-05-26', 3, '1', 27, 14),
(36, 'ultrices erat tortor sollicitudin mi', 'varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur', '2019-05-20', '2019-11-26', 0, '1', 20, 17),
(37, 'quam sapien varius ut blandit non', 'magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum ru', '2020-01-22', '2019-07-22', 0, '1', 109, 20),
(38, 'eu interdum eu tincidunt in leo', 'odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut', '2019-03-29', '2019-09-04', 1, '1', 151, 15),
(39, 'nunc rhoncus dui vel sem sed sagittis nam congue risus', 'consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis d', '2019-11-15', '2019-04-14', 3, '1', 174, 12),
(40, 'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac', 'sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus', '2020-02-21', '2020-01-11', 1, '1', 49, 19),
(41, 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 'et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl', '2019-04-19', '2019-08-26', 2, '1', 185, 16),
(42, 'justo maecenas rhoncus aliquam lacus morbi', 'pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae ', '2019-12-16', '2019-11-05', 2, '1', 124, 19),
(43, 'ipsum primis in faucibus orci luctus et ultrices posuere', 'vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posue', '2019-05-09', '2019-11-15', 1, '1', 85, 17),
(44, 'ante ipsum primis in faucibus orci luctus', 'amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristi', '2019-11-27', '2019-07-06', 3, '1', 155, 5),
(45, 'in lectus pellentesque at nulla suspendisse potenti cras in', 'ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices', '2019-06-18', '2019-05-03', 1, '1', 164, 3),
(46, 'tortor quis turpis sed ante vivamus tortor duis', 'massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel', '2019-06-20', '2020-01-03', 0, '1', 133, 2),
(47, 'sed lacus morbi sem mauris laoreet ut rhoncus', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien ', '2019-08-12', '2019-05-01', 0, '1', 93, 15),
(48, 'nunc purus phasellus in felis donec semper sapien a', 'id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ult', '2019-10-26', '2019-03-25', 0, '1', 140, 6),
(49, 'ut erat curabitur gravida nisi at', 'phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis ', '2019-08-21', '2019-11-26', 3, '1', 161, 17),
(50, 'cubilia curae duis faucibus accumsan odio curabitur convallis duis', 'nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis', '2019-06-16', '2019-06-26', 3, '1', 40, 3),
(51, 'libero nullam sit amet turpis elementum ligula vehicula consequat', 'mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem se', '2019-10-28', '2019-06-01', 3, '1', 27, 3),
(52, 'et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet', 'platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget', '2020-02-12', '2020-01-15', 3, '1', 169, 17),
(53, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur', 'odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing ', '2020-01-13', '2019-09-05', 0, '1', 54, 11),
(54, 'penatibus et magnis dis parturient montes nascetur ridiculus mus etiam', 'nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ips', '2019-04-05', '2019-04-06', 0, '1', 38, 18),
(55, 'suscipit nulla elit ac nulla sed', 'morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue ', '2019-05-02', '2019-12-30', 1, '1', 57, 3),
(56, 'quam nec dui luctus rutrum nulla tellus in sagittis dui', 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum i', '2019-12-12', '2019-11-03', 1, '1', 177, 13),
(57, 'at nibh in hac habitasse platea dictumst aliquam augue', 'orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non', '2019-05-19', '2019-08-10', 0, '1', 185, 15),
(58, 'justo sollicitudin ut suscipit a feugiat et eros vestibulum ac', 'quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augu', '2019-09-29', '2019-11-16', 3, '1', 153, 18),
(59, 'sem praesent id massa id nisl venenatis lacinia aenean', 'erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo ', '2019-05-25', '2019-04-03', 2, '1', 51, 7),
(60, 'mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus', 'placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla n', '2019-07-16', '2019-08-01', 1, '1', 66, 15),
(61, 'adipiscing elit proin risus praesent lectus vestibulum', 'suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridicu', '2019-09-18', '2019-07-23', 2, '1', 190, 20),
(62, 'ante nulla justo aliquam quis turpis eget elit', 'amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit', '2019-10-17', '2020-01-03', 2, '1', 138, 5),
(63, 'sapien urna pretium nisl ut', 'luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turp', '2019-03-05', '2019-03-06', 1, '1', 84, 8),
(64, 'enim in tempor turpis nec euismod scelerisque', 'primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla ', '2019-09-20', '2020-02-19', 3, '1', 60, 2),
(65, 'volutpat sapien arcu sed augue', 'justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium', '2019-04-22', '2020-01-14', 2, '1', 119, 2),
(66, 'nisi eu orci mauris lacinia sapien quis libero', 'purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vest', '2019-10-10', '2019-03-09', 1, '1', 9, 3),
(67, 'et ultrices posuere cubilia curae duis faucibus', 'neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit', '2020-02-11', '2019-10-22', 1, '1', 121, 14),
(68, 'eu mi nulla ac enim in tempor', 'imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum ', '2020-02-08', '2019-07-25', 3, '1', 80, 14),
(69, 'donec dapibus duis at velit eu est congue', 'etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus ', '2019-04-26', '2019-09-03', 0, '1', 111, 14),
(70, 'aliquet maecenas leo odio condimentum id', 'posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet', '2019-05-17', '2020-01-05', 2, '1', 105, 13),
(71, 'ipsum dolor sit amet consectetuer adipiscing', 'odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit n', '2019-10-11', '2019-09-24', 2, '1', 64, 9),
(72, 'lacinia sapien quis libero nullam sit amet turpis', 'consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla', '2020-02-20', '2019-06-18', 1, '1', 28, 9),
(73, 'iaculis justo in hac habitasse platea', 'imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue', '2020-02-07', '2019-03-19', 3, '1', 129, 4),
(74, 'gravida nisi at nibh in hac habitasse platea dictumst aliquam', 'quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer', '2019-09-28', '2019-09-16', 0, '1', 108, 8),
(75, 'augue vel accumsan tellus nisi eu', 'justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium ', '2019-11-08', '2020-01-22', 3, '1', 105, 15),
(76, 'in quis justo maecenas rhoncus aliquam lacus', 'nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis ', '2019-08-23', '2020-02-20', 3, '1', 154, 13),
(77, 'imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed', 'molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere ', '2019-05-18', '2019-12-30', 3, '1', 140, 9),
(78, 'bibendum felis sed interdum venenatis', 'tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla', '2019-11-08', '2019-05-04', 1, '1', 136, 19),
(79, 'volutpat convallis morbi odio odio', 'congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacu', '2019-07-23', '2019-09-24', 1, '1', 52, 17),
(80, 'justo sollicitudin ut suscipit a', 'congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse', '2019-05-26', '2019-10-19', 0, '1', 163, 15),
(81, 'aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem', 'erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum d', '2019-04-18', '2020-01-14', 0, '1', 104, 4),
(82, 'in hac habitasse platea dictumst maecenas ut massa', 'hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est ', '2020-02-05', '2019-07-22', 2, '1', 85, 19),
(83, 'quam sapien varius ut blandit non interdum', 'erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecen', '2019-12-10', '2019-09-15', 0, '1', 140, 3),
(84, 'pede morbi porttitor lorem id', 'nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultric', '2019-07-23', '2020-02-27', 2, '1', 60, 14),
(85, 'justo nec condimentum neque sapien placerat ante nulla', 'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in le', '2019-12-30', '2019-08-16', 0, '1', 140, 8),
(86, 'platea dictumst aliquam augue quam', 'quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper e', '2020-01-08', '2019-06-14', 1, '1', 22, 12),
(87, 'faucibus cursus urna ut tellus nulla ut erat id mauris', 'turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus al', '2019-03-13', '2019-11-12', 3, '1', 79, 9),
(88, 'consequat dui nec nisi volutpat eleifend donec ut dolor morbi', 'lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in', '2019-11-18', '2019-05-22', 2, '1', 3, 2),
(89, 'ut blandit non interdum in ante vestibulum', 'porta volutpat erat quisque erat eros viverra eget congue eget', '2020-01-10', '2019-09-06', 0, '1', 73, 4),
(90, 'sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante', 'velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in', '2019-12-15', '2019-08-14', 2, '1', 78, 15),
(91, 'duis faucibus accumsan odio curabitur convallis duis consequat', 'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue ve', '2020-01-07', '2020-01-21', 1, '1', 76, 9),
(92, 'platea dictumst aliquam augue quam', 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci ', '2019-10-29', '2019-10-28', 0, '1', 148, 7),
(93, 'vestibulum rutrum rutrum neque aenean auctor', 'lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursu', '2019-06-26', '2019-08-23', 0, '1', 128, 9),
(94, 'cursus id turpis integer aliquet', 'sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis', '2020-02-08', '2019-10-10', 0, '1', 100, 5),
(95, 'et ultrices posuere cubilia curae nulla dapibus dolor vel est', 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse ', '2019-06-27', '2019-06-28', 3, '1', 88, 18),
(96, 'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl', 'in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consec', '2019-06-29', '2019-10-15', 0, '1', 17, 14),
(97, 'in lacus curabitur at ipsum ac tellus semper interdum', 'sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus', '2019-04-23', '2019-04-12', 2, '1', 70, 10),
(98, 'sed augue aliquam erat volutpat', 'quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc', '2019-03-09', '2019-07-17', 2, '1', 96, 17),
(99, 'integer a nibh in quis justo maecenas', 'convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis', '2019-09-22', '2019-07-31', 3, '1', 19, 4),
(100, 'pede justo lacinia eget tincidunt', 'tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla u', '2019-11-07', '2019-09-13', 0, '1', 107, 15),
(110, 'morbi a ipsum integer a nibh in quis justo maecen', 'asddsasad', NULL, NULL, 1, '1', 201, NULL),
(112, 'Pirmas postas naudojant AugustÄ—s sistemÄ…', 'Testuoju', '2020-04-25', '2020-04-25', 1, '1', 201, 11),
(113, 'paprasta naujiena', 'mnaslkdhndasbdwqnkjlbdk', '2020-04-25', '2020-04-25', 0, '1', 200, NULL),
(114, 'busima naujiena', 'jadsjadslkasd', '2020-04-26', '2020-04-26', 1, '1', 201, NULL),
(115, 'test', 'test123', '2020-04-27', '2020-04-27', 0, '1', 201, NULL);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `news_archive`
--

DROP TABLE IF EXISTS `news_archive`;
CREATE TABLE IF NOT EXISTS `news_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archive_date` date DEFAULT NULL,
  `fk_NEWSid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_NEWSid` (`fk_NEWSid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `news_archive`
--

INSERT INTO `news_archive` (`id`, `archive_date`, `fk_NEWSid`) VALUES
(1, '2019-03-29', 49),
(2, '2019-07-17', 57),
(3, '2019-04-19', 73),
(4, '2019-04-26', 82),
(5, '2019-08-27', 60),
(6, '2019-06-01', 74),
(7, '2019-03-31', 39),
(8, '2019-05-31', 50),
(9, '2019-12-21', 3),
(10, '2019-07-03', 10),
(11, '2019-03-23', 18),
(12, '2019-09-14', 46),
(13, '2019-10-05', 24),
(14, '2019-05-09', 59),
(15, '2019-12-11', 59),
(16, '2019-04-15', 70),
(17, '2019-10-04', 22),
(23, '2020-04-27', 114);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `fk_USERid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_USERid` (`fk_USERid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `photo`
--

INSERT INTO `photo` (`id`, `url`, `fk_USERid`) VALUES
(1, 'http://dummyimage.com/222x107.bmp/dddddd/000000', 49),
(2, 'http://dummyimage.com/160x115.bmp/cc0000/ffffff', 76),
(3, 'http://dummyimage.com/115x143.jpg/dddddd/000000', 90),
(4, 'http://dummyimage.com/105x101.jpg/ff4444/ffffff', 19),
(5, 'http://dummyimage.com/157x124.bmp/ff4444/ffffff', 73),
(6, 'http://dummyimage.com/227x185.jpg/dddddd/000000', 28),
(7, 'http://dummyimage.com/133x229.jpg/5fa2dd/ffffff', 76),
(8, 'http://dummyimage.com/192x155.bmp/5fa2dd/ffffff', 38),
(9, 'http://dummyimage.com/218x247.png/cc0000/ffffff', 65),
(10, 'http://dummyimage.com/114x223.jpg/dddddd/000000', 14),
(11, 'http://dummyimage.com/157x231.bmp/dddddd/000000', 6),
(12, 'http://dummyimage.com/223x209.png/dddddd/000000', 52),
(13, 'http://dummyimage.com/219x239.jpg/5fa2dd/ffffff', 47),
(14, 'http://dummyimage.com/220x207.jpg/5fa2dd/ffffff', 90),
(15, 'http://dummyimage.com/138x189.bmp/dddddd/000000', 56),
(16, 'http://dummyimage.com/131x132.bmp/5fa2dd/ffffff', 55),
(17, 'http://dummyimage.com/136x192.png/cc0000/ffffff', 49),
(18, 'http://dummyimage.com/202x112.bmp/cc0000/ffffff', 35),
(20, 'http://dummyimage.com/207x157.jpg/5fa2dd/ffffff', 31),
(21, 'http://dummyimage.com/144x189.jpg/dddddd/000000', 29),
(22, 'http://dummyimage.com/119x195.png/5fa2dd/ffffff', 64),
(23, 'http://dummyimage.com/127x180.bmp/dddddd/000000', 90),
(24, 'http://dummyimage.com/103x218.bmp/cc0000/ffffff', 39),
(25, 'http://dummyimage.com/155x178.png/ff4444/ffffff', 76),
(26, 'http://dummyimage.com/158x101.jpg/ff4444/ffffff', 10),
(27, 'http://dummyimage.com/164x180.png/ff4444/ffffff', 100),
(28, 'http://dummyimage.com/107x220.png/ff4444/ffffff', 49),
(29, 'http://dummyimage.com/140x157.bmp/ff4444/ffffff', 97),
(30, 'http://dummyimage.com/204x127.bmp/dddddd/000000', 96),
(31, 'http://dummyimage.com/161x212.jpg/5fa2dd/ffffff', 67),
(32, 'http://dummyimage.com/161x242.bmp/ff4444/ffffff', 51),
(33, 'http://dummyimage.com/188x247.png/dddddd/000000', 79),
(34, 'http://dummyimage.com/101x156.bmp/cc0000/ffffff', 92),
(35, 'http://dummyimage.com/130x152.jpg/dddddd/000000', 75),
(36, 'http://dummyimage.com/108x178.bmp/cc0000/ffffff', 35),
(37, 'http://dummyimage.com/106x182.bmp/5fa2dd/ffffff', 99),
(38, 'http://dummyimage.com/158x215.png/cc0000/ffffff', 24),
(39, 'http://dummyimage.com/180x173.bmp/cc0000/ffffff', 77),
(40, 'http://dummyimage.com/179x147.jpg/cc0000/ffffff', 32),
(41, 'http://dummyimage.com/130x219.bmp/dddddd/000000', 97),
(42, 'http://dummyimage.com/222x113.jpg/dddddd/000000', 34),
(43, 'http://dummyimage.com/144x101.jpg/5fa2dd/ffffff', 69),
(44, 'http://dummyimage.com/228x167.png/cc0000/ffffff', 86),
(45, 'http://dummyimage.com/132x150.bmp/dddddd/000000', 45),
(46, 'http://dummyimage.com/162x134.bmp/cc0000/ffffff', 48),
(47, 'http://dummyimage.com/124x208.jpg/5fa2dd/ffffff', 17),
(48, 'http://dummyimage.com/222x186.png/5fa2dd/ffffff', 65),
(49, 'http://dummyimage.com/209x130.jpg/ff4444/ffffff', 12),
(50, 'http://dummyimage.com/122x195.png/5fa2dd/ffffff', 17),
(51, 'img/photos/6628a7b727fe229b8b033f87a9897c06.jpg', 201),
(52, 'img/photos/ba68f6ea6d4c77901ab0771402b0386c.jpg', 201);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote` int(11) DEFAULT NULL,
  `fk_NEWSid` int(11) NOT NULL,
  `fk_USERid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_NEWSid` (`fk_NEWSid`),
  KEY `fk_USERid` (`fk_USERid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `review`
--

INSERT INTO `review` (`id`, `vote`, `fk_NEWSid`, `fk_USERid`) VALUES
(1, 7, 24, 42),
(2, 9, 21, 58),
(4, 9, 14, 34),
(5, 1, 24, 56),
(6, 4, 15, 55),
(7, 4, 9, 39),
(8, 6, 5, 81),
(9, 7, 16, 95),
(10, 4, 17, 21),
(12, 1, 23, 15),
(13, 3, 9, 88),
(14, 4, 22, 61),
(15, 6, 25, 65),
(16, 10, 26, 71),
(17, 5, 16, 48),
(18, 2, 5, 21),
(20, 5, 22, 22),
(27, 6, 5, 201);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `subscription`
--

DROP TABLE IF EXISTS `subscription`;
CREATE TABLE IF NOT EXISTS `subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `fk_USERid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_USERid` (`fk_USERid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `subscription`
--

INSERT INTO `subscription` (`id`, `email`, `fk_USERid`) VALUES
(1, 'lpiggott0@booking.com', 35),
(2, 'kcarlon1@aol.com', 90),
(3, 'acasazza2@techcrunch.com', 87),
(4, 'pmenico3@freewebs.com', 39),
(5, 'msherwen4@rediff.com', 38),
(6, 'bmeeland5@yelp.com', 17),
(7, 'bwiseman6@github.com', 15),
(8, 'djosephsen7@123-reg.co.uk', 92),
(9, 'mhugonet8@state.gov', 45),
(10, 'gbenduhn9@storify.com', 28),
(11, 'bhinchcliffea@cbslocal.com', 41),
(12, 'cgodsafeb@theatlantic.com', 13),
(13, 'dnezeyc@soundcloud.com', 46),
(14, 'apedlard@imageshack.us', 84),
(15, 'nwiddisone@fc2.com', 98),
(16, 'lmccomishf@shop-pro.jp', 88),
(17, 'gschrireng@technorati.com', 81),
(18, 'krattenberieh@gravatar.com', 8),
(19, 'mlaileyi@ft.com', 21),
(20, 'khaffnerj@ifeng.com', 50),
(21, 'donatasp060@gmail.com', 201);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `last_ip` varchar(255) DEFAULT NULL,
  `type` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `last_login`, `created_at`, `updated_at`, `last_ip`, `type`) VALUES
(3, 'Belva', 'Hamshar', 'bhamshar2@merriam-webster.co', 'EdqHPm', '2019-05-31', '2019-10-08', '2020-04-19', '142.189.116.84', '1'),
(4, 'Derek', 'Haycroft', 'dhaycroft3@sakura.ne.jp', 'azkxGnQUnuvq', '2020-01-24', '2019-12-22', '2019-06-24', '250.107.239.20', '0'),
(5, 'Pippa', 'Weston', 'pweston4@google.pl', 'dK5ZbJkw1paZ', '2019-03-06', '2020-02-20', '2019-05-10', '237.79.98.98', '1'),
(6, 'Barbey', 'Riddler', 'briddler5@nature.com', 'MhJsMntJEk', '2020-02-04', '2020-01-14', '2019-10-13', '180.134.110.226', '0'),
(7, 'Halie', 'Kubu', 'hkubu6@thetimes.co.uk', 'xZb27fDh', '2019-06-21', '2019-07-22', '2019-11-10', '254.178.61.167', '2'),
(8, 'Modestine', 'Holt', 'mholt7@dmoz.org', 'JfzCY4a', '2019-05-15', '2020-01-10', '2019-10-08', '140.75.212.206', '1'),
(9, 'Paten', 'Redd', 'predd8@cbc.ca', 'TjCYu6Gx24te', '2019-10-11', '2019-08-20', '2019-03-13', '185.202.34.170', '1'),
(10, 'Jillian', 'Cottle', 'jcottle9@fastcompany.com', '1A9F8zq', '2019-05-22', '2019-07-21', '2019-10-09', '235.220.106.185', '0'),
(11, 'Carley', 'Petford', 'cpetforda@house.gov', 'paa48bi4zBA', '2019-05-17', '2019-09-12', '2019-12-09', '195.169.80.161', '1'),
(12, 'Rutter', 'Gawkes', 'rgawkesb@auda.org.au', 'FHMJgx3lO', '2020-01-01', '2019-12-02', '2019-05-02', '90.132.43.129', '2'),
(13, 'Tobey', 'Bracken', 'tbrackenc@myspace.com', 'RePbdqix', '2019-07-31', '2020-03-02', '2019-09-22', '153.175.57.1', '0'),
(14, 'Modesty', 'Bradforth', 'mbradforthd@1688.com', 'm4zXZIK', '2020-02-08', '2020-02-10', '2019-06-28', '155.248.100.119', '1'),
(15, 'Lorenza', 'Doget', 'ldogete@google.ru', 'MiOkkpdt', '2019-07-06', '2019-04-07', '2019-06-22', '21.33.158.170', '2'),
(16, 'Kerr', 'Lemarie', 'klemarief@yolasite.com', 'c1KQC7z7T', '2020-02-11', '2019-04-18', '2019-10-22', '126.150.201.52', '2'),
(17, 'Jessi', 'Cosstick', 'jcosstickg@skyrock.com', 'glUmLt', '2019-05-27', '2019-12-11', '2020-01-24', '12.49.108.168', '2'),
(18, 'Noelani', 'Burbudge', 'nburbudgeh@xrea.com', 'OnSun48I3V', '2019-09-11', '2019-12-30', '2019-09-27', '22.180.105.250', '1'),
(19, 'Warren', 'Cressy', 'wcressyi@cornell.edu', 'mso62MT', '2019-12-27', '2019-03-27', '2019-11-10', '109.114.154.39', '0'),
(20, 'Desi', 'Ralton', 'draltonj@cbc.ca', '1Q5e0aobFJWv', '2019-06-10', '2019-03-15', '2019-09-13', '98.11.142.142', '1'),
(21, 'Germayne', 'Ambroziak', 'gambroziakk@sciencedaily.com', 'lDBGCEPe7T', '2019-09-10', '2019-12-09', '2019-11-01', '55.169.201.199', '1'),
(22, 'Che', 'Camilli', 'ccamillil@plala.or.jp', 'viWjiDKPoOGE', '2019-10-18', '2019-08-24', '2019-05-11', '178.194.73.124', '0'),
(23, 'Cosme', 'Scrowton', 'cscrowtonm@scribd.com', 'IGW585N3y4X', '2019-11-29', '2019-10-12', '2019-04-21', '161.204.221.146', '1'),
(24, 'Dorelle', 'Normanville', 'dnormanvillen@wikispaces.com', 'k53lfiUDDuhY', '2019-07-07', '2019-09-25', '2020-01-23', '241.143.104.232', '1'),
(25, 'Francisca', 'Boulsher', 'fboulshero@taobao.com', '8VBHvbKK720u', '2019-12-15', '2019-08-18', '2019-06-10', '141.235.173.169', '0'),
(26, 'Garner', 'Gouth', 'ggouthp@fotki.com', 'jtaTaInygejd', '2019-09-11', '2019-05-11', '2019-05-10', '212.243.162.147', '2'),
(27, 'Estrellita', 'Mingus', 'emingusq@sina.com.cn', 'A4yYbXM', '2019-05-04', '2019-07-22', '2019-11-22', '205.79.49.31', '0'),
(28, 'Gregoor', 'Throssell', 'gthrossellr@jugem.jp', 'VfyQBa213rK', '2019-04-18', '2019-11-14', '2019-10-25', '30.1.204.48', '0'),
(29, 'Ainsley', 'Addeycott', 'aaddeycotts@apache.org', 'z9HHQP0E', '2019-12-19', '2019-10-25', '2019-12-06', '90.152.209.245', '0'),
(30, 'Gearalt', 'Dominka', 'gdominkat@slashdot.org', 'KJUz9S', '2019-10-19', '2020-03-01', '2019-03-10', '182.179.201.249', '2'),
(31, 'Jessa', 'Shearsby', 'jshearsbyu@acquirethisname.com', 'KiI20Ak5Z0', '2020-01-26', '2019-08-27', '2019-04-24', '83.45.28.49', '1'),
(32, 'Lizzie', 'Ash', 'lashv@istockphoto.com', 'v2YC5noEq6', '2019-12-29', '2019-12-23', '2019-12-14', '140.253.33.223', '2'),
(33, 'Eydie', 'Pemberton', 'epembertonw@census.gov', '3MJsrZ', '2019-11-12', '2019-07-12', '2019-08-23', '152.72.48.15', '1'),
(34, 'Caesar', 'Burgess', 'cburgessx@lycos.com', 'ZMFXZB', '2020-01-19', '2019-11-18', '2019-12-27', '26.63.122.202', '0'),
(35, 'Gerardo', 'Engel', 'gengely@yahoo.com', 'nCoVwjFQly1A', '2019-05-22', '2019-04-03', '2019-11-09', '12.185.58.191', '1'),
(36, 'Ketty', 'Maggs', 'kmaggsz@indiatimes.com', 'bRa0vIzWs', '2019-12-30', '2019-04-01', '2019-03-24', '119.135.78.104', '0'),
(37, 'Zarah', 'Rylands', 'zrylands10@huffingtonpost.com', 'pXX6vnC653B', '2019-09-26', '2019-10-18', '2019-09-19', '181.229.188.25', '2'),
(38, 'Jaquelin', 'Gitsham', 'jgitsham11@vinaora.com', 'gKgNg5J9', '2019-09-08', '2019-03-13', '2019-12-14', '225.225.58.172', '2'),
(39, 'Harold', 'McPherson', 'hmcpherson12@linkedin.com', 'nq9Nxvfu', '2019-09-25', '2019-07-07', '2019-03-05', '103.227.32.17', '1'),
(40, 'Kendal', 'Seakin', 'kseakin13@sciencedaily.com', 'N3A6OC5sA', '2019-07-18', '2019-11-05', '2019-08-23', '173.124.163.73', '0'),
(41, 'Ginny', 'Ivanikov', 'givanikov14@lulu.com', 'olj4rD7uEBSp', '2019-07-05', '2019-03-27', '2019-06-30', '245.119.124.128', '1'),
(42, 'Land', 'Biesty', 'lbiesty15@topsy.com', 'GqkWA7t', '2019-04-20', '2019-11-13', '2019-07-07', '157.111.218.34', '1'),
(43, 'Nita', 'Succamore', 'nsuccamore16@phpbb.com', 'QR8HshSyALV', '2019-08-31', '2019-05-11', '2019-06-14', '162.215.60.228', '2'),
(44, 'Scarlett', 'MacCallam', 'smaccallam17@google.it', 'DUn6dznt9Xk', '2019-11-06', '2019-06-13', '2019-06-11', '239.34.102.67', '0'),
(45, 'Merlina', 'Souster', 'msouster18@dedecms.com', '9g0Xk0', '2019-06-21', '2019-09-15', '2019-07-08', '210.116.85.144', '1'),
(46, 'Miran', 'Gooddy', 'mgooddy19@boston.com', 'lkcwtL6jOo', '2020-01-06', '2019-03-07', '2020-02-10', '7.12.41.85', '2'),
(47, 'Cari', 'Paolillo', 'cpaolillo1a@redcross.org', 'ofrRxeoRbN95', '2019-07-24', '2019-11-10', '2019-08-15', '109.249.244.24', '2'),
(48, 'Seumas', 'Coomber', 'scoomber1b@freewebs.com', 'YTIa0h', '2020-02-21', '2019-11-23', '2019-12-27', '128.104.52.46', '0'),
(49, 'Rickey', 'Foulkes', 'rfoulkes1c@webnode.com', 'TylGMF13R70a', '2019-06-25', '2020-02-09', '2020-01-28', '155.219.71.88', '2'),
(50, 'Sidonia', 'Kingsbury', 'skingsbury1d@odnoklassniki.ru', 'Odvr6rRDeVZR', '2019-11-03', '2019-08-21', '2019-04-25', '60.114.81.135', '0'),
(51, 'Klaus', 'Downe', 'kdowne1e@alexa.com', '9MELwhLZ', '2019-10-28', '2019-11-19', '2019-05-24', '131.204.9.196', '2'),
(52, 'Danny', 'Arnolds', 'darnolds1f@amazon.com', 'aFSbpcJm9h', '2019-10-03', '2019-10-15', '2019-09-13', '230.247.33.128', '0'),
(53, 'Reina', 'Woltering', 'rwoltering1g@indiegogo.com', 'PGWLo8Z6Y', '2019-06-24', '2019-07-21', '2019-09-11', '187.47.9.210', '0'),
(54, 'Hobie', 'Janse', 'hjanse1h@t.co', 'UnqsRiT', '2019-10-23', '2019-11-04', '2019-12-27', '33.70.182.237', '0'),
(55, 'Dalt', 'Mussettini', 'dmussettini1i@360.cn', 'Ptnji62CtzlP', '2019-03-18', '2019-07-08', '2020-02-20', '45.119.211.208', '1'),
(56, 'Scottie', 'Roke', 'sroke1j@cargocollective.com', 'NJGGsQoF', '2019-10-15', '2019-06-05', '2019-04-06', '173.85.206.216', '0'),
(57, 'Reggis', 'Cunrado', 'rcunrado1k@webs.com', 'wZA0iTnxKaFf', '2019-06-20', '2019-09-09', '2019-03-26', '118.204.82.88', '1'),
(58, 'Claudine', 'Bunkle', 'cbunkle1l@blinklist.com', '82Q3oNWyNQq0', '2019-04-16', '2019-11-15', '2019-11-22', '164.164.148.54', '2'),
(59, 'Byram', 'Ruppele', 'bruppele1m@homestead.com', 'kT3s9U6UUQ', '2019-12-07', '2019-06-21', '2019-09-28', '246.237.237.201', '1'),
(60, 'Jonie', 'Semple', 'jsemple1n@zdnet.com', 'hYrXn5gxbJqZ', '2019-12-06', '2019-09-25', '2019-08-13', '29.73.66.207', '0'),
(61, 'Mikel', 'Eltone', 'meltone1o@washington.edu', 'lIcZ8hI', '2020-02-13', '2019-08-31', '2019-07-09', '55.202.255.152', '2'),
(62, 'Andy', 'Olivo', 'aolivo1p@newsvine.com', 'AC8SV4q8K', '2019-09-28', '2020-01-24', '2019-08-11', '234.249.5.224', '1'),
(63, 'Camey', 'Lafford', 'clafford1q@google.com.br', '4zZbZsQzQi', '2019-09-29', '2019-08-19', '2019-05-13', '13.227.232.92', '1'),
(64, 'Chaim', 'Cecil', 'ccecil1r@ocn.ne.jp', 'z7RYxG85Px', '2019-11-18', '2019-10-18', '2019-08-11', '99.250.54.25', '0'),
(65, 'Janeczka', 'Boylund', 'jboylund1s@reverbnation.com', 'D3FanveM8ox0', '2019-09-24', '2019-03-19', '2019-09-26', '107.14.141.199', '2'),
(66, 'Lem', 'Tumility', 'ltumility1t@hatena.ne.jp', '5vNFRkY3', '2019-12-21', '2019-05-28', '2020-02-10', '40.83.244.247', '1'),
(67, 'Haslett', 'Reven', 'hreven1u@archive.org', 'SJwp0Jf', '2020-02-15', '2020-01-31', '2019-06-06', '190.189.145.239', '1'),
(68, 'Viole', 'McGeaney', 'vmcgeaney1v@ucoz.com', 'h6yMnMV74fC', '2019-09-14', '2019-10-18', '2019-05-15', '160.187.202.47', '2'),
(69, 'Derek', 'Willshaw', 'dwillshaw1w@bizjournals.com', 'a5jHhXuEIK', '2019-10-04', '2019-06-16', '2019-06-08', '100.50.36.12', '1'),
(70, 'Katherine', 'Assel', 'kassel1x@npr.org', 'BASyyFAFUs8n', '2020-01-09', '2019-09-18', '2019-08-24', '65.162.126.13', '0'),
(71, 'Iolanthe', 'Pointer', 'ipointer1y@mail.ru', '9Ac3eGw9NjGE', '2019-03-17', '2019-05-12', '2019-12-25', '183.230.227.126', '0'),
(72, 'Nicholas', 'Emson', 'nemson1z@jalbum.net', 'fFfYiTteIUA', '2019-11-10', '2019-06-27', '2019-03-24', '175.69.138.152', '1'),
(73, 'Augustina', 'Massel', 'amassel20@ox.ac.uk', '15tcCEOx0AH', '2019-05-18', '2019-10-11', '2019-04-16', '186.15.155.238', '2'),
(74, 'Nanette', 'Paulet', 'npaulet21@wsj.com', 'MmfBgoxncMo', '2019-03-11', '2019-09-08', '2019-12-20', '60.120.89.112', '0'),
(75, 'Kelsi', 'Tiner', 'ktiner22@posterous.com', 'z4uagix19w', '2019-06-05', '2019-11-25', '2019-04-18', '122.170.253.58', '0'),
(76, 'Adey', 'Joire', 'ajoire23@ebay.co.uk', 'jaP6ZO6Usn', '2019-11-03', '2020-02-14', '2019-08-12', '42.148.100.182', '2'),
(77, 'Shirline', 'Blancowe', 'sblancowe24@opera.com', 'J6o36yEMxaAs', '2019-12-17', '2019-03-11', '2019-10-20', '34.227.30.43', '1'),
(78, 'Allegra', 'Ocheltree', 'aocheltree25@cyberchimps.com', 'JLWyFNKslV', '2019-11-15', '2019-06-10', '2019-08-30', '79.111.208.104', '2'),
(79, 'Rosanna', 'Screas', 'rscreas26@trellian.com', 'hVVW9TFVw6', '2019-08-29', '2019-11-20', '2019-05-02', '144.169.45.23', '2'),
(80, 'Klaus', 'Hubbocks', 'khubbocks27@cisco.com', 'gX4FAr1qG', '2019-07-25', '2020-01-01', '2019-06-26', '146.247.246.117', '2'),
(81, 'Ede', 'Manueau', 'emanueau28@marriott.com', 'MdRldheO', '2019-11-26', '2019-12-18', '2020-01-23', '74.70.77.162', '1'),
(82, 'Nichols', 'Belshaw', 'nbelshaw29@google.com.hk', 'UHpleIr2R', '2019-08-31', '2019-12-18', '2019-09-01', '140.189.146.93', '0'),
(83, 'Nan', 'Lermit', 'nlermit2a@reddit.com', 'wv9zvUbPp6s', '2019-03-18', '2019-08-06', '2019-11-03', '67.71.175.64', '1'),
(84, 'Esra', 'Guido', 'eguido2b@flavors.me', 'UB8wtxmM', '2019-12-23', '2019-03-22', '2019-11-16', '198.169.197.111', '0'),
(85, 'Keir', 'Ca', 'kca2c@instagram.com', 'NHYUZnTqVFF9', '2019-03-15', '2019-09-13', '2019-12-25', '38.195.181.48', '2'),
(86, 'Katrina', 'Dugmore', 'kdugmore2d@microsoft.com', 'W7CGD5L27T7B', '2019-10-22', '2019-06-18', '2019-11-15', '106.77.158.151', '0'),
(87, 'Ivette', 'Ulyat', 'iulyat2e@bandcamp.com', 'JAufqu', '2019-07-13', '2019-11-26', '2020-02-02', '180.111.37.113', '2'),
(88, 'Halette', 'O\' Reagan', 'horeagan2f@usa.gov', 'HUNc11hqfHVS', '2019-11-26', '2019-08-29', '2019-03-26', '211.167.161.93', '0'),
(89, 'Bobette', 'Schlagh', 'bschlagh2g@skype.com', 'byLDlF7Ui', '2019-09-02', '2019-10-03', '2019-07-07', '251.252.147.202', '2'),
(90, 'Viviene', 'Jakoubec', 'vjakoubec2h@mit.edu', 'iBPVlSx', '2019-11-04', '2019-08-15', '2020-01-01', '44.190.140.199', '1'),
(91, 'Georgena', 'Braga', 'gbraga2i@timesonline.co.uk', '5Zq0O7ub', '2019-07-06', '2019-03-13', '2019-10-03', '202.13.120.11', '0'),
(92, 'Gregoire', 'Durman', 'gdurman2j@ask.com', 'zwDj2J4fluFt', '2019-11-30', '2019-10-07', '2019-12-30', '167.142.58.16', '2'),
(93, 'Anatollo', 'Colson', 'acolson2k@engadget.com', 'sHEGGT9', '2019-09-03', '2019-09-09', '2019-06-02', '126.53.195.102', '1'),
(94, 'Hal', 'Ridge', 'hridge2l@networkadvertising.org', 'qRdHBsX', '2020-01-10', '2019-03-14', '2019-09-29', '9.229.65.35', '2'),
(95, 'Olly', 'Wasteney', 'owasteney2m@engadget.com', 'VSRFWfDU', '2019-08-31', '2019-06-11', '2019-07-10', '201.156.115.201', '0'),
(96, 'Roby', 'Fivey', 'rfivey2n@behance.net', 'fUDFg9qhSlJ9', '2019-09-09', '2020-02-20', '2019-06-05', '149.201.35.8', '0'),
(97, 'Lynde', 'Commucci', 'lcommucci2o@jalbum.net', 'zOpSAOeI2V', '2020-02-29', '2019-03-16', '2019-06-25', '42.151.126.22', '0'),
(98, 'Harriet', 'Chaney', 'hchaney2p@jimdo.com', 'a7mCkztq', '2019-08-12', '2019-05-31', '2020-01-18', '86.117.98.51', '1'),
(99, 'Jess', 'Hasted', 'jhasted2q@washington.edu', 'teIWLZd2z', '2020-01-11', '2019-07-11', '2020-02-21', '206.165.117.212', '2'),
(100, 'Hermie', 'Scotchmoor', 'hscotchmoor2r@noaa.gov', 'D96LSsh3', '2019-07-16', '2019-09-27', '2019-03-31', '54.186.23.61', '2'),
(101, 'Charlena', 'Kinch', 'ckinch2s@soundcloud.com', 'jfvmlzdmMVL', '2019-09-01', '2019-12-26', '2019-10-16', '206.132.86.61', '1'),
(102, 'Liuka', 'Deevey', 'ldeevey2t@census.gov', 'zkoGNljoq', '2019-08-13', '2019-07-20', '2019-08-23', '247.66.165.166', '0'),
(103, 'Mildrid', 'Berriman', 'mberriman2u@netvibes.com', 'FaCURtYY', '2019-05-03', '2019-06-30', '2019-06-03', '47.230.72.174', '1'),
(104, 'Alanah', 'Blockwell', 'ablockwell2v@icq.com', 'IQ1UTxkDO7', '2019-07-18', '2019-12-11', '2019-10-07', '47.123.140.98', '0'),
(105, 'Ross', 'Hessle', 'rhessle2w@nytimes.com', 'lzv3KgkZM5', '2019-10-17', '2019-08-21', '2020-02-07', '122.97.228.141', '1'),
(106, 'Heath', 'Kloster', 'hkloster2x@cpanel.net', 'XmwbgxPcumwI', '2019-07-08', '2020-01-28', '2019-06-21', '208.189.62.225', '2'),
(107, 'Bendick', 'Thacke', 'bthacke2y@soup.io', 'u6XPa6NyDU', '2020-02-22', '2020-02-11', '2019-12-26', '213.245.192.242', '2'),
(108, 'Richard', 'Joel', 'rjoel2z@thetimes.co.uk', 'jfvSPHi', '2019-11-27', '2019-03-18', '2019-07-30', '117.244.233.183', '1'),
(109, 'Gleda', 'Blyden', 'gblyden30@networksolutions.com', '0OlFkQHXXAa', '2019-12-18', '2019-07-13', '2019-10-27', '185.44.208.171', '1'),
(110, 'Farrand', 'Massy', 'fmassy31@dailymail.co.uk', '2APrSW1O', '2019-03-03', '2019-05-15', '2019-12-03', '108.6.32.108', '0'),
(111, 'Hilda', 'Cosins', 'hcosins32@people.com.cn', 'fCQtvgVbK', '2019-07-15', '2019-04-18', '2019-08-26', '28.207.199.182', '2'),
(112, 'Tiphanie', 'Houlridge', 'thoulridge33@delicious.com', 'LCiA9fvajDG', '2020-02-14', '2019-11-23', '2019-07-22', '10.22.183.111', '0'),
(113, 'Tildie', 'Padley', 'tpadley34@marriott.com', 'TKzEBrg', '2019-12-24', '2019-04-26', '2019-10-18', '129.220.173.207', '0'),
(114, 'Olia', 'Enion', 'oenion35@theglobeandmail.com', 'riJPle5', '2019-10-27', '2019-06-12', '2019-10-30', '70.126.102.172', '1'),
(115, 'Osmund', 'Noen', 'onoen36@sakura.ne.jp', 'dJ3LS6ux8', '2020-03-01', '2019-11-19', '2019-04-02', '55.94.61.137', '0'),
(116, 'Ailsun', 'Peris', 'aperis37@state.gov', 'VaABpxQS', '2019-08-17', '2019-08-27', '2019-05-04', '3.147.65.115', '2'),
(117, 'Anna-maria', 'Kirkland', 'akirkland38@hc360.com', 'hgMAOkUtsZc1', '2019-04-18', '2019-06-09', '2019-03-24', '254.46.170.199', '2'),
(118, 'Deni', 'Strotone', 'dstrotone39@cbslocal.com', '1CjPls3Pesyd', '2019-11-21', '2019-11-30', '2019-11-17', '78.240.129.170', '2'),
(119, 'Maxine', 'Aronsohn', 'maronsohn3a@nature.com', 'rgIevLu', '2019-09-16', '2019-11-04', '2019-08-17', '16.190.221.178', '0'),
(120, 'Wayne', 'Rassell', 'wrassell3b@sourceforge.net', 'Mge3zMKj8C', '2019-07-29', '2019-05-11', '2020-03-01', '254.77.23.40', '1'),
(121, 'Kevin', 'Carver', 'kcarver3c@unc.edu', 'G8cCCe9AKe', '2019-03-13', '2019-05-11', '2019-06-24', '199.154.206.22', '2'),
(122, 'Raynor', 'Fownes', 'rfownes3d@shareasale.com', 'uFvZIjW', '2019-10-20', '2019-08-03', '2019-04-04', '111.247.173.56', '2'),
(123, 'Wynn', 'Burress', 'wburress3e@jimdo.com', '2M6FCTyWrOU3', '2019-06-11', '2019-12-17', '2019-03-09', '51.122.30.103', '1'),
(124, 'Salvatore', 'Shorte', 'sshorte3f@oakley.com', 'lBsddMP4ar', '2019-10-24', '2019-05-13', '2019-09-20', '241.228.8.10', '1'),
(125, 'Lodovico', 'Ashfield', 'lashfield3g@washingtonpost.com', 'sRJmXDhe0B', '2019-06-25', '2019-05-08', '2019-12-24', '48.215.85.182', '2'),
(126, 'Luce', 'Rummin', 'lrummin3h@alexa.com', '1fnvd8P', '2019-12-07', '2019-03-19', '2019-12-27', '207.130.237.70', '1'),
(127, 'Lynda', 'Estcot', 'lestcot3i@bbc.co.uk', 'f6AUTf', '2019-12-15', '2019-12-19', '2019-10-02', '28.215.253.120', '2'),
(128, 'Pippy', 'April', 'papril3j@tripadvisor.com', '8L27ufQR', '2019-05-29', '2019-08-30', '2019-08-27', '27.236.49.61', '0'),
(129, 'Vaclav', 'Merwe', 'vmerwe3k@columbia.edu', 'uPL4RDXH', '2019-08-23', '2019-08-13', '2020-01-28', '223.192.40.108', '1'),
(130, 'Clarke', 'Prettjohn', 'cprettjohn3l@pcworld.com', 'QHR8Mw5cd1uI', '2019-09-04', '2019-09-13', '2019-11-07', '3.130.173.69', '2'),
(131, 'Julissa', 'Brodie', 'jbrodie3m@oracle.com', 'g4IoiRxYCA', '2019-11-15', '2019-08-10', '2019-04-08', '205.218.95.114', '1'),
(132, 'Conni', 'Gorvin', 'cgorvin3n@google.co.uk', 'J5YBM8eey', '2019-07-22', '2019-05-29', '2019-09-24', '70.62.37.234', '2'),
(133, 'Urbano', 'Keneford', 'ukeneford3o@baidu.com', 'UoKZsw', '2019-10-01', '2019-03-13', '2019-03-16', '12.65.139.229', '2'),
(134, 'Ardys', 'Avrahamian', 'aavrahamian3p@nymag.com', 'q1JozeOqAyE9', '2019-07-27', '2019-11-01', '2019-08-06', '246.6.25.127', '1'),
(135, 'Brade', 'Hebblewhite', 'bhebblewhite3q@multiply.com', 'hEnT6Vc', '2019-11-22', '2019-05-04', '2019-05-17', '136.211.35.40', '1'),
(136, 'Jeremie', 'Connow', 'jconnow3r@ustream.tv', 'yWz3pgJb2H0', '2019-08-30', '2019-05-04', '2019-11-27', '156.48.191.144', '2'),
(137, 'Ernaline', 'Druce', 'edruce3s@zimbio.com', 'qMsSWWv7gFei', '2019-10-16', '2019-03-28', '2019-08-11', '17.136.198.23', '0'),
(138, 'Ervin', 'Jacob', 'ejacob3t@amazonaws.com', 'zhQRs0iG', '2019-05-03', '2020-01-30', '2020-02-25', '158.230.48.159', '2'),
(139, 'Kara-lynn', 'Shovell', 'kshovell3u@simplemachines.org', 'I9BADgr0gxol', '2020-01-20', '2019-08-31', '2019-08-22', '227.83.10.81', '1'),
(140, 'Brok', 'Martellini', 'bmartellini3v@ucsd.edu', 'KsYtb5pHCeF', '2020-01-27', '2019-07-19', '2020-01-22', '33.68.211.59', '1'),
(141, 'Hamilton', 'Indgs', 'hindgs3w@alexa.com', 'fcwlzSD', '2020-02-03', '2020-02-11', '2019-12-14', '145.101.227.212', '0'),
(142, 'Shem', 'Kidsley', 'skidsley3x@bloglines.com', 'Rp1mfz6U', '2020-01-09', '2019-03-15', '2019-03-07', '202.28.60.231', '0'),
(143, 'Rubina', 'Da Costa', 'rdacosta3y@jigsy.com', 'PVIy8ytso3Cw', '2019-09-16', '2019-08-12', '2019-07-24', '103.108.15.24', '1'),
(144, 'Marja', 'Habbin', 'mhabbin3z@pbs.org', 'NPkc5Okevi8', '2019-06-20', '2019-10-11', '2019-07-08', '156.10.231.26', '1'),
(145, 'Margarita', 'Dorie', 'mdorie40@vimeo.com', 'eyB0HMl', '2019-07-30', '2019-04-08', '2019-12-22', '213.38.217.142', '0'),
(146, 'Berti', 'Redgrove', 'bredgrove41@4shared.com', '5MiL2Gx', '2019-11-04', '2019-07-02', '2020-02-26', '7.7.75.6', '2'),
(147, 'Wash', 'McArt', 'wmcart42@youtu.be', 'pySBCAFAfO', '2019-05-13', '2019-08-14', '2019-09-24', '150.180.65.215', '2'),
(148, 'Sherie', 'Buterton', 'sbuterton43@seattletimes.com', 'APi3VJxiRt2F', '2019-07-02', '2019-11-19', '2019-03-11', '231.146.89.18', '0'),
(149, 'Corenda', 'Gareisr', 'cgareisr44@army.mil', 'Y5zzi9f8Lfjn', '2019-07-15', '2019-03-19', '2019-05-18', '13.165.187.165', '1'),
(150, 'Hurleigh', 'Ochterlony', 'hochterlony45@mayoclinic.com', '643Z6M', '2019-09-24', '2019-04-11', '2019-10-30', '73.145.4.104', '0'),
(151, 'Quintana', 'Ewols', 'qewols46@github.com', 'KcWuhLUpfH6X', '2019-09-27', '2019-06-21', '2019-10-02', '149.52.148.47', '2'),
(152, 'Janene', 'Jessard', 'jjessard47@slashdot.org', 'rD9LbKBi', '2019-03-31', '2019-04-19', '2019-09-04', '206.114.90.212', '0'),
(153, 'Dillie', 'Lehmann', 'dlehmann48@spotify.com', 'G3u695RFCI', '2019-03-14', '2020-01-16', '2019-12-03', '86.84.94.13', '1'),
(154, 'Devina', 'Troy', 'dtroy49@shutterfly.com', 'd8oBcVE', '2019-06-13', '2019-03-09', '2019-03-12', '33.24.185.37', '1'),
(155, 'Redd', 'Stell', 'rstell4a@instagram.com', 'Kuibyv28Lp88', '2019-03-09', '2019-03-16', '2019-07-03', '234.47.154.200', '1'),
(156, 'Hinda', 'Gibbons', 'hgibbons4b@google.com.hk', 'SVIS3dj8fiJc', '2020-02-21', '2019-10-21', '2019-04-05', '223.43.57.221', '2'),
(157, 'Linette', 'Jagger', 'ljagger4c@opera.com', '05iZ5XLbYfo', '2019-07-14', '2019-04-27', '2019-04-09', '230.239.146.251', '0'),
(158, 'Bryant', 'Ody', 'body4d@goo.ne.jp', 'nnZDDcr', '2019-06-29', '2019-03-15', '2020-02-16', '185.194.101.199', '0'),
(159, 'Torie', 'Arrington', 'tarrington4e@merriam-webster.com', 'IVEOlfBR', '2020-02-24', '2019-11-06', '2019-11-02', '93.97.141.130', '0'),
(160, 'Rozanne', 'Pickworth', 'rpickworth4f@nhs.uk', 'dEyqwBTkQQ', '2020-02-19', '2019-10-31', '2019-11-12', '240.177.228.171', '0'),
(161, 'Rhianna', 'Kelmere', 'rkelmere4g@desdev.cn', 'uGd2df2RZK9p', '2019-06-05', '2019-09-03', '2019-04-30', '115.202.241.136', '2'),
(162, 'Jacquette', 'Baraclough', 'jbaraclough4h@stumbleupon.com', 'y51jVqre', '2019-03-28', '2019-09-22', '2019-12-08', '102.22.98.29', '2'),
(163, 'Alden', 'Myrie', 'amyrie4i@google.com.au', 'EakkTylw', '2019-12-23', '2019-07-05', '2019-08-15', '130.172.41.124', '0'),
(164, 'Kellie', 'Dmtrovic', 'kdmtrovic4j@earthlink.net', 'LbGGkCImqjy', '2019-08-04', '2019-10-21', '2019-06-12', '163.67.44.82', '1'),
(165, 'Lorena', 'Prescott', 'lprescott4k@etsy.com', 'xQMGtGMsUx', '2020-02-18', '2019-11-02', '2019-04-27', '165.156.217.163', '2'),
(166, 'Tommie', 'Lodge', 'tlodge4l@unc.edu', 'gdjalkqGGRO3', '2019-08-05', '2019-03-14', '2019-03-03', '80.78.23.58', '1'),
(167, 'Manny', 'McNally', 'mmcnally4m@linkedin.com', 'YRYZ9Bg6eYB', '2019-08-08', '2020-01-18', '2019-11-26', '188.151.96.253', '0'),
(168, 'Vitia', 'Proschek', 'vproschek4n@xinhuanet.com', 'EZzvxYImQI', '2020-02-11', '2020-01-21', '2019-08-06', '5.162.135.123', '1'),
(169, 'Dalila', 'Wilcocks', 'dwilcocks4o@va.gov', '2qaJLGHCLn', '2019-12-23', '2019-10-29', '2020-02-26', '197.138.36.34', '0'),
(170, 'Dara', 'Gatrill', 'dgatrill4p@t-online.de', 'w8Ap19', '2019-10-22', '2019-04-30', '2019-07-04', '92.165.154.228', '0'),
(171, 'Kristopher', 'Buttery', 'kbuttery4q@alexa.com', 'VMIeLN', '2019-07-28', '2019-12-06', '2019-03-29', '211.79.60.149', '0'),
(172, 'Emile', 'Jukes', 'ejukes4r@mapy.cz', 'mnKIhBAdfQQL', '2020-01-18', '2020-01-12', '2019-07-09', '158.40.138.89', '1'),
(173, 'Lemar', 'Featonby', 'lfeatonby4s@vistaprint.com', 'nNnvZCWJ0', '2020-01-21', '2019-08-29', '2019-07-25', '218.136.211.180', '1'),
(174, 'Rey', 'Conen', 'rconen4t@geocities.jp', '6fE6KifjOj0', '2019-08-22', '2019-04-08', '2019-09-16', '138.103.209.163', '0'),
(175, 'Alexei', 'Thew', 'athew4u@cam.ac.uk', 'MGIdqAREW', '2019-12-06', '2020-02-13', '2020-01-21', '110.1.28.98', '2'),
(176, 'Reggy', 'Dilworth', 'rdilworth4v@trellian.com', 'ZV0chw7HIN', '2019-08-22', '2019-07-23', '2019-04-20', '102.87.158.9', '1'),
(177, 'Annamaria', 'Culligan', 'aculligan4w@prweb.com', '2kvWlb', '2019-03-26', '2019-11-24', '2019-07-14', '70.39.3.245', '2'),
(178, 'Reine', 'Guilford', 'rguilford4x@wikia.com', 'GgL57d', '2019-09-23', '2019-06-20', '2019-08-16', '132.190.122.37', '1'),
(179, 'Linc', 'Houndesome', 'lhoundesome4y@blogtalkradio.com', 'gxqoMKXyfr', '2019-07-21', '2019-06-23', '2020-02-16', '23.220.105.221', '2'),
(180, 'Nil', 'McGilben', 'nmcgilben4z@jigsy.com', 'LnGofj', '2019-03-31', '2019-07-07', '2019-08-16', '202.50.87.251', '2'),
(181, 'Mercy', 'Charnley', 'mcharnley50@forbes.com', 'dRxZEN', '2019-03-24', '2019-06-02', '2019-03-22', '141.158.44.153', '1'),
(182, 'Ellene', 'Pourveer', 'epourveer51@trellian.com', 'E7qTMLOyttT', '2019-03-07', '2019-08-13', '2020-02-24', '143.162.14.227', '1'),
(183, 'Geno', 'Emberton', 'gemberton52@twitpic.com', 'Z0VteHGH', '2019-09-22', '2019-08-09', '2019-05-28', '201.211.155.225', '0'),
(184, 'Felicia', 'Vizor', 'fvizor53@printfriendly.com', 's50MRG7gs', '2019-12-13', '2019-12-18', '2019-11-16', '217.199.33.197', '1'),
(185, 'Saloma', 'Bordone', 'sbordone54@webmd.com', 'n1nX7YL', '2019-08-26', '2019-03-31', '2019-11-27', '98.13.205.78', '0'),
(186, 'Mano', 'Clandillon', 'mclandillon55@miibeian.gov.cn', '4wECRISEpetb', '2019-09-15', '2019-10-11', '2019-11-14', '77.140.197.131', '1'),
(187, 'Lizzy', 'Manning', 'lmanning56@opensource.org', 'xpdcMV', '2019-04-18', '2020-02-18', '2019-04-07', '89.72.110.37', '1'),
(188, 'Barbey', 'Archley', 'barchley57@goodreads.com', 'LRWSpjMm0n', '2019-05-07', '2019-09-25', '2019-12-06', '98.160.111.237', '0'),
(189, 'Lynda', 'Oventon', 'loventon58@nydailynews.com', 'JpdfmHeerWH', '2019-09-02', '2019-06-30', '2019-03-11', '129.66.166.10', '2'),
(190, 'Torrie', 'Stuehmeyer', 'tstuehmeyer59@marketwatch.com', 'xvJp9IbUD1bg', '2019-09-23', '2020-01-12', '2020-02-15', '9.197.99.189', '2'),
(191, 'Launce', 'Weatherburn', 'lweatherburn5a@sciencedaily.com', '9aKA2xv4psP', '2019-10-17', '2019-10-01', '2020-01-17', '252.207.64.18', '0'),
(192, 'Pier', 'Stormonth', 'pstormonth5b@1688.com', '43dVBxDKec7', '2019-12-18', '2019-11-10', '2019-08-05', '56.166.200.145', '1'),
(193, 'Dolph', 'Lockhead', 'dlockhead5c@diigo.com', 'P52DyHeMk', '2019-10-15', '2019-07-02', '2019-10-30', '240.12.48.134', '0'),
(194, 'Marthe', 'Keyworth', 'mkeyworth5d@sogou.com', 'MDDExZP', '2019-06-04', '2019-07-10', '2019-09-20', '228.47.20.123', '2'),
(195, 'Travis', 'Elcombe', 'telcombe5e@scientificamerican.com', '2zFa4o08Clb', '2020-02-11', '2019-07-05', '2019-03-07', '193.174.41.146', '0'),
(196, 'Merv', 'Treswell', 'mtreswell5f@webnode.com', 'irDAQQ', '2019-12-15', '2020-02-18', '2019-09-28', '22.93.53.61', '1'),
(197, 'Sanderson', 'Pattison', 'spattison5g@topsy.com', 'b9hX5NOTiB', '2019-12-18', '2019-11-28', '2019-12-30', '141.52.190.180', '2'),
(198, 'Atlanta', 'Dudin', 'adudin5h@ovh.net', 'JBds3y', '2019-08-02', '2019-11-15', '2019-04-26', '48.166.70.23', '1'),
(199, 'Jordon', 'Gosenell', 'jgosenell5i@opensource.org', 'cS10Cd', '2019-11-25', '2019-05-04', '2020-01-03', '43.212.98.131', '1'),
(200, 'Meg', 'Tett', 'mtett5j@usnews.com', 'fdc9ce44ed792254e0f43e634d83f217', '2020-04-25', '2019-08-08', '2020-04-25', '127.0.0.1', '1'),
(201, 'Donatass', 'Petrikauskass', 'donatasp060@gmail.coms', '334564f6b468c8f9cd5db8edf8411646', '2020-04-27', '2020-04-16', '2020-04-27', '::1', '0');

--
-- Apribojimai eksportuotom lentelėm
--

--
-- Apribojimai lentelei `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `ADMIN_ibfk_1` FOREIGN KEY (`fk_USERid`) REFERENCES `user` (`id`);

--
-- Apribojimai lentelei `banned`
--
ALTER TABLE `banned`
  ADD CONSTRAINT `BANNED_ibfk_1` FOREIGN KEY (`fk_USERid`) REFERENCES `user` (`id`);

--
-- Apribojimai lentelei `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `COMMENT_ibfk_1` FOREIGN KEY (`fk_ADMINid`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `COMMENT_ibfk_2` FOREIGN KEY (`fk_NEWSid`) REFERENCES `news` (`id`),
  ADD CONSTRAINT `COMMENT_ibfk_3` FOREIGN KEY (`fk_USERid`) REFERENCES `user` (`id`);

--
-- Apribojimai lentelei `future_news`
--
ALTER TABLE `future_news`
  ADD CONSTRAINT `FUTURE_NEWS_ibfk_1` FOREIGN KEY (`fk_NEWSid`) REFERENCES `news` (`id`);

--
-- Apribojimai lentelei `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `MEDIA_ibfk_1` FOREIGN KEY (`fk_NEWSid`) REFERENCES `news` (`id`);

--
-- Apribojimai lentelei `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `NEWS_ibfk_1` FOREIGN KEY (`fk_USERid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `NEWS_ibfk_2` FOREIGN KEY (`fk_ADMINid`) REFERENCES `admin` (`id`);

--
-- Apribojimai lentelei `news_archive`
--
ALTER TABLE `news_archive`
  ADD CONSTRAINT `NEWS_ARCHIVE_ibfk_1` FOREIGN KEY (`fk_NEWSid`) REFERENCES `news` (`id`);

--
-- Apribojimai lentelei `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `PHOTO_ibfk_1` FOREIGN KEY (`fk_USERid`) REFERENCES `user` (`id`);

--
-- Apribojimai lentelei `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `REVIEW_ibfk_1` FOREIGN KEY (`fk_NEWSid`) REFERENCES `news` (`id`),
  ADD CONSTRAINT `REVIEW_ibfk_2` FOREIGN KEY (`fk_USERid`) REFERENCES `user` (`id`);

--
-- Apribojimai lentelei `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `SUBSCRIPTION_ibfk_1` FOREIGN KEY (`fk_USERid`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
