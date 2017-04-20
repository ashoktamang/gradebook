DROP TABLE IF EXISTS `assignments`;
CREATE TABLE `assignments` (
  `assignmentID` int(11) NOT NULL AUTO_INCREMENT,
  `distributionID` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `pointsPossible` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`assignmentID`)
);

LOCK TABLES `assignments` WRITE;
INSERT INTO `assignments` VALUES (1,1,1,100),(2,1,2,100),(3,1,3,100),(4,1,4,50),(5,2,1,100),(6,2,2,50),(7,2,3,50),(8,3,1,75),(9,4,1,75),(10,4,2,100),(11,4,3,75),(12,4,4,100),(13,5,1,50),(14,5,2,75),(15,5,3,200),(16,6,1,100),(17,6,2,100),(18,6,3,100),(19,6,4,50),(20,6,5,50),(21,7,1,100),(22,7,2,100),(23,8,1,50),(24,8,2,50),(25,8,3,75),(26,8,4,100),(27,8,5,75),(28,9,1,100),(29,9,2,75),(30,10,1,100),(31,10,2,350),(32,10,3,100),(33,10,4,250),(34,10,5,150),(35,11,1,50),(36,11,2,75),(37,11,3,100),(38,11,4,100),(39,11,5,100),(40,11,6,100),(41,12,1,100),(42,13,1,50),(43,13,2,50),(44,13,3,50),(45,14,1,75),(46,15,1,500),(47,15,2,500),(48,16,1,100),(49,16,2,200),(50,16,3,50),(51,17,1,50),(52,17,2,75),(53,18,1,100),(54,18,2,100),(55,19,1,100),(56,19,2,100),(57,19,3,100),(58,20,1,100),(59,20,2,50),(60,20,3,150),(61,20,4,100);
UNLOCK TABLES;

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `courseID` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(20) NOT NULL,
  `courseNumber` int(11) NOT NULL,
  `courseName` varchar(50) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`courseID`)
);

LOCK TABLES `courses` WRITE;

INSERT INTO `courses` VALUES (1,'English',3,'Freshman Composiiton','Fall',2016),(2,'Physics',5,'Physics II','Spring',2017),(3,'Computer Science',4,'Database Systems','Fall',2017),(4,'Chemistry',1,'Chemistry Lab I','Spring',2017),(5,'Wizardry',3,'Witch craft','Fall',2018),(6,'Theaters',2,'Acting','Fall',2017);;



UNLOCK TABLES;


DROP TABLE IF EXISTS `distribution`;

CREATE TABLE `distribution` (
  `distributionID` int(11) NOT NULL AUTO_INCREMENT,
  `courseID` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`distributionID`)
);

LOCK TABLES `distribution` WRITE;

INSERT INTO `distribution` VALUES (1,1,'Test',50),(2,1,'Quiz',15),(3,2,'Lab',25),(4,3,'Project',40),(5,4,'Test',30),(6,1,'Lab',10),(7,5,'Test',40),(8,6,'Test',30),(9,6,'Lab',40),(10,5,'Lab',20),(11,4,'Homework',30),(12,2,'Homework',45),(13,2,'Test',15),(14,1,'Homework',25),(15,5,'Project',20),(16,2,'Quiz',15),(17,3,'Homework',60),(18,5,'Quiz',20),(19,6,'Project',30),(20,4,'Project',40);


UNLOCK TABLES;

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `studentID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  PRIMARY KEY (`studentID`,`courseID`)
);

LOCK TABLES `registration` WRITE;

INSERT INTO `registration` VALUES (1,3),(1,5),(1,6),(2,2),(2,3),(3,6),(4,1),(4,4),(4,5),(5,5),(6,1),(6,2),(7,5);


UNLOCK TABLES;


DROP TABLE IF EXISTS `scores`;

CREATE TABLE `scores` (
  `studentID` int(11) NOT NULL,
  `assignmentID` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`studentID`,`assignmentID`)
);


LOCK TABLES `scores` WRITE;

INSERT INTO `scores` VALUES (1,9,75),(1,10,100),(1,11,74),(1,12,99),(1,21,100),(1,22,95),(1,23,49),(1,24,49),(1,25,75),(1,26,100),(1,27,73),(1,28,100),(1,29,75),(1,30,100),(1,31,350),(1,32,100),(1,33,249),(1,34,150),(1,46,500),(1,47,499),(1,51,50),(1,52,50),(1,53,74),(1,54,100),(1,55,100),(1,56,100),(1,57,99),(2,8,65),(2,9,65),(2,10,76),(2,11,38),(2,12,20),(2,42,50),(2,43,50),(2,44,50),(2,48,100),(2,49,200),(2,50,35),(2,51,40),(2,52,75),(3,23,35),(3,24,35),(3,25,60),(3,26,60),(3,27,50),(3,28,80),(3,29,50),(3,55,93),(3,56,90),(3,57,96),(4,1,82),(4,2,78),(4,3,85),(4,4,42),(4,5,78),(4,6,41),(4,7,40),(4,13,40),(4,14,60),(4,15,164),(4,16,80),(4,17,74),(4,18,86),(4,19,48),(4,20,32),(4,30,88),(4,31,300),(4,32,72),(4,33,200),(4,34,130),(4,35,40),(4,36,64),(4,37,80),(4,38,80),(4,39,83),(4,40,77),(4,45,65),(4,46,425),(4,47,375),(4,53,89),(4,54,71),(4,58,90),(4,59,35),(4,60,125),(4,61,80),(5,30,70),(5,31,200),(5,32,50),(5,33,180),(5,34,100),(5,46,400),(5,47,300),(5,53,70),(5,54,65),(6,1,100),(6,2,80),(6,3,83),(6,4,0),(6,5,0),(6,6,50),(6,7,40),(6,8,50),(6,16,57),(6,17,58),(6,18,55),(6,19,50),(6,20,50),(6,42,35),(6,43,35),(6,44,40),(6,45,70),(6,48,100),(6,50,42),(7,30,25),(7,31,125),(7,32,30),(7,33,100),(7,34,0),(7,46,300),(7,47,275),(7,53,45),(7,54,78);


UNLOCK TABLES;

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `studentID` int(11) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `FName` varchar(30) NOT NULL,
  `Major` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`studentID`)
);

LOCK TABLES `students` WRITE;

INSERT INTO `students` VALUES (1,'Tamang','Ashok','Computer Science\r'),(2,'Potter','Harry','Physics\r'),(3,'Hathaway','Anna','Theaters\r'),(4,'Micheam','Hermoine','Wizardry\r'),(5,'Quack','Gauri','Chemistry\r'),(6,'Ponting','Ricky','Physics\r'),(7,'Williams','Serena','English');


UNLOCK TABLES;