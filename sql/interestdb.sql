/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : interestdb
Target Host     : localhost:3306
Target Database : interestdb
Date: 2021-04-22 17:26:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(16) NOT NULL COMMENT '6~16位由字母与数字和下划线组成',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del` smallint(6) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '2019-08-22 16:25:19', '0');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `topic_id` int(11) NOT NULL COMMENT '趣点ID',
  `content` text COMMENT '内容',
  `subscribe_num` int(11) NOT NULL DEFAULT '0' COMMENT '评论数，回复时增1，删除时减1',
  `image` varchar(256) DEFAULT NULL COMMENT '微博图片',
  `video` varchar(256) DEFAULT NULL COMMENT '微博视频',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL ,
  `del` smallint(6) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `blog_user` (`user_id`) USING BTREE,
  KEY `blog_topic` (`topic_id`) USING BTREE,
  CONSTRAINT `blog_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '1', '1', '学习打卡', '1234', null, '/upload/video/01.mp4', '2020-06-03 10:40:07', '2020-05-03 10:40:07', '0');
INSERT INTO `blog` VALUES ('2', '1', '1', '加油！', '1123', null, '/upload/video/01.mp4', '2020-06-03 10:42:43', '2020-06-03 10:42:43', '0');
INSERT INTO `blog` VALUES ('3', '1', '1', 'HTML5语义化元素', '1123', null, '/upload/video/01.mp4', '2020-06-03 10:42:43', '2020-06-03 10:42:43', '0');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `follow_user` (`user_id`) USING BTREE,
  KEY `follow_topic` (`topic_id`) USING BTREE,
  CONSTRAINT `follow_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `follow_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of follow
-- ----------------------------

