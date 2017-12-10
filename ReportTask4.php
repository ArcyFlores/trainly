<!-- report 4 -->
<html>
    <head>
        <title>Incomplete</title>
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
       <h3 class="content-head">Report Task 4:</h3>
   <h3>Get a user inputted students incomplete materials that s/he included in playlists they created. List the playlist id along with the course material name and the number of unique incomplete tasks.</h3>

<!--sql code that gets result for report 4-->

    <div class="sql-query">
    <h4>Motivation:</h4>
    <p>Students have a list of course materials in a playlist, it can be 
        viewed as a to-do list. Students can be interested in only the 
        materials that are incomplete so having a list of the materials
        of course materials with their corresponding playlist to give 
        the student a sense of the required tasks, also shows the numbers
        of unique incomplete materials just in case a user has the same
        item in multiple playlists.</p>
    </div>

    <form class="pure-form" method = "POST" action = "ReportTask4.php">
        <input placeholder="Student ID" type="text" name ="StudentID" required>
        <input type="submit" class="pure-button" name= "report_task4_btn" value = "Search">
    </form>
       
<!-- connect to db -->
<?php
    session_start();
    $servername = "localhost";

    $username = "root";
    $password = "";
    $dbname = "Trainly";

    $conn = mysqli_connect($servername, $username, $password, $dbname);

    if (isset($_POST['report_task4_btn']))
    {
        $StudentID = mysql_real_escape_string($_POST['StudentID']);

// query db
        $sql_reporttask4 = 
        "SELECT DISTINCT p.PID, cm.Name, c.Name AS Name1, 
        (SELECT COUNT(cm.CMID)
        FROM C_Material cm INNER JOIN Course c ON cm.CourseID = c.CourseID
            INNER JOIN CM_Complete cc ON cm.CMID = cc.CMID AND cc.CourseID = c.CourseID
            INNER JOIN Student s ON s.StudentID = cc.StudentID
        WHERE cc.cFlag = 0 AND s.StudentID = '$StudentID')  AS Num_of_Incomplete_Materials
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
        WHERE s.StudentID = $StudentID
    )
    ORDER BY p.PID, cm.CMID";

// get results and display in a table
        $result= mysqli_query($conn, $sql_reporttask4);
        #$row = mysqli_fetch_assoc($result);
        echo "<table class='pure-table'> 
        <thead>
            <tr>
            <th>PID</th>
            <th>Course Material Name</th>
            <th>Course Name</th>
            <th>Number of Incomplete Material</th>
            </tr>
        </thead>
        <tbody>";
        while($taskresult_row = mysqli_fetch_assoc($result))
        {
            $PID = $taskresult_row['PID'];        
            $Course_Material_Name = $taskresult_row['Name'];
            $Course_Name = $taskresult_row['Name1'];
            $Number_of_Incomplete_Material = $taskresult_row['Num_of_Incomplete_Materials'];

            echo "<tr>      <td>".$PID."</td>
                            <td>".$Course_Material_Name."</td>
                            <td>".$Course_Name."</td>
                            <td>".$Number_of_Incomplete_Material."</td>
                </tr>";
        }
        echo "</tbody>
              </table>";
    }

    echo "<br><a href=\"./ReportTask5.php\">Link to Report Task 5</a>";

?>
</div>
    </body>
</html>




