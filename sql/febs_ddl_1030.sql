/*
 navicat premium data transfer

 source server         : local_root
 source server type    : mysql
 source server version : 50727
 source host           : localhost:3306
 source schema         : mrbird

 target server type    : mysql
 target server version : 50727
 file encoding         : 65001

 date: 30/10/2019 10:51:13
*/

create database /*!32312 if not exists*/`cfms` /*!40100 default character set utf8mb4 collate utf8mb4_bin */;
use `cfms`;

set names utf8mb4;
set foreign_key_checks = 0;

-- ----------------------------
-- table structure for qrtz_blob_triggers
-- ----------------------------
drop table if exists `qrtz_blob_triggers`;
create table `qrtz_blob_triggers` (
  `sched_name` varchar(120) not null,
  `trigger_name` varchar(200) not null,
  `trigger_group` varchar(200) not null,
  `blob_data` blob,
  primary key (`sched_name`,`trigger_name`,`trigger_group`),
  constraint `qrtz_blob_triggers_ibfk_1` foreign key (`sched_name`, `trigger_name`, `trigger_group`) references `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) engine=innodb default charset=utf8mb4;

-- ----------------------------
-- table structure for qrtz_calendars
-- ----------------------------
drop table if exists `qrtz_calendars`;
create table `qrtz_calendars` (
  `sched_name` varchar(120) not null,
  `calendar_name` varchar(200) not null,
  `calendar` blob not null,
  primary key (`sched_name`,`calendar_name`)
) engine=innodb default charset=utf8mb4;

-- ----------------------------
-- table structure for qrtz_cron_triggers
-- ----------------------------
drop table if exists `qrtz_cron_triggers`;
create table `qrtz_cron_triggers` (
  `sched_name` varchar(120) not null,
  `trigger_name` varchar(200) not null,
  `trigger_group` varchar(200) not null,
  `cron_expression` varchar(200) not null,
  `time_zone_id` varchar(80) default null,
  primary key (`sched_name`,`trigger_name`,`trigger_group`),
  constraint `qrtz_cron_triggers_ibfk_1` foreign key (`sched_name`, `trigger_name`, `trigger_group`) references `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) engine=innodb default charset=utf8mb4;

-- ----------------------------
-- table structure for qrtz_fired_triggers
-- ----------------------------
drop table if exists `qrtz_fired_triggers`;
create table `qrtz_fired_triggers` (
  `sched_name` varchar(120) not null,
  `entry_id` varchar(95) not null,
  `trigger_name` varchar(200) not null,
  `trigger_group` varchar(200) not null,
  `instance_name` varchar(200) not null,
  `fired_time` bigint(13) not null,
  `sched_time` bigint(13) not null,
  `priority` int(11) not null,
  `state` varchar(16) not null,
  `job_name` varchar(200) default null,
  `job_group` varchar(200) default null,
  `is_nonconcurrent` varchar(1) default null,
  `requests_recovery` varchar(1) default null,
  primary key (`sched_name`,`entry_id`)
) engine=innodb default charset=utf8mb4;

-- ----------------------------
-- table structure for qrtz_job_details
-- ----------------------------
drop table if exists `qrtz_job_details`;
create table `qrtz_job_details` (
  `sched_name` varchar(120) not null,
  `job_name` varchar(200) not null,
  `job_group` varchar(200) not null,
  `description` varchar(250) default null,
  `job_class_name` varchar(250) not null,
  `is_durable` varchar(1) not null,
  `is_nonconcurrent` varchar(1) not null,
  `is_update_data` varchar(1) not null,
  `requests_recovery` varchar(1) not null,
  `job_data` blob,
  primary key (`sched_name`,`job_name`,`job_group`)
) engine=innodb default charset=utf8mb4;

-- ----------------------------
-- table structure for qrtz_locks
-- ----------------------------
drop table if exists `qrtz_locks`;
create table `qrtz_locks` (
  `sched_name` varchar(120) not null,
  `lock_name` varchar(40) not null,
  primary key (`sched_name`,`lock_name`)
) engine=innodb default charset=utf8mb4;

