/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : parttime

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-21 15:30:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pt_comments
-- ----------------------------
DROP TABLE IF EXISTS `pt_comments`;
CREATE TABLE `pt_comments` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `detail` text COMMENT '详细内容',
  `is_delete` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除 0否1是',
  `is_auth` tinyint(1) unsigned DEFAULT '0' COMMENT '是否验证通过 0否1是',
  `user_id` int(11) DEFAULT '0' COMMENT '创建人id',
  `task_id` int(11) DEFAULT '0' COMMENT '任务id',
  `star_count` int(11) DEFAULT '0' COMMENT '点赞数',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pt_comments
-- ----------------------------
INSERT INTO `pt_comments` VALUES ('1', '哈哈保保促使', '0', '1', '2', '48', '0', '1524212339');

-- ----------------------------
-- Table structure for pt_task
-- ----------------------------
DROP TABLE IF EXISTS `pt_task`;
CREATE TABLE `pt_task` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '任务人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别 1男2女',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `detail` text COMMENT '详细内容',
  `image` text COMMENT 'JSON保存多张图片路径',
  `is_delete` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除 0否1是',
  `is_auth` tinyint(1) unsigned DEFAULT '0' COMMENT '是否验证通过 0否1是',
  `user_id` int(11) DEFAULT '0' COMMENT '创建人id',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `user_avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户头像',
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  `desc` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '简介',
  `wechat` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信号',
  `star_count` int(11) DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pt_task
-- ----------------------------
INSERT INTO `pt_task` VALUES ('48', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('49', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('50', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('51', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('52', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('53', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('54', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('55', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('56', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('57', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('58', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('59', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('60', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('61', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('62', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('63', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('64', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('65', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('66', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('67', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('68', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('69', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('70', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('71', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('72', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('73', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('74', '林生', '13702801013', '1', '1524023562', '1524023562', '时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.xsxtbmcb3ys7264d61f6a3f854aa85330f42b2019996.jpg\",\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.5n7b5hvisvc53b497a32456954522a092c9bd15f3a06.jpg\"]', '0', '1', '0', '1524023562', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '测试时间', '时间测试…', null, '0');
INSERT INTO `pt_task` VALUES ('75', '林人', '', '1', '1524217089', '1524217089', '月份时间测试时间测试时间测试时间测试时间测试时间测试时间测试', '[\"http://127.0.0.1:7001/public/images/wx36dfce1bfe86b036.o6zajsyuz3z-pdqfdgud2f2qa_f8.2addc82oclead0034938e077e3ad147d21bf73ec26f8.jpg\"]', '0', '1', '0', '1524217089', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '破口大骂', '月份…', 'ddww2', '0');

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
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pt_user
-- ----------------------------
INSERT INTO `pt_user` VALUES ('2', 'oqjZc5UBrVpCA2ugUzVuHtpZ2v4g', 'y6khA9Z6SOjkMNYe8TQvVw==', null, 'Mr.Lin', null, null, 'Yangjiang', 'China', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkrS1V24fTwIEX9CqD1oBhYgQ7OJ2htN1hAt89ZFqTrDgW4iasOL2pFGicM1yEMCFlWmQp9PJ2mttQ/0', '0', '2018', null);
