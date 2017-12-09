/*******************************************************************************
   POPULATE TABLES
********************************************************************************/

/*			USERS			*/

/*
	Student IDS 1-10 ARE STUDENTS ONLY
	STUDENT IDS 11-12 ARE FACULTY AND STUDENTS
	STUDENTS IDS 12-22 ARE ADMIN, FACULTY, AND STUDENTS
*/

INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('luisg@embraer.com.br','Luís', 'Gonçalves', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'Brazil', '12227');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('leonekohler@surfeu.de', 'Leonie', 'Köhler', 'Keplerstraße 7' , 'Stuttgart', 'Germany', '70174');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('ftremblay@gmail.com', 'François', 'Tremblay', '1498 rue Bélanger', 'Montréal', 'Canada', '75587');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('bjorn.hansen@yahoo.no', 'Bjørn', 'Hansen', 'Ullevålsveien 14', 'Oslo', 'Norway', '870171');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('frantisekw@jetbrains.com', 'František', 'Wichterlová', 'Klanova 9/506', 'Prague', 'Czech Republic', '14700');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('hholy@gmail.com', 'Helena', 'Holý', 'Rilská 3174/6', 'Prague', 'Czech Republic', '14300');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('astrid.gruber@apple.at', 'Astrid', 'Gruber', 'Rotenturmstraße 4, 1010 Innere Stadt', 'Vienne', 'Austria', '1010');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('daan_peeters@apple.be', 'Daan', 'Peeters', 'Grétrystraat 63', 'Brussels', 'Belgium', '1000');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('kara.nielsen@jubii.dk', 'Kara', 'Nielsen', 'Sønder Boulevard 51', 'Copenhagen', 'Denmark', '1720');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('eduardo@woodstock.com.br', 'Eduardo', 'Martins', 'Rua Dr. Falcão Filho, 155', 'São Paulo', 'Brazil', '01007');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('alero@uol.com.br', 'Alexandre', 'Rocha', 'Av. Paulista, 2022', 'São Paulo', 'Brazil', '01310');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('john@gmail.com','John', 'Maroney', '123 Happy Lane', 'Boston', 'MA', '02115');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('lenadunham@aol.com', 'Lena', 'Dunham', '101 Manhattan Ave' , 'New York', 'New York', '02101');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('iknownuthin@gmail.com', 'Jon', 'Snow', '4123 Stark Lane', 'Winterfell', 'The Seven Kingdoms', '100001');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('khaleesi@gmail.com', 'Daenerys', 'Targaryan', '716 DragonStone Pl', 'Free Cities', 'The Seven Kingdoms', '01210');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('notAMouthbreater@jetbrains.com', 'Eleven', 'James', '4134 Demagorgon St', 'Hawkins', 'United States', '14142');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('HelenHunt@gmail.com', 'Helen', 'Hunt', '3374 Commonwealth Ave', 'Chicago', 'United States', '31414');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('mcgruber@apple.com', 'Ben', 'MacGruber', '1343 Macbook St', 'Tallahasee', 'United States', '101310');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('dunkin4Life@me.com', 'Duncan', 'Donath', '24134 Donuts Ave', 'January', 'Mississippi', '41341');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('jGraff@hotmail.com', 'Jonathan', 'Graff', '2923 Massachusetts Ave', 'Boston', 'United States', '11400');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('EdMartinez@aol.com', 'Ed', 'Martinez', 'Rua Faca, 155', 'Santiago', 'Chile', '01001');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('albertoCubano@live.com', 'Alberto', 'Cubana', 'Avenida Popular, 314', 'Mexico D.F.', 'Mexico', '32423');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('juanaquinones@live.com', 'Juana', 'Quinones', 'Avenida Popular, 413', 'Arica', 'Chile', '141340');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('thegirlwithnoname@gmail.com', 'Arya', 'Stark', '123 Newbury Lane', 'Dorn', 'The Seven Kingdoms', '372384');
INSERT INTO `Student` (`Email`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`) VALUES ('handsomefelloe@me.com', 'Tyrion', 'Lannister', '342 Royal Way', 'Kings Landing', 'The Seven Kingdoms', '19834');

INSERT INTO `Admin` (`StudentID`,  `Date`, `Time`, `Grantor`) VALUES (22,  '10-04-2014', '23:00', NULL); 
INSERT INTO `Admin` (`StudentID`,  `Date`, `Time`, `Grantor`) VALUES (21,  '11-15-2015', '12:00', 22); 
INSERT INTO `Admin` (`StudentID`,  `Date`, `Time`, `Grantor`) VALUES (20, '04-14-2017', '13:00', 21); 
INSERT INTO `Admin` (`StudentID`,  `Date`, `Time`, `Grantor`) VALUES (19, '01-13-2012', '09:00', 21); 
INSERT INTO `Admin` (`StudentID`,  `Date`, `Time`, `Grantor`) VALUES (18,  '03-23-2013', '08:00', 19); 
INSERT INTO `Admin` (`StudentID`,  `Date`, `Time`, `Grantor`) VALUES (17,  '05-15-2013', '10:00', 19); 
INSERT INTO `Admin` (`StudentID`,  `Date`, `Time`, `Grantor`) VALUES (16,  '07-10-2015', '14:00', 18); 
INSERT INTO `Admin` (`StudentID`,  `Date`, `Time`, `Grantor`) VALUES (15, '08-28-2012', '15:00', 17); 
INSERT INTO `Admin` (`StudentID`,  `Date`, `Time`, `Grantor`) VALUES (14, '09-15-2014', '13:45', 16); 
INSERT INTO `Admin` (`StudentID`,  `Date`, `Time`, `Grantor`) VALUES (13, '06-19-2015', '12:30', 22); 

INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (11, 'Dean', 'Affl1', 'www.dean.com', '10-10-2010', '23:00', 'Indentity1', 22);
INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (12, 'Associate Professor', 'Affl2', 'www.dean.com', '10-10-2010', '23:00', 'Indentity2', 13);
INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (13, 'Associate Professor', 'Affl3', 'www.dean.com', '10-10-2010', '23:00', 'Indentity3', 19);
INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (14, 'Associate Professor', 'Affl3', 'www.dean.com', '10-10-2010', '23:00', 'Indentity4', 22);
INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (15, 'Associate Professor', 'Affl3', 'www.dean.com', '10-10-2010', '23:00', 'Indentity5', 21);
INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (16, 'Associate Professor', 'Affl3', 'www.dean.com', '10-10-2010', '23:00', 'Indentity6', 17);
INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (17, 'Associate Professor', 'Affl3', 'www.dean.com', '10-10-2010', '23:00', 'Indentity7', 21);
INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (18, 'Associate Professor', 'Affl3', 'www.dean.com', '10-10-2010', '23:00', 'Indentity8', 18);
INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (19, 'Associate Professor', 'Affl3', 'www.dean.com', '10-10-2010', '23:00', 'Indentity9', NULL);
INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (20, 'Associate Professor', 'Affl3', 'www.dean.com', '10-10-2010', '23:00', 'Indentity10', NULL);
INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (21, 'Associate Professor', 'Affl3', 'www.dean.com', '10-10-2010', '23:00', 'Indentity11', 20);
INSERT INTO `Faculty` (`StudentID`,`Title`, `Affiliation`,`Work_Website`, `Date`, `Time`, `Identity`, `AdminID`) VALUES (22, 'Associate Professor', 'Affl3', 'www.dean.com', '10-10-2010', '23:00', 'Indentity12', NULL);

/*NOTE: ADD NUMBERS FOR ALL USERS LATER */
INSERT INTO `Phone`(`StudentID`, `Phone_num`) VALUES (1, '(881) 524-4381');
INSERT INTO `Phone`(`StudentID`, `Phone_num`) VALUES (1, '(305) 651-4323');
INSERT INTO `Phone`(`StudentID`, `Phone_num`) VALUES (2, '(998) 938-6345');
INSERT INTO `Phone`(`StudentID`, `Phone_num`) VALUES (3, '(293) 992-7632');
INSERT INTO `Phone`(`StudentID`, `Phone_num`) VALUES (4, '(109) 472-1723');
INSERT INTO `Phone`(`StudentID`, `Phone_num`) VALUES (5, '(574) 294-6826');
INSERT INTO `Phone`(`StudentID`, `Phone_num`) VALUES (6, '(310) 748-8763');
INSERT INTO `Phone`(`StudentID`, `Phone_num`) VALUES (7, '(714) 292-5238');
INSERT INTO `Phone`(`StudentID`, `Phone_num`) VALUES (8, '(617) 836-4535');
INSERT INTO `Phone`(`StudentID`, `Phone_num`) VALUES (9, '(891) 561-2346');
INSERT INTO `Phone`(`StudentID`, `Phone_num`) VALUES (10,'(919) 293-9191');


/*			COURSES			*/
/*Ordered by CourseID*/
INSERT INTO `Course`(`CourseID`, `Name`, `Description`, `Icon`, `Cost`, `Pri_topic`) VALUES (1, 'CourseName1', 'Welcome to CouseName1', '', 1000, 'Pri_topic of CouseName1');
INSERT INTO `Course`(`CourseID`, `Name`, `Description`, `Icon`, `Cost`, `Pri_topic`) VALUES (2, 'CourseName2', 'Welcome to CourseName2', '', 1250, 'Pri_topic of CouseName2');
INSERT INTO `Course`(`CourseID`, `Name`, `Description`, `Icon`, `Cost`, `Pri_topic`) VALUES (3, 'CourseName3', 'Welcome to CourseName3', '', 1500, 'Pri_topic of CouseName3');
INSERT INTO `Course`(`CourseID`, `Name`, `Description`, `Icon`, `Cost`, `Pri_topic`) VALUES (4, 'CourseName4', 'Welcome to CourseName4', '', 1650, 'Pri_topic of CouseName4');
INSERT INTO `Course`(`CourseID`, `Name`, `Description`, `Icon`, `Cost`, `Pri_topic`) VALUES (5, 'CourseName5', 'Welcome to CourseName5', '', 1200, 'Pri_topic of CouseName5');
INSERT INTO `Course`(`CourseID`, `Name`, `Description`, `Icon`, `Cost`, `Pri_topic`) VALUES (6, 'CourseName6', 'Welcome to CourseName6', '', 1250, 'Pri_topic of CouseName6');
INSERT INTO `Course`(`CourseID`, `Name`, `Description`, `Icon`, `Cost`, `Pri_topic`) VALUES (7, 'CourseName7', 'Welcome to CourseName7', '', 1650, 'Pri_topic of CouseName7');
INSERT INTO `Course`(`CourseID`, `Name`, `Description`, `Icon`, `Cost`, `Pri_topic`) VALUES (8, 'CourseName8', 'Welcome to CourseName8', '', 1500, 'Pri_topic of CouseName8');
INSERT INTO `Course`(`CourseID`, `Name`, `Description`, `Icon`, `Cost`, `Pri_topic`) VALUES (9, 'CourseName9', 'Welcome to CourseName9', '', 1200, 'Pri_topic of CouseName9');
INSERT INTO `Course`(`CourseID`, `Name`, `Description`, `Icon`, `Cost`, `Pri_topic`) VALUES (10, 'CourseName10', 'Welcome to CourseName10', '', 1000, 'Pri_topic of CouseName10');

INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 1, 'Sec_topic 1 for Course 1' );
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 1, 'Sec_topic 2 for Course 1' );
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 1, 'Sec_topic 3 for Course 1' );
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 2, 'Sec_topic 1 for Course 2' );
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 2, 'Sec_topic 2 for Course 2');
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 3, 'Sec_topic 1 for Course 3' );
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 4, 'Sec_topic 1 for Course 4' );
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 5, 'Sec_topic 1 for Course 5' );
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 5, 'Sec_topic 2 for Course 5');
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 6, 'Sec_topic 1 for Course 6' );
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 7, 'Sec_topic 1 for Course 7' );
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 8, 'Sec_topic 1 for Course 8');
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 9, 'Sec_topic 1 for Course 9');
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 9, 'Sec_topic 2 for Course 10');
INSERT INTO `Sec_topic` ( `CourseID`, `Topic` ) VALUES( 10, 'Sec_topic 1 for Course 10');

/**________________________________________

		Course 1 Course Materials
________________________________________**/

INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (1, 1, 'CM1 for C1');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (2, 1, 'CM2 for C1');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (3, 1, 'CM3 for C1');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (4, 1, 'CM4 for C1');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (5, 1, 'CM5 for C1');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (6, 1, 'CM6 for C1');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (7, 1, 'CM7 for C1');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (8, 1, 'CM8 for C1');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (9, 1, 'CM9 for C1');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (10, 1, 'CM10 for C1');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (11, 1, 'CM11 for C1');

/**________________________________________

		Course 2 Course Materials
________________________________________**/

INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (1, 2, 'CM1 for C2');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (2, 2, 'CM2 for C2');
INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (3, 2, 'CM2 for C3');

/**________________________________________

		Course 3 Course Materials
________________________________________**/

INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (1, 3, 'CM1 for C3');

/**________________________________________

		Course 4 Course Materials
________________________________________**/

INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (1, 4, 'CM1 for C4');

/**________________________________________

		Course 5 Course Materials
________________________________________**/

INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (1, 5, 'CM1 for C5');

/**________________________________________

		Course 6 Course Materials
________________________________________**/

INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (1, 6, 'CM1 for C6');

/**________________________________________

		Course 7 Course Materials
________________________________________**/

INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (1, 7, 'CM1 for C7');

/**________________________________________

		Course 8 Course Materials
________________________________________**/

INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (1, 8, 'CM1 for C8');

/**________________________________________

		Course 9 Course Materials
________________________________________**/

INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (1, 9, 'CM1 for C9');

/**________________________________________

		Course 10 Course Materials
________________________________________**/

INSERT INTO `C_Material`(`CMID`, `CourseID`, `Name`) VALUES (1, 10, 'CM1 for C10');

/** COURSE QUESTIONS 
USE STUDENT IDS 1-10 
**/

INSERT INTO `C_Question` (`CQID`, `CourseID`, `Context`, `StudentID`, `Rank`) VALUES (1, 1,'How to understand lock?', 7, 3);
INSERT INTO `C_Question` (`CQID`,`CourseID`, `Context`, `StudentID`, `Rank`) VALUES (2,2, 'The program runs so slow on my laptop, why?', 2, 5);
INSERT INTO `C_Question` (`CQID`, `CourseID`,`Context`, `StudentID`, `Rank`) VALUES (3,1 ,'What should be highlighted in the text?', 7, 2);
INSERT INTO `C_Question` (`CQID`, `CourseID`,`Context`, `StudentID`, `Rank`) VALUES (4,3, 'Who is the author of the book?', 5, 9);
INSERT INTO `C_Question` (`CQID`, `CourseID`,`Context`, `StudentID`, `Rank`) VALUES (5, 4,'Wonder the deadline of hw2.', 10, 8);
INSERT INTO `C_Question` (`CQID`, `CourseID`,`Context`, `StudentID`, `Rank`) VALUES (6,5, 'How to download this file?', 1, 4);
INSERT INTO `C_Question` (`CQID`, `CourseID`,`Context`, `StudentID`, `Rank`) VALUES (7,6, 'Do we need to include the initialization time?', 8, 1);
INSERT INTO `C_Question` (`CQID`, `CourseID`,`Context`, `StudentID`, `Rank`) VALUES (8,7, 'There is a mistake in the article.', 3, 6);
INSERT INTO `C_Question` (`CQID`, `CourseID`,`Context`, `StudentID`, `Rank`) VALUES (9, 8,'Image processing has problems', 2, 10);
INSERT INTO `C_Question` (`CQID`, `CourseID`,`Context`, `StudentID`, `Rank`) VALUES (10, 9,'Who is the smartest one in the story?', 4, 7);
INSERT INTO `C_Question` (`CQID`, `CourseID`,`Context`, `StudentID`, `Rank`) VALUES (11, 1,'Who is our instructor?', 6, NULL);



/** PLAYLIST CREATED BY STUDENT 1 FOR COURSE MATERIALS IN COURSE 1 **/
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (1, 1, 1 , 1);
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (1, 3, 1 , 1);
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (1, 5, 1 , 1);
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (1, 7, 1 , 1);
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (1, 9, 1 , 1);
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (1, 10, 1 ,1);

INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (2, 1, 1 , 1);
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (2, 3, 1 , 1);

/** PLAYLIST CREATED BY STUDENT 2 FOR COURSE MATERIALS IN COURSE 1 AND COURSE 2 **/
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID`) VALUES (1, 1, 2 , 1);
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (1, 3, 2 , 1);
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (1, 4, 2 , 1);
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (1, 5, 2 , 1);
INSERT INTO `Playlist`(`PID`, `CMID`, `StudentID`,`CourseID` ) VALUES (1, 2, 2 , 2);