-- ----------------------------
-- table structure for qrtz_paused_trigger_grps
-- ----------------------------
drop table if exists `qrtz_paused_trigger_grps`;
create table `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) not null,
  `trigger_group` varchar(200) not null,
  primary key (`sched_name`,`trigger_group`)
) engine=innodb default charset=utf8mb4;

-- ----------------------------
-- table structure for qrtz_scheduler_state
-- ----------------------------
drop table if exists `qrtz_scheduler_state`;
create table `qrtz_scheduler_state` (
  `sched_name` varchar(120) not null,
  `instance_name` varchar(200) not null,
  `last_checkin_time` bigint(13) not null,
  `checkin_interval` bigint(13) not null,
  primary key (`sched_name`,`instance_name`)
) engine=innodb default charset=utf8mb4;

-- ----------------------------
-- table structure for qrtz_simple_triggers
-- ----------------------------
drop table if exists `qrtz_simple_triggers`;
create table `qrtz_simple_triggers` (
  `sched_name` varchar(120) not null,
  `trigger_name` varchar(200) not null,
  `trigger_group` varchar(200) not null,
  `repeat_count` bigint(7) not null,
  `repeat_interval` bigint(12) not null,
  `times_triggered` bigint(10) not null,
  primary key (`sched_name`,`trigger_name`,`trigger_group`),
  constraint `qrtz_simple_triggers_ibfk_1` foreign key (`sched_name`, `trigger_name`, `trigger_group`) references `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) engine=innodb default charset=utf8mb4;

-- ----------------------------
-- table structure for qrtz_simprop_triggers
-- ----------------------------
drop table if exists `qrtz_simprop_triggers`;
create table `qrtz_simprop_triggers` (
  `sched_name` varchar(120) not null,
  `trigger_name` varchar(200) not null,
  `trigger_group` varchar(200) not null,
  `str_prop_1` varchar(512) default null,
  `str_prop_2` varchar(512) default null,
  `str_prop_3` varchar(512) default null,
  `int_prop_1` int(11) default null,
  `int_prop_2` int(11) default null,
  `long_prop_1` bigint(20) default null,
  `long_prop_2` bigint(20) default null,
  `dec_prop_1` decimal(13,4) default null,
  `dec_prop_2` decimal(13,4) default null,
  `bool_prop_1` varchar(1) default null,
  `bool_prop_2` varchar(1) default null,
  primary key (`sched_name`,`trigger_name`,`trigger_group`),
  constraint `qrtz_simprop_triggers_ibfk_1` foreign key (`sched_name`, `trigger_name`, `trigger_group`) references `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) engine=innodb default charset=utf8mb4;

-- ----------------------------
-- table structure for qrtz_triggers
-- ----------------------------
drop table if exists `qrtz_triggers`;
create table `qrtz_triggers` (
  `sched_name` varchar(120) not null,
  `trigger_name` varchar(200) not null,
  `trigger_group` varchar(200) not null,
  `job_name` varchar(200) not null,
  `job_group` varchar(200) not null,
  `description` varchar(250) default null,
  `next_fire_time` bigint(13) default null,
  `prev_fire_time` bigint(13) default null,
  `priority` int(11) default null,
  `trigger_state` varchar(16) not null,
  `trigger_type` varchar(8) not null,
  `start_time` bigint(13) not null,
  `end_time` bigint(13) default null,
  `calendar_name` varchar(200) default null,
  `misfire_instr` smallint(2) default null,
  `job_data` blob,
  primary key (`sched_name`,`trigger_name`,`trigger_group`),
  key `sched_name` (`sched_name`,`job_name`,`job_group`),
  constraint `qrtz_triggers_ibfk_1` foreign key (`sched_name`, `job_name`, `job_group`) references `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) engine=innodb default charset=utf8mb4;