-- ----------------------------
-- Table structure for interest
-- ----------------------------
DROP TABLE IF EXISTS `interest`;
CREATE TABLE `interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `discribe` text,
  `topic_num` int(11) NOT NULL DEFAULT '0' COMMENT '添加趣点时增1，删除时减1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL,
  `del` smallint(6) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of interest
-- ----------------------------
INSERT INTO `interest` VALUES ('1', '前端兴趣', '', '5', '2019-08-22 16:28:44', '2019-08-29 21:06:57', '0');
INSERT INTO `interest` VALUES ('2', '数据库兴趣', '', '3', '2019-08-22 16:28:44', '2019-08-29 21:01:34', '0');
INSERT INTO `interest` VALUES ('3', '运维兴趣', '', '2', '2019-08-22 16:28:44', '2019-08-29 21:01:38', '0');
INSERT INTO `interest` VALUES ('4', '大数据兴趣', '', '2', '2019-08-22 16:28:44', '2019-08-29 21:01:42', '0');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `content` text,
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '0-未查看，1-已查看',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del` smallint(6) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `msg_from` (`from`) USING BTREE,
  KEY `msg_to` (`to`) USING BTREE,
  CONSTRAINT `msg_from` FOREIGN KEY (`from`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `msg_to` FOREIGN KEY (`to`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del` smallint(6) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `reply_user` (`user_id`) USING BTREE,
  KEY `reply_blog` (`blog_id`) USING BTREE,
  CONSTRAINT `reply_blog` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reply_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '1', '1', '加油！', '2019-08-22 16:28:44', '0');
INSERT INTO `reply` VALUES ('2', '1', '1', '加油！', '2019-08-22 16:28:44', '0');
INSERT INTO `reply` VALUES ('3', '1', '1', '加油！', '2019-08-22 16:28:44', '0');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interest_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `discribe` text,
  `subscribe_num` int(11) NOT NULL DEFAULT '0' COMMENT '订阅时增1，取消订阅时减1',
  `image` varchar(255) NOT NULL COMMENT '未上传图片，为默认图片',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL,
  `del` smallint(6) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `topic_interest` (`interest_id`) USING BTREE,
  KEY `topic_user` (`user_id`) USING BTREE,
  CONSTRAINT `topic_interest` FOREIGN KEY (`interest_id`) REFERENCES `interest` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `topic_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '1', '1', 'HTML5最新技术趣点', null, '34150', 'upload/topic_img/HTML5.jpg', '2019-08-29 21:03:08', '2019-08-29 21:03:08', '0');
INSERT INTO `topic` VALUES ('2', '1', '1', 'CSS3最新技术趣点', null, '6700', 'upload/topic_img/CSS3.jpg', '2019-08-29 21:04:16', '2019-08-29 21:04:16', '0');
INSERT INTO `topic` VALUES ('3', '1', '1', 'JavaScript实战趣点', null, '86147', 'upload/topic_img/JS.jpg', '2019-08-29 21:05:01', '2019-08-29 21:05:01', '0');
INSERT INTO `topic` VALUES ('4', '1', '1', 'jQuery插件开发趣点', null, '10170', 'upload/topic_img/jQuery.jpg', '2019-08-29 21:05:31', '2019-08-29 21:05:31', '0');
INSERT INTO `topic` VALUES ('5', '1', '1', 'Bootstrap实例趣点', null, '12647', 'upload/topic_img/Bootstrap.jpg', '2019-08-29 21:05:48', '2019-08-29 21:05:48', '0');
INSERT INTO `topic` VALUES ('6', '2', '1', 'MySQL趣点', null, '34150', 'upload/topic_img/MySQL.jpg', '2019-08-29 21:03:08', '2019-08-29 21:03:08', '0');
INSERT INTO `topic` VALUES ('7', '2', '1', 'Redis趣点', null, '6700', 'upload/topic_img/Redis.jpg', '2019-08-29 21:04:16', '2019-08-29 21:04:16', '0');
INSERT INTO `topic` VALUES ('8', '2', '1', 'Memcached趣点', null, '86147', 'upload/topic_img/Memcached.jpg', '2019-08-29 21:05:01', '2019-08-29 21:05:01', '0');
INSERT INTO `topic` VALUES ('9', '3', '1', 'Linux趣点', null, '10170', 'upload/topic_img/Linux.jpg', '2019-08-29 21:05:31', '2019-08-29 21:05:31', '0');
INSERT INTO `topic` VALUES ('10', '3', '1', 'TCP/IP趣点', null, '12647', 'upload/topic_img/TCP.jpg', '2019-08-29 21:05:48', '2019-08-29 21:05:48', '0');
INSERT INTO `topic` VALUES ('11', '4', '1', 'Python趣点', null, '6700', 'upload/topic_img/Python.jpg', '2019-08-29 21:04:16', '2019-08-29 21:04:16', '0');
INSERT INTO `topic` VALUES ('12', '4', '1', '机器学习趣点', null, '86147', 'upload/topic_img/learning.jpg', '2019-08-29 21:05:01', '2019-08-29 21:05:01', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(16) NOT NULL COMMENT '6~16位由字母与数字和下划线组成',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `sex` smallint(6) NOT NULL DEFAULT '1' COMMENT '0-男，1-女',
  `mobile` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '未上传图片，为默认图片',
  `resume` text,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL,
  `del` smallint(6) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user', 'user', '1', null, null, 'user', '/upload/user_img/01.png', null, '2019-08-22 16:27:16', '2019-08-22 16:27:16', '0');
INSERT INTO `user` VALUES ('2', 'user1', 'user', '1', null, null, 'user1', '/upload/user_img/01.png', null, '2019-08-22 16:27:16', '2019-08-22 16:27:16', '0');
INSERT INTO `user` VALUES ('3', 'hello', 'hello', '1', null, null, 'hello', '', null, '2021-04-14 00:00:00', '2021-04-14 00:00:00', '0');
INSERT INTO `user` VALUES ('4', 'admin', '111', '1', null, null, 'è«è¦å¨', '', null, '2021-04-15 00:00:00', '2021-04-15 00:00:00', '0');
INSERT INTO `user` VALUES ('5', 'lisi', '111', '1', null, null, 'zzz', '', null, '2021-04-22 00:00:00', '2021-04-22 00:00:00', '0');