/** COURSE 1 MATERIALS 1 - 4 ARE DOWNLOADABLE FILES AND CMID 1 FOR COURSES 2-7 **/
INSERT INTO `dable_file`(`CMID`, `CourseID` , `Type`, `Size`, `Path`) VALUES (1, 1, 'type1 for course 1', 'size1', 'path1');
INSERT INTO `dable_file`(`CMID`, `CourseID` , `Type`, `Size`, `Path`) VALUES (2, 1, 'type2 for course 1', 'size2', 'path2');
INSERT INTO `dable_file`(`CMID`, `CourseID` , `Type`, `Size`, `Path`) VALUES (3, 1, 'type3 for course 1', 'size3', 'path3');
INSERT INTO `dable_file`(`CMID`, `CourseID` , `Type`, `Size`, `Path`) VALUES (4, 1, 'type4 for course 1', 'size4', 'path4');
INSERT INTO `dable_file`(`CMID`, `CourseID` , `Type`, `Size`, `Path`) VALUES (1, 2, 'type5 for course 2', 'size5', 'path5');
INSERT INTO `dable_file`(`CMID`, `CourseID` , `Type`, `Size`, `Path`) VALUES (1, 3, 'type6 for course 3', 'size6', 'path6');
INSERT INTO `dable_file`(`CMID`, `CourseID` , `Type`, `Size`, `Path`) VALUES (1, 4, 'type7 for course 4', 'size7', 'path7');
INSERT INTO `dable_file`(`CMID`, `CourseID` , `Type`, `Size`, `Path`) VALUES (1, 5, 'type8 for course 5', 'size8', 'path8');
INSERT INTO `dable_file`(`CMID`, `CourseID` , `Type`, `Size`, `Path`) VALUES (1, 6, 'type9 for course 6', 'size9', 'path9');
INSERT INTO `dable_file`(`CMID`, `CourseID` , `Type`, `Size`, `Path`) VALUES (1, 7, 'type10 for course 7', 'size10', 'path10');