-- ----------------------------
-- table structure for t_dept
-- ----------------------------
drop table if exists `t_dept`;
create table `t_dept` (
  `dept_id` bigint(20) not null auto_increment comment '部门id',
  `parent_id` bigint(20) not null comment '上级部门id',
  `dept_name` varchar(100) not null comment '部门名称',
  `order_num` double(20,0) default null comment '排序',
  `create_time` datetime default null comment '创建时间',
  `modify_time` datetime default null comment '修改时间',
  primary key (`dept_id`) using btree
) engine=innodb auto_increment=9 default charset=utf8 row_format=dynamic;

-- ----------------------------
-- table structure for t_dict
-- ----------------------------
drop table if exists `t_dict`;
create table `t_dict` (
  `dict_id` bigint(20) not null auto_increment comment '字典id',
  `keyy` bigint(20) not null comment '键',
  `valuee` varchar(100) not null comment '值',
  `field_name` varchar(100) not null comment '字段名称',
  `table_name` varchar(100) not null comment '表名',
  primary key (`dict_id`) using btree
) engine=innodb auto_increment=34 default charset=utf8 row_format=dynamic;

-- ----------------------------
-- table structure for t_job
-- ----------------------------
drop table if exists `t_job`;
create table `t_job` (
  `job_id` bigint(20) not null auto_increment comment '任务id',
  `bean_name` varchar(100) not null comment 'spring bean名称',
  `method_name` varchar(100) not null comment '方法名',
  `params` varchar(200) default null comment '参数',
  `cron_expression` varchar(100) not null comment 'cron表达式',
  `status` char(2) not null comment '任务状态  0：正常  1：暂停',
  `remark` varchar(200) default null comment '备注',
  `create_time` datetime default null comment '创建时间',
  primary key (`job_id`) using btree
) engine=innodb auto_increment=12 default charset=utf8 row_format=dynamic;

-- ----------------------------
-- table structure for t_job_log
-- ----------------------------
drop table if exists `t_job_log`;
create table `t_job_log` (
  `log_id` bigint(20) not null auto_increment comment '任务日志id',
  `job_id` bigint(20) not null comment '任务id',
  `bean_name` varchar(100) not null comment 'spring bean名称',
  `method_name` varchar(100) not null comment '方法名',
  `params` varchar(200) default null comment '参数',
  `status` char(2) not null comment '任务状态    0：成功    1：失败',
  `error` text comment '失败信息',
  `times` decimal(11,0) default null comment '耗时(单位：毫秒)',
  `create_time` datetime default null comment '创建时间',
  primary key (`log_id`) using btree
) engine=innodb auto_increment=2502 default charset=utf8 row_format=dynamic;

-- ----------------------------
-- table structure for t_log
-- ----------------------------
drop table if exists `t_log`;
create table `t_log` (
  `id` bigint(20) not null auto_increment comment '日志id',
  `username` varchar(50) default null comment '操作用户',
  `operation` text comment '操作内容',
  `time` decimal(11,0) default null comment '耗时',
  `method` text comment '操作方法',
  `params` text comment '方法参数',
  `ip` varchar(64) default null comment '操作者ip',
  `create_time` datetime default null comment '创建时间',
  `location` varchar(50) default null comment '操作地点',
  primary key (`id`) using btree
) engine=innodb auto_increment=1842 default charset=utf8 row_format=dynamic;

-- ----------------------------
-- table structure for t_login_log
-- ----------------------------
drop table if exists `t_login_log`;
create table `t_login_log` (
  `username` varchar(100) not null comment '用户名',
  `login_time` datetime not null comment '登录时间',
  `location` varchar(255) default null comment '登录地点',
  `ip` varchar(100) default null comment 'ip地址'
) engine=innodb default charset=utf8 row_format=dynamic;

