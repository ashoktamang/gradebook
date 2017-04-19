CREATE TABLE Students (
StudentID int NOT NULL,
FirstName varchar(30) NOT NULL,
LastName varchar(30) NOT NULL,
Major varchar(20),
PRIMARY KEY (StudentID)
);

CREATE TABLE Courses (
CourseID int NOT NULL auto_increment,
Department varchar(20) NOT NULL,
CourseNumber int NOT NULL,
CourseName varchar(50) NOT NULL,
Semester varchar(10) NOT NULL,
Year int NOT NULL,
PRIMARY KEY (CourseID)
);

CREATE TABLE Enrollment (
StudentID int NOT NULL,
CourseID int NOT NULL,
PRIMARY KEY (StudentID, CourseID)
);

CREATE TABLE Distribution (
DistributionID int NOT NULL auto_increment,
CourseID int NOT NULL,
Category varchar(20) NOT NULL,
Percent int NOT NULL,
PRIMARY KEY (DistributionID)
);

CREATE TABLE Assignments (
AssignmentID int NOT NULL auto_increment,
DistributionID int NOT NULL,
Instance int NOT NULL,
PointsPossible int DEFAULT 0 NOT NULL,
PRIMARY KEY(AssignmentID)
);

CREATE TABLE StudentScores (
StudentID int NOT NULL,
AssignmentID int NOT NULL,
Points int DEFAULT 0 NOT NULL,
PRIMARY KEY (StudentID, AssignmentID)
);
