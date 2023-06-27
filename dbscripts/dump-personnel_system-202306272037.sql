-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (arm64)
--
-- Host: localhost    Database: personnel_system
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_id` int DEFAULT NULL COMMENT '学生id',
  `employment_id` int DEFAULT NULL COMMENT '用工计划id',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `job_id` int DEFAULT NULL COMMENT '岗位id',
  `hours` tinyint DEFAULT NULL COMMENT '工作时长',
  `base_salary` float DEFAULT NULL COMMENT '基础工资',
  `performance_salary` float DEFAULT NULL COMMENT '绩效工资',
  `status` tinyint DEFAULT '1' COMMENT '状态 0-失效 1-生效 ',
  `standard_days` tinyint DEFAULT NULL COMMENT '标准工作天数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='应聘表\n一对一学生申请，一对多用工计划';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (2,4,1,'2023-06-24 21:03:53','2023-06-26 20:09:00','2023-06-10','2023-06-29',1,2,600,300,1,22),(3,1,1,'2023-06-25 13:45:42','2023-06-26 20:09:00','2023-06-25','2023-07-30',1,3,500,200,1,22),(4,3,1,'2023-06-25 14:00:45','2023-06-26 20:09:00','2023-06-01','2023-08-01',1,3,300,100,1,22),(5,5,1,'2023-06-25 16:58:06','2023-06-26 20:09:00','2023-06-01','2023-08-01',2,2,400,100,1,22),(6,6,1,'2023-06-26 20:21:00','2023-06-26 20:33:56','2023-06-26','2023-09-26',1,4,200,200,1,22),(7,7,2,'2023-06-26 20:25:29','2023-06-27 03:00:20','2023-06-30','2024-06-30',4,3,400,100,0,22),(8,8,2,'2023-06-26 20:27:29','2023-06-27 12:26:16','2023-06-30','2023-09-30',4,4,400,200,0,20),(9,9,4,'2023-06-27 17:09:37','2023-06-27 17:09:37','2023-06-27','2023-10-27',1,3,400,200,1,22);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `year` varchar(4) DEFAULT NULL COMMENT '年份',
  `month` varchar(2) DEFAULT NULL COMMENT '月份',
  `application_id` int DEFAULT NULL COMMENT '合同id',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tech_require_score` tinyint DEFAULT NULL COMMENT '技术要求达成率',
  `work_error_score` tinyint DEFAULT NULL COMMENT '工作失误率',
  `collaborative_ability_score` tinyint DEFAULT NULL COMMENT '协作能力',
  `assigned_completion_score` tinyint DEFAULT NULL COMMENT '交办事项完成率',
  `working_attitude_score` tinyint DEFAULT NULL COMMENT '工作态度',
  `total_score` tinyint DEFAULT NULL COMMENT '总分',
  `days` tinyint DEFAULT NULL COMMENT '工作天数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='月考核表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
INSERT INTO `assessment` VALUES (1,'2023','06',2,'2023-06-26 11:12:38','2023-06-27 13:55:35',25,20,20,20,15,100,22),(2,'2023','05',2,'2023-06-26 14:26:50','2023-06-27 13:55:35',23,18,18,17,12,88,22),(3,'2023','04',2,'2023-06-26 20:46:39','2023-06-27 13:55:35',23,20,20,19,13,95,20),(4,'2023','05',3,'2023-06-26 22:04:05','2023-06-27 13:55:35',23,20,19,19,15,96,20),(5,'2023','05',5,'2023-06-26 22:15:32','2023-06-27 13:55:35',22,18,18,19,13,90,18),(6,'2023','05',7,'2023-06-26 23:28:31','2023-06-27 13:55:35',24,20,19,20,15,98,20),(7,'2023','05',8,'2023-06-26 23:28:51','2023-06-27 13:55:35',20,15,18,18,15,86,15);
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employment`
--

DROP TABLE IF EXISTS `employment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department` varchar(100) DEFAULT NULL COMMENT '部门',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint DEFAULT '1' COMMENT '0-失效 1-生效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用工计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment`
--

