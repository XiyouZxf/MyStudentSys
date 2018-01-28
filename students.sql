# Host: localhost  (Version: 5.7.12-log)
# Date: 2016-08-26 23:11:00
# Generator: MySQL-Front 5.3  (Build 4.249)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "city"
#

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `province` varchar(11) NOT NULL DEFAULT '0',
  `cityName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "city"
#

INSERT INTO `city` VALUES ('湖北','仙桃'),('湖北','武汉'),('湖北','恩施'),('湖南','长沙'),('湖南','衡阳');

#
# Structure for table "student"
#

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `spwd` varchar(255) DEFAULT NULL,
  `snikname` varchar(255) DEFAULT NULL,
  `semail` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=1304240916 DEFAULT CHARSET=utf8;

#
# Data for table "student"
#

INSERT INTO `student` VALUES (1304240910,'8B2DFB707DC4A11D37F1FC5070D75222','啊丽','li.qq.com','丽丽'),(1304240915,'202CB962AC59075B964B07152D234B70','逍遥','bsxiaoyao316@qq.com','边顺');

#
# Structure for table "studentinfo"
#

DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `favorite` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `oldname` varchar(255) DEFAULT NULL,
  `studentsf` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `sfrom` varchar(255) DEFAULT NULL,
  `contry` varchar(255) DEFAULT NULL,
  `ocity` varchar(255) DEFAULT NULL,
  `ncity` varchar(255) DEFAULT NULL,
  `yhcar` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `life` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `health` varchar(255) DEFAULT NULL,
  `red` varchar(255) DEFAULT NULL,
  `fromx` varchar(255) DEFAULT NULL,
  `yhcar2` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `hat` varchar(255) DEFAULT NULL,
  `motion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=1304240911 DEFAULT CHARSET=utf8;

#
# Data for table "studentinfo"
#

INSERT INTO `studentinfo` VALUES (1304240910,'丽丽','null','唱歌,跳舞','11111','null','丽丽丽','团员','汉','请选择省市 null','中国','武汉','武汉','1111','阳光','160','无',NULL,'好','A','无','1111','50','无','无');

#
# Structure for table "teacher"
#

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teachernum` int(11) NOT NULL AUTO_INCREMENT,
  `tpwd` varchar(255) DEFAULT NULL,
  `tnikname` varchar(255) DEFAULT NULL,
  `temail` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`teachernum`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

#
# Data for table "teacher"
#

INSERT INTO `teacher` VALUES (1001,'202CB962AC59075B964B07152D234B70','小A','a@qq.com','老A');