/**COURSE MATERIALS 5-7 FROM COURSE 1 ARE LINKS 
NOTE ADD MORE LATER**/
INSERT INTO `link`(`CMID`, `CourseID` ,`URL`, `Video_Tag`) VALUES (5, 1 ,'link1.com', NULL);
INSERT INTO `link`(`CMID`, `CourseID` ,`URL`, `Video_Tag`) VALUES (6,1, 'link2.com', 1);
INSERT INTO `link`(`CMID`, `CourseID` ,`URL`, `Video_Tag`) VALUES (7,1 ,'link3.com', NULL);

/**COURSE MATERIAL 8 FROM COURSE 1 IS A POST AND CMID 1 FOR COURSE 8-10 ARE POSTS
NOTE ADD MORE LATER**/

INSERT INTO `post`(`CMID`, `CourseID` ,`Text`) VALUES (8, 1, 'text1');
INSERT INTO `post`(`CMID`, `CourseID` ,`Text`) VALUES (1, 8, 'text2');
INSERT INTO `post`(`CMID`, `CourseID` ,`Text`) VALUES (1, 9,'text3');
INSERT INTO `post`(`CMID`, `CourseID` ,`Text`) VALUES (1, 10,'text4');


/**COURSE MATERIALS 9-11 IN COURSE 1 ARE QUIZZES
NOTE ADD MORE LATER**/

