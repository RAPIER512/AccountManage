/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : accountmanage

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2016-07-19 10:06:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) unsigned zerofill NOT NULL auto_increment,
  `code` varchar(30) NOT NULL,
  `name` varchar(30) default NULL,
  `note` varchar(200) default NULL,
  `state` varchar(11) default NULL,
  `createtime` varchar(15) default NULL,
  `lastlogtime` varchar(15) default NULL,
  `type` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('00000000006', 'sdfs', 'sdfds', 'sdfdsf', '锁定', '01/14/2015 ', ' 02/02/2015', '普通账户');
INSERT INTO `account` VALUES ('00000000025', 'bbfgdfgsdfg', 'bb', 'aaa', '离线', '01/01/2015 ', ' 01/31/2015', '普通账户');
INSERT INTO `account` VALUES ('00000000026', 'fdsf', 'sdfsa', 'asdfasfas', '锁定', '01/01/2015 ', ' 01/31/2015', '会员账户');
INSERT INTO `account` VALUES ('00000000027', 'bbfgd', 'bbcxvx', 'aaadsf', '离线', '01/01/2015 ', ' 01/31/2015', '普通账户');
INSERT INTO `account` VALUES ('00000000030', 'cc', 'dsd', 'sd', '离线', '01/23/2015 ', ' 02/06/2015', '会员账户');
INSERT INTO `account` VALUES ('00000000031', 'bbf', 'bbBBBBB', 'aaa', '离线', '01/01/2015 ', ' 01/31/2015', '普通账户');
