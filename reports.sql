/*-------------------------------------------------------
	REPORT 1:
	Find Faculty members who are Associate Professors and 
	are responsible for creating more than one course

-------------------------------------------------------*/

/* 
COMPLEXITY: 7 POINTS
	> 3 TABLES JOINED IN 1ST SUBQUERY = 1 POINT 
	2 SUBQUERIES = 1 POINTS
	QUERY COMPROMSIING INTERESCT = 1 POINT
		Note: No intersect in mysql so used AND
	GROUPING IN 1ST SUBQUERY = 1 POINT
	ORDERING FIELDS = 1 POINT
	WHERE/HAVING conditions = 1 POINT
	STRONG MOTIVIATION = 1 POINT
		Find faculty who are associate professors who could be prompoted by viewing their work efforts
		in this case being responsible for the number of classes created 
*/

SELECT s.F_Name AS First_Name, s.L_Name AS Last_Name
FROM Student s 
WHERE s.StudentID IN
(	
    SELECT f.StudentID
    FROM Course c INNER JOIN F_Create fc ON c.CourseID = fc.CourseID
    	INNER JOIN Faculty f ON fc.FacultyID = f.StudentID
    GROUP BY f.StudentID
    HAVING COUNT(c.CourseID) > 1
)

AND 

s.StudentID IN
(

	SELECT f.StudentID
	FROM Faculty f
	WHERE f.Title LIKE "Associate Professor"
)

ORDER BY s.F_Name, s.L_Name



/*-------------------------------------------------------
	REPORT 2: NEEDS USER INPUT
	Find Students in USER INPUTED COURSE NAME that have 
	an average over 80% in quiz scores
-------------------------------------------------------*/

/* 
COMPLEXITY: 8 POINTS
	> 3 TABLES JOINED IN 1ST SUBQUERY = 1 POINT 
	1 SUBQUERY = 1 POINTS
	AGGREGATE FUNCTION = 1 POINT
	GROUPING  = 1 POINT
	ORDERING FIELDS = 1 POINT
	WHERE/HAVING 2 CONDITIONS = 1 POINT
	NON-AGGREGATE FUNCTION IN SELECT = 1 POINT
	STRONG MOTIVIATION = 1 POINT
		In certain courses, having a quiz average over 80 percent
		will automatically give you 100 on the final so finding which students 
		who have recieved an average score above 80
		on course materials of type quiz is important to help create
		the list of students exempt
*/

SELECT s.F_Name AS First_Name, s.L_Name AS Last_Name, ROUND(AVG(cc.Score),2) AS Average_Score
FROM Student s INNER JOIN CM_Complete cc ON s.StudentID = cc.StudentID
	INNER JOIN C_Material cm ON cc.CMID = cm.CMID
	INNER JOIN Course c ON cm.CourseID = c.CourseID
WHERE cm.CMID IN 
(	SELECT cm.CMID
	FROM Student s INNER JOIN CM_Complete cc ON s.StudentID = 	cc.StudentID
	INNER JOIN C_Material cm ON cc.CMID = cm.CMID
	INNER JOIN Quiz q ON q.CMID = cm.CMID
	WHERE cm.CMID = q.CMID) AND c.Name = ?
GROUP BY s.StudentID
HAVING (AVG(cc.Score) > 80)
ORDER BY s.L_Name, s.F_Name



/*-------------------------------------------------------
	REPORT 3:
	Get student full names that got below a 70 in a quiz
	grade. Along with student name, list professors 
	full name along with the corresponding course
	and all topics associated with a course including 
	secondary topics
-------------------------------------------------------*/

/* 
COMPLEXITY: 7 POINTS
	> 3 TABLES JOINED = 1 POINT 
	3 SUBQUERIES = 2 POINTS
	UERY COMPROMSIING INTERESCT = 1 POINT
		Note: No intersect in mysql so used AND
	WHERE/HAVING = 1 POINT
	ORDERING FIELDS = 1 POINT
	STRONG MOTIVIATION = 1 POINT
		The adminstration needs to be worried when students are getting below a certain
		grade in quiz grades that test their knowledge on course topics. So associating the 
		name of the student and the name of the professor along with the topics
		necessary to get higher quiz grades. Right now, is a small database so all students
		who get lower than a certain grade are flagged, however it could be more valubale
		later on to only flag students in courses in which a signficant number of students
		are getting low grades so that the adminstration and professor can take the 
		necessary actions to further develop the course topics
*/

SELECT DISTINCT s.F_Name AS Student_First_Name, s.L_Name AS Student_Last_Name, s1.F_Name AS Faculty_First_Name, s1.L_Name AS Faculty_Last_Name,
c.Name Course_Name, c.Pri_Topic Primary_Topic, st.Topic AS Secondary_Topics
FROM Course c INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
	INNER JOIN F_Create fc ON c.CourseID = fc.CourseID
	INNER JOIN Faculty f ON fc.FacultyID = f.StudentID
	INNER JOIN Student s1 ON f.StudentID = s1.StudentID
	INNER JOIN Enroll_in e ON c.CourseID = c.CourseID
	INNER JOIN Student s ON e.StudentID = s.StudentID

WHERE c.CourseID 

IN 
(
	SELECT  c.CourseID
	FROM Course c INNER JOIN C_Material cm ON c.CourseID = cm.CourseID
		INNER JOIN Quiz q ON cm.CMID = q.CMID
	WHERE cm.CMID = q.CMID
)

