/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : student
Target Host     : localhost:3306
Target Database : student
Date: 2021-05-27 19:56:36
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `math` int(11) DEFAULT NULL,
  `english` int(11) DEFAULT NULL,
  `physics` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('1', '李连杰', '50', '50', '90');
INSERT INTO `score` VALUES ('2', '成龙', '40', '50', '90');
INSERT INTO `score` VALUES ('3', '贺俊浩', '100', '100', '100');
INSERT INTO `score` VALUES ('4', '张三', '30', '20', '10');
