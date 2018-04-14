/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : parttime

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-14 17:45:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pt_task
-- ----------------------------
DROP TABLE IF EXISTS `pt_task`;
CREATE TABLE `pt_task` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '任务人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别 1男2女',
  `start_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `detail` text COMMENT '详细内容',
  `image` text COMMENT 'JSON保存多张图片路径',
  `is_delete` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除 0否1是',
  `is_auth` tinyint(1) unsigned DEFAULT '0' COMMENT '是否验证通过 0否1是',
  `user_id` int(11) DEFAULT '0' COMMENT '创建人id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户头像',
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for pt_user
-- ----------------------------
DROP TABLE IF EXISTS `pt_user`;
CREATE TABLE `pt_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) DEFAULT '',
  `session_key` varchar(50) DEFAULT '',
  `name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL,
  `token` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信性别1男2女0未知',
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
