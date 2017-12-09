<!-- report 2 -->
<html>
    <head>
        <title>B Grade</title>
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
       <h3 class="content-head">Report Task 2:</h3>
   <h3>NEEDS USER INPUT Find Students in USER INPUTED COURSE NAME that have an average over 80% in quiz scores. Test case: input "CourseName1"</h3>


    <!--query for 2nd report-->

        <div class="sql-query">
        <p>SQL command: <br>
    SELECT s.F_Name AS First_Name, s.L_Name AS Last_Name, ROUND(AVG(cc.Score),2) AS Average_Score<br>
    FROM Student s INNER JOIN CM_Complete cc ON s.StudentID = cc.StudentID<br>
     &nbsp;&nbsp;&nbsp;&nbsp;INNER JOIN C_Material cm ON cc.CMID = cm.CMID<br>
     &nbsp;&nbsp;&nbsp;&nbsp;INNER JOIN Course c ON cm.CourseID = c.CourseID<br>
    WHERE cm.CMID IN <br>
    (   SELECT cm.CMID<br>
     &nbsp;&nbsp;&nbsp;&nbsp;FROM Student s INNER JOIN CM_Complete cc ON s.StudentID =   cc.StudentID<br>
     &nbsp;&nbsp;&nbsp;&nbsp;INNER JOIN C_Material cm ON cc.CMID = cm.CMID<br>
     &nbsp;&nbsp;&nbsp;&nbsp;INNER JOIN Quiz q ON q.CMID = cm.CMID<br>
     &nbsp;&nbsp;&nbsp;&nbsp;WHERE cm.CMID = q.CMID) AND c.Name = ?<br>
    GROUP BY s.StudentID<br>
    HAVING (AVG(cc.Score) > 80)<br>
    ORDER BY s.L_Name, s.F_Name<br><br>
        </p>
        </div>

        <form class="pure-form" method = "POST" action = "ReportTask2.php">
            <input placeholder="Course Name" type="text" name ="CourseName" required>
            <input type="submit" class="pure-button" name= "report_task2_btn" value = "Search">
        </form>
<!-- connect to db -->
            <?php
        session_start();
        $servername = "localhost";

        $username = "root";
        $password = "";
        $dbname = "Trainly";

        $conn = mysqli_connect($servername, $username, $password, $dbname);

        if (isset($_POST['report_task2_btn']))
        {
            $CourseName = mysql_real_escape_string($_POST['CourseName']);

//query db 
            $sql_reporttask2 = 
            "SELECT s.F_Name AS First_Name, s.L_Name AS Last_Name, ROUND(AVG(cc.Score),2) AS Average_Score
                FROM Student s INNER JOIN CM_Complete cc ON s.StudentID = cc.StudentID
                INNER JOIN C_Material cm ON cc.CMID = cm.CMID
                INNER JOIN Course c ON cm.CourseID = c.CourseID
            WHERE cm.CMID IN 
            (   SELECT cm.CMID
            FROM Student s INNER JOIN CM_Complete cc ON s.StudentID =   cc.StudentID
            INNER JOIN C_Material cm ON cc.CMID = cm.CMID
            INNER JOIN Quiz q ON q.CMID = cm.CMID
            WHERE cm.CMID = q.CMID) AND c.Name = '$CourseName'
            GROUP BY s.StudentID
            HAVING (AVG(cc.Score) > 80)
            ORDER BY s.L_Name, s.F_Name";
// get results

            $result= mysqli_query($conn, $sql_reporttask2);
            #$row = mysqli_fetch_assoc($result);
            echo "<br><table class='pure-table'> 
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Average Score</th>
                </tr>
            <thead>
            <tbody>";
//             display results
            while($taskresult_row = mysqli_fetch_assoc($result))
            {
                $First_Name = $taskresult_row['First_Name'];        
                $Last_Name = $taskresult_row['Last_Name'];
                $Average_Score = $taskresult_row['Average_Score'];
                echo "<tr>     <td>".$First_Name."</td>
                                <td>".$Last_Name."</td>
                                <td>".$Average_Score."</td>
                    </tr>";
            }
            echo "</tbody>
                  </table>";
        }

        echo "<br><a href=\"./ReportTask3.php\">Link to Report Task 3</a>";

    ?>
        </div>
        </body>
</html>




