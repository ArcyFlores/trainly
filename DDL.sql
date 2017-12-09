

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS Trainly;

/*******************************************************************************
   Create database
********************************************************************************/

CREATE DATABASE Trainly;
USE Trainly;

/*******************************************************************************
   Create Tables
********************************************************************************/

/*			USERS			*/

CREATE TABLE `Student`
(
	`StudentID`	INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`Email`	VARCHAR(250) NOT NULL UNIQUE,
	`Password`	TEXT NOT NULL,
	`Student_pic`	BLOB NOT NULL,
	`F_Name`	TEXT NOT NULL,
	`L_Name`	TEXT NOT NULL,
	`Street`	TEXT NOT NULL,
	`City`	TEXT NOT NULL,
	`Country`	TEXT NOT NULL,
	`ZipCode`	INTEGER NOT NULL,
	CONSTRAINT `PK_Student` PRIMARY KEY(`StudentID`)
);

CREATE TABLE `Faculty`
(
	`StudentID`	INTEGER NOT NULL,
	`Title`	TEXT NOT NULL,
	`Affiliation`	TEXT NOT NULL,
	`Work_Website`	TEXT NOT NULL,
	`Date`	TEXT,
	`Time`	TEXT,
	`Identity`	TEXT,
	`AdminID`	INTEGER,
	CONSTRAINT `PK_Factuly` PRIMARY KEY(`StudentID`)	
);

CREATE TABLE `Admin`
(
	`StudentID`	INTEGER NOT NULL,
	`Date`	TEXT NOT NULL,
	`Time`	TEXT NOT NULL,
	`Grantor`	INTEGER,
	CONSTRAINT `PK_Amin` PRIMARY KEY(`StudentID`)
);

CREATE TABLE `Phone`
(
	`StudentID`	INTEGER NOT NULL,
	`Phone_num`	VARCHAR(25) NOT NULL,
	CONSTRAINT `PK_Phone` PRIMARY KEY(`StudentID`,`Phone_num`)
);


/*			COURSES			*/

CREATE TABLE `Course` 
(
	`CourseID`	INTEGER NOT NULL,
	`Name`	TEXT NOT NULL,
	`Description`	TEXT NOT NULL,
	`Icon`	BLOB NOT NULL,
	`Cost`	INTEGER NOT NULL,
	`Pri_topic`	TEXT NOT NULL,
	CONSTRAINT `PK_Course` PRIMARY KEY(`CourseID`)
);

CREATE TABLE `Sec_topic` 
(
	`CourseID`	INTEGER NOT NULL,
	`Topic`	VARCHAR(255) NOT NULL,
	CONSTRAINT `PK_Sec_topic` PRIMARY KEY(`CourseID`,`Topic`)
);

CREATE TABLE `C_Material` 
(
	`CMID`	INTEGER NOT NULL,
	`CourseID`	INTEGER,
	`Name`	TEXT,
	CONSTRAINT `PK_C_Material` PRIMARY KEY(`CMID`, `CourseID`)
);

CREATE TABLE `C_Question` 
(
	`CQID`	INTEGER NOT NULL,
	`CourseID` INTEGER NOT NULL,
	`Context`	TEXT,
	`StudentID`	INTEGER,
	`Rank`	INTEGER,
	CONSTRAINT `PK_C_Question` PRIMARY KEY(`CQID` , `CourseID` )
);

CREATE TABLE `Playlist` 
(
	`PID`	INTEGER NOT NULL,
	`CMID`	INTEGER NOT NULL,
	`StudentID`	INTEGER,
	`CourseID` INTEGER,
	CONSTRAINT `PK_Playlist` PRIMARY KEY(`PID` , `CMID`, `StudentID`)
);


/*			COURSE MATERIAL TYPES			*/

CREATE TABLE `Dable_file` 
(
	`CMID`	INTEGER NOT NULL,
	`CourseID` INTEGER,
	`Type`	TEXT,
	`Size`	TEXT,
	`Path`	TEXT,
	CONSTRAINT `PK_Dable_file` PRIMARY KEY(`CMID` , `CourseID`)
);