AND

c.CourseID IN 
(
	SELECT c.CourseID 
	FROM Course c INNER JOIN C_Material cm ON c.CourseID = cm.CourseID
		INNER JOIN CM_Complete cc ON cm.CMID = cc.CMID
	WHERE cc.Score < 70
)

AND 

s.StudentID IN
(
	SELECT s.StudentID
	FROM Student s INNER JOIN CM_Complete cc ON s.StudentID = cc.StudentID
		INNER JOIN Quiz q ON cc.CMID = q.CMID
	WHERE cc.CMID = q.CMID AND cc.Score < 70
)

ORDER BY c.Name, s1.F_Name, s1.L_Name





/*-------------------------------------------------------
	REPORT 4: NEEDS USER INPUT
	Get a user inputted students incomplete materials 
	that s/he included in playlists they created. 
	List the playlist id along with the course material 
	name and the number of unique incomplete tasks.
-------------------------------------------------------*/

/* 
COMPLEXITY: 7 POINTS
	> 3 TABLES JOINED = 1 POINT 
	3 SUBQUERIES = 2 POINTS
	QUERY COMPROMSIING INTERESCT = 1 POINT
		Note: No intersect in mysql so used AND
	AGGREGATE FUNCTION = 1 POINT
	ORDERING FIELDS = 1 POINT
	STRONG MOTIVIATION = 1 POINT
		Students have a list of course materials in a playlist, it can be 
		viewed as a to-do list. Students can be interested in only the 
		materials that are incomplete so having a list of the materials
		of course materials with their corresponding playlist to give 
		the student a sense of the required tasks, also shows the numbers
		of unique incomplete materials just in case a user has the same
		item in multiple playlists
*/

SELECT DISTINCT p.PID, cm.Name, c.Name, 
(SELECT COUNT(cm.CMID)
		FROM C_Material cm INNER JOIN Course c ON cm.CourseID = c.CourseID
			INNER JOIN CM_Complete cc ON cm.CMID = cc.CMID AND cc.CourseID = c.CourseID
    		INNER JOIN Student s ON s.StudentID = cc.StudentID
		WHERE cc.cFlag = 0 AND s.StudentID = ?)  AS Num_of_Incomplete_Materials
FROM Playlist p INNER JOIN C_Material cm ON p.CMID = cm.CMID
	INNER JOIN Course c ON cm.CourseID = c.CourseID
	INNER JOIN CM_Complete cc ON cm.CMID = cc.CMID AND cc.CourseID = c.CourseID
WHERE cc.CMID IN 
	(

		SELECT cm.CMID
		FROM C_Material cm INNER JOIN Course c ON cm.CourseID = c.CourseID
			INNER JOIN CM_Complete cc ON cm.CMID = cc.CMID AND cc.CourseID = c.CourseID
    		INNER JOIN Student s ON s.StudentID = cc.StudentID
		WHERE cc.cFlag = 0 
	)

	AND 

	cc.CMID IN 
	(
		SELECT cm.CMID
		FROM C_Material cm INNER JOIN Course c ON cm.CourseID = c.CourseID
			INNER JOIN CM_Complete cc ON cm.CMID = cc.CMID AND cc.CourseID = c.CourseID
    		INNER JOIN Student s ON s.StudentID = cc.StudentID
    	WHERE s.StudentID = ?
    )

ORDER BY p.PID, cm.CMID



/*-------------------------------------------------------
	REPORT 5: NEEDS USER INPUT
	Produce a list of course material questions
	related to the user inputted course along with
	faculty first and last name who answered it and 
	the answer it self. Show the number of likes of
	each question and order them by highest number
	of likes

-------------------------------------------------------*/

/* 
COMPLEXITY: 6 POINTS
	> 3 TABLES JOINED = 1 POINT 
	2 SUBQUERIES = 1 POINT
	AGGREGATE FUNCTION = 1 POINT
	GROUPING = 1 POINT
	ORDERING FIELDS = 1 POINT
	STRONG MOTIVIATION = 1 POINT
		Based on the User selected course name, all related questions to the
		course materials are shown with their respective answers, so the user
		is able to see if his/her doubts have been addressed before submitting
		a new question.
*/

SELECT s.F_Name, s.L_Name, cq.Context, j.Answer, COUNT(sl.StudentID) AS Num_of_Likes
FROM Student s INNER JOIN Faculty f ON s.StudentID = f.StudentID
	INNER JOIN Judge j ON f.StudentID = j.F_ID
	INNER JOIN C_Question cq ON j.CQID = cq.CQID AND j.CourseID = cq.CourseID
	INNER JOIN s_like sl ON cq.CQID = sl.CQID AND cq.CourseID= sl.CourseID
	INNER JOIN Student s1 ON sl.StudentID = s1.StudentID
WHERE j.CQID IN (

SELECT j.CQID 
FROM Judge j INNER JOIN C_Question cq ON j.CQID = cq.CQID
WHERE cq.CQID IN (

SELECT cq.CQID
FROM C_Question cq INNER JOIN Course c ON cq.CourseID = c.CourseID
WHERE c.CourseID = ? )
)
GROUP BY cq.CQID, cq.CourseID
ORDER BY COUNT(sl.StudentID) DESC, cq.CQID



