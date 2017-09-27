/*
Navicat MySQL Data Transfer

Source Server         : 14mhzhang
Source Server Version : 50557
Source Host           : 39.108.185.66:3306
Source Database       : dormitory_manage_system_database

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2017-09-21 22:28:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activity_no` varchar(10) DEFAULT NULL,
  `activity_name` varchar(20) DEFAULT NULL,
  `host_no` varchar(10) DEFAULT NULL,
  `activity_description` varchar(100) DEFAULT NULL,
  `activity_time` varchar(30) DEFAULT NULL,
  `activity_max_participate` int(11) DEFAULT NULL,
  `last_apply_time` varchar(30) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for activity_host
-- ----------------------------
DROP TABLE IF EXISTS `activity_host`;
CREATE TABLE `activity_host` (
  `host_no` varchar(10) DEFAULT NULL,
  `host_name` varchar(20) DEFAULT NULL,
  `host_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for actvity_applyment
-- ----------------------------
DROP TABLE IF EXISTS `actvity_applyment`;
CREATE TABLE `actvity_applyment` (
  `actvity_no` varchar(10) DEFAULT NULL,
  `sno` int(11) DEFAULT NULL,
  `apply_time` varchar(30) DEFAULT NULL,
  `ad_no` varchar(10) DEFAULT NULL ,
  `apply_status` varchar(15) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(50) DEFAULT NULL,
  `sname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin_show_dor_change_applyment_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_show_dor_change_applyment_log`;
CREATE TABLE `admin_show_dor_change_applyment_log` (
  `sno` varchar(10) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `college_no` varchar(20) NOT NULL,
  `major_no` varchar(20) NOT NULL,
  `old_dor_no` varchar(10) NOT NULL,
  `old_room_no` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `new_dor_no` varchar(10) NOT NULL,
  `new_room_no` varchar(10) NOT NULL,
  `apply_time` datetime NOT NULL,
  `phone` varchar(11) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for book_borrow_record
-- ----------------------------
DROP TABLE IF EXISTS `book_borrow_record`;
CREATE TABLE `book_borrow_record` (
  `book_no` varchar(10) DEFAULT NULL,
  `sno` int(10) NOT NULL,
  `check_cancel_apply` int(11) DEFAULT NULL COMMENT ,
  `apply_time` datetime DEFAULT NULL,
  `check_apply_success` int(11) DEFAULT NULL COMMENT,
  `ad_no` varchar(10) DEFAULT NULL COMMENT 
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `device_no` varchar(10) DEFAULT NULL,
  `device_name` varchar(20) DEFAULT NULL,
  `device_descript` varchar(255) DEFAULT NULL,
  `device_amount` int(11) DEFAULT NULL,
  `device_applied_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dor_admin_account
-- ----------------------------
DROP TABLE IF EXISTS `dor_admin_account`;
CREATE TABLE `dor_admin_account` (
  `ad_no` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ad_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dor_admin_handle_log
-- ----------------------------
DROP TABLE IF EXISTS `dor_admin_handle_log`;
CREATE TABLE `dor_admin_handle_log` (
  `apply_time` datetime DEFAULT NULL,
  `sno` int(10) NOT NULL,
  `dor_no` varchar(10) DEFAULT NULL,
  `room_no` varchar(10) DEFAULT NULL,
  `bed_no` varchar(10) DEFAULT NULL,
  `apply_content` varchar(250) DEFAULT NULL,
  `apply_status` varchar(250) DEFAULT NULL,
  `ad_no` varchar(10) DEFAULT NULL COMMENT 'å¤„ç†ç”³è¯·çš„ç®¡ç†å‘˜å·¥å·',
  `detail` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dor_book
-- ----------------------------
DROP TABLE IF EXISTS `dor_book`;
CREATE TABLE `dor_book` (
  `book_no` varchar(10) NOT NULL,
  `from_student` varchar(10) NOT NULL,
  `book_description` varchar(10) NOT NULL,
  `book_class` varchar(20) NOT NULL,
  `is_borrowed` varchar(1) NOT NULL,
  PRIMARY KEY (`book_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dor_book
-- ----------------------------

-- ----------------------------
-- Table structure for dor_book_inf
-- ----------------------------
DROP TABLE IF EXISTS `dor_book_inf`;
CREATE TABLE `dor_book_inf` (
  `book_name` varchar(10) NOT NULL,
  `book_author` varchar(10) NOT NULL,
  `book_word` varchar(10) NOT NULL,
  `contributor` varchar(10) NOT NULL,
  `book_id` varchar(20) NOT NULL DEFAULT '',
  `book_desc` varchar(10) DEFAULT NULL,
  `book_borrow` varchar(10) DEFAULT NULL,
  `book_borrow_time` varchar(10) DEFAULT NULL,
  `book_borrow_state` varchar(10) DEFAULT NULL,
  `book_operation` varchar(10) DEFAULT NULL,
  `book_borrowman` varchar(10) DEFAULT NULL,
  `book_share_man` varchar(10) NOT NULL,
  `book_share_time` varchar(10) NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `dor_book_inf_book_id_0f4e811f_uniq` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dor_change
-- ----------------------------
DROP TABLE IF EXISTS `dor_change`;
CREATE TABLE `dor_change` (
  `sno` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `old_dor_no` varchar(10) DEFAULT NULL,
  `old_room_no` varchar(10) NOT NULL,
  `new_dor_no` varchar(10) DEFAULT NULL,
  `new_room_no` varchar(10) DEFAULT NULL,
  `apply_time` varchar(30) DEFAULT NULL,
  `app_status` varchar(10) DEFAULT NULL,
  `stu_phone` varchar(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sno`,`old_room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dor_check_out
-- ----------------------------
DROP TABLE IF EXISTS `dor_check_out`;
CREATE TABLE `dor_check_out` (
  `sno` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `room_no` varchar(10) NOT NULL,
  `dor_no` varchar(10) DEFAULT NULL,
  `apply_time` varchar(30) DEFAULT NULL,
  `apply_status` varchar(10) DEFAULT NULL,
  `stu_phone` varchar(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sno`,`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dor_cost_record
-- ----------------------------
DROP TABLE IF EXISTS `dor_cost_record`;
CREATE TABLE `dor_cost_record` (
  `sno` int(11) DEFAULT NULL,
  `cost_no` varchar(10) DEFAULT NULL,
  `item` varchar(250) DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dor_device
-- ----------------------------
DROP TABLE IF EXISTS `dor_device`;
CREATE TABLE `dor_device` (
  `device_no` varchar(10) NOT NULL,
  `device_name` varchar(10) NOT NULL,
  `device_description` varchar(100) NOT NULL,
  `device_amount` int(11) NOT NULL,
  `device_applied_amount` int(11) NOT NULL,
  PRIMARY KEY (`device_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dor_device
-- ----------------------------

-- ----------------------------
-- Table structure for dor_device_applyment
-- ----------------------------
DROP TABLE IF EXISTS `dor_device_applyment`;
CREATE TABLE `dor_device_applyment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` int(10) NOT NULL,
  `item` varchar(10) NOT NULL,
  `now` varchar(30) DEFAULT NULL,
  `reason` varchar(100) NOT NULL,
  `remark` varchar(100) NOT NULL,
  `status` int(2) NOT NULL,
  `ad_no` varchar(10) NOT NULL,
  `return_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dor_repair_device
-- ----------------------------
DROP TABLE IF EXISTS `dor_repair_device`;
CREATE TABLE `dor_repair_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` int(10) DEFAULT NULL,
  `now` varchar(30) NOT NULL,
  `repair_time_1` varchar(30) NOT NULL,
  `apply_title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `remark` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `ad_no` varchar(10) NOT NULL,
  `admin_remark` varchar(100) NOT NULL,
  `repair_time_2` varchar(30) DEFAULT NULL,
  `repair_time_3` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dor_room
-- ----------------------------
DROP TABLE IF EXISTS `dor_room`;
CREATE TABLE `dor_room` (
  `room_no` varchar(10) NOT NULL,
  `dor_no` varchar(10) DEFAULT NULL,
  `bed_counts` int(11) DEFAULT NULL,
  `room_phone` varchar(100) DEFAULT NULL,
  `empty_beds` int(11) DEFAULT NULL,
  `live_in_stu` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dor_stu_account
-- ----------------------------
DROP TABLE IF EXISTS `dor_stu_account`;
CREATE TABLE `dor_stu_account` (
  `sno` varchar(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dormitory
-- ----------------------------
DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory` (
  `dor_no` varchar(10) NOT NULL,
  `dor_name` varchar(20) DEFAULT NULL,
  `dor_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dor_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dormitory_admin
-- ----------------------------
DROP TABLE IF EXISTS `dormitory_admin`;
CREATE TABLE `dormitory_admin` (
  `dorm_admin_no` varchar(10) NOT NULL,
  `dorm_admin_name` varchar(20) DEFAULT NULL,
  `dor_no` varchar(10) DEFAULT NULL,
  `dorm_admin_phone` varchar(11) DEFAULT NULL,
  `dorm_admin_email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`dorm_admin_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dormitory_schedule
-- ----------------------------
DROP TABLE IF EXISTS `dormitory_schedule`;
CREATE TABLE `dormitory_schedule` (
  `dor_no` varchar(20) DEFAULT NULL,
  `sno` int(11) DEFAULT NULL,
  `room_no` varchar(100) DEFAULT NULL,
  `bed_no` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for meeting_room
-- ----------------------------
DROP TABLE IF EXISTS `meeting_room`;
CREATE TABLE `meeting_room` (
  `meeting_room_no` varchar(10) NOT NULL,
  `meeting_room_size` varchar(10) DEFAULT NULL,
  `Include_medium_device` int(1) DEFAULT NULL COMMENT '0è¡¨ç¤ºæ²¡æœ‰1è¡¨ç¤ºæœ‰',
  `meeting_room_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`meeting_room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for meeting_room_applyment_record
-- ----------------------------
DROP TABLE IF EXISTS `meeting_room_applyment_record`;
CREATE TABLE `meeting_room_applyment_record` (
  `meeting_room_no` varchar(10) NOT NULL,
  `sno` int(10) NOT NULL,
  `check_cancel_apply` int(1) DEFAULT NULL COMMENT 'å¦‚æžœå–æ¶ˆç”³è¯·ä¸º0å¦åˆ™ä¸º1',
  `apply_time` datetime NOT NULL,
  `check_apply_success` int(1) DEFAULT NULL COMMENT 'è‹¥ç”³è¯·ä¸æˆåŠŸä¸º0ç”³è¯·æˆåŠŸä¸º1',
  `ad_no` varchar(10) DEFAULT NULL COMMENT 'å¤„ç†ç”³è¯·çš„ç®¡ç†å‘˜å·¥å·',
  `time_no_1` varchar(4) NOT NULL,
  `time_no_2` varchar(4) DEFAULT NULL,
  `time_no_3` varchar(4) DEFAULT NULL,
  `time_no_4` varchar(4) DEFAULT NULL,
  `book_date` date NOT NULL,
  `stu_remark` varchar(255) DEFAULT NULL,
  `ad_remark` varchar(255) DEFAULT NULL,
  `int` int(11) DEFAULT NULL,
  PRIMARY KEY (`apply_time`,`sno`,`meeting_room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for meeting_room_order_time
-- ----------------------------
DROP TABLE IF EXISTS `meeting_room_order_time`;
CREATE TABLE `meeting_room_order_time` (
  `meeting_room_order_time_no` varchar(4) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`meeting_room_order_time_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for repair_device_applyment
-- ----------------------------
DROP TABLE IF EXISTS `repair_device_applyment`;
CREATE TABLE `repair_device_applyment` (
  `sno` int(11) DEFAULT NULL,
  `dor_no` varchar(10) DEFAULT NULL,
  `room_no` varchar(10) DEFAULT NULL,
  `stu_phone` varchar(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `apply_repair_time` datetime DEFAULT NULL,
  `ad_no` varchar(10) DEFAULT NULL COMMENT 'å¤„ç†ç”³è¯·çš„ç®¡ç†å‘˜å·¥å·'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repair_device_applyment
-- ----------------------------

-- ----------------------------
-- Table structure for staying_apply_time
-- ----------------------------
DROP TABLE IF EXISTS `staying_apply_time`;
CREATE TABLE `staying_apply_time` (
  `staying_apply_time_no` varchar(50) NOT NULL,
  `year` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `vocation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staying_apply_time_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for staying_on_vacation_applyment
-- ----------------------------
DROP TABLE IF EXISTS `staying_on_vacation_applyment`;
CREATE TABLE `staying_on_vacation_applyment` (
  `sno` int(11) DEFAULT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `dor_no` varchar(10) DEFAULT NULL,
  `start_time` varchar(30) DEFAULT NULL,
  `end_time` varchar(30) DEFAULT NULL,
  `ad_no` varchar(10) DEFAULT NULL COMMENT 'å¤„ç†ç”³è¯·çš„ç®¡ç†å‘˜å·¥å·',
  `reason` varchar(100) DEFAULT NULL,
  `apply_time` varchar(30) DEFAULT NULL,
  `apply_status` varchar(25) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for stu_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `stu_pay_record`;
CREATE TABLE `stu_pay_record` (
  `sno` int(11) NOT NULL,
  `bill_no` int(11) DEFAULT NULL,
  `check_paied` int(11) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `dor_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` int(10) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `college` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dor_no` varchar(10) DEFAULT NULL,
  `room_no` varchar(10) DEFAULT NULL,
  `stu_phone` varchar(12) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL COMMENT 'å­¦ç”Ÿç±»åˆ«ï¼šåœ¨æ ¡æœ¬ç§‘ç”Ÿã€ä¼‘å­¦ç”Ÿã€ç ”ç©¶ç”Ÿè¿˜æ˜¯é€€å­¦ç”Ÿ',
  `email` varchar(40) DEFAULT NULL,
  `bed_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for student_staying_record
-- ----------------------------
DROP TABLE IF EXISTS `student_staying_record`;
CREATE TABLE `student_staying_record` (
  `dor_no` varchar(10) DEFAULT NULL,
  `sno` int(10) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `room_no` varchar(10) DEFAULT NULL COMMENT 'å¤„ç†ç”³è¯·çš„ç®¡ç†å‘˜å·¥å·',
  `stu_phone` int(11) DEFAULT NULL COMMENT 'å¦‚æžœå–æ¶ˆç”³è¯·ä¸º0å¦åˆ™ä¸º1',
  `end_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `apply_time` datetime DEFAULT NULL,
  `apply_status` varchar(10) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_staying_record
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