CREATE TABLE `Link`
(
	`CMID`	INTEGER NOT NULL,
	`CourseID` INTEGER,
	`URL`	TEXT,
	`Video_Tag`	INTEGER,
	CONSTRAINT `PK_Link` PRIMARY KEY(`CMID`, `CourseID`)
);

CREATE TABLE `Post` 
(
	`CMID`	INTEGER NOT NULL,
	`CourseID` INTEGER,
	`Text`	TEXT NOT NULL,
	CONSTRAINT `PK_Post` PRIMARY KEY(`CMID`, `CourseID`)
);

CREATE TABLE `Quiz` 
(
	`CMID`	INTEGER NOT NULL,
	`CourseID` INTEGER,
	`P_score`	INTEGER,
	CONSTRAINT `PK_Quiz` PRIMARY KEY(`CMID`, `CourseID`)
);


/*			QUIZ RELATED TABLES		*/

CREATE TABLE `Q_question` 
(
	`QuestionID`	INTEGER NOT NULL,
	`CMID`	INTEGER NOT NULL,
	`CourseID` INTEGER NOT NULL,
	`Text`	TEXT,
	CONSTRAINT `PK_Q_question` PRIMARY KEY(`QuestionID`,`CMID`, `CourseID`)
);

CREATE TABLE `Q_answers` 
(
	`AnswerID` 	INTEGER NOT NULL,
	`CMID`	INTEGER NOT NULL,
	`CourseID` INTEGER NOT NULL,
	`QuestionID` INTEGER,
	`Answer`	TEXT,
	`Feedback`   TEXT,
	`Indication` INTEGER,
	CONSTRAINT `PK_Q_Answers` PRIMARY KEY(`AnswerID`, `CMID`, `CourseID`,`QuestionID` )
);

/*			RELATIONSHIPS			*/

/*Course Materials belonging to a Student enrolled in associated course*/
CREATE TABLE `CM_Complete` 
(
	`CMID`	INTEGER NOT NULL,
	`CourseID` INTEGER NOT NULL,
	`StudentID`	INTEGER NOT NULL,
	`Date`	TEXT,
	`Time`	TEXT,
	`Score` INTEGER, 
	`cFlag` INTEGER, 
	CONSTRAINT `PK_CM_Complete` PRIMARY KEY(`CMID`,`CourseID`, `StudentID`)
);

/*Faculty creates course*/
CREATE TABLE `F_Create` 
(
	`FacultyID`	INTEGER NOT NULL,
	`CourseID`	INTEGER NOT NULL,
	`Date`	TEXT,
	CONSTRAINT `PK_Create` PRIMARY KEY(`CourseID`,`FacultyID`)
);

/*Student enrolled in course along with completion data*/
CREATE TABLE `Enroll_in` 
(
	`StudentID`	INTEGER NOT NULL,
	`CourseID`	INTEGER NOT NULL,
	`Conf_Code`	TEXT NOT NULL,
	`Date`	TEXT NOT NULL,
	`Time`	TEXT NOT NULL,
	`Comment`	TEXT,
	`Rating`	TEXT,
	`C_date`	TEXT,
	`C_time`	TEXT,
	CONSTRAINT `PK_Enroll_In` PRIMARY KEY(`CourseID`,`StudentID`)
);

/*Student interested in course*/
CREATE TABLE `Interest` 
(
	`StudentID`	INTEGER NOT NULL,
	`CourseID`	INTEGER NOT NULL,
	CONSTRAINT `PK_Interest` PRIMARY KEY(`StudentID`,`CourseID`)
);

/*Faculty judges content of course question*/
CREATE TABLE `Judge` 
(
	`F_ID`	INTEGER NOT NULL,
	`CQID`	INTEGER NOT NULL,
	`CourseID` INTEGER NOT NULL,
	`Answer`	TEXT,
	`Visibility`	TEXT,
	CONSTRAINT `PK_Judge` PRIMARY KEY(`F_ID`,`CQID`,`CourseID`)
);

