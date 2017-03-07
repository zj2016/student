/*
SQLyog v10.2 
MySQL - 5.5.15 : Database - venue
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`venue` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `venue`;

/*Table structure for table `admin` */

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL COMMENT '登录名',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`password`) values (1,'admin','admin');

/*Table structure for table `gymnasium` */

CREATE TABLE `gymnasium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gymnasium_id` varchar(32) NOT NULL COMMENT '体育馆id',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `intro` text COMMENT '简介',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `img` varchar(1000) DEFAULT NULL COMMENT '体育馆图片',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='体育场馆表';

/*Data for the table `gymnasium` */

insert  into `gymnasium`(`id`,`gymnasium_id`,`name`,`intro`,`address`,`img`,`create_time`,`update_time`) 
values (1,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','虹口足球场是中国第一座专业足球场，也是中国足球超级联赛（原甲A联赛）上海绿地申花足球俱乐部主场。虹口足球场于1998年2月22日动工，1999年2月22日落成，同年3月14日正式启用。总建筑面积7.29万平方米，观众席位3.5万个，耗资超过3亿元。','中国上海虹口区东江湾路444号','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488193635541&di=6400f84851334fa61f32def8e7dd78b4&imgtype=0&src=http%3A%2F%2Fpic0.huitu.com%2Fres%2F20170215%2F1266472_20170215095853055112_1.jpg',1488179314843,1488179314843),(2,'22d0d52286494ba48d80c77167b16820','虹口足球场1','虹口足球场是中国第一座专业足球场，也是中国足球超级联赛（原甲A联赛）上海绿地申花足球俱乐部主场。虹口足球场于1998年2月22日动工，1999年2月22日落成，同年3月14日正式启用。总建筑面积7.29万平方米，观众席位3.5万个，耗资超过3亿元。','中国上海虹口区东江湾路444号','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488193635541&di=6400f84851334fa61f32def8e7dd78b4&imgtype=0&src=http%3A%2F%2Fpic0.huitu.com%2Fres%2F20170215%2F1266472_20170215095853055112_1.jpg',1488179314843,1488179314843),(3,'b7ff9be58eeb4feebd7fdd5f70ff0a9b','虹口足球场9','虹口足球场是中国第一座专业足球场，也是中国足球超级联赛（原甲A联赛）上海绿地申花足球俱乐部主场。虹口足球场于1998年2月22日动工，1999年2月22日落成，同年3月14日正式启用。总建筑面积7.29万平方米，观众席位3.5万个，耗资超过3亿元。','中国上海虹口区东江湾路444号','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488193635541&di=6400f84851334fa61f32def8e7dd78b4&imgtype=0&src=http%3A%2F%2Fpic0.huitu.com%2Fres%2F20170215%2F1266472_20170215095853055112_1.jpg',1488179314843,1488179314843),(4,'6b4d478a8b6c45eda14346bfa5f81513','虹口足球场2','虹口足球场是中国第一座专业足球场，也是中国足球超级联赛（原甲A联赛）上海绿地申花足球俱乐部主场。虹口足球场于1998年2月22日动工，1999年2月22日落成，同年3月14日正式启用。总建筑面积7.29万平方米，观众席位3.5万个，耗资超过3亿元。','中国上海虹口区东江湾路444号','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488193635541&di=6400f84851334fa61f32def8e7dd78b4&imgtype=0&src=http%3A%2F%2Fpic0.huitu.com%2Fres%2F20170215%2F1266472_20170215095853055112_1.jpg',1488179314843,1488179314843),(5,'65d690f1a80240d1aaa1998162d70bfe','虹口足球场3','虹口足球场是中国第一座专业足球场，也是中国足球超级联赛（原甲A联赛）上海绿地申花足球俱乐部主场。虹口足球场于1998年2月22日动工，1999年2月22日落成，同年3月14日正式启用。总建筑面积7.29万平方米，观众席位3.5万个，耗资超过3亿元。','中国上海虹口区东江湾路444号','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488193635541&di=6400f84851334fa61f32def8e7dd78b4&imgtype=0&src=http%3A%2F%2Fpic0.huitu.com%2Fres%2F20170215%2F1266472_20170215095853055112_1.jpg',1488179314843,1488179314843),(6,'6efbad1417444410895beaf4a5cb0546','虹口足球场4','虹口足球场是中国第一座专业足球场，也是中国足球超级联赛（原甲A联赛）上海绿地申花足球俱乐部主场。虹口足球场于1998年2月22日动工，1999年2月22日落成，同年3月14日正式启用。总建筑面积7.29万平方米，观众席位3.5万个，耗资超过3亿元。','中国上海虹口区东江湾路444号','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488193635541&di=6400f84851334fa61f32def8e7dd78b4&imgtype=0&src=http%3A%2F%2Fpic0.huitu.com%2Fres%2F20170215%2F1266472_20170215095853055112_1.jpg',1488179314843,1488179314843),(7,'7543feed39ef46b0b6127716250eafa9','虹口足球场5','虹口足球场是中国第一座专业足球场，也是中国足球超级联赛（原甲A联赛）上海绿地申花足球俱乐部主场。虹口足球场于1998年2月22日动工，1999年2月22日落成，同年3月14日正式启用。总建筑面积7.29万平方米，观众席位3.5万个，耗资超过3亿元。','中国上海虹口区东江湾路444号','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488193635541&di=6400f84851334fa61f32def8e7dd78b4&imgtype=0&src=http%3A%2F%2Fpic0.huitu.com%2Fres%2F20170215%2F1266472_20170215095853055112_1.jpg',1488179314843,1488179314843),(8,'da2aec15f100416fb1808c8867cfd343','虹口足球场6','虹口足球场是中国第一座专业足球场，也是中国足球超级联赛（原甲A联赛）上海绿地申花足球俱乐部主场。虹口足球场于1998年2月22日动工，1999年2月22日落成，同年3月14日正式启用。总建筑面积7.29万平方米，观众席位3.5万个，耗资超过3亿元。','中国上海虹口区东江湾路444号','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488193635541&di=6400f84851334fa61f32def8e7dd78b4&imgtype=0&src=http%3A%2F%2Fpic0.huitu.com%2Fres%2F20170215%2F1266472_20170215095853055112_1.jpg',1488179314843,1488179314843),(9,'f6db63b65259457ab04e572ad59d1d80','虹口足球场7','虹口足球场是中国第一座专业足球场，也是中国足球超级联赛（原甲A联赛）上海绿地申花足球俱乐部主场。虹口足球场于1998年2月22日动工，1999年2月22日落成，同年3月14日正式启用。总建筑面积7.29万平方米，观众席位3.5万个，耗资超过3亿元。','中国上海虹口区东江湾路444号','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488193635541&di=6400f84851334fa61f32def8e7dd78b4&imgtype=0&src=http%3A%2F%2Fpic0.huitu.com%2Fres%2F20170215%2F1266472_20170215095853055112_1.jpg',1488179314843,1488179314843),(10,'a67552aa10af4116a7de53a4ec86a747','虹口足球场8','虹口足球场是中国第一座专业足球场，也是中国足球超级联赛（原甲A联赛）上海绿地申花足球俱乐部主场。虹口足球场于1998年2月22日动工，1999年2月22日落成，同年3月14日正式启用。总建筑面积7.29万平方米，观众席位3.5万个，耗资超过3亿元。','中国上海虹口区东江湾路444号','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488193635541&di=6400f84851334fa61f32def8e7dd78b4&imgtype=0&src=http%3A%2F%2Fpic0.huitu.com%2Fres%2F20170215%2F1266472_20170215095853055112_1.jpg',1488179314843,1488179314843);

/*Table structure for table `news` */

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` varchar(32) NOT NULL COMMENT '新闻id',
  `title` varchar(100) NOT NULL COMMENT '新闻标题',
  `content` text COMMENT '新闻内容',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `gymnasium_id` varchar(32) NOT NULL COMMENT '体育馆id',
  `gymnasium_name` varchar(100) NOT NULL COMMENT '体育馆名称',
  `img` varchar(1000) NOT NULL COMMENT '新闻图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='新闻表';

/*Data for the table `news` */

insert  into `news`(`id`,`news_id`,`title`,`content`,`create_time`,`update_time`,`gymnasium_id`,`gymnasium_name`,`img`) 
values (1,'348546453e4347bf99a8e93304947f6b','江湾体育场世纪大战，震撼开始','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\r\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(2,'7f2370977ed041b3a31456d8814c58f3','江湾体育场世纪大战，震撼开始3','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(3,'f6f6f08bc3ed452b8755a2001aa9259b','江湾体育场世纪大战，震撼开始1','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(4,'8482a62f07bd4bc990f94f2262628ec0','江湾体育场世纪大战，震撼开始2','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(5,'cc159fec954648e6a910b9f307bb714b','江湾体育场世纪大战，震撼开始4','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(6,'a1aa3968830843ab8c264689e008a2ae','江湾体育场世纪大战，震撼开始5','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(7,'9ca4131349084699ac31999fbb8531ac','江湾体育场世纪大战，震撼开始6','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(8,'5724509ab3014910bf5d7f180cc69e80','江湾体育场世纪大战，震撼开始7','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(9,'a4ee11033b3446eaaaa293593339cf25','江湾体育场世纪大战，震撼开始8','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(10,'53c54f962b4e435989b361a8013ed048','江湾体育场世纪大战，震撼开始9','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(11,'2aee3f96736f4256aaf8f5b1dc4e2c00','江湾体育场世纪大战，震撼开始10','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(12,'9de79d2922d84bf38478d786d3edd477','江湾体育场世纪大战，震撼开始11','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(13,'4d517b22e697438f8c0570e3627fe49f','江湾体育场世纪大战，震撼开始12','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(14,'e81e68b67aa746f3ad9384a35ee54261','江湾体育场世纪大战，震撼开始13','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(15,'28acffea774b4e22ab56e1abdcf7535f','江湾体育场世纪大战，震撼开始14','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg'),(16,'de5e2f9fb25a4bf0ac90870bf490fe7a','江湾体育场世纪大战，震撼开始15','2月26日，广东东莞银行队球员易建联（右三）在比赛中进攻。\n　　当日，在2016-2017赛季中国男子篮球职业联赛 （CBA）四分之一决赛第二场比赛中，广东东莞银行队主场以123比99战胜四川品胜队，从而以2比0的总比分暂时领先，并获得赛点。',1488184767248,1488184767248,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488194946562&di=18e2af1229b88b1de9764f2d11c8bdfc&imgtype=0&src=http%3A%2F%2Fpic35.nipic.com%2F20131106%2F10961434_183801740302_2.jpg');

/*Table structure for table `reserve` */

CREATE TABLE `reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reserve_id` varchar(32) NOT NULL COMMENT '预定id',
  `start_date` bigint(20) NOT NULL COMMENT '开始时间',
  `end_date` bigint(20) NOT NULL COMMENT '结束时间',
  `gymnasium_id` varchar(32) NOT NULL COMMENT '体育馆id',
  `gymnasium_name` varchar(100) NOT NULL COMMENT '体育馆名称',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `use` varchar(1000) DEFAULT NULL COMMENT '用途',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='预定表';

/*Data for the table `reserve` */

insert  into `reserve`(`id`,`reserve_id`,`start_date`,`end_date`,`gymnasium_id`,`gymnasium_name`,`user_id`,`user_name`,`create_time`,`update_time`,`use`,`status`) values (1,'7fbcddd6fd89404f96069e1198972b7c',1488333600000,1488351600000,'92e7a365fd6a49aeb88ef5f08a391b3f','虹口足球场','400e0c56bf58423489c8c39ebb810021','鱼子酱',1488270897985,1488270897985,'篮球比赛',0);

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `name` varchar(50) NOT NULL COMMENT '用户名称',
  `phone` varchar(11) NOT NULL COMMENT '用户手机号',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  `realname` varchar(50) DEFAULT NULL COMMENT '用户真实姓名',
  `school` varchar(100) DEFAULT NULL COMMENT '学校',
  `major` varchar(100) DEFAULT NULL COMMENT '专业',
  `studentid` varchar(20) DEFAULT NULL COMMENT '学号',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`id`,`user_id`,`name`,`phone`,`password`,`realname`,`school`,`major`,`studentid`,`create_time`,`update_time`) values (1,'400e0c56bf58423489c8c39ebb810021','鱼子酱','13000001111','e10adc3949ba59abbe56e057f20f883e','张三','北京大学','计算机',NULL,1488259984127,1488259984127);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
