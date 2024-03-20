CREATE DATABASE IF NOT EXISTS `xdb`;

USE `xdb`;

DROP TABLE IF EXISTS `x_user`;
DROP TABLE IF EXISTS `x_role`;
DROP TABLE IF EXISTS `x_menu`;
DROP TABLE IF EXISTS `x_user_role`;
DROP TABLE IF EXISTS `x_role_menu`;

CREATE TABLE `x_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
   `deleted` INT(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

insert into `x_user` (`id`, `username`, `password`, `email`, `phone`, `status`, `avatar`, `deleted`) values('1','admin','$2a$10$HpV/H0P42W7ooPhP1vkl2OUXn1jCbyWClCrDZCyEtz8FRAWKr8sQu','super@aliyun.com','18677778888','1','https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif','0');
insert into `x_user` (`id`, `username`, `password`, `email`, `phone`, `status`, `avatar`, `deleted`) values('2','zhangsan','$2a$10$HpV/H0P42W7ooPhP1vkl2OUXn1jCbyWClCrDZCyEtz8FRAWKr8sQu','zhangsan@gmail.com','13966667777','1','https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif','0');
insert into `x_user` (`id`, `username`, `password`, `email`, `phone`, `status`, `avatar`, `deleted`) values('3','lisi','$2a$10$HpV/H0P42W7ooPhP1vkl2OUXn1jCbyWClCrDZCyEtz8FRAWKr8sQu','lisi@gmail.com','13966667778','1','https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif','0');
insert into `x_user` (`id`, `username`, `password`, `email`, `phone`, `status`, `avatar`, `deleted`) values('4','wangwu','$2a$10$HpV/H0P42W7ooPhP1vkl2OUXn1jCbyWClCrDZCyEtz8FRAWKr8sQu','wangwu@gmail.com','13966667772','1','https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif','0');
insert into `x_user` (`id`, `username`, `password`, `email`, `phone`, `status`, `avatar`, `deleted`) values('5','test','$2a$10$HpV/H0P42W7ooPhP1vkl2OUXn1jCbyWClCrDZCyEtz8FRAWKr8sQu','test@gmail.com','13966667776','1','https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif','0');
insert into `x_user` (`id`, `username`, `password`, `email`, `phone`, `status`, `avatar`, `deleted`) values('6','temp','$2a$10$HpV/H0P42W7ooPhP1vkl2OUXn1jCbyWClCrDZCyEtz8FRAWKr8sQu','temp@gmail.com','13966667771','1','https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif','0');

CREATE TABLE `x_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

insert into `x_role` (`role_id`, `role_name`, `role_desc`) values('1','admin','管理员');
insert into `x_role` (`role_id`, `role_name`, `role_desc`) values('2','hr','人力');
insert into `x_role` (`role_id`, `role_name`, `role_desc`) values('3','normal','员工');

CREATE TABLE `x_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `redirect` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_leaf` varchar(1) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

insert  into `x_menu`(`menu_id`,`component`,`path`,`redirect`,`name`,`title`,`icon`,`parent_id`,`is_leaf`,`hidden`) values (1,'Layout','/sys','/sys/user','sysManage','系统管理','userManage',0,'N',0),(2,'sys/user','user',NULL,'userList','用户列表','user',1,'Y',0),(3,'sys/role','role',NULL,'roleList','角色列表','roleManage',1,'Y',0),(4,'Layout','/test','/test/test1','test','功能测试','form',0,'N',0),(5,'test/test1','test1','','test1','测试点一','form',4,'Y',0),(6,'test/test2','test2','','test2','测试点二','form',4,'Y',0),(7,'test/test3','test3','','test3','测试点三','form',4,'Y',0);

CREATE TABLE `x_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

insert  into `x_user_role`(`id`,`user_id`,`role_id`) values (1,1,1),(2,1,3),(6,3,2),(7,4,2),(8,4,3),(11,2,3);

CREATE TABLE `x_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

insert  into `x_role_menu`(`id`,`role_id`,`menu_id`) values (11,1,1),(12,1,2),(13,1,3),(14,1,4),(15,1,5),(16,1,6),(17,1,7),(18,3,4),(19,3,5),(20,3,6),(21,3,7);