INSERT INTO `quiz`(`CMID`, `CourseID` ,`P_score`) VALUES (9, 1, 65);
INSERT INTO `quiz`(`CMID`, `CourseID` ,`P_score`) VALUES (10, 1, 60);
INSERT INTO `quiz`(`CMID`, `CourseID` ,`P_score`) VALUES (11, 1, 90);


/**________________________________________

		Quiz 1 Questions
		CMID 9
		FOR COURSE 1
________________________________________**/

INSERT INTO `Q_question` (`QuestionID`,`CMID`, `CourseID`,  `Text`) VALUES (1,9, 1,  'Text1 for Quiz1 C1');
INSERT INTO `Q_question` (`QuestionID`,`CMID`, `CourseID`,  `Text`)  VALUES (2,9,1 , 'Text2 for Quiz1 C1');
INSERT INTO `Q_question` (`QuestionID`,`CMID`, `CourseID`,  `Text`)  VALUES (3,9, 1, 'Text3 for Quiz1 C1');
INSERT INTO `Q_question` (`QuestionID`,`CMID`, `CourseID`,  `Text`)  VALUES (4,9,1, 'Text4 for Quiz1 C1');
INSERT INTO `Q_question` (`QuestionID`,`CMID`, `CourseID`,  `Text`)  VALUES (5,9, 1, 'Text5 for Quiz1 C1');

