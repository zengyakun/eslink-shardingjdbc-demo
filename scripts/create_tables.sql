CREATE TABLE `biz_user` (
 `user_id` varchar(30) NOT NULL COMMENT '用户ID',
 `out_user_id` varchar(64) DEFAULT NULL COMMENT '外部用户ID',
 `user_no` varchar(20) DEFAULT NULL COMMENT '用户号',
 `user_type` varchar(4) DEFAULT NULL COMMENT '用户类型 (1-居民用户，2-非居民用户)',
 `user_name` varchar(50) DEFAULT NULL COMMENT '用户名称',
 `gender` varchar(2) DEFAULT NULL COMMENT '性别',
 `birth_date` date DEFAULT NULL COMMENT '出生日期',
 `certificate_no` varchar(30) DEFAULT NULL COMMENT '身份证号',
 `certificate_type` varchar(50) DEFAULT NULL COMMENT '证件类型',
 `contact_address` varchar(100) DEFAULT NULL COMMENT '联系地址',
 `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
 `telephone` varchar(50) DEFAULT NULL COMMENT '电话',
 `unit_name` varchar(60) DEFAULT NULL COMMENT '单位名称',
 `unit_type` varchar(4) DEFAULT NULL COMMENT '单位性质 (1-市政，2-学校，3-工厂，4-酒店，5-医院，6-餐饮)',
 `unit_desc` varchar(100) DEFAULT NULL COMMENT '单位描述',
 `contact_user` varchar(255) DEFAULT NULL COMMENT '联系人',
 `mailbox` varchar(255) DEFAULT NULL COMMENT '邮件',
 `black_flag` char(1) DEFAULT '0' COMMENT '拉黑标识-1-黑名单，0-白名单',
 `other_info` varchar(255) DEFAULT NULL COMMENT '其他信息',
 `tag_ids` varchar(255) DEFAULT NULL COMMENT '标签，多个 用逗号隔开',
 `new_user_flag` tinyint(1) DEFAULT '0' COMMENT '是否是新用户 0-旧用户，1-新用户',
 `state` tinyint(4) DEFAULT NULL COMMENT '状态 （1-正常，2-禁用，3-注销）',
 `last_safechcek_year` int(11) DEFAULT NULL COMMENT '上次安检年份',
 `last_safecheck_time` datetime DEFAULT NULL COMMENT '上次安检时间',
 `tenant_id` varchar(30) NOT NULL COMMENT '租户ID',
 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
 `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
 PRIMARY KEY (`user_id`),
 KEY `index_tenant_id` (`tenant_id`),
 KEY `index_user_no` (`user_no`),
 KEY `index_user_id` (`user_id`),
 KEY `index_modify_time` (`modify_time`),
 KEY `index_last_safecheck_year` (`last_safechcek_year`),
 KEY `idx_out_user_id` (`out_user_id`),
 KEY `index_user_type` (`user_type`),
 KEY `idx_telephone` (`telephone`) USING BTREE,
 KEY `idx_user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户表';

CREATE TABLE `biz_address` (
 `address_id` varchar(30) NOT NULL COMMENT '地址ID',
 `out_address_id` varchar(64) DEFAULT NULL COMMENT '外部地址ID',
 `user_id` varchar(30) DEFAULT NULL COMMENT '用户ID',
 `sort_no` int(11) DEFAULT NULL COMMENT '次序号',
 `sort_no_not_numeric` varchar(30) DEFAULT NULL COMMENT '字符型排序',
 `province` varchar(10) DEFAULT NULL COMMENT '省',
 `city` varchar(10) DEFAULT NULL COMMENT '市',
 `county` varchar(10) DEFAULT NULL COMMENT '区/县',
 `street` varchar(30) DEFAULT NULL COMMENT '街道',
 `housing_estate_id` varchar(30) DEFAULT NULL COMMENT '小区',
 `building_no` varchar(20) DEFAULT NULL COMMENT '楼栋号',
 `unit_no` varchar(20) DEFAULT NULL COMMENT '单元号',
 `floor_no` varchar(20) DEFAULT NULL COMMENT '楼层',
 `house_no` varchar(20) DEFAULT NULL COMMENT '门牌号',
 `address_desc` varchar(100) DEFAULT NULL COMMENT '地址描述',
 `address_type` varchar(4) DEFAULT NULL COMMENT '地址类型',
 `house_space` varchar(10) DEFAULT NULL COMMENT '房屋面积',
 `house_cert_no` varchar(30) DEFAULT NULL COMMENT '房产证号',
 `building_age` int(11) DEFAULT NULL COMMENT '建造年代',
 `gas_type` varchar(4) DEFAULT NULL COMMENT '用气类型',
 `areas_id` varchar(30) DEFAULT NULL COMMENT '片区',
 `state` tinyint(4) DEFAULT NULL COMMENT '状态',
 `hide_flag` tinyint(1) DEFAULT '0' COMMENT '是否隐藏 0-显示 1-隐藏',
 `drawup_flag` char(1) DEFAULT '0' COMMENT '编制标识',
 `batch_no` varchar(30) DEFAULT NULL COMMENT '批次号',
 `manage_org` varchar(50) DEFAULT NULL COMMENT '管理所',
 `distribute_flag` tinyint(1) DEFAULT '0' COMMENT '分配标识（0-未分配，1-已分配）',
 `open_date` datetime DEFAULT NULL COMMENT '开户时间',
 `cn_flag` tinyint(1) DEFAULT '0' COMMENT '是否采暖 0-否 1-是',
 `cct_flag` tinyint(1) DEFAULT '0' COMMENT '是否村村通 0-否 1-是',
 `last_safechcek_year` int(11) DEFAULT NULL COMMENT '上次安检年份',
 `last_safecheck_time` datetime DEFAULT NULL COMMENT '上次安检时间',
 `major_flag` tinyint(1) DEFAULT '0' COMMENT '重点用户',
 `tenant_id` varchar(30) NOT NULL COMMENT '租户ID',
 `source_type` tinyint(4) DEFAULT '0' COMMENT '来源 1：同步；2：新增',
 `modify_state` tinyint(4) DEFAULT '0' COMMENT '修改状态 0：未修改；1：已修改；',
 `audit_state` tinyint(4) DEFAULT '1' COMMENT '审核标识 0：未审核；1：审核通过；2：审核驳回',
 `confirm_state` tinyint(4) DEFAULT '1' COMMENT '确认标识 0：未确认；1：确认通过',
 `origin_pre_id` int(10) DEFAULT '0' COMMENT '0-etbc 数据录入，其余为对应的前置ID ',
 `update_remark` text COMMENT '修改备注',
 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
 `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
 PRIMARY KEY (`address_id`),
 KEY `index_user_id` (`user_id`),
 KEY `index_areas_id` (`areas_id`),
 KEY `index_housing_estate_id` (`housing_estate_id`),
 KEY `index_tenant_id` (`tenant_id`),
 KEY `index_address_id` (`address_id`),
 KEY `index_modify_time` (`modify_time`),
 KEY `idx_sort_no` (`sort_no`),
 KEY `idx_address_desc` (`address_desc`),
 KEY `index_hide_flag` (`hide_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='地址表';

CREATE TABLE `safe_areas` (
  `areas_id` varchar(30) NOT NULL COMMENT '片区ID',
  `out_areas_id` varchar(64) DEFAULT NULL COMMENT '外部片区Id',
  `areas_name` varchar(50) DEFAULT NULL COMMENT '片区名称',
  `tenant_id` varchar(30) DEFAULT NULL COMMENT '租户ID',
  `state` tinyint(4) DEFAULT '0',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`areas_id`),
  KEY `index_areas_id` (`areas_id`),
  KEY `index_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='安检片区';

CREATE TABLE `safe_cycle` (
  `cycle_id` varchar(30) NOT NULL COMMENT '周期ID',
  `new_cycle_id` varchar(30) DEFAULT NULL,
  `cycle_config_id` varchar(30) DEFAULT NULL COMMENT '周期配置ID',
  `cycle_name` varchar(100) DEFAULT NULL COMMENT '周期描述',
  `user_type` varchar(4) DEFAULT NULL COMMENT '0-全部，1-居民户，2-商业户',
  `safecheck_year` varchar(4) DEFAULT NULL COMMENT '周期所在年份',
  `start_year` varchar(4) DEFAULT NULL COMMENT '开始年',
  `start_month` varchar(4) DEFAULT NULL COMMENT '开始月份',
  `end_year` varchar(4) DEFAULT NULL COMMENT '结束年',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_month` varchar(4) DEFAULT NULL COMMENT '结束月份',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `tenant_id` varchar(30) DEFAULT NULL COMMENT '租户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cycle_id`),
  KEY `idx_tenant_id` (`tenant_id`),
  KEY `idx_user_type` (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='安检周期表';


-- 分区表
CREATE TABLE biz_user_1P01 LIKE biz_user;
CREATE TABLE biz_address_1P01 LIKE biz_address;