/*Course question related to course material*/
CREATE TABLE `Relate_to` 
(
	`CQID`	INTEGER NOT NULL,
	`CMID`	INTEGER NOT NULL,
	`CourseID` INTEGER NOT NULL,
	CONSTRAINT `PK_Relate_to` PRIMARY KEY(`CQID`,`CMID` ,`CourseID`)
);

/*Student likes course question*/
CREATE TABLE `s_like` 
(
	`StudentID`	INTEGER NOT NULL,
	`CQID`	INTEGER NOT NULL,
	`CourseID` INTEGER NOT NULL,
	`Rating`	INTEGER,
	CONSTRAINT `PK_s_like` PRIMARY KEY(`StudentID`,`CQID`, `CourseID`)
);

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/

ALTER TABLE `Faculty` ADD CONSTRAINT `FK_FacultyStudent` FOREIGN KEY(`StudentID`) REFERENCES `Student`(`StudentID`);
ALTER TABLE `Faculty` ADD CONSTRAINT `FK_FacultyAdmin` FOREIGN KEY(`AdminID`) REFERENCES `Admin`(`StudentID`);

ALTER TABLE `Admin` ADD CONSTRAINT `FK_AdminStudent` FOREIGN KEY(`StudentID`) REFERENCES `Student`(`StudentID`);
ALTER TABLE `Admin` ADD CONSTRAINT `FK_AdminGrantor` FOREIGN KEY(`Grantor`) REFERENCES `Admin`(`StudentID`);

ALTER TABLE `Phone` ADD CONSTRAINT `FK_StudentPhoneNumber` FOREIGN KEY(`StudentID`) REFERENCES `Student`(`StudentID`);

ALTER TABLE `C_Material` ADD CONSTRAINT `FK_CourseMaterial` FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`);

ALTER TABLE `Sec_topic` ADD CONSTRAINT `FK_CourseSecTopic` FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`);


ALTER TABLE `C_Question` ADD CONSTRAINT `FK_QuestionStudent` FOREIGN KEY(`StudentID`) REFERENCES `Student`(`StudentID`);
ALTER TABLE `C_Question` ADD CONSTRAINT `FK_QuestionCourse` FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`);

ALTER TABLE `Playlist` ADD CONSTRAINT `FK_CMPlaylist` FOREIGN KEY(`CMID`) REFERENCES `C_Material`(`CMID`);
ALTER TABLE `Playlist` ADD CONSTRAINT `FK_StudentPlaylist` FOREIGN KEY(`StudentID`) REFERENCES `Student`(`StudentID`);
ALTER TABLE `Playlist` ADD CONSTRAINT `FK_CourseMaterialPlaylist` FOREIGN KEY(`CMID`) REFERENCES `C_Material`(`CMID`);

ALTER TABLE `Dable_file` ADD CONSTRAINT `FK_DownloadCourseMaterial` FOREIGN KEY(`CMID`) REFERENCES `C_Material`(`CMID`);
ALTER TABLE `Dable_file` ADD CONSTRAINT `FK_DownloadCourseID` FOREIGN KEY(`CourseID`) REFERENCES `C_Material`(`CourseID`);

ALTER TABLE `Link` ADD CONSTRAINT `FK_CM_Link` FOREIGN KEY(`CMID`) REFERENCES `C_Material`(`CMID`);
ALTER TABLE `Link` ADD CONSTRAINT `FK_CID_Link` FOREIGN KEY(`CourseID`) REFERENCES `C_Material`(`CourseID`);

ALTER TABLE `Post` ADD CONSTRAINT `FK_CM_Post` FOREIGN KEY(`CMID`) REFERENCES `C_Material`(`CMID`);
ALTER TABLE `Post` ADD CONSTRAINT `FK_CID_Post` FOREIGN KEY(`CourseID`) REFERENCES `C_Material`(`CourseID`);

ALTER TABLE `Quiz` ADD CONSTRAINT `FK_CM_Quiz` FOREIGN KEY(`CMID`) REFERENCES `C_Material`(`CMID`);
ALTER TABLE `Quiz` ADD CONSTRAINT `FK_CID_Quiz` FOREIGN KEY(`CourseID`) REFERENCES `C_Material`(`CourseID`);


ALTER TABLE `Q_question` ADD CONSTRAINT `FK_CM_Question` FOREIGN KEY(`CMID`) REFERENCES `Quiz`(`CMID`);
ALTER TABLE `Q_question` ADD CONSTRAINT `FK_Course_Question` FOREIGN KEY(`CourseID`) REFERENCES `Quiz`(`CourseID`);


ALTER TABLE `Q_answers` ADD CONSTRAINT `FK_QACMID` FOREIGN KEY(`CMID`) REFERENCES `Q_question`(`CMID`);
ALTER TABLE `Q_answers` ADD CONSTRAINT `FK_QACID` FOREIGN KEY(`CourseID`) REFERENCES `Q_question`(`CourseID`);
ALTER TABLE `Q_answers` ADD CONSTRAINT `FK_QuestionAnswer` FOREIGN KEY(`QuestionID`) REFERENCES `Q_question`(`QuestionID`);


ALTER TABLE `CM_Complete` ADD CONSTRAINT `FK_MaterialComplete` FOREIGN KEY(`CMID`) REFERENCES `C_Material`(`CMID`);
ALTER TABLE `CM_Complete` ADD CONSTRAINT `FK_Courseomplete` FOREIGN KEY(`CourseID`) REFERENCES `C_Material`(`CourseID`);
ALTER TABLE `CM_Complete` ADD CONSTRAINT `FK_CM_student` FOREIGN KEY(`StudentID`) REFERENCES `Student`(`StudentID`);
/* REFERENCES ENROLLED IN STUDENT OR STUDENT**/

ALTER TABLE `F_Create` ADD CONSTRAINT `FK_FacultyCreate` FOREIGN KEY(`FacultyID`) REFERENCES `Faculty`(`StudentID`);
ALTER TABLE `F_Create` ADD CONSTRAINT `FK_CreateCourse` FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`);

