CREATE DATABASE student;

USE student;

CREATE TABLE `admin` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(16) NOT NULL COMMENT '登录名',
  `password` VARCHAR(32) NOT NULL COMMENT '登录密码',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

CREATE TABLE student(
`id` INT(11) NOT NULL AUTO_INCREMENT,
stu_id VARCHAR(32) NOT NULL COMMENT '学号',
stu_name VARCHAR(100) NOT NULL COMMENT '学生姓名',
majoy VARCHAR(100) NOT NULL COMMENT '专业',
class VARCHAR(10) NOT NULL COMMENT '班级',
PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='学生表';

CREATE TABLE course(
`id` INT(11) NOT NULL AUTO_INCREMENT,
cou_id VARCHAR(32) NOT NULL COMMENT '课程编号',
cou_name VARCHAR(200) NOT NULL COMMENT '课程名',
period VARCHAR(100) COMMENT '课时',
PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='课程表';

CREATE TABLE grade(
`id` INT(11) NOT NULL AUTO_INCREMENT,
grade_id VARCHAR(32) NOT NULL COMMENT '成绩id',
score INT NOT NULL DEFAULT 0 COMMENT '得分',
stu_id VARCHAR(32) NOT NULL COMMENT '学号',
cou_id VARCHAR(32) NOT NULL COMMENT '课程编号',
PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='成绩表';

CREATE TABLE marks(
`id` INT(11) NOT NULL AUTO_INCREMENT,
mark_id VARCHAR(32) NOT NULL COMMENT '唯一id',
deduct INT NOT NULL DEFAULT 0 COMMENT '加扣分  正值为加分，负值为扣分',
cause VARCHAR(500) COMMENT '加、扣分原因',
stu_id VARCHAR(32) NOT NULL COMMENT '学号',
PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='加/扣分表';