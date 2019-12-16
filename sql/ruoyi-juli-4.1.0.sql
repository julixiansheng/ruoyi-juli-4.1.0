/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : ruoyi-juli-4.1.0

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-12-16 18:32:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016ED4404C70787074006EE8B083E794A84A61636B726162626974204743E59E83E59CBEE59B9EE694B6E599A8EFBC8CE6B885E7908673746F726564617461E58CBAE59F9FE59E83E59CBEE69687E4BBB6EFBC8CE8B083E794A8E5898DE99C80E8A681E585B3E997AD4A61636B726162626974E69C8DE58AA17070707400013174000E302F3130202A202A202A202A203F74005E72795461736B2E6A61636B72616262697447432827433A5C436F6464696E675C4170616368655C4A61636B5261626269745C4A61636B5261626269742D322E31382E342D746F6D6361742D372E302E39315C6A61636B726162626974272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000474000D4A61636B72616262697420474374000131740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'JULIXIANSHENG1576491225078', '1576492310886', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1576491230000', '-1', '5', 'PAUSED', 'CRON', '1576491225000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1576491225000', '-1', '5', 'PAUSED', 'CRON', '1576491225000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1576491240000', '-1', '5', 'PAUSED', 'CRON', '1576491225000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', 'TASK_CLASS_NAME4', 'DEFAULT', null, '1576491230000', '-1', '5', 'PAUSED', 'CRON', '1576491225000', '0', null, '-1', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '首页轮播图间隔时间', 'sys.switch.interval', '5000', 'N', 'admin', '2019-12-04 18:20:01', 'admin', '2019-12-04 21:20:01', '首页轮播图间隔时间');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('110', '105', '0,100,101,105', '测试一组', '1', null, null, null, '0', '0', 'admin', '2019-12-02 22:35:41', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL COMMENT '文件id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_size` int(11) DEFAULT NULL COMMENT '文件大小',
  `mime_type` varchar(64) DEFAULT NULL COMMENT 'mime类型（用于下载的时候指定文件类型）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '创建人部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('1202215630591332354', '动漫 - 3.jpg', '5113670', 'image/jpeg', '1', '2019-12-04 21:18:37', '1', '2019-12-04 21:18:37', '103');
INSERT INTO `sys_file` VALUES ('1202218801623568385', '90219-106.jpg', '263075', 'image/jpeg', '1', '2019-12-04 21:31:13', '1', '2019-12-04 21:31:13', '103');
INSERT INTO `sys_file` VALUES ('1202443020378685441', '动漫 - 49.jpg', '448579', 'image/jpeg', '1', '2019-12-05 12:22:11', '1', '2019-12-05 12:22:11', '103');

-- ----------------------------
-- Table structure for sys_img
-- ----------------------------
DROP TABLE IF EXISTS `sys_img`;
CREATE TABLE `sys_img` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `img_name` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `img_url` varchar(64) DEFAULT NULL COMMENT '图片路径',
  `img_order` int(3) DEFAULT NULL COMMENT '图片序号',
  `is_display` char(3) DEFAULT NULL COMMENT '是否显示',
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件id',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '创建人部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图片表';

-- ----------------------------
-- Records of sys_img
-- ----------------------------
INSERT INTO `sys_img` VALUES ('1202170872989331458', '动漫 - 3.jpg', '/system/file/download/1202215630591332354', '1', 'Y', '1202215630591332354', '1', '2019-12-04 18:20:46', '1', '2019-12-04 21:18:37', '103');
INSERT INTO `sys_img` VALUES ('1202171055793876993', '90219-106.jpg', '/system/file/download/1202218801623568385', '3', 'Y', '1202218801623568385', '1', '2019-12-04 18:21:30', '1', '2019-12-05 12:22:17', '103');
INSERT INTO `sys_img` VALUES ('1202443024103227394', '动漫 - 49.jpg', '/system/file/download/1202443020378685441', '2', 'Y', '1202443020378685441', '1', '2019-12-05 12:22:12', '1', '2019-12-05 12:22:12', '103');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('4', 'Jackrabbit GC', 'DEFAULT', 'ryTask.jackrabbitGC(\'C:\\Codding\\Apache\\JackRabbit\\JackRabbit-2.18.4-tomcat-7.0.91\\jackrabbit\')', '0/10 * * * * ?', '1', '1', '1', 'admin', '2019-12-05 12:10:14', 'admin', '2019-12-05 12:15:08', '调用Jackrabbit GC垃圾回收器，清理storedata区域垃圾文件，调用前需要关闭Jackrabbit服务');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES ('1', 'Jackrabbit GC', 'DEFAULT', 'ryTask.jackrabbitGC(\'C:\\Codding\\Apache\\JackRabbit\\JackRabbit-2.18.4-tomcat-7.0.91\\jackrabbit\')', 'Jackrabbit GC 总共耗时：182毫秒', '0', '', '2019-12-05 12:16:27');
INSERT INTO `sys_job_log` VALUES ('2', 'Jackrabbit GC', 'DEFAULT', 'ryTask.jackrabbitGC(\'C:\\Codding\\Apache\\JackRabbit\\JackRabbit-2.18.4-tomcat-7.0.91\\jackrabbit\')', 'Jackrabbit GC 总共耗时：6731毫秒', '0', '', '2019-12-05 12:16:52');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 14:09:14');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 14:18:49');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 14:41:42');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 17:17:13');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 17:24:13');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 21:09:39');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 21:56:15');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 22:01:16');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 22:05:16');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 22:26:25');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 23:33:30');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 23:43:09');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 23:48:26');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-25 23:51:30');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 00:02:20');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 10:15:16');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 10:42:20');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 12:15:20');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 13:03:41');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 13:22:52');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 19:55:20');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 21:14:15');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 21:24:12');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 21:41:25');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-26 22:39:12');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 18:37:24');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 18:38:01');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 18:53:38');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 21:34:12');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 21:37:05');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 21:46:27');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 21:49:50');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 22:28:48');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 22:51:41');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 22:53:16');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 22:59:00');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-30 23:02:15');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 19:26:22');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 19:38:45');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 19:45:17');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 20:11:30');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 20:15:41');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 20:21:31');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 20:45:07');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:25:19');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 21:36:17');
INSERT INTO `sys_logininfor` VALUES ('146', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:36:26');
INSERT INTO `sys_logininfor` VALUES ('147', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 21:37:49');
INSERT INTO `sys_logininfor` VALUES ('148', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:37:55');
INSERT INTO `sys_logininfor` VALUES ('149', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 21:38:16');
INSERT INTO `sys_logininfor` VALUES ('150', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:38:26');
INSERT INTO `sys_logininfor` VALUES ('151', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 21:38:54');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:38:57');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 21:39:23');
INSERT INTO `sys_logininfor` VALUES ('154', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:39:26');
INSERT INTO `sys_logininfor` VALUES ('155', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 21:40:14');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:40:15');
INSERT INTO `sys_logininfor` VALUES ('157', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:43:11');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:51:44');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 21:51:46');
INSERT INTO `sys_logininfor` VALUES ('160', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:51:48');
INSERT INTO `sys_logininfor` VALUES ('161', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 21:52:25');
INSERT INTO `sys_logininfor` VALUES ('162', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:52:28');
INSERT INTO `sys_logininfor` VALUES ('163', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 21:53:52');
INSERT INTO `sys_logininfor` VALUES ('164', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:53:58');
INSERT INTO `sys_logininfor` VALUES ('165', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 21:55:31');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 21:55:32');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:10:47');
INSERT INTO `sys_logininfor` VALUES ('168', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:10:49');
INSERT INTO `sys_logininfor` VALUES ('169', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:11:14');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:11:15');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:11:29');
INSERT INTO `sys_logininfor` VALUES ('172', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:11:32');
INSERT INTO `sys_logininfor` VALUES ('173', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:11:35');
INSERT INTO `sys_logininfor` VALUES ('174', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:11:39');
INSERT INTO `sys_logininfor` VALUES ('175', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:13:47');
INSERT INTO `sys_logininfor` VALUES ('176', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:14:49');
INSERT INTO `sys_logininfor` VALUES ('177', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:16:45');
INSERT INTO `sys_logininfor` VALUES ('178', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:19:18');
INSERT INTO `sys_logininfor` VALUES ('179', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:19:47');
INSERT INTO `sys_logininfor` VALUES ('180', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:21:00');
INSERT INTO `sys_logininfor` VALUES ('181', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:24:14');
INSERT INTO `sys_logininfor` VALUES ('182', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:27:45');
INSERT INTO `sys_logininfor` VALUES ('183', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:29:00');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:29:02');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:29:13');
INSERT INTO `sys_logininfor` VALUES ('186', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:29:16');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:32:08');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:32:12');
INSERT INTO `sys_logininfor` VALUES ('189', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:32:15');
INSERT INTO `sys_logininfor` VALUES ('190', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:32:28');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:32:29');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:33:38');
INSERT INTO `sys_logininfor` VALUES ('193', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:33:41');
INSERT INTO `sys_logininfor` VALUES ('194', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:34:19');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:34:20');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:34:29');
INSERT INTO `sys_logininfor` VALUES ('197', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:34:33');
INSERT INTO `sys_logininfor` VALUES ('198', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:34:45');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:34:48');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:37:56');
INSERT INTO `sys_logininfor` VALUES ('201', 'testzy', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:38:00');
INSERT INTO `sys_logininfor` VALUES ('202', 'testzy', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:38:29');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:38:30');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:38:38');
INSERT INTO `sys_logininfor` VALUES ('205', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:38:41');
INSERT INTO `sys_logininfor` VALUES ('206', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:38:45');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:38:47');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:39:01');
INSERT INTO `sys_logininfor` VALUES ('209', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:39:04');
INSERT INTO `sys_logininfor` VALUES ('210', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:46:09');
INSERT INTO `sys_logininfor` VALUES ('211', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:48:31');
INSERT INTO `sys_logininfor` VALUES ('212', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:48:35');
INSERT INTO `sys_logininfor` VALUES ('213', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:48:41');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:48:42');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-12-02 22:49:09');
INSERT INTO `sys_logininfor` VALUES ('216', 'shenzhen', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-02 22:49:12');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 15:52:15');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 17:46:49');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 18:02:28');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 18:32:22');
INSERT INTO `sys_logininfor` VALUES ('221', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 18:36:35');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 18:38:57');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 18:41:54');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 18:50:18');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 18:53:18');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 18:56:16');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 19:12:13');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 19:18:30');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 21:55:57');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 21:57:44');
INSERT INTO `sys_logininfor` VALUES ('231', 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-12-03 22:07:25');
INSERT INTO `sys_logininfor` VALUES ('232', 'admin', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 10', '0', '登录成功', '2019-12-03 22:09:03');
INSERT INTO `sys_logininfor` VALUES ('233', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 22:14:48');
INSERT INTO `sys_logininfor` VALUES ('234', 'admin', '127.0.0.1', '内网IP', 'Firefox 7', 'Windows 10', '0', '登录成功', '2019-12-03 22:14:57');
INSERT INTO `sys_logininfor` VALUES ('235', 'admin', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-12-03 22:16:45');
INSERT INTO `sys_logininfor` VALUES ('236', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 22:26:56');
INSERT INTO `sys_logininfor` VALUES ('237', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 22:41:40');
INSERT INTO `sys_logininfor` VALUES ('238', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 22:47:56');
INSERT INTO `sys_logininfor` VALUES ('239', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 22:51:56');
INSERT INTO `sys_logininfor` VALUES ('240', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 22:54:04');
INSERT INTO `sys_logininfor` VALUES ('241', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 22:56:17');
INSERT INTO `sys_logininfor` VALUES ('242', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 23:22:29');
INSERT INTO `sys_logininfor` VALUES ('243', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-03 23:23:55');
INSERT INTO `sys_logininfor` VALUES ('244', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 13:38:57');
INSERT INTO `sys_logininfor` VALUES ('245', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 14:19:48');
INSERT INTO `sys_logininfor` VALUES ('246', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 14:39:28');
INSERT INTO `sys_logininfor` VALUES ('247', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 15:10:37');
INSERT INTO `sys_logininfor` VALUES ('248', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 15:12:55');
INSERT INTO `sys_logininfor` VALUES ('249', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 15:48:41');
INSERT INTO `sys_logininfor` VALUES ('250', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 15:51:16');
INSERT INTO `sys_logininfor` VALUES ('251', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 16:04:25');
INSERT INTO `sys_logininfor` VALUES ('252', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 16:33:45');
INSERT INTO `sys_logininfor` VALUES ('253', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 16:57:32');
INSERT INTO `sys_logininfor` VALUES ('254', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 17:31:14');
INSERT INTO `sys_logininfor` VALUES ('255', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 17:50:25');
INSERT INTO `sys_logininfor` VALUES ('256', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 18:19:14');
INSERT INTO `sys_logininfor` VALUES ('257', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 18:26:26');
INSERT INTO `sys_logininfor` VALUES ('258', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 19:45:22');
INSERT INTO `sys_logininfor` VALUES ('259', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 19:50:54');
INSERT INTO `sys_logininfor` VALUES ('260', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 20:01:44');
INSERT INTO `sys_logininfor` VALUES ('261', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 20:05:33');
INSERT INTO `sys_logininfor` VALUES ('262', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 20:09:29');
INSERT INTO `sys_logininfor` VALUES ('263', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 21:17:58');
INSERT INTO `sys_logininfor` VALUES ('264', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-04 21:54:33');
INSERT INTO `sys_logininfor` VALUES ('265', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-05 12:04:18');
INSERT INTO `sys_logininfor` VALUES ('266', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-05 12:16:13');
INSERT INTO `sys_logininfor` VALUES ('267', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-12-16 18:14:42');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2038 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '账户解锁', '501', '4', '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '在线查询', '109', '1', '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '批量强退', '109', '2', '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '单条强退', '109', '3', '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务查询', '110', '1', '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务新增', '110', '2', '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务修改', '110', '3', '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '任务删除', '110', '4', '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '状态修改', '110', '5', '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务详细', '110', '6', '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '任务导出', '110', '7', '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成查询', '114', '1', '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '生成修改', '114', '2', '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1059', '生成删除', '114', '3', '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1060', '预览代码', '114', '4', '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1061', '生成代码', '114', '5', '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2006', '开发模块', '0', '5', '#', 'menuItem', 'M', '0', '', 'fa fa-code-fork', 'admin', '2019-11-25 14:42:09', 'admin', '2019-12-03 17:50:10', '');
INSERT INTO `sys_menu` VALUES ('2007', '人员', '2006', '1', '/test/person', 'menuItem', 'C', '0', 'test:person:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-11-26 21:15:08', '人员菜单');
INSERT INTO `sys_menu` VALUES ('2008', '人员查询', '2007', '1', '#', '', 'F', '0', 'test:person:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2009', '人员新增', '2007', '2', '#', '', 'F', '0', 'test:person:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2010', '人员修改', '2007', '3', '#', '', 'F', '0', 'test:person:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2011', '人员删除', '2007', '4', '#', '', 'F', '0', 'test:person:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2012', '人员导出', '2007', '5', '#', '', 'F', '0', 'test:person:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2025', '文件列表', '2031', '1', '/system/file', 'menuItem', 'C', '0', 'system:file:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-04 17:31:30', '文件菜单');
INSERT INTO `sys_menu` VALUES ('2026', '文件查询', '2025', '1', '#', '', 'F', '0', 'system:file:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2027', '文件新增', '2025', '2', '#', '', 'F', '0', 'system:file:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2028', '文件修改', '2025', '3', '#', '', 'F', '0', 'system:file:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2029', '文件删除', '2025', '4', '#', '', 'F', '0', 'system:file:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2030', '文件导出', '2025', '5', '#', '', 'F', '0', 'system:file:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2031', '文件管理', '0', '4', '#', 'menuItem', 'M', '0', '', 'fa fa-folder-o', 'admin', '2019-12-03 17:49:34', 'admin', '2019-12-03 17:50:05', '');
INSERT INTO `sys_menu` VALUES ('2032', '图片管理', '2031', '1', '/system/img', 'menuItem', 'C', '0', 'system:img:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-12-03 18:02:52', '轮播图片菜单');
INSERT INTO `sys_menu` VALUES ('2033', '轮播图片查询', '2032', '1', '#', '', 'F', '0', 'system:img:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2034', '轮播图片新增', '2032', '2', '#', '', 'F', '0', 'system:img:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2035', '轮播图片修改', '2032', '3', '#', '', 'F', '0', 'system:img:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2036', '轮播图片删除', '2032', '4', '#', '', 'F', '0', 'system:img:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2037', '轮播图片导出', '2032', '5', '#', '', 'F', '0', 'system:img:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"tb_training\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-25 14:26:16');
INSERT INTO `sys_oper_log` VALUES ('101', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"1\" ],\r\n  \"tableName\" : [ \"tb_training\" ],\r\n  \"tableComment\" : [ \"训练表\" ],\r\n  \"className\" : [ \"Training\" ],\r\n  \"functionAuthor\" : [ \"居里先生\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"1\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"id\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"2\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"训练名称\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"trainingName\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"3\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"训练编号\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"trainingNo\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"4\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"训练类型\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"trainingType\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"select\" ],\r\n  \"columns[3].dictType\" : [ \"sys_notice_ty', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-25 14:28:59');
INSERT INTO `sys_oper_log` VALUES ('102', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"tb_training\" ]\r\n}', 'null', '0', null, '2019-11-25 14:29:04');
INSERT INTO `sys_oper_log` VALUES ('103', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"开发模块\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-code-fork\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-25 14:42:09');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"2006\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"训练\" ],\r\n  \"url\" : [ \"/test/training\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"test:training:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-25 14:42:24');
INSERT INTO `sys_oper_log` VALUES ('105', '训练', '1', 'com.ruoyi.moudels.test.controller.TrainingController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/training/add', '127.0.0.1', '内网IP', '{\r\n  \"trainingName\" : [ \"201拉练\" ],\r\n  \"trainingNo\" : [ \"hegong201\" ],\r\n  \"trainingType\" : [ \"1\" ],\r\n  \"trainingState\" : [ \"0\" ],\r\n  \"trainingDate\" : [ \"2019-11-25\" ]\r\n}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\idea_workspace\\ruoyi-juli-4.1.0\\ruoyi-moudel\\target\\classes\\mapper\\test\\TrainingMapper.xml]\r\n### The error may involve com.ruoyi.moudels.test.mapper.TrainingMapper.insertTraining-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_training          ( training_name,             training_no,             training_type,             training_state,             training_date,                                       create_time )           values ( ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2019-11-25 14:47:30');
INSERT INTO `sys_oper_log` VALUES ('106', '训练', '1', 'com.ruoyi.moudels.test.controller.TrainingController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/training/add', '127.0.0.1', '内网IP', '{\r\n  \"trainingName\" : [ \"201拉练\" ],\r\n  \"trainingNo\" : [ \"hegong201\" ],\r\n  \"trainingType\" : [ \"1\" ],\r\n  \"trainingState\" : [ \"0\" ],\r\n  \"trainingDate\" : [ \"2019-11-25\" ]\r\n}', 'null', '1', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'createBy\' of \'class com.ruoyi.moudels.test.domain.Training\' with value \'1\' Cause: java.lang.IllegalArgumentException: java.lang.ClassCastException@2e5fea3', '2019-11-25 21:57:37');
INSERT INTO `sys_oper_log` VALUES ('107', '训练', '1', 'com.ruoyi.moudels.test.controller.TrainingController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/training/add', '127.0.0.1', '内网IP', '{\r\n  \"trainingName\" : [ \"拉练201\" ],\r\n  \"trainingNo\" : [ \"hegong201\" ],\r\n  \"trainingType\" : [ \"1\" ],\r\n  \"trainingState\" : [ \"0\" ],\r\n  \"trainingDate\" : [ \"2019-11-25\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-25 22:01:42');
INSERT INTO `sys_oper_log` VALUES ('108', '训练', '2', 'com.ruoyi.moudels.test.controller.TrainingController.editSave()', 'POST', '1', 'admin', '研发部门', '/test/training/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1198964984160215042\" ],\r\n  \"trainingName\" : [ \"拉练201\" ],\r\n  \"trainingNo\" : [ \"hegong201\" ],\r\n  \"trainingType\" : [ \"1\" ],\r\n  \"trainingState\" : [ \"0\" ],\r\n  \"trainingDate\" : [ \"2019-11-25\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-25 23:34:14');
INSERT INTO `sys_oper_log` VALUES ('109', '训练', '1', 'com.ruoyi.moudels.test.controller.TrainingController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/training/add', '127.0.0.1', '内网IP', '{\r\n  \"trainingName\" : [ \"拉练201-2\" ],\r\n  \"trainingNo\" : [ \"hegong201\" ],\r\n  \"trainingType\" : [ \"2\" ],\r\n  \"trainingState\" : [ \"0\" ],\r\n  \"trainingDate\" : [ \"2019-11-12\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-25 23:44:38');
INSERT INTO `sys_oper_log` VALUES ('110', '训练', '1', 'com.ruoyi.moudels.test.controller.TrainingController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/training/add', '127.0.0.1', '内网IP', '{\r\n  \"trainingName\" : [ \"拉练201-3\" ],\r\n  \"trainingNo\" : [ \"hegong201\" ],\r\n  \"trainingType\" : [ \"1\" ],\r\n  \"trainingState\" : [ \"0\" ],\r\n  \"trainingDate\" : [ \"2019-11-27\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 10:15:46');
INSERT INTO `sys_oper_log` VALUES ('111', '训练', '3', 'com.ruoyi.moudels.test.controller.TrainingController.remove()', 'POST', '1', 'admin', '研发部门', '/test/training/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1199149718412763138\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 10:17:44');
INSERT INTO `sys_oper_log` VALUES ('112', '训练', '3', 'com.ruoyi.moudels.test.controller.TrainingController.remove()', 'POST', '1', 'admin', '研发部门', '/test/training/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1198964984160215042,1198990885375733762\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 10:18:53');
INSERT INTO `sys_oper_log` VALUES ('113', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"1\" ],\r\n  \"tableName\" : [ \"tb_training\" ],\r\n  \"tableComment\" : [ \"训练表\" ],\r\n  \"className\" : [ \"Training\" ],\r\n  \"functionAuthor\" : [ \"居里先生\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"1\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"id\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"2\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"训练名称\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"trainingName\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"3\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"训练编号\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"trainingNo\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"4\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"训练类型\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"trainingType\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"select\" ],\r\n  \"columns[3].dictType\" : [ \"sys_notice_ty', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 13:27:04');
INSERT INTO `sys_oper_log` VALUES ('114', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"tb_person\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 19:57:32');
INSERT INTO `sys_oper_log` VALUES ('115', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"2\" ],\r\n  \"tableName\" : [ \"tb_person\" ],\r\n  \"tableComment\" : [ \"人员表\" ],\r\n  \"className\" : [ \"Person\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"12\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"id\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"13\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"姓名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"name\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"14\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"年龄\" ],\r\n  \"columns[2].javaType\" : [ \"Integer\" ],\r\n  \"columns[2].javaField\" : [ \"age\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"15\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"性别\" ],\r\n  \"columns[3].javaType\" : [ \"Integer\" ],\r\n  \"columns[3].javaField\" : [ \"sex\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"radio\" ],\r\n  \"columns[3].dictType\" : [ \"sys_user_sex\" ],\r\n  \"columns[4].columnId\"', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 20:02:42');
INSERT INTO `sys_oper_log` VALUES ('116', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/tb_person', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-26 20:02:48');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2007\" ],\r\n  \"parentId\" : [ \"2006\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"人员\" ],\r\n  \"url\" : [ \"/test/person\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"test:person:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 21:15:09');
INSERT INTO `sys_oper_log` VALUES ('118', '人员', '1', 'com.ruoyi.moudels.test.controller.PersonController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/person/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"居里先生\" ],\r\n  \"age\" : [ \"21\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"job\" : [ \"1\" ],\r\n  \"jobDate\" : [ \"2019-11-19\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 21:25:57');
INSERT INTO `sys_oper_log` VALUES ('119', '人员', '2', 'com.ruoyi.moudels.test.controller.PersonController.editSave()', 'POST', '1', 'admin', '研发部门', '/test/person/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1199318373431861250\" ],\r\n  \"name\" : [ \"居里先生1\" ],\r\n  \"age\" : [ \"22\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"job\" : [ \"0\" ],\r\n  \"jobDate\" : [ \"2019-11-19\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 22:39:26');
INSERT INTO `sys_oper_log` VALUES ('120', '人员', '2', 'com.ruoyi.moudels.test.controller.PersonController.editSave()', 'POST', '1', 'admin', '研发部门', '/test/person/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1199318373431861250\" ],\r\n  \"name\" : [ \"居里先生\" ],\r\n  \"age\" : [ \"22\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"job\" : [ \"0\" ],\r\n  \"jobDate\" : [ \"2019-11-19\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 22:39:36');
INSERT INTO `sys_oper_log` VALUES ('121', '人员', '1', 'com.ruoyi.moudels.test.controller.PersonController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/person/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"欧阳\" ],\r\n  \"age\" : [ \"32\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"job\" : [ \"0\" ],\r\n  \"jobDate\" : [ \"2019-11-01\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 22:40:04');
INSERT INTO `sys_oper_log` VALUES ('122', '人员', '3', 'com.ruoyi.moudels.test.controller.PersonController.remove()', 'POST', '1', 'admin', '研发部门', '/test/person/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1199318373431861250,1199337026109837313\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 22:41:38');
INSERT INTO `sys_oper_log` VALUES ('123', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"sys_dept\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 22:51:40');
INSERT INTO `sys_oper_log` VALUES ('124', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"3\" ],\r\n  \"tableName\" : [ \"sys_dept\" ],\r\n  \"tableComment\" : [ \"部门表\" ],\r\n  \"className\" : [ \"Dept\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"23\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"部门id\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"deptId\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"24\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"父部门id\" ],\r\n  \"columns[1].javaType\" : [ \"Long\" ],\r\n  \"columns[1].javaField\" : [ \"parentId\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"25\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"祖级列表\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"ancestors\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"26\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"部门名称\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"deptName\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"LIKE\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" : [ \"27\" ],\r\n  \"columns[4].sort\" : [ \"5\" ],\r\n  \"columns[4].columnComment\" : [ \"显示顺序\" ],\r\n  \"columns[4].j', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-26 22:53:30');
INSERT INTO `sys_oper_log` VALUES ('125', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/sys_dept', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-11-30 18:37:39');
INSERT INTO `sys_oper_log` VALUES ('126', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2013\" ],\r\n  \"parentId\" : [ \"2006\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"部门\" ],\r\n  \"url\" : [ \"/test/dept\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"test:dept:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-30 18:54:03');
INSERT INTO `sys_oper_log` VALUES ('127', '部门', '1', 'com.ruoyi.moudels.test.controller.DeptController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/dept/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"\" ],\r\n  \"deptName\" : [ \"\" ],\r\n  \"orderNum\" : [ \"\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"delFlag\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-30 21:37:31');
INSERT INTO `sys_oper_log` VALUES ('128', '部门', '1', 'com.ruoyi.moudels.test.controller.DeptController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/dept/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"\" ],\r\n  \"deptName\" : [ \"软件学院\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"刘\" ],\r\n  \"phone\" : [ \"13313090597\" ],\r\n  \"email\" : [ \"798224073@qq.com\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"delFlag\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-30 21:39:43');
INSERT INTO `sys_oper_log` VALUES ('129', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2013', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"存在子菜单,不允许删除\",\r\n  \"code\" : 301\r\n}', '0', null, '2019-11-30 22:29:02');
INSERT INTO `sys_oper_log` VALUES ('130', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2014', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-30 22:29:07');
INSERT INTO `sys_oper_log` VALUES ('131', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2015', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-30 22:29:13');
INSERT INTO `sys_oper_log` VALUES ('132', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2016', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-30 22:29:18');
INSERT INTO `sys_oper_log` VALUES ('133', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2017', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-30 22:29:22');
INSERT INTO `sys_oper_log` VALUES ('134', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2018', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-30 22:29:27');
INSERT INTO `sys_oper_log` VALUES ('135', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2013', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-30 22:29:31');
INSERT INTO `sys_oper_log` VALUES ('136', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"tb_dept\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-30 22:29:45');
INSERT INTO `sys_oper_log` VALUES ('137', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"4\" ],\r\n  \"tableName\" : [ \"tb_dept\" ],\r\n  \"tableComment\" : [ \"部门表\" ],\r\n  \"className\" : [ \"Dept\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"37\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"id\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"38\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"父部门id\" ],\r\n  \"columns[1].javaType\" : [ \"Long\" ],\r\n  \"columns[1].javaField\" : [ \"parentId\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"39\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"祖级列表\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"ancestors\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"40\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"部门名称\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"deptName\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"LIKE\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" : [ \"41\" ],\r\n  \"columns[4].sort\" : [ \"5\" ],\r\n  \"columns[4].columnComment\" : [ \"显示顺序\" ],\r\n  \"columns[4].javaType\" : [ \"Integer\" ],\r\n  \"columns[4].javaField\" : [ \"orderNum\" ],', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-11-30 22:32:44');
INSERT INTO `sys_oper_log` VALUES ('138', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"4\" ],\r\n  \"tableName\" : [ \"tb_dept\" ],\r\n  \"tableComment\" : [ \"部门表\" ],\r\n  \"className\" : [ \"Dept\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"37\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"id\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"38\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"父部门id\" ],\r\n  \"columns[1].javaType\" : [ \"Long\" ],\r\n  \"columns[1].javaField\" : [ \"parentId\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"39\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"祖级列表\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"ancestors\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"40\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"部门名称\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"deptName\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"LIKE\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" : [ \"41\" ],\r\n  \"columns[4].sort\" : [ \"5\" ],\r\n  \"columns[4].columnComment\" : [ \"显示顺序\" ],\r\n  \"columns[4].javaType\" : [ \"Integer\" ],\r\n  \"columns[4].javaField\" : [ \"orderNum\" ],\r\n  \"columns[4].queryType\" : [ \"EQ', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 19:28:01');
INSERT INTO `sys_oper_log` VALUES ('139', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/tb_dept', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-02 19:31:42');
INSERT INTO `sys_oper_log` VALUES ('140', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2019\" ],\r\n  \"parentId\" : [ \"2006\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"部门\" ],\r\n  \"url\" : [ \"/test/dept\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"test:dept:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 19:34:04');
INSERT INTO `sys_oper_log` VALUES ('141', '部门', '1', 'com.ruoyi.moudels.test.controller.DeptController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/dept/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"deptName\" : [ \"六号楼201\" ],\r\n  \"leader\" : [ \"居里先生\" ],\r\n  \"phone\" : [ \"1331305341\" ],\r\n  \"email\" : [ \"798224073@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 19:48:04');
INSERT INTO `sys_oper_log` VALUES ('142', '部门', '2', 'com.ruoyi.moudels.test.controller.DeptController.editSave()', 'POST', '1', 'admin', '研发部门', '/test/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"parentName\" : [ \"六号楼\" ],\r\n  \"deptName\" : [ \"六号楼\" ],\r\n  \"leader\" : [ \"居里先生\" ],\r\n  \"phone\" : [ \"13313090597\" ],\r\n  \"email\" : [ \"798224073@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 19:48:52');
INSERT INTO `sys_oper_log` VALUES ('143', '部门', '2', 'com.ruoyi.moudels.test.controller.DeptController.editSave()', 'POST', '1', 'admin', '研发部门', '/test/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"parentName\" : [ \"六号楼\" ],\r\n  \"deptName\" : [ \"六号楼\" ],\r\n  \"leader\" : [ \"居里先生\" ],\r\n  \"phone\" : [ \"13313090597\" ],\r\n  \"email\" : [ \"798224073@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 19:48:54');
INSERT INTO `sys_oper_log` VALUES ('144', '部门', '3', 'com.ruoyi.moudels.test.controller.DeptController.remove()', 'GET', '1', 'admin', '研发部门', '/test/dept/remove/1', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 19:49:02');
INSERT INTO `sys_oper_log` VALUES ('145', '部门', '1', 'com.ruoyi.moudels.test.controller.DeptController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/dept/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1201468068724793345\" ],\r\n  \"deptName\" : [ \"六号楼201八号床\" ],\r\n  \"leader\" : [ \"居里先生\" ],\r\n  \"phone\" : [ \"13313090597\" ],\r\n  \"email\" : [ \"798224073@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 19:50:39');
INSERT INTO `sys_oper_log` VALUES ('146', '部门', '1', 'com.ruoyi.moudels.test.controller.DeptController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/dept/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1201468068724793345\" ],\r\n  \"deptName\" : [ \"六号楼201八号床\" ],\r\n  \"leader\" : [ \"居里先生\" ],\r\n  \"phone\" : [ \"13313090597\" ],\r\n  \"email\" : [ \"798224073@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 20:03:21');
INSERT INTO `sys_oper_log` VALUES ('147', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"测试人员\" ],\r\n  \"deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"13313090597\" ],\r\n  \"email\" : [ \"798224073@qq.com\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"password\" : [ \"admin123\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:28:29');
INSERT INTO `sys_oper_log` VALUES ('148', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\r\n  \"roleName\" : [ \"测试人员\" ],\r\n  \"roleKey\" : [ \"testMan\" ],\r\n  \"roleSort\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"menuIds\" : [ \"2006,2007,2008,2009,2010,2011,2012\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:29:26');
INSERT INTO `sys_oper_log` VALUES ('149', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"3\" ],\r\n  \"roleName\" : [ \"测试人员\" ],\r\n  \"roleKey\" : [ \"testMan\" ],\r\n  \"dataScope\" : [ \"3\" ],\r\n  \"deptIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:29:48');
INSERT INTO `sys_oper_log` VALUES ('150', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"3\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"测试人员\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"13313090597\" ],\r\n  \"email\" : [ \"798224073@qq.com\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"3\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"3\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:30:04');
INSERT INTO `sys_oper_log` VALUES ('151', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\r\n  \"roleName\" : [ \"主管\" ],\r\n  \"roleKey\" : [ \"mainManager\" ],\r\n  \"roleSort\" : [ \"4\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"menuIds\" : [ \"2006,2007,2008,2009,2010,2011,2012\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:30:54');
INSERT INTO `sys_oper_log` VALUES ('152', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"4\" ],\r\n  \"roleName\" : [ \"主管\" ],\r\n  \"roleKey\" : [ \"mainManager\" ],\r\n  \"dataScope\" : [ \"4\" ],\r\n  \"deptIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:31:05');
INSERT INTO `sys_oper_log` VALUES ('153', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"深圳总公司主管\" ],\r\n  \"deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"13313090598\" ],\r\n  \"email\" : [ \"798224074@qq.com\" ],\r\n  \"loginName\" : [ \"shenzhen\" ],\r\n  \"password\" : [ \"admin123\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"4\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"4\" ],\r\n  \"postIds\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:33:17');
INSERT INTO `sys_oper_log` VALUES ('154', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"106\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"财务部门\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:36:09');
INSERT INTO `sys_oper_log` VALUES ('155', '人员', '1', 'com.ruoyi.moudels.test.controller.PersonController.addSave()', 'POST', '1', 'test', '测试部门', '/test/person/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"居里先生\" ],\r\n  \"age\" : [ \"21\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"job\" : [ \"0\" ],\r\n  \"jobDate\" : [ \"2019-12-02\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:36:39');
INSERT INTO `sys_oper_log` VALUES ('156', '人员', '2', 'com.ruoyi.moudels.test.controller.PersonController.editSave()', 'POST', '1', 'test', '测试部门', '/test/person/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1201495395135475714\" ],\r\n  \"name\" : [ \"测试人员数据\" ],\r\n  \"age\" : [ \"21\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"job\" : [ \"0\" ],\r\n  \"jobDate\" : [ \"2019-12-02\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:37:43');
INSERT INTO `sys_oper_log` VALUES ('157', '人员', '1', 'com.ruoyi.moudels.test.controller.PersonController.addSave()', 'POST', '1', 'shenzhen', '深圳总公司', '/test/person/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"主管数据\" ],\r\n  \"age\" : [ \"22\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"job\" : [ \"0\" ],\r\n  \"jobDate\" : [ \"2019-11-27\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:38:52');
INSERT INTO `sys_oper_log` VALUES ('158', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"2006,2007,2008,2009,2010,2011,2012\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:39:17');
INSERT INTO `sys_oper_log` VALUES ('159', '人员', '1', 'com.ruoyi.moudels.test.controller.PersonController.addSave()', 'POST', '1', 'ry', '财务部门', '/test/person/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"财务部门数据\" ],\r\n  \"age\" : [ \"23\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"job\" : [ \"0\" ],\r\n  \"jobDate\" : [ \"2019-12-04\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:40:04');
INSERT INTO `sys_oper_log` VALUES ('160', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105,106\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:41:10');
INSERT INTO `sys_oper_log` VALUES ('161', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105,106\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:56:01');
INSERT INTO `sys_oper_log` VALUES ('162', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,103,104,105,106,107\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:56:46');
INSERT INTO `sys_oper_log` VALUES ('163', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105,106\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:57:05');
INSERT INTO `sys_oper_log` VALUES ('164', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105,106\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:58:02');
INSERT INTO `sys_oper_log` VALUES ('165', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105,106\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 21:58:38');
INSERT INTO `sys_oper_log` VALUES ('166', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105,106\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:01:46');
INSERT INTO `sys_oper_log` VALUES ('167', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105,106\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:02:09');
INSERT INTO `sys_oper_log` VALUES ('168', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,102,109\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:07:31');
INSERT INTO `sys_oper_log` VALUES ('169', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105,106,102,109\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:09:59');
INSERT INTO `sys_oper_log` VALUES ('170', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"4\" ],\r\n  \"roleName\" : [ \"主管\" ],\r\n  \"roleKey\" : [ \"mainManager\" ],\r\n  \"dataScope\" : [ \"3\" ],\r\n  \"deptIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:10:44');
INSERT INTO `sys_oper_log` VALUES ('171', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"4\" ],\r\n  \"roleName\" : [ \"主管\" ],\r\n  \"roleKey\" : [ \"mainManager\" ],\r\n  \"dataScope\" : [ \"4\" ],\r\n  \"deptIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:11:27');
INSERT INTO `sys_oper_log` VALUES ('172', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"4\" ],\r\n  \"roleName\" : [ \"主管\" ],\r\n  \"roleKey\" : [ \"mainManager\" ],\r\n  \"dataScope\" : [ \"1\" ],\r\n  \"deptIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:29:10');
INSERT INTO `sys_oper_log` VALUES ('173', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"4\" ],\r\n  \"roleName\" : [ \"主管\" ],\r\n  \"roleKey\" : [ \"mainManager\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:32:59');
INSERT INTO `sys_oper_log` VALUES ('174', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105,106\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:33:15');
INSERT INTO `sys_oper_log` VALUES ('175', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"4\" ],\r\n  \"roleName\" : [ \"主管\" ],\r\n  \"roleKey\" : [ \"mainManager\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,103\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:33:37');
INSERT INTO `sys_oper_log` VALUES ('176', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"4\" ],\r\n  \"roleName\" : [ \"主管\" ],\r\n  \"roleKey\" : [ \"mainManager\" ],\r\n  \"dataScope\" : [ \"2\" ],\r\n  \"deptIds\" : [ \"100,101,105\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:34:28');
INSERT INTO `sys_oper_log` VALUES ('177', '部门管理', '1', 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"105\" ],\r\n  \"deptName\" : [ \"测试一组\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:35:41');
INSERT INTO `sys_oper_log` VALUES ('178', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\r\n  \"roleName\" : [ \"测试组员\" ],\r\n  \"roleKey\" : [ \"zy\" ],\r\n  \"roleSort\" : [ \"5\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"menuIds\" : [ \"2006,2007,2008,2009,2010,2011,2012\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:37:05');
INSERT INTO `sys_oper_log` VALUES ('179', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"5\" ],\r\n  \"roleName\" : [ \"测试组员\" ],\r\n  \"roleKey\" : [ \"zy\" ],\r\n  \"dataScope\" : [ \"3\" ],\r\n  \"deptIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:37:14');
INSERT INTO `sys_oper_log` VALUES ('180', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"110\" ],\r\n  \"userName\" : [ \"测试组员\" ],\r\n  \"deptName\" : [ \"测试一组\" ],\r\n  \"phonenumber\" : [ \"13313090599\" ],\r\n  \"email\" : [ \"798224075@qq.com\" ],\r\n  \"loginName\" : [ \"testzy\" ],\r\n  \"password\" : [ \"admin123\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"5\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"5\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:37:54');
INSERT INTO `sys_oper_log` VALUES ('181', '人员', '1', 'com.ruoyi.moudels.test.controller.PersonController.addSave()', 'POST', '1', 'testzy', '测试一组', '/test/person/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"测试组员数据\" ],\r\n  \"age\" : [ \"23\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"job\" : [ \"0\" ],\r\n  \"jobDate\" : [ \"2019-12-11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:38:26');
INSERT INTO `sys_oper_log` VALUES ('182', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"3\" ],\r\n  \"roleName\" : [ \"测试人员\" ],\r\n  \"roleKey\" : [ \"testMan\" ],\r\n  \"dataScope\" : [ \"4\" ],\r\n  \"deptIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:38:59');
INSERT INTO `sys_oper_log` VALUES ('183', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"4\" ],\r\n  \"roleName\" : [ \"主管\" ],\r\n  \"roleKey\" : [ \"mainManager\" ],\r\n  \"dataScope\" : [ \"4\" ],\r\n  \"deptIds\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-02 22:49:07');
INSERT INTO `sys_oper_log` VALUES ('184', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"sys_file\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 15:52:29');
INSERT INTO `sys_oper_log` VALUES ('185', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"5\" ],\r\n  \"tableName\" : [ \"sys_file\" ],\r\n  \"tableComment\" : [ \"文件表\" ],\r\n  \"className\" : [ \"SysFile\" ],\r\n  \"functionAuthor\" : [ \"yuanxy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"51\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"文件id\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"52\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"文件名\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"fileName\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"53\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"文件大小\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"fileSize\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"54\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"mime类型（用于下载的时候指定文件类型）\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"mimeType\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].htmlType\" : [ \"select\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" : [ \"55\" ],\r\n  \"columns[4].sort\" : [ \"5\" ],\r\n  \"columns[4].columnComment\" : [ \"创建人\" ],\r\n  \"columns[4].javaType\" : [ \"String\" ],\r\n  \"columns[4].javaField\" : [ \"', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 15:56:52');
INSERT INTO `sys_oper_log` VALUES ('186', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/sys_file', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 15:57:58');
INSERT INTO `sys_oper_log` VALUES ('187', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"文件管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"fa fa-folder-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 17:49:34');
INSERT INTO `sys_oper_log` VALUES ('188', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2025\" ],\r\n  \"parentId\" : [ \"2031\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"文件管理\" ],\r\n  \"url\" : [ \"/system/file\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:file:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 17:49:57');
INSERT INTO `sys_oper_log` VALUES ('189', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2031\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"文件管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-folder-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 17:50:05');
INSERT INTO `sys_oper_log` VALUES ('190', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2006\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"开发模块\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"fa fa-code-fork\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 17:50:10');
INSERT INTO `sys_oper_log` VALUES ('191', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"sys_img\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 17:50:22');
INSERT INTO `sys_oper_log` VALUES ('192', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  \"tableId\" : [ \"6\" ],\r\n  \"tableName\" : [ \"sys_img\" ],\r\n  \"tableComment\" : [ \"轮播图片表\" ],\r\n  \"className\" : [ \"SysImg\" ],\r\n  \"functionAuthor\" : [ \"yuanxy\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"61\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"id\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"id\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"62\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"图片名称\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"imgName\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"LIKE\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"63\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"图片路径\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"imgUrl\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"64\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"图片序号\" ],\r\n  \"columns[3].javaType\" : [ \"Integer\" ],\r\n  \"columns[3].javaField\" : [ \"imgOrder\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" : [ \"65\" ],\r\n  \"columns[4].sort\" : [ \"5\" ],\r\n  \"columns[4].columnComment\" : [ \"是否显示\" ],\r\n  \"columns[4].javaType\" : [ \"String\" ],\r\n  \"columns[4].javaField\" : [ \"isDisplay\" ],\r\n  \"columns[4].isInsert\" : [ \"1\" ],\r\n  \"columns[4].isEdit\" : [ \"1\" ],\r\n  \"columns[4].isList\" : [ \"1\" ],\r\n  \"columns[4].isQuery\" : [ \"1\" ],\r\n', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 17:53:11');
INSERT INTO `sys_oper_log` VALUES ('193', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/genCode/sys_img', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 17:53:32');
INSERT INTO `sys_oper_log` VALUES ('194', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2032\" ],\r\n  \"parentId\" : [ \"2031\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"图片管理\" ],\r\n  \"url\" : [ \"/system/img\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:img:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 18:02:52');
INSERT INTO `sys_oper_log` VALUES ('195', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:33:56');
INSERT INTO `sys_oper_log` VALUES ('196', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:35:24');
INSERT INTO `sys_oper_log` VALUES ('197', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:36:53');
INSERT INTO `sys_oper_log` VALUES ('198', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:37:54');
INSERT INTO `sys_oper_log` VALUES ('199', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:39:14');
INSERT INTO `sys_oper_log` VALUES ('200', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:39:51');
INSERT INTO `sys_oper_log` VALUES ('201', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:42:12');
INSERT INTO `sys_oper_log` VALUES ('202', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:42:54');
INSERT INTO `sys_oper_log` VALUES ('203', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:47:23');
INSERT INTO `sys_oper_log` VALUES ('204', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:50:53');
INSERT INTO `sys_oper_log` VALUES ('205', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:53:53');
INSERT INTO `sys_oper_log` VALUES ('206', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 18:56:45');
INSERT INTO `sys_oper_log` VALUES ('207', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 19:02:49');
INSERT INTO `sys_oper_log` VALUES ('208', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 19:07:42');
INSERT INTO `sys_oper_log` VALUES ('209', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201820295637360641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 19:09:45');
INSERT INTO `sys_oper_log` VALUES ('210', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201820295637360641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 19:12:19');
INSERT INTO `sys_oper_log` VALUES ('211', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201820295637360641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 19:16:21');
INSERT INTO `sys_oper_log` VALUES ('212', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"2\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-03 19:19:27');
INSERT INTO `sys_oper_log` VALUES ('213', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201820299248656386\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 21:56:07');
INSERT INTO `sys_oper_log` VALUES ('214', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201820295637360641\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 21:56:14');
INSERT INTO `sys_oper_log` VALUES ('215', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 21:58:21');
INSERT INTO `sys_oper_log` VALUES ('216', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 21:59:35');
INSERT INTO `sys_oper_log` VALUES ('217', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:06:41');
INSERT INTO `sys_oper_log` VALUES ('218', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:07:36');
INSERT INTO `sys_oper_log` VALUES ('219', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:08:38');
INSERT INTO `sys_oper_log` VALUES ('220', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:09:20');
INSERT INTO `sys_oper_log` VALUES ('221', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:09:48');
INSERT INTO `sys_oper_log` VALUES ('222', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:10:37');
INSERT INTO `sys_oper_log` VALUES ('223', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:15:02');
INSERT INTO `sys_oper_log` VALUES ('224', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:15:20');
INSERT INTO `sys_oper_log` VALUES ('225', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:16:52');
INSERT INTO `sys_oper_log` VALUES ('226', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:17:16');
INSERT INTO `sys_oper_log` VALUES ('227', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:17:27');
INSERT INTO `sys_oper_log` VALUES ('228', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:17:58');
INSERT INTO `sys_oper_log` VALUES ('229', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:18:24');
INSERT INTO `sys_oper_log` VALUES ('230', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1201863234723885058', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-03 22:18:36');
INSERT INTO `sys_oper_log` VALUES ('231', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201863234723885058\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 22:19:10');
INSERT INTO `sys_oper_log` VALUES ('232', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201863241791287297\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:21:26');
INSERT INTO `sys_oper_log` VALUES ('233', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:27:17');
INSERT INTO `sys_oper_log` VALUES ('234', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:27:17');
INSERT INTO `sys_oper_log` VALUES ('235', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201870526840147969\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:27:46');
INSERT INTO `sys_oper_log` VALUES ('236', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201870507483435009\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 22:28:24');
INSERT INTO `sys_oper_log` VALUES ('237', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201870492534935553\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 22:42:29');
INSERT INTO `sys_oper_log` VALUES ('238', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201870507483435009\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 22:42:56');
INSERT INTO `sys_oper_log` VALUES ('239', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201870507483435009\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:44:27');
INSERT INTO `sys_oper_log` VALUES ('240', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201870492534935553\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:44:45');
INSERT INTO `sys_oper_log` VALUES ('241', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201870526756261890\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:45:15');
INSERT INTO `sys_oper_log` VALUES ('242', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:45:22');
INSERT INTO `sys_oper_log` VALUES ('243', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201875073159499778\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:45:42');
INSERT INTO `sys_oper_log` VALUES ('244', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201875074916913153\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:48:09');
INSERT INTO `sys_oper_log` VALUES ('245', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:48:16');
INSERT INTO `sys_oper_log` VALUES ('246', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201875805396885506\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 22:48:26');
INSERT INTO `sys_oper_log` VALUES ('247', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201875805396885506\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 22:49:58');
INSERT INTO `sys_oper_log` VALUES ('248', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201875805396885506\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 22:50:25');
INSERT INTO `sys_oper_log` VALUES ('249', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201875805396885506\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:52:18');
INSERT INTO `sys_oper_log` VALUES ('250', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201875806214774786\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:52:40');
INSERT INTO `sys_oper_log` VALUES ('251', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:54:24');
INSERT INTO `sys_oper_log` VALUES ('252', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201877343175516162\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 22:54:36');
INSERT INTO `sys_oper_log` VALUES ('253', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201877343175516162\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:56:22');
INSERT INTO `sys_oper_log` VALUES ('254', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201877349022375937\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 22:56:34');
INSERT INTO `sys_oper_log` VALUES ('255', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 23:22:39');
INSERT INTO `sys_oper_log` VALUES ('256', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201884457654558722\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 23:22:44');
INSERT INTO `sys_oper_log` VALUES ('257', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201884457654558722\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 23:24:01');
INSERT INTO `sys_oper_log` VALUES ('258', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-03 23:38:57');
INSERT INTO `sys_oper_log` VALUES ('259', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1201888484710756353\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-03 23:41:43');
INSERT INTO `sys_oper_log` VALUES ('260', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 13:39:12');
INSERT INTO `sys_oper_log` VALUES ('261', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"2\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"文件扩展名无效\",\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-04 13:39:54');
INSERT INTO `sys_oper_log` VALUES ('262', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"2\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 13:40:45');
INSERT INTO `sys_oper_log` VALUES ('263', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202100011628339201,1202100405465096193\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 13:41:23');
INSERT INTO `sys_oper_log` VALUES ('264', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202100015424184321,1202100407130234881\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 13:41:35');
INSERT INTO `sys_oper_log` VALUES ('265', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 14:19:58');
INSERT INTO `sys_oper_log` VALUES ('266', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"2\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 14:20:07');
INSERT INTO `sys_oper_log` VALUES ('267', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202110274201014274,1202110310586601474\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 14:20:13');
INSERT INTO `sys_oper_log` VALUES ('268', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202110277162192897,1202110312541147138\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 14:20:21');
INSERT INTO `sys_oper_log` VALUES ('269', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件上传过程中出现异常，上传失败！', '2019-12-04 14:40:30');
INSERT INTO `sys_oper_log` VALUES ('270', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 14:41:22');
INSERT INTO `sys_oper_log` VALUES ('271', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"2\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 14:41:38');
INSERT INTO `sys_oper_log` VALUES ('272', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202115638019575809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 14:41:42');
INSERT INTO `sys_oper_log` VALUES ('273', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202115638019575809,1202115726125125634\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 14:42:08');
INSERT INTO `sys_oper_log` VALUES ('274', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202115662866632705,1202115728171945986\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 14:42:13');
INSERT INTO `sys_oper_log` VALUES ('275', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:10:48');
INSERT INTO `sys_oper_log` VALUES ('276', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202123061136568322', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 15:11:06');
INSERT INTO `sys_oper_log` VALUES ('277', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202123061136568322\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:11:15');
INSERT INTO `sys_oper_log` VALUES ('278', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202123067901980674\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:13:04');
INSERT INTO `sys_oper_log` VALUES ('279', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:13:11');
INSERT INTO `sys_oper_log` VALUES ('280', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202123667377000450\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:13:15');
INSERT INTO `sys_oper_log` VALUES ('281', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202123662570328066', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 15:13:16');
INSERT INTO `sys_oper_log` VALUES ('282', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202123662570328066\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:13:26');
INSERT INTO `sys_oper_log` VALUES ('283', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:48:51');
INSERT INTO `sys_oper_log` VALUES ('284', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:49:00');
INSERT INTO `sys_oper_log` VALUES ('285', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202132640520040449', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 15:49:05');
INSERT INTO `sys_oper_log` VALUES ('286', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202132680835690497', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 15:49:06');
INSERT INTO `sys_oper_log` VALUES ('287', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202132640520040449,1202132680835690497\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:49:51');
INSERT INTO `sys_oper_log` VALUES ('288', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202132643888066561,1202132682593103873\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:51:25');
INSERT INTO `sys_oper_log` VALUES ('289', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:51:33');
INSERT INTO `sys_oper_log` VALUES ('290', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:51:41');
INSERT INTO `sys_oper_log` VALUES ('291', '文件', '3', 'com.ruoyi.web.controller.system.SysFileController.remove()', 'POST', '1', 'admin', '研发部门', '/system/file/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202133318537584641\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 15:51:48');
INSERT INTO `sys_oper_log` VALUES ('292', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133318537584641', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-04 15:59:51');
INSERT INTO `sys_oper_log` VALUES ('293', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-04 15:59:53');
INSERT INTO `sys_oper_log` VALUES ('294', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133318537584641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:00:46');
INSERT INTO `sys_oper_log` VALUES ('295', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:00:55');
INSERT INTO `sys_oper_log` VALUES ('296', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:02:11');
INSERT INTO `sys_oper_log` VALUES ('297', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:02:30');
INSERT INTO `sys_oper_log` VALUES ('298', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:04:31');
INSERT INTO `sys_oper_log` VALUES ('299', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:17:00');
INSERT INTO `sys_oper_log` VALUES ('300', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:25:17');
INSERT INTO `sys_oper_log` VALUES ('301', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:25:38');
INSERT INTO `sys_oper_log` VALUES ('302', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:36:48');
INSERT INTO `sys_oper_log` VALUES ('303', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:37:46');
INSERT INTO `sys_oper_log` VALUES ('304', '轮播图片', '2', 'com.ruoyi.web.controller.system.SysImgController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/img/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1202133358450581506\" ],\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"文件扩展名无效\",\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-04 16:37:49');
INSERT INTO `sys_oper_log` VALUES ('305', '轮播图片', '2', 'com.ruoyi.web.controller.system.SysImgController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/img/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1202133358450581506\" ],\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"文件扩展名无效\",\r\n  \"code\" : 500\r\n}', '0', null, '2019-12-04 16:42:20');
INSERT INTO `sys_oper_log` VALUES ('306', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133318537584641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:57:35');
INSERT INTO `sys_oper_log` VALUES ('307', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:57:35');
INSERT INTO `sys_oper_log` VALUES ('308', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082700', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:57:41');
INSERT INTO `sys_oper_log` VALUES ('309', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:58:23');
INSERT INTO `sys_oper_log` VALUES ('310', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:58:32');
INSERT INTO `sys_oper_log` VALUES ('311', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133318537584641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:59:28');
INSERT INTO `sys_oper_log` VALUES ('312', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:59:29');
INSERT INTO `sys_oper_log` VALUES ('313', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082700', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:59:37');
INSERT INTO `sys_oper_log` VALUES ('314', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 16:59:55');
INSERT INTO `sys_oper_log` VALUES ('315', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133318537584641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:01:24');
INSERT INTO `sys_oper_log` VALUES ('316', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:01:25');
INSERT INTO `sys_oper_log` VALUES ('317', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:01:26');
INSERT INTO `sys_oper_log` VALUES ('318', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082700', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:02:39');
INSERT INTO `sys_oper_log` VALUES ('319', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133318537584641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:02:57');
INSERT INTO `sys_oper_log` VALUES ('320', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:02:58');
INSERT INTO `sys_oper_log` VALUES ('321', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:02:59');
INSERT INTO `sys_oper_log` VALUES ('322', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:07:27');
INSERT INTO `sys_oper_log` VALUES ('323', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133318537584641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:08:14');
INSERT INTO `sys_oper_log` VALUES ('324', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:08:15');
INSERT INTO `sys_oper_log` VALUES ('325', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2025\" ],\r\n  \"parentId\" : [ \"2031\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"文件列表\" ],\r\n  \"url\" : [ \"/system/file\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:file:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 17:31:30');
INSERT INTO `sys_oper_log` VALUES ('326', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133318537584641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:31:42');
INSERT INTO `sys_oper_log` VALUES ('327', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:31:43');
INSERT INTO `sys_oper_log` VALUES ('328', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:31:44');
INSERT INTO `sys_oper_log` VALUES ('329', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202133321880444930\" ]\r\n}', 'null', '1', '', '2019-12-04 17:31:45');
INSERT INTO `sys_oper_log` VALUES ('330', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202133358450581506\" ]\r\n}', 'null', '1', '', '2019-12-04 17:32:29');
INSERT INTO `sys_oper_log` VALUES ('331', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202133358450581506\" ]\r\n}', 'null', '1', '', '2019-12-04 17:33:17');
INSERT INTO `sys_oper_log` VALUES ('332', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133318537584641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:50:30');
INSERT INTO `sys_oper_log` VALUES ('333', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:50:30');
INSERT INTO `sys_oper_log` VALUES ('334', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133356756082690', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:50:32');
INSERT INTO `sys_oper_log` VALUES ('335', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202133358450581506\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 17:50:35');
INSERT INTO `sys_oper_log` VALUES ('336', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202133318537584641', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 17:50:35');
INSERT INTO `sys_oper_log` VALUES ('337', '轮播图片', '3', 'com.ruoyi.web.controller.system.SysImgController.remove()', 'POST', '1', 'admin', '研发部门', '/system/img/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1202133321880444930\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-04 17:50:53');
INSERT INTO `sys_oper_log` VALUES ('338', '参数管理', '1', 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"首页轮播图间隔时间\" ],\r\n  \"configKey\" : [ \"sys.switch.interval\" ],\r\n  \"configValue\" : [ \"3500\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"首页轮播图间隔时间\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 18:20:01');
INSERT INTO `sys_oper_log` VALUES ('339', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 18:20:46');
INSERT INTO `sys_oper_log` VALUES ('340', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 18:20:46');
INSERT INTO `sys_oper_log` VALUES ('341', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 18:20:51');
INSERT INTO `sys_oper_log` VALUES ('342', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"2\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 18:21:29');
INSERT INTO `sys_oper_log` VALUES ('343', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 18:21:29');
INSERT INTO `sys_oper_log` VALUES ('344', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 18:21:30');
INSERT INTO `sys_oper_log` VALUES ('345', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 18:24:21');
INSERT INTO `sys_oper_log` VALUES ('346', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 18:24:21');
INSERT INTO `sys_oper_log` VALUES ('347', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 18:26:27');
INSERT INTO `sys_oper_log` VALUES ('348', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 18:26:27');
INSERT INTO `sys_oper_log` VALUES ('349', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-04 19:45:25');
INSERT INTO `sys_oper_log` VALUES ('350', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-04 19:45:25');
INSERT INTO `sys_oper_log` VALUES ('351', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 19:46:16');
INSERT INTO `sys_oper_log` VALUES ('352', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 19:46:16');
INSERT INTO `sys_oper_log` VALUES ('353', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 19:47:49');
INSERT INTO `sys_oper_log` VALUES ('354', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 19:47:50');
INSERT INTO `sys_oper_log` VALUES ('355', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 19:48:06');
INSERT INTO `sys_oper_log` VALUES ('356', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 19:48:06');
INSERT INTO `sys_oper_log` VALUES ('357', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 19:50:56');
INSERT INTO `sys_oper_log` VALUES ('358', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 19:50:57');
INSERT INTO `sys_oper_log` VALUES ('359', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 19:51:08');
INSERT INTO `sys_oper_log` VALUES ('360', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 19:51:09');
INSERT INTO `sys_oper_log` VALUES ('361', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 19:51:14');
INSERT INTO `sys_oper_log` VALUES ('362', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:01:45');
INSERT INTO `sys_oper_log` VALUES ('363', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:01:45');
INSERT INTO `sys_oper_log` VALUES ('364', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:01:56');
INSERT INTO `sys_oper_log` VALUES ('365', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:01:57');
INSERT INTO `sys_oper_log` VALUES ('366', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:02:05');
INSERT INTO `sys_oper_log` VALUES ('367', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:02:05');
INSERT INTO `sys_oper_log` VALUES ('368', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:05:34');
INSERT INTO `sys_oper_log` VALUES ('369', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:05:34');
INSERT INTO `sys_oper_log` VALUES ('370', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:06:08');
INSERT INTO `sys_oper_log` VALUES ('371', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:06:10');
INSERT INTO `sys_oper_log` VALUES ('372', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:09:31');
INSERT INTO `sys_oper_log` VALUES ('373', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:09:31');
INSERT INTO `sys_oper_log` VALUES ('374', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:09:41');
INSERT INTO `sys_oper_log` VALUES ('375', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:09:41');
INSERT INTO `sys_oper_log` VALUES ('376', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:09:49');
INSERT INTO `sys_oper_log` VALUES ('377', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:09:49');
INSERT INTO `sys_oper_log` VALUES ('378', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:09:59');
INSERT INTO `sys_oper_log` VALUES ('379', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:09:59');
INSERT INTO `sys_oper_log` VALUES ('380', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:40:46');
INSERT INTO `sys_oper_log` VALUES ('381', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:40:46');
INSERT INTO `sys_oper_log` VALUES ('382', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:44:13');
INSERT INTO `sys_oper_log` VALUES ('383', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:44:13');
INSERT INTO `sys_oper_log` VALUES ('384', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:45:28');
INSERT INTO `sys_oper_log` VALUES ('385', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:45:28');
INSERT INTO `sys_oper_log` VALUES ('386', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:45:54');
INSERT INTO `sys_oper_log` VALUES ('387', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:45:54');
INSERT INTO `sys_oper_log` VALUES ('388', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:46:32');
INSERT INTO `sys_oper_log` VALUES ('389', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:46:33');
INSERT INTO `sys_oper_log` VALUES ('390', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:56:39');
INSERT INTO `sys_oper_log` VALUES ('391', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 20:56:40');
INSERT INTO `sys_oper_log` VALUES ('392', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:03:51');
INSERT INTO `sys_oper_log` VALUES ('393', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:03:51');
INSERT INTO `sys_oper_log` VALUES ('394', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:05:08');
INSERT INTO `sys_oper_log` VALUES ('395', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:05:08');
INSERT INTO `sys_oper_log` VALUES ('396', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:09:05');
INSERT INTO `sys_oper_log` VALUES ('397', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:09:05');
INSERT INTO `sys_oper_log` VALUES ('398', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:09:19');
INSERT INTO `sys_oper_log` VALUES ('399', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:09:21');
INSERT INTO `sys_oper_log` VALUES ('400', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:09:21');
INSERT INTO `sys_oper_log` VALUES ('401', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:09:21');
INSERT INTO `sys_oper_log` VALUES ('402', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:10:59');
INSERT INTO `sys_oper_log` VALUES ('403', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:11:01');
INSERT INTO `sys_oper_log` VALUES ('404', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:11:01');
INSERT INTO `sys_oper_log` VALUES ('405', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:11:02');
INSERT INTO `sys_oper_log` VALUES ('406', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:11:31');
INSERT INTO `sys_oper_log` VALUES ('407', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:11:37');
INSERT INTO `sys_oper_log` VALUES ('408', '轮播图片', '2', 'com.ruoyi.web.controller.system.SysImgController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/img/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1202170872989331458\" ],\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-04 21:12:24');
INSERT INTO `sys_oper_log` VALUES ('409', '轮播图片', '2', 'com.ruoyi.web.controller.system.SysImgController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/img/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1202170872989331458\" ],\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-04 21:13:47');
INSERT INTO `sys_oper_log` VALUES ('410', '轮播图片', '2', 'com.ruoyi.web.controller.system.SysImgController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/img/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1202170872989331458\" ],\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', 'null', '1', '文件删除过程中出现异常，删除失败！', '2019-12-04 21:14:05');
INSERT INTO `sys_oper_log` VALUES ('411', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:17:59');
INSERT INTO `sys_oper_log` VALUES ('412', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:18:00');
INSERT INTO `sys_oper_log` VALUES ('413', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:18:23');
INSERT INTO `sys_oper_log` VALUES ('414', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:18:24');
INSERT INTO `sys_oper_log` VALUES ('415', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202170869793271809', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:18:27');
INSERT INTO `sys_oper_log` VALUES ('416', '轮播图片', '2', 'com.ruoyi.web.controller.system.SysImgController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/img/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1202170872989331458\" ],\r\n  \"fileId\" : [ \"1202170869793271809\" ],\r\n  \"imgOrder\" : [ \"1\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 21:18:37');
INSERT INTO `sys_oper_log` VALUES ('417', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:18:37');
INSERT INTO `sys_oper_log` VALUES ('418', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:19:15');
INSERT INTO `sys_oper_log` VALUES ('419', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:19:15');
INSERT INTO `sys_oper_log` VALUES ('420', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:19:16');
INSERT INTO `sys_oper_log` VALUES ('421', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:19:16');
INSERT INTO `sys_oper_log` VALUES ('422', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"4\" ],\r\n  \"configName\" : [ \"首页轮播图间隔时间\" ],\r\n  \"configKey\" : [ \"sys.switch.interval\" ],\r\n  \"configValue\" : [ \"5000\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"首页轮播图间隔时间\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 21:19:54');
INSERT INTO `sys_oper_log` VALUES ('423', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"4\" ],\r\n  \"configName\" : [ \"首页轮播图间隔时间\" ],\r\n  \"configKey\" : [ \"sys.switch.interval\" ],\r\n  \"configValue\" : [ \"5000\" ],\r\n  \"configType\" : [ \"N\" ],\r\n  \"remark\" : [ \"首页轮播图间隔时间\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 21:20:01');
INSERT INTO `sys_oper_log` VALUES ('424', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:23:05');
INSERT INTO `sys_oper_log` VALUES ('425', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-04 21:29:20');
INSERT INTO `sys_oper_log` VALUES ('426', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-04 21:29:28');
INSERT INTO `sys_oper_log` VALUES ('427', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-04 21:29:28');
INSERT INTO `sys_oper_log` VALUES ('428', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-04 21:29:41');
INSERT INTO `sys_oper_log` VALUES ('429', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-04 21:29:49');
INSERT INTO `sys_oper_log` VALUES ('430', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:30:51');
INSERT INTO `sys_oper_log` VALUES ('431', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:30:52');
INSERT INTO `sys_oper_log` VALUES ('432', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202171055408001026', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:30:54');
INSERT INTO `sys_oper_log` VALUES ('433', '轮播图片', '2', 'com.ruoyi.web.controller.system.SysImgController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/img/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1202171055793876993\" ],\r\n  \"fileId\" : [ \"1202171055408001026\" ],\r\n  \"imgOrder\" : [ \"2\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 21:31:13');
INSERT INTO `sys_oper_log` VALUES ('434', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:31:13');
INSERT INTO `sys_oper_log` VALUES ('435', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:31:17');
INSERT INTO `sys_oper_log` VALUES ('436', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:31:17');
INSERT INTO `sys_oper_log` VALUES ('437', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:31:55');
INSERT INTO `sys_oper_log` VALUES ('438', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:31:55');
INSERT INTO `sys_oper_log` VALUES ('439', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:38:54');
INSERT INTO `sys_oper_log` VALUES ('440', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:38:54');
INSERT INTO `sys_oper_log` VALUES ('441', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:38:55');
INSERT INTO `sys_oper_log` VALUES ('442', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:38:55');
INSERT INTO `sys_oper_log` VALUES ('443', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:39:04');
INSERT INTO `sys_oper_log` VALUES ('444', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:54:34');
INSERT INTO `sys_oper_log` VALUES ('445', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 21:54:34');
INSERT INTO `sys_oper_log` VALUES ('446', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 21:55:04');
INSERT INTO `sys_oper_log` VALUES ('447', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"3\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"测试人员\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"13313090592\" ],\r\n  \"email\" : [ \"798224073@qq.com\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"3\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"3\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 22:16:12');
INSERT INTO `sys_oper_log` VALUES ('448', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"phonenumber\" : [ \"13313090597\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"sex\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 22:16:41');
INSERT INTO `sys_oper_log` VALUES ('449', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"3\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"测试人员\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"13313090592\" ],\r\n  \"email\" : [ \"798224023@qq.com\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"3\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"3\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 22:16:52');
INSERT INTO `sys_oper_log` VALUES ('450', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"phonenumber\" : [ \"13313090597\" ],\r\n  \"email\" : [ \"798224073@qq.com\" ],\r\n  \"sex\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 22:17:03');
INSERT INTO `sys_oper_log` VALUES ('451', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 22:17:06');
INSERT INTO `sys_oper_log` VALUES ('452', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 22:17:06');
INSERT INTO `sys_oper_log` VALUES ('453', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 22:17:25');
INSERT INTO `sys_oper_log` VALUES ('454', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 22:17:26');
INSERT INTO `sys_oper_log` VALUES ('455', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"居里先生\" ],\r\n  \"phonenumber\" : [ \"13313090597\" ],\r\n  \"email\" : [ \"798224073@qq.com\" ],\r\n  \"sex\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-04 22:17:32');
INSERT INTO `sys_oper_log` VALUES ('456', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 22:17:33');
INSERT INTO `sys_oper_log` VALUES ('457', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-04 22:17:33');
INSERT INTO `sys_oper_log` VALUES ('458', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:04:31');
INSERT INTO `sys_oper_log` VALUES ('459', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:04:31');
INSERT INTO `sys_oper_log` VALUES ('460', '定时任务', '1', 'com.ruoyi.quartz.controller.SysJobController.addSave()', 'POST', '1', 'admin', '研发部门', '/monitor/job/add', '127.0.0.1', '内网IP', '{\r\n  \"createBy\" : [ \"admin\" ],\r\n  \"jobName\" : [ \"Jackrabbit GC\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ],\r\n  \"invokeTarget\" : [ \"1223\" ],\r\n  \"cronExpression\" : [ \"0/10 * * * * ?\" ],\r\n  \"misfirePolicy\" : [ \"1\" ],\r\n  \"concurrent\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"调用Jackrabbit GC垃圾回收器，清理storedata区域垃圾文件，调用前需要关闭Jackrabbit服务\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 12:10:14');
INSERT INTO `sys_oper_log` VALUES ('461', '定时任务', '2', 'com.ruoyi.quartz.controller.SysJobController.editSave()', 'POST', '1', 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"4\" ],\r\n  \"updateBy\" : [ \"admin\" ],\r\n  \"jobName\" : [ \"Jackrabbit GC\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ],\r\n  \"invokeTarget\" : [ \"trTask.jackrabbitGC(C:\\\\Codding\\\\Apache\\\\JackRabbit\\\\JackRabbit-2.18.4-tomcat-7.0.91\\\\jackrabbit)\" ],\r\n  \"cronExpression\" : [ \"0/10 * * * * ?\" ],\r\n  \"misfirePolicy\" : [ \"1\" ],\r\n  \"concurrent\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ],\r\n  \"remark\" : [ \"调用Jackrabbit GC垃圾回收器，清理storedata区域垃圾文件，调用前需要关闭Jackrabbit服务\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 12:14:38');
INSERT INTO `sys_oper_log` VALUES ('462', '定时任务', '2', 'com.ruoyi.quartz.controller.SysJobController.editSave()', 'POST', '1', 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"4\" ],\r\n  \"updateBy\" : [ \"admin\" ],\r\n  \"jobName\" : [ \"Jackrabbit GC\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ],\r\n  \"invokeTarget\" : [ \"trTask.jackrabbitGC(\'C:\\\\Codding\\\\Apache\\\\JackRabbit\\\\JackRabbit-2.18.4-tomcat-7.0.91\\\\jackrabbit\')\" ],\r\n  \"cronExpression\" : [ \"0/10 * * * * ?\" ],\r\n  \"misfirePolicy\" : [ \"1\" ],\r\n  \"concurrent\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ],\r\n  \"remark\" : [ \"调用Jackrabbit GC垃圾回收器，清理storedata区域垃圾文件，调用前需要关闭Jackrabbit服务\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 12:14:58');
INSERT INTO `sys_oper_log` VALUES ('463', '定时任务', '2', 'com.ruoyi.quartz.controller.SysJobController.editSave()', 'POST', '1', 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"4\" ],\r\n  \"updateBy\" : [ \"admin\" ],\r\n  \"jobName\" : [ \"Jackrabbit GC\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ],\r\n  \"invokeTarget\" : [ \"ryTask.jackrabbitGC(\'C:\\\\Codding\\\\Apache\\\\JackRabbit\\\\JackRabbit-2.18.4-tomcat-7.0.91\\\\jackrabbit\')\" ],\r\n  \"cronExpression\" : [ \"0/10 * * * * ?\" ],\r\n  \"misfirePolicy\" : [ \"1\" ],\r\n  \"concurrent\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ],\r\n  \"remark\" : [ \"调用Jackrabbit GC垃圾回收器，清理storedata区域垃圾文件，调用前需要关闭Jackrabbit服务\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 12:15:09');
INSERT INTO `sys_oper_log` VALUES ('464', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:16:14');
INSERT INTO `sys_oper_log` VALUES ('465', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:16:14');
INSERT INTO `sys_oper_log` VALUES ('466', '定时任务', '2', 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', '1', 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"4\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 12:16:27');
INSERT INTO `sys_oper_log` VALUES ('467', '定时任务', '2', 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', '1', 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"4\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 12:16:45');
INSERT INTO `sys_oper_log` VALUES ('468', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:21:52');
INSERT INTO `sys_oper_log` VALUES ('469', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:21:52');
INSERT INTO `sys_oper_log` VALUES ('470', '轮播图片', '1', 'com.ruoyi.web.controller.system.SysImgController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/img/add', '127.0.0.1', '内网IP', '{\r\n  \"imgOrder\" : [ \"2\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 12:22:11');
INSERT INTO `sys_oper_log` VALUES ('471', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202443020378685441', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:22:12');
INSERT INTO `sys_oper_log` VALUES ('472', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:22:14');
INSERT INTO `sys_oper_log` VALUES ('473', '轮播图片', '2', 'com.ruoyi.web.controller.system.SysImgController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/img/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1202171055793876993\" ],\r\n  \"fileId\" : [ \"1202218801623568385\" ],\r\n  \"imgOrder\" : [ \"3\" ],\r\n  \"isDisplay\" : [ \"Y\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-05 12:22:16');
INSERT INTO `sys_oper_log` VALUES ('474', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:22:16');
INSERT INTO `sys_oper_log` VALUES ('475', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:22:27');
INSERT INTO `sys_oper_log` VALUES ('476', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202443020378685441', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:22:27');
INSERT INTO `sys_oper_log` VALUES ('477', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '0', null, '2019-12-05 12:22:27');
INSERT INTO `sys_oper_log` VALUES ('478', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202215630591332354', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-16 18:14:45');
INSERT INTO `sys_oper_log` VALUES ('479', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202443020378685441', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-16 18:14:45');
INSERT INTO `sys_oper_log` VALUES ('480', '文件', '0', 'com.ruoyi.web.controller.system.SysFileController.download()', 'GET', '1', 'admin', '研发部门', '/system/file/download/1202218801623568385', '127.0.0.1', '内网IP', '{ }', 'null', '1', '', '2019-12-16 18:14:45');
INSERT INTO `sys_oper_log` VALUES ('481', '人员', '1', 'com.ruoyi.moudels.test.controller.PersonController.addSave()', 'POST', '1', 'admin', '研发部门', '/test/person/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"123\" ],\r\n  \"age\" : [ \"31\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"job\" : [ \"0\" ],\r\n  \"jobDate\" : [ \"2019-11-28\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-16 18:15:22');
INSERT INTO `sys_oper_log` VALUES ('482', '人员', '3', 'com.ruoyi.moudels.test.controller.PersonController.remove()', 'POST', '1', 'admin', '研发部门', '/test/person/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1206518168211693570\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2019-12-16 18:15:24');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-02 22:33:15', '普通角色');
INSERT INTO `sys_role` VALUES ('3', '测试人员', 'testMan', '3', '4', '0', '0', 'admin', '2019-12-02 21:29:26', 'admin', '2019-12-02 22:38:59', null);
INSERT INTO `sys_role` VALUES ('4', '主管', 'mainManager', '4', '4', '0', '0', 'admin', '2019-12-02 21:30:54', 'admin', '2019-12-02 22:49:07', null);
INSERT INTO `sys_role` VALUES ('5', '测试组员', 'zy', '5', '3', '0', '0', 'admin', '2019-12-02 22:37:05', 'admin', '2019-12-02 22:37:14', null);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');
INSERT INTO `sys_role_dept` VALUES ('2', '106');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '2006');
INSERT INTO `sys_role_menu` VALUES ('2', '2007');
INSERT INTO `sys_role_menu` VALUES ('2', '2008');
INSERT INTO `sys_role_menu` VALUES ('2', '2009');
INSERT INTO `sys_role_menu` VALUES ('2', '2010');
INSERT INTO `sys_role_menu` VALUES ('2', '2011');
INSERT INTO `sys_role_menu` VALUES ('2', '2012');
INSERT INTO `sys_role_menu` VALUES ('3', '2006');
INSERT INTO `sys_role_menu` VALUES ('3', '2007');
INSERT INTO `sys_role_menu` VALUES ('3', '2008');
INSERT INTO `sys_role_menu` VALUES ('3', '2009');
INSERT INTO `sys_role_menu` VALUES ('3', '2010');
INSERT INTO `sys_role_menu` VALUES ('3', '2011');
INSERT INTO `sys_role_menu` VALUES ('3', '2012');
INSERT INTO `sys_role_menu` VALUES ('4', '2006');
INSERT INTO `sys_role_menu` VALUES ('4', '2007');
INSERT INTO `sys_role_menu` VALUES ('4', '2008');
INSERT INTO `sys_role_menu` VALUES ('4', '2009');
INSERT INTO `sys_role_menu` VALUES ('4', '2010');
INSERT INTO `sys_role_menu` VALUES ('4', '2011');
INSERT INTO `sys_role_menu` VALUES ('4', '2012');
INSERT INTO `sys_role_menu` VALUES ('5', '2006');
INSERT INTO `sys_role_menu` VALUES ('5', '2007');
INSERT INTO `sys_role_menu` VALUES ('5', '2008');
INSERT INTO `sys_role_menu` VALUES ('5', '2009');
INSERT INTO `sys_role_menu` VALUES ('5', '2010');
INSERT INTO `sys_role_menu` VALUES ('5', '2011');
INSERT INTO `sys_role_menu` VALUES ('5', '2012');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '居里先生', '00', '798224073@qq.com', '13313090597', '0', '/profile/avatar/2019/12/04/12d6e1e9c5b2d20572f88f245e0e3be5.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-12-16 18:14:43', 'admin', '2018-03-16 11:33:00', 'ry', '2019-12-16 18:14:42', '管理员');
INSERT INTO `sys_user` VALUES ('2', '106', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2019-12-02 21:52:29', 'admin', '2018-03-16 11:33:00', 'admin', '2019-12-02 21:52:28', '测试员');
INSERT INTO `sys_user` VALUES ('3', '105', 'test', '测试人员', '00', '798224023@qq.com', '13313090592', '0', '', 'fa89d8fcc263957ba1be744f258c5d99', 'aea9cb', '0', '0', '127.0.0.1', '2019-12-02 22:46:10', 'admin', '2019-12-02 21:28:29', 'admin', '2019-12-04 22:16:52', '');
INSERT INTO `sys_user` VALUES ('4', '101', 'shenzhen', '深圳总公司主管', '00', '798224074@qq.com', '13313090598', '0', '', '303eef1aa75f6d229e6a1996e93d97c3', '86b74d', '0', '0', '127.0.0.1', '2019-12-02 22:49:12', 'admin', '2019-12-02 21:33:17', '', '2019-12-02 22:49:12', null);
INSERT INTO `sys_user` VALUES ('5', '110', 'testzy', '测试组员', '00', '798224075@qq.com', '13313090599', '0', '', '28e8b0173ddd2253f5ebbdc760c20f78', '0afa8c', '0', '0', '127.0.0.1', '2019-12-02 22:38:01', 'admin', '2019-12-02 22:37:54', '', '2019-12-02 22:38:00', null);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('e286cfce-8163-422c-bd70-a2a75a4a3476', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2019-12-16 18:14:02', '2019-12-16 18:14:43', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('3', '4');
INSERT INTO `sys_user_post` VALUES ('4', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '3');
INSERT INTO `sys_user_role` VALUES ('4', '4');
INSERT INTO `sys_user_role` VALUES ('5', '5');

-- ----------------------------
-- Table structure for tb_person
-- ----------------------------
DROP TABLE IF EXISTS `tb_person`;
CREATE TABLE `tb_person` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `sex` int(3) DEFAULT NULL COMMENT '性别',
  `job` int(3) DEFAULT NULL COMMENT '职业',
  `job_date` datetime DEFAULT NULL COMMENT '入职时间',
  `create_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '所在部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='人员表';

-- ----------------------------
-- Records of tb_person
-- ----------------------------
INSERT INTO `tb_person` VALUES ('1201495395135475714', '测试人员数据', '21', '0', '0', '2019-12-02 00:00:00', '3', '2019-12-02 21:36:40', '3', '2019-12-02 21:37:44', '105');
INSERT INTO `tb_person` VALUES ('1201495953070182401', '主管数据', '22', '0', '0', '2019-11-27 00:00:00', '4', '2019-12-02 21:38:53', '4', '2019-12-02 21:38:53', '101');
INSERT INTO `tb_person` VALUES ('1201496254649028609', '财务部门数据', '23', '1', '0', '2019-12-04 00:00:00', '2', '2019-12-02 21:40:04', '2', '2019-12-02 21:40:04', '106');
INSERT INTO `tb_person` VALUES ('1201510943776952321', '测试组员数据', '23', '0', '0', '2019-12-11 00:00:00', '5', '2019-12-02 22:38:27', '5', '2019-12-02 22:38:27', '110');
