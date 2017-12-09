/**-------------------------------------------------------- 
						Task A: 
--------------------------------------------------------**/
INSERT INTO `Student` (`Email`, `Password`, `Student_pic`, `F_Name`, `L_Name`, `Street`, `City`, `Country`, `ZipCode`)
VALUES (email_param, password_param, pic_param, fname_param, l_name_param, street_param, city_param, country_param, zip_param);

/* TEST CASE:
INSERT INTO Student (Email, F_Name, L_Name, Street, City, Country, ZipCode)
VALUES ('tracymorg@gmail.com', 'Tracy', 'Morgan', '360 Huntington Ave' , 'Boston', 'USA', '02115');
*/



/**-------------------------------------------------------- 
						Task B: 
--------------------------------------------------------**/
UPDATE `Faculty`
SET `Faculty`.`AdminID` = Admin1.`StudentID`
WHERE `Faculty`.`Title` = param1 AND `Faculty`.`Affiliation` = param2 AND `Faculty`.`Work_Website` = param3;

/*TEST CASE:
UPDATE Faculty
SET Faculty.AdminID = 22
WHERE Faculty.Title = 'Associate Professor' AND Faculty.Affiliation = 'Affl3' AND Faculty.Work_Website = 'www.dean11.com'
*/
/* Get a.StudentID from admin logged in */

UPDATE `Admin`
SET `Admin`.`Grantor` = Admin1.StudentID
WHERE `Admin`.`StudentID` = ?;

/*TEST CASE:
UPDATE Admin
SET Admin.Grantor = 19
WHERE Admin.StudentID = 22;
*/
/* Get a.StudentID from admin logged in */



/**-------------------------------------------------------- 
						Task C: 
--------------------------------------------------------**/
SELECT * FROM
(SELECT c.Name AS Course_Name, c.Pri_Topic AS Primary_Topic, st.Topic AS Secondary_Topics, 'Enrolled' AS Category
FROM ((Student s INNER JOIN Enroll_in e ON s.StudentID = e.StudentID)
	INNER JOIN Course c ON e.CourseID = c.CourseID)
	INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
WHERE s.StudentID = ?
ORDER BY e.Rating DESC
LIMIT 100) AS a 

UNION
 
(SELECT c.Name AS Course_Name, c.Pri_Topic AS Primary_Topic, st.Topic AS Secondary_Topics,'Interested' AS Category
FROM ((Student s INNER JOIN Interest i ON s.StudentID = i.StudentID)
	INNER JOIN Course c ON i.CourseID = c.CourseID)
	INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
WHERE s.StudentID = ?)

UNION 

(SELECT c.Name AS Course_Name, c.Pri_Topic AS Primary_Topic, st.Topic AS Secondary_Topics,'Completed' AS Category
FROM ((Student s INNER JOIN Enroll_in e ON s.StudentID = e.StudentID)
	INNER JOIN Course c ON e.CourseID = c.CourseID)
	INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
WHERE s.StudentID = ? AND e.C_date IS NOT NULL)


/*TEST CASE:
SELECT * FROM
(SELECT c.Name AS Course_Name, c.Pri_Topic AS Primary_Topic, st.Topic AS Secondary_Topics, 'Enrolled' AS Category
FROM ((Student s INNER JOIN Enroll_in e ON s.StudentID = e.StudentID)
	INNER JOIN Course c ON e.CourseID = c.CourseID)
	INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
WHERE s.StudentID = 8
ORDER BY e.Rating DESC
LIMIT 100) AS a 

UNION
 
(SELECT c.Name AS Course_Name, c.Pri_Topic AS Primary_Topic, st.Topic AS Secondary_Topics,'Interested' AS Category
FROM ((Student s INNER JOIN Interest i ON s.StudentID = i.StudentID)
	INNER JOIN Course c ON i.CourseID = c.CourseID)
	INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
WHERE s.StudentID = 8)

UNION 

(SELECT c.Name AS Course_Name, c.Pri_Topic AS Primary_Topic, st.Topic AS Secondary_Topics,'Completed' AS Category
FROM ((Student s INNER JOIN Enroll_in e ON s.StudentID = e.StudentID)
	INNER JOIN Course c ON e.CourseID = c.CourseID)
	INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
WHERE s.StudentID = 8 AND e.C_date IS NOT NULL)



/**-------------------------------------------------------- 
						Task D: 
--------------------------------------------------------**/
INSERT INTO `Enroll_in` (`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`) 
VALUES (student_param, course_param, code_param, CURDATE(), CURTIME())

/*TEST CASE:
INSERT INTO `Enroll_in` (`StudentID`, `CourseID`, `Conf_Code`, `Date`, `Time`) 
VALUES (8, 1, '1AX940', CURDATE(), CURTIME());
*/



/**-------------------------------------------------------- 
						Task E: 
--------------------------------------------------------**/
SELECT cm.Name AS Course_Material, IF(cc.cFlag =1, 'C', 'I') AS Complete_Incomplete
FROM C_Material cm INNER JOIN Course c ON cm.CourseID = c.CourseID
	INNER JOIN CM_Complete cc ON cm.CMID = cc.CMID
    INNER JOIN Student s ON s.StudentID = cc.StudentID
