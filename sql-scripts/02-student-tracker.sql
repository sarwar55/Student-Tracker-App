CREATE DATABASE  IF NOT EXISTS `web_student_tracker`
USE `web_student_tracker`;

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `student` WRITE;

INSERT INTO `student` VALUES (1,'Manohar','Reddy Annapureddy','manohar@reddy.com');

UNLOCK TABLES;
