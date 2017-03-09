/*
SQLyog v10.2 
MySQL - 5.7.17 : Database - student
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `student`;

/*Table structure for table `admin` */

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL COMMENT '登录名',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`password`) values (1,'admin','admin123');

/*Table structure for table `course` */

CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cou_id` varchar(32) NOT NULL COMMENT '课程编号',
  `cou_name` varchar(200) NOT NULL COMMENT '课程名',
  `period` varchar(100) DEFAULT NULL COMMENT '课时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='课程表';

/*Data for the table `course` */

insert  into `course`(`id`,`cou_id`,`cou_name`,`period`) values (1,'aace669d875d4f41963e29f07a8a7b16','汇编语言','18'),(2,'8e8bf02153d84718a869b7f4f815f288','计算机操作系统','24'),(3,'b26a3ac9757a49eeabf863f4c797dfdb','数据库原理','18'),(4,'bed078f8a40f4a2b8f1dc637c6e89511','计算机组成原理','22'),(5,'89f38c19604b491f97941fd2b3854628','高数','30');

/*Table structure for table `grade` */

CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_id` varchar(32) NOT NULL COMMENT '成绩id',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '得分',
  `stu_id` varchar(32) NOT NULL COMMENT '学号',
  `cou_id` varchar(32) NOT NULL COMMENT '课程编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='成绩表';

/*Data for the table `grade` */

insert  into `grade`(`id`,`grade_id`,`score`,`stu_id`,`cou_id`) values (1,'e7de78f6c8954090acd51c11c2d5615f',93,'161003301','aace669d875d4f41963e29f07a8a7b16'),(2,'154a6de120764be1b91a4117e12ecbf5',60,'161003301','89f38c19604b491f97941fd2b3854628'),(3,'c91966fb29934c839b0e23644157fc1b',84,'161003304','b26a3ac9757a49eeabf863f4c797dfdb'),(4,'05bdc44aee8847c89a4311c35d2ed3c2',42,'161003311','89f38c19604b491f97941fd2b3854628'),(5,'82aca8e834d0481e9cab1570a00061a5',100,'161003308','bed078f8a40f4a2b8f1dc637c6e89511'),(6,'06877434fd924de39e0042781bf67867',65,'161003305','89f38c19604b491f97941fd2b3854628'),(7,'1a77d26e2d9244848ccd430cd8fb1b31',80,'161003305','8e8bf02153d84718a869b7f4f815f288'),(8,'ef40353c389146a696d062d239f5a3da',67,'161003312','8e8bf02153d84718a869b7f4f815f288'),(9,'082d68de1e3c4335a83a5c61b483a29b',75,'161003309','b26a3ac9757a49eeabf863f4c797dfdb'),(10,'aba7062cc27a49fba1a74fc6a5183114',99,'161003305','8e8bf02153d84718a869b7f4f815f288');

/*Table structure for table `marks` */

CREATE TABLE `marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deduct` int(11) NOT NULL DEFAULT '0' COMMENT '加扣分  正值为加分，负值为扣分',
  `cause` varchar(500) DEFAULT NULL COMMENT '加、扣分原因',
  `stu_id` varchar(32) NOT NULL COMMENT '学号',
  `mark_id` varchar(32) NOT NULL COMMENT '唯一id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='加/扣分表';

/*Data for the table `marks` */

insert  into `marks`(`id`,`deduct`,`cause`,`stu_id`,`mark_id`) values (1,-5,'非法使用电磁炉','161003304','2b7ff403e9ed48a190a56426aa2e8345'),(2,10,'志愿者活动','161003308','096d5b29f0df4f25a9b2bb3fa14415c5'),(3,-3,'迟到','161003306','eacfeaed88ce4681a893f656d06ddb07'),(4,-7,'宿舍卫生差劲','161003311','d5650e6c36104716a0651ea88a0b1372'),(5,5,'宿舍干净整洁','161003309','15703b62076e49778cd3e6cd11db3ab3');

/*Table structure for table `student` */

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(32) NOT NULL COMMENT '学号',
  `stu_name` varchar(100) NOT NULL COMMENT '学生姓名',
  `majoy` varchar(100) NOT NULL COMMENT '专业',
  `class` varchar(10) NOT NULL COMMENT '班级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='学生表';

/*Data for the table `student` */

insert  into `student`(`id`,`stu_id`,`stu_name`,`majoy`,`class`) values (1,'161003301','张三','计算机','33'),(2,'161003302','李四','计算机','33'),(3,'161003303','王五','计算机','33'),(4,'161003304','李白','计算机','33'),(5,'161003305','杜普','计算机','33'),(6,'161003306','杜甫','计算机','33'),(7,'161003307','苏轼','计算机','33'),(8,'161003308','王安石','计算机','33'),(9,'161003309','司马相如','计算机','33'),(10,'161003310','宋濂','计算机','33'),(11,'161003311','廉颇','计算机','33'),(12,'161003312','蔺相如','计算机','33');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