-- ----------------------------
-- table structure for t_menu
-- ----------------------------
drop table if exists `t_menu`;
create table `t_menu` (
  `menu_id` bigint(20) not null auto_increment comment '菜单/按钮id',
  `parent_id` bigint(20) not null comment '上级菜单id',
  `menu_name` varchar(50) not null comment '菜单/按钮名称',
  `path` varchar(255) default null comment '对应路由path',
  `component` varchar(255) default null comment '对应路由组件component',
  `perms` varchar(50) default null comment '权限标识',
  `icon` varchar(50) default null comment '图标',
  `type` char(2) not null comment '类型 0菜单 1按钮',
  `order_num` double(20,0) default null comment '排序',
  `create_time` datetime not null comment '创建时间',
  `modify_time` datetime default null comment '修改时间',
  primary key (`menu_id`) using btree
) engine=innodb auto_increment=139 default charset=utf8 row_format=dynamic;

-- ----------------------------
-- table structure for t_role
-- ----------------------------
drop table if exists `t_role`;
create table `t_role` (
  `role_id` bigint(20) not null auto_increment comment '角色id',
  `role_name` varchar(10) not null comment '角色名称',
  `remark` varchar(100) default null comment '角色描述',
  `create_time` datetime not null comment '创建时间',
  `modify_time` datetime default null comment '修改时间',
  primary key (`role_id`) using btree
) engine=innodb auto_increment=74 default charset=utf8 row_format=dynamic;

-- ----------------------------
-- table structure for t_role_menu
-- ----------------------------
drop table if exists `t_role_menu`;
create table `t_role_menu` (
  `role_id` bigint(20) not null,
  `menu_id` bigint(20) not null
) engine=innodb default charset=utf8 row_format=dynamic;

-- ----------------------------
-- table structure for t_test
-- ----------------------------
drop table if exists `t_test`;
create table `t_test` (
  `id` bigint(11) not null auto_increment,
  `field1` varchar(20) not null,
  `field2` int(11) not null,
  `field3` varchar(100) not null,
  `create_time` datetime not null,
  primary key (`id`) using btree
) engine=innodb auto_increment=100 default charset=utf8;

-- ----------------------------
-- table structure for t_user
-- ----------------------------
drop table if exists `t_user`;
create table `t_user` (
  `user_id` bigint(10) not null auto_increment comment '用户id',
  `username` varchar(50) not null comment '用户名',
  `password` varchar(128) not null comment '密码',
  `dept_id` bigint(20) default null comment '部门id',
  `email` varchar(128) default null comment '邮箱',
  `mobile` varchar(20) default null comment '联系电话',
  `status` char(1) not null comment '状态 0锁定 1有效',
  `create_time` datetime not null comment '创建时间',
  `modify_time` datetime default null comment '修改时间',
  `last_login_time` datetime default null comment '最近访问时间',
  `ssex` char(1) default null comment '性别 0男 1女 2保密',
  `description` varchar(100) default null comment '描述',
  `avatar` varchar(100) default null comment '用户头像',
  primary key (`user_id`) using btree
) engine=innodb auto_increment=13 default charset=utf8 row_format=dynamic;

-- ----------------------------
-- table structure for t_user_config
-- ----------------------------
drop table if exists `t_user_config`;
create table `t_user_config` (
  `user_id` bigint(20) not null comment '用户id',
  `theme` varchar(10) default null comment '系统主题 dark暗色风格，light明亮风格',
  `layout` varchar(10) default null comment '系统布局 side侧边栏，head顶部栏',
  `multi_page` char(1) default null comment '页面风格 1多标签页 0单页',
  `fix_siderbar` char(1) default null comment '页面滚动是否固定侧边栏 1固定 0不固定',
  `fix_header` char(1) default null comment '页面滚动是否固定顶栏 1固定 0不固定',
  `color` varchar(20) default null comment '主题颜色 rgb值',
  primary key (`user_id`) using btree
) engine=innodb default charset=utf8 row_format=dynamic;

-- ----------------------------
-- table structure for t_user_role
-- ----------------------------
drop table if exists `t_user_role`;
create table `t_user_role` (
  `user_id` bigint(20) not null comment '用户id',
  `role_id` bigint(20) not null comment '角色id'
) engine=innodb default charset=utf8 row_format=dynamic;

set foreign_key_checks = 1;
