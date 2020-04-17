/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50037
Source Host           : localhost:3306
Source Database       : ssm-crud

Target Server Type    : MYSQL
Target Server Version : 50037
File Encoding         : 65001

Date: 2020-04-17 17:58:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tbl_dept`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL auto_increment,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO tbl_dept VALUES ('1', '开发部');
INSERT INTO tbl_dept VALUES ('2', '测试部');

-- ----------------------------
-- Table structure for `tbl_emp`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL auto_increment,
  `emp_name` varchar(255) NOT NULL,
  `gender` char(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `d_id` int(11) NOT NULL,
  PRIMARY KEY  (`emp_id`),
  UNIQUE KEY `emp_name` (`emp_name`),
  KEY `fk_tbl_dept` (`d_id`),
  CONSTRAINT `fk_tbl_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO tbl_emp VALUES ('13', 'd5a4d11', 'M', 'd11@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('14', '6302612', 'M', '6302612@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('15', '2163a13', 'M', '2163a13@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('16', '1ca4914', 'M', '1ca4914@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('17', '9e6f215', 'M', '9e6f215@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('18', '071d416', 'M', '071d416@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('19', '42cdd17', 'M', '42cdd17@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('20', '05d7d18', 'M', '05d7d18@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('21', 'fe79419', 'M', 'fe79419@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('22', '70cfc20', 'M', '70cfc20@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('23', '5471a21', 'M', '5471a21@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('24', '678a122', 'M', '678a122@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('25', 'cf60923', 'M', 'cf60923@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('26', 'c4ddb24', 'M', 'c4ddb24@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('27', 'fd5e725', 'M', 'fd5e725@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('28', '1dab626', 'M', '1dab626@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('29', '7c64427', 'M', '7c64427@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('30', 'dac6028', 'M', 'dac6028@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('31', '7626029', 'M', '7626029@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('32', 'fce4230', 'M', 'fce4230@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('33', 'f1a4b31', 'M', 'f1a4b31@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('34', 'e115d32', 'M', 'e115d32@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('35', '272b333', 'M', '272b333@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('36', 'e010034', 'M', 'e010034@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('37', '4d73f35', 'M', '4d73f35@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('38', '5470836', 'M', '5470836@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('39', 'c704037', 'M', 'c704037@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('40', 'dbaa138', 'M', 'dbaa138@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('41', 'f2b1939', 'M', 'f2b1939@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('42', '416e940', 'M', '416e940@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('43', '7baa741', 'M', '7baa741@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('44', 'eb11142', 'M', 'eb11142@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('45', '8b3b443', 'M', '8b3b443@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('46', '191f144', 'M', '191f144@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('47', '9ccf245', 'M', '9ccf245@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('53', 'd4d5a51', 'M', 'd4d5a51@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('54', '34e7952', 'M', '34e7952@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('55', 'd284e53', 'M', 'd284e53@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('56', '4dde854', 'M', '4dde854@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('57', '6b4dd55', 'M', '6b4dd55@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('58', '7205556', 'M', '7205556@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('59', '2bd4957', 'M', '2bd4957@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('60', 'ff49758', 'M', 'ff49758@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('61', 'c74f659', 'M', 'c74f659@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('62', '5a44360', 'M', '5a44360@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('63', '6fba061', 'M', '6fba061@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('64', '38f0562', 'M', '38f0562@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('65', 'bc29463', 'M', 'bc29463@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('66', 'f54c464', 'M', 'f54c464@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('67', '7097665', 'M', '7097665@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('68', 'bdf1366', 'M', 'bdf1366@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('69', '5b63867', 'M', '5b63867@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('70', 'aa95768', 'M', 'aa95768@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('71', '50f1769', 'M', '50f1769@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('72', '83c3f70', 'M', '83c3f70@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('73', '8073671', 'M', '8073671@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('74', '3674472', 'M', '3674472@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('75', '3c8e873', 'M', '3c8e873@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('76', '17e1574', 'M', '17e1574@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('77', '1f4dd75', 'M', '1f4dd75@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('78', '4bd2076', 'M', '4bd2076@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('79', '9374277', 'M', '9374277@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('80', '3390178', 'M', '3390178@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('81', '578fa79', 'M', '578fa79@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('82', 'b3d7680', 'M', 'b3d7680@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('83', 'f731081', 'M', 'f731081@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('84', '06a4d82', 'M', '06a4d82@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('85', 'b57b783', 'M', 'b57b783@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('86', 'b99b184', 'M', 'b99b184@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('87', '32ba485', 'M', '32ba485@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('88', 'e8fc086', 'M', 'e8fc086@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('89', '2c97c87', 'M', '2c97c87@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('90', '33c0d88', 'M', '33c0d88@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('91', '5ced089', 'M', '5ced089@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('92', '2a4a790', 'M', '2a4a790@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('93', 'cd08891', 'M', 'cd08891@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('94', '2caad92', 'M', '2caad92@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('95', '5282193', 'M', '5282193@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('96', 'a659294', 'M', 'a659294@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('97', 'de67b95', 'M', 'de67b95@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('98', 'c226996', 'M', 'c226996@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('99', 'c1ef597', 'M', 'c1ef597@zuoluwo.com', '1');
INSERT INTO tbl_emp VALUES ('100', '91fd098', 'M', '91fd098@zuoluwo.com', '1');