ALTER TABLE `Enroll_in` ADD CONSTRAINT `FK_CourseEnroll` FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`);
ALTER TABLE `Enroll_in` ADD CONSTRAINT `FK_StudentEnrolls` FOREIGN KEY(`StudentID`) REFERENCES `Student`(`StudentID`);

ALTER TABLE `Interest` ADD CONSTRAINT `FK_StudentInterests` FOREIGN KEY(`StudentID`) REFERENCES `Student`(`StudentID`);
ALTER TABLE `Interest` ADD CONSTRAINT `FK_CourseInterests` FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`);

ALTER TABLE `Judge` ADD CONSTRAINT `FK_FacultyJudge` FOREIGN KEY(`F_ID`) REFERENCES `Faculty`(`StudentID`);
ALTER TABLE `Judge` ADD CONSTRAINT `FK_JudgeQuestion` FOREIGN KEY(`CQID`) REFERENCES `C_Question`(`CQID`);
ALTER TABLE `Judge` ADD CONSTRAINT `FK_JudgeCourse` FOREIGN KEY(`CourseID`) REFERENCES `C_Question`(`CourseID`);


ALTER TABLE `Relate_to` ADD CONSTRAINT `FK_QuestionRelatesTo` FOREIGN KEY(`CQID`) REFERENCES `C_Question`(`CQID`);
ALTER TABLE `Relate_to` ADD CONSTRAINT `FK_CourseMaterialRelatesTo` FOREIGN KEY(`CMID`) REFERENCES `C_Material`(`CMID`);
ALTER TABLE `Relate_to` ADD CONSTRAINT `FK_CourseRelatesTo` FOREIGN KEY(`CourseID`) REFERENCES `C_Material`(`CourseID`);

ALTER TABLE `s_like` ADD CONSTRAINT `FK_StudentLikes` FOREIGN KEY(`StudentID`) REFERENCES `Student`(`StudentID`);
ALTER TABLE `s_like` ADD CONSTRAINT `FK_StudentLikedQuestions` FOREIGN KEY(`CQID`) REFERENCES `C_Question`(`CQID`);
ALTER TABLE `s_like` ADD CONSTRAINT `FK_StudentLikedcourse` FOREIGN KEY(`CourseID`) REFERENCES `C_Question`(`CourseID`);


