WHERE c.CourseID IN 
(
	SELECT c.CourseID
	FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
		INNER JOIN Student s ON e.StudentID = s.StudentID
	WHERE s.StudentID = ?
) AND s.StudentID = ?

/*TEST CASE:
SELECT cm.Name AS Course_Material, IF(cc.cFlag =1, 'C', 'I') AS Complete_Incomplete
FROM C_Material cm INNER JOIN Course c ON cm.CourseID = c.CourseID
	INNER JOIN CM_Complete cc ON cm.CMID = cc.CMID
    INNER JOIN Student s ON s.StudentID = cc.StudentID
WHERE c.CourseID IN 
(
	SELECT c.CourseID
	FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
		INNER JOIN Student s ON e.StudentID = s.StudentID
	WHERE s.StudentID = 1
) AND s.StudentID =1
*/



/**-------------------------------------------------------- 
						Task F: 
--------------------------------------------------------**/
UPDATE CM_Complete
INNER JOIN C_Material ON CM_Complete.CMID = C_Material.CMID
INNER JOIN Student ON CM_Complete.StudentID = Student.StudentID
SET CM_Complete.cFlag = 1, CM_Complete.Date = CURDATE(), CM_Complete.Time = CURTIME()
WHERE Student.StudentID = param1 AND C_Material.Name = param2;

SELECT IF 
( 
	(
		SELECT COUNT(cm.CMID)
		FROM C_Material cm INNER JOIN Course c ON cm.CourseID = c.CourseID
		WHERE c.CourseID = 1) = 
	(
		SELECT SUM(cc.cFlag)
		FROM CM_Complete cc INNER JOIN C_Material cm ON cc.CMID = cm.CMID
			INNER JOIN Student s ON cc.StudentID = s.StudentID
   			INNER JOIN Course c ON c.CourseID = cm.CourseID
		WHERE s.StudentID = param1 AND c.CourseID = param3
	) 
	, 'Course Completed' , 'Incomplete Course Materials'
) AS Complete_Incomplete

/*TEST CASE:
UPDATE CM_Complete
INNER JOIN C_Material ON CM_Complete.CMID = C_Material.CMID
INNER JOIN Student ON CM_Complete.StudentID = Student.StudentID
SET CM_Complete.cFlag = 1, CM_Complete.Date = CURDATE(), CM_Complete.Time = CURTIME()
WHERE Student.StudentID = 1 AND C_Material.Name = 'CM1 FOR C1';

SELECT IF 
( 
	(
		SELECT COUNT(cm.CMID)
		FROM C_Material cm INNER JOIN Course c ON cm.CourseID = c.CourseID
		WHERE c.CourseID = 1) = 
	(
		SELECT SUM(cc.cFlag)
		FROM CM_Complete cc INNER JOIN C_Material cm ON cc.CMID = cm.CMID
			INNER JOIN Student s ON cc.StudentID = s.StudentID
   			INNER JOIN Course c ON c.CourseID = cm.CourseID
		WHERE s.StudentID = 1 AND c.CourseID =1
	) 
	, 'Course Completed' , 'Incomplete Course Materials'
) AS Complete_Incomplete
*/



/**-------------------------------------------------------- 
						Task G: 
--------------------------------------------------------**/
/* Assumes completed all course material */
SELECT c.Name AS Course_Name, e.C_date AS Completion_Date
FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
	INNER JOIN Student s ON e.StudentId = s.StudentID
WHERE e.C_date IS NOT NULL AND s.StudentID = ?

/*TEST CASE:
SELECT c.Name AS Course_Name, e.C_date AS Completion_Date
FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
	INNER JOIN Student s ON e.StudentId = s.StudentID
WHERE e.C_date IS NOT NULL AND s.StudentID = 8
*/



/**-------------------------------------------------------- 
						Task H: 
--------------------------------------------------------**/
SELECT c.Name AS Course_Name, e.Date AS Enrollment_Date, 
e.C_date AS Completion_Date, c.Cost AS Price, e.Conf_Code AS Confirmation_Code, 
(SELECT SUM(c.Cost) 
 FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
	INNER JOIN Student s ON e.StudentID = s.StudentID
	WHERE s.StudentId = ?) AS Total_Spent
    
FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
	INNER JOIN Student s ON e.StudentID = s.StudentID
WHERE s.StudentID = ?
ORDER BY c.Name

/*TEST CASE:
SELECT c.Name AS Course_Name, e.Date AS Enrollment_Date, 
e.C_date AS Completion_Date, c.Cost AS Price, e.Conf_Code AS Confirmation_Code, 
(SELECT SUM(c.Cost) 
 FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
	INNER JOIN Student s ON e.StudentID = s.StudentID
	WHERE s.StudentId = 1) AS Total_Spent
    
FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
	INNER JOIN Student s ON e.StudentID = s.StudentID
WHERE s.StudentID = 1
ORDER BY c.Name
*/




