<!-- report task 3 -->
<html>
    <head>
        <title>Quizzes</title>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">
      <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-min.css">
      <link rel="stylesheet" type="text/css" href="home.css">
    </head>
    <body> 
    <div class="header">
        <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
            <a class="pure-menu-heading" href="index.php">Trainly</a>
            
            <ul class="pure-menu-list">
                <li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
                <a href="#" id="menuLink1" class="pure-menu-link">Reports</a>
                <ul class="pure-menu-children">
                    <li class="pure-menu-item"><a href="ReportTask1.php" class="pure-menu-link">Faculty</a></li>
                    <li class="pure-menu-item"><a href="ReportTask2.php" class="pure-menu-link">B Grade</a></li>
                    <li class="pure-menu-item"><a href="ReportTask3.php" class="pure-menu-link">Quizzes</a></li>
                    <li class="pure-menu-item"><a href="ReportTask4.php" class="pure-menu-link">Incomplete</a></li>
                    <li class="pure-menu-item"><a href="ReportTask5.php" class="pure-menu-link">Questions</a></li>
                </ul>
                </li>
            </ul>
        </div>
    </div>       
   <div class="container-padding bottom-padding">
       <h3 class="content-head">Report Task 3:</h3>
   <h3>Get student full names that got below a 70 in a quiz
    grade. Along <br>with student name, list professors 
    full name along with the corresponding <br>course
    and all topics associated with a course including 
    secondary topics</h3> 


<!--query to get results to 3rd report-->

    <div class="sql-query">
    <h4>Motivation:</h4>
    <p>The adminstration needs to be worried when students are getting below a certain
        grade in quiz grades that test their knowledge on course topics. So associating the 
        name of the student and the name of the professor along with the topics
        necessary to get higher quiz grades. Right now, since it is a small database so all students
        who get lower than a certain grade are flagged, however it could be more valubale
        later on to only flag students in courses in which a signficant number of students
        are getting low grades so that the adminstration and professor can take the 
        necessary actions to further develop the course topics.</p>
    </div>

    <form method = "POST" action = "ReportTask3.php">
        <input type="submit" class="pure-button" name= "report_task3_btn" value = "Click to Run">
    </form>

<!-- connect to DB -->
<?php
    session_start();
    $servername = "localhost";

    $username = "root";
    $password = "";
    $dbname = "Trainly";

    $conn = mysqli_connect($servername, $username, $password, $dbname);
// query db
    if (isset($_POST['report_task3_btn']))
    {
        
        $sql_reporttask3 = "SELECT DISTINCT s.F_Name AS Student_First_Name, s.L_Name AS Student_Last_Name, s1.F_Name AS Faculty_First_Name, s1.L_Name AS Faculty_Last_Name,
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
            ORDER BY c.Name, s1.F_Name, s1.L_Name";

// display results in table on DOM

        #$sql_reporttask1 = "SELECT F_Name as First_Name, L_Name as Last_Name FROM student";

        $result= mysqli_query($conn, $sql_reporttask3);
        #$row = mysqli_fetch_assoc($result);
        echo "<table class='pure-table'>  
        <thead>
        <tr>
                <th>Student First Name</th>
                <th>Student Last Name</th>  
                <th>Faculty First Name</th>
                <th>Faculty Last Name</th>
                <th>Course Name</th>
                <th>Primary Topic</th>
                <th>Secondary Topic</th>
        </tr>
        </thead>
        <tbody>";
        while($taskresult_row = mysqli_fetch_assoc($result))
        {
            $Student_First_Name = $taskresult_row['Student_First_Name'];        
            $Student_Last_Name = $taskresult_row['Student_Last_Name'];
            $Faculty_First_Name = $taskresult_row['Faculty_First_Name'];
            $Faculty_Last_Name = $taskresult_row['Faculty_Last_Name'];
            $Course_Name = $taskresult_row['Course_Name'];
            $Primary_Topic = $taskresult_row['Primary_Topic'];
            $Secondary_Topics = $taskresult_row['Secondary_Topics'];


            echo "<tr>     <td>".$Student_First_Name."</td>
                            <td>".$Student_Last_Name."</td>
                             <td>".$Faculty_First_Name."</td>
                              <td>".$Faculty_Last_Name."</td>
                               <td>".$Course_Name."</td>
                                <td>".$Primary_Topic."</td>
                                 <td>".$Secondary_Topics."</td>
                </tr>";
        }
        echo "</tbody>
              </table>";
    }
    echo "<a href=\"./ReportTask4.php\">Link to Report Task 4</a><br>";

?>
</div>
    </body>
</html>