/**________________________________________

		Quiz 2 Questions
		CMID 10
		FOR COURSE 1
________________________________________**/

INSERT INTO `Q_question` (`QuestionID`,`CMID`, `CourseID`,  `Text`) VALUES (1,10, 1,  'Text1 for Quiz2 C1');
INSERT INTO `Q_question` (`QuestionID`,`CMID`, `CourseID`,  `Text`) VALUES (2,10, 1,  'Text2 for Quiz2 C1');
INSERT INTO `Q_question` (`QuestionID`,`CMID`, `CourseID`,  `Text`) VALUES (3,10, 1,  'Text3 for Quiz2 C1');


/**________________________________________

		Quiz 3 Questions
		CMID 11
		FOR COURSE 1
________________________________________**/


INSERT INTO `Q_question` (`QuestionID`,`CMID`, `CourseID`,  `Text`) VALUES (1,11, 1,  'Text1 for Quiz3 C1');
INSERT INTO `Q_question` (`QuestionID`,`CMID`, `CourseID`,  `Text`) VALUES (2,11, 1,  'Text2 for Quiz3 C1');


/**________________________________________

		Quiz 1 Answers
		CMID 9
		FOR COURSE 1
		QuestionID 1
________________________________________**/

INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (1, 9, 1, 1, 'A', 'Feedback for A', 1);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (2, 9, 1, 1, 'B', 'Feedback for B', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (3, 9, 1, 1, 'C', 'Feedback for C', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (4, 9, 1, 1, 'D', 'Feedback for D', 0);

/**________________________________________

		Quiz 1 Answers
		CMID 9
		FOR COURSE 1
		QuestionID 2
________________________________________**/

INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (1, 9, 1, 2, 'A', 'Feedback for A', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (2, 9, 1, 2, 'B', 'Feedback for B', 1);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (3, 9, 1, 2, 'C', 'Feedback for C', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (4, 9, 1, 2, 'D', 'Feedback for D', 0);

/**________________________________________

		Quiz 1 Answers
		CMID 9
		FOR COURSE 1
		QuestionID 3
________________________________________**/

INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (1, 9, 1, 3, 'A', 'Feedback for A', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (2, 9, 1, 3, 'B', 'Feedback for B', 1);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (3, 9, 1, 3, 'C', 'Feedback for C', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (4, 9, 1, 3, 'D', 'Feedback for D', 0);


/**________________________________________

		Quiz 1 Answers
		CMID 9
		FOR COURSE 1
		QuestionID 4
________________________________________**/

INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (1, 9, 1, 4, 'A', 'Feedback for A', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (2, 9, 1, 4, 'B', 'Feedback for B', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (3, 9, 1, 4, 'C', 'Feedback for C', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (4, 9, 1, 4, 'D', 'Feedback for D', 1);

/**________________________________________

		Quiz 1 Answers
		CMID 9
		FOR COURSE 1
		QuestionID 5
________________________________________**/

INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (1, 9, 1, 5, 'A', 'Feedback for A', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (2, 9, 1, 5, 'B', 'Feedback for B', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (3, 9, 1, 5, 'C', 'Feedback for C', 1);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (4, 9, 1, 5, 'D', 'Feedback for D', 0);


/**________________________________________

		Quiz 2 Answers
		CMID 10
		FOR COURSE 1
		QuestionID 1
________________________________________**/

INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (1, 10, 1, 1, 'A', 'Feedback for A', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (2, 10, 1, 1, 'B', 'Feedback for B', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (3, 10, 1, 1, 'C', 'Feedback for C', 1);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (4, 10, 1, 1, 'D', 'Feedback for D', 0);

/**________________________________________

		Quiz 2 Answers
		CMID 10
		FOR COURSE 1
		QuestionID 2
________________________________________**/

INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (1, 10, 1, 2, 'A', 'Feedback for A', 1);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (2, 10, 1, 2, 'B', 'Feedback for B', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (3, 10, 1, 2, 'C', 'Feedback for C', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (4, 10, 1, 2, 'D', 'Feedback for D', 0);

/**________________________________________

		Quiz 2 Answers
		CMID 10
		FOR COURSE 1
		QuestionID 3
________________________________________**/

INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (1, 10, 1, 3, 'A', 'Feedback for A', 1);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (2, 10, 1, 3, 'B', 'Feedback for B', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (3, 10, 1, 3, 'C', 'Feedback for C', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (4, 10, 1, 3, 'D', 'Feedback for D', 0);


/**________________________________________

		Quiz 3 Answers
		CMID 11
		FOR COURSE 1
		QuestionID 1
________________________________________**/

INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (1, 11, 1, 1, 'A', 'Feedback for A', 1);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (2, 11, 1, 1, 'B', 'Feedback for B', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (3, 11, 1, 1, 'C', 'Feedback for C', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (4, 11, 1, 1, 'D', 'Feedback for D', 0);

/**________________________________________

		Quiz 3 Answers
		CMID 11
		FOR COURSE 1
		QuestionID 2
________________________________________**/

INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (1, 11, 1, 2, 'A', 'Feedback for A', 1);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (2, 11, 1, 2, 'B', 'Feedback for B', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (3, 11, 1, 2, 'C', 'Feedback for C', 0);
INSERT INTO `Q_answers` (`AnswerID`, `CMID`, `CourseID`, `QuestionID`,`Answer`, `Feedback`,`Indication`) 
VALUES (4, 11, 1, 2, 'D', 'Feedback for D', 0);


/** STUDENT 1 COURSE MATERIAL RESPONSIBILITIES FOR COURSE 1 **/
INSERT INTO `CM_Complete` (`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (1, 1, 1, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (2, 1, 1, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete` (`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (3, 1, 1, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (4, 1, 1, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (5, 1, 1, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (6, 1, 1, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (7, 1, 1, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (8, 1, 1, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (9, 1, 1, '11/15/2017', '10:00', 82 ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (10, 1, 1, '11/15/2017', '10:00', 74 ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (11, 1, 1, '11/15/2017', '10:00', 90 ,1);

/** STUDENT 2 COURSE MATERIAL RESPONSIBILITIES FOR COURSE 1 **/
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (1, 1, 2, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (2, 1, 2, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (3, 1, 2, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (4, 1, 2, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (5, 1, 2, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (6, 1, 2, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (7, 1, 2, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (8, 1, 2, '11/15/2017', '10:00', NULL ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (9, 1, 2, '11/15/2017', '10:00', 66 ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (10, 1, 2, '11/15/2017', '10:00', 73 ,1);
INSERT INTO `CM_Complete`(`CMID`, `CourseID`,`StudentID`, `Date`, `Time`, `Score`, `cFLag` ) 
VALUES (11, 1, 2, '11/15/2017', '10:00', 74 ,1);

/**FACULTY/ADMIN 11 AND 21 CREATED COURSE 9 TOGETHER**/
INSERT INTO `F_Create` (`FacultyID`, `CourseID`, `Date`) VALUES (11,1, '4-4-2013');
INSERT INTO `F_Create` (`FacultyID`, `CourseID`, `Date`) VALUES (11,2, '7-30-2014');
INSERT INTO `F_Create` (`FacultyID`, `CourseID`, `Date`) VALUES (12,3, '9-18-2012');
INSERT INTO `F_Create` (`FacultyID`, `CourseID`, `Date`) VALUES (12,4, '3-5-2013');
INSERT INTO `F_Create` (`FacultyID`, `CourseID`, `Date`) VALUES (17,5, '12-4-2015');
INSERT INTO `F_Create` (`FacultyID`, `CourseID`, `Date`) VALUES (18,6,'4-4-2013');
INSERT INTO `F_Create` (`FacultyID`, `CourseID`, `Date`) VALUES (19,7, '5-12-2016');
INSERT INTO `F_Create` (`FacultyID`, `CourseID`, `Date`) VALUES (20,8, '1-23-2014');
INSERT INTO `F_Create` (`FacultyID`, `CourseID`, `Date`) VALUES (21,9,'8-10-2015');
INSERT INTO `F_Create` (`FacultyID`, `CourseID`, `Date`) VALUES (11,9, '8-10-2015');
INSERT INTO `F_Create` (`FacultyID`, `CourseID`, `Date`) VALUES (22,10,'6-2-2016');

/**STUDENT 1 AND STUDENT 2 ARE IN THE SAME COURSES (COURSES 1 AND 2) **/
INSERT INTO `Enroll_in`(`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`, `Comment`, `Rating`, `C_date`, `C_time`) VALUES (1, 1, 'AX0190', '09/08/17', '08:00', 'ashdf cabsdf askjc a', NULL, NULL, NULL);
INSERT INTO `Enroll_in`(`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`, `Comment`, `Rating`, `C_date`, `C_time`) VALUES (1, 2, 'AX0190', '09/08/17', '08:00', 'ashdf cabsdf askjc a', NULL, NULL, NULL);
INSERT INTO `Enroll_in`(`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`, `Comment`, `Rating`, `C_date`, `C_time`) VALUES (2, 1, 'AX0190', '09/08/17', '08:00', 'ashdf cabsdf askjc a', NULL, NULL, NULL);
INSERT INTO `Enroll_in`(`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`, `Comment`, `Rating`, `C_date`, `C_time`) VALUES (2, 2, 'AX0190', '09/08/17', '08:00', 'ashdf cabsdf askjc a', NULL, NULL, NULL);
INSERT INTO `Enroll_in`(`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`, `Comment`, `Rating`, `C_date`, `C_time`) VALUES (3, 3, 'AX0190', '09/08/17', '08:00', 'ashdf cabsdf askjc a', NULL, NULL, NULL);
INSERT INTO `Enroll_in`(`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`, `Comment`, `Rating`, `C_date`, `C_time`) VALUES (4, 4, 'AX0190', '09/08/17', '08:00', 'ashdf cabsdf askjc a', NULL, NULL, NULL);
INSERT INTO `Enroll_in`(`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`, `Comment`, `Rating`, `C_date`, `C_time`) VALUES (5, 5, 'AX0190', '09/08/17', '08:00', 'ashdf cabsdf askjc a', NULL, NULL, NULL);
INSERT INTO `Enroll_in`(`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`, `Comment`, `Rating`, `C_date`, `C_time`) VALUES (6, 6, 'AX0190', '09/08/17', '08:00', 'ashdf cabsdf askjc a', NULL, NULL, NULL);
INSERT INTO `Enroll_in`(`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`, `Comment`, `Rating`, `C_date`, `C_time`) VALUES (7, 7, 'AX0190', '09/08/17', '08:00', 'ashdf cabsdf askjc a', NULL, NULL, NULL);
INSERT INTO `Enroll_in`(`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`, `Comment`, `Rating`, `C_date`, `C_time`) VALUES (8, 8, 'AX0190', '09/08/17', '08:00', 'ashdf cabsdf askjc a', NULL, NULL, NULL);
INSERT INTO `Enroll_in`(`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`, `Comment`, `Rating`, `C_date`, `C_time`) VALUES (9, 9, 'AX0190', '09/08/17', '08:00', 'ashdf cabsdf askjc a', NULL, NULL, NULL);


INSERT INTO `Interest` (`StudentID`, `CourseID`) VALUES (3, 7);
INSERT INTO `Interest` (`StudentID`, `CourseID`) VALUES (2, 6);
INSERT INTO `Interest` (`StudentID`, `CourseID`) VALUES (7, 3);
INSERT INTO `Interest` (`StudentID`, `CourseID`) VALUES (6, 9);
INSERT INTO `Interest` (`StudentID`, `CourseID`) VALUES (5, 10);
INSERT INTO `Interest` (`StudentID`, `CourseID`) VALUES (6, 8);
INSERT INTO `Interest` (`StudentID`, `CourseID`) VALUES (9, 9);
INSERT INTO `Interest` (`StudentID`, `CourseID`) VALUES (1, 5);
INSERT INTO `Interest` (`StudentID`, `CourseID`) VALUES (4, 5);
INSERT INTO `Interest` (`StudentID`, `CourseID`) VALUES (8, 2);

INSERT INTO `Judge`(`F_ID`,`CQID`,`CourseID`, `Answer`, `Visibility`) VALUES (11, 3, 1, 'Hammer.', 1);
INSERT INTO `Judge`(`F_ID`,`CQID`,`CourseID`, `Answer`, `Visibility`) VALUES (12, 5,4, '11.15.', 1);
INSERT INTO `Judge`(`F_ID`,`CQID`,`CourseID`, `Answer`, `Visibility`) VALUES (11, 9,8 ,'Download the new image.', 1);
INSERT INTO `Judge`(`F_ID`,`CQID`,`CourseID`, `Answer`, `Visibility`) VALUES (11, 1, 1 ,'See OS book.', 1);
INSERT INTO `Judge`(`F_ID`,`CQID`,`CourseID`, `Answer`, `Visibility`) VALUES (13, 2, 2,'Change disk to SSD.', 1);
INSERT INTO `Judge`(`F_ID`,`CQID`,`CourseID`, `Answer`, `Visibility`) VALUES (14, 7, 6,'No.', 1);
INSERT INTO `Judge`(`F_ID`,`CQID`,`CourseID`, `Answer`, `Visibility`) VALUES (15, 4, 3,'Mike.', 1);
INSERT INTO `Judge`(`F_ID`,`CQID`,`CourseID`, `Answer`, `Visibility`) VALUES (16, 10,9, 'Steven.', 1);
INSERT INTO `Judge`(`F_ID`,`CQID`,`CourseID`, `Answer`, `Visibility`) VALUES (19, 8, 7,'I undate the article.', 1);
INSERT INTO `Judge`(`F_ID`,`CQID`,`CourseID`, `Answer`, `Visibility`) VALUES (17,6, 5,'Click on the URL.', 1);
INSERT INTO `Judge`(`F_ID`,`CQID`,`CourseID`, `Answer`, `Visibility`) VALUES (18, 10, 9,  NULL, 0);


INSERT INTO `Relate_to`(`CQID`,`CMID`,`CourseID` ) VALUES (1,1,1);
INSERT INTO `Relate_to`(`CQID`,`CMID`,`CourseID`) VALUES (2,2,2);
INSERT INTO `Relate_to`(`CQID`,`CMID`,`CourseID`) VALUES (3,3,1);
INSERT INTO `Relate_to`(`CQID`,`CMID`,`CourseID`) VALUES (4,1,3);
INSERT INTO `Relate_to`(`CQID`,`CMID`,`CourseID`) VALUES (5,2,4);
INSERT INTO `Relate_to`(`CQID`,`CMID`,`CourseID`) VALUES (6,3,5);
INSERT INTO `Relate_to`(`CQID`,`CMID`,`CourseID`) VALUES (7,1,6);
INSERT INTO `Relate_to`(`CQID`,`CMID`,`CourseID`) VALUES (8,2,7);
INSERT INTO `Relate_to`(`CQID`,`CMID`,`CourseID`) VALUES (9,3,8);
INSERT INTO `Relate_to`(`CQID`,`CMID`,`CourseID`) VALUES (10,1,9);

INSERT INTO `s_like`(`StudentID`, `CQID`,`CourseID`, `Rating`) VALUES (10, 3,1, 8);
INSERT INTO `s_like`(`StudentID`, `CQID`,`CourseID`, `Rating`) VALUES (7, 5,4, 5);
INSERT INTO `s_like`(`StudentID`, `CQID`,`CourseID`, `Rating`) VALUES (3, 3,1, 10);
INSERT INTO `s_like`(`StudentID`, `CQID`,`CourseID`, `Rating`) VALUES (9, 1,1, 6);
INSERT INTO `s_like`(`StudentID`, `CQID`,`CourseID`, `Rating`) VALUES (5, 4,3, 7);
INSERT INTO `s_like`(`StudentID`, `CQID`,`CourseID`, `Rating`) VALUES (2, 7,6, 9);
INSERT INTO `s_like`(`StudentID`, `CQID`,`CourseID`, `Rating`) VALUES (8, 1, 1, 8);
INSERT INTO `s_like`(`StudentID`, `CQID`,`CourseID`, `Rating`) VALUES (6, 2 , 2, 6);
INSERT INTO `s_like`(`StudentID`, `CQID`,`CourseID`, `Rating`) VALUES (3, 6 ,5, 9);
INSERT INTO `s_like`(`StudentID`, `CQID`,`CourseID`, `Rating`) VALUES (1, 10, 9, 8);