LOCK TABLES `employment` WRITE;
/*!40000 ALTER TABLE `employment` DISABLE KEYS */;
INSERT INTO `employment` VALUES (1,'后勤部门','好好好','2023-06-23','2023-06-30','2023-06-23 21:26:27','2023-06-23 21:26:27',1),(2,'测试部门','测试','2023-06-16','2023-06-20','2023-06-24 11:03:26','2023-06-24 14:51:47',1),(3,'定时部门','定时任务','2023-06-16','2023-06-21','2023-06-24 11:51:50','2023-06-24 11:54:25',0),(4,'有关部门','有关','2023-06-27','2024-06-30','2023-06-27 16:20:31','2023-06-27 16:20:31',1);
/*!40000 ALTER TABLE `employment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employment_job`
--

DROP TABLE IF EXISTS `employment_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employment_job` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `employment_id` int DEFAULT NULL COMMENT '用工id',
  `job_id` int DEFAULT NULL COMMENT '岗位id',
  `limit_number` tinyint DEFAULT NULL COMMENT '限制人数',
  `current_number` tinyint DEFAULT '0' COMMENT '当前人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment_job`
--

LOCK TABLES `employment_job` WRITE;
/*!40000 ALTER TABLE `employment_job` DISABLE KEYS */;
INSERT INTO `employment_job` VALUES (1,1,1,4,4),(2,1,2,2,1),(3,2,4,5,2),(4,2,5,3,3),(5,2,6,2,1),(6,4,1,4,1),(7,4,2,3,0),(8,4,4,2,0);
/*!40000 ALTER TABLE `employment_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'employment','用工计划表',NULL,NULL,'Employment','crud','com.ruoyi.project.workstudy','workstudy','employment','用工计划','zyc','0','/','{\"parentMenuId\":2000}','admin','2023-06-22 21:44:07','','2023-06-23 20:43:57',NULL),(2,'student','学生申请表',NULL,NULL,'Student','crud','com.ruoyi.project.workstudy','workstudy','student','学生申请','zyc','0','/','{\"parentMenuId\":2000}','admin','2023-06-22 21:44:07','','2023-06-22 21:52:17',NULL),(3,'application','应聘表\n一对一学生申请，一对多用工计划',NULL,NULL,'Application','crud','com.ruoyi.project.system','system','application','应聘\n一对一学生申请，一对多用工计划','ruoyi','0','/','{\"parentMenuId\":\"\"}','admin','2023-06-24 19:58:16','','2023-06-25 16:20:59',NULL),(4,'assessment','月考核表',NULL,NULL,'Assessment','crud','com.ruoyi.project.system','system','assessment','月考核','ruoyi','0','/','{\"parentMenuId\":\"\"}','admin','2023-06-25 21:01:15','','2023-06-25 21:02:25',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,'1','id','编号','int','Long','id','1','1',NULL,'0',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-22 21:44:07','','2023-06-23 20:43:57'),(2,'1','department','部门','varchar(100)','String','department','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-06-22 21:44:07','','2023-06-23 20:43:57'),(3,'1','content','内容','varchar(255)','String','content','0','0',NULL,'1','1','1','0','EQ','editor','',3,'admin','2023-06-22 21:44:07','','2023-06-23 20:43:57'),(4,'1','start_time','开始时间','date','Date','startTime','0','0',NULL,'1','1','1','0','EQ','datetime','',4,'admin','2023-06-22 21:44:07','','2023-06-23 20:43:57'),(5,'1','end_time','结束时间','date','Date','endTime','0','0',NULL,'1','1','1','0','EQ','datetime','',5,'admin','2023-06-22 21:44:07','','2023-06-23 20:43:57'),(6,'1','created_time','创建时间','datetime','Date','createdTime','0','0',NULL,'0','0','0','0','EQ','datetime','',6,'admin','2023-06-22 21:44:07','','2023-06-23 20:43:57'),(7,'1','updated_time','更新时间','datetime','Date','updatedTime','0','0',NULL,'0','0','0','0','EQ','datetime','',7,'admin','2023-06-22 21:44:07','','2023-06-23 20:43:57'),(8,'1','status','0-失效 1-生效','tinyint','Long','status','0','0',NULL,'1','1','1','1','EQ','radio','business_effective',8,'admin','2023-06-22 21:44:07','','2023-06-23 20:43:57'),(9,'2','id',NULL,'int','Long','id','1','1',NULL,'0',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(10,'2','name','姓名','varchar(255)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(11,'2','department','学院','varchar(50)','String','department','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(12,'2','major','专业班级','varchar(50)','String','major','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(13,'2','sex','性别','smallint','Long','sex','0','0',NULL,'1','1','1','1','EQ','radio','sys_user_sex',5,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(14,'2','phone','联系方式','varchar(11)','String','phone','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(15,'2','created_time','创建时间','datetime','Date','createdTime','0','0',NULL,'0','0','1','1','EQ','datetime','',7,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(16,'2','updated_time','更新时间','datetime','Date','updatedTime','0','0',NULL,'0','0','1','1','EQ','datetime','',8,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(17,'2','status','0-申请中 1-已聘用 2-已结束','tinyint','Long','status','0','0',NULL,'0','1','1','1','EQ','radio','',9,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(18,'2','student_id','学号','varchar(100)','String','studentId','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(19,'2','is_eco_hard','0-不是 1-是','tinyint','Long','isEcoHard','0','0',NULL,'1','1','1','1','EQ','radio','',11,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(20,'2','is_assigned_accept','0-不接受 1-接受','tinyint','Long','isAssignedAccept','0','0',NULL,'1','1','1','1','EQ','radio','',12,'admin','2023-06-22 21:44:07','','2023-06-22 21:52:17'),(21,'3','id','主键','int','Long','id','1','1',NULL,'0',NULL,NULL,'0','EQ','input','',1,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(22,'3','student_id','学生id','int','Long','studentId','0','0',NULL,'1','1','1','0','EQ','input','',2,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(23,'3','employment_id','用工计划id','int','Long','employmentId','0','0',NULL,'1','1','1','0','EQ','input','',3,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(24,'3','created_time','创建时间','datetime','Date','createdTime','0','0',NULL,'0','0','0','0','EQ','datetime','',4,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(25,'3','updated_time','更新时间','datetime','Date','updatedTime','0','0',NULL,'0','0','0','0','EQ','datetime','',5,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(26,'3','start_time','开始时间','date','Date','startTime','0','0',NULL,'1','1','1','0','EQ','datetime','',6,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(27,'3','end_time','结束时间','date','Date','endTime','0','0',NULL,'1','1','1','0','EQ','datetime','',7,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(28,'3','job_id','岗位id','int','Long','jobId','0','0',NULL,'1','1','1','0','EQ','input','',8,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(29,'3','hours','工作时长','tinyint','Long','hours','0','0',NULL,'1','1','1','0','EQ','input','',9,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(30,'3','base_salary','基础工资','float','Long','baseSalary','0','0',NULL,'1','1','1','0','EQ','input','',10,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(31,'3','performance_salary','绩效工资','float','Long','performanceSalary','0','0',NULL,'1','1','1','0','EQ','input','',11,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(32,'3','status','状态 0-失效 1-生效 ','tinyint','Long','status','0','0',NULL,'0','0','1','1','EQ','radio','business_effective',12,'admin','2023-06-24 19:58:16','','2023-06-25 16:20:59'),(33,'4','id','主键','int','Long','id','1','1',NULL,'0',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25'),(34,'4','year','年份','varchar(4)','String','year','0','0',NULL,'1','0','1','1','EQ','input','',2,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25'),(35,'4','month','月份','varchar(2)','String','month','0','0',NULL,'1','0','1','1','EQ','input','',3,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25'),(36,'4','applicationId','合同id','int','Long','applicationId','0','0',NULL,'1','0','0','1','EQ','input','',4,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25'),(37,'4','created_time','创建时间','datetime','Date','createdTime','0','0',NULL,'0','0','1','1','EQ','datetime','',5,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25'),(38,'4','updated_time','更新时间','datetime','Date','updatedTime','0','0',NULL,'0','0','1','1','EQ','datetime','',6,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25'),(39,'4','tech_require_score','技术要求达成率','tinyint','Long','techRequireScore','0','0',NULL,'1','0','1','1','EQ','input','',7,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25'),(40,'4','work_error_score','工作失误率','tinyint','Long','workErrorScore','0','0',NULL,'1','0','1','1','EQ','input','',8,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25'),(41,'4','collaborative_ability_score','协作能力','tinyint','Long','collaborativeAbilityScore','0','0',NULL,'1','0','1','1','EQ','input','',9,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25'),(42,'4','assigned_completion_score','交办事项完成率','tinyint','Long','assignedCompletionScore','0','0',NULL,'1','0','1','1','EQ','input','',10,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25'),(43,'4','working_attitude_score','工作态度','tinyint','Long','workingAttitudeScore','0','0',NULL,'1','0','1','1','EQ','input','',11,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25'),(44,'4','total_score','总分','tinyint','Long','totalScore','0','0',NULL,'1','0','1','1','EQ','input','',12,'admin','2023-06-25 21:01:15','','2023-06-25 21:02:25');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `name` varchar(100) DEFAULT NULL COMMENT '岗位名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'助教'),(2,'收银员'),(3,'搬砖'),(4,'测试1'),(5,'测试2'),(6,'测试3'),(7,'测试4'),(8,'测试5');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `department` varchar(50) DEFAULT NULL COMMENT '学院',
  `major` varchar(50) DEFAULT NULL COMMENT '专业班级',
  `sex` smallint DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint DEFAULT '0' COMMENT '0-申请中 1-已聘用',
  `student_id` varchar(100) DEFAULT NULL COMMENT '学号',
  `is_eco_hard` tinyint DEFAULT NULL COMMENT '0-不是 1-是',
  `is_assigned_accept` tinyint DEFAULT NULL COMMENT '0-不接受 1-接受',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'张三','0','计算机2012',0,'666','2023-06-23 00:00:00','2023-06-25 13:45:42',1,'1233',0,1),(2,'李四','0','计算机2011',0,'666','2023-06-23 00:00:00','2023-06-23 00:00:00',0,'12345',1,0),(3,'王武','0','电子2012',1,'999','2023-06-23 00:00:00','2023-06-25 14:00:45',1,'666',1,1),(4,'刘六','2','汉语言2012',0,'5678','2023-06-23 00:00:00','2023-06-24 21:03:53',1,'4321',1,0),(5,'乱七','0','计算机2011',0,'7777','2023-06-24 00:00:00','2023-06-25 16:58:06',1,'777777',0,1),(6,'许八','0','电子2012',0,'1388888','2023-06-26 17:01:46','2023-06-26 20:21:01',1,'8888',1,1),(7,'测试1','1','数学2011',1,'1381111','2023-06-26 20:22:07','2023-06-26 20:25:29',1,'111',1,1),(8,'测试学生2','0','通信2012',1,'12382222','2023-06-26 20:27:05','2023-06-26 20:27:29',1,'cs2222',1,1),(9,'测试学生3','0','计算机2011',1,'13833333','2023-06-27 01:53:48','2023-06-27 17:09:37',1,'cs333',1,1),(10,'测试学生5','1','统计学2012',0,'13855555','2023-06-27 17:08:25','2023-06-27 17:08:25',0,'555555',1,1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_job`
--

DROP TABLE IF EXISTS `student_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_job` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_id` int DEFAULT NULL COMMENT '学生id',
  `job_id` int DEFAULT NULL COMMENT '岗位id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_job`
--

LOCK TABLES `student_job` WRITE;
/*!40000 ALTER TABLE `student_job` DISABLE KEYS */;
INSERT INTO `student_job` VALUES (1,1,1),(2,2,3),(3,3,4),(4,3,5),(5,4,1),(6,4,7),(7,1,3),(8,1,2),(9,2,8),(10,5,3),(11,5,5),(12,5,2),(13,6,1),(14,6,2),(15,6,3),(16,7,1),(17,7,4),(18,7,5),(19,8,1),(20,8,2),(21,8,3),(22,8,4),(23,9,2),(24,9,1),(25,10,2),(26,10,3);
/*!40000 ALTER TABLE `student_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2023-06-21 08:50:57','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-06-21 08:50:57','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2023-06-21 08:50:57','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2023-06-21 08:50:57','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2023-06-21 08:50:57','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2023-06-21 08:50:57','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
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
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-21 08:50:56','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-21 08:50:56','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-21 08:50:56','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-21 08:50:56','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-21 08:50:56','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-21 08:50:56','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-21 08:50:56','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-21 08:50:56','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-21 08:50:56','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-21 08:50:56','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-06-21 08:50:57','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2023-06-21 08:50:57','',NULL,'性别女'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-06-21 08:50:57','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-06-21 08:50:57','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-06-21 08:50:57','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-06-21 08:50:57','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2023-06-21 08:50:57','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2023-06-21 08:50:57','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2023-06-21 08:50:57','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2023-06-21 08:50:57','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-06-21 08:50:57','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-06-21 08:50:57','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-06-21 08:50:57','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-06-21 08:50:57','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-06-21 08:50:57','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-06-21 08:50:57','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2023-06-21 08:50:57','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-06-21 08:50:57','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-06-21 08:50:57','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-06-21 08:50:57','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-06-21 08:50:57','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-06-21 08:50:57','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-06-21 08:50:57','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-06-21 08:50:57','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-06-21 08:50:57','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-06-21 08:50:57','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-06-21 08:50:57','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-06-21 08:50:57','',NULL,'停用状态'),(100,0,'电子学院','0','college',NULL,'default','N','0','admin','2023-06-23 11:21:59','admin','2023-06-23 11:22:21',NULL),(101,1,'数学学院','1','college',NULL,'default','N','0','admin','2023-06-23 11:22:16','',NULL,NULL),(102,2,'文学院','2','college',NULL,'default','N','0','admin','2023-06-23 11:22:29','admin','2023-06-23 11:22:34',NULL),(103,1,'否','0','business_yes_no',NULL,'warning','N','0','admin','2023-06-23 11:34:34','admin','2023-06-23 11:39:08',NULL),(104,0,'是','1','business_yes_no',NULL,'success','N','0','admin','2023-06-23 11:35:02','admin','2023-06-23 11:39:11',NULL),(105,0,'生效','1','business_effective',NULL,'primary','N','0','admin','2023-06-23 20:38:56','admin','2023-06-23 20:40:46',NULL),(106,1,'失效','0','business_effective',NULL,'danger','N','0','admin','2023-06-23 20:40:22','admin','2023-06-23 21:24:07',NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2023-06-21 08:50:57','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2023-06-21 08:50:57','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2023-06-21 08:50:57','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2023-06-21 08:50:57','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2023-06-21 08:50:57','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2023-06-21 08:50:57','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2023-06-21 08:50:57','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2023-06-21 08:50:57','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2023-06-21 08:50:57','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2023-06-21 08:50:57','',NULL,'登录状态列表'),(100,'大学学院','college','0','admin','2023-06-23 11:17:07','admin','2023-06-23 11:18:28','大学学院列表'),(101,'业务是否','business_yes_no','0','admin','2023-06-23 11:34:06','admin','2023-06-23 11:34:13','业务方面的是否\n'),(102,'业务是否生效','business_effective','0','admin','2023-06-23 20:38:23','',NULL,'业务生效列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/5 * * * * ?','1','1','1','admin','2023-06-21 08:50:57','admin','2023-06-24 11:24:53',''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2023-06-21 08:50:57','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2023-06-21 08:50:57','',NULL,''),(100,'处理过期用工计划','DEFAULT','wsTask.handlingExpiredEmployment','0 0 1 * * ?','1','1','1','admin','2023-06-24 11:32:30','admin','2023-06-24 11:54:43','');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
INSERT INTO `sys_job_log` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','系统默认（无参） 总共耗时：3毫秒','0','','2023-06-24 11:24:37'),(2,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','系统默认（无参） 总共耗时：1毫秒','0','','2023-06-24 11:24:40'),(3,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','系统默认（无参） 总共耗时：0毫秒','0','','2023-06-24 11:24:45'),(4,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','系统默认（无参） 总共耗时：0毫秒','0','','2023-06-24 11:24:50'),(5,'处理过期用工计划','DEFAULT','wsTask.handlingExpiredEmployment','处理过期用工计划 总共耗时：59毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.common.utils.job.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.common.utils.job.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\n	at com.ruoyi.common.utils.job.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'employment_jobs\' in \'field list\'\n### The error may exist in com/ruoyi/project/workstudy/mapper/EmploymentMapper.java (best guess)\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT  id,department,content,start_time,end_time,created_time,updated_time,status,employment_jobs  FROM employment     WHERE (status = ? AND end_time < ?)\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'employment_jobs\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'employment_jobs\' in \'field list\'\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossibl','2023-06-24 11:48:00'),(6,'处理过期用工计划','DEFAULT','wsTask.handlingExpiredEmployment','处理过期用工计划 总共耗时：35毫秒','0','','2023-06-24 11:50:40'),(7,'处理过期用工计划','DEFAULT','wsTask.handlingExpiredEmployment','处理过期用工计划 总共耗时：9毫秒','0','','2023-06-24 11:51:00'),(8,'处理过期用工计划','DEFAULT','wsTask.handlingExpiredEmployment','处理过期用工计划 总共耗时：9毫秒','0','','2023-06-24 11:51:55'),(9,'处理过期用工计划','DEFAULT','wsTask.handlingExpiredEmployment','处理过期用工计划 总共耗时：11毫秒','0','','2023-06-24 11:51:55'),(10,'处理过期用工计划','DEFAULT','wsTask.handlingExpiredEmployment','处理过期用工计划 总共耗时：4毫秒','0','','2023-06-24 11:52:00'),(11,'处理过期用工计划','DEFAULT','wsTask.handlingExpiredEmployment','处理过期用工计划 总共耗时：29毫秒','0','','2023-06-24 11:54:25');
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-21 09:04:49'),(101,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-22 10:03:41'),(102,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-22 21:42:19'),(103,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-22 22:10:11'),(104,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-23 11:15:01'),(105,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-23 13:12:27'),(106,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','1','验证码已失效','2023-06-23 13:56:55'),(107,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-23 13:56:58'),(108,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-23 20:12:37'),(109,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-24 09:22:31'),(110,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-24 19:37:23'),(111,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','1','验证码已失效','2023-06-25 09:47:47'),(112,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','1','验证码错误','2023-06-25 09:47:49'),(113,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-25 09:47:52'),(114,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-26 09:47:39'),(115,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','1','验证码已失效','2023-06-26 20:11:58'),(116,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-26 20:12:01'),(117,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-27 01:42:46'),(118,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-27 12:07:18'),(119,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-06-27 16:58:25'),(120,'ry','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-27 17:06:30'),(121,'ry','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-06-27 19:58:09'),(122,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','1','验证码错误','2023-06-27 19:58:12'),(123,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-27 19:58:15'),(124,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-06-27 19:58:58'),(125,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-27 19:59:01'),(126,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-06-27 19:59:09'),(127,'ry','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-27 19:59:15'),(128,'ry','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-06-27 20:16:40'),(129,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-27 20:16:42'),(130,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-06-27 20:17:21'),(131,'test','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-06-27 20:17:28');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2016 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,3,'system',NULL,'',1,0,'M','0','0','','system','admin','2023-06-21 08:50:56','admin','2023-06-24 20:09:59','系统管理目录'),(2,'系统监控',0,4,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2023-06-21 08:50:56','admin','2023-06-24 20:10:02','系统监控目录'),(3,'系统工具',0,5,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2023-06-21 08:50:56','admin','2023-06-24 20:13:48','系统工具目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2023-06-21 08:50:56','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2023-06-21 08:50:56','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2023-06-21 08:50:56','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2023-06-21 08:50:56','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2023-06-21 08:50:56','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2023-06-21 08:50:56','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2023-06-21 08:50:56','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2023-06-21 08:50:56','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2023-06-21 08:50:56','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2023-06-21 08:50:56','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2023-06-21 08:50:56','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2023-06-21 08:50:56','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2023-06-21 08:50:56','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2023-06-21 08:50:56','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2023-06-21 08:50:56','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2023-06-21 08:50:56','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2023-06-21 08:50:56','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2023-06-21 08:50:56','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2023-06-21 08:50:56','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2023-06-21 08:50:56','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2023-06-21 08:50:56','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2023-06-21 08:50:56','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2023-06-21 08:50:56','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2023-06-21 08:50:56','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2023-06-21 08:50:56','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2023-06-21 08:50:56','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2023-06-21 08:50:56','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2023-06-21 08:50:56','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2023-06-21 08:50:56','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2023-06-21 08:50:56','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2023-06-21 08:50:56','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2023-06-21 08:50:56','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2023-06-21 08:50:56','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2023-06-21 08:50:56','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2023-06-21 08:50:56','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2023-06-21 08:50:56','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2023-06-21 08:50:56','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2023-06-21 08:50:56','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2023-06-21 08:50:56','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2023-06-21 08:50:56','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2023-06-21 08:50:56','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2023-06-21 08:50:56','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2023-06-21 08:50:56','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2023-06-21 08:50:56','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2023-06-21 08:50:56','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2023-06-21 08:50:56','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2023-06-21 08:50:56','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2023-06-21 08:50:56','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2023-06-21 08:50:56','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2023-06-21 08:50:56','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2023-06-21 08:50:56','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2023-06-21 08:50:56','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2023-06-21 08:50:56','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2023-06-21 08:50:56','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2023-06-21 08:50:56','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2023-06-21 08:50:56','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2023-06-21 08:50:56','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2023-06-21 08:50:56','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2023-06-21 08:50:56','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2023-06-21 08:50:56','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2023-06-21 08:50:56','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2023-06-21 08:50:56','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2023-06-21 08:50:57','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2023-06-21 08:50:57','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2023-06-21 08:50:57','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2023-06-21 08:50:57','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2023-06-21 08:50:57','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2023-06-21 08:50:57','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2023-06-21 08:50:57','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2023-06-21 08:50:57','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2023-06-21 08:50:57','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2023-06-21 08:50:57','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2023-06-21 08:50:57','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2023-06-21 08:50:57','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2023-06-21 08:50:57','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2023-06-21 08:50:57','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2023-06-21 08:50:57','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2023-06-21 08:50:57','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2023-06-21 08:50:57','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2023-06-21 08:50:57','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2023-06-21 08:50:57','',NULL,''),(2000,'申请管理',0,1,'apply',NULL,NULL,1,0,'M','0','0',NULL,'skill','admin','2023-06-22 21:52:01','',NULL,''),(2001,'学生申请',2000,1,'student','workstudy/student/index',NULL,1,0,'C','0','0','workstudy:student:list','user','admin','2023-06-22 21:53:43','admin','2023-06-23 11:15:50','学生申请菜单'),(2002,'学生申请查询',2001,1,'#','',NULL,1,0,'F','0','0','workstudy:student:query','#','admin','2023-06-22 21:53:43','',NULL,''),(2003,'学生申请新增',2001,2,'#','',NULL,1,0,'F','0','0','workstudy:student:add','#','admin','2023-06-22 21:53:43','',NULL,''),(2004,'学生申请修改',2001,3,'#','',NULL,1,0,'F','0','0','workstudy:student:edit','#','admin','2023-06-22 21:53:43','',NULL,''),(2005,'学生申请删除',2001,4,'#','',NULL,1,0,'F','0','0','workstudy:student:remove','#','admin','2023-06-22 21:53:43','',NULL,''),(2006,'学生申请导出',2001,5,'#','',NULL,1,0,'F','0','0','workstudy:student:export','#','admin','2023-06-22 21:53:43','',NULL,''),(2007,'用工计划',2000,2,'employment','workstudy/employment/index',NULL,1,0,'C','0','0','workstudy:employment:list','logininfor','admin','2023-06-23 20:45:16','admin','2023-06-23 21:00:44','用工计划菜单'),(2008,'用工计划查询',2007,1,'#','',NULL,1,0,'F','0','0','workstudy:employment:query','#','admin','2023-06-23 20:45:16','',NULL,''),(2009,'用工计划新增',2007,2,'#','',NULL,1,0,'F','0','0','workstudy:employment:add','#','admin','2023-06-23 20:45:16','',NULL,''),(2010,'用工计划修改',2007,3,'#','',NULL,1,0,'F','0','0','workstudy:employment:edit','#','admin','2023-06-23 20:45:16','',NULL,''),(2011,'用工计划删除',2007,4,'#','',NULL,1,0,'F','0','0','workstudy:employment:remove','#','admin','2023-06-23 20:45:16','',NULL,''),(2012,'用工计划导出',2007,5,'#','',NULL,1,0,'F','0','0','workstudy:employment:export','#','admin','2023-06-23 20:45:16','',NULL,''),(2013,'应聘候选',2014,1,'application','workstudy/application/index','',1,0,'C','0','0','','select','admin','2023-06-24 13:57:11','admin','2023-06-24 20:15:24',''),(2014,'应聘管理',0,2,'application',NULL,NULL,1,0,'M','0','0','','documentation','admin','2023-06-24 20:14:22','admin','2023-06-24 20:14:43',''),(2015,'已聘学生',2014,2,'applied','workstudy/applied/index',NULL,1,0,'C','0','0','','people','admin','2023-06-25 14:21:11','admin','2023-06-25 16:31:55','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2023-06-21 08:50:57','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2023-06-21 08:50:57','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"student,employment\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-22 21:44:07',102),(101,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"skill\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"申请管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"apply\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-22 21:52:01',10),(102,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"student\",\"className\":\"Student\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":9,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":10,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Department\",\"columnComment\":\"学院\",\"columnId\":11,\"columnName\":\"department\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"department\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Major\",\"columnComment\":\"专业班级\",\"columnId\":12,\"columnName\":\"major\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"major\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":fa','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-22 21:52:07',34),(103,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"student\",\"className\":\"Student\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":9,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-06-22 21:52:07\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":10,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-06-22 21:52:07\",\"usableColumn\":false},{\"capJavaField\":\"Department\",\"columnComment\":\"学院\",\"columnId\":11,\"columnName\":\"department\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"department\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-06-22 21:52:07\",\"usableColumn\":false},{\"capJavaField\":\"Major\",\"columnComment\":\"专业班级\",\"columnId\":12,\"columnName\":\"major\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-22 21:52:17',47),(104,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"student\"}',NULL,0,NULL,'2023-06-22 21:52:27',60),(105,'字典类型',9,'com.ruoyi.project.system.controller.SysDictTypeController.refreshCache()','DELETE',1,'admin',NULL,'/system/dict/type/refreshCache','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-22 22:10:37',14),(106,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-06-21 08:50:56\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:15:20',13),(107,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-06-21 08:50:56\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:15:23',17),(108,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-06-21 08:50:56\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:15:26',18),(109,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-06-21 08:50:56\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:15:30',18),(110,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"workstudy/student/index\",\"createTime\":\"2023-06-22 21:53:43\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"学生申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"student\",\"perms\":\"workstudy:student:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:15:50',14),(111,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"学院类型\",\"dictType\":\"college_type\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:17:07',16),(112,'字典类型',2,'com.ruoyi.project.system.controller.SysDictTypeController.edit()','PUT',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 11:17:07\",\"dictId\":100,\"dictName\":\"大学学院\",\"dictType\":\"college\",\"params\":{},\"remark\":\"大学学院列表\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:18:28',44),(113,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"电子与信息工程学院\",\"dictSort\":0,\"dictType\":\"college\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:21:59',11),(114,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"数学学院\",\"dictSort\":1,\"dictType\":\"college\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:22:16',12),(115,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 11:21:59\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"电子学院\",\"dictSort\":0,\"dictType\":\"college\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:22:21',17),(116,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"文学院\",\"dictSort\":3,\"dictType\":\"college\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:22:30',10),(117,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 11:22:29\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"文学院\",\"dictSort\":2,\"dictType\":\"college\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:22:34',11),(118,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"department\":\"0\",\"id\":1,\"major\":\"计算机2012\",\"name\":\"张三\",\"params\":{},\"phone\":\"666\",\"sex\":0,\"studentId\":\"1233\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:31:15',22),(119,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"业务是否\",\"dictType\":\"business_yes_no\",\"params\":{},\"remark\":\"业务方面的是否，使用tinyint存储\\n\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:34:06',9),(120,'字典类型',2,'com.ruoyi.project.system.controller.SysDictTypeController.edit()','PUT',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 11:34:06\",\"dictId\":101,\"dictName\":\"业务是否\",\"dictType\":\"business_yes_no\",\"params\":{},\"remark\":\"业务方面的是否\\n\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:34:13',23),(121,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"否\",\"dictSort\":0,\"dictType\":\"business_yes_no\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:34:34',14),(122,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 11:34:34\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"否\",\"dictSort\":0,\"dictType\":\"business_yes_no\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:34:41',10),(123,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 11:34:34\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"否\",\"dictSort\":0,\"dictType\":\"business_yes_no\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:34:46',9),(124,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 11:34:34\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"否\",\"dictSort\":0,\"dictType\":\"business_yes_no\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:34:50',10),(125,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"是\",\"dictSort\":0,\"dictType\":\"business_yes_no\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:35:02',8),(126,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 11:35:02\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"是\",\"dictSort\":0,\"dictType\":\"business_yes_no\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:35:05',12),(127,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 11:35:02\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"是\",\"dictSort\":1,\"dictType\":\"business_yes_no\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:35:11',11),(128,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 11:34:34\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"否\",\"dictSort\":1,\"dictType\":\"business_yes_no\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:39:08',13),(129,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 11:35:02\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"是\",\"dictSort\":0,\"dictType\":\"business_yes_no\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:39:11',11),(130,'学生申请',2,'com.ruoyi.project.workstudy.controller.StudentController.edit()','PUT',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"createdTime\":\"2023-06-23\",\"department\":\"0\",\"id\":1,\"isAssignedAccept\":1,\"isEcoHard\":0,\"major\":\"计算机2012\",\"name\":\"张三\",\"params\":{},\"phone\":\"666\",\"sex\":0,\"status\":0,\"studentId\":\"1233\",\"updatedTime\":\"2023-06-23\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 11:40:15',8),(131,'岗位添加',1,'com.ruoyi.project.workstudy.controller.JobController.add()','POST',1,'admin',NULL,'/workstudy/job','127.0.0.1','内网IP','[\"你好\"]',NULL,0,NULL,'2023-06-23 14:53:19',4),(132,'岗位添加',1,'com.ruoyi.project.workstudy.controller.JobController.add()','POST',1,'admin',NULL,'/workstudy/job','127.0.0.1','内网IP','[\"搬砖\"]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 15:11:38',75),(133,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"department\":\"0\",\"id\":2,\"isAssignedAccept\":1,\"isEcoHard\":1,\"major\":\"计算机2011\",\"name\":\"李四\",\"params\":{},\"phone\":\"666\",\"sex\":0,\"studentId\":\"12345\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 15:11:38',78),(134,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"department\":\"2\",\"isAssignedAccept\":0,\"isEcoHard\":1,\"jobIntentions\":[\"收银员\"],\"name\":\"王武\",\"sex\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 16:14:43',5),(135,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"jobIntentions\":[\"助教\",\"收银员\",\"搬砖\"],\"name\":\"王武\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 16:14:59',0),(136,'岗位添加',1,'com.ruoyi.project.workstudy.controller.JobController.add()','POST',1,'admin',NULL,'/workstudy/job','127.0.0.1','内网IP','[\"测试1\"]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 16:22:07',26),(137,'岗位添加',1,'com.ruoyi.project.workstudy.controller.JobController.add()','POST',1,'admin',NULL,'/workstudy/job','127.0.0.1','内网IP','[\"测试2\"]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 16:25:21',11),(138,'岗位添加',1,'com.ruoyi.project.workstudy.controller.JobController.add()','POST',1,'admin',NULL,'/workstudy/job','127.0.0.1','内网IP','[\"测试3\"]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 16:36:40',8),(139,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"jobIntentions\":[\"6\",\"4\"],\"name\":\"ww \"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 16:37:54',1),(140,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"jobIntentions\":[\"助教\",\"收银员\",\"搬砖\"],\"name\":\"王武\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 16:42:52',0),(141,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"department\":\"0\",\"id\":3,\"isAssignedAccept\":1,\"isEcoHard\":1,\"jobIntentions\":[\"测试1\",\"测试2\"],\"major\":\"电子2012\",\"name\":\"王武\",\"phone\":\"999\",\"sex\":0,\"studentId\":\"666\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 17:17:43',90),(142,'岗位添加',1,'com.ruoyi.project.workstudy.controller.JobController.add()','POST',1,'admin',NULL,'/workstudy/job','127.0.0.1','内网IP','[\"测试4\"]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 17:19:19',17),(143,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"department\":\"2\",\"id\":4,\"isAssignedAccept\":0,\"isEcoHard\":0,\"jobIntentions\":[\"助教\",\"测试4\"],\"major\":\"汉语言2012\",\"name\":\"刘六\",\"phone\":\"5678\",\"sex\":0,\"studentId\":\"4321\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 17:19:19',16),(144,'学生申请',2,'com.ruoyi.project.workstudy.controller.StudentController.edit()','PUT',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"createdTime\":\"2023-06-23\",\"department\":\"2\",\"id\":4,\"isAssignedAccept\":0,\"isEcoHard\":0,\"jobIntentions\":[\"助教\",\"测试4\",\"测试3\"],\"major\":\"汉语言2012\",\"name\":\"刘六\",\"phone\":\"5678\",\"sex\":0,\"status\":0,\"studentId\":\"4321\",\"updatedTime\":\"2023-06-23\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 17:22:15',6),(145,'学生申请',2,'com.ruoyi.project.workstudy.controller.StudentController.edit()','PUT',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"createdTime\":\"2023-06-23\",\"department\":\"0\",\"id\":1,\"isAssignedAccept\":1,\"isEcoHard\":0,\"jobIntentions\":[\"助教\",\"搬砖\"],\"major\":\"计算机2012\",\"name\":\"张三\",\"phone\":\"666\",\"sex\":0,\"status\":0,\"studentId\":\"1233\",\"updatedTime\":\"2023-06-23\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:12:52',57),(146,'学生申请',2,'com.ruoyi.project.workstudy.controller.StudentController.edit()','PUT',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"createdTime\":\"2023-06-23\",\"department\":\"0\",\"id\":1,\"isAssignedAccept\":1,\"isEcoHard\":0,\"jobIntentions\":[\"助教\",\"搬砖\",\"收银员\"],\"major\":\"计算机2012\",\"name\":\"张三\",\"phone\":\"666\",\"sex\":0,\"status\":0,\"studentId\":\"1233\",\"updatedTime\":\"2023-06-23\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:13:04',28),(147,'岗位添加',1,'com.ruoyi.project.workstudy.controller.JobController.add()','POST',1,'admin',NULL,'/workstudy/job','127.0.0.1','内网IP','[\"测试5\"]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:13:18',7),(148,'学生申请',2,'com.ruoyi.project.workstudy.controller.StudentController.edit()','PUT',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"createdTime\":\"2023-06-23\",\"department\":\"0\",\"id\":2,\"isAssignedAccept\":1,\"isEcoHard\":1,\"jobIntentions\":[\"搬砖\",\"测试5\"],\"major\":\"计算机2011\",\"name\":\"李四\",\"phone\":\"666\",\"sex\":0,\"status\":0,\"studentId\":\"12345\",\"updatedTime\":\"2023-06-23\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:13:18',22),(149,'学生申请',2,'com.ruoyi.project.workstudy.controller.StudentController.edit()','PUT',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"createdTime\":\"2023-06-23\",\"department\":\"0\",\"id\":3,\"isAssignedAccept\":1,\"isEcoHard\":1,\"jobIntentions\":[\"测试1\",\"测试2\"],\"major\":\"电子2012\",\"name\":\"王武\",\"phone\":\"999\",\"sex\":1,\"status\":0,\"studentId\":\"666\",\"updatedTime\":\"2023-06-23\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:29:08',43),(150,'学生申请',2,'com.ruoyi.project.workstudy.controller.StudentController.edit()','PUT',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"createdTime\":\"2023-06-23\",\"department\":\"2\",\"id\":4,\"isAssignedAccept\":0,\"isEcoHard\":1,\"jobIntentions\":[\"助教\",\"测试4\"],\"major\":\"汉语言2012\",\"name\":\"刘六\",\"phone\":\"5678\",\"sex\":0,\"status\":0,\"studentId\":\"4321\",\"updatedTime\":\"2023-06-23\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:29:11',24),(151,'学生申请',2,'com.ruoyi.project.workstudy.controller.StudentController.edit()','PUT',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"createdTime\":\"2023-06-23\",\"department\":\"0\",\"id\":2,\"isAssignedAccept\":0,\"isEcoHard\":1,\"jobIntentions\":[\"搬砖\",\"测试5\"],\"major\":\"计算机2011\",\"name\":\"李四\",\"phone\":\"666\",\"sex\":0,\"status\":0,\"studentId\":\"12345\",\"updatedTime\":\"2023-06-23\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:29:15',14),(152,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"业务是否生效\",\"dictType\":\"business_effective\",\"params\":{},\"remark\":\"业务生效列表\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:38:23',9),(153,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"生效\",\"dictSort\":0,\"dictType\":\"business_effective\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:38:56',15),(154,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"失效\",\"dictSort\":0,\"dictType\":\"business_effective\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:40:23',13),(155,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 20:38:56\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"生效\",\"dictSort\":0,\"dictType\":\"business_effective\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:40:32',14),(156,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 20:38:56\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"生效\",\"dictSort\":0,\"dictType\":\"business_effective\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:40:37',12),(157,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 20:40:22\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"失效\",\"dictSort\":0,\"dictType\":\"business_effective\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:40:43',12),(158,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 20:38:56\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"生效\",\"dictSort\":0,\"dictType\":\"business_effective\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:40:46',11),(159,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"employment\",\"className\":\"Employment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Department\",\"columnComment\":\"部门\",\"columnId\":2,\"columnName\":\"department\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"department\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"内容\",\"columnId\":3,\"columnName\":\"content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":4,\"columnName\":\"start_time\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"q','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:42:17',34),(160,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"employment\",\"className\":\"Employment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-06-23 20:42:17\",\"usableColumn\":false},{\"capJavaField\":\"Department\",\"columnComment\":\"部门\",\"columnId\":2,\"columnName\":\"department\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"department\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-06-23 20:42:17\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"内容\",\"columnId\":3,\"columnName\":\"content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-06-23 20:42:17\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":4,\"columnName\":\"start_time\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2023-06-22 21:44:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 20:43:57',37),(161,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"employment\"}',NULL,0,NULL,'2023-06-23 20:44:00',113),(162,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"workstudy/employment/index\",\"createTime\":\"2023-06-23 20:45:16\",\"icon\":\"logininfor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"用工计划\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"employment\",\"perms\":\"workstudy:employment:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 21:00:44',24),(163,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-06-23 20:40:22\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"失效\",\"dictSort\":1,\"dictType\":\"business_effective\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 21:24:08',16),(164,'用工计划',1,'com.ruoyi.project.workstudy.controller.EmploymentController.add()','POST',1,'admin',NULL,'/workstudy/employment','127.0.0.1','内网IP','{\"content\":\"好好好\",\"department\":\"后勤部门\",\"endTime\":\"2023-06-30\",\"id\":1,\"startTime\":\"2023-06-23\",\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-23 21:26:27',19),(165,'用工计划',1,'com.ruoyi.project.workstudy.controller.EmploymentController.add()','POST',1,'admin',NULL,'/workstudy/employment','127.0.0.1','内网IP','{\"content\":\"2\",\"department\":\"3\",\"employmentJobs\":[{\"jobName\":\"助教\",\"limitNumber\":4},{\"jobName\":\"搬砖\",\"limitNumber\":1}],\"endTime\":\"2023-06-30\",\"startTime\":\"2023-06-12\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 10:24:45',9),(166,'用工计划',1,'com.ruoyi.project.workstudy.controller.EmploymentController.add()','POST',1,'admin',NULL,'/workstudy/employment','127.0.0.1','内网IP','{\"content\":\"测试\",\"department\":\"测试部门\",\"employmentJobs\":[{\"employmentId\":2,\"id\":3,\"jobId\":4,\"jobName\":\"测试1\",\"limitNumber\":5},{\"employmentId\":2,\"id\":4,\"jobId\":5,\"jobName\":\"测试2\",\"limitNumber\":3},{\"employmentId\":2,\"id\":5,\"jobId\":6,\"jobName\":\"测试3\",\"limitNumber\":2}],\"endTime\":\"2023-06-30\",\"id\":2,\"startTime\":\"2023-06-16\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:03:26',96),(167,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.edit()','PUT',1,'admin',NULL,'/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-06-21 08:50:57\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"ryTask.ryNoParams\",\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"jobName\":\"系统默认（无参）\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-06-24 11:23:50\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:23:49',31),(168,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.edit()','PUT',1,'admin',NULL,'/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-06-21 08:50:57\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"ryTask.ryNoParams\",\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"jobName\":\"系统默认（无参）\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-06-24 11:24:35\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:24:33',21),(169,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:24:37',18),(170,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:24:53',18),(171,'定时任务',1,'com.ruoyi.project.monitor.controller.SysJobController.add()','POST',1,'admin',NULL,'/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"cronExpression\":\"0 0 0 * * ?\",\"invokeTarget\":\"wsTask.handlingExpiredEmployment\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"处理过期用工\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-06-25 00:00:00\",\"params\":{},\"status\":\"0\"}',NULL,1,'No bean named \'wsTask\' available','2023-06-24 11:32:05',2),(172,'定时任务',1,'com.ruoyi.project.monitor.controller.SysJobController.add()','POST',1,'admin',NULL,'/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0 0 0 * * ?\",\"invokeTarget\":\"wsTask.handlingExpiredEmployment\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"处理过期用工\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-06-25 00:00:00\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:32:30',63),(173,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.edit()','PUT',1,'admin',NULL,'/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 11:32:30\",\"cronExpression\":\"0 0 0 * * ?\",\"invokeTarget\":\"wsTask.handlingExpiredEmployment\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"处理过期用工计划\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-06-25 00:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:32:48',41),(174,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.edit()','PUT',1,'admin',NULL,'/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 11:32:30\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"wsTask.handlingExpiredEmployment\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"处理过期用工计划\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-06-25 01:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:37:49',22),(175,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.edit()','PUT',1,'admin',NULL,'/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 11:32:30\",\"cronExpression\":\"0 0/1 * * * ?\",\"invokeTarget\":\"wsTask.handlingExpiredEmployment\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"处理过期用工计划\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-06-24 11:48:00\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:47:24',26),(176,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:47:26',19),(177,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:47:40',29),(178,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.edit()','PUT',1,'admin',NULL,'/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 11:32:30\",\"cronExpression\":\"0 0/1 * * * ?\",\"invokeTarget\":\"wsTask.handlingExpiredEmployment\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"处理过期用工计划\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-06-24 11:48:00\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:47:45',19),(179,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:47:56',46),(180,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:48:05',18),(181,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:49:22',46),(182,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:49:59',21),(183,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.edit()','PUT',1,'admin',NULL,'/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 11:32:30\",\"cronExpression\":\"0/20 * * * * ?\",\"invokeTarget\":\"wsTask.handlingExpiredEmployment\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"处理过期用工计划\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-06-24 11:50:40\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:50:22',21),(184,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:50:24',18),(185,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:51:05',21),(186,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:51:55',18),(187,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:52:03',19),(188,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:54:25',46),(189,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:54:33',22),(190,'定时任务',2,'com.ruoyi.project.monitor.controller.SysJobController.edit()','PUT',1,'admin',NULL,'/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 11:32:30\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"wsTask.handlingExpiredEmployment\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"处理过期用工计划\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-06-25 01:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 11:54:43',21),(191,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"select\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"应聘候选\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"workstudy/application\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 13:57:11',12),(192,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"workstudy/application/index\",\"createTime\":\"2023-06-24 13:57:11\",\"icon\":\"select\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"应聘候选\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"application\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 13:57:54',16),(193,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"department\":\"0\",\"id\":5,\"isAssignedAccept\":0,\"isEcoHard\":0,\"jobIntentions\":[\"搬砖\",\"测试2\"],\"major\":\"计算机2011\",\"name\":\"栾七\",\"phone\":\"7777\",\"score\":null,\"sex\":0,\"studentId\":\"777777\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 16:18:22',89),(194,'学生申请',2,'com.ruoyi.project.workstudy.controller.StudentController.edit()','PUT',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"createdTime\":\"2023-06-24\",\"department\":\"0\",\"id\":5,\"isAssignedAccept\":1,\"isEcoHard\":0,\"jobIntentions\":[\"搬砖\",\"测试2\"],\"major\":\"计算机2011\",\"name\":\"栾七\",\"phone\":\"7777\",\"score\":null,\"sex\":0,\"status\":0,\"studentId\":\"777777\",\"updatedTime\":\"2023-06-24\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 16:18:42',43),(195,'代码生成',6,'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"application\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 19:58:16',86),(196,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"application\",\"className\":\"Application\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 19:58:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生id\",\"columnId\":22,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 19:58:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EmploymentId\",\"columnComment\":\"用工计划id\",\"columnId\":23,\"columnName\":\"employment_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 19:58:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"employmentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreatedTime\",\"columnComment\":\"创建时间\",\"columnId\":24,\"columnName\":\"created_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 19:58:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"createdTime\",\"javaType\":\"Date\",\"list\":fal','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 20:03:49',33),(197,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-06-21 08:50:56\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 20:09:59',15),(198,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-06-21 08:50:56\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 20:10:02',13),(199,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-06-21 08:50:56\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 20:13:48',14),(200,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-06-21 08:50:56\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 20:13:50',8),(201,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"应聘管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/apply\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 20:14:22',15),(202,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-06-24 20:14:22\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"应聘管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"application\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 20:14:43',15),(203,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"workstudy/application/index\",\"createTime\":\"2023-06-24 13:57:11\",\"icon\":\"select\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"应聘候选\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2014,\"path\":\"application\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 20:15:14',14),(204,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"workstudy/application/index\",\"createTime\":\"2023-06-24 13:57:11\",\"icon\":\"select\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"应聘候选\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2014,\"path\":\"application\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-24 20:15:24',12),(205,'应聘信息',1,'com.ruoyi.project.workstudy.controller.ApplicationController.add()','POST',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":1000.0,\"employmentId\":1,\"endTime\":\"2023-10-13 00:00:00\",\"hours\":3,\"jobId\":1,\"performanceSalary\":500.0,\"startTime\":\"2023-06-23 00:00:00\",\"studentId\":4}',NULL,0,NULL,'2023-06-24 20:36:15',14),(206,'应聘信息',1,'com.ruoyi.project.workstudy.controller.ApplicationController.add()','POST',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":700.0,\"employmentId\":1,\"endTime\":\"2023-06-06 00:00:00\",\"hours\":4,\"id\":1672586223006265346,\"jobId\":1,\"performanceSalary\":400.0,\"startTime\":\"2023-06-05 00:00:00\",\"studentId\":4}',NULL,1,'\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n### The error may exist in com/ruoyi/project/workstudy/mapper/ApplicationMapper.java (best guess)\n### The error may involve com.ruoyi.project.workstudy.mapper.ApplicationMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO application  ( id, student_id, employment_id, job_id,   start_time, end_time, hours, base_salary, performance_salary )  VALUES  ( ?, ?, ?, ?,   ?, ?, ?, ?, ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1','2023-06-24 20:43:25',92),(207,'应聘信息',1,'com.ruoyi.project.workstudy.controller.ApplicationController.add()','POST',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":700.0,\"employmentId\":1,\"endTime\":\"2023-06-06 00:00:00\",\"hours\":4,\"id\":1,\"jobId\":1,\"performanceSalary\":400.0,\"startTime\":\"2023-06-05 00:00:00\",\"studentId\":4}','{\"msg\":\"操作成功\",\"code\":200,\"data\":1}',0,NULL,'2023-06-24 20:55:04',133),(208,'应聘信息',1,'com.ruoyi.project.workstudy.controller.ApplicationController.add()','POST',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":600.0,\"employmentId\":1,\"endTime\":\"2023-06-29 00:00:00\",\"hours\":2,\"id\":2,\"jobId\":1,\"performanceSalary\":300.0,\"startTime\":\"2023-06-10 00:00:00\",\"studentId\":4}','{\"msg\":\"操作成功\",\"code\":200,\"data\":2}',0,NULL,'2023-06-24 21:03:53',130),(209,'应聘信息',1,'com.ruoyi.project.workstudy.controller.ApplicationController.add()','POST',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":500.0,\"employmentId\":1,\"endTime\":\"2023-07-30 00:00:00\",\"hours\":3,\"id\":3,\"jobId\":1,\"performanceSalary\":200.0,\"startTime\":\"2023-06-25 00:00:00\",\"studentId\":1}','{\"msg\":\"操作成功\",\"code\":200,\"data\":3}',0,NULL,'2023-06-25 13:45:42',162),(210,'应聘信息',1,'com.ruoyi.project.workstudy.controller.ApplicationController.add()','POST',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":300.0,\"employmentId\":1,\"endTime\":\"2023-08-01 00:00:00\",\"hours\":3,\"id\":4,\"jobId\":1,\"performanceSalary\":100.0,\"startTime\":\"2023-06-01 00:00:00\",\"studentId\":3}','{\"msg\":\"操作成功\",\"code\":200,\"data\":4}',0,NULL,'2023-06-25 14:00:45',167),(211,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"应聘学生\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2014,\"path\":\"applied\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-25 14:21:11',19),(212,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"workstudy/applied/index\",\"createTime\":\"2023-06-25 14:21:11\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"应聘学生\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2014,\"path\":\"applied\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-25 14:21:27',21),(213,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"application\",\"className\":\"Application\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 19:58:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isQuery\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-06-24 20:03:49\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生id\",\"columnId\":22,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 19:58:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-06-24 20:03:49\",\"usableColumn\":false},{\"capJavaField\":\"EmploymentId\",\"columnComment\":\"用工计划id\",\"columnId\":23,\"columnName\":\"employment_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 19:58:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"employmentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-06-24 20:03:49\",\"usableColumn\":false},{\"capJavaField\":\"CreatedTime\",\"columnComment\":\"创建时间\",\"columnId\":24,\"columnName\":\"created_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-06-24 19:58:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-25 16:20:59',55),(214,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"workstudy/applied/index\",\"createTime\":\"2023-06-25 14:21:11\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"已聘学生\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2014,\"path\":\"applied\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-25 16:31:55',16),(215,'学生申请',2,'com.ruoyi.project.workstudy.controller.StudentController.edit()','PUT',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"createdTime\":\"2023-06-24\",\"department\":\"0\",\"id\":5,\"isAssignedAccept\":1,\"isEcoHard\":0,\"jobIntentions\":[\"搬砖\",\"测试2\",\"收银员\"],\"major\":\"计算机2011\",\"name\":\"乱七\",\"phone\":\"7777\",\"score\":null,\"sex\":0,\"status\":0,\"studentId\":\"777777\",\"updatedTime\":\"2023-06-24\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-25 16:56:32',130),(216,'应聘信息',1,'com.ruoyi.project.workstudy.controller.ApplicationController.add()','POST',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":400.0,\"employmentId\":1,\"endTime\":\"2023-08-01 00:00:00\",\"hours\":2,\"id\":5,\"jobId\":2,\"performanceSalary\":100.0,\"startTime\":\"2023-06-01 00:00:00\",\"studentId\":5}','{\"msg\":\"操作成功\",\"code\":200,\"data\":5}',0,NULL,'2023-06-25 16:58:06',48),(217,'代码生成',6,'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"assessment\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-25 21:01:15',148),(218,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"assessment\",\"className\":\"Assessment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":33,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-25 21:01:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Year\",\"columnComment\":\"年份\",\"columnId\":34,\"columnName\":\"year\",\"columnType\":\"varchar(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-25 21:01:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"year\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Month\",\"columnComment\":\"月份\",\"columnId\":35,\"columnName\":\"month\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-25 21:01:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"month\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ApplicationId\",\"columnComment\":\"合同id\",\"columnId\":36,\"columnName\":\"applicationId\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-25 21:01:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"applicationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"que','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-25 21:02:25',42),(219,'考核',1,'com.ruoyi.project.workstudy.controller.AssessmentController.add()','POST',1,'admin',NULL,'/workstudy/assessment','127.0.0.1','内网IP','{\"applicationId\":2,\"assignedCompletionScore\":20,\"collaborativeAbilityScore\":20,\"id\":1673166316346806273,\"month\":\"06\",\"techRequireScore\":25,\"totalScore\":100,\"workErrorScore\":20,\"workingAttitudeScore\":15,\"year\":\"2023\"}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'application_id\' in \'field list\'\n### The error may exist in com/ruoyi/project/workstudy/mapper/AssessmentMapper.java (best guess)\n### The error may involve com.ruoyi.project.workstudy.mapper.AssessmentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO assessment  ( id, year, month, application_id,   tech_require_score, work_error_score, collaborative_ability_score, assigned_completion_score, working_attitude_score, total_score )  VALUES  ( ?, ?, ?, ?,   ?, ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'application_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'application_id\' in \'field list\'','2023-06-26 11:08:30',101),(220,'考核',1,'com.ruoyi.project.workstudy.controller.AssessmentController.add()','POST',1,'admin',NULL,'/workstudy/assessment','127.0.0.1','内网IP','{\"applicationId\":2,\"assignedCompletionScore\":20,\"collaborativeAbilityScore\":20,\"id\":1673166780945666049,\"month\":\"06\",\"techRequireScore\":25,\"totalScore\":100,\"workErrorScore\":20,\"workingAttitudeScore\":15,\"year\":\"2023\"}',NULL,1,'\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n### The error may exist in com/ruoyi/project/workstudy/mapper/AssessmentMapper.java (best guess)\n### The error may involve com.ruoyi.project.workstudy.mapper.AssessmentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO assessment  ( id, year, month, application_id,   tech_require_score, work_error_score, collaborative_ability_score, assigned_completion_score, working_attitude_score, total_score )  VALUES  ( ?, ?, ?, ?,   ?, ?, ?, ?, ?, ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1','2023-06-26 11:10:21',30),(221,'考核',1,'com.ruoyi.project.workstudy.controller.AssessmentController.add()','POST',1,'admin',NULL,'/workstudy/assessment','127.0.0.1','内网IP','{\"applicationId\":2,\"assignedCompletionScore\":20,\"collaborativeAbilityScore\":20,\"id\":1673167111180029954,\"month\":\"07\",\"techRequireScore\":25,\"totalScore\":100,\"workErrorScore\":20,\"workingAttitudeScore\":15,\"year\":\"2023\"}',NULL,1,'\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n### The error may exist in com/ruoyi/project/workstudy/mapper/AssessmentMapper.java (best guess)\n### The error may involve com.ruoyi.project.workstudy.mapper.AssessmentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO assessment  ( id, year, month, application_id,   tech_require_score, work_error_score, collaborative_ability_score, assigned_completion_score, working_attitude_score, total_score )  VALUES  ( ?, ?, ?, ?,   ?, ?, ?, ?, ?, ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1','2023-06-26 11:11:40',104),(222,'考核',1,'com.ruoyi.project.workstudy.controller.AssessmentController.add()','POST',1,'admin',NULL,'/workstudy/assessment','127.0.0.1','内网IP','{\"applicationId\":2,\"assignedCompletionScore\":20,\"collaborativeAbilityScore\":20,\"id\":1,\"month\":\"07\",\"techRequireScore\":25,\"totalScore\":100,\"workErrorScore\":20,\"workingAttitudeScore\":15,\"year\":\"2023\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-26 11:12:38',62),(223,'导出考核表',5,'com.ruoyi.project.workstudy.controller.AssessmentController.export()','POST',1,'admin',NULL,'/workstudy/assessment/export','127.0.0.1','内网IP','{\"updatedTime\":\"2023-06-26T11:12:38.000+08:00\",\"month\":\"07\",\"techRequireScore\":\"25\",\"year\":\"2023\",\"workingAttitudeScore\":\"15\",\"createdTime\":\"2023-06-26T11:12:38.000+08:00\",\"workErrorScore\":\"20\",\"id\":\"1\",\"applicationId\":\"2\",\"collaborativeAbilityScore\":\"20\",\"totalScore\":\"100\",\"assignedCompletionScore\":\"20\"}',NULL,0,NULL,'2023-06-26 11:26:52',10),(224,'导出考核表',5,'com.ruoyi.project.workstudy.controller.AssessmentController.export()','POST',1,'admin',NULL,'/workstudy/assessment/export','127.0.0.1','内网IP','{\"updatedTime\":\"2023-06-26T11:12:38.000+08:00\",\"month\":\"07\",\"techRequireScore\":\"25\",\"year\":\"2023\",\"workingAttitudeScore\":\"15\",\"createdTime\":\"2023-06-26T11:12:38.000+08:00\",\"workErrorScore\":\"20\",\"id\":\"1\",\"applicationId\":\"2\",\"collaborativeAbilityScore\":\"20\",\"totalScore\":\"100\",\"assignedCompletionScore\":\"20\"}',NULL,1,'Copy template failure.','2023-06-26 14:08:55',29),(225,'导出考核表',5,'com.ruoyi.project.workstudy.controller.AssessmentController.export()','POST',1,'admin',NULL,'/workstudy/assessment/export','127.0.0.1','内网IP','{\"updatedTime\":\"2023-06-26T11:12:38.000+08:00\",\"month\":\"07\",\"techRequireScore\":\"25\",\"year\":\"2023\",\"workingAttitudeScore\":\"15\",\"createdTime\":\"2023-06-26T11:12:38.000+08:00\",\"workErrorScore\":\"20\",\"id\":\"1\",\"applicationId\":\"2\",\"collaborativeAbilityScore\":\"20\",\"totalScore\":\"100\",\"assignedCompletionScore\":\"20\"}',NULL,1,'Copy template failure.','2023-06-26 14:18:31',1),(226,'导出考核表',5,'com.ruoyi.project.workstudy.controller.AssessmentController.export()','POST',1,'admin',NULL,'/workstudy/assessment/export','127.0.0.1','内网IP','{\"updatedTime\":\"2023-06-26T11:12:38.000+08:00\",\"month\":\"07\",\"techRequireScore\":\"25\",\"year\":\"2023\",\"workingAttitudeScore\":\"15\",\"createdTime\":\"2023-06-26T11:12:38.000+08:00\",\"workErrorScore\":\"20\",\"id\":\"1\",\"applicationId\":\"2\",\"collaborativeAbilityScore\":\"20\",\"totalScore\":\"100\",\"assignedCompletionScore\":\"20\"}',NULL,0,NULL,'2023-06-26 14:23:14',1467),(227,'考核',1,'com.ruoyi.project.workstudy.controller.AssessmentController.add()','POST',1,'admin',NULL,'/workstudy/assessment','127.0.0.1','内网IP','{\"applicationId\":2,\"assignedCompletionScore\":17,\"collaborativeAbilityScore\":18,\"id\":2,\"month\":\"06\",\"techRequireScore\":23,\"totalScore\":88,\"workErrorScore\":18,\"workingAttitudeScore\":12,\"year\":\"2023\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-26 14:26:50',34),(228,'导出考核表',5,'com.ruoyi.project.workstudy.controller.AssessmentController.export()','POST',1,'admin',NULL,'/workstudy/assessment/export','127.0.0.1','内网IP','{\"updatedTime\":\"2023-06-26T14:26:50.000+08:00\",\"month\":\"06\",\"techRequireScore\":\"23\",\"year\":\"2023\",\"workingAttitudeScore\":\"12\",\"createdTime\":\"2023-06-26T14:26:50.000+08:00\",\"workErrorScore\":\"18\",\"id\":\"2\",\"applicationId\":\"2\",\"collaborativeAbilityScore\":\"18\",\"totalScore\":\"88\",\"assignedCompletionScore\":\"17\"}',NULL,0,NULL,'2023-06-26 14:26:52',55),(229,'导出考核表',5,'com.ruoyi.project.workstudy.controller.AssessmentController.export()','POST',1,'admin',NULL,'/workstudy/assessment/export','127.0.0.1','内网IP','{\"updatedTime\":\"2023-06-26T14:26:50.000+08:00\",\"month\":\"06\",\"techRequireScore\":\"23\",\"year\":\"2023\",\"workingAttitudeScore\":\"12\",\"createdTime\":\"2023-06-26T14:26:50.000+08:00\",\"workErrorScore\":\"18\",\"id\":\"2\",\"applicationId\":\"2\",\"collaborativeAbilityScore\":\"18\",\"totalScore\":\"88\",\"assignedCompletionScore\":\"17\"}',NULL,0,NULL,'2023-06-26 14:27:45',36),(230,'导出考核表',5,'com.ruoyi.project.workstudy.controller.AssessmentController.export()','POST',1,'admin',NULL,'/workstudy/assessment/export','127.0.0.1','内网IP','{\"updatedTime\":\"2023-06-26T11:12:38.000+08:00\",\"month\":\"07\",\"techRequireScore\":\"25\",\"year\":\"2023\",\"workingAttitudeScore\":\"15\",\"createdTime\":\"2023-06-26T11:12:38.000+08:00\",\"workErrorScore\":\"20\",\"id\":\"1\",\"applicationId\":\"2\",\"collaborativeAbilityScore\":\"20\",\"totalScore\":\"100\",\"assignedCompletionScore\":\"20\"}',NULL,0,NULL,'2023-06-26 14:28:09',698),(231,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2023-06-26 15:39:17',5),(232,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2023-06-26 15:39:51',1),(233,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2023-06-26 15:40:39',1),(234,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"jobId\":\"1\",\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"employmentId\":\"1\",\"chooseJob[1]\":\"1\",\"pageNum\":\"1\",\"chooseJob[0]\":\"1\",\"status\":\"1\"}',NULL,0,NULL,'2023-06-26 15:40:45',1),(235,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2023-06-26 15:58:01',0),(236,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"jobId\":\"1\",\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"employmentId\":\"1\",\"chooseJob[1]\":\"1\",\"pageNum\":\"1\",\"chooseJob[0]\":\"1\"}',NULL,0,NULL,'2023-06-26 15:58:09',0),(237,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"month\":\"06\",\"totalNum\":\"4\",\"year\":\"2023\",\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2023-06-26 16:00:44',1),(238,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"month\":\"06\",\"totalNum\":\"4\",\"year\":\"2023\",\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2023-06-26 16:01:30',5),(239,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"department\":\"0\",\"id\":6,\"isAssignedAccept\":1,\"isEcoHard\":1,\"jobIntentions\":[\"助教\",\"收银员\",\"搬砖\"],\"major\":\"电子2012\",\"name\":\"许八\",\"phone\":\"1388888\",\"score\":null,\"sex\":0,\"studentId\":\"8888\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-26 17:01:46',60),(240,'应聘信息',1,'com.ruoyi.project.workstudy.controller.ApplicationController.add()','POST',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":200.0,\"employmentId\":1,\"endTime\":\"2023-09-26 00:00:00\",\"hours\":4,\"id\":6,\"jobId\":1,\"performanceSalary\":200.0,\"startTime\":\"2023-06-26 00:00:00\",\"studentId\":6}','{\"msg\":\"操作成功\",\"code\":200,\"data\":6}',0,NULL,'2023-06-26 20:21:01',68),(241,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"department\":\"1\",\"id\":7,\"isAssignedAccept\":1,\"isEcoHard\":1,\"jobIntentions\":[\"助教\",\"测试1\",\"测试2\"],\"major\":\"数学2011\",\"name\":\"测试1\",\"phone\":\"1381111\",\"score\":null,\"sex\":1,\"studentId\":\"111\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-26 20:22:07',93),(242,'应聘信息',1,'com.ruoyi.project.workstudy.controller.ApplicationController.add()','POST',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":400.0,\"employmentId\":2,\"endTime\":\"2024-06-30 00:00:00\",\"hours\":3,\"id\":7,\"jobId\":4,\"performanceSalary\":100.0,\"standardDays\":22,\"startTime\":\"2023-06-30 00:00:00\",\"studentId\":7}','{\"msg\":\"操作成功\",\"code\":200,\"data\":7}',0,NULL,'2023-06-26 20:25:29',130),(243,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"department\":\"0\",\"id\":8,\"isAssignedAccept\":1,\"isEcoHard\":1,\"jobIntentions\":[\"助教\",\"收银员\",\"搬砖\",\"测试1\"],\"major\":\"通信2012\",\"name\":\"测试学生2\",\"phone\":\"12382222\",\"score\":null,\"sex\":1,\"studentId\":\"cs2222\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-26 20:27:05',100),(244,'应聘信息',1,'com.ruoyi.project.workstudy.controller.ApplicationController.add()','POST',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":400.0,\"employmentId\":2,\"endTime\":\"2023-09-30 00:00:00\",\"hours\":4,\"id\":8,\"jobId\":4,\"performanceSalary\":200.0,\"standardDays\":20,\"startTime\":\"2023-06-30 00:00:00\",\"studentId\":8}','{\"msg\":\"操作成功\",\"code\":200,\"data\":8}',0,NULL,'2023-06-26 20:27:29',60),(245,'考核',1,'com.ruoyi.project.workstudy.controller.AssessmentController.add()','POST',1,'admin',NULL,'/workstudy/assessment','127.0.0.1','内网IP','{\"applicationId\":2,\"assignedCompletionScore\":19,\"collaborativeAbilityScore\":20,\"days\":20,\"id\":3,\"month\":\"05\",\"techRequireScore\":23,\"totalScore\":95,\"workErrorScore\":20,\"workingAttitudeScore\":13,\"year\":\"2023\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-26 20:46:39',76),(246,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2023-06-26 21:14:23',1625),(247,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2023-06-26 21:16:24',655),(248,'考核',1,'com.ruoyi.project.workstudy.controller.AssessmentController.add()','POST',1,'admin',NULL,'/workstudy/assessment','127.0.0.1','内网IP','{\"applicationId\":3,\"assignedCompletionScore\":19,\"collaborativeAbilityScore\":19,\"days\":20,\"id\":4,\"month\":\"06\",\"techRequireScore\":23,\"totalScore\":96,\"workErrorScore\":20,\"workingAttitudeScore\":15,\"year\":\"2023\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-26 22:04:05',71),(249,'考核',1,'com.ruoyi.project.workstudy.controller.AssessmentController.add()','POST',1,'admin',NULL,'/workstudy/assessment','127.0.0.1','内网IP','{\"applicationId\":5,\"assignedCompletionScore\":19,\"collaborativeAbilityScore\":18,\"days\":18,\"id\":5,\"month\":\"06\",\"techRequireScore\":22,\"totalScore\":90,\"workErrorScore\":18,\"workingAttitudeScore\":13,\"year\":\"2023\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-26 22:15:32',74),(250,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"jobId\":\"2\",\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"employmentId\":\"1\",\"chooseJob[1]\":\"2\",\"pageNum\":\"1\",\"chooseJob[0]\":\"1\"}',NULL,0,NULL,'2023-06-26 22:17:59',1534),(251,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"jobId\":\"2\",\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"employmentId\":\"1\",\"chooseJob[1]\":\"2\",\"pageNum\":\"1\",\"chooseJob[0]\":\"1\"}',NULL,0,NULL,'2023-06-26 22:19:22',693),(252,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"jobId\":\"2\",\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"employmentId\":\"1\",\"chooseJob[1]\":\"2\",\"pageNum\":\"1\",\"chooseJob[0]\":\"1\"}',NULL,0,NULL,'2023-06-26 22:21:51',669),(253,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"jobId\":\"2\",\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"employmentId\":\"1\",\"chooseJob[1]\":\"2\",\"pageNum\":\"1\",\"chooseJob[0]\":\"1\"}',NULL,0,NULL,'2023-06-26 22:25:25',701),(254,'考核',1,'com.ruoyi.project.workstudy.controller.AssessmentController.add()','POST',1,'admin',NULL,'/workstudy/assessment','127.0.0.1','内网IP','{\"applicationId\":7,\"assignedCompletionScore\":20,\"collaborativeAbilityScore\":19,\"days\":20,\"id\":6,\"month\":\"06\",\"techRequireScore\":24,\"totalScore\":98,\"workErrorScore\":20,\"workingAttitudeScore\":15,\"year\":\"2023\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-26 23:28:32',75),(255,'考核',1,'com.ruoyi.project.workstudy.controller.AssessmentController.add()','POST',1,'admin',NULL,'/workstudy/assessment','127.0.0.1','内网IP','{\"applicationId\":8,\"assignedCompletionScore\":18,\"collaborativeAbilityScore\":18,\"days\":15,\"id\":7,\"month\":\"06\",\"techRequireScore\":20,\"totalScore\":86,\"workErrorScore\":15,\"workingAttitudeScore\":15,\"year\":\"2023\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-26 23:28:51',12),(256,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"jobId\":\"4\",\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"employmentId\":\"2\",\"chooseJob[1]\":\"4\",\"pageNum\":\"1\",\"chooseJob[0]\":\"2\"}',NULL,0,NULL,'2023-06-26 23:28:56',1001),(257,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'admin',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"department\":\"0\",\"id\":9,\"isAssignedAccept\":1,\"isEcoHard\":1,\"jobIntentions\":[\"收银员\",\"助教\"],\"major\":\"计算机2011\",\"name\":\"测试学生3\",\"phone\":\"13833333\",\"score\":null,\"sex\":1,\"studentId\":\"cs333\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-27 01:53:48',64),(258,'终止合同',2,'com.ruoyi.project.workstudy.controller.ApplicationController.terminate()','PUT',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":null,\"id\":7,\"performanceSalary\":null}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-27 03:00:20',49),(259,'终止合同',2,'com.ruoyi.project.workstudy.controller.ApplicationController.terminate()','PUT',1,'admin',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":null,\"id\":8,\"performanceSalary\":null}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-27 12:26:16',14),(260,'酬金单',5,'com.ruoyi.project.workstudy.controller.SalaryController.export()','POST',1,'admin',NULL,'/workstudy/salary/export','127.0.0.1','内网IP','{\"jobId\":\"2\",\"month\":\"06\",\"year\":\"2023\",\"pageSize\":\"10\",\"employmentId\":\"1\",\"chooseJob[1]\":\"2\",\"pageNum\":\"1\",\"chooseJob[0]\":\"1\",\"status\":\"1\"}',NULL,0,NULL,'2023-06-27 13:27:05',1557),(261,'用工计划',1,'com.ruoyi.project.workstudy.controller.EmploymentController.add()','POST',1,'admin',NULL,'/workstudy/employment','127.0.0.1','内网IP','{\"content\":\"有关\",\"department\":\"有关部门\",\"employmentJobs\":[{\"employmentId\":4,\"id\":6,\"jobId\":1,\"jobName\":\"助教\",\"limitNumber\":4},{\"employmentId\":4,\"id\":7,\"jobId\":2,\"jobName\":\"收银员\",\"limitNumber\":3},{\"employmentId\":4,\"id\":8,\"jobId\":4,\"jobName\":\"测试1\",\"limitNumber\":2}],\"endTime\":\"2024-06-30\",\"id\":4,\"startTime\":\"2023-06-27\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-27 16:20:31',121),(262,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/4','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2023-06-27 16:55:18',8),(263,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-06-21 08:50:56\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2014,2013,2015],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-27 16:55:33',30),(264,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-27 16:55:48',8),(265,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-06-21 08:50:56\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2014,2013,2015],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-27 16:56:06',29),(266,'个人信息',2,'com.ruoyi.project.system.controller.SysProfileController.updateProfile()','PUT',1,'ry',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"createTime\":\"2023-06-21 08:50:56\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@qq.com\",\"loginDate\":\"2023-06-21 08:50:56\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"zzz\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-27 17:06:51',14),(267,'学生申请',1,'com.ruoyi.project.workstudy.controller.StudentController.add()','POST',1,'ry',NULL,'/workstudy/student','127.0.0.1','内网IP','{\"department\":\"1\",\"id\":10,\"isAssignedAccept\":1,\"isEcoHard\":1,\"jobIntentions\":[\"收银员\",\"搬砖\"],\"major\":\"统计学2012\",\"name\":\"测试学生5\",\"phone\":\"13855555\",\"score\":null,\"sex\":0,\"studentId\":\"555555\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-27 17:08:25',45),(268,'应聘信息',1,'com.ruoyi.project.workstudy.controller.ApplicationController.add()','POST',1,'ry',NULL,'/workstudy/application','127.0.0.1','内网IP','{\"baseSalary\":400.0,\"employmentId\":4,\"endTime\":\"2023-10-27 00:00:00\",\"hours\":3,\"id\":9,\"jobId\":1,\"performanceSalary\":200.0,\"standardDays\":22,\"startTime\":\"2023-06-27 00:00:00\",\"studentId\":9}','{\"msg\":\"操作成功\",\"code\":200,\"data\":9}',0,NULL,'2023-06-27 17:09:37',52),(269,'导出考核表',5,'com.ruoyi.project.workstudy.controller.AssessmentController.export()','POST',1,'ry',NULL,'/workstudy/assessment/export','127.0.0.1','内网IP','{\"updatedTime\":\"2023-06-27T13:55:35.000+08:00\",\"year\":\"2023\",\"totalScore\":\"100\",\"assignedCompletionScore\":\"20\",\"month\":\"06\",\"techRequireScore\":\"25\",\"workingAttitudeScore\":\"15\",\"createdTime\":\"2023-06-26T11:12:38.000+08:00\",\"workErrorScore\":\"20\",\"days\":\"22\",\"id\":\"1\",\"applicationId\":\"2\",\"collaborativeAbilityScore\":\"20\"}',NULL,0,NULL,'2023-06-27 19:59:24',406),(270,'用户管理',1,'com.ruoyi.project.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":100,\"userName\":\"test\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-06-27 20:17:16',112);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2023-06-21 08:50:56','',NULL,''),(2,'se','项目经理',2,'0','admin','2023-06-21 08:50:56','',NULL,''),(3,'hr','人力资源',3,'0','admin','2023-06-21 08:50:56','',NULL,''),(4,'user','普通员工',4,'0','admin','2023-06-21 08:50:56','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2023-06-21 08:50:56','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2023-06-21 08:50:56','admin','2023-06-27 16:56:06','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,2000),(2,2001),(2,2002),(2,2003),(2,2004),(2,2005),(2,2006),(2,2007),(2,2008),(2,2009),(2,2010),(2,2011),(2,2012),(2,2013),(2,2014),(2,2015);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-06-27 20:16:43','admin','2023-06-21 08:50:56','','2023-06-27 20:16:42','管理员'),(2,105,'ry','zzz','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-06-27 19:59:16','admin','2023-06-21 08:50:56','','2023-06-27 19:59:15','测试员'),(100,NULL,'test','测试','00','','','0','','$2a$10$TlTOjpUy.YdevHwzRU3YbuwxMsScem4VYezuVzGdzy2CCdjWKJh0W','0','0','127.0.0.1','2023-06-27 20:17:29','admin','2023-06-27 20:17:16','','2023-06-27 20:17:28',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'personnel_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-27 20:37:47
